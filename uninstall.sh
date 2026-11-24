#!/bin/sh
set -e

if command -v pacman >/dev/null 2>&1; then
    echo "Виявлено Arch Linux (pacman)..."
    sudo pacman -Rns \
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
    sudo apt remove -y \
        texlive-latex-base \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-bibtex-extra \
        texlive-luatex \
        texlive-lang-cyrillic \
        texlive-fonts-recommended \
        biber \
        latexmk
    sudo apt autoremove -y
elif command -v dnf >/dev/null 2>&1; then
    echo "Виявлено Fedora (dnf)..."
    sudo dnf remove -y \
        texlive-scheme-medium \
        texlive-collection-langcyrillic \
        texlive-biblatex \
        biber \
        latexmk
elif command -v winget >/dev/null 2>&1; then
    echo "Виявлено Windows (winget)..."
    winget uninstall MiKTeX.MiKTeX
    winget uninstall StrawberryPerl.StrawberryPerl
else
    echo "Не вдалося визначити пакетний менеджер (pacman, apt, dnf або winget)."
    echo "Будь ласка, видаліть залежності вручну."
    exit 1
fi

echo "Готово! Усі залежності видалено."
