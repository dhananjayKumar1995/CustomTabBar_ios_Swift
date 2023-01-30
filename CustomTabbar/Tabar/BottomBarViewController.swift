import UIKit
let SCREEN_WIDTH = (UIScreen.main.bounds.size.width)
let SCREEN_HEIGHT = (UIScreen.main.bounds.size.height)
var bottomBarHeight = 65
var bottomBarWidth = SCREEN_WIDTH

class BottomBarViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var bottomViewselected = ["home_selected_icon","network_selected_icon","stats_selected_icon","event_selected_icon","profile_selected_icon"]
    var bottomViewunselected = ["home_unselected_icon","network_unselected_icon","stats_unselected_icon","event_unselected_icon","profile_unselected_icon"]
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5.0
        view.layer.masksToBounds = false
        
        collectionView.layer.cornerRadius = 20.0
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
       // collectionView.backgroundColor = .clear
    }
    
}
extension BottomBarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomBarCollectionViewCell", for: indexPath) as! BottomBarCollectionViewCell
        
        if selectedIndex == indexPath.item{
            cell.underView.isHidden = false
            cell.bottomImageView.image = UIImage.init(named: bottomViewselected[indexPath.item])
        }
        else{
            cell.underView.isHidden = true
            cell.bottomImageView.image = UIImage.init(named: bottomViewunselected[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: Int(bottomBarWidth)/5, height: bottomBarHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedIndex = indexPath.item
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            let info = ["id": indexPath.item]
            
            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "HomeTabSelection"), object: nil, userInfo: info)
        }
        
    }
}
