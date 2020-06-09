import Foundation

/** Map */
let numbers = [1, 2, 3, 4, 5]

// Without Higher order function
var resultMapArray = [Int]()

for number in numbers {
    resultMapArray.append(number * 2)
}
print(resultMapArray)

/**
 At first we initialize a new array specifying the data type of its elements, then we implement the loop where each number from the first array is being doubled and appended to the new one, and finally we print the array to the console so we can see the results
 */

//With Higher order function
let doubledArray = numbers.map({ (value) -> Int in
  return value * 2
})
print(doubledArray)

// Short Hand Argument apporach (sh)
let shDoubledArray = numbers.map {$0 * 2}
print(doubledArray)

// Map on dictionary
let info:[String: String] = ["name": "pranav", "location": "frankfurt", "job": "iOS Developer"]
let array = info.map { $0 }
print(array)

// Creating dictinary from map results (array of tuples)
let newInfo = Dictionary(uniqueKeysWithValues: array)
print(newInfo)

let transformArray = info.map { ($0.key.uppercased(),$0.value.capitalized) }
print(transformArray)

//Another way to to this
let updatedKeysAndValues = info.map { ($0.uppercased(), $1.capitalized) }
print(updatedKeysAndValues)

    
let capitalizedInfo = Dictionary(uniqueKeysWithValues: info.map { ($0.uppercased(), $1.capitalized) } )
print(capitalizedInfo)


//Maps values:
let updatedInfo = info.mapValues { $0.capitalized }
print(updatedInfo)


//Compact map:
let numbersWithNil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]
let numbersWithoutNil = numbersWithNil.compactMap {$0}
print(numbersWithoutNil)
//var doubledNums = numbersWithNil.map { $0! * 2 } // This will crash
let doubledNums = numbersWithNil.compactMap { $0 != nil ? $0! * 2 : nil }
print(doubledNums)

//FlatMap:
let collection = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]

//Without HFO
var singleArray = [Int]()
for marksArray in collection {
    singleArray += marksArray
}
print(singleArray)

//With Flat map
let oneDArray = collection.flatMap { (array) -> [Int] in
    return array
}

print(oneDArray)

// Short Hand Argument apporach
let shOneDArray = collection.flatMap { $0 }
print(shOneDArray)


let valuesWithNil = [[2, nil, 5], [4, 3, nil], [nil, nil, 1]]
let resultArray = valuesWithNil.flatMap { $0 }
 
print(resultArray)


//Filter
let numberArray = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

//Filter number more than 10
//Without HOF

var over10 = [Int]()
 
for number in numbers {
    if number > 10 {
        over10.append(number)
    }
}
print(over10)

// with Filter

var filteredArray = numberArray.filter { (number) -> Bool in
    return number > 10
}
print(filteredArray)

//Short hand argument approach
filteredArray = numbers.filter { $0 > 10 }
print(filteredArray)

let filterCount = numbers.filter {$0 > 10 } .count
print(filterCount)

let maxNumber = numbers.filter { $0 > 10 } .max()
print(maxNumber)


// Reduce:resultArray

// Without Higher order filter
var product = 1
for number in numberArray {
    product *= number
}
print(product)

// Reduce
// 1. arg is like product and second number.
product = numberArray.reduce(1) { (partialResult, number) -> Int in
    return partialResult * number
}


//Reduce on dictionary
let friendsAndMoney = ["Alex": 150.00, "Tim": 62.50, "Alice": 79.80, "Jane": 102.00, "Bob": 94.20]
let totalSpending = friendsAndMoney.reduce(0, { $0 + $1.value })
print(totalSpending)



// ForEach:
for number in numberArray {
    number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is odd")
}

// With higher order function
numberArray.forEach { $0.isMultiple(of: 2) ? print("\($0) is even") : print("\($0) is odd") }



let NilNumbers = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]
for number in numbersWithNil {
    guard let number = number else {
        print("Found nil")
        continue
    }
    print("The double of \(number) is \(number * 2)")
}

NilNumbers.forEach { (number) in
    guard let number = number else {
        print("Found nil")
        return
    }
    print("The double of \(number) is \(number * 2)")
}


var containsLessThan5 = false
for number in numberArray {
    if number < 5 {
        containsLessThan5 = true
        break
    }
}


let hasNumbersLessThan5 = numberArray.contains { (number) -> Bool in
    return number < 5
}
 
print("Has small numbers? :", hasNumbersLessThan5)


//Short hand
    
let hasNumbersLessThan5_1 = numberArray.contains { $0 < 5 }
print(hasNumbersLessThan5_1)

// Remove All
var randomNumberArray = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

randomNumberArray.removeAll { (number) -> Bool in
    return number < 10
}

//Shorthand argument apporach
randomNumberArray.removeAll { $0 < 10 }


//Split
let message = "Hello World!"
 
let result = message.split { (char) -> Bool in
    return char == " "
}
 
print(result)

//Shorthand
let resultShortHand = message.split { $0 == " " }

let anotherMessage = "This message is going to be broken in pieces!"
 
let splitOnce = anotherMessage.split(maxSplits: 1, whereSeparator: { $0 == " " })
 
print(splitOnce)


let emptySequences = anotherMessage.split(omittingEmptySubsequences: false, whereSeparator: { $0 == " " })
 
print(emptySequences)


let resu = message.split { $0 == " " }
print(resu)
// Prints ["Hello", "World!"]
 
// result type is [String.SubSequence]
 
// Create String values from substrings.
let allStrings = resu.map { String($0) }
 
print(allStrings)
// Prints ["Hello", "World!"]
// allStrings type is [String]

let paragraph = "This paragraph will be separated in parts. Based on the periods and the exclamation mark! There will be three strings!"
 
let sentences = paragraph.split { $0 == "." || $0 == "!" }
 
print(sentences)
