//
//  DataManager.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import Foundation
import UIKit

class DataManager
{
    static let shared = DataManager()
    
    var filteredHeroes:[Hero] = []
    var heroes:[Hero] = []
    
    var mainVC:MainVC?
    
    var distinctRoles:[String] = []
    
    var selectedHero:Hero? = nil
    var similarHero:[Hero] = []
    var heroesStats:[HeroStats] = []
    
    init()
    {
        loadHeroes()
    }
    
    func updateView()
    {
        
        DispatchQueue.main.async {
            if(self.mainVC != nil)
            {
                self.mainVC!.splitView.reloadData()
                print("update view")
            }
        }
    }
    
    func loadHeroes()
    {
        heroesStats = HeroStats.fetchFullData()
        print("hs \(heroesStats.count)")
        
        if(heroesStats.count == 0)
        {
            Networking.shared.loadHeroes
            {
                (isSuccess, errorString, iHeroes) in
                if(isSuccess)
                {
                    self.heroes = iHeroes
                    
                    self.selectedRole(role: "All")
                    self.distinctRole()
                    self.updateView()
                    self.cacheData()
                }
            }
        }
        else
        {
            for hero in heroesStats
            {
                heroes.append(hero.getHeroStruct())
            }
            self.selectedRole(role: "All")
            self.distinctRole()
            self.updateView()

        }
    }
    
    func cacheData()
    {
        for hero in heroes
        {
            var nHR = HeroStats.createNewHS(hero: hero)
            heroesStats.append(nHR!)
            
            print("nhs \(heroesStats.count)")
        }
    }
    
    func distinctRole()
    {
        var distinctRolesSet:Set<String> = Set<String>()
        for data in filteredHeroes {
            for role in data.roles
            {
                distinctRolesSet.insert(role)
            }
        }
        distinctRolesSet.insert("All")
        distinctRoles = Array(distinctRolesSet)
        distinctRoles.sort()
    }
    
    func selectedRole(role:String)
    {
        filteredHeroes = []
        if(role == "All")
        {
            filteredHeroes = heroes
        }
        else
        {
            // filter heroes here
            
            for hero in heroes {
                if(hero.roles.contains(role))
                {
                    filteredHeroes.append(hero)
                }
            }
        }
        
        updateView()
    }
    
    func selectHero(hero:Hero)
    {
        selectedHero = hero
        similarHero = []
        for hero in heroes
        {
            if(hero.id != selectedHero!.id &&
               hero.primary_attr == selectedHero!.primary_attr)
            {
                similarHero.append(hero)
            }
        }
        
        similarHero.sort { (hA, hB) -> Bool in
            if(selectedHero!.primary_attr == "int")
            {
                return hA.base_mana > hB.base_mana
            }
            else if(selectedHero!.primary_attr == "agi")
            {
                return hA.move_speed > hB.move_speed
            }
            else if(selectedHero!.primary_attr == "str")
            {
                return hA.base_attack_max > hB.base_attack_max
            }
            return false
        }
        
        similarHero.filter { (hero) -> Bool in
            for role in selectedHero!.roles
            {
                if hero.roles.contains(role)
                {
                    return true
                }
            }
            return false
        }
        
        updateView()
    }
}
