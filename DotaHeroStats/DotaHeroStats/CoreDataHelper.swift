//
//  CoreDataHelper.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import Foundation
import CoreData

class CoreDataHelper
{
    private static var instance:CoreDataHelper!
    
    internal static func shared() -> CoreDataHelper
    {
        if instance == nil
        {
            instance = CoreDataHelper()
        }
        return instance
    }
    
    var persistentContainer:NSPersistentContainer
    var objContext:NSManagedObjectContext
    
    private init()
    {
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?{
                print(error)
            }
            print(storeDescription)
        })
        
        objContext = persistentContainer.viewContext
    }
    
    
    static func fetchAll<T: NSManagedObject>(_ entity:String) -> [T]
    {
        let request = NSFetchRequest<T>(entityName: entity)
        let result = try? shared().objContext.fetch(request)
        return result as? [T] ?? []
    }
    
    // return all data in full
    static func fetchFullData<T: NSManagedObject>(_ entity:String) -> [T]
    {
        let request = NSFetchRequest<T>(entityName: entity)
        request.returnsObjectsAsFaults = false
        let result = try? shared().objContext.fetch(request)
        return result as? [T] ?? []
    }
    
    static func fetchQuery<T:NSManagedObject>(_ entity:String, predicate:NSPredicate) -> [T]
    {
        let request = NSFetchRequest<T>(entityName: entity)
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        
        var result:[T]
        do {
            
            result = try shared().objContext.fetch(request)
        } catch let error as NSError{
            
            print("FetchError : \(error)")
            return []
        }
        
        return result as? [T] ?? []
        
    }
    
    static func save<T: NSManagedObject>(value:[String:Any]) -> T?
    {
        let model = T(context: shared().objContext)
        
        for (k,v) in value
        {
            model.setValue(v, forKey: k)
        }
        
        do{
            try shared().objContext.save()
            return model
        } catch{
            return nil
        }
        
    }
    
    
    static func saveData()
    {
        if shared().objContext.hasChanges {
            do {
                try shared().objContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static func deleteAllRecords(in entityName:String)
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        let _ = try? shared().objContext.execute(deleteRequest)
    }    
}
