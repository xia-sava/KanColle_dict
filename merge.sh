#!/usr/bin/env bash

cat '艦これ辞書ver2.03/KanColleDic_ver1.04_Google日本語入力_インポート用.txt' > KanColleDic_203.txt

iconv -f ucs-2 -t utf-8 '艦これIME辞書　Ver.2.08/艦これIME辞書　深海棲艦編Ver.1.05.txt' > KanColleDic_208_1.txt
iconv -f ucs-2 -t utf-8 '艦これIME辞書　Ver.2.08/艦これIME辞書　装備編Ver.1.18.txt' > KanColleDic_208_2.txt
iconv -f ucs-2 -t utf-8 '艦これIME辞書　Ver.2.08/艦これIME辞書　地名編Ver.1.02.txt' > KanColleDic_208_3.txt

iconv -f ucs-2 -t utf-8 KanColleDIC_rev64/*.txt > KanColleDIC_rev64.txt

iconv -f cp932 -t utf-8 kancolle-dic-20171212/*.txt > kancolle-dic-20171212.txt


python3 merge.py kancolle_additional.tsv kancolle_correction.txt KanColleDIC_rev64.txt KanColleDic_203.txt kancolle-dic-20171212.txt KanColleDic_208_1.txt KanColleDic_208_2.txt KanColleDic_208_3.txt | iconv -f utf-8 -t utf-16le | perl -pe 'BEGIN{print"\xFF\xFE"}' > kancolle.txt
iconv -f utf-16le -t utf-8 kancolle.txt | grep -v '短縮読み' | grep -v '顔文字' | grep -v '人名' | iconv -f utf-8 -t utf-16le > kancolle_s.txt
