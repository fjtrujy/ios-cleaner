import XCTest
import Cleaner

private struct CleanerTestsConstants{
    static let fistrumKey : String = "Fistrum"
    static let separatorHeight : CGFloat = 1
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
        cleaner?.cleanUserDefault()
        let value = UserDefaults.standard.value(forKey: CleanerTestsConstants.fistrumKey)
        XCTAssert(value == nil, "The value for the key " + CleanerTestsConstants.fistrumKey + " should be removed" )
    }
    
    func testCleanDocumentDirectory() {
        // This is an example of a functional test case.
        //Set a value on the user default
        let imageName = "goku"
        saveImageIntoDocumentDirectory(fileName: imageName)
        cleaner?.cleanDocumentDirectory()
        let image = readImageFromDocumentDirectory(fileName: imageName)
        
        XCTAssert(image == nil, "The image " + imageName + " should be removed" )
    }
    
    func testCleanCacheDirectory() {
        // This is an example of a functional test case.
        //Set a value on the user default
        let imageName = "goku"
        saveImageIntoCacheDirectory(fileName: imageName)
        cleaner?.cleanCacheDirectory()
        let image = readImageFromCacheDirectory(fileName: imageName)
        
        XCTAssert(image == nil, "The image " + imageName + " should be removed" )
    }

    // MARK: - Helpers
    func fillUserDefault() {
        UserDefaults.standard.set("Chiquito Ipsum", forKey: CleanerTestsConstants.fistrumKey)
        UserDefaults.standard.synchronize()
    }
    
    func saveImageIntoDocumentDirectory(fileName: String) {
        return saveImageIntoDirectory(directory: .documentDirectory, fileName: fileName)
    }
    
    func readImageFromDocumentDirectory(fileName: String) -> UIImage? {
        return readImageFromDirectory(directory: .documentDirectory, fileName: fileName)
    }
    
    func saveImageIntoCacheDirectory(fileName: String) {
        return saveImageIntoDirectory(directory: .cachesDirectory, fileName: fileName)
    }
    
    func readImageFromCacheDirectory(fileName: String) -> UIImage? {
        return readImageFromDirectory(directory: .cachesDirectory, fileName: fileName)
    }
    
    func saveImageIntoDirectory(directory: FileManager.SearchPathDirectory, fileName: String) {
        // get the documents directory url
        let directory = FileManager.default.urls(for: directory, in: .userDomainMask).first!
        // choose a name for your image
        // create the destination file url to save your image
        let fileURL = directory.appendingPathComponent(fileName + ".jpg")
        // get your UIImage jpeg data representation and check if the destination file url already exists
        let image = UIImage.init(named: fileName)
        if let data = image!.jpegData(compressionQuality: 1.0),
            !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
    }
    
    func readImageFromDirectory(directory: FileManager.SearchPathDirectory, fileName: String) -> UIImage? {
        var image: UIImage?
        let directory = FileManager.default.urls(for: directory, in: .userDomainMask).first!
        let fileURL = directory.appendingPathComponent(fileName + ".jpg")
        let exists = FileManager.default.fileExists(atPath: fileURL.path)
        
        if exists {
            let data = FileManager.default.contents(atPath: fileURL.absoluteString)
            if (data != nil) {
                image = UIImage.init(data: data!)
            }
            
        }
        
        return image
        
    }
}
