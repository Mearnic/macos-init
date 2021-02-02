#!/bin/bash
alias_file=./.aliasrc
zshrc_file=~/.zshrc
function init(){
if [ -f "$zshrc_file" ]; then
	is_exists_aliasrc
	if [ $? != 1 ]; then
		echo "" >> $zshrc_file
		echo "if [ -f ~/.aliasrc ]; then" >> $zshrc_file
		echo "    . ~/.aliasrc" >> $zshrc_file
		echo "fi" >> $zshrc_file
  fi
	cp -f $alias_file ~/.aliasrc
fi
}

function is_exists_aliasrc(){
    if test -z "$(grep -w .aliasrc $zshrc_file)"
    then
      return 0 
    else  
      return 1 
    fi
}

init
