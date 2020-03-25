import XCTest
@testable import Coral

final class CoralTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Coral().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
