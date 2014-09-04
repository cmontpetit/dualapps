import Foundation
import CoreData

@objc(SharedEntity) class SharedEntity : NSManagedObject {
    
    @NSManaged var createdBy: String
    @NSManaged var createdAt: NSDate
    
    func description() -> String {
        return "SharedEntity: Created by \(createdBy) at \(createdAt)"
    }
    
    class func create(ctx:NSManagedObjectContext, by:String) -> SharedEntity {
        var entity = NSEntityDescription.insertNewObjectForEntityForName("SharedEntity", inManagedObjectContext:ctx) as SharedEntity
        entity.createdBy = by
        entity.createdAt = NSDate.date()
        println("+++ Created \(entity.description)")
        return entity
    }
    
}