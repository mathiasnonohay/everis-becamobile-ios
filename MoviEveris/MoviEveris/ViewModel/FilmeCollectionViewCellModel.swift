//
//  FilmeCollectionViewCellModel.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/19/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

//import Foundation
//import UIKit
//
//class FilmeCollectionCellViewModel {
//    
//    var homeViewModel = HomeViewModel()
//    
//    
//    func loadFilmes(_ index: IndexPath, filmes:FilmeSimples, collection: UICollectionView) -> UICollectionViewCell {
//        
//        let celulaFilme = collection.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: index) as! FilmeCollectionViewCell
//        let filmeAtual = filmes
//        guard let imagem = filmeAtual.backdropPath else { return celulaFilme }
//        MovieService().getPosterFilme(imagem) { (poster) in
//            celulaFilme.posterFilme.image = poster
//        }
//        celulaFilme.labelTitulo.text = filmeAtual.title
//        return celulaFilme
//    }
//}
