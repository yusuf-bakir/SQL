//
//  Util.swift
//  Veritabanıişlemleri
//
//  Created by yusuf bakır on 26.04.2023.
//

import Foundation
import UIKit
class Util {
    static let share = Util()
    
    
    func getpath(Dbname :String) -> String  {
        let documanDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documanDirectory.appending(component: Dbname)
        print (fileUrl.path)
        return fileUrl.path()
    }
    func copyDatabase (Dbname : String ) {
        let Dbpath = getpath(Dbname: Dbname )
        let fileManager = FileManager.default
        
        
        if !fileManager.fileExists(atPath: Dbpath) {
            let bundle =  Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(Dbname)
            do {
                try fileManager.copyItem(atPath: file!.path ,toPath: Dbpath)
            }catch let err{
                print (err.localizedDescription )
            }
            
        }
    }
    
    
    
    
    
    
    
    
}


