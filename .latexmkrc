# --- latex-iu1-template/.latexmkrc ---
$out_dir = 'build';
$pdf_mode = 5; # xelatex

# Собираем пример по умолчанию
@default_files = ('examples/main.tex');

# Команда сборки (добавляем создание папки для примера)
$xelatex = 'mkdir -p build/examples/chapters && xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape -output-directory=%D %S';

# Пути: ищем стили локально в ./lib
ensure_path('TEXINPUTS', './lib//');

# Вспомогательная функция (твоя же, но чуть универсальнее)
sub ensure_path {
    my ($var, $path) = @_;
    my $sep = ($^O eq 'MSWin32') ? ';' : ':';
    if ($ENV{$var}) { $ENV{$var} = $path . $sep . $ENV{$var}; }
    else { $ENV{$var} = $path . $sep; }
}

$cleanup_mode = 1;
$clean_ext = "bbl nav out snm";