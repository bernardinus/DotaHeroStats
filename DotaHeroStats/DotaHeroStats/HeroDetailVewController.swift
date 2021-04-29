//
//  HeroDetailVewController.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import UIKit

class HeroDetailVewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedHero:Hero? = nil
    var heroAttrKey:[String] = []
    var heroAttrValue:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HeroDetailCellAttribute", bundle: nil), forCellReuseIdentifier: "heroAttr")
        tableView.register(UINib(nibName: "HeroDetailCellHeader", bundle: nil), forCellReuseIdentifier: "heroHeader")
        tableView.register(UINib(nibName: "HeroDetailCellAlter", bundle: nil), forCellReuseIdentifier: "heroAlter")
        tableView.reloadData()
    }
    

    func reloadData()
    {
        selectedHero = DataManager.shared.selectedHero
        heroAttrKey = selectedHero!.keyList()
        heroAttrValue = selectedHero!.valueList()
    }

}

extension HeroDetailVewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroAttrKey.count+2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "heroHeader", for: indexPath) as! HeroDetailCellHeader
            cell.heroImage.downloaded(from: Networking.baseUrl+selectedHero!.img)
            cell.heroName.text = selectedHero!.localized_name
            cell.heroRole.text = selectedHero!.roles.joined(separator: ",")
            return cell
        }
        else if (indexPath.row == 1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "heroAlter", for: indexPath) as! HeroDetailCellAlter
            var similarHero = DataManager.shared.similarHero
            cell.alterHero1.downloaded(from: Networking.baseUrl+similarHero[0].img)
            cell.ahName1.text = similarHero[0].localized_name
            cell.alterHero2.downloaded(from: Networking.baseUrl+similarHero[1].img)
            cell.ahName2.text = similarHero[1].localized_name
            cell.alterHero3.downloaded(from: Networking.baseUrl+similarHero[2].img)
            cell.ahName3.text = similarHero[2].localized_name
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "heroAttr", for: indexPath) as! HeroDetailCellAttribute
            var index = indexPath.row - 2
            cell.key.text = heroAttrKey[index]
            cell.value.text = heroAttrValue[index]
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 286
        case 1:
            return 200
        default:
            return 44
        }
    }
    
    
}
