<#
.SYNOPSIS
  MOV形式の動画をMP4形式へ一括変換（再エンコード）するスクリプト

.DESCRIPTION
  - フォルダ内のすべての .mov ファイルを対象とする
  - H.264 (libx264) + AAC 形式に再エンコードし、互換性の高いmp4を生成する
  - 出力ファイル名は元のファイル名を保持し、拡張子のみ .mp4 に変更される
  - 再エンコードのため、確実に再生できるmp4が得られる

.PARAMETER なし
  カレントディレクトリにある .mov ファイルを対象とする

.OUTPUTS
  元ファイル名と同名の .mp4 ファイルが同一ディレクトリに作成される

.NOTES
  Author   : Nishida
  Version  : 1.0
  Created  : 2025-09-10
  Updated  : （改訂時に記入）
  Usage    : PowerShellで本スクリプトを配置したディレクトリに移動し、以下を実行
               PS> .\Convert-MOV-to-MP4-Reencode.ps1
#>

foreach ($f in Get-ChildItem *.mov) {
  ffmpeg -i $f.FullName `
         -c:v libx264 -crf 23 `
         -c:a aac -b:a 192k `
         ($f.BaseName + ".mp4")
}
