//
//  HeroesCell.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import UIKit

class HeroesCell: UICollectionViewCell {

    @IBOutlet weak var heroesCollection: UICollectionView!
    var mainVC:MainVC? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .black
        heroesCollection.dataSource = self
        heroesCollection.delegate = self
        heroesCollection.register(UINib(nibName: "HeroCell", bundle: nil), forCellWithReuseIdentifier: "heroCell")
        if let flowLayout = heroesCollection.collectionViewLayout as? UICollectionViewFlowLayout {
          flowLayout.sectionInset.right = flowLayout.itemSize.width / 2
        }
    }
    
    func reloadData()
    {
        heroesCollection.reloadData()
    }

}

extension HeroesCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count \(DataManager.shared.filteredHeroes.count)")
        return DataManager.shared.filteredHeroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroCell", for: indexPath) as! HeroCell
        let hero = DataManager.shared.filteredHeroes[indexPath.row]
        cell.heroImage.downloaded(from: Networking.baseUrl+hero.img)
        
        cell.heroName.text = hero.localized_name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DataManager.shared.selectHero(hero: DataManager.shared.filteredHeroes[indexPath.row])
        self.mainVC?.moveToHeroDetail()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1, left: 0.5, bottom: 1, right: 1)
    }
    
}
