//
//  CalendarVC.swift
//  RPNepaliDatePicker
//
//  Created by Ramesh Prajapati on 13/06/2021.
//

import Foundation

public protocol RPNepaliDatePickerDelegate: AnyObject {
    func onDatePickSuccess(year: String, month: String, day: String)
}


@objcMembers open class CalendarVC: UIViewController {
    
    // MARK: - Calendar Delegate
    public weak var delegate: RPNepaliDatePickerDelegate?
    
    // MARK: - Calendar Style
    public var hideDuration: Double = 0.3
    public var headerTintColor: UIColor = .darkGray
    public var headerBackgroundColor: UIColor = .white
    public var headerLabelFont: UIFont = UIFont.systemFont(ofSize: 24)
    public var headerLabelColor: UIColor = .black
    public var weekLabelFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .medium)
    public var weekLabelColor: UIColor = .black
    public var dayLabelFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    public var todayDayLabelColor: UIColor = .black
    public var dayLabelBackgroundColor: UIColor = .white
    public var dayStyle: DayStyle = .roundishSquare
    
    
    // MARK: - UI Properties
    fileprivate lazy var superBackView: UIView = {
        let v = UIView()
        v.backgroundColor = Color.lightGray.withAlphaComponent(0.5)
        return v
    }()
    
    
    public var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
                
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = Color.backgroundGray
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.bounces = false
        return cv
    }()
    
     lazy var headerView: UIView = {
        let v = UIView()
        v.backgroundColor = headerBackgroundColor
        return v
    }()
    
    public lazy var yearlbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = headerLabelColor
        lbl.textAlignment = .center
        lbl.font = headerLabelFont
        return lbl
    }()
    
    lazy var previousBtn: UIButton = {
        let btn = UIButton(type: .system)
//        let image = UIImage(named: "previous-ic@3x.png")?.withRenderingMode(.alwaysTemplate)
//        btn.setImage(image, for: .normal)
//        btn.tintColor = headerTintColor
        
        
        let image = UIImage(named: "ic-previous@3x.png", in: resourceBundle(), compatibleWith: nil)
        btn.setImage(image, for: .normal)
        btn.tintColor = headerTintColor
        
        btn.addTarget(self, action: #selector(previousBtnPress), for: .touchUpInside)
        return btn
    }()

    lazy var nextBtn: UIButton = {
        let btn = UIButton(type: .custom)
        
        
        let image = UIImage(named: "ic-next@3x.png", in: resourceBundle(), compatibleWith: nil)
        btn.setImage(image, for: .normal)
        btn.tintColor = headerTintColor

        btn.addTarget(self, action: #selector(nextBtnPress), for: .touchUpInside)
        return btn
    }()
    
    let weekContentView: UIView = {
        let v = UIView()
        v.backgroundColor = Color.backgroundGray
        return v
    }()
  
    // MARK: - Data Properties
    var arrayOfWeekName: [String] = ["आइत","सोम", "मंगल", "बुध", "बिही", "शुक्र", "शनि"]
    let monthArray = Utility.monthArray()
    var dayCount = Int(), getFirstIndexOfMonth = Int()
    var yearIndex = Int()
    var nepaliThisYear = Int(), nepaliThisMonth = Int(), nepaliThisDay = Int()

    fileprivate func resourceBundle() -> Bundle {
        let frameworkBundle = Bundle(for: CalendarVC.self)
        let path = frameworkBundle.path(forResource: "Resources", ofType: "bundle")
        let resourceBundle = Bundle(url: URL(fileURLWithPath: path!))
        return resourceBundle!
    }
       
    // MARK: - Setup View
    fileprivate func setupView(){
        view.addSubview(superBackView)
        superBackView.addSubview(headerView)
        headerView.addSubview(yearlbl)
        headerView.addSubview(previousBtn)
        headerView.addSubview(nextBtn)

        superBackView.addSubview(weekContentView)
        view.addSubview(collectionView)

        superBackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        //Register CalendarCell
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Gesture add in
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CalendarVC.cancelAction(sender:)))
        superBackView.addGestureRecognizer(tapGesture)

        let tap2 = UITapGestureRecognizer()
        tap2.cancelsTouchesInView = true
        weekContentView.addGestureRecognizer(tap2)

        let tap3 = UITapGestureRecognizer()
        tap3.cancelsTouchesInView = true
        headerView.addGestureRecognizer(tap3)
    }
    
    // MARK: - Setup Frame
    fileprivate func setupFrame(){
        
        headerView.frame = CGRect(x: 0, y: superBackView.frame.height / 2 - 60 - 30 - 150, width: superBackView.frame.width, height: 60)
        previousBtn.frame = CGRect(x: 0, y: 0, width: 40, height: headerView.frame.height)
        yearlbl.frame = CGRect(x: 40, y: 0, width: headerView.frame.width - 80, height: headerView.frame.height)
        nextBtn.frame = CGRect(x: headerView.frame.width - 40, y: 0, width: 40, height: headerView.frame.height)
        weekContentView.frame = CGRect(x: 0, y: headerView.frame.origin.y + headerView.frame.height, width: superBackView.frame.width, height: 30)

        var btnXAnchor: CGFloat = 0
        let btnWidth: CGFloat = weekContentView.frame.width / 7
        let dayContentViewHeight: CGFloat = 30
        
        //Create Array of UILabel
        for i in 0..<7 {
            let weekNamelbl = UILabel()
            weekNamelbl.frame = CGRect(x: btnXAnchor, y: 0, width: btnWidth, height: dayContentViewHeight)
            weekNamelbl.text = arrayOfWeekName[i]
            weekNamelbl.textAlignment = .center
            weekNamelbl.textColor = weekLabelColor
            weekNamelbl.font = weekLabelFont
            
            btnXAnchor = weekNamelbl.frame.origin.x + btnWidth
            weekContentView.addSubview(weekNamelbl)
        }
    }
    
    fileprivate func getData(){
        let todayDate = Utility.todayDate()
        let todayNepaliDate = Utility.getNepaliDate(endDate: todayDate)
        loadHeader(nepaliDate: todayNepaliDate)
    }
    
    fileprivate func loadHeader(nepaliDate: String){
        let dateArr = nepaliDate.components(separatedBy: "/")
        let month = Utility.getNepaliMonth(month: Int(dateArr[1])!)
        
        nepaliThisYear = Int(dateArr[0])!
        nepaliThisMonth = Int(dateArr[1])!
        nepaliThisDay = Int(dateArr[2])!
        yearIndex = nepaliThisYear % 100

        //Set Year and Month in year label
        let nepaliYear = Utility.convertNumberInNepali(num: String(nepaliThisYear))
        yearlbl.text = nepaliYear + "  " + month

        getNumberOfDays()
    }
    
    fileprivate func getNumberOfDays(){
        //Total Days Of The Month
        dayCount = self.monthArray[yearIndex][nepaliThisMonth - 1]
       
        let englDate = Utility.getEnglishDate(year: nepaliThisYear, month: nepaliThisMonth, day: 1)
        let engDateArr = englDate.components(separatedBy: " ")
        
        //Get First Index Of Month
        getFirstIndexOfMonth = Utility.getFirstIndex(monthOfFirstDay: engDateArr[1])
        
        collectionView.frame = CGRect(x: 0, y: weekContentView.frame.origin.y + weekContentView.frame.height, width: superBackView.frame.width, height: collectionViewHeight())

        collectionView.reloadData()
        
    }
    
    //MARK:- Get Collection View Height
    fileprivate func collectionViewHeight() -> CGFloat{
        if getFirstIndexOfMonth + dayCount <= 28 {
            return (superBackView.frame.width / 7) * 4
        }else if getFirstIndexOfMonth + dayCount <= 35 {
            return (superBackView.frame.width / 7) * 5
        }else{
            return (superBackView.frame.width / 7) * 6
        }
    }
    
    //MARK:- Previous Button Press
    @objc fileprivate func previousBtnPress(){
        nepaliThisMonth -= 1
        loadingDate()
    }
    
    //MARK:- Next Button Press
    @objc fileprivate func nextBtnPress(){
        nepaliThisMonth += 1
        loadingDate()
    }
    
    
    fileprivate func loadingDate() {
        if (nepaliThisMonth < 1) {
            yearIndex -= 1
            nepaliThisYear -= 1
            nepaliThisMonth = 12
        }else if (nepaliThisMonth > 12) {
            yearIndex += 1
            nepaliThisYear += 1
            nepaliThisMonth = 1
        }
        
        let dateStr = String(format: "%d/%d/%d", nepaliThisYear, nepaliThisMonth, 1)
        loadHeader(nepaliDate: dateStr)
    }
    
    //MARK:- Cancel Action
    @objc func cancelAction(sender: UIButton){
        dismissView()
    }
}

//MARK:- Collection View Delegate & Datasource
extension CalendarVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayCount + getFirstIndexOfMonth
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell

        cell.backView.backgroundColor = self.dayLabelBackgroundColor
        
        //Get First Index Of Month
        if (indexPath.row < getFirstIndexOfMonth) {
            cell.nDatelbl.text = ""
            cell.eDatelbl.text = ""
            cell.backView.backgroundColor = Color.backgroundGray
        }else{
            let dayVal = indexPath.row + 1 - getFirstIndexOfMonth
            cell.nDatelbl.text = Utility.convertNumberInNepali(num: String(dayVal))
            let engDay = Utility.getEnglishDate(year: nepaliThisYear, month: nepaliThisMonth, day: dayVal)

            let arr1 = engDay.components(separatedBy: " ")
            let dateStr = arr1[0]
            
            let arr2 = dateStr.components(separatedBy: "/")
            
            cell.eDatelbl.text = String(Int(arr2[2])!)
            
            //Fill In Today Date
            if Utility.todayDate() == dateStr {
                cell.backView.backgroundColor = todayDayLabelColor
                cell.nDatelbl.textColor = .blue
                cell.eDatelbl.textColor = .blue
            }
            
            //Today Date Style
            switch dayStyle {
            case .circle:
                cell.backView.layer.cornerRadius = cell.backView.frame.width / 2
            case .roundishSquare:
                cell.backView.layer.cornerRadius = 5
            case .square:
                cell.backView.layer.cornerRadius = 0
                
            }

        }
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize()
    }
    
    func itemSize() -> CGSize{
        let numberOfColumns: Int = 7
        let itemWidth: CGFloat = CGFloat((superBackView.frame.width) -  CGFloat(numberOfColumns - 1)) / CGFloat(numberOfColumns)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !(indexPath.row < getFirstIndexOfMonth) {
            delegate?.onDatePickSuccess(year: String(nepaliThisYear), month: String(nepaliThisMonth), day:String(indexPath.row + 1 - getFirstIndexOfMonth))
            dismissView()
        }
    }
    
    //Show Calendar
    public func show() {
        DispatchQueue.main.async {
            self.setupView()
            self.setupFrame()
            self.getData()
            
            self.modalPresentationStyle = .overFullScreen
            UIApplication.topViewController()?.present(self, animated: false, completion: nil)
        }
    }
    
    //Dismiss Calendar
    @objc public func dismissView() {
        DispatchQueue.main.async {
            self.view.alpha = 1

            UIView.animate(withDuration: self.hideDuration, animations: {
                self.view.alpha = 0
            }, completion: { _ in
                self.dismiss(animated: false, completion: nil)
            })
        }
    }
    
    
   
}
