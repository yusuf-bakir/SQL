//
//  veritabanıtlfkaydetme.swift
//  Veritabanıişlemleri
//
//  Created by yusuf bakır on 25.04.2023.
//

import Foundation
import SQLite3

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let databaseFileName = "myDatabase.sqlite"
    private var database: Connection?
    
    private init() {
        copyDatabaseIfNeeded()
    }
    
    private func copyDatabaseIfNeeded() {
        let fileManager = FileManager.default
        let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let databaseUrl = documentsUrl.appendingPathComponent(databaseFileName)
        
        if !fileManager.fileExists(atPath: databaseUrl.path) {
            if let bundlePath = Bundle.main.path(forResource: "myDatabase", ofType: "sqlite") {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: databaseUrl.path)
                } catch {
                    print("Error copying database: \(error.localizedDescription)")
                }
            } else {
                print("Error: Could not find database in bundle.")
            }
        }
    }
    
    func openDatabase() -> Connection? {
        let fileManager = FileManager.default
        let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let databaseUrl = documentsUrl.appendingPathComponent(databaseFileName)
        
        do {
            database = try Connection(databaseUrl.path)
            return database
        } catch {
            print("Error opening database: \(error.localizedDescription)")
            return nil
        }
    }
    
}
