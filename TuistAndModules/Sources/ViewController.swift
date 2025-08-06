import UIKit
import NetworkingInterface

class ViewController: UIViewController {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol? = nil) {
        self.networkManager = networkManager ?? DependencyContainer.shared.networkManager()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        let networkData = networkManager.fetchData()
        
        let label = UILabel()
        label.text = networkData
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
