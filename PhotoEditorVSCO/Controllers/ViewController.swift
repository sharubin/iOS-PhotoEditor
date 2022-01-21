//
//  ViewController.swift
//  PhotoEditorVSCO
//
//  Created by Artsem Sharubin on 20.01.2022.
//
import SnapKit
import Then
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    
    private var buttonAdd: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        
        return button
    }()
    
    private var buttonEdit: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "scissors"), for: .normal)
        
        return button
    }()
    
    var picture = UIImageView()
    
    private var imagePicker: ImagePicker!
    
    @objc func addAction(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
    }
    
    @objc func editAction(_ sender: Any) {
        let vc = EditorViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .partialCurl
        vc.picture = self.picture.image
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }

}


extension ViewController {
    
    private func configure() {
        view.addSubview(buttonAdd)
        buttonAdd.snp.makeConstraints { maker in
            maker.right.equalToSuperview().inset(25)
            maker.top.equalToSuperview().inset(70)
            maker.height.equalTo(50)
            maker.width.equalTo(30)
        }
        buttonAdd.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        
        view.addSubview(picture)
        picture.snp.makeConstraints { maker in
            maker.width.equalTo(200)
            maker.height.equalTo(225)
            maker.top.equalToSuperview().inset(50)
            maker.left.equalToSuperview().inset(20)
        }
        
        view.addSubview(buttonEdit)
        buttonEdit.snp.makeConstraints { maker in
            maker.width.equalTo(70)
            maker.height.equalTo(45)
            maker.left.equalToSuperview().inset(20)
            maker.bottom.equalToSuperview().inset(35)
        }
        buttonEdit.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        
        
    }
}



extension ViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.picture.image = image
    }
    
    
}
