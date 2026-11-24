# Шаблон робіт ХНУРЕ в LaTeX (ДСТУ 3008:2015)

Шаблон для оформлення звітів з лабораторних, практичних, курсових та кваліфікаційних робіт для студентів **ХНУРЕ** відповідно до стандартів **ДСТУ 3008:2015** (структура звіту) та **ДСТУ 8302:2015** (бібліографічні посилання).

---

## 📦 Встановлення залежностей

Шаблон оптимізований під компілятор **LuaLaTeX** з використанням шрифтів OpenType (`FreeSerif`).

### ⚡ Автоматичне встановлення

Для швидкого встановлення всіх залежностей скористайтеся скриптом [`instalation.sh`](instalation.sh), який автоматично визначає пакетний менеджер вашої ОС (`pacman`, `apt`, `dnf` або `winget` у Windows через Git Bash):

```sh
sh install.sh
```

Для повного видалення всіх встановлених залежностей скористайтеся скриптом [`remove.sh`](remove.sh):

```sh
sh uninstall.sh
```

Або оберіть ручну інструкцію для вашої операційної системи:

### Linux

#### 🔹 Arch Linux / Manjaro (`pacman`)

```bash
sudo pacman -S \
  texlive-basic \
  texlive-bin \
  texlive-binextra \
  texlive-latex \
  texlive-latexrecommended \
  texlive-latexextra \
  texlive-bibtexextra \
  texlive-luatex \
  texlive-langcyrillic \
  texlive-fontsrecommended \
  texlive-pictures \
  biber
```

#### 🔹 Debian / Ubuntu / Linux Mint (`apt`)

```bash
sudo apt update
sudo apt install -y \
  texlive-latex-base \
  texlive-latex-recommended \
  texlive-latex-extra \
  texlive-bibtex-extra \
  texlive-luatex \
  texlive-lang-cyrillic \
  texlive-fonts-recommended \
  biber \
  latexmk
```

#### 🔹 Fedora (`dnf`)

```bash
sudo dnf install -y \
  texlive-scheme-medium \
  texlive-collection-langcyrillic \
  texlive-biblatex \
  biber \
  latexmk
```

АБО

```bash
sudo dnf install -y \
  texlive-luatex \
  texlive-latex \
  texlive-extsizes \
  texlive-titlesec \
  texlive-caption \
  texlive-cleveref \
  texlive-biblatex \
  texlive-collection-langcyrillic \
  texlive-collection-fontsrecommended \
  biber \
  latexmk
```

### Windows

Для роботи на Windows доступні два популярні дистрибутиви:

**Варіант 1: MiKTeX (Найпростіший спосіб)**

1. Завантажте інсталятор з офіційного сайту [miktex.org](https://miktex.org/download) або через консоль `winget`:

```powershell
winget install MiKTeX.MiKTeX
```

2. Під час інсталяції для налаштування _«Install missing packages on-the-fly»_ обов'язково оберіть **«Yes»** — тоді MiKTeX сам завантажить будь-який відсутній пакунок при першій компіляції.
3. Для роботи `latexmk` у Windows також знадобиться інтерпретатор Perl:

```powershell
   winget install StrawberryPerl.StrawberryPerl
```

**Варіант 2: TeX Live для Windows**

Встановіть офіційний дистрибутив TeX Live через [онлайн-інсталятор TUG](https://www.tug.org/texlive/windows.html) або через термінал:

```powershell
winget install TUG.TeXLive
# або через Chocolatey:
choco install texlive
```

---

## 🚀 Покроковий посібник з налаштування та запуску

### Крок 1. Клонування або завантаження шаблону

```bash
git clone -b template git@github.com:NureKostiukDenis/latex-nure-template.git my-report
cd my-report
```

### Крок 2. Заповнення титульного аркуша

Відкрийте файл [`title.tex`](title.tex) та вкажіть свої дані:

```latex
\MakeTitlePage{
    MinistryName={Міністерство освіти і науки України},
    UniversityName={Харківський Національний Університет Радіоелектроніки},
    FacultyName={Факультет комп'ютерних наук},
    DepartmentName={Кафедра програмної інженерії},
    SicityOfWork={Харків},
    YearOfWork={2026},
    %%
    WorkTitle={Тема звіту або роботи},
    WorkType={Звіт з практичної роботи №1},
    Subject={з дисципліни "Назва дисципліни"},
    StudentName={Прізвище Ім'я По батькові},
    StudentSex={male},          % male — виконав, female — виконала
    StudentGroup={ІПЗ-26-3},
    StudentCourse={2},
    StudentSpeciality={121 "Інженерія програмного забезпечення"},
    %%
    SupervisorDegree={викладач},
    SupervisorDepartment={ПІ},
    SupervisorSex={male},       % male — перевірив, female — перевірила
    SupervisorName={Прізвище І. Б.}
}
```

### Крок 3. Наповнення документа

Структура звіту розбита на окремі файли:

- [`introduction.tex`](introduction.tex) — Вступ.
- [`body.tex`](body.tex) — Основний зміст, розділи (`\chapter`), підрозділи (`\section`, `\subsection`), рисунки та таблиці.
- [`conclusion.tex`](conclusion.tex) — Висновки за результатами роботи.
- [`bibliography.bib`](bibliography.bib) — База джерел у форматі BibTeX.

### Крок 4. Збірка документа

#### Варіант А: Через VS Code (Рекомендовано)

У проєкті вже створено конфігурацію [`.vscode/settings.json`](.vscode/settings.json) для розширення **LaTeX Workshop**:

1. Встановіть розширення **LaTeX Workshop** у VS Code.
2. Відкрийте файл [`main.tex`](main.tex).
3. Натисніть **`Ctrl+Alt+B`** (або збережіть файл). Розширення автоматично виконає ланцюжок `lualatex` + `bibtex` і згенерує `main.pdf`.

#### Варіант Б: Через термінал (`latexmk`)

Завдяки налаштованому файлу [`.latexmkrc`](.latexmkrc), збірка запускається однією командою:

```bash
latexmk main.tex
```

Для режиму безперервного оновлення при зміні файлів:

```bash
latexmk -pvc main.tex
```

Очищення тимчасових допоміжних файлів:

```bash
latexmk -c
```

---

## 📁 Структура проєкту

| Файл / Папка                           | Призначення                                           |
| :------------------------------------- | :---------------------------------------------------- |
| [`main.tex`](main.tex)                 | Головний вхідний файл (керує підключенням розділів)   |
| [`nure.cls`](nure.cls)                 | Клас документа з правилами форматування ДСТУ          |
| [`title.tex`](title.tex)               | Метадані та розмітка титульної сторінки               |
| [`introduction.tex`](introduction.tex) | Розділ «Вступ»                                        |
| [`body.tex`](body.tex)                 | Основна частина (розділи, підрозділи, графіки)        |
| [`conclusion.tex`](conclusion.tex)     | Розділ «Висновки»                                     |
| [`bibliography.tex`](bibliography.tex) | Виведення розділу «Перелік посилань»                  |
| [`bibliography.bib`](bibliography.bib) | Джерела у форматі BibTeX                              |
| `fonts/`                               | Шрифти OpenType FreeSerif (14pt Times-сумісний шрифт) |
| `imgs/`                                | Папка для графічних матеріалів (PNG, JPG, PDF)        |
| [`.latexmkrc`](.latexmkrc)             | Конфігурація збірки для `latexmk`                     |
| [`.vscode/`](.vscode/)                 | Налаштування рецептів складання для VS Code           |
| [`install.sh`](install.sh)             | Скрипт автоматичного встановлення залежностей         |
| [`uninstall.sh`](uninstall.sh)         | Скрипт автоматичного видалення залежностей            |

---

## 🗺️ Roadmap

- [ ] Розширений початковий шаблон: Додати до наявного шаблону `body.tex` більш детальний опис використання функцій LaTeX та спецефічних для ДСТУ особливостей.
- [x] Адаптація рушія LuaLaTeX та підтримка локальних векторних шрифтів FreeSerif (14pt).
- [x] Автоматизація збірки через `.latexmkrc` та рецепти для VS Code (LaTeX Workshop).
- [ ] Тестування на Windows: Повна перевірка збірки через MiKTeX та TeX Live у середовищі Windows.
- [x] Базове форматування заголовків розділів і підрозділів за ДСТУ 3008:2015 (`titlesec`).
- [x] Модуль генерації титульної сторінки з гнучкими метаданими (`title.tex`).
- [x] Списки: Налаштування маркованих (тире) та нумерованих списків відповідно до вимог ДСТУ щодо відступів та пунктуації.
- [x] Таблиці: Покращення підтримки багатосторінкових таблиць (`longtable`), переносів та нумерації за стандартом.
- [x] Зміст: Точне доведення точок-заповнювачів (`\dotfill`), шрифтів і відступів у `titletoc`, обтікання номеру розділу текстом.
- [ ] Бібліографія (BibTeX / BibLaTeX): Стиль оформлення джерел за ДСТУ 8302:2015.
- [x] Бібліографія (BibTeX / BibLaTeX): Стиль оформлення джерел за Chicago-Style.
- [ ] Адаптація шаблону для курсових робіт.
- [ ] Адаптація шаблону для дипломних робіт.
