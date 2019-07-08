import UIKit

class HomeViewController: UIViewController {
    
    var menuType = MenuType.dinners
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let menuViewController = segue.destination as? MenuViewController else {
            fatalError("MenuViewController not found.")
        }
        
        menuViewController.menuType = self.menuType
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // --------------------------------------------------
    // MARK: - Actions
    // --------------------------------------------------
    
    @IBAction func showDisserts() {
        openMenu(type: .disserts)
    }
    
    @IBAction func showDinners() {
        openMenu(type: .dinners)
    }
    
    @IBAction func showDrinks() {
        openMenu(type: .drinks)
    }
    
    // --------------------------------------------------
    // MARK: - Helpers
    // --------------------------------------------------

    func openMenu(type:MenuType) {
        self.menuType = type
        self.performSegue(withIdentifier: "segueShowMenu", sender: nil)
    }
    
    func setup() {
        self.title = "Home"
    }

}
