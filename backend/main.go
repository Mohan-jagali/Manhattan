package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from the Go Backend!")
}

func main() {
	http.HandleFunc("/", helloHandler)
	fmt.Println("Backend running on port 8282...")
	http.ListenAndServe(":8282", nil)
}

