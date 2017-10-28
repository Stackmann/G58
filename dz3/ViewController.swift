//
//  ViewController.swift
//  dz3
//
//  Created by Eric on 10/27/17.
//  Copyright © 2017 Piligrim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Блок Easy. Задание 1")
        eraseAllElementsOfArray()
        print("=============================================")

        print("Блок Easy. Задание 2")
        addTwoArray()
        print("=============================================")

        print("Блок Easy. Задание 3")
        let array1 = ["Oleg","Tamara","Sergey","Lena"]
        printAllElementsOfArray(array: array1)
        print("=============================================")

        print("Блок Easy. Задание 4")
        let array2 = ["Oleg","Tamara","Sergey","Lena"]
        print("Source array is \(array2)")
        print("Transform array is \(transformArray(array: array2))")
        print("=============================================")
        
        print("Блок Easy. Задание 5")
        changeDictionaryOne()
        print("=============================================")

        print("Блок Easy. Задание 6")
        let ages = ["John" : 18, "Eric" : 32, "Liza" : 21]
        print("Source dictionary is \(ages)")
        removeElementFromDictionary(dictSource: ages, key: "Liza")
        print("=============================================")

        print("Блок Hard. Задание 1")
        let array3 = ["Oleg","Tamara","Sergey","Lena"]
        print("Source array is \(array3)")
        if isStringInArray(arraySource: array3, value: "Lena") {
            print("String Lena is present")
        } else {
            print("String Lena is absent")
        }
        print("=============================================")
        
        print("Блок Hard. Задание 2")
        let agesTwo = ["John" : 18, "Eric" : 32, "Liza" : 21, "Mike" : 10]
        print("Source dictionary is \(agesTwo)")
        print("Keys of dictionary are ")
        printAllKeysOfDictionary(dictSource: agesTwo)
        print("Values of dictionary are ")
        printAllValuesOfDictionary(dictSource: agesTwo)
        print("=============================================")

    }


    /// Блок Easy.
    //Задание 1. Создать массив со значениями типа Int. Выполнить удаление всех элементов массива.
    
    func eraseAllElementsOfArray() {
        var anyArray = [1, 2, 3, 4]
        print("Full array \(anyArray)")
        anyArray.removeAll()
        print("Empty array \(anyArray)")
    }

    /// Блок Easy.
    //Задание 2. Создать 2 массива со значениями типа Int. Сделать соединение данных массивов. Результат вывести в консоль.
    
    func addTwoArray() {
        let firstArray = [1, 2, 3, 4]
        let secondArray = [10, 20, 30, 40]
        print("First array \(firstArray)")
        print("Second array \(secondArray)")
        let addArray = firstArray + secondArray
        print("Add array \(addArray)")
    }

    /// Блок Easy.
    //Задание 3. Создать массив с любыми значениями типа строка. Создать метод который будет принимать как аргумент массив. Метод должен выводить в консоль элементы массива (по одному в одной строке)
    
    func printAllElementsOfArray(array: Array<String>) {
        for element in array {
            print(element)
        }
    }
    
    /// Блок Easy.
    //Задание 4. Создать массив с любыми значениями типа строка. Создать метод который будет принимать как аргумент массив. Метод должен возвращать массив который состоит из первого и последнего элемента массива, который был параметром
    
    func transformArray(array: Array<String>) -> Array<String> {
        let firstElement = array[array.startIndex]
        let lastElement = array[array.endIndex-1]
        let newArray = [firstElement, lastElement]
        return newArray
    }

    /// Блок Easy.
    //Задание 5. Создать словарь в котором ключ будет Строкой а значение Целым. Например ключ - имя, значение - возраст. Должно быть 3 элемента (3 пары).
    //Добавить в данный словарь еще 2 новых элемента.
    
    func changeDictionaryOne() {
        var ages = ["John" : 18, "Eric" : 32, "Liza" : 21]
        print("Source dictionary is \(ages)")
        ages["Roman"] = 43
        ages["Oleg"] = 40
        print("Result dictionary is \(ages)")
    }
    
    /// Блок Easy.
    //Задание 6. Создать словарь в котором ключ будет Строкой а значение Целым. Например ключ - имя, значение - возраст. Должно быть 3 элемента (3 пары).
    //Создать метод который будет иметь 2 параметра: словарь (типа “Строка : Целое”) и ключ типа Строка. Данный метод должен удалить из полученного (как первый аргумент) словаря элемент ключ которого был передан (как второй аргумент).
    
    func removeElementFromDictionary(dictSource: Dictionary<String, Int>, key: String) {
        var dictResult = dictSource
        dictResult.removeValue(forKey: key)
        print("Complete dictionary is \(dictResult)")

    }

    /// Блок Hard.
    //Задание 1. Создать метод который принимает 2 аргумента: массив строк и просто строку. Метод возвращает true или false в зависимости есть ли данный элемент (тот второй аргумент, который строка) в массиве (тот первый аргумент, который массив строк).
    //например массив
    //let array = [“one”, “two”]
    //и если передать в этот метод “one“ то должно вернуть true
    //а если передать “three” то должно вернуть false
    
    func isStringInArray(arraySource: Array<String>, value: String) -> Bool {
         return arraySource.contains(value)
    }

    //Задание 2. метод который выведет все ключи словаря
    
    func printAllKeysOfDictionary(dictSource: Dictionary<String, Int>) {
        for key in dictSource.keys {
            print(key)
        }
    }

    //метод который выведет все значения словаря

    func printAllValuesOfDictionary(dictSource: Dictionary<String, Int>) {
        for value in dictSource.values {
            print(value)
        }
    }

    //Задание 3. сортировка массива не встроенным методом по возрастанию + удалить дубликаты
    //Например задается массив [3, 6, 1, 2, 2, 6, 13, 77, 36]
    //Результат должен быть [1, 2, 3, 6, 13, 36, 77]
    
    func getFormatedNumber(number: Int) -> String {
        let numberString = String(number)
        var formatedNumber = ""
        var index = numberString.endIndex
        for i in 1...numberString.count {
            index = numberString.index(before: index)
            formatedNumber.insert(numberString[index], at: formatedNumber.startIndex)
            if i % 3 == 0 {
                formatedNumber.insert(",", at: formatedNumber.startIndex)
            }
        }
        return formatedNumber
    }

    //Задание 4. Во ViewDidLoad создать словарь внутри которого будет 2 словаря (ключ - строка, значение - словарь). С любыми данными. Их мы будем передавать в метод, который напишем.
    //Создать метод который будет принимать как параметры: словарь (такого типа как выше) и строку. Данный метод должен вернуть значение которое хранится внутри элемента ключ которого был передан как аргумент.

    
    func checkPasswordComplicated(password: String) {
        var isDigitPresent = false
        var isUperLetterPresent = false
        var isLowerLetterPresent = false
        var isSpecialCharacterPresent = false
        var countCheckOK = 0
        var resultDescription = ""
        let decimalString = "0123456789"
        let specialSymbolString = "\\\'\"`˜!@#№$%ˆ&*()-=+/[]{}.,:;?<>"
        for c in password {
            let letter = String(c)
            if isDigitPresent == false, decimalString.contains(c) {
                countCheckOK += 1
                resultDescription += " a)"
                isDigitPresent = true
            }
            if isUperLetterPresent == false, letter.uppercased() == letter, c != "\u{0020}" {
                countCheckOK += 1
                resultDescription += " b)"
                isUperLetterPresent = true
            }
            if isLowerLetterPresent == false, letter.lowercased() == letter, c != "\u{0020}" {
                isLowerLetterPresent = true
                countCheckOK += 1
                resultDescription += " c)"
            }
            if isSpecialCharacterPresent == false, specialSymbolString.contains(c) {
                countCheckOK += 1
                resultDescription += " d)"
                isSpecialCharacterPresent = true
            }
        }
        if password.count >= 8 {
            countCheckOK += 1
            resultDescription += " e)"
        }
        if countCheckOK == 0 {
            print("The password is empty!!!")
        } else {
            print("\(password) - \(countCheckOK)\(resultDescription)")
        }
    }

}

