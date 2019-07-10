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
        cell.selectionStyle = .none
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
    
    // ------------------------------------------------------------------
    // Development Point: 02
    // ------------------------------------------------------------------
    //
    // Desenvolver método para requisitar ítens do menu e tratar
    //  resposta devolvida pelo WebService
    //
    
    func requestItems() {
        
        //Implementar a criação do request
        
        // Implementar a execução do request e o tratamento da resposta
        
    }
    
}
