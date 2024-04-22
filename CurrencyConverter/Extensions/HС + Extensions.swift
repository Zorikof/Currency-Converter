import UIKit

//MARK: - TableViewCells

extension HomeController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyData?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
        if let currenciesCource = currencyData?.data {
            let currenciesKeys = Array(currenciesCource.keys)
            let currencyAbbreviation = currenciesKeys[indexPath.row]
            let countryName = currencyAbbreviations[currencyAbbreviation] ?? "Unknown"
            let currencyName = lowerCase(currencyAbbreviation)
            cell.countryNameLabel.text = countryName
            cell.cellImage.image = UIImage(named: currencyName)
            let currenciesValues = Array(currenciesCource.values)
            let numberFormatter = NumberFormatter()
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.maximumFractionDigits = 2
            
            if let formattedValue = numberFormatter.string(from: NSNumber(value: currenciesValues[indexPath.row])) {
                cell.courceLabel.text = "1 USD = \(formattedValue) \(currenciesKeys[indexPath.row])"
            }
        }
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - FetchDataAndHandleResult

extension HomeController {
    func fetchAllData() {
        networkManager.fetchAllData { [weak self] result in
            guard let self = self else { return }
            self.isFetchingData = false
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(CurrencyDataResponse.self, from: data)
                    currencyData = decodedData
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.animateRefreshControl()
                    }
                } catch {
                    print("Error decoding JSON:", error)
                }
            case .failure(let error):
                print("Error:", error)
                DispatchQueue.main.async {
                    self.animateRefreshControl()
                }
            }
        }
    }
}

//MARK: - TabBarController

extension HomeController {
    func setTabBar() {
        guard let tabBarItems = tabBarController?.tabBar.items else { return }
        
        tabBarItems[0].image = UIImage(systemName: "house.fill")
        tabBarItems[0].selectedImage = nil
        tabBarItems[0].title = "Home"
        
        tabBarItems[1].image = UIImage(systemName: "arrow.triangle.2.circlepath")
        tabBarItems[1].selectedImage = nil
        tabBarItems[1].title = "Converter"
        
        tabBarController?.tabBar.backgroundColor = .systemGray4
        tabBarController?.tabBar.unselectedItemTintColor = .black
    }
}
