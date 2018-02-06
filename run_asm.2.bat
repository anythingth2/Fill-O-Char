@echo off
cls
Z:RESCAN
tasm fill_o2.asm
tlink fill_o2.obj /t
cls
fill_o2.COM