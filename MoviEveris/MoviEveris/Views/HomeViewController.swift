//
//  HomeViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/12/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - Outlet
    
    @IBOutlet weak var labelFilmesPopulares: UILabel!
    @IBOutlet weak var colecaoFilmes: UICollectionView!

    // MARK: - Atributos
    
    var listaFilmesSimples = [FilmeSimples]()
    var posterPath: String = ""
    var paginaAtual = 1
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.listaFilmesSimples.count)
        MovieService().getFilmesPopulares(self.paginaAtual) { (listaFilmes) in
            self.listaFilmesSimples = listaFilmes.map({ return FilmeSimples(filme: $0)})
            self.colecaoFilmes.reloadData()
        } failure: { (error) in
            print(error)
        }
        setupAccessibilityHome()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self

    }
    
    // MARK: - Accessibility
    
    
    
    // MARK: - Métodos
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Quantidade de Filmes: ", listaFilmesSimples.count)
        return listaFilmesSimples.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // método que coloca dados de poster e titulo nas células de filmes na primeira página
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        
        let filmeAtual = listaFilmesSimples[indexPath.item]
        
        guard let posterUrl = filmeAtual.backdropPath else { return celulaFilme }
        MovieService().getPosterFilme(posterUrl) { (imagem) in
            celulaFilme.posterFilme.image = imagem
        }
        guard let titulo = filmeAtual.title else { return celulaFilme }
        
        
        celulaFilme.labelTitulo.text = titulo
        celulaFilme.configuraCelula(filmeAtual)
        celulaFilme.setupAccessibilityCell()
        
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filme = listaFilmesSimples[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetailMovieViewController
        controller.filmeSelecionado = filme
        controller.paginaAtual = self.paginaAtual
        
        self.present(controller, animated: true, completion: nil)
        
    }
    
    // MARK: - Action

    @IBAction func paginaAnterior(_ sender: UIButton) {
        if self.paginaAtual > 1 {
            self.paginaAtual = self.paginaAtual - 1
            MovieService().getFilmesPopulares(self.paginaAtual) { (filmes) in
                let listaFilmesAtual = filmes.map({ return FilmeSimples(filme: $0)})
                self.listaFilmesSimples = listaFilmesAtual
                self.colecaoFilmes.reloadData()
            } failure: { (error) in
                print(error)
            }
        }
    }
    @IBAction func proximaPagina(_ sender: UIButton) {
        self.paginaAtual = self.paginaAtual + 1
        MovieService().getFilmesPopulares(self.paginaAtual) { (filmes) in
            let listaFilmesAtual = filmes.map({ return FilmeSimples(filme: $0)})
            self.listaFilmesSimples = listaFilmesAtual
            self.colecaoFilmes.reloadData()
        } failure: { (error) in
            print(error)
        }
    }

}

