import UIKit

class ChuckNorrisFactsViewController: UIViewController {

    var chuckNorrisFactsScreen: ChuckNorrisFactsScreen?
    
    override func loadView() {
        chuckNorrisFactsScreen = ChuckNorrisFactsScreen()
        view = chuckNorrisFactsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chuckNorrisFactsScreen?.delegate(delegate: self)
    }
}

extension ChuckNorrisFactsViewController: ChuckNorrisFactsScreenDelegate {
    func tappedButton() {
        
        ChuckNorrisFactsAPI.shared.getChuckNorrisFacts { [weak self] result in
            switch result {
            case .success(let factsData):
                self?.chuckNorrisFactsScreen?.factsLabel.text = factsData.value
            case .failure(_):
                break
            }
        }
    }
}
