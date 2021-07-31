import UIKit

class TrackTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var image_View: UIImageView!
    
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var artistLabel: UILabel!
   
    @IBOutlet weak var artistNameLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setCoverStyle()
    }
    
    func setCoverStyle() {
        image_View.clipsToBounds = true
        image_View.layer.cornerRadius = 10
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 0.5
        outerView.layer.shadowOffset = CGSize.zero
        outerView.layer.shadowRadius = 4
        outerView.layer.shadowPath = UIBezierPath(roundedRect: image_View.bounds, cornerRadius: 10).cgPath
    }
    
}
