//: Playground - noun: a place where people can play

import UIKit

//: 函数参数名称（Function Parameter Names）
//: 一个参数可以有内部参数和外部参数的区别，就是外部调用时要不要写的那个参数，如上面的 arr：。默认情况下：第一个参数没有外部参数名，后面的内外一致。
//: 指定外部参数名(Specifying External Parameter Names)
//: 均可指定外部参数名：自定义或者可以用 _ 表示可以省略


func minMax(arr array: [Int], _ x: Int, t: Double) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
    if value < currentMin {
    currentMin = value
    } else if  value > currentMax {
    currentMax = value
    }
    }
    return (currentMin, currentMax)
}

minMax(arr: [1, -1, 2, 23, 934, -234], 3, t: 2.0)
minMax(arr: [], 2, t: 1.0)



//: 默认参数值（Default Parameter Values）
func someFunciton(x: Int = 11) {
    print(x)
}

someFunciton()
someFunciton(22)

//: 可变参数（Variadic Parameters）
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total
}

arithmeticMean(1, 2, 3, 32.232432, 32432.32423)
arithmeticMean(3)
arithmeticMean(1, 3)


//: 常量参数和变量参数（Constant and Variable Parameters）
func alignRight(var string: String, var totalLength: Int, pad: Character) -> String {
    totalLength++
    
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    
    for _ in 1...amountToPad {
        string = padString + string
    }
    
    return string
}

alignRight("fdsf", totalLength: 8, pad: "*")

//: 输入输出参数（In-Out Patameters）

func swapTwoInts(inout a: Int, inout _ b: Int) {
    let tmporaryA = a
    a = b
    b = tmporaryA
}

var a = 3
var b = 5
swapTwoInts(&a, &b)
a - b


//: 函数类型（Funciton Types）
//: (Int, Int) -> Int
//: () -> Void

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("Hello world!")
}

//: 使用函数类型（Using Function Types)
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 4))")

mathFunction = multiplyTwoInts
mathFunction(2, 4)

//: 函数类型作为参数类型（Function Types as Parameter Types）
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 7)

//: 函数类型作为返回类型（Function Types as Return Types）
func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


//: 嵌套函数（Nested Functions）
func chooseStepFunction1(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}

var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction1(currentValue > 0)

print("Counting to zero:")
while currentValue1 != 0 {
    print("\(currentValue1)... ")
    currentValue1 = moveNearerToZero1(currentValue1)
}
print("zero!")

