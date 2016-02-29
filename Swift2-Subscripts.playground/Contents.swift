// : Playground - noun: a place where people can play

import UIKit

//: 下标（Subscripts）

//: 下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }

    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            precondition(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }

        set {
            precondition(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 3)
print(matrix[1, 2])
matrix[1, 1] = 3
print(matrix)
