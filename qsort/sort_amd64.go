// Code generated by command: go run sort_asm.go -pkg qsort -out ../qsort/sort_amd64.s -stubs ../qsort/sort_amd64.go. DO NOT EDIT.

package qsort

func distributeForward64(data []uint64, scratch []uint64, limit int, lo int, hi int) int

func distributeBackward64(data []uint64, scratch []uint64, limit int, lo int, hi int) int

func insertionsort128NoSwap(data [][2]uint64, base int, swap func(int, int))

func distributeForward128(data [][2]uint64, scratch [][2]uint64, limit int, lo int, hi int) int

func distributeBackward128(data [][2]uint64, scratch [][2]uint64, limit int, lo int, hi int) int

func insertionsort256NoSwap(data [][4]uint64, base int, swap func(int, int))

func distributeForward256(data [][4]uint64, scratch [][4]uint64, limit int, lo int, hi int) int

func distributeBackward256(data [][4]uint64, scratch [][4]uint64, limit int, lo int, hi int) int
