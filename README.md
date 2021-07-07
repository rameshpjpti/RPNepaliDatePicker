<img src="https://user-images.githubusercontent.com/19798061/123107772-8f857c80-d459-11eb-85c4-8ff7e1fb1f25.jpg" width = "200"><img src="https://user-images.githubusercontent.com/19798061/123107561-61a03800-d459-11eb-91f0-c6423e3a599d.jpg" width = "200"> <img src="https://user-images.githubusercontent.com/19798061/123107748-88f70500-d459-11eb-82cf-4516e846d4a7.jpg" width = "200">

# RPNepaliDatePicker
RPNepaliDatePicker is a nepali date picker which is a simple and fully customizable written in swift.

# Requirements
- iOS 12.1
- Xcode 12
- Swift 5.0

# Installation
You can use CocoaPods to install RPNepaliDatePicker by adding it to your Podfile:

1. pod 'RPNepaliDatePicker'
2. pod install

 # Usage
 import `'RPNepaliDatePicker'`
 <br>

```
 class ViewController: UIViewController, RPNepaliDatePickerDelegate { 
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
```

# Feedback
I'd love to hear the feedback. Drop me on [email.](rameshpjpti@gmail.com) 

# License
RPNepaliDatePicker is available under the MIT license. See the LICENSE file for more info.


