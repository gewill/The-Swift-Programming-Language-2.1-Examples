//: Playground - noun: a place where people can play

import UIKit

//: 元组（Tuples）把多个值组合成一个复合值，类似数组加字典混合体
let http404Error = (404, "Not Found")

//: 可以分解取值
let (statusCode, statusMessage) = http404Error
//: 下标访问
http404Error.0
//: 单个元素命名
let http200Status = (statusCode: 200, description: "OK")
http200Status.description


//: nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

//: 声明可选的变量或常量，没有赋值则自动设置nil
var surveyAnswer: String?

//: if语句和强制解析
let convertedNumber = Int("1")

if convertedNumber != nil {
    print(convertedNumber!)
}

//: 可选绑定（Optional Binding）
if let actualNumber = Int("32431") {
    print(actualNumber)
}

//: 隐式解析可选类型: 你可以把隐式解析可选类型当做一个可以自动解析的可选类型。你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值的可选名字的结尾。
let possibleString: String? = "An apple"
let forcedString: String = possibleString!

let assumedString: String! = ""
let implicitString: String = assumedString

//: 错误处理（error handling）
func canThrowAnErrow() throws {
    
}

do {
    try canThrowAnErrow()
} catch {
    
}

