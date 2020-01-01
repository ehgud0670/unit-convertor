//
//  main.swift
//  UnitConvertor
//
//  Created by kimdo2297 on 25/12/2019.
//  Copyright © 2019 Jason. All rights reserved.
//
import Foundation

let meter : String = "m"
let centi : String = "cm"

let HUNDRED : Double = 100
func convertCentiToMeter(lengthStr : String) -> String {
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -2)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return  String(num / HUNDRED) + meter
    }
    return ""
}

func convertMeterToCenti(lengthStr : String) -> String {
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -1)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return String(num * HUNDRED) + centi
    }
    return ""
}

let inch : String = "inch"
let sizeInchToCenti : Double = 2.54
func convertCentiToInch(lengthStr : String) -> String {
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -2)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return String(num / sizeInchToCenti) + inch
    }
    return ""
}

func convertInchToCenti(lengthStr : String) -> String {
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -4)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return String(num * sizeInchToCenti) + centi
    }
    return ""
}

func convertInchToMeter(temp : String) -> String {
    let lengthStr = convertCentiToMeter(lengthStr: convertInchToCenti(lengthStr: temp))
    return lengthStr
}

func convertMeterToInch(temp : String) -> String {
    let lengthStr = convertCentiToInch(lengthStr: convertMeterToCenti(lengthStr: temp))
    return lengthStr
}

let yard : String = "yard"
let sizeMeterToYard : Double = 1.09361
let sizeYardToCenti : Double = 91.44
func convertYardToCenti(lengthStr : String) -> String {
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -4)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return String(num * sizeYardToCenti) + centi
    }
    return ""
}

func convertCentiToYard(lengthStr : String) -> String {
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -2)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return String(num / sizeYardToCenti) + yard
    }
    return ""
}

func convertMeterToYard(temp : String) -> String {
    let lengthStr = convertCentiToYard(lengthStr: convertMeterToCenti(lengthStr: temp))
    return lengthStr
}

func convertYardToMeter(temp : String) -> String {
    let lengthStr = convertCentiToMeter(lengthStr: convertYardToCenti(lengthStr: temp))
    return lengthStr
}

func convertYardToMeterDirectly(lengthStr : String) -> String {
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -4)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return String(num / sizeMeterToYard) + meter
    }
    return ""
}

let errorMessage : String = "지원하지 않는 단위입니다."
while true {
    print("값을 입력해주세요. cm or m ( example : 186cm , 1.86m )")
    if let inputValue = readLine(){
        let tokens = inputValue.components(separatedBy: " ")
        if(tokens[0].hasSuffix(centi)){
            if(tokens.count == 2) {
                switch tokens[1] {
                case meter:
                    print(convertCentiToMeter(lengthStr: tokens[0]))
                case inch:
                    print(convertCentiToInch(lengthStr: tokens[0]))
                case yard:
                    print(convertCentiToYard(lengthStr: tokens[0]))
                default:
                    print(errorMessage)
                }
            } else {
                print(convertCentiToMeter(lengthStr: tokens[0]))
            }
        } else if (tokens[0].hasSuffix(meter)){
            if(tokens.count == 2) {
                switch tokens[1] {
                case centi:
                    print(convertMeterToCenti(lengthStr: tokens[0]))
                case inch:
                    print(convertMeterToInch(temp: tokens[0]))
                case yard:
                    print(convertMeterToYard(temp: tokens[0]))
                default:
                    print(errorMessage)
                }
            } else {
                print(convertMeterToCenti(lengthStr: tokens[0]))
            }
        } else if (tokens[0].hasSuffix(inch)){
            if(tokens.count == 2) {
                switch tokens[1] {
                case centi:
                    print(convertInchToCenti(lengthStr: tokens[0]))
                case meter:
                    print(convertInchToMeter(temp: tokens[0]))
                default:
                    print(errorMessage)
                }
            } else {
                print(convertInchToCenti(lengthStr: tokens[0]))
            }
        } else if (tokens[0].hasSuffix(yard)){
            if(tokens.count == 2) {
                switch tokens[1] {
                case centi:
                    print(convertYardToCenti(lengthStr: tokens[0]))
                case meter:
                    print(convertYardToMeter(temp: tokens[0]))
                default:
                    print(errorMessage)
                }
            } else {
                print(convertYardToMeterDirectly(lengthStr: tokens[0]))
            }
        } else if (tokens[0] == "q" || tokens[0] == "quit") {
            print("program over")
            break
        } else {
            print(errorMessage)
        }
    }
}
