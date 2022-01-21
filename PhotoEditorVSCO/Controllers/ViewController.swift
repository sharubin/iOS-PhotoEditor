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
    
    let buttonAdd = UIButton()
    
    let buttonEdit = UIButton()
    
    var picture = UIImageView()
    
    private var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
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
}


extension ViewController {
    
    private func configure() {
        buttonAdd.then {
            $0.setImage(UIImage(systemName: "plus"), for: .normal)
            view.addSubview($0)
            $0.addTarget(self, action: #selector(addAction), for: .touchUpInside)
            $0.snp.makeConstraints { maker in
                maker.right.equalToSuperview().inset(25)
                maker.top.equalToSuperview().inset(70)
                maker.height.equalTo(50)
                maker.width.equalTo(30)
            }
        }
        
        buttonEdit.then {
            view.addSubview($0)
            $0.setImage(UIImage(systemName: "scissors"), for: .normal)
            $0.addTarget(self, action: #selector(editAction), for: .touchUpInside)
            $0.snp.makeConstraints { maker in
                maker.width.equalTo(70)
                maker.height.equalTo(45)
                maker.left.equalToSuperview().inset(20)
                maker.bottom.equalToSuperview().inset(35)
            }
        }
        
        picture.then {
            view.addSubview($0)
            $0.snp.makeConstraints { maker in
                maker.width.equalTo(200)
                maker.height.equalTo(225)
                maker.top.equalToSuperview().inset(50)
                maker.left.equalToSuperview().inset(20)
            }
        }
    }
}


extension ViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.picture.image = image
    }
}
