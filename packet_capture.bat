@echo off

chcp 65001 
@rem SHIFT-JISからUTF-8に変換

@rem デフォルトの格納場所を指定
set main_dir=D:\Documents\GitHub\packet-capture\

@rem フォルダにキャプチャした日付をつける
set today=%date:~0,4%%date:~5,2%%date:~8,2%
set sub_dir=%main_dir%%today%
mkdir %sub_dir%

@echo.
@rem キャプチャするインターフェイスを表示させる
@echo ネットワークインターフェイス一覧
@echo.
@echo ===============================================================================
"C:\Program Files\Wireshark\dumpcap.exe" -D
@echo ===============================================================================
@echo.

set /p interface_id="キャプチャしたいネットワークインターフェイスの番号を入力してください："
@echo.

set /p time_interval="保存の間隔を分単位で入力してください："
set /a "time_interval *= 60"
@echo.

@echo Wiresharkでパケットを保存します。Ctrl+Cで終了。
"C:\Program Files\Wireshark\dumpcap.exe" -i %interface_id% -b duration:%time_interval% -w %sub_dir%\packet.pcapng