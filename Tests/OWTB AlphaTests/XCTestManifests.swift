import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OWTB_AlphaTests.allTests),
    ]
}
#endif
