//
//  HomeTableViewCell.swift
//  Agenda
//
//  Created by Ana Leticia Camargos on 02/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {


    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var imagemAluno: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configuraCelula(_ aluno: Aluno) {
        self.labelNome.text = aluno.nome
        self.imagemAluno.layer.cornerRadius = imagemAluno.frame.width / 2
        self.imagemAluno.layer.masksToBounds = true
        if let imagemDoAlumo = aluno.foto as? UIImage {
            self.imagemAluno.image = imagemDoAlumo
        }
    }

}
