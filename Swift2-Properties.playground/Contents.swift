//: Playground - noun: a place where people can play

import UIKit

//: 属性将值和特定的类、结构或枚举关联。存储属性存储常量或变量作为实例的一部分，而计算属性计算一个值。计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体。


//: 存储属性（Stored Properties）
struct FiexdLengthRange {
    var firstValue: Int
    let length: Int
}

var x = FiexdLengthRange(firstValue: 1, length: 3)
x.firstValue = 4

//: 常量结构体的存储属性均为常量
let y = FiexdLengthRange(firstValue: 4, length: 2)


//: 延迟存储属性
class DataImporter {
    var firstName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("New")
manager.data.append("Two")


//: 存储属性没有实例变量，属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。


//: 计算属性（Computed Properties）: 除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        mutating get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
    }
}


var rect0 = Rect(origin: Point(), size: Size(width: 3.0, height: 4.0))
rect0.center
rect0.center = Point(x: 50, y: 50)
rect0.center

//: 只读计算属性（Read-Only Computed Properties）
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
Cuboid(width: 4.0, height: 5.0, depth: 2.0).volume


//: 属性观察器（Property Observers）
//: 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新值和当前值相同的时候也不例外。不需要为非重写的计算属性添加属性观察器，因为可以通过它的 setter 直接监控和响应值的变化。

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotolSteps) {
            if totalSteps != newTotolSteps {
                print("The totalSteps will change value to \(totalSteps).")
            }
        }
        didSet {
            if totalSteps > oldValue {
                print("The totalSteps add \(totalSteps - oldValue) steps. ")
            }
        }
    }
}

StepCounter().totalSteps = -33
var stepCounter = StepCounter()
stepCounter.totalSteps = 33
stepCounter.totalSteps = 11



//: 全局变量和局部变量（Global and Local Variables）
//: 全局的常量或变量都是延迟计算的，跟延迟存储属性相似，不同的地方在于，全局的常量或变量不需要标记lazy修饰符。局部范围的常量或变量从不延迟计算。


//: 类型属性（Type Properties）
//: 使用关键字static/class来定义类型属性，必须指定默认值，延迟初始化的。类型属性是通过类型本身来访问

struct SomeStructure {
    static var storedTypedProperty = "some value"
    static var computedTypedProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypedProperty = "some value"
    static var computedTypedProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypedProperty = "some value"
    static var computedTypedProperty: Int {
        return 7
    }

    class var overrideableComputedTypeProperty: Int {
        return 109
    }
}


struct AudioChannel {
    static let threshoudLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.threshoudLevel {
                currentLevel = AudioChannel.threshoudLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

