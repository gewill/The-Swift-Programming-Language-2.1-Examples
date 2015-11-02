//: Playground - noun: a place where people can play

import UIKit

//: 枚举语法，成员类型为CompassPoint，而非1.2.3.4
enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Something {
    case One, Two
}

var directionToHead = CompassPoint.West

//: 相关值（Associated Values）存储相关信息如何条形码和二维码相关信息

enum BarCode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = BarCode.UPCA(8, 21212, 3223, 3)
productBarcode = BarCode.QRCode("AAAAAAAAA")

//: Switch 可以定义相关值的变量或常量的名称
switch productBarcode {
case .UPCA(let a, let b, let c, let d):
    print("\(a + b + c + d)")
case .QRCode(let e):
    print(e)
}

//: 原始值（Raw Values）
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
print(ASCIIControlCharacter.Tab)
print(ASCIIControlCharacter.Tab.rawValue)

//: 隐式赋值0...n，但仅仅是原始值
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Nepture
}

print(Planet.Earth)
print(Planet.Earth.rawValue)
let possiblePlanet = Planet(rawValue: 4)
let possiblePlanet1 = Planet(rawValue: 9)


//: 递归枚举（Recursive Enumerations）
indirect enum AE {
    case Number(Int)
    case Addition(AE, AE)
    case Multiplicaiton(AE, AE)
}

//: 函数也是一个递归函数
func evaluate(expression: AE) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplicaiton(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

//: 计算 5 + （4 * 7）
let exp = AE.Addition(AE.Number(5), AE.Multiplicaiton(AE.Number(4), AE.Number(7)))
print(evaluate(exp))

