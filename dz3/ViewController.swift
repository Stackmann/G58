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
        let myName = "Oleg"
        print("Number characters of the \(myName) is \(getCountOfCaracters(str: myName))")
        print("=============================================")

        print("Блок Easy. Задание 2")
        print("The username for first name Oleg and second name Yaroshenko is \(getUserName(firstName: "Oleg", secondName: "Yaroshenko"))")
        print("=============================================")

        print("Блок Easy. Задание 3")
        let name = "Олег Федорович"
        print("The sex of the human \(name) is \(getSexOfHuman(name: name))")
        print("=============================================")

        print("Блок Hard. Задание 1")
        let userName = "OlegYaroshenko"
        print("The name of the \(userName) is \(getParsedName(name: userName))")
        print("=============================================")

        print("Блок Hard. Задание 2")
        let normalString = "OlegYaroshenko"
        print("The reversed string of the \(normalString) is \(getReversedString(incomingString: normalString))")
        print("=============================================")

        print("Блок Hard. Задание 3")
        print("The formated number of the 4500789 is \(getFormatedNumber(number: 4500789))")
        print("=============================================")

        print("Блок Hard. Задание 4")
        let password = "SECURI2Y WoRD%"
        checkPasswordComplicated(password: password)
        print("=============================================")
    }


    /// Блок Easy.
    //Задание 1. Создать строку со своим именем. Написать метод который получает это имя и возвращает кол-во символов в строке с вашим именем. Возвращенное значение показать в консоль
    func getCountOfCaracters(str: String) -> Int {
        return str.count
    }

    /// Блок Easy.
    //Задание 2. Написать метод который принимает 2 слова, например имя и фамилию, возвращает юзернейм который имеет буквы нижнего регистра и разделяет имя и фамилию символом “_”
    func getUserName(firstName: String, secondName: String) -> String {
        let userName = firstName + "_" + secondName
        return userName.lowercased()
    }

    /// Блок Easy.
    //Задание 3. Создать строку с именем и своим отчеством. Создать метод который проверит его на окончание “ич/на”. Выводит “М” или “Ж” в зависимости от окончания. Также учитывать регистр букв, то есть ИЧ или Ич или На и тд.
//    Подсказка: в классе написан метод который позволяет проверить на суффикс или префикс, найдите и используйте его
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

