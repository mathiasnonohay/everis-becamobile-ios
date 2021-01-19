//
//  Accessibility.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/19/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

extension DetailMovieViewController {
    // MARK: - AccessbilityDetail
    
    func setupAccessibilityDetail() {
        labelTitulo.accessibilityTraits = .header
        botaoSair.accessibilityTraits = .button
        botaoSair.accessibilityHint = "Volta para a lista de filmes"
        
        self.accessibilityElements = [labelTitulo, labelSinopse, labelRating, labelTituloOriginal, botaoSair]
        
    }
}

extension HomeViewController {
    // MARK: - AccessibilityHome
    
    func setupAccessibilityHome() {
        
        labelFilmesPopulares.accessibilityTraits = .header
    }
}

extension FilmeCollectionViewCell {
    // MARK: - AccessibilityCélula
    
    func setupAccessibilityCell() {
        labelTitulo.accessibilityHint = "Clique para ver detalhes"
    }
}
