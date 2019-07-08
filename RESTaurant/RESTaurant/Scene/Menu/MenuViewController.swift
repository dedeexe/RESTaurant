import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var menuType = MenuType.dinners
    
    let webService = WebService()
    
    private var menuItems: [MenuItem] = [] {
        didSet {
            self.reload()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        requestItems()
    }
    
    // --------------------------------------------------
    // MARK: - TableView DataSource / Delegate
    // --------------------------------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as? MenuCell else {
            fatalError("MenuCell not found")
        }
        
        let menuItem = self.menuItems[indexPath.row]
        cell.menuItem = menuItem
        return cell
    }
    
    // --------------------------------------------------
    // MARK: - Helpers
    // --------------------------------------------------
    
    func setup() {
        self.title = menuType.title
        navigationController?.navigationBar.isHidden = false
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.separatorStyle = .none
    }
    
    func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.menuTableView.reloadData()
        }
    }
    
    func requestItems() {
        let request = createRequest()
        webService.execute(request: request) { [weak self] (data, error) in
            if let error = error as NSError? {
                let message = error.description
                print(message)
            }
            
            if let unwrappedData = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(MenuList.self, from: unwrappedData)
                    self?.menuItems = result.itens ?? []
                } catch {
                    print(error.localizedDescription)
                    self?.menuItems = []
                }
            }
        }
    }

    // --------------------------------------------------
    // MARK: - Requests
    // --------------------------------------------------
    
    func createRequest() -> URLRequest {
        switch menuType {
        case .disserts:
            return makeDissertRequest()
        case .dinners:
            return makeDissertRequest()
        case .drinks:
            return makeDissertRequest()
        }
    }
    
    func makeDissertRequest() -> URLRequest {
        let url = URL(string: "https://demo6005775.mockable.io/menu/desserts")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}
