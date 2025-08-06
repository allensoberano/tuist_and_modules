import Foundation
import NetworkingInterface
import Networking

public class DependencyContainer {
    public static let shared = DependencyContainer()
    
    private init() {}
    
    public func networkManager() -> NetworkManagerProtocol {
        return NetworkManager.shared
    }
}