//
//  FlowLayoutView.swift
//  PlayFlowLayout
//
//  Created by Carki on 2023/01/03.
//

import UIKit

import SnapKit

final class FlowLayoutView: BaseView {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = (UIScreen.main.bounds.width - spacing * 3) / 2
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: 280)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return view
    }()
    
    let comCollectionView: UICollectionView = {
        let spacing: CGFloat = 8
        let width = (UIScreen.main.bounds.width - spacing * 4) / 2

        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(280))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(spacing), top: nil, trailing: .fixed(spacing), bottom: nil)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: item.layoutSize.heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
//    let configureLayout() -> UICollectionViewCompositionalLayout {
//        
//    }
    
    override func configureUI() {
        self.addSubview(collectionView)
        self.addSubview(comCollectionView)
        self.backgroundColor = .white
    }
    
    override func setConstraints() {
        let screenHeight = UIScreen.main.bounds.size.height
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(screenHeight / 2)
        }
        
        comCollectionView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(collectionView.snp.height)
        }
    }
}
