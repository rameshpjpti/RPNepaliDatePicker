//
//  ViewController.swift
//  RPNepaliDatePicker
//
//  Created by Ramesh Prajapati on 07/07/2021.
//  Copyright (c) 2021 Ramesh Prajapati. All rights reserved.
//

import UIKit
import RPNepaliDatePicker
class ViewController: UIViewController, RPNepaliDatePickerDelegate {
    
    let caleOpenBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle(" पात्रो खोल्नुहोस्। Click here..", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(caleOpenBtnPress), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public lazy var datelbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(caleOpenBtn)
        view.addSubview(datelbl)

        NSLayoutConstraint.activate([
            caleOpenBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            caleOpenBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            caleOpenBtn.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            datelbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datelbl.topAnchor.constraint(equalTo: caleOpenBtn.bottomAnchor, constant: 10),
            datelbl.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    @objc func caleOpenBtnPress(){
        let dateView = CalendarVC()
        dateView.delegate = self
        dateView.headerTintColor = .black
        dateView.headerBackgroundColor = .white
        dateView.headerLabelFont = UIFont.systemFont(ofSize: 17, weight: .medium)
        dateView.headerLabelColor = .black
        dateView.weekLabelFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        dateView.weekLabelColor = .darkGray
        dateView.dayLabelFont = UIFont.systemFont(ofSize: 21, weight: .medium)
        dateView.todayDayLabelColor = .red
        dateView.dayLabelBackgroundColor = .white
        dateView.dayStyle = .roundishSquare
        dateView.show()
    }

    
    func onDatePickSuccess(year: String, month: String, day: String) {
        datelbl.text = String(format: "%@/%@/%@", year, month, day)
    }
    
    
}

