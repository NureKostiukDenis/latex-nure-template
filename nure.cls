\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nure}[2026/11/21]

\LoadClass[14pt,oneside]{extreport}

\RequirePackage{fontspec}
\setmainfont{FreeSerif}[
    Path = fonts/,
    Extension = .otf,
    UprightFont = FreeSerif,
    BoldFont = FreeSerifBold,
    ItalicFont = FreeSerifItalic,
    BoldItalicFont = FreeSerifBoldItalic,
    Ligatures = TeX
]
\setmonofont{LiberationMono}[
    Path = fonts/,
    Extension = .ttf,
    UprightFont = LiberationMono-Regular,
    BoldFont = LiberationMono-Bold,
    ItalicFont = LiberationMono-Italic,
    BoldItalicFont = LiberationMono-BoldItalic
]

\RequirePackage[english,ukrainian]{babel}
\RequirePackage[a4paper, top=2cm, bottom=2cm, left=2.5cm, right=1cm]{geometry}
\RequirePackage{indentfirst}
\RequirePackage[hidelinks]{hyperref}
\AtBeginDocument{\urlstyle{same}}

\RequirePackage{xcolor}
\RequirePackage{lipsum}
\RequirePackage{caption}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{cleveref}
\RequirePackage[none]{hyphenat}
\sloppy

% Бібліографія (BibTeX з ugost2008 під вимоги ДСТУ 8302:2015 без довгих тире .—)
\AtBeginDocument{%
  \providecommand*{\BibDash}{}%
  \renewcommand*{\BibDash}{}%
}

% ГРАФІКА
\graphicspath{{imgs/}{figures/}}
\DeclareCaptionLabelFormat{custom}{#1~#2}
\captionsetup[figure]{
    name=Рисунок,
    labelsep=endash,
    justification=centering,
    singlelinecheck=true
}
\setlength{\intextsep}{12pt plus 2pt minus 2pt}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}

\newcommand{\paddedimage}[2][]{%
    \vspace{12pt}%
    \includegraphics[#1]{#2}%
}

\counterwithin{figure}{chapter}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\crefname{figure}{рис.}{рис.}
\Crefname{figure}{Рис.}{Рис.}

\counterwithin{table}{chapter}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\crefname{table}{табл.}{табл.}
\Crefname{table}{Таблиця}{Таблиці}

% ЛІСТИНГИ КОДУ
\RequirePackage{listings}
\crefname{lstlisting}{ліст.}{ліст.}
\Crefname{lstlisting}{Лістинг}{Лістинги}
\lstset{
    basicstyle=\ttfamily\footnotesize,
    keepspaces=true,
    columns=flexible,
    breaklines=true,
    breakatwhitespace=true,
    numbers=left,
    numberstyle=\color{black},
    keywordstyle=\color{blue}\bfseries,
    commentstyle=\color{green!50!black}\itshape,
    stringstyle=\color{orange!80!black},
    showstringspaces=false,
    tabsize=4,
    captionpos=b,
    belowskip=0pt,
    xleftmargin=5ex,
    framexleftmargin=5ex
}

% КОЛОНТИТУЛИ
\RequirePackage{fancyhdr}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}

% Абзацний відступ
\setlength{\parindent}{5ex}
\setlength{\parskip}{0pt}
% Інтервал — полуторний
\linespread{1.3}

% ПЕРЕЛІКИ (СПИСКИ)
\RequirePackage{enumitem}
\setlist[enumerate]{
    itemsep=0pt,
    parsep=0pt,
    topsep=0pt,
    partopsep=0pt,
    before=\linespread{1.3}\selectfont
}
\setlist[itemize]{
    itemsep=0pt,
    parsep=0pt,
    topsep=0pt,
    partopsep=0pt,
    before=\linespread{1.3}\selectfont
}


\newlist{dashlist}{itemize}{3}
\setlist[dashlist]{
    itemsep=0pt,
    parsep=0pt,
    topsep=0pt,
    partopsep=0pt,
    before=\linespread{1.3}\selectfont
}
\setlist[dashlist,1]{label=--}
\setlist[dashlist,2]{label=\textbullet}

% Глибина нумерації
\setcounter{secnumdepth}{3}
% Глибина змісту
\setcounter{tocdepth}{3}
% Керування заголовками
\RequirePackage[raggedright]{titlesec}
% Керування змістом
\RequirePackage{titletoc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\chapter}[block]
    {\filcenter\bfseries}
    {\MakeUppercase{\thechapter~}}
    {0pt}
    {\MakeUppercase}[\global\@nure@inheadingfalse]

\titleformat{name=\chapter,numberless}[block]
    {\filcenter\bfseries}
    {}
    {0pt}
    {\MakeUppercase}[\global\@nure@inheadingfalse]

\assignpagestyle{\chapter}{fancy}

\titlespacing*{\chapter}
    {0pt}
    {-30pt}
    {12pt}

\titlespacing*{name=\chapter,numberless}
    {0pt}
    {-30pt}
    {12pt}

\titlecontents{chapter}
    [0pt]
    {}
    {\thecontentslabel\;}
    {}
    {\dotfill\contentspage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
\titleformat{\section}[block]
    {\normalsize}
    {\thesection}
    {1em}
    {}[\global\@nure@inheadingfalse]

\titlespacing*{\section}
    {\parindent}
    {12pt}
    {12pt}

\titlecontents{section}
    [1em]
    {}
    {\thecontentslabel\;}
    {}
    {\dotfill\contentspage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\subsection}[block]
    {\normalsize}
    {\thesubsection}
    {1em}
    {}[\global\@nure@inheadingfalse]

\titlespacing*{\subsection}
    {\parindent}
    {12pt}
    {12pt}

\titlecontents{subsection}
    [1.75em]
    {}
    {\thecontentslabel\;}
    {}
    {\dotfill\contentspage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\subsubsection}[block]
    {\normalsize}
    {\thesubsubsection}
    {1em}
    {}[\global\@nure@inheadingfalse]

\titlespacing*{\subsubsection}
    {\parindent}
    {12pt}
    {12pt}

\titlecontents{subsubsection}
    [3.35em]
    {}
    {\thecontentslabel\;}
    {}
    {\dotfill\contentspage}


\newif\if@nure@inheading
\newif\if@nure@afterheading
\@nure@afterheadingfalse

\newcommand{\@headingcheck}{
    \if@nure@afterheading
        \vspace*{-12pt}
    \fi
    \global\@nure@inheadingtrue
    \global\@nure@afterheadingtrue
}

\AddToHook{cmd/chapter/before}{\@headingcheck}
\AddToHook{cmd/section/before}{\@headingcheck}
\AddToHook{cmd/subsection/before}{\@headingcheck}
\AddToHook{cmd/subsubsection/before}{\@headingcheck}

\AddToHook{para/before}{%
    \if@nure@inheading
    \else
        \global\@nure@afterheadingfalse
    \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{longtable}
\RequirePackage{caption}
\DeclareCaptionLabelFormat{tablecap}{Таблиця #2}
\captionsetup[table]{
format=hang,
margin=0em,
indention=0em,
singlelinecheck=false,
justification=justified,
labelsep=endash,
labelformat=tablecap,
belowskip=18pt,
aboveskip=0pt
}

\renewenvironment{table}[4]{
	\begingroup\centering
	\setlength{\LTpre}{12pt}
	\setlength{\LTpost}{12pt}
	\setlength{\LTcapwidth}{0pt}
	\begin{longtable}{#1}
		\kill
		\caption{#2}\label{#3}\\
		#4
		\endfirsthead
		\kill
		\caption*{Продовження таблиці \thetable}\\
		#4
		\endhead
		\hline
		\endfoot
}
	{%
	\end{longtable}
	\endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xkeyval}
\RequirePackage{ifthen}
\makeatletter

\define@cmdkey[CW]{TitlePage}{MinistryName}[Міністерство освіти і науки України]{}
\define@cmdkey[CW]{TitlePage}{UniversityName}[Херсонський державний університет]{}
\define@cmdkey[CW]{TitlePage}{FacultyName}[Факультет фізики, математики та інформатики]{}
\define@cmdkey[CW]{TitlePage}{DepartmentName}[Назва кафедри]{}
\define@cmdkey[CW]{TitlePage}{SicityOfWork}[Місто]{}
\define@cmdkey[CW]{TitlePage}{YearOfWork}[рік]{}
%%
\define@cmdkey[CW]{TitlePage}{WorkTitle}[\LaTeX{} \,--\, шаблон студентських наукових робіт]{}
\define@cmdkey[CW]{TitlePage}{WorkType}[Практична робота]{}
\define@cmdkey[CW]{TitlePage}{Subject}[Дисципліна]{}
\define@cmdkey[CW]{TitlePage}{StudentName}[ПІБ]{}
\define@cmdkey[CW]{TitlePage}{StudentSex}[male]{}
\define@cmdkey[CW]{TitlePage}{StudentGroup}[група]{}
\define@cmdkey[CW]{TitlePage}{StudentCourse}[курс]{}
\define@cmdkey[CW]{TitlePage}{StudentSpeciality}[Спеціальність]{}
%%
\define@cmdkey[CW]{TitlePage}{SupervisorDegree}[професор]{}
\define@cmdkey[CW]{TitlePage}{SupervisorDepartment}[ПІ]{}
\define@cmdkey[CW]{TitlePage}{SupervisorSex}[male]{}
\define@cmdkey[CW]{TitlePage}{SupervisorName}[ПІБ]{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\MakeTitlePage}[1]{
	\setkeys[CW]{TitlePage}{#1}
	\thispagestyle{empty}
%
	\begin{center}
		\par\noindent\cmdCW@TitlePage@MinistryName
		\par\noindent\cmdCW@TitlePage@UniversityName
		\par\noindent\cmdCW@TitlePage@FacultyName
		\par\noindent\cmdCW@TitlePage@DepartmentName
		\vfill
		\par\noindent{\cmdCW@TitlePage@WorkTitle}
		\par\noindent\cmdCW@TitlePage@WorkType
		\par\noindent\cmdCW@TitlePage@Subject
	\end{center}
%
	\vfill
%
\noindent
\begin{minipage}[t]{0.5\textwidth}
    \hyphenpenalty=10000
    \pretolerance=10000
    \ifthenelse
        {\equal{\cmdCW@TitlePage@StudentSex}{male}}
        {\noindent Виконав:}
        {\noindent Виконала:}
    \par\vspace{0.5ex}\noindent
    {ст.~гр.~}\cmdCW@TitlePage@StudentGroup
    \par\noindent
    \cmdCW@TitlePage@StudentName
\end{minipage}\hfill
\begin{minipage}[t]{0.5\textwidth}
	\raggedleft
    \hyphenpenalty=10000
    \pretolerance=10000
    \ifthenelse
        {\equal{\cmdCW@TitlePage@StudentSex}{male}}
        {\noindent Перевірив:}
        {\noindent Перевірила:}
    \par\vspace{0.5ex}\noindent
    \cmdCW@TitlePage@SupervisorDegree\;~каф. \cmdCW@TitlePage@SupervisorDepartment
    \par\noindent
    \cmdCW@TitlePage@SupervisorName
\end{minipage}
\vfill
	\begin{center}
	\cmdCW@TitlePage@SicityOfWork\;\cmdCW@TitlePage@YearOfWork
	\end{center}
	\pagebreak
}
\makeatother