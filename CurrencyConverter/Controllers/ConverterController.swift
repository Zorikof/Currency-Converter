import UIKit

class ConverterController: UIViewController {
    
    @IBOutlet weak var fromCurrencyPickerView: UIPickerView!
    @IBOutlet weak var toCurrencyPickerView: UIPickerView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var deleteAllButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var deleteLastButton: UIButton!
    
    let networkManager = NetworkManager()
    var inputText = 0
    var currentValue = "0"
    var firstCurrency = "EUR"
    var secondCurrency = "EUR"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromCurrencyPickerView.delegate = self
        fromCurrencyPickerView.dataSource = self
        toCurrencyPickerView.delegate = self
        toCurrencyPickerView.dataSource = self
        
        if let defaultFromCurrencyIndex = Array(currencyAbbreviations.keys).firstIndex(of: firstCurrency),
           let defaultToCurrencyIndex = Array(currencyAbbreviations.keys).firstIndex(of: secondCurrency) {
            fromCurrencyPickerView.selectRow(defaultFromCurrencyIndex, inComponent: 0, animated: false)
            toCurrencyPickerView.selectRow(defaultToCurrencyIndex, inComponent: 0, animated: false)
        }
        
        topTextField.text = "Choose the currencies"
        setupUI()
    }
    
    @IBAction func oneButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 1
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func twoButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 2
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func threeButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 3
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func fourButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 4
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func fiveButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 5
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func sixButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 6
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func sevenButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 7
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func eightButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 8
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func nineButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 9
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func zeroButtonPressed(_ sender: Any) {
        inputText = inputText * 10 + 0
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func deleteAllButtonPressed(_ sender: Any) {
        inputText = 0
        updateTopTextField()
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    @IBAction func deleteLastButtonPressed(_ sender: Any) {
        inputText = inputText / 10
        updateTopTextField()
        
    }
}
