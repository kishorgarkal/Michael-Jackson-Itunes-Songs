import Foundation

let activityIndicatorView =  NVActivityIndicatorView(frame: CGRect(x: 8, y: 8, width: 50, height: 50), type: .ballClipRotate, color: UIColor.blue, padding: 20)

class Search {
   
    static func searchByTerm(term: String, completion: (([Track]) -> Void)? = nil) {
        activityIndicatorView.startAnimating()
        let searchURL = "https://itunes.apple.com/search"
        let params: Parameters = ["term": term, "media" : "music", "entity" : "song"]

        AF.request(searchURL, method: .get, parameters: params, encoding: URLEncoding.default,  headers: nil).validate().responseDecodable{ (response: AFDataResponse<SearchResponse>) in
            let tracks = response.value?.results ?? []
            activityIndicatorView.stopAnimating()
            completion!(tracks)
        }
    }
    
}
