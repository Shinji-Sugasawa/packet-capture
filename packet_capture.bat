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

@rem 保存間隔を分単位で指定
set /p time_interval="保存間隔を分単位で指定してください :"
set /a "time_interval *= 60"
@echo.

@rem パケットのキャプチャを開始
@echo キャプチャしたパケットを保存しています。Ctrl＋Cで終了します。
"C:\Program Files\Wireshark\dumpcap.exe" -i %interface_id% -b duration:%time_interval% -w %sub_dir%\packet.pcapng"
