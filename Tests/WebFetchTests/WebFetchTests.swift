import XCTest
@testable import WebFetch

final class WebFetchTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(WebFetch().text, "Hello, World!")
    }
}
