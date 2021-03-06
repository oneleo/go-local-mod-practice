# 如何在 Go 語言內 import 相同專案底下的 package

## 複製此專案

```sh
$> git clone git@github.com:oneleo/go-local-mod-practice.git
$> cd ./go-local-mod-practice
```

## 一般情況下

- 若您直接執行 `go run ./main.go` 的話

```sh
$> go run ./main.go
```

- 會得到類似下方的錯誤訊息，所以我們需要進行修正

```sh
go: github.com/oneleo/go-local-mod-practice/bar@v0.0.0: parsing bar\go.mod: open C:\Users\chtti\oneleo\go-local-mod-practice\bar\go.mod: The system cannot find the file specified.
# 或
go: github.com/oneleo/go-local-mod-practice/foo@v0.0.0: parsing foo\go.mod: open C:\Users\chtti\oneleo\go-local-mod-practice\foo\go.mod: The system cannot find the file specified.
```

## 修正第一步
- 需在專案的資料夾內執行下列指令

```sh
$> go mod init "github.com/oneleo/go-local-mod-practice" # 產生 go.mod 檔
$> go mod edit -require="github.com/oneleo/go-local-mod-practice/foo@v0.0.0" # 需 foo pkg 的資訊寫入 go.mod 內
$> go mod edit -require="github.com/oneleo/go-local-mod-practice/bar@v0.0.0" # 需 bar pkg 的資訊寫入 go.mod 內
$> go mod edit -replace="github.com/oneleo/go-local-mod-practice/foo=./foo" # 將 foo pkg 在 local 位置寫入 go.mod
$> go mod edit -replace="github.com/oneleo/go-local-mod-practice/bar=./bar" # 將 bar pkg 在 local 位置寫入 go.mod
```

## 第二步
- 需個別在不同 package 內執行下列指令

```sh
$> cd ./foo
$> go mod init github.com/oneleo/go-local-mod-practice/foo # 視 foo pkg 為一專案，產生 go.mod 檔
$> cd ../bar
$> go mod init github.com/oneleo/go-local-mod-practice/bar # 視 bar pkg 為一專案，產生 go.mod 檔
$> cd ..
```

## 第三步
- 執行程式

```sh
$> go run ./main.go
```

- 即可順利執行不出錯

```
Hi, I'm bar package.
Hi, I'm foo package.
```