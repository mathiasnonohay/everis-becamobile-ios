//
//  MovieService.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/12/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import CoreData

class MovieService {
    // MARK: - Atributos
    
    let apiKey = "96dd278d45abf85bc179831d48f22e83"
    let movieUrl = "https://api.themoviedb.org/"
    let imageUrl = "https://image.tmdb.org"
//    private var poster = [Poster]()
    private var filmes = [Filme]()

    // MARK: - Métodos
    func getFilmesPopulares(_ paginaToBe: Int, completionHandler: @escaping ([Filme]) -> Void, failure: @escaping  (Error) -> Void) {
        // Método para pegar os filmes popularesda semana
        Alamofire.request("\(movieUrl)3/trending/movie/week?api_key=\(apiKey)&language=pt-BR&page=\(paginaToBe)", method: .get).responseJSON { ( response ) in
            switch response.result {
            case .success:
                guard let dataFilme = response.data else { return }
                do {
                    let filmes = try JSONDecoder().decode(ListaFilmes.self, from: dataFilme)
                    let listaFilmes = filmes.results
                    completionHandler(listaFilmes)
                } catch {
                    print(error.localizedDescription)
                }
                break
            case .failure:
                failure(response.error!)
                break
            }
        }
    }
    func getFilmeDetalhe(_ id: Int, completionHandler: @escaping (Filme) -> Void, failure: @escaping  (Error) -> Void) {
        // Método para pegar os filmes popularesda semana
        Alamofire.request("\(movieUrl)3/movie/\(id)?api_key=\(apiKey)&language=pt-BR", method: .get).responseJSON { ( response ) in
            switch response.result {
            case .success:
                guard let dataFilme = response.data else { return }
                do{
                    let filme = try JSONDecoder().decode(Filme.self, from: dataFilme)
                    completionHandler(filme)
                } catch {
                    print(error.localizedDescription)
                }
                break
            case .failure:
                failure(response.error!)
                break
            }
        }
    }
    
    func getPosterFilme(_ posterPath: String, completion: @escaping(_ posterFilme: Image) ->Void) {
        // Método para pegar o poster de cada filme
        Alamofire.request("\(self.imageUrl)/t/p/w500\(posterPath)", method: .get).responseImage(completionHandler: { (response) in
            switch response.result {
            case .success:
                guard let posterFilme = response.result.value else { return}
                completion(posterFilme)
                break
            case .failure:
                print(response.error!, "Erro ao buscar imagem")
                break
            }
        })
    }
}
