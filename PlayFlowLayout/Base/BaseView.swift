//
//  BaseView.swift
//  PlayFlowLayout
//
//  Created by Carki on 2023/01/03.
//
import UIKit

import SnapKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
    
    func setConstraints() { }
}
