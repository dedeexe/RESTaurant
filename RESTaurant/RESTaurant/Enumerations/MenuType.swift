import Foundation

enum MenuType: String {
    case disserts = "Sobremesas"
    case drinks = "Bebidas"
    case dinners = "Pratos"
    
    var title: String {
        return self.rawValue
    }
}
