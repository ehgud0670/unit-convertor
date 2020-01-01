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
let operand : Double = 100

func convertMeterToCenti(lengthStr : String) -> String {
    
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -1)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return String(num * operand) + centi
    }
    return ""
}

func convertCentiToMeter(lengthStr : String) -> String {
    let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
    let end = lengthStr.index(lengthStr.endIndex, offsetBy: -2)
    let range = start ..< end
    if let num = Double(lengthStr[range]){
        return  String(num / operand) + meter
    }
    return ""
}


for _ in 0 ..< 3 {
    print("값을 입력해주세요. cm or m ( example : 186cm , 1.86m )")
    if let inputValue = readLine(){
        var hasSuffix : Bool = false
        hasSuffix = inputValue.hasSuffix(meter)
        if(hasSuffix){
            hasSuffix = inputValue.hasSuffix(centi)
            if(hasSuffix){
                print(convertCentiToMeter(lengthStr: inputValue))
            } else {
                print(convertMeterToCenti(lengthStr: inputValue))
            }
        } else {
            print("Error")
        }
    }
}
