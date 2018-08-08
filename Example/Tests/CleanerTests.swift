import XCTest
import Cleaner

private struct CleanerTestsConstants{
    static let FistrumKey : String = "Fistrum"
    static let SeparatorHeight : CGFloat = 1
}

class CleanerTests: XCTestCase {
    var cleaner : Cleaner?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cleaner = Cleaner.init()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCleanUserDefault() {
        // This is an example of a functional test case.
        //Set a value on the user default
        fillUserDefault()
        cleaner?.cleanDocumentDirectory()
        let value = UserDefaults.standard.value(forKey: FistrumKey)
        XCTAssert(value != nil, "The value for the key " + FistrumKey + " should be removed" )
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func fillUserDefault() {
        UserDefaults.standard.set("Chiquito Ipsum", forKey: FistrumKey)
        UserDefaults.standard.synchronize()
    }
}
