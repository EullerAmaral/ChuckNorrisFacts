import UIKit

class ChuckNorrisFactsViewController: UIViewController {

    var chuckNorrisFactsScreen: ChuckNorrisFactsScreen?
    
    override func loadView() {
        chuckNorrisFactsScreen = ChuckNorrisFactsScreen()
        view = ChuckNorrisFactsScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

