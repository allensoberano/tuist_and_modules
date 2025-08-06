import Foundation
import NetworkingInterface

public class NetworkManager: NetworkManagerProtocol {
    public static let shared = NetworkManager()
    
    private init() {}
    
    public func fetchData() -> String {
        return "Mock data from Networking module"
    }
}