import UIKit

class ChuckNorrisFactsAPI: UIViewController {

    static let shared = ChuckNorrisFactsAPI()
    
    var chuckNorrisFactsModel: ChuckNorrisFactsData?

    func getChuckNorrisFacts(completion: @escaping(Result<ChuckNorrisFactsData, Error>) -> Void) {
        
        var endPoint = "https://api.chucknorris.io/jokes/random"

        guard let url: URL = URL(string: endPoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error")
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty response")
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(ChuckNorrisFactsData.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(json))
                    }
                }
                catch {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
}
