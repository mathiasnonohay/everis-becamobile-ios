//
//  FilmeAPI.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class FilmeAPI: NSObject {
    
    var filmes:[String:Any] = [:]
    var filmeAtual:[String:Any] = [:]
    let apiKey = "96dd278d45abf85bc179831d48f22e83"
    let movieUrl = "https://api.themoviedb.org/"
    let imageUrl = "https://image.tmdb.org"
    
    func getFilmesPopulares(completion:@escaping(_ filmes:[[String:Any]]) -> Void ) {
        Alamofire.request("\(movieUrl)3/trending/movie/week?api_key=\(apiKey)&language=pt-BR&page=1", method: .get).responseJSON { (response) in

            var filmesLista:[[String:Any]] = [[:]]
            switch response.result {
            case .success:
                if let resposta = response.result.value as? [String:Any] {
                    guard let filmeData = resposta["results"] as? [[String:Any]] else { return }
                    print(filmeData)
                    for filme in filmeData {
                        guard let id = filme["id"] else { return }
                        guard let tituloOriginal = filme["original_title"] else { return }
                        guard let titulo = filme["title"] else { return }
                        guard let posterPath = filme["poster_path"] else { return }
                        guard let sinopse = filme["overview"] else { return }
                        guard let rating = filme["vote_average"] else { return }
                        self.filmeAtual = [
                            "id":id,
                            "tituloOriginal": tituloOriginal,
                            "titulo":titulo,
                            "poster":posterPath,
                            "sinopse":sinopse,
                            "rating": rating
                        ]
                        filmesLista.append(self.filmeAtual)
                    }
                    completion(filmesLista)
                }
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
    func getPosterFilme(completion: @escaping(_ filmes: [[String:Any]]) ->Void) {
        getFilmesPopulares() { (filmes) in
            var filmesLista:[[String:Any]] = [[:]]
            
            for filme in filmes {
                
                if let posterPath = filme["poster"] as? String {
                    guard let titulo = filme["titulo"] else { return }
                    guard let id = filme["id"] else { return }
                    Alamofire.request("\(self.imageUrl)/t/p/w500\(posterPath)", method: .get).responseImage(completionHandler: { (response) in
                        switch response.result {
                        case .success:
                            if let poster = response.result.value {
                                self.filmeAtual = [
                                    "titulo":titulo,
                                    "poster":poster,
                                    "id":id
                                ]
                                filmesLista.append(self.filmeAtual)
                                completion(filmesLista)
                            }
                            
                            break
                            
                        case .failure:
                            print(response.error!, "Erro ao buscar imagem")
                            break
                        }
                    })
                }
            }
        }
    }
    func filmeDetalhes(_ id:Int, completion: @escaping(_ filme:[[String:Any]]) -> Void)  {
        getFilmesPopulares() { (filmes) in
            
            let filmeAtual = filmes.filter({ filmeAtual in
                
                guard let filme = filmeAtual["id"] as? Int else { return false }
                
                return filme == id
                
            })
            
            completion(filmeAtual)
        }
    }
    
}
