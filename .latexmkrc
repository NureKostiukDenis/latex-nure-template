# .latexmkrc
$pdf_mode = 4; # 4 = lualatex
$postscript_mode = $dvi_mode = 0;
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$bibtex = 'bibtex %O %S';
