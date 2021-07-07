//
//  Extension+Struct.swift
//  RPNepaliDatePicker
//
//  Created by Ramesh Prajapati on 08/06/2021.
//

import Foundation
import UIKit


extension String{
    static let DATE_FORMATE: String = String("yyyy/MM/dd")
    static let startNepaliYear: Int = 2000
    static let startEnglishDate: String = "1943/04/14"

}

extension UIApplication {
    class func topViewController(root: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let navigation = root as? UINavigationController {
            return topViewController(root: navigation.visibleViewController)
        } else if let tab = root as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(root: selected)
        } else if let presented = root?.presentedViewController {
            return topViewController(root: presented)
        }

        return root
    }
}

public enum DayStyle {
    case roundishSquare
    case square
    case circle
}
