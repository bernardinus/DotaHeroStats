//
//  ViewController.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var splitView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DataManager.shared.mainVC = self
        splitView.dataSource = self
        splitView.delegate = self
        splitView.register(UINib(nibName: "HeroesCell", bundle: nil), forCellWithReuseIdentifier: "heroesCell")
        splitView.register(UINib(nibName: "RolesCell", bundle: nil), forCellWithReuseIdentifier: "rolesCell")
    }

    func moveToHeroDetail()
    {
        self.performSegue(withIdentifier: "heroDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "heroDetail")
        {
            let heroDetail = segue.destination as! HeroDetailVewController
            heroDetail.reloadData()
        }
    }
}

extension MainVC:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:UICollectionViewCell? = nil
        
        switch  indexPath.row
        {
        case 0:
            var cell2 = splitView.dequeueReusableCell(withReuseIdentifier: "rolesCell", for: indexPath) as! RolesCell
            cell2.reloadData()
            cell = cell2
            
            break
        case 1:
            var cell2 = splitView.dequeueReusableCell(withReuseIdentifier: "heroesCell", for: indexPath) as! HeroesCell
            cell2.backgroundColor = .green
            cell2.mainVC = self
            cell2.reloadData()
            
            cell = cell2
            
            break
            
        default: break
                
        }
        
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print("size")
        switch  indexPath.row
        {
        case 0:
            return CGSize(width: collectionView.frame.width * 0.3, height: collectionView.frame.height)
            
        case 1:
            return CGSize(width: collectionView.frame.width * 0.7, height: collectionView.frame.height)
            
        default:
            return CGSize(width: 0, height: 0)
                
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}



