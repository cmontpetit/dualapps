

import CoreData

class ModelManager {

    var ctx: NSManagedObjectContext
    
    init(ctx: NSManagedObjectContext, persistentStoreCoordinator: NSPersistentStoreCoordinator, from:String){
        println("ModelManager init ...")
        self.ctx = ctx
        var anyError: NSError?
        
        // Insert code here to initialize your application
        SharedEntity.create(ctx, by: from)
        if !ctx.save(&anyError) {
            println("Cannot save: \(anyError!.localizedDescription)")
            println("   userInfo: \(anyError!.userInfo)")
            return
        }
        
        NSNotificationCenter.defaultCenter().addObserverForName(NSPersistentStoreCoordinatorStoresWillChangeNotification,
            object: persistentStoreCoordinator,
            queue: NSOperationQueue.mainQueue(),
            usingBlock:{ (notif: NSNotification!) -> Void in
                println("NSPersistentStoreCoordinatorStoresWillChangeNotification \(notif)")
        })
        NSNotificationCenter.defaultCenter().addObserverForName(NSPersistentStoreCoordinatorStoresDidChangeNotification,
            object: persistentStoreCoordinator,
            queue: NSOperationQueue.mainQueue(),
            usingBlock:{ (notif: NSNotification!) -> Void in
                println("NSPersistentStoreCoordinatorStoresDidChangeNotification \(notif)")
        })
        NSNotificationCenter.defaultCenter().addObserverForName(NSPersistentStoreDidImportUbiquitousContentChangesNotification,
            object: persistentStoreCoordinator,
            queue: NSOperationQueue.mainQueue(),
            usingBlock:{ (notif: NSNotification!) -> Void in
                println("NSPersistentStoreDidImportUbiquitousContentChangesNotification \(notif)")
        })

        println("ModelManager init done!")
        self.logEntities()        
    }
    
    func logEntities() {
        var anyError: NSError?
        let req = NSFetchRequest(entityName: "SharedEntity")
        let all: NSArray! = ctx.executeFetchRequest(req, error:&anyError)
        println("... Existing entities count: \(all.count)")
        for e in all {
            println("  \(e.description)")
        }

    }
    
    
}
