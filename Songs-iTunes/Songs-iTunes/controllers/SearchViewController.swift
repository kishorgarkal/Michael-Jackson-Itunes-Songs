
class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var trackTableView: UITableView!

    var arrayTracks: [Track] = []
    
    var arrayTracksFiltered: [Track] = []
    
    var arraySearchTerms = ["Michael Jackson"]

    var arrayChips: [MDCChipView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.searchByTerm(term: "Michael Jackson")
        
    }
    
    
    func setChipSelection(tag: Int) {
        for chip in arrayChips {
            chip.isSelected = (chip.tag == tag)
        }
    }
    
    func searchByTerm(term: String) {
        Search.searchByTerm(term: term, completion: { arrayTracks in
            self.arrayTracks = arrayTracks
            self.arrayTracksFiltered = arrayTracks
            self.trackTableView.reloadData()
        })
    }
        

        
    // MARK: - UITableViewDataSource
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayTracksFiltered.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackTableViewCell", for: indexPath as IndexPath) as! TrackTableViewCell
        cell.nameLabel.text = self.arrayTracksFiltered[indexPath.row].getTitle()
        cell.artistNameLabel.text = self.arrayTracksFiltered[indexPath.row].artistName
        cell.image_View.image = nil
        DispatchQueue.global(qos: .background).async {
            guard let strUrl = self.arrayTracksFiltered[indexPath.row].artworkUrl else { return }
            guard let url = URL(string: strUrl) else { return }
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                cell.image_View.image = UIImage(data: data!)
            }
        }
        return cell
    }
       
    
    // MARK: - UITableViewDelegate
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController
        vc?.arrayTracks = arrayTracksFiltered
        vc?.index = indexPath.row
        self.navigationController?.pushViewController(vc!, animated: true)
    }
          
}
