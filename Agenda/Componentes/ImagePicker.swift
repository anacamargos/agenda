//
//  ImagePicker.swift
//  Agenda
//
//  Created by Ana Leticia Camargos on 04/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

protocol ImagePickerFotoSelecionada {
    func imagePickerFotoSelecionada(_ foto: UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Atributos
    var delegate: ImagePickerFotoSelecionada?
    
    // MARK: - Métodos

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let foto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        delegate?.imagePickerFotoSelecionada(foto)
        picker.dismiss(animated: true, completion: nil)
    }
}
