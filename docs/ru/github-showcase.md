# GitHub Showcase / Оформление GitHub

![github-showcase preview](../../assets/docs-previews/ru/github-showcase.svg)

Этот документ нужен, чтобы Ocean Fund выглядел на GitHub как живая, понятная и серьезная инициатива, а не как набор внутренних черновиков.

## Что есть что

### 1. GitHub profile

Это страница пользователя или организации. Именно здесь люди сначала оценивают, кто вы, чем занимаетесь и стоит ли читать дальше.

Нужно заполнить:

- имя: `Ocean Fund` или утвержденное официальное название;
- короткое описание в одном предложении;
- avatar или logo;
- location;
- website;
- social links;
- pinned repositories.

### 2. Главная страница репозитория

Это `README.md` в корне проекта. Он должен отвечать на четыре вопроса:

- что это;
- зачем это существует;
- что уже есть;
- куда нажать дальше.

### 3. GitHub Pages или внешняя витрина

Это отдельная публичная страница для тех, кому уже тесно в обычном README. Для Ocean Fund стартовая витрина должна жить в `public/` или на отдельном внешнем сайте.

### 4. Обязательный публичный слой

Для Ocean Fund есть два обязательных элемента, без которых публичная витрина считается незавершенной:

- partner-facing entry page;
- approved public mission copy.

Внутри репозитория это означает, что внешняя навигация должна вести как минимум на:

- [public/partners.md](../public/partners.md)
- [public/partner-one-pager.md](../public/partner-one-pager.md)
- [public/mission-copy.md](../public/mission-copy.md)

Для event-facing работы также желательно держать рядом:

- [public/conference-exhibition-one-pager.md](../public/conference-exhibition-one-pager.md)
- [public/event-application-pack.md](../public/event-application-pack.md)

## Минимум, который стоит заполнить в GitHub

### Профиль

- avatar с читаемым знаком;
- краткий bio на русском или английском;
- ссылка на основной репозиторий;
- 3-6 закрепленных репозиториев;
- README профиля с миссией, направлениями и способами участия.

Шаблон профиля: [templates/github-profile-readme.md](../templates/github-profile-readme.md)

### Репозиторий

- короткое описание репозитория;
- website URL;
- topics;
- social preview image;
- включенные Issues и Discussions;
- понятный README;
- partner-facing витрина;
- partner one-pager;
- conference / exhibition one-pager;
- event application pack;
- public mission copy;
- первые открытые issues.

## Рекомендуемое описание репозитория

Вариант на русском:

> Открытая база фонда об океане, климате, биоразнообразии, морских данных, образовании и международных партнерствах.

Вариант на английском:

> Open project hub for ocean, climate, biodiversity, marine data, education, AI, and partnerships.

## Рекомендуемые topics

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

## Что закрепить в профиле

Если профиль личный:

- основной репозиторий фонда;
- витрина или сайт проекта;
- репозиторий с данными или notebooks;
- репозиторий с презентациями или public materials.

Если профиль организации:

- основной публичный hub;
- datasets или data registry;
- website или pages;
- research или notebooks;
- outreach или media kit;
- governance или documentation, если вынесено отдельно.

## Что положить в первые публичные issues

- Research: собрать 10 приоритетных тем по океану и климату.
- Data: оформить 5 проверенных открытых источников данных.
- Outreach: подготовить короткое письмо для университетов и музеев.
- Brand: утвердить англоязычное написание названия и описание.
- Website: привести `public/` к единой публичной версии.
- Governance: определить публичные контакты и лицензионную стратегию.

См. также [docs/60-github-issues.md](60-github-issues.md).

## Social Preview

Для GitHub полезно подготовить отдельную обложку размером `1280x640`.

Что на ней должно быть:

- название проекта;
- короткая формула миссии;
- 2-4 ключевых слова, например: `Ocean`, `Climate`, `Data`, `Partnerships`.

Черновой исходник: [assets/brand/github-social-preview.svg](../assets/brand/github-social-preview.svg)

## Порядок запуска витрины

1. Опубликовать репозиторий с текущим `README.md`.
2. Подтвердить обязательный публичный слой: `public/partners.md` и `public/mission-copy.md`.
3. Заполнить description, website, topics и social preview в настройках репозитория.
4. Включить Discussions, если нужны публичные идеи и обсуждения.
5. Создать 5-10 стартовых issues, чтобы посетители сразу видели движение.
6. Подготовить профильный README для пользователя или организации.
7. Закрепить репозиторий в профиле.
8. При необходимости подключить GitHub Pages или отдельный сайт из `public/`.

## Хороший результат выглядит так

Человек открывает GitHub и сразу понимает:

- это не случайный черновик, а оформленный open project hub;
- проект находится в ранней стадии, но честно показывает структуру и план;
- здесь уже можно участвовать: исследовать, помогать с данными, переводами, партнерствами и материалами.
