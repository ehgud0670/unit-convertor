//
//  main.swift
//  UnitConvertor
//
//  Created by kimdo2297 on 25/12/2019.
//  Copyright © 2019 Jason. All rights reserved.
//
import Foundation

func convertLength(lengthStr : String) -> String {
    let operand : Double = 100
    let meter : String = "m"
    let centimeter : String = "cm"
    var hasSuffix : Bool = false
    hasSuffix = lengthStr.hasSuffix(meter)
    if(hasSuffix){
        let start = lengthStr.index(lengthStr.startIndex, offsetBy: 0)
        hasSuffix = lengthStr.hasSuffix(centimeter)
        if(hasSuffix){
            let end = lengthStr.index(lengthStr.endIndex, offsetBy: -2)
            let range = start ..< end
            if let num = Double(lengthStr[range]){
                return  String(num / operand) + meter
            }
        } else {
            let end = lengthStr.index(lengthStr.endIndex, offsetBy: -1)
            let range = start ..< end
            if let num = Double(lengthStr[range]){
                return String(num * operand) + centimeter
            }
        }
    }
    return "error"
}

print(convertLength(lengthStr: "1.86m"))
print(convertLength(lengthStr: "186cm"))
print(convertLength(lengthStr: "186"))
