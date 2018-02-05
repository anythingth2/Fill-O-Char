@echo off
cls
Z:RESCAN
tasm fill_o.asm
tlink fill_o.obj /t
cls
fill_o.COM