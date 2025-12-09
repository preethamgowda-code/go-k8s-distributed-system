package main

import (
    "fmt"
    "net/http"
)

func homePage(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, I am running inside a container!")
}

func main() {
    http.HandleFunc("/", homePage)
    http.ListenAndServe(":8080", nil)
}