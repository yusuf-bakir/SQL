//
//  ModelManager.swift
//  Veritabanıişlemleri
//
//  Created by yusuf bakır on 26.04.2023.
//

import Foundation
import UIKit
var shareInstance = ModelManager()

class ModelManager {
    var database : FMDatabase? = nil
    static func getIntance () -> ModelManager {
        if shareInstance == nil {
            shareInstance.database = FMDatabase(path : Util.share.getpath(Dbname: "veritaban.sqlite"))
        }
        return shareInstance
    }
    
    
    
    func SaveStudent ( kişiler :kişiler) -> Bool {
        shareInstance.database?.open()
        let issave = shareInstance.database?.executeQuery("INSERT INTO kişiler (kişi_ad,kişi_yaş) VALUES(?,?)",withArgumentsIn: [kişiler.name,kişiler.age])
        shareInstance.database?.close()
        return true
        
    }
    
   
}
