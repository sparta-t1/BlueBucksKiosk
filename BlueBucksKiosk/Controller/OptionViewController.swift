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
    
    var index = 0
    
    var tallBtnSelected = false
    var grandeBtnSelected = false
    var ventiBtnSelected = false
    
    var drink: Drink? {
        didSet {
            if let drink {
                
                self.drinkName.text = drink.name.0
                self.drinkCount.text = String(drink.count)
//                self.price.text = drink.price
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
        
        updateTotalCountLabel() // 총 수량 업데이트
    }
    
    // MARK: - IBActions
    
    @IBAction func selectedButtonTapped(_ sender: UIButton) {
        [tallBtn, grandeBtn, ventiBtn].enumerated().forEach { offset, button in
            if sender.tag == offset {
                let shouldToggle = !(sender === button && button.isSelected)
                
                if shouldToggle {
                    button.isSelected.toggle()
                    resetOtherButtons(button)
                }
            }
        }

        if sender.tag != index {
            index = sender.tag
            self.drinkCount.text = String(drink.count)
    //        self.price.text = String(0)
        }
        btnAppearance(buttons: [sender], isPressed: true)
    }


    
    
    @IBAction func updateCount(_ sender: UIButton) {
        if sender.tag == index {
            drink?.count += 1
        } else {
            drink?.count -= 1
        }
        
        updateTotalCountLabel() // totalCount 레이블 업데이트
    }


    @IBAction func addToCart(_ sender: UIButton) {
    }
    
    // MARK: - Custom Methods
    
    func btnAppearance(buttons: [UIButton], isPressed: Bool) {
        let borderColor = isPressed ? UIColor(named: "maincolor")?.cgColor : UIColor.lightGray.cgColor
        let borderWidth: CGFloat = isPressed ? 2 : 1
        
        buttons.forEach {
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = borderWidth
            $0.layer.borderColor = borderColor
        }
    }
    
    func resetOtherButtons(_ selectedButton: UIButton) {
        [tallBtn, grandeBtn, ventiBtn].forEach { button in
            if button! != selectedButton {
                (button as AnyObject).layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    func updateTotalCountLabel() {
        drinkCount.text = "\(String(drink.count))"
    }
    
    func updateOptionAddPrice() { // 선택된 음료와 옵션 추가금을 더한 총 가격을 업데이트
        let totalPrice = drink?.price * String(drink.count)
        optionAddPrice.text = "가격: \(totalPrice)"
    }
}
