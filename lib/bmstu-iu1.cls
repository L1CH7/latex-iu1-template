%% lib/bmstu-iu1.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bmstu-iu1}[2026/02/08 v3.0.0 BMSTU IU1 Modular Class]

% 1. Базовый класс
\LoadClass[a4paper,oneside,14pt]{extreport}

% 2. XeLaTeX настройки (Шрифты и Язык)
\RequirePackage{fontspec}
\RequirePackage[english, main=russian]{babel}

\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

% Математика
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% 3. Геометрия и отступы
\RequirePackage[left=30mm, right=10mm, top=20mm, bottom=20mm]{geometry}
\RequirePackage{indentfirst}
\setlength{\parindent}{1.25cm}
\RequirePackage{setspace}
\onehalfspacing
\RequirePackage{microtype}
\sloppy

% 4. Подключаем твои модули (они лежат в lib/, latexmk их найдет)
\RequirePackage{bmstu-headers}
\RequirePackage{bmstu-bullets}

% 5. Таблицы и Картинки
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{pdflscape}
\RequirePackage{afterpage}

% Настройка подписей
\DeclareCaptionLabelSeparator{emdash}{~--~}
\captionsetup{
    labelsep=emdash,
    singlelinecheck=false,
    figurename=Рисунок,
    tablename=Таблица
}
% \captionsetup[figure]{
% 	justification=centering,
% 	position=bottom        % Подсказываем, что подпись снизу
% }
% \captionsetup[table]{
%     justification=raggedright, % По левому краю
%     position=top               % ВАЖНО: Убирает лишний отступ над подписью!
% }
% Обнуляем стандартные отступы caption, чтобы управлять ими только через \captionsetup
% \setlength{\abovecaptionskip}{7pt}
% \setlength{\belowcaptionskip}{-7pt}

% 6. Библиография (BibLaTeX + Biber)
\RequirePackage[
	style=gost-numeric,
	backend=biber,
	language=auto,
	autolang=other,
	sorting=none,
]{biblatex}
\RequirePackage{csquotes}
\DeclareFieldFormat{urldate}{(дата обращения:\addspace\thefield{urlday}\adddot \thefield{urlmonth}\adddot\thefield{urlyear})}

% 7. Гиперссылки
\RequirePackage[unicode,hidelinks]{hyperref}

% 8. Подключение модулей BMSTU (лежат в lib/bmstu/)
% Важно: listing должен быть нашим исправленным версией
\RequirePackage{bmstu-figure}
\RequirePackage{bmstu-listing} 
\RequirePackage{bmstu-title}
\RequirePackage{bmstu-defabbr}
\RequirePackage{bmstu-biblio}
\RequirePackage{bmstu-appendix}
\RequirePackage{bmstu-toc}
\RequirePackage{bmstu-essay}

% Подключаем наш "Санитар" последним, чтобы он переписал настройки остальных
\RequirePackage{bmstu-spacing}

% Для ТЗ и иных страничек
\RequirePackage{bmstu-pdf}

\endinput