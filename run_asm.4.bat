@echo off
cls
Z:RESCAN
tasm fill_o4.asm
tlink fill_o4.obj /t

fill_o4.COM