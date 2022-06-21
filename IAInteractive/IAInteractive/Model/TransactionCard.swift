//
//  TransactionCard.swift
//  IAInteractive
//
//  Created by catalina lozano on 18/06/22.
//

import Foundation

struct Profile: Codable{
    var name:String?
    var email:String?
    var pin: String? = nil
    var balance_list: [Balance]?
    var level:Nivel?
    var transactions: [Transact]?
}

struct Balance: Codable{
    var balance: Int?
    var key: String?
    var name: String?
    var message:String?
}

struct Nivel: Codable{
    var next_level: String?
    var advance_percent: Int?
    var key: String?
    var name:String?
    var message:String?
}
struct Transact: Codable{
    var cinema: String?
    var message: String?
    var date: String?
    var points:Int?
}
