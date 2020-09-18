module github.com/oneleo/go-local-mod-practice

go 1.15

require (
	github.com/oneleo/go-local-mod-practice/bar v0.0.0
	github.com/oneleo/go-local-mod-practice/foo v0.0.0
)

replace (
	github.com/oneleo/go-local-mod-practice/foo => ./foo
	github.com/oneleo/go-local-mod-practice/bar => ./bar
)
