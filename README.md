# Verilog-on-VS-Code-helper
This is a simple tool to setup formatter, linter, snippets and other useful things for Vivado Verilog on VS Code.

## How to use

### For windows users
1. Download zip version of VS Code from https://code.visualstudio.com/download
2. Extract the content to preferred folder
3. Clone or download the repo
4. copy helper_windows folder to the folder mentioned in 2.
5. run Start,bat and follow the instructions

## What it did
- With extensions created by [mshr-h](https://github.com/mshr-h/vscode-verilog-hdl-support)and [IsaacT](https://github.com/IsaacJT/Verilog-Formatter), we can have formatter, snippets, and other features work.
- However, we requires some extra tools to let it work, like clang, iStyle formatter, and so on.
- This repo grabs all files needed (except xvlog.bat, which will be at `<vivado install path>/bin`) and have a small script to setup a portable environment for VS Code

