// : Playground - noun: a place where people can play

import UIKit

//: 构造过程（Initialization）

//: 通过定义构造器（Initializers）来实现构造过程，这些构造器可以看做是用来创建特定类型新实例的特殊方法。与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。

//: 类的实例也可以通过定义析构器（deinitializer）在实例释放之前执行特定的清除工作。想了解更多关于析构器的内容，请参考析构过程。

//: 类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

struct Fahrenheit1 {
    var temperature = 32.0
}

//: 如果你在定义构造器时没有提供参数的外部名字，Swift 会为构造器的每个参数自动生成一个跟内部名字相同的外部名。

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let green = Color(red: 1, green: 1, blue: 1)

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0)

//: 可选类型的属性将自动初始化为nil，表示这个属性是有意在初始化时设置为空的。

//: 如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift 会给这些结构体或类提供一个默认构造器（default initializers）。这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例。

class ShoppingListItem {
    var name: String?
    var quantity = 1
}

var item = ShoppingListItem()

//: 结构体的逐一成员构造器

struct Size {
    var width = 0.0, height = 0.0
}

let size = Size(width: 3, height: 4)

//: 构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()

    init() { }

    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let rect = Rect(origin: Point(x: 3, y: 3), size: Size(width: 5, height: 6))
let rect1 = Rect(center: Point(), size: Size(width: 4, height: 4))

//: 如果你想用另外一种不需要自己定义init()和init(origin:size:)的方式来实现这个例子，请参考扩展。

//: Swift 为类类型提供了两种构造器来确保实例中所有存储型属性都能获得初始值，它们分别是指定构造器和便利构造器。

//: 两段式构造过程: Swift 中类的构造过程包含两个阶段。第一个阶段，每个存储型属性被引入它们的类指定一个初始值。当每个存储型属性的初始值被确定后，第二阶段开始，它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性。

//: Swift 的两段式构造过程跟 Objective-C 中的构造过程类似。最主要的区别在于阶段 1，Objective-C 给每一个属性赋值0或空值（比如说0或nil）。Swift 的构造流程则更加灵活，它允许你设置定制的初始值，并自如应对某些属性不能以0或nil作为合法默认值的情况。

//阶段 1
//
//某个指定构造器或便利构造器被调用。
//完成新实例内存的分配，但此时内存还没有被初始化。
//指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化。
//指定构造器将调用父类的构造器，完成父类属性的初始化。
//这个调用父类构造器的过程沿着构造器链一直往上执行，直到到达构造器链的最顶部。
//当到达了构造器链最顶部，且已确保所有实例包含的存储型属性都已经赋值，这个实例的内存被认为已经完全初始化。此时阶段 1 完成。
//阶段 2
//
//从顶部构造器链一直往下，每个构造器链中类的指定构造器都有机会进一步定制实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
//最终，任意构造器链中的便利构造器可以有机会定制实例和使用self。

//: 构造器的继承和重写

//跟 Objective-C 中的子类不同，Swift 中的子类默认情况下不会继承父类的构造器。Swift 的这种机制可以防止一个父类的简单构造器被一个更专业的子类继承，并被错误地用来创建子类的实例。
//你在子类中“重写”一个父类便利构造器时，不需要加override前缀。
//当你在编写一个和父类中指定构造器相匹配的子类构造器时，你实际上是在重写父类的这个指定构造器。因此，你必须在定义子类构造器时带上override修饰符。

//: 构造器的自动继承

//如上所述，子类在默认情况下不会继承父类的构造器。但是如果满足特定条件，父类构造器是可以被自动继承的。在实践中，这意味着对于许多常见场景你不必重写父类的构造器，并且可以在安全的情况下以最小的代价继承父类的构造器。
//
//假设你为子类中引入的所有新属性都提供了默认值，以下 2 个规则适用：
//
//规则 1
//
//如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器。
//
//规则 2
//
//如果子类提供了所有父类指定构造器的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承所有父类的便利构造器。
//
//即使你在子类中添加了更多的便利构造器，这两条规则仍然适用。
//对于规则 2，子类可以将父类的指定构造器实现为便利构造器。

//简单总结就是：None or All

//: 指定构造器和便利构造器实践

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

//All
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

//None
class ShoppingListItem1: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

//: 可失败构造器

//创建自定义的可选类型
//如果一个类、结构体或枚举类型的对象，在构造过程中有可能失败，则为其定义一个可失败构造器。这里所指的“失败”是指，如给构造器传入无效的参数值，或缺少某种所需的外部资源，又或是不满足某种必要的条件等。

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Gigg")
print(someCreature)

//枚举类型的可失败构造器

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

//带原始值的枚举类型会自带一个可失败构造器init?(rawValue:)，该可失败构造器有一个名为rawValue的参数，其类型和枚举类型的原始值类型一致，如果该参数的值能够和某个枚举成员的原始值匹配，则该构造器会构造相应的枚举成员，否则构造失败。

enum TemperatureUnit1: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit1 = TemperatureUnit1(rawValue: "K")
if fahrenheitUnit1 != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

//: 类的可失败构造器

//值类型（也就是结构体或枚举）的可失败构造器，可以在构造过程中的任意时间点触发构造失败。比如在前面的例子中，结构体Animal的可失败构造器在构造过程一开始就触发了构造失败，甚至在species属性被初始化前。

//而对类而言，可失败构造器只能在类引入的所有存储型属性被初始化后，以及构造器代理调用完成后，才能触发构造失败。

//这个很好理解因为继承和构造器代理调用的原因，只能在最后一步判断是否构造失败

class Product {
    let name: String!
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

//可失败构造器也可以代理到其它的非可失败构造器。通过这种方式，你可以增加一个可能的失败状态到现有的构造过程中。

//如同其它的构造器，你可以在子类中重写父类的可失败构造器。或者你也可以用子类的非可失败构造器重写一个父类的可失败构造器。这使你可以定义一个不会构造失败的子类，即使父类的构造器允许构造失败。
//你可以用非可失败构造器重写可失败构造器，但反过来却不行。

class Document {
    var name: String?

    init() { }

    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

class AutomoticallyNamedDocument: Document {

    override init() {

        super.init()
        self.name = "[Untitiled]"
    }

    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitiled]"
        } else {
            self.name = name
        }
    }
}

let newDoc = AutomoticallyNamedDocument()
newDoc.name

//你可以在init?中代理到init!，反之亦然。你也可以用init?重写init!，反之亦然。你还可以用init代理到init!，不过，一旦init!构造失败，则会触发一个断言

//: 必要构造器

//在类的构造器前添加required修饰符表明所有该类的子类都必须实现该构造器

//: 通过闭包或函数设置属性的默认值

//提供了一种便利

class SomeClass {
    let someProperty: String = {
        // 在这个闭包中给 someProperty 创建一个默认值
        // someValue 必须和 SomeType 类型相同
        return "Lee"
    }()
}

let some = SomeClass()
some.someProperty

struct Checkerboard {
    let boardColors: [Bool] = {

        var tempColors = [Bool]()
        var isBlack = false

        for i in 1 ... 10 {

            for j in 1 ... 10 {
                tempColors.append(isBlack)
                isBlack = !isBlack
            }

            isBlack = !isBlack
        }

        return tempColors
    }()
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
board.squareIsBlackAtRow(0, column: 10) //bug 此处仅为示范代码
