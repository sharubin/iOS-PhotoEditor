//
//  EditorViewController.swift
//  PhotoEditorVSCO
//
//  Created by Artsem Sharubin on 20.01.2022.
//

import Foundation
import UIKit
import Then

class EditorViewController: UIViewController {
    
    public var picture: UIImage?
    var imageView = UIImageView()
    var filterView = UIView()
    let stackView = UIStackView()
    
    let btn1 = UIButton()
    let btn2 = UIButton()
    let btn3 = UIButton()
    let btn4 = UIButton()
    let btn5 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = self.picture
        filterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        configure()
    }
    
    @objc func action1() {
        filterView.backgroundColor = UIColor.Filter.blue
    }
    
    @objc func action2() {
        filterView.backgroundColor = UIColor.Filter.yellow
    }
    
    @objc func action3() {
        filterView.backgroundColor = UIColor.Filter.grey
    }
    
    @objc func action4() {
        filterView.backgroundColor = UIColor.Filter.orange
    }
    
    @objc func action5() {
        filterView.backgroundColor = UIColor.Filter.purple
    }
}

extension EditorViewController {
    private func configure() {
        
        imageView.then {
            view.addSubview($0)
            $0.contentMode = .scaleToFill
            $0.snp.makeConstraints({ maker in
                maker.right.left.equalToSuperview().inset(20)
                maker.top.equalToSuperview().inset(120)
                maker.height.equalTo(350)
            })
        }
                
        filterView.then {
            view.addSubview($0)
            $0.snp.makeConstraints({ maker in
                maker.right.left.equalToSuperview().inset(20)
                maker.top.equalToSuperview().inset(120)
                maker.height.equalTo(350)
            })
        }
        
        btn1.then {
            $0.backgroundColor = .red
            $0.setTitle("PE2", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(action1), for: .touchUpInside)
        }
        
        btn2.then {
            $0.backgroundColor = .red
            $0.setTitle("DH8", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(action2), for: .touchUpInside)
        }
        
        btn3.then {
            $0.backgroundColor = .red
            $0.setTitle("DH7", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(action3), for: .touchUpInside)
        }
        
        btn4.then {
            $0.backgroundColor = .red
            $0.setTitle("NE9", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(action4), for: .touchUpInside)
        }
        
        btn5.then {
            $0.backgroundColor = .red
            $0.setTitle("KE2", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(action5), for: .touchUpInside)
        }
    
        stackView.then {
            view.addSubview($0)
            $0.addArrangedSubview(btn1)
            $0.addArrangedSubview(btn2)
            $0.addArrangedSubview(btn3)
            $0.addArrangedSubview(btn4)
            $0.addArrangedSubview(btn5)
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 5
            $0.snp.makeConstraints { maker in
                maker.left.right.bottom.equalToSuperview().inset(15)
                maker.height.equalTo(100)
            }
        }
    }
}
