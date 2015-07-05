function Get-ScriptDirectory
{
 $Invocation = (Get-Variable MyInvocation -Scope 1).Value
 Split-Path $Invocation.MyCommand.Path
}

$currentPath = Get-Location

Set-Location (Get-ScriptDirectory)

$path = Join-Path (Get-ScriptDirectory) LoksimDetailDoku.tex

$showpdf = $TRUE
if ($args.count -ge 1)
{
	if ($args[0] -eq "-noshow")
	{
		$showpdf = $FALSE
	}
}


. pdflatex -synctex=1 -interaction=nonstopmode $path

if ($showpdf)
{
	$path = Join-Path (Get-ScriptDirectory) LoksimDetailDoku.pdf
	. $path
}

Set-Location $currentPath