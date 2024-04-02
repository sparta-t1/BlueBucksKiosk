
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellimage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cellCount: UILabel!
    
    @IBOutlet weak var delete: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // 카운트 계산관련
    var count: Int = 1
    
    private func refreshTextButton() {
        cellCount.text = String(count)
    }
    
    @IBAction func tappedIncreseButton(_ sender: Any) {
        count += 1
        refreshTextButton()
    }
    
    @IBAction func tappedDecreseButton(_ sender: Any) {
        count -= 1
        //테이블 뷰 구현 시 구현
        if count <= 0 {
            showAlertAction()
        }
        refreshTextButton()
    }
    // 0개 시 삭제 알람
        func showAlertAction() {
            alert.addAction(defaultAction)
            alert.addAction(cancelAction)
        }
    

    let alert = UIAlertController(title: "상품 삭제", message: "상품을 삭제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
    
    // 버튼 액션 객체 생성
    let defaultAction = UIAlertAction(title: "삭제", style: UIAlertAction.Style.default) {_ in 
        //데이터 삭제 로직 구현
    }
    let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
    

    
    
}
