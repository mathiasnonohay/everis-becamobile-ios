//
//  HomeViewData.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/19/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

protocol HomeViewDataType {
    var filmes: [FilmeSimples] { get }
}
class HomeViewData {
    
    private let model:[FilmeSimples]
    
    init(model:[FilmeSimples]) {
        self.model = model
    }
}
extension HomeViewData: HomeViewDataType {
    var filmes: [FilmeSimples] {
        return model
    }
}
