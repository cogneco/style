#!/bin/bash
rm -rf png* ps eps pdf
directory=`pwd`
for infile in *.svg; do
	title=${infile%%.svg}
	file="$title"
	for dpi in 90 300 1200; do
		echo "./png${dpi}/${file} ${dpi}dpi.png"
		mkdir -p "./png${dpi}/"
		inkscape "$directory/$infile" --export-dpi=$dpi --export-area-page --export-filename="$directory/png${dpi}/${file} ${dpi}dpi.png"
	done
	echo "./ps/${file}.ps"
	mkdir -p "./ps/${folder}"
	inkscape "$directory/$infile" --export-text-to-path --export-area-page --export-filename="$directory/${file}.ps"
	echo "./eps/${file}.eps"
	mkdir -p "./eps/${folder}"
	inkscape "$directory/$infile" --export-text-to-path --export-area-page --export-filename="$directory/eps/${file}.eps"
	echo "./pdf/${file}.pdf"
	mkdir -p "./pdf/${folder}"
	inkscape "$directory/$infile" --export-text-to-path --export-area-page --export-filename="$directory/pdf/${file}.pdf"
done
