//
//  DetalhesViewData.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/19/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation
import UIKit

protocol DetailMovieViewDataType {
    var backdropPath: String { get }
    var id: Int { get }
    var originalTitle: String { get }
    var overview: String { get }
    var posterPath:  String { get }
    var title: String { get }
    var voteAverage: Double { get }
}
class DetalhesFilmeViewData {
    
    private let model:FilmeSimples
    
    init(model:FilmeSimples) {
        
        self.model = model
    }
    
}
extension DetalhesFilmeViewData: DetailMovieViewDataType {
    var backdropPath: String {
        guard let backdropPath = model.backdropPath else { return "" }
        return backdropPath
    }
    
    var id: Int {
        guard let id = model.id else { return 0 }
        return id
    }
    
    var originalTitle: String {
        guard let originalTitle = model.originalTitle else { return "" }
        return originalTitle
    }
    
    var overview: String {
        guard let overview = model.overview else { return "" }
        return overview
    }
    
    var posterPath: String {
        guard let posterPath = model.posterPath else { return "" }
        return posterPath
    }
    
    var title: String {
        guard let title = model.title else { return "" }
        return title
    }
    
    var voteAverage: Double {
        guard let voteAverage = model.voteAverage else { return 0.0 }
        return voteAverage
    }
}

