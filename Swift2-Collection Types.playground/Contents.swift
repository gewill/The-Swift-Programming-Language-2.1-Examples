//: Playground - noun: a place where people can play

import UIKit

//数组
var array1 = [Double](count: 3, repeatedValue: 4.3)
print(array1)

var array2 = array1 + array1

if array1.isEmpty {
  print("array1 is empty.")
} else {
  print("array1 is not empty, have \(array1.count) numbers.")}

array1.insert(3.2, atIndex: 0)

print(array1)

for item in array1 {
  print(item)
}

//集合
var letters = Set<Character>()
letters.insert("a")
letters = []
var set1: Set<String> = ["aaa", "b"]
var set2: Set  = ["aaa", "b"]
set2.count
set2.insert("33")
set2.remove("b")
set2
for genre in set2.sort() {
  print(genre)
}

set1.union(set2)
set1.subtract(set2)
set1.exclusiveOr(set2)
set1.intersect(set2)

let set3: Set<String>  = ["33"]

set3.isDisjointWith(set2)
set3.isStrictSubsetOf(set2)
set3.isSubsetOf(set2)


//字典
var dict = [Int: String]()
dict[12] = "12222"
dict = [:]
dict = [12: "1222", 23: "232423", 322: "23dsfsaf"]
for (num, value) in dict {
  print("\(num) is \(value)")
}
dict[12] = "tw"

for value in dict.values {
  print(value)
}

//控制流
var i = 3
while i < 0  {
  print(1)
}

//元组
let somePoint = (0, 1)

switch somePoint {
case (0, 0):
  print("0")
case (_, 0):
  print("is on the x-axis")
case (0, _):
  print("is on the y-axis")
default:
  print("is outside of the box")
}


//检测API是否可用
if #available(iOS 9, *) {
  print(2)
} else {
  print(1)
}

//if
var temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
//


//switch 默认遇到符合case，立即终止
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
//

//where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
//

//Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
  switch character {
  case "a", "e", "i", "o", "u", " ":
    continue
  default:
    puzzleOutput.append(character)
  }
}
print(puzzleOutput)
// prints "grtmndsthnklk”

//break
let numberSymbol: Character = "二"  // Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
  possibleIntegerValue = 1
case "2", "٢", "二", "๒":
  possibleIntegerValue = 2
  print("test")
  break
case "3", "٣", "三", "๓":
  possibleIntegerValue = 3
case "4", "٤", "四", "๔":
  possibleIntegerValue = 4
default:
  break
}
if let integerValue = possibleIntegerValue {
  print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
  print("An integer value could not be found for \(numberSymbol).")
}
// prints "The integer value of 三 is 3."

//Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
  
default:
    description += " an integer."
}
print(description)
//

//提前退出
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name": "John"])
// prints "Hello John!"
// prints "I hope the weather is nice near you."
greet(["name": "Jane", "location": "Cupertino"])
// prints "Hello Jane!"
// prints "I hope the weather is nice in Cupertino."
