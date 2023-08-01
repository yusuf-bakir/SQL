//
//  ViewController.swift
//  Veritabanıişlemleri
//
//  Created by yusuf bakır on 25.04.2023.
//

import UIKit
import SQLite3
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       let nesne = kişiler(ID: 1, name: "yusuf", age: "43")
        let issave = ModelManager.getIntance().SaveStudent(kişiler: nesne)
        print ("issave  \(issave)")
        
        
    }
    
    
    
}
