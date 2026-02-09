# --- latex-iu1-template/.latexmkrc ---

# 1. Куда складывать мусор и PDF
$out_dir = 'build';

# 2. Движок xelatex
$pdf_mode = 5;

# 3. Что собираем по умолчанию
@default_files = ('examples/main.tex');

# 4. Команда сборки
# ВАЖНО:
# - Убрали -output-directory=%D (latexmk добавляет его сам из-за $out_dir)
# - mkdir создает build/examples/chapters, так как output зеркалирует структуру исходников
$xelatex = 'mkdir -p build/examples/chapters && xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';

# 5. Пути к стилям (локально в lib)
ensure_path('TEXINPUTS', './lib//');

sub ensure_path {
    my ($var, $path) = @_;
    my $sep = ($^O eq 'MSWin32') ? ';' : ':';
    if ($ENV{$var}) { $ENV{$var} = $path . $sep . $ENV{$var}; }
    else { $ENV{$var} = $path . $sep; }
}

$cleanup_mode = 1;
$clean_ext = "bbl nav out snm xdv";