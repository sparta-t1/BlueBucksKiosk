import UIKit

struct Drink {
    var name: (String, String)
    var image: UIImage
    var description: String
    var price: Int
    var category: Category
    var size: Size
}

enum Category {
    case espresso
    case frappuccino
    case teavana
    case etc
}

enum Size: Int {
    case tall = 355
    case grande = 473
    case venti = 591
}

let tabelCellVC = TableViewCell()
let collectionCellVC = CollectionViewCell()
