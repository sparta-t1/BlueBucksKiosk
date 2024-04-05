//
//  OptionViewController.swift
//  BlueBucksKiosk
//
//  Created by 서혜림 on 4/3/24.
//

import UIKit

class OptionViewController: UIViewController {
    
    // MARK: - Properties
    
    var price = 0
    var count = 0
    var index = -1
    
    var tallBtnSelected = false
    var grandeBtnSelected = false
    var ventiBtnSelected = false
    
    var tall = Int()
    var grande = Int()
    var venti = Int()
    
    var drink: Drink? { // 받는 값
        didSet {
            if let drink {
                self.drinkNameKor.text = drink.name.0
                self.drinkNameEng.text = drink.name.1
                self.tall = drink.price.0
                self.grande = drink.price.1
                self.venti = drink.price.2
            }
        }
    }
    
    var products: [Product] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tallBtn: UIButton!
    @IBOutlet weak var grandeBtn: UIButton!
    @IBOutlet weak var ventiBtn: UIButton!
    
    @IBOutlet weak var drinkNameEng: UILabel!
    @IBOutlet weak var drinkNameKor: UILabel!
    @IBOutlet weak var optionAddPrice: UILabel!
    @IBOutlet weak var drinkCount: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTotalCountLabel()
    }
    
    // MARK: - IBActions
    
    @IBAction func selectedButtonTapped(_ sender: UIButton) {
        [tallBtn, grandeBtn, ventiBtn].forEach { button in
            if sender === button {
                button.isSelected.toggle()
                index = sender.tag
                updateOptionAddPrice()
            } else {
                button.isSelected = false
            }
            updateButtonAppearance(button)
        }
    }
    
    @IBAction func updateCount(_ sender: UIButton) {
        if sender.tag != index {
            if count > 0 {
                count -= 1
            }
        } else {
            count += 1
        }
        updateTotalCountLabel()
        updateOptionAddPrice()
        updateSize()
    }
    
    
    @IBAction func addToCart(_ sender: UIButton) {
        let mainVC = MainViewController()
        self.present(mainVC, animated: true)
    }
    
    // MARK: - Custom Methods
    
    func updateButtonAppearance(_ button: UIButton) {
        let borderColor = button.isSelected ? UIColor.bluebucks.cgColor : UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = button.isSelected ? 2 : 1
        button.layer.borderColor = borderColor
    }
    
    func resetOtherButtons(_ selectedButton: UIButton) {
        [tallBtn, grandeBtn, ventiBtn].forEach { button in
            button.layer.borderColor = (button == selectedButton && button.isSelected) ? UIColor.bluebucks.cgColor : UIColor.lightGray.cgColor
        }
    }
    
    func updateSize() {
        var size: Size = .tall // Default size
        
        switch index {
        case 0:
            size = .tall
        case 1:
            size = .grande
        case 2:
            size = .venti
        default:
            break
        }
        
        addProduct(product: Product(drink: drink!, count: count, size: size))
    }
    func updateTotalCountLabel() {
        let totalCount = count
        drinkCount.text = "\(totalCount)"
    }
    
    func updateOptionAddPrice() {
        guard let drink = drink else {
            optionAddPrice.text = "가격: N/A"
            return
        }
        
        var totalPrice = 0
        switch index {
        case 0:
            totalPrice = drink.price.0 * count
        case 1:
            totalPrice = drink.price.1 * count
        case 2:
            totalPrice = drink.price.2 * count
        default:
            break
        }
        
        optionAddPrice.text = "가격: \(totalPrice)"
    }
    
    func addProduct(product: Product) {
        let isIncluded = self.products.firstIndex { $0.drink.id == product.drink.id && $0.size == product.size }
        
        if let isIncluded = isIncluded {
            products[isIncluded].count += product.count
        } else {
            products.append(product)
        }
    }
}


