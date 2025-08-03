import XCTest
@testable import Networking

final class NetworkingTests: XCTestCase {
    
    func testNetworkManagerReturnsData() {
        let result = NetworkManager.shared.fetchData()
        XCTAssertEqual(result, "Mock data from Networking module")
    }
}