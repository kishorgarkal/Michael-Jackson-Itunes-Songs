//
//  InfoViewController.swift
//  Songs-iTunes
//
//  Created by MYGENOMEBOX INDIA on 31/07/21.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var albumImage: UIImageView!
    
    @IBOutlet weak var trackName: UILabel!
    
    @IBOutlet weak var ArtistName: UILabel!
    
    @IBOutlet weak var AlbumName: UILabel!
    
   
    
    var arrayTracks: [Track] = []
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UpDateUI()
        // Do any additional setup after loading the view.
    }
    

    func UpDateUI(){
        
        albumImage.image = nil
        
        DispatchQueue.global(qos: .background).async {
            guard let strUrl = self.arrayTracks[self.index].artworkUrl else { return }
            guard let url = URL(string: strUrl) else { return }
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self.albumImage.image = UIImage(data: data!)
            }
        }
       
        trackName.text =  self.arrayTracks[index].trackName
        ArtistName.text = self.arrayTracks[index].artistName
        AlbumName.text =  self.arrayTracks[index].collectionName
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
