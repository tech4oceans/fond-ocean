param(
  [string]$OutDir = "data/bitrix",
  [string]$DocsDir = "docs"
)

$ErrorActionPreference = "Stop"

$Base = $env:B24_WEBHOOK_URL
if ([string]::IsNullOrWhiteSpace($Base)) {
  throw "Set B24_WEBHOOK_URL before running this script."
}
if (-not $Base.EndsWith("/")) {
  $Base = "$Base/"
}

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
New-Item -ItemType Directory -Force -Path $DocsDir | Out-Null

function Invoke-B24 {
  param(
    [Parameter(Mandatory=$true)][string]$Method,
    [hashtable]$Body = @{}
  )
  $uri = "$Base$Method.json"
  Invoke-RestMethod -Method Post -Uri $uri -Body $Body -TimeoutSec 45
}

function Write-JsonFile {
  param([string]$Path, $Data)
  $Data | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $Path -Encoding UTF8
}

function Clean-Text {
  param([string]$Text)
  if ($null -eq $Text) { return "" }
  return (($Text -replace "<[^>]+>", " " -replace "\s+", " ").Trim())
}

$profile = (Invoke-B24 "profile").result
$group = (Invoke-B24 "sonet_group.get" @{ "FILTER[ID]" = "62" }).result
$membersRaw = (Invoke-B24 "sonet_group.user.get" @{ "ID" = "62" }).result
$storage = (Invoke-B24 "disk.storage.getlist" @{
  "filter[ENTITY_TYPE]" = "group"
  "filter[ENTITY_ID]" = "62"
}).result

$rootChildren = @()
if (@($storage).Count -gt 0) {
  $rootChildren = (Invoke-B24 "disk.folder.getchildren" @{ "id" = @($storage)[0].ROOT_OBJECT_ID }).result
}

$foldersToIndex = @(
  @{ name = "УСТАВНЫЕ"; id = "40734" },
  @{ name = "ПИСЬМА"; id = "58502" },
  @{ name = "ИНДЕКСЫ"; id = "52636" },
  @{ name = "РЕЙТИНГИ"; id = "52732" },
  @{ name = "ПУБЛИКАЦИИ"; id = "48074" },
  @{ name = "ДВД"; id = "152050" },
  @{ name = "СЫН ДМИТРИЙ ДМИТРИЕНКО"; id = "138544" }
)

$folderIndex = @()
foreach ($folder in $foldersToIndex) {
  $items = (Invoke-B24 "disk.folder.getchildren" @{ "id" = $folder.id }).result
  foreach ($item in @($items)) {
    $folderIndex += [pscustomobject]@{
      folder = $folder.name
      id = $item.ID
      name = $item.NAME
      type = $item.TYPE
      size = $item.SIZE
      created = $item.CREATE_TIME
      updated = $item.UPDATE_TIME
      detailUrl = $item.DETAIL_URL
    }
  }
}

$tasksGroup = (Invoke-B24 "tasks.task.list" @{
  "filter[GROUP_ID]" = "62"
  "select[]" = @("ID","TITLE","STATUS","REAL_STATUS","RESPONSIBLE_ID","CREATED_BY","GROUP_ID","DEADLINE","CREATED_DATE","CHANGED_DATE","CLOSED_DATE")
  "order[ID]" = "DESC"
}).result.tasks

$terms = @("ОКЕАН","Океан","Ocean","tech4oceans","Дмитриенко")
$taskHits = @()
foreach ($term in $terms) {
  $hits = (Invoke-B24 "tasks.task.list" @{
    "filter[%TITLE]" = $term
    "select[]" = @("ID","TITLE","STATUS","REAL_STATUS","RESPONSIBLE_ID","CREATED_BY","GROUP_ID","DEADLINE","CREATED_DATE","CHANGED_DATE","CLOSED_DATE")
    "order[ID]" = "DESC"
  }).result.tasks
  foreach ($task in @($hits)) {
    $taskHits += [pscustomobject]@{
      term = $term
      id = $task.id
      title = Clean-Text $task.title
      status = $task.status
      groupId = $task.groupId
      deadline = $task.deadline
      created = $task.createdDate
      changed = $task.changedDate
      closed = $task.closedDate
      responsible = $task.responsible.name
    }
  }
}

$dialog = (Invoke-B24 "im.dialog.messages.get" @{
  "DIALOG_ID" = "chat878"
  "LIMIT" = "50"
}).result

$chatDigest = @()
foreach ($message in @($dialog.messages)) {
  $fileNames = @()
  if ($message.files) {
    foreach ($file in @($message.files)) {
      $fileNames += $file.name
    }
  }
  $chatDigest += [pscustomobject]@{
    id = $message.id
    date = $message.date
    authorId = $message.author_id
    textLength = (Clean-Text $message.text).Length
    filesCount = @($fileNames).Count
    files = $fileNames
  }
}

$summary = [pscustomobject]@{
  generatedAt = (Get-Date).ToString("s")
  profile = [pscustomobject]@{
    id = $profile.ID
    admin = $profile.ADMIN
    name = "$($profile.NAME) $($profile.LAST_NAME)"
    timezone = $profile.TIME_ZONE
  }
  oceanGroup = $group
  storage = $storage
  rootItemsCount = @($rootChildren).Count
  indexedFolderItemsCount = @($folderIndex).Count
  groupTasksCount = @($tasksGroup).Count
  searchTaskHitsCount = @($taskHits | Sort-Object id -Unique).Count
  chatDigestCount = @($chatDigest).Count
}

Write-JsonFile "$OutDir/summary.json" $summary
Write-JsonFile "$OutDir/ocean-group-root.json" @($rootChildren | Select-Object ID,NAME,TYPE,SIZE,CREATE_TIME,UPDATE_TIME,DETAIL_URL)
Write-JsonFile "$OutDir/ocean-folder-index.json" $folderIndex
Write-JsonFile "$OutDir/ocean-group-tasks.json" @($tasksGroup | Select-Object id,title,status,deadline,createdDate,changedDate,closedDate,@{n="responsible";e={$_.responsible.name}})
Write-JsonFile "$OutDir/ocean-task-search-hits.json" @($taskHits | Sort-Object id -Unique)
Write-JsonFile "$OutDir/ocean-chat-digest.json" $chatDigest

$md = @"
# Инвентаризация Bitrix24: Фонд Океан

Сгенерировано: $((Get-Date).ToString("yyyy-MM-dd HH:mm:ss zzz"))

## Рабочая группа

- ID: 62
- Название: ОКЕАН
- Создана: $(@($group)[0].DATE_CREATE)
- Последняя активность: $(@($group)[0].DATE_ACTIVITY)
- Участников: $(@($group)[0].NUMBER_OF_MEMBERS)
- Хранилище: $(@($storage)[0].NAME), root object $(@($storage)[0].ROOT_OBJECT_ID)

## Корень диска

Найдено объектов: $(@($rootChildren).Count)

Ключевые папки: УСТАВНЫЕ, ПИСЬМА, ИНДЕКСЫ, РЕЙТИНГИ, ПУБЛИКАЦИИ, АРКТИКА, АНТАРКТИКА, ПАТЭС, ПЛАВУЧКИ, ДВД.

## Задачи

В группе ОКЕАН найдено задач: $(@($tasksGroup).Count)

Отдельно найдены задачи по поисковым словам ОКЕАН/Ocean/tech4oceans/Дмитриенко: $(@($taskHits | Sort-Object id -Unique).Count)

## Чат

Сохранен только технический digest последних сообщений чата группы: дата, автор, длина текста, количество файлов и имена файлов. Текст сообщений, полная история и вложения не экспортируются.

## Файлы данных

- data/bitrix/summary.json
- data/bitrix/ocean-group-root.json
- data/bitrix/ocean-folder-index.json
- data/bitrix/ocean-group-tasks.json
- data/bitrix/ocean-task-search-hits.json
- data/bitrix/ocean-chat-digest.json
"@

$md | Set-Content -LiteralPath "$DocsDir/10-bitrix-inventory.md" -Encoding UTF8

Write-Host "Generated Bitrix Ocean inventory in $OutDir and $DocsDir/10-bitrix-inventory.md"
