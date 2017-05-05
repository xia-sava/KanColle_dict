
from fileinput import FileInput
from pprint import pprint
from random import randint
import shutil

POS = {
    "名詞": "固有一般",
    "その他自立語": "独立語",
    "さ変名詞": "名詞サ変",
    "ざ変名詞": "名詞ザ変",
    "形動名詞": "名詞形動",
    "副詞的名詞": "名詞",
    "さ変形動名詞": "名サ形動",
    "人名": "固有人他",
    "姓": "固有人姓",
    "名": "固有人名",
    "地名その他": "固有地名",
    "固有名詞": "固有一般",
    "あわ行五段": "ワ行五段",
    "か行五段": "カ行五段",
    "が行五段": "ガ行五段",
    "さ行五段": "サ行五段",
    "た行五段": "タ行五段",
    "な行五段": "ナ行五段",
    "ば行五段": "バ行五段",
    "ま行五段": "マ行五段",
    "ら行五段": "ラ行五段",
    "姓名接頭語": "接頭語",
    "地名接頭語": "接頭語",
    "固有接頭語": "接頭語",
    "姓名接尾語": "接尾語",
    "地名接尾語": "接尾語",
    "固有接尾語": "接尾語",
    "慣用句": "独立語",
    "短縮よみ": "短縮読み",
    }

def main():
    dic = {}
    with FileInput() as f:
        for line in f:
            if "\t" not in line:
                continue
            r = line.strip().split("\t")
            if len(r) < 1:
                continue
            if r[0][0] == '!':
                continue
            r[0] = r[0].replace('．', '・') # ピリオドは読みに設定できない
            r[2] = r[2].replace('*', '')
            keyword = r[0] + r[1]
            if keyword not in dic:
                if r[2] in POS:
                    r[2] = POS[r[2]]
                dic[keyword] = r

    print("!!ATOK_TANGO_TEXT_HEADER_1")
    for key in sorted(dic):
        print("\t".join(dic[key]))


if __name__ == '__main__':
    main()

