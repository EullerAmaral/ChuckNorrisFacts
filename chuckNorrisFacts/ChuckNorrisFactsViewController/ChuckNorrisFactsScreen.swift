import UIKit

protocol ChuckNorrisFactsScreenDelegate: AnyObject {
    func tappedButton()
}

class ChuckNorrisFactsScreen: UIView {
    
    private weak var delegate: ChuckNorrisFactsScreenDelegate?
    
    public func delegate(delegate: ChuckNorrisFactsScreenDelegate?) {
        self.delegate = delegate
    }

    lazy var factsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chuck Norris facts"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var getFactsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .boldSystemFont(ofSize: 19)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Click to facts", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(tappedGetFactsButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedGetFactsButton() {
        delegate?.tappedButton()
    }
    
    lazy var chuckNorrisImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "chuckNorris")
        return image
    }()
    
    func setupView() {
        backgroundColor = .systemGray6
        addSubview(factsLabel)
        addSubview(getFactsButton)
        addSubview(chuckNorrisImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            factsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            factsLabel.bottomAnchor.constraint(equalTo: getFactsButton.topAnchor, constant: -25),
            factsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            factsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            getFactsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            getFactsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            getFactsButton.heightAnchor.constraint(equalToConstant: 40),
            getFactsButton.widthAnchor.constraint(equalToConstant: 130),
            
            chuckNorrisImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            chuckNorrisImage.heightAnchor.constraint(equalToConstant: 180),
            chuckNorrisImage.widthAnchor.constraint(equalToConstant: 180),
            chuckNorrisImage.topAnchor.constraint(equalTo: getFactsButton.bottomAnchor, constant: 55),
        
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
