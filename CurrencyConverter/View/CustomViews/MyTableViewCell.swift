import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var courceLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.contentMode = .scaleAspectFill
        cellImage.clipsToBounds = true
        cellImage.layer.cornerRadius = 10
        
    }
}

