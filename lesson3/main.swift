//
//  main.swift
//  lesson3
//
//  Created by Natalia on 21.09.2021.
//

import Foundation

 //Задание выполнила Копылова Наталья

//MARK:- Задание 1. Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.

let array: [Int] = {
    var a = [Int]()
    for _ in 0..<20 {
        a.append(Int.random(in: 0..<100))
    }
    return a
}()

func bubbleSort(_ array: [Int]) -> ([Int], Int) {
    var count = 0
    var mutableArray = array
    var isSorted = false
    while !isSorted {
        isSorted = true
        for i in 0..<mutableArray.count - 1 {
            count += 1
            if mutableArray[i] > mutableArray[i + 1] {
                isSorted = false
                let temp = mutableArray[i]
                mutableArray[i] = mutableArray[i + 1]
                mutableArray[i + 1] = temp
            }
        }
    }
    return (mutableArray, count)
}

func bubbleSortOptimized(_ array: [Int]) -> ([Int], Int) {
    var count = 0
    var mutableArray = array
    var isSorted = false
    var steps = mutableArray.count - 1
    while !isSorted {
        isSorted = true
        for i in 0..<steps {
            count += 1
            if mutableArray[i] > mutableArray[i + 1] {
                isSorted = false
                let temp = mutableArray[i]
                mutableArray[i] = mutableArray[i + 1]
                mutableArray[i + 1] = temp
            }
        }
        steps -= 1
    }
    return (mutableArray, count)
}
print("Cлучайный массив \(array)")
print("Пузырьковая сортировка \(bubbleSort(array))")
print("Оптимизированная пузырьковая сортировка \(bubbleSortOptimized(array))")

//MARK:- Задание 2. Реализовать шейкерную сортировку

func shakerSort(_ array: [Int]) -> ([Int], Int) {
    var count = 0
    
    var mutableArray = array
    var isSorted = false
    var forward = true
    while !isSorted {
        isSorted = true
        for index in 0..<mutableArray.count - 1 {
            count += 1
            let i = forward ? index : mutableArray.count - 2 - index
            if mutableArray[i] > mutableArray[i + 1] {
                isSorted = false
                let temp = mutableArray[i]
                mutableArray[i] = mutableArray[i + 1]
                mutableArray[i + 1] = temp
            }
        }
        forward.toggle()
    }
    return (mutableArray, count)
}

print("Шейкерная сортировка \(shakerSort(array))")

func shakerSortOptimized(_ array: [Int]) -> ([Int], Int) {
    var count = 0
    var mutableArray = array
    var isSorted = false
    var end = mutableArray.count - 1
    var forward = true
    var start = 0
    while !isSorted {
        isSorted = true
        var step = 0
        for index in start..<end {
            count += 1
            let i = forward ? index : (end - 1 - step)
            step += 1
            if mutableArray[i] > mutableArray[i + 1] {
                isSorted = false
                let temp = mutableArray[i]
                mutableArray[i] = mutableArray[i + 1]
                mutableArray[i + 1] = temp
            }
        }
        if forward { end -= 1 } else { start += 1 }
        forward.toggle()
        
    }
    return (mutableArray, count)
}
print("Оптимизированная шейкерная сортировка \(shakerSortOptimized(array))")

//MARK:- Задание 3. Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.

func findIndex(array: [Int], value: Int) -> (Int, Int) {
    var count = 0
    var left = 0
    var right = array.count - 1
    var middle = (right - left) / 2
    while left <= right && array[middle] != value {
        count += 1
        if array[middle] < value {
            left = middle + 1
        } else {
            right = middle - 1
        }
        middle = left + (right - left) / 2
    }
    if middle < array.count, array[middle] == value {
        return (middle, count)
    }
    return (-1, count)
}
let sortedArray = shakerSort(array).0
 print("Индекс \(findIndex(array: sortedArray, value: 105))")
