# GitHub Launch Kit

Этот документ фиксирует практическую конфигурацию запуска `tech4oceans/fund-ocean` как публичного GitHub hub.

Статус на `2026-05-12`:

- repository admin access подтвержден через project-local `ocean-gh`;
- `Issues` включены;
- `Discussions` включены;
- repository description уже задан;
- topics уже заданы;
- `homepage` пока пустой;
- репозиторий пока `private`;
- 10 стартовых issues уже созданы;
- опубликованы стартовые discussions в `Announcements` и `Ideas`.

## Repository About

### Repository description

`Open project hub for ocean, climate, biodiversity, marine data, education, AI, and partnerships.`

### Topics

- `ocean`
- `climate`
- `biodiversity`
- `marine-data`
- `open-science`
- `education`
- `ai-for-good`
- `research`
- `nonprofit`
- `ocean-literacy`

### Homepage options

Выбрать одну официальную точку:

- GitHub Pages, если `public/` станет первой витриной;
- официальный сайт фонда, когда он утвержден;
- временно оставить пустым, если пока нет безопасного public URL.

Не указывать временные или полуготовые внешние ссылки, если они не утверждены.

## Repository Story

Публичный маршрут должен быть одинаковым в трех местах:

1. `README.md` объясняет, что это и куда идти.
2. `public/partners.md` ведет институционального посетителя по безопасному partner entry.
3. `About` и profile copy повторяют ту же формулу без расхождений.

## Discussions Setup

Уже доступны стандартные категории:

- `Announcements`
- `General`
- `Ideas`
- `Polls`
- `Q&A`
- `Show and tell`

Рекомендуемая целевая схема:

- использовать `Announcements`, `Ideas`, `Q&A` сразу;
- либо переименовать `General` в `Partnerships`, либо создать отдельную category `Partnerships`, чтобы заработал `/.github/DISCUSSION_TEMPLATE/partnerships.yml`.

Практический статус:

- `Welcome to Ocean Fund on GitHub` уже создан в `Announcements`;
- `Open idea intake: where contributors can help first` уже создан в `Ideas`;
- partner intake по-хорошему нужно довести через category `Partnerships`, а не оставлять навсегда в `General`.

## Visibility Decision

Перед переводом репозитория в public нужно подтвердить:

- README и docs не содержат private contacts;
- в `public/` нет внутренних заготовок;
- issues и discussions не раскрывают лишнюю внутреннюю фактуру;
- placeholders явно помечены;
- лицензия и contact policy хотя бы временно определены.

## Social Preview

Нужен отдельный visual asset `1280x640` с:

- названием `Ocean Fund`;
- короткой миссией;
- 2-4 словами вроде `Ocean`, `Climate`, `Data`, `Partnerships`.

Проверить, есть ли утвержденный PNG-экспорт из `assets/brand/github-social-preview.svg`.

## Pinned Repositories

Если профиль `tech4oceans` используется как публичная точка входа, рекомендованный порядок такой:

1. `fund-ocean`
2. public website / Pages repo
3. data or notebooks repo
4. presentations or media kit repo
5. governance or docs repo, если он будет вынесен отдельно

## Safe Publication Rule

Все launch-элементы должны проходить один фильтр:

- не публиковать персональные данные;
- не публиковать токены и доступы;
- не публиковать финансовые реквизиты;
- не публиковать неподтвержденные партнерства;
- не выдавать внутренние рабочие гипотезы за официальные факты.
