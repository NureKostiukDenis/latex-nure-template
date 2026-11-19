#!/bin/sh
set -e

if command -v pacman >/dev/null 2>&1; then
    echo "Виявлено Arch Linux (pacman)..."
    sudo pacman -S --needed \
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
elif command -v apt >/dev/null 2>&1; then
    echo "Виявлено Debian / Ubuntu (apt)..."
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
elif command -v dnf >/dev/null 2>&1; then
    echo "Виявлено Fedora (dnf)..."
    sudo dnf install -y \
        texlive-scheme-medium \
        texlive-collection-langcyrillic \
        texlive-biblatex \
        biber \
        latexmk
elif command -v winget >/dev/null 2>&1; then
    echo "Виявлено Windows (winget)..."
    winget install MiKTeX.MiKTeX
    winget install StrawberryPerl.StrawberryPerl
else
    echo "Не вдалося визначити пакетний менеджер (pacman, apt, dnf або winget)."
    echo "Будь ласка, встановіть залежності вручну за інструкцією в README.md."
    exit 1
fi

echo "Готово! Усі залежності встановлено."
