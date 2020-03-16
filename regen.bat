@echo off
setlocal

set SolutionDir=%~dp0
pushd "%SolutionDir%"

set CODEGEN_TPLDIR=Templates

if not defined RPSMFIL (
    echo RPSMFIL is not defined!
    goto error
)

if not defined RPSTFIL (
    echo RPSTFIL is not defined!
    goto error
)

codegen -s * -ms -t GetStructureName -r -o PiiScrubber -lf

popd
endlocal
