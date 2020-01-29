//
//  Safe.swift
//  Singleton
//
//  Created by Алексей Макаров on 29.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

class Safe {
    
    var money = 0
    
    static let shared = Safe() // создали singleton
    
    private init() {} // прячем конструктор чтобы нельзя было создавать экзмпляр
    
}
