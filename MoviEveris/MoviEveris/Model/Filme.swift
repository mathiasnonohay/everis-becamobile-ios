//
//  File.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

// MARK: - CodingKeys

enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case belongsToCollection = "belongs_to_colle"
    case budget
    case genres
    case homepage
    case id
    case imdbID = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview
    case popularity
    case posterPath = "poster_path"
    case productionCompanies = "production_companies"
    case productionCountry = "production_countries"
    case releaseDate = "release_date"
    case revenue
    case runtime
    case spokenLanguage = "spoken_language"
    case status
    case tagline
    case title
    case video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
}

class Filme: NSObject, Encodable {
    
    // MARK: - Atributos
    
    let adult: Bool
    let backdropPath: String
//    let belongsToCollection: JSONNull?
    let budget: Int
    let genres: [Genero]
    let homepage: String
    let id: Int
    let imdbID: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [EmpresaProdutora]
    let productionCountry: [PaisProdutor]
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [LinguasFaladas]
    let status: String
    let tagline :String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    // MARK: - Init
    
    init(adult: Bool, backdropPath: String, budget: Int, genres: [Genero], homepage: String, id: Int, imdbID: String, originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, productionCompanies: [EmpresaProdutora], productionCountry:[PaisProdutor], releaseDate: String, revenue: Int, runtime: Int, spokenLanguages: [LinguasFaladas], status: String, tagline: String, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
//        self.belongsToCollection = belongsToCollection
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdbID = imdbID
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.productionCompanies = productionCompanies
        self.productionCountry = productionCountry
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    
}
