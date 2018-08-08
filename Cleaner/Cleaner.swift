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
        self.cleanUserDefault()
    }
    
    open func cleanDocumentDirectory() {
        let documentsPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        for folderPath in documentsPaths {
            let folderPathURL = URL.init(string: folderPath)
            let filesInDir = try? FileManager.default.contentsOfDirectory(at: folderPathURL!, includingPropertiesForKeys: nil, options: [])
            
            for case let file as URL in filesInDir!  {
                try? FileManager.default.removeItem(at: file)
            }
        }
    }
    
    open func cleanUserDefault() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}
