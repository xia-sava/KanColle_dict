iconv -f ucs-2 -t utf-8 艦これIME辞書　Ver.2.08/艦これIME辞書　*.txt > KanColleDic_txt.txt
iconv -f ucs-2 -t utf-8 KanColleDIC_rev64/*.txt > KanColleDIC_rev64.txt
iconv -f cp932 -t utf-8 kancolle-dic-20170521/*.txt > kancolle-dic-20170521.txt
python3 merge.py KanColleDic_txt.txt KanColleDIC_rev64.txt kancolle-dic-20170521.txt kancolle_additional.txt | iconv -f utf-8 -t utf-16le | perl -pe 'BEGIN{print"\xFF\xFE"}' > kancolle.txt
iconv -f utf-16le -t utf-8 kancolle.txt | grep -v '短縮読み' | grep -v '顔文字' | iconv -f utf-8 -t utf-16le | perl -pe 'BEGIN{print"\xFF\xFE"}' > kancolle_s.txt
