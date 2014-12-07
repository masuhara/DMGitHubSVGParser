DMGitHubSVGParser
=================
【About DMGitHubSVGParser】

このライブラリはGitHub APIのContribution Heatmapを取得し、取得したSVG形式の文字列のデータ情報を、UIImageに変換するライブラリです。

【How to Use】
DMSVGParserフォルダをダウンロードし、自分のプロジェクトファイルに入れます。
DMSVGParserをインポートします。
AFNetworkingを使って通信する場合はAFNetworkingもインポートしておきましょう。
データを取得したあとに、「+getSVGImage:(NSData *)data」メソッドにresponseDataを渡してあげればUIImageで返ってきます。
