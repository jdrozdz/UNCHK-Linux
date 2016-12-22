#!/bin/bash

local=`ls .`
tablica=(mov avi mp4 jpg png xls xlsx doc docx ppt pptx pdf odt ods odp dir undef);

for dirName in $local
do
	if [ -d $dirname ]; then
		echo -ne "$dirName\t";
	fi
done

echo -ne "\nWybierz katalog: ";
read SelectedDir;

if [ -e $SelectedDir ]; then
	files=`ls $SelectedDir`;
	for fname in $files
	do
		file $SelectedDir/$fname;
		i=-1;
		for el in "${tablica[@]}"
		do
			i=$[i + 1];
			if [ $i = 7 ]; then
				echo -ne "\n";
			fi;
			echo -ne "$i) $el \t";
		done
		echo -ne "\nPodaj rozszerzenie dla pliku: ";
		read extension;
		if [ -e "Restore" ]; then
			mv $SelectedDir/$fname Restore/$fname.${tablica[$extension]};
		else
			mkdir Restore;
			mv $SelectedDir/$fname Restore/$fname.${tablica[$extension]};
		fi
	done
fi

