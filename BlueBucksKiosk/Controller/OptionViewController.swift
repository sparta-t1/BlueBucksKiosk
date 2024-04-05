//
//  OptionViewController.swift
//  BlueBucksKiosk
//
//  Created by 서혜림 on 4/3/24.
//

import UIKit

class OptionViewController: UIViewController {
    
    // MARK: - Properties
    
    var drinkPrice = 0
    var price = 0
  
    var index = -1
    
    var tallBtnSelected = false
    var grandeBtnSelected = false
    var ventiBtnSelected = false
    
    var product: Product? {
        didSet {
            if let product {
                self.drinkName.text = product.drink.name.0
                self.drinkCount.text = "\(product.count)"
                self.drinkSize = "\(product.size)"
            }
        }
    }
    // MARK: - IBOutlets
    @IBOutlet weak var tallBtn: UIButton!
    @IBOutlet weak var grandeBtn: UIButton!
    @IBOutlet weak var ventiBtn: UIButton!
    
    @IBOutlet weak var drinkName: UILabel!
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
        if sender.tag == index {
            product?.count += 1
        } else {
            product?.count -= 1
        }
        updateTotalCountLabel()
        updateOptionAddPrice()
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

    func updateTotalCountLabel() {
        drinkCount.text = "\(product?.count ?? 0)"
    }
    
    func updateOptionAddPrice() {
        guard let product = product else {
            optionAddPrice.text = "가격: N/A"
            return
        }
        
        let totalPrice = product.drink.price.0 * (product.count)
        optionAddPrice.text = "가격: \(totalPrice)"
    }
}
