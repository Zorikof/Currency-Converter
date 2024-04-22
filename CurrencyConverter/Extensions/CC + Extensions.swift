import UIKit

extension ConverterController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func fetchCurrentData(from: String, to: String) {
        networkManager.fetchCurrencyCourse(from: from, to: to) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(CurrencyDataResponse.self, from: data)
                    if let rate = decodedData.data[to] {
                        let convertedValue = rate * Double(self.inputText)
                        self.currentValue = String(format: "%.2f", convertedValue)
                    
                        DispatchQueue.main.async {
                            self.updateTopTextField()
                        }
                    } else {
                        print("Error: Currency rate not found")
                    }
                } catch {
                    print("Error parsing currency data: \(error)")
                }
            case .failure(let error):
                print("Error fetching currency data: \(error)")
            }
        }
    }


    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == fromCurrencyPickerView {
            let fromCurrency = Array(currencyAbbreviations.keys)[row]
            firstCurrency = fromCurrency
        } else if pickerView == toCurrencyPickerView {
            let toCurrency = Array(currencyAbbreviations.keys)[row]
            secondCurrency = toCurrency
        }
        
        fetchCurrentData(from: firstCurrency, to: secondCurrency)
    }
    
    func updateTopTextField() {
        topTextField.text = "\(inputText) \(firstCurrency) = \(currentValue) \(secondCurrency)"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let keys = Array(currencyAbbreviations.keys)
        return keys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let keys = Array(currencyAbbreviations.keys)
        return keys[row]
    }
    
    func setupUI() {
        let buttons = [oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, zeroButton, deleteAllButton, deleteLastButton]
        
        for button in buttons {
            button!.layer.cornerRadius = 36
            button!.clipsToBounds = true
            button!.layer.borderWidth = 0.3
            button!.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}


