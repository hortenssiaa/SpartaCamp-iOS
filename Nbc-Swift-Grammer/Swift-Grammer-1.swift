// Swift grammer

// Tuple
// - 데이터 타입의 값들을 그룹화 하여 '하나의 타입'처럼 사용
// - 튜플 내의 값 : 순서대로 저장
let hakyung: (name: String, age: Int, major: String) = ("hakyung", 30, "iOS")
let student: [(name: String, age: Int, major: String)] = [
    ("haykung", 30, "iOS"),
    ("sam", 31, "Web"),
    ("Mei", 29, "Server")
]

print(student[1])


// Switch
// ⭐️ fallthrough
// 1
var score = 50

switch score {
case 90...:
    break
default:
    print("공부를 더 하세요!")
}

// 2
switch score {
case 50...:
    print("50점 이상이시군요!")
    fallthrough
case 50:
    print("딱 50점이시네요?")
default:
    print("공부를 더 하세요!")
}


// for
// 1. 숫자 출력: 1부터 10까지의 숫자를 출력하는 반복문을 개발하세요.
//   현재의 값이 8 이상이라면 guard를 사용하여 반복문에서 탈출해보세요.
for i in 1...10 {
    guard i < 8 else { break }
    print(i)
}

// 2. 배열 순회: 과일 배열을 순회하며 각 과일 이름을 출력하세요.
let fruits = ["사과", "바나나", "포도"]
for i in fruits {
    print(i)
}

// 3. 짝수만 출력: 1부터 20까지 숫자 중 짝수만 출력하세요.
for i in 1...20 {
    if i % 2 == 0 {
        print(i)
    }
}


// while
// 1. 숫자 감소: 10부터 1까지 숫자를 감소하며 출력하세요.
var i1 = 10
while i1 > 0 {
    print(i1)
    i1 -= 1
}

// 2. 1부터 5까지 합 구하기: 1부터 5까지의 합을 while 문으로 계산하세요.
var i = 1
var sum = 0
while i <= 5 {
    sum += i
    i += 1
}

print(sum)



// * Collection Type *
// Array

// 1. .append(contentsOf: [])
// : 배열안에 배열 추가
var array = [0, 1, 2, 3]
array.append(contentsOf: [10, 20, 30])

print(array)

// 2. Array 실습하기 : 아래를 코드로 만들어주세요!
var intArr: [Int] = []

for i in 0...10 {
    intArr.append(i)
}

intArr.append(contentsOf: [15, 20])
intArr.remove(at: 0)

for i in intArr {
    if i % 2 == 1 {
        print(i)
    }
}



// Set (집합)
// - 순서 x
// - 중복 x
// - 타입 명시!

// 1. Set 연습
var stringSet: Set<String> = []
var intSet: Set<Int> = Set()

print(stringSet.contains("a"))

intSet.insert(1)
print(intSet)


// 2. Set 실습하기 : 아래를 코드로 만들어주세요.
var setSet: Set = ["1", "2", "3"]
setSet.insert("3")

print(setSet)

let isFourContain = setSet.contains("4")
print(isFourContain)

setSet.remove("1")
print(setSet)




// Dictionary
// - 순서 x
// - key:value
// - key 중복 x

// 1. Dictionary 실습하기 : 아래의 코드를 만들어주세요.
var dictionary = [String: String]()
//var dictionary: [String: String] = [:]
dictionary["A"] = "Apple"
dictionary["B"] = "Banana"
print(dictionary["A"])

dictionary["A"] = "Avocado"
print(dictionary["A"])

print(dictionary.count)




// Closure (aka. 이름없는 함수)
/*
 1. data type 으로 사용하는 경우
   - 파라미터 타입 없는 경우; () -> Void
   - Optional 타입 사용 가능
     - (() -> Void)?
     let optionalClosure: ((Int) -> Int)?
 */

// 1. 파라미터는 튜플타입 (Int, String), 반환타입은 없음!
let closure: (Int, String) -> Void = { intValue, stringValue in
    print(intValue)
    print(stringValue)
}
closure(40, "이거 읽어봐")


// 2. 파라미터의 이름을 생략하면 구현부에서 $0로 사용할 수 있습니다.
let closure2: (Int) -> Void = {
    print($0)
}
closure2(1004)


// 3. 파라미터 없는 클로저
let closure3: () -> Void = {
    print("Hello!")
}
closure3()


// 4. 파라미터 Int, output Int
let closure4: (Int) -> Int = { value in
    return value * 2
}
print(closure4(10))


// 5. 튜플타입의 파라미터로, 파라미터 이름생략 & $0 사용하기
let closure5: (String, Int) -> Int = {
    return $0.count + $1
}
print(closure5("200", 3))



// 6. Optional Closure
let optionalClosure: ((Int) -> Int)? = { value in
    return value * 2
}
print(optionalClosure!(40))


// 7. 파라미터가 없을 때는 in을 사용하면 안됩니다.
let emptyParameterClosure: () -> Void = {
    print("Hello Im Emmpty")
}
emptyParameterClosure()



// 8.
// 1️⃣  아래의 조건에 맞는 기본 클로저를 만들어보세요.
// - minusClosure 상수의 타입은 (Int, Int) → Int 입니다.
// - 클로저 구현부는 두개의 Int값을 받아서 뺀 뒤 반환합니다.
// - minusClosure 상수를 호출해보세요.
let minusClosure: (Int, Int) -> Int = { v1, v2 in
    return v1 - v2
}
print(minusClosure(10, 20))

// 2️⃣  1번에서 만든 클로저에 파라미터 이름을 생략해보세요.


let minusClosure2: (Int, Int) -> Int = {
    return $0 - $1
}
print(minusClosure2(50, 10))



// 9. Trailing Closire
// : 경량화 방법 중 하나.
func trailingCloure(key: String, closure: () -> Void) {
    print(key)
    closure() // ⭐️
}

// (1) 클로저가 마지막 파라미터일때, 이어서 작성
trailingCloure(key: "trailing Closure Test1", closure: {
    print("The Closure in 'trailing Closure Test1'")
})

// (2) 클로저 구현이 길어지는 경우, 클로저함수호출 외부에 작성하여, 가독성 높이기
trailingCloure(key: "trailing Closure Test2") {
    print("Second trailing Closure")
}


// 자료구조 : Stack, Queue
// >> Array, Set 등의 메모리를 더 효율적으로 활용하기 위해
