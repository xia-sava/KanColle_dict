iconv -f cp932 -t utf-8 艦これ辞書ver2.03/KanColleDic_txt.txt > KanColleDic_txt.txt
iconv -f ucs-2 -t utf-8 KanColleDIC_rev64/*.txt > KanColleDIC_rev64.txt
iconv -f cp932 -t utf-8 kancolle-dic-20161123/*.txt > kancolle-dic-20161123.txt
python3 merge.py KanColleDic_txt.txt KanColleDIC_rev64.txt kancolle-dic-20161123.txt kancolle_additional.txt | iconv -f utf-8 -t utf-16le | perl -pe 'BEGIN{print"\xFF\xFE"}' > kancolle.txt
