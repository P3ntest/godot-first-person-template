# Julius' Godot First Person Template

Welcome to my template. I am writing this readme for myself but I hope it's useful for whoever will end up using this.

## Quick Start

This quickstart makes sure you have the project setup and git lfs correctly installed.

```bash
PROJECT_NAME="my-game"
git clone --depth 1 https://github.com/p3ntest/godot-first-person-template.git "$PROJECT_NAME"
cd "$PROJECT_NAME"
rm -rf .git
git init
git lfs install
git add .
sed -i 's/^config\/name="first-person-template"/config\/name="'"$PROJECT_NAME"'"/' project.godot
git commit -m "Initial commit from Godot First Person Template"
```
