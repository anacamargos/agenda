//
//  AlunoViewController.swift
//  Agenda
//
//  Created by Ana Leticia Camargos on 02/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import CoreData

class AlunoViewController: UIViewController, ImagePickerFotoSelecionada {
    

    // MARK: - Outlets

    @IBOutlet weak var scrollViewPrincipal: UIScrollView!
    @IBOutlet weak var buttonFoto: UIButton!
    @IBOutlet weak var imagemAluno: UIImageView!
    @IBOutlet weak var viewImagemAluno: UIView!
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textFieldSite: UITextField!
    @IBOutlet weak var textFieldNota: UITextField!
    
    // MARK: - Atributos
    
    let imagePicker = ImagePicker()
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    var aluno: Aluno?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arredondaView()
        self.setUp()
        
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScrollView(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    // MARK: - Métodos
    
    func setUp() {
        imagePicker.delegate = self
        guard let alunoSelecionado = aluno else { return }
        textFieldNome.text = alunoSelecionado.nome
        textFieldEndereco.text = alunoSelecionado.endereco
        textFieldTelefone.text = alunoSelecionado.telefone
        textFieldSite.text = alunoSelecionado.site
        textFieldNota.text = "\(alunoSelecionado.nota)"
        imagemAluno.image = alunoSelecionado.foto as? UIImage
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func arredondaView() {
        self.viewImagemAluno.layer.cornerRadius = self.viewImagemAluno.frame.width / 2
        self.viewImagemAluno.layer.masksToBounds = true
        self.viewImagemAluno.layer.borderWidth = 1
        self.viewImagemAluno.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func aumentarScrollView(_ notification:Notification) {
        self.scrollViewPrincipal.contentSize = CGSize(width: self.scrollViewPrincipal.frame.width, height: self.scrollViewPrincipal.frame.height + self.scrollViewPrincipal.frame.height/2)
    }
    
    func mostrarMultimidia(_ opcao: MenuOpcoes) {
        
        let multimidia = UIImagePickerController()
        multimidia.delegate = imagePicker
        
        if opcao == .camera && UIImagePickerController.isSourceTypeAvailable(.camera) {
            multimidia.sourceType = .camera
        } else {
            multimidia.sourceType = .photoLibrary
        }
        self.present(multimidia, animated: true, completion: nil)
    
    }
    
    // MARK: - Delegate
    
    func imagePickerFotoSelecionada(_ foto: UIImage) {
        imagemAluno.image = foto
    }
    
    
    // MARK: - IBActions
    
    @IBAction func buttonFoto(_ sender: UIButton) {
        let menu = ImagePicker().menuDeOpcoes { (opcao) in
            self.mostrarMultimidia(opcao)
        }
        present(menu, animated: true, completion: nil)
    }
    
    @IBAction func stepperNota(_ sender: UIStepper) {
        self.textFieldNota.text = "\(sender.value)"
    }
    
    @IBAction func buttonSalvar(_ sender: UIButton) {
        
        if aluno == nil {
            aluno = Aluno(context: contexto)
        }
        
        aluno?.nome = textFieldNome.text
        aluno?.endereco = textFieldEndereco.text
        aluno?.telefone = textFieldTelefone.text
        aluno?.site = textFieldSite.text
        aluno?.nota = (textFieldNota.text! as NSString).doubleValue
        aluno?.foto = imagemAluno.image
        
        do {
            try contexto.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
        

    }
    
}
