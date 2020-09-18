# 如何在 Go 語言內 import 相同專案底下的 package

## 一般情況下

- 若您直接執行 `go run ./main.go` 的話

```sh
go run ./main.go
```

- 會得到類似下方的錯誤訊息，所以我們需要進行修正

```sh
go: github.com/oneleo/go-local-mod-practice/bar@v0.0.0: parsing bar\go.mod: open C:\Users\chtti\oneleo\go-local-mod-practice\bar\go.mod: The system cannot find the file specified.
```

## 修正第一步
- 需在專案的資料夾內執行下列指令

```sh
go mod init "github.com/oneleo/go-local-mod-practice"
go mod edit -require="github.com/oneleo/go-local-mod-practice/foo@v0.0.0"
go mod edit -require="github.com/oneleo/go-local-mod-practice/bar@v0.0.0"
go mod edit -replace="github.com/oneleo/go-local-mod-practice/foo=./foo"
go mod edit -replace="github.com/oneleo/go-local-mod-practice/bar=./bar"
```

## 第二步
- 需個別在不同 package 內執行下列指令

```sh
cd ./foo
go mod init github.com/oneleo/go-local-mod-practice/foo
cd ../bar
go mod init github.com/oneleo/go-local-mod-practice/bar
cd ..
```

## 第三步
- 執行程式

```sh
go run ./main.go
```

- 即可順利執行不出錯

```
Hi, I'm bar package.
Hi, I'm foo package.
```