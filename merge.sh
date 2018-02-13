cat '艦これ辞書ver2.03/KanColleDic_ver1.04_Google日本語入力_インポート用.txt' > KanColleDic_203.txt

iconv -f ucs-2 -t utf-8 '艦これIME辞書　Ver.2.08/艦これIME辞書　深海棲艦編Ver.1.05.txt' '艦これIME辞書　Ver.2.08/艦これIME辞書　装備編Ver.1.18.txt' '艦これIME辞書　Ver.2.08/艦これIME辞書　地名編Ver.1.02.txt' > KanColleDic_208.txt

iconv -f ucs-2 -t utf-8 KanColleDIC_rev64/*.txt > KanColleDIC_rev64.txt

iconv -f cp932 -t utf-8 kancolle-dic-20170521/*.txt > kancolle-dic-20170521.txt


python3 merge.py KanColleDIC_rev64.txt kancolle-dic-20170521.txt KanColleDic_208.txt KanColleDic_203.txt kancolle_additional.txt | iconv -f utf-8 -t utf-16le | perl -pe 'BEGIN{print"\xFF\xFE"}' > kancolle.txt
iconv -f utf-16le -t utf-8 kancolle.txt | grep -v '短縮読み' | grep -v '顔文字' | iconv -f utf-8 -t utf-16le | perl -pe 'BEGIN{print"\xFF\xFE"}' > kancolle_s.txt
