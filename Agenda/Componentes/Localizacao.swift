//
//  Localizacao.swift
//  Agenda
//
//  Created by Ana Leticia Camargos on 04/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import CoreLocation

class Localizacao: NSObject {

    func converteEnderecoEmCoordenadas(endereco: String, local:@escaping(_ local: CLPlacemark) -> Void) {
        let conversor = CLGeocoder()
        conversor.geocodeAddressString(endereco) { (listaDeLocalizacoes, error) in
            if let localizacao = listaDeLocalizacoes?.first {
                local(localizacao)
            }
        }
    }
    
}
