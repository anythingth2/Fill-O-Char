@echo off
cls
Z:RESCAN
tasm fill_o1.asm
tlink fill_o1.obj /t
cls
fill_o1.COM