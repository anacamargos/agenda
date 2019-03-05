//
//  Notificacoes.swift
//  Agenda
//
//  Created by Ana Leticia Camargos on 05/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class Notificacoes: NSObject {
    
    func exibeNotificacao(dicionarioDeMedia: Dictionary<String, Any>) -> UIAlertController? {
        if let media = dicionarioDeMedia["media"] as? String {
            let alerta = UIAlertController(title: "Atenção", message: "A média geral dos alunos é: \(media)", preferredStyle: .alert)
            let botao = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alerta.addAction(botao)
            return alerta
        }
        return nil
        
    }

}
