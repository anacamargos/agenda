//
//  AlunoViewController.swift
//  Agenda
//
//  Created by Ana Leticia Camargos on 02/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class AlunoViewController: UIViewController {

    @IBOutlet weak var scrollViewPrincipal: UIScrollView!
    @IBOutlet weak var buttonFoto: UIButton!
    @IBOutlet weak var imagemAluno: UIImageView!
    @IBOutlet weak var viewImagemAluno: UIView!
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textFieldSite: UITextField!
    @IBOutlet weak var textFieldNota: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arredondaView()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScrollView(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Métodos
    
    func arredondaView() {
        self.viewImagemAluno.layer.cornerRadius = self.viewImagemAluno.frame.width / 2
        self.viewImagemAluno.layer.borderWidth = 1
        self.viewImagemAluno.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func aumentarScrollView(_ notification:Notification) {
        self.scrollViewPrincipal.contentSize = CGSize(width: self.scrollViewPrincipal.frame.width, height: self.scrollViewPrincipal.frame.height + self.scrollViewPrincipal.frame.height/2)
    }
    
    @IBAction func buttonFoto(_ sender: UIButton) {
    }
    @IBAction func stepperNota(_ sender: UIStepper) {
        self.textFieldNota.text = "\(sender.value)"
    }
}
