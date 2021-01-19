//
//  HomeViewModel.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/19/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

//import Foundation
//import UIKit
//
//class HomeViewModel {
//    
//    // MARK: - Variables
//    
//    var listaFilmes:[FilmeSimples] = []
//    var filmeAPI = MovieService()
//    var paginaAtual = 1
//    var homeViewData: Bindable<HomeViewData?> = Bindable(nil)
//    
//    // MARK: - Methods
//    
//    func carregaFilmes(_ viewController: UIViewController, valueToAddOnPage:Int) {
//        MovieService().getFilmesPopulares(self.paginaAtual) { (listaFilmes) in
//            self.listaFilmes = listaFilmes
//            print(listaFilmes)
//            self.homeViewData.value = HomeViewData(model: self.listaFilmes)
//        } failure: { (error) in
//            print(error)
//        }
//    }
//}
