//
//  NameModel.swift
//  Swift Practice 168 Search Bar In SwiftUI
//
//  Created by Dogpa's MBAir M1 on 2022/7/21.
//

import Foundation

//百家姓的Model
struct Name: Hashable, Identifiable {
    let id = UUID()
    var name: String
}
