//
//  MapaViewController.swift
//  Agenda
//
//  Created by Ana Leticia Camargos on 05/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class MapaViewController: UIViewController {
    
    // MARK: - Variaveis
    
    var aluno: Aluno?
    
    // MARK: - View Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.getTitulo()
    }
    
    // MARK: - Metodos
    
    func getTitulo() -> String {
        return "Localizar alunos"
    }


}
