HASH=`git rev-parse HEAD`

prepare:
	rm -f templates.rice-box.go
	rm -f static.rice-box.go
	rice embed-go -v -i .

check:
	go test -cover -v github.com/espebra/filebin/app/api github.com/espebra/filebin/app/model github.com/espebra/filebin/app/config github.com/espebra/filebin/app/backend/fs github.com/espebra/filebin/app/metrics github.com/espebra/filebin/app/events

get-deps:
	go get github.com/GeertJohan/go.rice
	go get github.com/GeertJohan/go.rice/rice

build: prepare
	go build -ldflags "-X main.githash=${HASH}"

install: prepare
	go install -ldflags "-X main.githash=${HASH}"
