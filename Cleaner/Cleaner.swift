//
//  Cleaner.swift
//  Cleaner
//
//  Created by Francisco Javier Trujillo Mata on 08/08/2018.
//

import UIKit

@objc open class Cleaner: NSObject {
    @objc open func cleanEverything() {
        self.cleanDocumentDirectory()
        self.cleanCacheDirectory()
        self.cleanUserDefault()
    }
    
    @objc open func cleanDocumentDirectory() {
        cleanDirectory(.documentDirectory)
    }
    
    @objc open func cleanCacheDirectory() {
        cleanDirectory(.cachesDirectory)
    }
    
    @objc open func cleanUserDefault() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    func cleanDirectory(_ directory: FileManager.SearchPathDirectory) {
        let paths = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)
        
        for folderPath in paths {
            let folderPathURL = URL.init(string: folderPath)
            let filesInDir = try? FileManager.default.contentsOfDirectory(at: folderPathURL!, includingPropertiesForKeys: nil, options: [])
            
            for case let file in filesInDir!  {
                try? FileManager.default.removeItem(at: file)
            }
        }
    }
}
