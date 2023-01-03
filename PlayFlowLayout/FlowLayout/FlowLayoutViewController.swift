//
//  FlowLayoutViewController.swift
//  PlayFlowLayout
//
//  Created by Carki on 2023/01/03.
//

import UIKit

final class FlowLayoutViewController: UIViewController {
    private let mainView = FlowLayoutView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionSetting()
        //diffableSetting()
    }
    
    private func collectionSetting() {
        mainView.collectionView.register(FlowLayoutCell.self, forCellWithReuseIdentifier: FlowLayoutCell.identifier)
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        mainView.comCollectionView.register(ComLayoutCell.self, forCellWithReuseIdentifier: ComLayoutCell.identifier)
        mainView.comCollectionView.dataSource = self
        mainView.comCollectionView.delegate = self
    }
    
    //    private func diffableSetting() {
    //        let cellRegi = UICollectionView.CellRegistration<FlowLayoutCell, CellData>.init { cell, indexPath, itemIdentifier in
    //            cell.charNameLabel.text = i
    //        }
    //        /*
    //         let cellRegistration = UICollectionView.CellRegistration<ListCollectionViewCell, Photo>.init { cell, indexPath, itemIdentifier in
    //              cell.setData(itemIdentifier)
    //          }
    //         */
    //    }
}

extension FlowLayoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CellData.sesacDataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = mainView.collectionView.dequeueReusableCell(withReuseIdentifier: FlowLayoutCell.identifier, for: indexPath) as? FlowLayoutCell else {
                guard let comCell = mainView.comCollectionView.dequeueReusableCell(withReuseIdentifier: ComLayoutCell.identifier, for: indexPath) as? ComLayoutCell else { return UICollectionViewCell() }
            
                comCell.sesacCharImage.image = UIImage(named: CellData.sesacDataSet[indexPath.row].sesacImageTuple)
                comCell.charNameLabel.text = CellData.sesacDataSet[indexPath.row].sesacNameTuple
                comCell.charDetailLabel.text = CellData.sesacDataSet[indexPath.row].sesacDetailTuple
            
                return comCell
        }
        
        cell.sesacCharImage.image = UIImage(named: CellData.sesacDataSet[indexPath.row].sesacImageTuple)
        cell.charNameLabel.text = CellData.sesacDataSet[indexPath.row].sesacNameTuple
        cell.charDetailLabel.text = CellData.sesacDataSet[indexPath.row].sesacDetailTuple
        
        return cell
    }
    
}
    
    

