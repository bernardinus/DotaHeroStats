//
//  Data.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import Foundation


// sample data
/*
 {
     "id": 1,
     "name": "npc_dota_hero_antimage",
     "localized_name": "Anti-Mage",
     "primary_attr": "agi",
     "attack_type": "Melee",
     "roles": ["Carry", "Escape", "Nuker"],
     "img": "/apps/dota2/images/heroes/antimage_full.png?",
     "icon": "/apps/dota2/images/heroes/antimage_icon.png",
     "base_health": 200,
     "base_health_regen": 0.25,
     "base_mana": 75,
     "base_mana_regen": 0,
     "base_armor": 0,
     "base_mr": 25,
     "base_attack_min": 29,
     "base_attack_max": 33,
     "base_str": 23,
     "base_agi": 24,
     "base_int": 12,
     "str_gain": 1.3,
     "agi_gain": 2.8,
     "int_gain": 1.8,
     "attack_range": 150,
     "projectile_speed": 0,
     "attack_rate": 1.4,
     "move_speed": 310,
     "turn_rate": null,
     "cm_enabled": true,
     "legs": 2,
     "hero_id": 1,
     "turbo_picks": 385203,
     "turbo_wins": 193558,
     "pro_win": 27,
     "pro_pick": 53,
     "pro_ban": 165,
     "1_pick": 18952,
     "1_win": 9332,
     "2_pick": 38266,
     "2_win": 18882,
     "3_pick": 52504,
     "3_win": 25880,
     "4_pick": 48253,
     "4_win": 23920,
     "5_pick": 31474,
     "5_win": 15240,
     "6_pick": 14111,
     "6_win": 6793,
     "7_pick": 5827,
     "7_win": 2778,
     "8_pick": 1536,
     "8_win": 726,
     "null_pick": 2389879,
     "null_win": 0
 }
 */

struct Hero :Codable
{
    var id:Int
//    var name:String
    var localized_name:String
    var primary_attr:String
    var attack_type:String // Melee / Ranged
    var roles:[String]
    var img:String // img url
    var icon:String // icon url
    var base_health:Int
    var base_health_regen:Float?
    var base_mana:Int
    var base_mana_regen:Float
    var base_armor:Float
    var base_mr:Int
    var base_attack_min:Int
    var base_attack_max:Int
    var base_str:Float
    var base_agi:Int
    var base_int:Int
    var str_gain:Float
    var agi_gain:Float
    var int_gain:Float
    var attack_range:Int
    var projectile_speed:Int
    var attack_rate:Float
    var move_speed:Int
    
    init()
    {
        self.id = 0
        self.localized_name = ""
        self.primary_attr = ""
        self.attack_type = ""
        self.roles = []
        self.img = ""
        self.icon = ""
        self.base_health = 0
        self.base_health_regen = 0
        self.base_mana = 0
        self.base_mana_regen = 0
        self.base_armor = 0
        self.base_mr = 0
        self.base_attack_min = 0
        self.base_attack_max = 0
        self.base_str = 0
        self.base_agi = 0
        self.base_int = 0
        self.str_gain = 0
        self.agi_gain = 0
        self.int_gain = 0
        self.attack_range = 0
        self.projectile_speed = 0
        self.attack_rate = 0
        self.move_speed = 0
    }
    
    func keyList() -> [String]
    {
        return [
            "Primary Attribute",
            "Attack Type",
            "Base Attribute",
            "Health \(base_health)",
            "Health Regen \(base_health_regen ?? 0)",
            "Armor",
            "Attack",
            "Str",
            "Agi",
            "Int",
            "Attack Range",
            "Move Speed",
            "Gain Atribute",
            "Str Gain",
            "Agi Gain",
            "Int Gain",
            ]
    }
    
    func valueList() -> [String]
    {
        return [
            "\(primary_attr)",
            String(attack_type),
            "",
            "Mana \(base_mana)",
            "Mana Regen \(base_mana_regen)",
            "\(base_armor)",
            "\(base_attack_min) - \(base_attack_max)",
            "\(base_str)",
            "\(base_agi)",
            "\(base_int)",
            "\(attack_range)",
            "\(move_speed)",
            "",
            "\(str_gain)",
            "\(agi_gain)",
            "\(int_gain)"
        ]
    }
    
    func asDict()->[String:Any]
    {
        return [
            "id":id,
            "localized_name":localized_name,
            "primary_attr":primary_attr,
            "attack_type":attack_type,
            "roles":roles,
            "img":img,
            "icon":icon,
            "base_health":base_health,
            "base_health_regen":base_health_regen ?? 0,
            "base_mana":base_mana,
            "base_mana_regen":base_mana_regen,
            "base_armor":base_armor,
            "base_mr":base_mr,
            "base_attack_min":base_attack_min,
            "base_attack_max":base_attack_max,
            "base_str":base_str,
            "base_agi":base_agi,
            "base_int":base_int,
            "str_gain":str_gain,
            "agi_gain":agi_gain,
            "int_gain":int_gain,
            "attack_range":attack_range,
            "projectile_speed":projectile_speed,
            "attack_rate":attack_rate,
            "move_speed":move_speed
        ];
    }
}
