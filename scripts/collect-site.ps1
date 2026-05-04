param(
  [string]$Site = "https://tech4oceans.ru",
  [string]$OutDir = "data/site"
)

$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

function Clean-Text {
  param([string]$Text)
  if ($null -eq $Text) { return "" }
  $t = $Text -replace "<script[\s\S]*?</script>", " "
  $t = $t -replace "<style[\s\S]*?</style>", " "
  $t = $t -replace "<[^>]+>", " "
  $t = $t -replace "&nbsp;", " " -replace "&amp;", "&" -replace "&#8212;", "-" -replace "&#171;", '"' -replace "&#187;", '"'
  return (($t -replace "\s+", " ").Trim())
}

function Shorten {
  param([string]$Text, [int]$Length = 260)
  if ($Text.Length -le $Length) { return $Text }
  return $Text.Substring(0, $Length) + "..."
}

$posts = Invoke-RestMethod -Uri "$Site/wp-json/wp/v2/posts?per_page=100&_fields=slug,title,date,modified,excerpt,link" -TimeoutSec 45
$pages = Invoke-RestMethod -Uri "$Site/wp-json/wp/v2/pages?per_page=100&_fields=slug,title,date,modified,content,link" -TimeoutSec 45

$postIndex = @($posts | ForEach-Object {
  [pscustomobject]@{
    date = $_.date
    modified = $_.modified
    title = Clean-Text $_.title.rendered
    slug = $_.slug
    link = $_.link
    excerpt = Shorten (Clean-Text $_.excerpt.rendered)
  }
})

$pageIndex = @($pages | ForEach-Object {
  $content = Clean-Text $_.content.rendered
  [pscustomobject]@{
    date = $_.date
    modified = $_.modified
    title = Clean-Text $_.title.rendered
    slug = $_.slug
    link = $_.link
    snippet = Shorten $content 420
  }
})

[pscustomobject]@{
  generatedAt = (Get-Date).ToString("s")
  site = $Site
  postsCount = @($postIndex).Count
  pagesCount = @($pageIndex).Count
  posts = $postIndex
  pages = $pageIndex
} | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath "$OutDir/wp-index.json" -Encoding UTF8

Write-Host "Generated site index in $OutDir/wp-index.json"
