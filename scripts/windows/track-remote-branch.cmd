@echo off

git checkout -b %1 remotes/origin/%1

IF %ERRORLEVEL% EQ 0 (
    git submodule update
)