# GitHub Admin Checklist

Короткий список того, что нужно доделать в GitHub-интерфейсе после того, как репозиторные файлы уже лежат в `tech4oceans/fund-ocean`.

## Что можно включить на уровне репозитория

- Заполнить `About`:
  - description: `Open project hub for ocean, climate, biodiversity, marine data, education, AI, and partnerships.`
  - website: утвержденный публичный URL или GitHub Pages
  - topics: `ocean`, `climate`, `biodiversity`, `marine-data`, `open-science`, `education`, `ai-for-good`, `research`, `nonprofit`, `ocean-literacy`
- Загрузить social preview image из `assets/brand/github-social-preview.svg` или утвержденного PNG `1280x640`.
- Проверить, что `Issues` включены.
- Включить `Discussions`, если нужен открытый вход для идей, вопросов и партнерских обсуждений.

## Категории Discussions

Формы обсуждений уже подготовлены в `/.github/DISCUSSION_TEMPLATE/`, но они сработают только если категории в GitHub названы так, чтобы их slug совпал с именем файла.

Рекомендуемый набор:

- `Announcements` -> `announcements.yml`
- `Ideas` -> `ideas.yml`
- `Q&A` -> `q-a.yml`
- `Partnerships` -> `partnerships.yml`

Если вы выберете другие названия категорий, переименуйте файлы форм под итоговый slug категории.

## Стартовые публичные действия

- Создать 5-10 starter issues на базе уже подготовленных шаблонов.
- Закрепить 1-2 discussions сверху:
  - короткое welcome / orientation сообщение;
  - публичный discussion для partnership intake или open ideas.
- Проверить, что ссылки из issue chooser открываются корректно после пуша в `main`.

## Что требует прав владельца или админа организации

- Заполнить профиль организации `tech4oceans` или официальной организации фонда:
  - avatar;
  - organization bio;
  - location;
  - website;
  - social links.
- Настроить `Pinned repositories`.
- Включить `Organization Discussions`, если нужен общий вход на уровне всей организации, а не одного репозитория.
- Проверить настройки видимости организации и публичности профиля.
- При необходимости создать отдельный `.github` repository организации для общих community health defaults.

## Рекомендуемый порядок

1. Сначала допушить репозиторные файлы из этого репозитория.
2. Потом включить `Discussions` и создать категории с точными названиями.
3. Затем заполнить `About`, preview и topics.
4. После этого закрепить репозиторий в профиле и оформить сам профиль организации.
