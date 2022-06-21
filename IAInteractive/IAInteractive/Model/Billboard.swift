//
//  Billboard.swift
//  IAInteractive
//
//  Created by catalina lozano on 18/06/22.
//

import Foundation

struct Principal : Codable{
    var movies : [Perfil]?
    var routes : [Routes]?
}
struct Perfil : Codable{
    var rating : String?
    var media : [Media]?
    var cast : [Cast]?
    var cinemas : [String]? = nil
    var position : Int?
    var categories : [String]?
    var genre : String?
    var synopsis : String?
    var length : String?
    var release_date : String?
    var distributor : String?
    var id: Int?
    var name: String?
    var code : String?
    var original_name : String?
}
struct Media : Codable{
    var resource : String?
    var type : String?
    var code : String?
}
struct Cast : Codable {
    var label : String?
    var value : [String]?
}

struct Routes : Codable{
    var code : String?
    var sizes : Tamanio?
}
struct Tamanio : Codable{
    var large : String?
    var medium : String?
    var small : String?
    //var x-large : String?
}
