//: Playground - noun: a place where people can play

import UIKit

//: 类和结构体对比
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: 类和结构体实例 
//: 一个引用类型一个值类型 Classes are reference types, Structures and Enumerations are value types

let someResolution = Resolution()
let someVideoMode = VideoMode()

someResolution.height
someVideoMode.frameRate
someVideoMode.resolution.height

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.height = 3096
cinema.width
hd
let tenEighty = VideoMode()
var asloTenEighty = tenEighty
asloTenEighty.frameRate = 30.0
tenEighty.frameRate


//: 恒等运算符 Identity Operators : === !==
if tenEighty === asloTenEighty {
    print("These two variables refer to the same instance")
}

//: 指针 Pointers 
//: Swift指针类型不用带 *

//: 类和结构体的选择: 结构体适合存储简单数据值和拷贝行为, 不需要继承另一个类型属性或者行为

//: String/Array/Dictionary 类型的赋值和复制行为：Assignment and copy behaviors on Strings, Arrays and Dicitonaries

//: Swift 均以结构体形式实现，值拷贝，但是处于性能优化，只哟确有必要时才会实际执行拷贝；Objective-C是类，传递的是实例的引用。



