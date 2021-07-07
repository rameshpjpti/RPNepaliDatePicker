//
//  Utility.swift
//  RPNepaliDatePicker
//
//  Created by Ramesh Prajapati on 08/06/2021.
//

import UIKit

class Utility: NSObject {
    
    class func monthArray() -> [[Int]]{
        var data = [[Int]]()
        data = [
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            
            [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30],
            
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
            
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
            
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            
            [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
            [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
            [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
            
            [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
            [31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30],
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30],
            [31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30],
            [31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30],
            [31, 32, 31, 32, 30, 31, 30, 30, 29, 30, 30, 30],
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30],
            [31, 31, 32, 31, 31, 31, 30, 30, 29, 30, 30, 30],
            [30, 31, 32, 32, 30, 31, 30, 30, 29, 30, 30, 30],
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30],
            
            [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30],
        ]
        
        return data
    }
    
    class func getEnglishDate(year: Int, month: Int, day: Int) -> String{
        let startDate: Date = stringToDate(String.startEnglishDate)! //: NSDate = formatter.date(from: String.startEnglishDate)! as NSDate
        
        var days: Int = 0
        let data = monthArray()

        let yr: Int = year - String.startNepaliYear
        
        for i in 0...yr {
            for j in 0..<12 {
                if i == yr && j == month - 1 {
                    days += day - 1
                    let components = NSDateComponents()
                    components.day = days
                    let gregorian :NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!

                    let englishDate = gregorian.date(byAdding: components as DateComponents, to: startDate as Date, options: [])                    
                    let dateFor = DateFormatter()
                    dateFor.dateFormat = "yyyy/MM/dd EE"
                    let dateStr: String = dateFor.string(from: englishDate!) as String

                    return dateStr
                }else{
                    days += data[i][j]
                }
            }
        }
        return ""
    }
    
    
    class func getNepaliDate(endDate: String) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let startDate: NSDate = formatter.date(from: String.startEnglishDate)! as NSDate

        let toDate: NSDate = formatter.date(from: endDate)! as NSDate
        
        let gregorian :NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let components: NSDateComponents = gregorian.components(.day, from: startDate as Date, to: toDate as Date, options: []) as NSDateComponents
        
        var days = components.day + 1
        
        let data = monthArray()
        for i in 0..<data.count {
            for j in 0..<12 {
                if days > data[i][j] {
                    days -= data[i][j]
                }else{
                    let nepaliDate = String(format: "%d/%02d/%02ld", i + String.startNepaliYear, j + 1, days)
                    return nepaliDate
                }
            }
        }
        return ""
    }
   
    
    class func todayDate() -> String{
        let todayDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = String.DATE_FORMATE
        let dateString: String = formatter.string(from: todayDate) as String
        
        return dateString
    }
    
    class func getNepaliMonth(month: Int) -> String{
        var nepaliMonth = String()
        switch (month) {
            case 1:
                nepaliMonth = "वैशाख"
                break
            case 2:
                nepaliMonth = "जेठ"
                break
            case 3:
                nepaliMonth = "असार"
                break
            case 4:
                nepaliMonth = "श्रावण"
                break
            case 5:
                nepaliMonth = "भदौ"
                break
            case 6:
                nepaliMonth = "असोज"
                break
            case 7:
                nepaliMonth = "कात्तिक"
                break
            case 8:
                nepaliMonth = "मंसिर"
                break
            case 9:
                nepaliMonth = "पौष"
                break
            case 10:
                nepaliMonth = "माघ"
                break
            case 11:
                nepaliMonth = "फाल्गुन"
                break
            case 12:
                nepaliMonth = "चैत्र"
                break
                
            default:
                break
        }
        return nepaliMonth
    }
    
    class func getFirstIndex(monthOfFirstDay: String) -> Int{
        var val = Int()
        if monthOfFirstDay == "Sun"{
            val = 0;
        }else if monthOfFirstDay == "Mon" {
            val = 1
        }else if monthOfFirstDay == "Tue" {
            val = 2
        }else if monthOfFirstDay == "Wed" {
            val = 3
        }else if monthOfFirstDay == "Thu" {
            val = 4
        }else if monthOfFirstDay == "Fri" {
            val = 5
        }else{
            val = 6
        }
        return val
    }
    
    class func convertNumberInNepali(num: String) -> String{
        let numbers = Array(num)
        
        var str = String()
        for i in 0..<numbers.count {
            let val: Int = Int(String(numbers[i]))!
            
            var nepaliNum = String()
            switch (val) {
                case 0:
                    nepaliNum = "०"
                    break
                case 1:
                    nepaliNum = "१"
                    break
                case 2:
                    nepaliNum = "२"
                    break
                case 3:
                    nepaliNum = "३"
                    break
                case 4:
                    nepaliNum = "४"
                    break
                case 5:
                    nepaliNum = "५"
                    break
                case 6:
                    nepaliNum = "६"
                    break
                case 7:
                    nepaliNum = "७"
                    break
                case 8:
                    nepaliNum = "८"
                    break
                case 9:
                    nepaliNum = "९"
                    break
                default:
                    break
            }
            str = str.appending(nepaliNum)
        }
        return str
    }
    
    class func stringToDate(_ value: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = String.DATE_FORMATE
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter.date(from: value)
    }
    
}

