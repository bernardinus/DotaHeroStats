//
//  RolesCell.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import UIKit

class RolesCell: UICollectionViewCell {

    @IBOutlet weak var roleTable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        roleTable.delegate = self
        roleTable.dataSource = self
        roleTable .register(UINib(nibName: "RoleCell", bundle: nil), forCellReuseIdentifier: "roleCell")

    }
    
    func reloadData()
    {
        roleTable.reloadData()
    }

}


extension RolesCell:UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.distinctRoles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roleCell", for: indexPath) as! RoleCell
        cell.layer.cornerRadius = cell.frame.height * 0.5
        cell.roleLabel.text = DataManager.shared.distinctRoles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataManager.shared.selectedRole(role: DataManager.shared.distinctRoles[indexPath.row])
    }
    
    
}
