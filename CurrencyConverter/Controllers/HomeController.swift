import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topNavigationBar: UINavigationBar!
    
    let networkManager = NetworkManager()
    var currencyData: CurrencyDataResponse?
    var refreshControl = UIRefreshControl()
    var isFetchingData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topNavigationBar.isHidden = true
        setupRefreshControl()
        fetchAllData()
        tableView.dataSource = self
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: "MyTableViewCell")
        view.backgroundColor = .systemGray4
        setTabBar()
    }
    
    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refreshData(_ sender: Any) {
        guard !isFetchingData else { return }
        
        isFetchingData = true
        fetchAllData()
    }
    
    func animateRefreshControl() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.refreshControl.beginRefreshing()
        }, completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.refreshControl.endRefreshing()
            }
        })
    }
}
