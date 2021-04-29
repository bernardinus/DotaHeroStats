//
//  HeroStats+Extension.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import Foundation

extension HeroStats
{
    internal static func fetchFullData()->[HeroStats]
    {
        let hs:[HeroStats] = CoreDataHelper.fetchFullData("HeroStats")
        return hs
    }
    
    static func createNewHS(hero:Hero) -> HeroStats?
    {
        guard let hs:HeroStats = CoreDataHelper.save(value: hero.asDict()) else {return nil}
        return hs
    }
    
    func getHeroStruct() -> Hero
    {
        var hero:Hero = Hero()
        hero.id = Int(self.id)
        hero.localized_name = self.localized_name!
        hero.primary_attr = self.primary_attr!
        hero.attack_type = self.attack_type!
        hero.roles = self.roles as! [String]
        hero.img = self.img!
        hero.icon = self.icon!
        hero.base_health = Int(self.base_health)
        hero.base_health_regen = Float(self.base_health_regen)
        hero.base_mana = Int(self.base_mana)
        hero.base_mana_regen = Float(self.base_mana_regen)
        hero.base_armor = Float(self.base_armor)
        hero.base_mr = Int(self.base_mr)
        hero.base_attack_min = Int(self.base_attack_min)
        hero.base_attack_max = Int(self.base_attack_max)
        hero.base_str = Float(self.base_str)
        hero.base_agi = Int(self.base_agi)
        hero.base_int = Int(self.base_int)
        hero.str_gain = Float(self.str_gain)
        hero.agi_gain = Float(self.agi_gain)
        hero.int_gain = Float(self.int_gain)
        hero.attack_range = Int(self.attack_range)
        hero.projectile_speed = Int(self.projectile_speed)
        hero.attack_rate = Float(self.attack_rate)
        hero.move_speed = Int(self.move_speed)
        return hero
    }
}
