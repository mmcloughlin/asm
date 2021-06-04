// Code generated by command: go run hybrid_asm.go -pkg qsort -out ../qsort/hybrid_amd64.s -stubs ../qsort/hybrid_amd64.go. DO NOT EDIT.

package qsort

func insertionsort32(data *byte, lo int, hi int)

func distributeForward32(data *byte, scratch *byte, limit int, lo int, hi int, pivot int) int

func distributeBackward32(data *byte, scratch *byte, limit int, lo int, hi int, pivot int) int

func insertionsort16(data *byte, lo int, hi int)

func distributeForward16(data *byte, scratch *byte, limit int, lo int, hi int, pivot int) int

func distributeBackward16(data *byte, scratch *byte, limit int, lo int, hi int, pivot int) int
