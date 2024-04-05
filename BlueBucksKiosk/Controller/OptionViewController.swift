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
            if let drink = drink {
                self.drinkName.text = drink.name.0
                self.drinkCount.text = "\(drink.count)"
                // self.price.text = "\(drink.price)"
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
        [tallBtn, grandeBtn, ventiBtn].forEach { button in
                // 눌린 버튼에 대해서만 isSelected를 toggle합니다.
                if sender === button {
                    button.isSelected.toggle()
                } else {
                    // 다른 버튼은 선택을 해제합니다.
                    button.isSelected = false
                }
            }
            if sender === tallBtn {
                index = -1
            } else if sender === grandeBtn {
                index = 1
            } else if sender === ventiBtn {
                index = 2
            }
            
            if let count = drink?.count {
                self.drinkCount.text = "\(count)"
            } else {
                self.drinkCount.text = "0"
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
//        sender.backgroundColor = UIColor.bluebucks
//        //performSegue(withIdentifier: "세그웨이 식별자 이름", sender: self)
//        performSegue(withIdentifier: "showNextView", sender: self)
        let mainVC = MainViewController()
        self.present(mainVC, animated: true)
    }
    
    // MARK: - Custom Methods
    
    func btnAppearance(buttons: [UIButton], isPressed: Bool) {
        let borderColor = isPressed ? UIColor.bluebucks.cgColor : UIColor.lightGray.cgColor
        let borderWidth: CGFloat = isPressed ? 2 : 1
        
        for button in buttons {
            button.layer.cornerRadius = 5
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor
            
               }
           }

    func resetOtherButtons(_ selectedButton: UIButton) {
        [tallBtn, grandeBtn, ventiBtn].forEach { button in
            button.layer.borderColor = (button == selectedButton && button.isSelected) ? UIColor.bluebucks.cgColor : UIColor.lightGray.cgColor
        }
    }

    
    func updateTotalCountLabel() {
        drinkCount.text = "\(drink?.count ?? 0)"
    }
    
    func updateOptionAddPrice() {
        guard let drink = drink else {
            optionAddPrice.text = "가격: N/A"
            return
        }
        
        let totalPrice = drink.price * drink.count
        optionAddPrice.text = "가격: \(totalPrice)"
    }
}
