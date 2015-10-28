//: Playground - noun: a place where people can play

import UIKit

//: 闭包是自包含的函数代码块

//: Swift 的闭包表达式有简洁的风格，带来很多便利：利用上下文类型推断/隐式返回单表达式/参数名缩写/尾随

//: 闭包表达式（Closure Expressions）
//: { (parameters) -> returnType in statements }

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversed = names.sort( { (s1: String, s2: String) -> Bool in return s1 > s2 } )
print(reversed)

//: 根据上下文推断类型（Inferring Type From Context）
reversed = names.sort( { s1, s2 in return s1 > s2 } )
print(reversed)

//: 单表达式闭包隐式返回（Implicit Return From Single-Expression Closures），但是表达不够直接不建议
reversed = names.sort( { s1, s2 in s1 > s2 } )
print(reversed)

//: 参数名缩写（shorthand Argument Names）,简洁到这种形式还叫闭包？
reversed = names.sort( { $0 > $1 } )
print(reversed)

//: 运算符函数（Operator Functions）, 到这个时候就完全是Swift来推断或者来猜了，而作为代码给人看过于抽象化了
reversed = names.sort(>)

//: 尾随闭包（Trailing Closures），就是把闭包的大括号放在小括号外面，形式上更像一个函数，或者结构上大段的闭包放在后面更符合一般的书写习惯而已，这个用法是一个语法糖，避免头重脚轻。让懂的人看的舒服，不懂的人可能莫名其妙。记得Swfit调用 AFNetworking 就会智能补全成尾随闭包。
func someFunction(closure: () -> Void) {
    // function do something
}

someFunction ( {
    // closure do something
} )

// Magic Time
someFunction() {
    // closure can alse do something at here
}

reversed = names.sort() { $0 > $1 }
print(reversed)


//: 捕获值（Capturing Values）
//: 闭包是引用类型（Closure Are Reference Types），函数和闭包都可以赋值给变量或常量
