//
//  MaskUtils.swift
//  MaskUtils
//
//  Created by Mikhail Belikov on 07.09.2023.
//

import Foundation

public class MaskUtils {
    var pattern: String = ""
    var isDateExpiredMask: Bool = false
    var patternArr: [String] = []

    public func getNextCursorPosition(newPosition: Int) -> Int {
        let result = getCharOnIndex(text: pattern, index: newPosition)

        if (result != "A") {
            var tempPosition = newPosition + 1
            while (getCharOnIndex(text: pattern, index: tempPosition) != "A") {
                tempPosition += 1
            }

            return tempPosition

        } else {
            return newPosition
        }
    }

    public func format(
            text: String,
            optionForTest: Bool = false
    ) -> String {
        var textArr: [String] = []
        var textI = 0

        if (optionForTest) {
            patternArr = []
        }

        if (patternArr.isEmpty
                || optionForTest) {
            let temp = Array(pattern)
            for ch in temp {
                patternArr.append(String(ch))
            }
        }

        if (isDateExpiredMask
                && !text.isEmpty
                && text != " "
                && text.first != "1"
                && text.first != "0") {

            textArr.append("0")
        }

        let temp = Array(text)
        for ch in temp {
            textArr.append(String(ch))
        }

        let count = patternArr.count - 1
        for patternI in (0...count) {

            if (patternArr[patternI] == "A" && textI < textArr.count) {
                patternArr[patternI] = textArr[textI]
                textI = textI + 1

            } else {
                continue
            }
        }

        var sb: [String] = [""]
        for it in patternArr {
            if it == "A" {
                sb.append("")
            } else {
                sb.append(it)
            }
        }

        var tempBeforeRelease = sb.joined()

        if (tempBeforeRelease.suffix(3) == "   ") {
            tempBeforeRelease = String(tempBeforeRelease.dropLast(3))

        } else if (tempBeforeRelease.suffix(2) == "  ") {
            tempBeforeRelease = String(tempBeforeRelease.dropLast(2))

        } else if (tempBeforeRelease.suffix(1) == " ") {
            tempBeforeRelease = String(tempBeforeRelease.dropLast(1))
        }

        return tempBeforeRelease
    }
}

func getCharOnIndex(
    text: String,
    index: Int
)-> String {
    let length = text.count - 1
    let index1 = text.index(text.startIndex, offsetBy: length - index) //todo crash aa/aa

    let indexRange = index1...index1
    let subString = text[indexRange]

    return String(subString)
}
