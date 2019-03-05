//
//  MapaViewController.swift
//  Agenda
//
//  Created by Ana Leticia Camargos on 05/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var mapa: MKMapView!
    
    // MARK: - Variaveis
    
    var aluno: Aluno?
    
    // MARK: - View Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.getTitulo()
        self.localizacaoInicial()
        self.localizarAluno()
    }
    
    // MARK: - Metodos
    
    func getTitulo() -> String {
        return "Localizar alunos"
    }
    
    func localizacaoInicial() {
        Localizacao().converteEnderecoEmCoordenadas(endereco: "Hotmart - Belo Horizonte") { (localizacaoEncontrada) in
            let pino = self.configuraPino(titulo: "Hotmart", localizacao: localizacaoEncontrada)
            let regiao = MKCoordinateRegion(center: pino.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno() {
        if let aluno = aluno {
            Localizacao().converteEnderecoEmCoordenadas(endereco: aluno.endereco!) { (localizacaoEncontrada) in
                let pino = self.configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada)
                self.mapa.addAnnotation(pino)
            }
        }
    }
    
    func configuraPino(titulo: String, localizacao: CLPlacemark) -> MKPointAnnotation {
        let pino = MKPointAnnotation()
        pino.title = titulo
        pino.coordinate = localizacao.location!.coordinate
        return pino
    }
}
