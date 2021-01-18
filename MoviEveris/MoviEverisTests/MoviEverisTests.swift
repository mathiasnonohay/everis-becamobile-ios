//
//  MoviEverisTests.swift
//  MoviEverisTests
//
//  Created by Mathias Almeida Nonohay on 1/18/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import XCTest
@testable import MoviEveris

class MoviEverisTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFilmeSimples() {
        let filme = Filme(adult: false, backdropPath: "caminho para imagem", belongsToCollection: nil, budget: 1000000, genres: nil, homepage: "", id: 1, imdbID: "123", originalLanguage: "Portuguese", originalTitle: "Filme Top", overview: "O filme de um filme", popularity: 9.9, posterPath: "", productionCompanies: nil, productionCountries: nil, releaseDate: "", revenue: 2000000, runtime: 12, spokenLanguages: nil, status: "", tagline: "", title: "Filme Top", video: false, voteAverage: 8.75, voteCount: 1233000)
        let filmeSimples = FilmeSimples(filme: filme)
        
        // vamos testar se o filmeSimples
        
        XCTAssertEqual(filme.title, filmeSimples.title)
        
    }
    
    

}
