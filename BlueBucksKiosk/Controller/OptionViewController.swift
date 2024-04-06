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
    var size = Size.tall
    
    private let manager = ProductManager()
    
    var tallBtnSelected = false
    var grandeBtnSelected = false
    var ventiBtnSelected = false
    
    var drink: Drink? { // 받는 값
        didSet {
            if let drink {
                self.drinkNameKor.text = drink.name.0
                self.drinkNameEng.text = drink.name.1
            }
        }
    }
    
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
                updateOptionAddPrice(size: size)
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
        } // 카운트가 1보다 큰 경우에만 실행
        updateTotalCountLabel()
        updateOptionAddPrice(size: size) // 불리안 같이 넘기기
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        
        if index == -1 {
            
        } else {
            let product = Product(drink: drink!, count: count, size: size)
            manager.addProduct(product: product)
            let mainVC = MainViewController()
            mainVC.modalPresentationStyle = .fullScreen
            self.present(mainVC, animated: true)
        }
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
        var size: Size = .tall
        
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
        
        // size에 따라 가격 업데이트 로직 추가
        updateOptionAddPrice(size: size)
        
        // 추가: 유효성 검사 수행
        guard let drink = drink else {
            // Drink가 없을 경우 처리
            return
        }
        
        guard let countText = drinkCount.text,
              let count = Int(countText) else {
            // 필요한 값이 존재하지 않는 경우 처리
            return
        }
    }

    func updateTotalCountLabel() {
        drinkCount.text = "\(count)"
    }
    
    func updateOptionAddPrice(size: Size) {
        guard let drink = drink else {
            optionAddPrice.text = "가격: N/A"
            return
        }
        
        switch size {
        case .tall:
            price = drink.price.0 * count
        case .grande:
            price = drink.price.1 * count
        case .venti:
            price = drink.price.2 * count
        }
        
        optionAddPrice.text = "가격: \(price)"
    }
}
