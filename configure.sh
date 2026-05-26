#!/bin/bash

# 0. Очищаем кэш puppeteer, чтобы избежать ошибок с частично скачанными браузерами
rm -rf ~/.cache/puppeteer

# 1. Создаем виртуальное окружение Python
python3 -m venv .venv
source .venv/bin/activate

# 2. Устанавливаем nodeenv внутри виртуального окружения Python
pip install --upgrade pip
pip install nodeenv

# 3. Создаем локальное окружение Node.js
nodeenv .nodeenv
source .nodeenv/bin/activate

# 4. Устанавливаем mermaid-cli для рендеринга диаграмм
npm install -g @mermaid-js/mermaid-cli

# 5. Устанавливаем headless-shell для Puppeteer, чтобы Mermaid мог рендерить графики без ошибок
npx -y puppeteer browsers install chrome-headless-shell
