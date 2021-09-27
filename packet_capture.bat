@echo off

@rem デフォルトの格納場所を指定
set main_dir = D:\Documents\GitHub\packet-capture\

@rem ログのパケット名を作成
set today = %date:~0,4%%date:~5,2%%date:~8,2%
@rem todayにdateコマンドの ” / ” 抜きを代入

set sub_dir = %main_dir%%today%
makdir %sub_dir%

@rem キャプチャするインターフェイスを表示させる
@echo ネットワークインターフェイス一覧
@echo.
"C:\Program Files\Wireshark\dumpcap.exe" -Desktop
@echo.

@rem キャプチャするインターフェイス情報を取得
set /p interface_id = "キャプチャしたいインターフェイスの数字を入力してください :"
@echo.
