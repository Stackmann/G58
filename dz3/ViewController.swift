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
        let newArray = [array[array.startIndex] , array[array.endIndex]]
        return newArray
    }

    /// Блок Easy.
    //Задание 5. Создать словарь в котором ключ будет Строкой а значение Целым. Например ключ - имя, значение - возраст. Должно быть 3 элемента (3 пары).
    //Добавить в данный словарь еще 2 новых элемента.

    
    func getSexOfHuman(name: String) -> Character {
        if name.hasSuffix("ич") || name.hasSuffix("ИЧ") || name.hasSuffix("Ич") || name.hasSuffix("иЧ") {
            return "М"
        } else if name.hasSuffix("на") || name.hasSuffix("НА") || name.hasSuffix("На") || name.hasSuffix("нА") {
            return "Ж"
        } else {
            return "?"
        }
        
    }
    
    /// Блок Easy.
    //Задание 6. Создать словарь в котором ключ будет Строкой а значение Целым. Например ключ - имя, значение - возраст. Должно быть 3 элемента (3 пары).
    //Создать метод который будет иметь 2 параметра: словарь (типа “Строка : Целое”) и ключ типа Строка. Данный метод должен удалить из полученного (как первый аргумент) словаря элемент ключ которого был передан (как второй аргумент).

    
    func getSexOfHuman(name: String) -> Character {
        if name.hasSuffix("ич") || name.hasSuffix("ИЧ") || name.hasSuffix("Ич") || name.hasSuffix("иЧ") {
            return "М"
        } else if name.hasSuffix("на") || name.hasSuffix("НА") || name.hasSuffix("На") || name.hasSuffix("нА") {
            return "Ж"
        } else {
            return "?"
        }
        
    }

    /// Блок Hard.
    //Задание 1. Создать метод который будет принимать строку где слитно написано Ваши ИмяФамилия “TungFam" и возвращать строку,  где они будут разделены пробелом
    //    input = “TungFam”
    //    output = “Tung Fam"
    //    Сложность задачи в том, что имя может быть любое. Например:
    //    Введя “ArtemPigor” должно вернуть “Artem Pigor”
    //    Введя “AnnaSecure” должно вернуть “Anna Secure”
    //    Введя “BlaCar” должно вернуть “Bla Car”
    //    То есть алгоритм разбивает два слова которые начинаются на большую букву
    
    func getParsedName(name: String) -> String {
        var parsedName = name
        var indexOfBigLetter = name.endIndex
        for i in name.indices {
            let letter = String(name[i])
            if letter.uppercased() == letter, i != name.startIndex {
                indexOfBigLetter = i
                break
            }
        }
        parsedName.insert(" ", at: indexOfBigLetter)
        return parsedName
    }

    //Задание 2. Создать метод который принимает как аргумент строку. Метод выводит строку зеркально, например Ось -> ьсО, Привет -> тевирП. не используя reverse (сделать алгоритм самому посимвольно)
    
    func getReversedString(incomingString: String) -> String {
        var reversedString = ""
        for c in incomingString {
            let firstIndex = reversedString.startIndex
            reversedString.insert(c, at: firstIndex)
        }
        return reversedString
    }

    //Задание 3. добавить запятые в строку как их расставляет калькулятор
    // 1234567 -> 1,234,567
    // 12345 -> 12,345
    // (не использовать встроенный метод для применения формата)
    
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

    //Задание 4. проверить пароль на надежность от 1 до 5
    //    a) если пароль содержит числа +1
    //    b) символы верхнего регистра +1
    //    c) символы нижнего регистра +1
    //    d) спец символы +1
    //    e) если длина пароля 8 или более символов +1
    //
    //    пример:
    //    123456 - 1 a)
    //    qwertyui - 1 c)
    //    12345qwerty - 2 a) c)
    //    32556reWDr - 3 a) b) c)
    
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

