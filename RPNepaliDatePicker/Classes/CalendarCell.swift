//
//  CalendarCell.swift
//  RPNepaliDatePicker
//
//  Created by Ramesh Prajapati on 08/06/2021.
//

import UIKit

@objcMembers open class CalendarCell: UICollectionViewCell {
    let backView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var nDatelbl: UILabel = {
        let tl = UILabel()
        tl.textAlignment = .center
        return tl
    }()
    
    lazy var eDatelbl: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        tl.textColor = Color.darkGray
        tl.textAlignment = .center
        return tl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraint()
    }
    
    fileprivate func setupView(){
        contentView.addSubview(backView)
        backView.addSubview(nDatelbl)
        backView.addSubview(eDatelbl)
    }
    
    fileprivate func setupConstraint(){
        backView.frame = CGRect(x: 1, y: 1, width: self.frame.width - 0.5, height: self.frame.height - 0.5)
        nDatelbl.frame = CGRect(x: 0, y: backView.frame.height / 2 - 10, width: backView.frame.width, height: 20)
        eDatelbl.frame = CGRect(x: backView.frame.width - 30, y: nDatelbl.frame.origin.y + nDatelbl.frame.height, width: 30, height: 20)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func prepareForReuse() {
        nDatelbl.text = ""
        eDatelbl.text = ""
        backView.backgroundColor = Color.lightGray
        
        nDatelbl.textColor = .black
        eDatelbl.textColor = .black
    }
}
