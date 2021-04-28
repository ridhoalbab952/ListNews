//
//  News.swift
//  listnews
//
//  Created by Albab on 27/04/21.
//

import Foundation

struct News: Identifiable{
    let id = UUID()
    let title : String
    let description : String
    let image : String
}
