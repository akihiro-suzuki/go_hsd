FROM golang:1.20.10-alpine
WORKDIR /go/src/app
RUN apk update && apk add git && apk add bash && apk add sudo
RUN go install -v github.com/cweill/gotests/gotests@latest
RUN go install -v github.com/josharian/impl@latest
RUN go install -v github.com/go-delve/delve/cmd/dlv@latest
RUN go install -v honnef.co/go/tools/cmd/staticcheck@latest
RUN go install -v golang.org/x/tools/gopls@latest
COPY go.mod .
RUN go mod download
COPY . . 
