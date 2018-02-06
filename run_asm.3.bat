@echo off
cls
Z:RESCAN
tasm fill_o3.asm
tlink fill_o3.obj /t
cls
fill_o3.COM