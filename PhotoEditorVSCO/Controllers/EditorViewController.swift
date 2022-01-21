//
//  EditorViewController.swift
//  PhotoEditorVSCO
//
//  Created by Artsem Sharubin on 20.01.2022.
//

import Foundation
import UIKit

class EditorViewController: UIViewController {
    
    public var picture: UIImage?
    var imageView = UIImageView()
    var stackView = UIStackView()
    var filterView = UIView()
    
    var btn1 = UIButton()
    var btn2 = UIButton()
    var btn3 = UIButton()
    var btn4 = UIButton()
    var btn5 = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.image = self.picture
        filterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        configure()
        btn1.addTarget(self, action: #selector(action1), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(action2), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(action3), for: .touchUpInside)
        btn4.addTarget(self, action: #selector(action4), for: .touchUpInside)
        btn5.addTarget(self, action: #selector(action5), for: .touchUpInside)
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
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.snp.makeConstraints({ maker in
            maker.right.left.equalToSuperview().inset(20)
            maker.top.equalToSuperview().inset(120)
            maker.height.equalTo(350)
        })
        
        view.addSubview(filterView)
        filterView.snp.makeConstraints({ maker in
            maker.right.left.equalToSuperview().inset(20)
            maker.top.equalToSuperview().inset(120)
            maker.height.equalTo(350)
        })
        
        
        view.addSubview(stackView)
        
        btn1.backgroundColor = .red
        btn1.setTitle("PE2", for: .normal)
        btn1.setTitleColor(.white, for: .normal)
        btn2.backgroundColor = .red
        btn2.setTitle("DH8", for: .normal)
        btn2.setTitleColor(.white, for: .normal)
        btn3.backgroundColor = .red
        btn3.setTitle("DH7", for: .normal)
        btn3.setTitleColor(.white, for: .normal)
        btn4.backgroundColor = .red
        btn4.setTitle("NE9", for: .normal)
        btn4.setTitleColor(.white, for: .normal)
        btn5.backgroundColor = .red
        btn5.setTitle("KE2", for: .normal)
        btn5.setTitleColor(.white, for: .normal)
        
        stackView.addArrangedSubview(btn1)
        stackView.addArrangedSubview(btn2)
        stackView.addArrangedSubview(btn3)
        stackView.addArrangedSubview(btn4)
        stackView.addArrangedSubview(btn5)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.snp.makeConstraints { maker in
            maker.left.right.bottom.equalToSuperview().inset(15)
            maker.height.equalTo(100)
        }
    }
}
