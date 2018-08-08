//
//  Cleaner.swift
//  Cleaner
//
//  Created by Francisco Javier Trujillo Mata on 08/08/2018.
//

import UIKit

open class Cleaner: NSObject {
    open func cleanEverything() {
        self.cleanDocumentDirectory()
        self.cleanCacheDirectory()
        self.cleanUserDefault()
    }
    
    open func cleanDocumentDirectory() {
        cleanDirectory(.documentDirectory)
    }
    
    open func cleanCacheDirectory() {
        cleanDirectory(.cachesDirectory)
    }
    
    open func cleanUserDefault() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    func cleanDirectory(_ directory: FileManager.SearchPathDirectory) {
        let paths = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)
        
        for folderPath in paths {
            let folderPathURL = URL.init(string: folderPath)
            let filesInDir = try? FileManager.default.contentsOfDirectory(at: folderPathURL!, includingPropertiesForKeys: nil, options: [])
            
            for case let file as URL in filesInDir!  {
                try? FileManager.default.removeItem(at: file)
            }
        }
    }
}
