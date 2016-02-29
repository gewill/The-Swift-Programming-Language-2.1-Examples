//: Playground - noun: a place where people can play

import UIKit

//: 方法（Methods）
//: 方法是与某些特定类型相关联的函数。类、结构体、枚举都可以定义实例方法；实例方法为给定类型的实例封装了具体的任务与功能。类、结构体、枚举也可以定义类型方法；类型方法与类型本身相关联。类型方法与 Objective-C 中的类方法（class methods）相似。

//: 实例方法 (Instance Methods)
//: 实例方法是属于某个特定类、结构体或者枚举类型实例的方法。实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能。实例方法的语法与函数完全一致.

//: self 属性(The self Property)
//: 类型的每一个实例都有一个隐含属性叫做self，self完全等同于该实例本身。


//: 在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)
//: 结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中。方法还可以给它隐含的self属性赋值一个全新的实例，这个新实例在方法结束后将替换原来的实例。
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 3.0, y: 3.0)
somePoint.moveByX(2.0, y: 3.0)


//: 在可变方法中给 self 赋值(Assigning to self Within a Mutating Method)
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point1(x: x + deltaX, y: y + deltaY)
    }
}
//: 这里不仅仅学习一个语法，而是思考为什么费劲把默认不可变的枚举变成可变，是因为提供一个可能结合枚举特性，写出简洁表达能力强的代码。 
//: Ash Furrow: Ideas vs Syntax. Watch video here: https://youtu.be/YsUTuwpbURA
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off: self = Low
        case Low: self = High
        case High: self = Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()
//: 类型方法 (Type Methods)

//: 实例方法是被类型的某个实例调用的方法。你也可以定义类型本身调用的方法，这种方法就叫做类型方法。声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。类可能会用关键字class来允许子类重写父类的方法实现。


//: 在 Objective-C 中，你只能为 Objective-C 的类定义类型方法（type-level methods）。在 Swift 中，你可以为所有的类、结构体和枚举定义类型方法。每一个类型方法都被它所支持的类型显式包含。

class SomeClass {
    static func someTypeMethod() {
        // Do something
        print("This is a type method")
    }
}
SomeClass.someTypeMethod()


//: 下面的例子定义了一个名为LevelTracker结构体。它监测玩家的游戏发展情况（游戏的不同层次或阶段）
//: 也就是定结构体类型方法的用途，可以直接把逻辑加到定义的数据类型中

struct LevelTracker {
    static var highestunlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestunlockedLevel { highestunlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestunlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playName: String
    func compeletedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name:String) {
        playName = name
    }
}


var player = Player.init(name: "Will")
player.compeletedLevel(4)
print(LevelTracker.highestunlockedLevel)

player = Player.init(name: "Ge")
if player.tracker.advanceToLevel(6) {
    print("Level 6 has been unlocked.")
} else {
    print("Level 6 has not yet been unlocked.")
}
