import Foundation

public class NetworkManager {
    public static let shared = NetworkManager()
    
    private init() {}
    
    public func fetchData() -> String {
        return "Mock data from Networking module"
    }
}