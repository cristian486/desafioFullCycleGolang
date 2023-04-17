FROM golang:latest as build
WORKDIR /desafio_golang/
RUN touch app.go \ 
    && echo 'package main' >> app.go \ 
    && echo 'import "fmt"' >> app.go \ 
    && echo 'func main() {' >> app.go && echo 'fmt.Println("Full Cycle Rocks!!!");' >> app.go \ 
    && echo '}' >> app.go

RUN go build -ldflags='-s -w' app.go

FROM scratch
COPY --from=build /desafio_golang/app .
ENTRYPOINT [ "./app" ]
