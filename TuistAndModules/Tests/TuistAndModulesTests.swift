import XCTest
@testable import TuistAndModules

final class TuistAndModulesTests: XCTestCase {
    
    func testViewControllerCreation() {
        let viewController = ViewController()
        XCTAssertNotNil(viewController)
    }
}