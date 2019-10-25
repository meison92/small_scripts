#!/bin/sh

RODAR=0
FULL=0
THUMB=0


if [ "$1" = "full" ] || [ "$2" = "full" ]; then
	FULL=1
	RODAR=1
fi
if [ "$1" = "thumb" ] || [ "$2" = "thumb" ]; then
	THUMB=1
	RODAR=1
fi
if [ "$1" = "" ]; then
	RODAR=1
fi


if [ "$RODAR" = 0 ]; then
echo \
'Gera um HTML com a listagem de todos os arquivos do diret�rio atual.
Sintaxe:
    ls2html
Para incluir a estrutura normal de um HTML (head e body), use:
    ls2html full
Para gerar uma p�gina de thumbnails, use:
    ls2html thumb
    ls2html thumb full
Todo o c�digo HTML gerado � jogado no stdout.'
exit
fi



if [ "$FULL" = 1 ]; then
echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Generated by ls2html</title>
</head>
<body>
<ul>
'
fi


if [ "$THUMB" = 1 ]; then
ls -sh1 | sed -n '1d
s/^ *\([^ ]*\) \(.*\)$/<li><a href="\2"><img src="thumbs\/\2" alt="">\2<\/a> (\1)<\/li>/p'
else
ls -sh1 | sed -n '1d
s/^ *\([^ ]*\) \(.*\)$/<li><a href="\2">\2<\/a> (\1)<\/li>/p'
fi



if [ "$FULL" = 1 ]; then
echo '
</ul>
</body>
</html>'
fi