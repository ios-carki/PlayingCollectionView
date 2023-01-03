//
//  FlowLayoutCell.swift
//  PlayFlowLayout
//
//  Created by Carki on 2023/01/03.
//

import UIKit

final class FlowLayoutCell: BaseCollectionViewCell {
    
    static let identifier = "flowCell"
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    let sesacCharView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = .white
        return view
    }()
    
    let sesacCharImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let charNameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16)
        view.textColor = .black
        return view
    }()
    
    let priceLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightGray
        
        view.text = "1,200"
        return view
    }()
    
    let charDetailLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.textColor = .black
        return view
    }()
    
    override func configureUI() {
        [sesacCharView, sesacCharImage, charNameLabel, priceLabel, charDetailLabel].forEach {
            cellView.addSubview($0)
        }
        contentView.addSubview(cellView)
        contentView.backgroundColor = .white
    }
    
    override func setConstraints() {
        
        cellView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.verticalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        sesacCharView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(cellView.safeAreaLayoutGuide)
            make.centerX.equalTo(cellView.safeAreaLayoutGuide)
            make.height.equalTo(165)
        }
        
        sesacCharImage.snp.makeConstraints { make in
            make.center.equalTo(sesacCharView.safeAreaLayoutGuide)
        }
        
        charNameLabel.snp.makeConstraints { make in
            make.top.equalTo(sesacCharView.snp.bottom).offset(8)
            make.leading.equalTo(cellView.safeAreaLayoutGuide)
            make.height.equalTo(26)
        }
        
        priceLabel.snp.makeConstraints { make in
            //make.height.equalTo(18)
            make.centerY.equalTo(charNameLabel.snp.centerY)
            make.trailing.equalTo(cellView.safeAreaLayoutGuide)
        }
        
        charDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(charNameLabel.snp.bottom).offset(8)
            make.horizontalEdges.bottom.equalTo(cellView.safeAreaLayoutGuide)
        }
        
    }
}
