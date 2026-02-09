#!/bin/bash

python -m nodeenv .nodeenv
source .nodeenv/bin/activate
npm install -g  @mermaid-js/mermaid-cli
