//
//  DataManager.swift
//  Medicine
//
//  Created by admin on 2/23/17.
//  Copyright © 2017 Fomin Nickolai. All rights reserved.
//

import UIKit
import CoreData

typealias MedicineDataBlock = (Error?, [Medicine]?) -> ()

protocol DataManagerDelegate: class {
    func fetchAllMedicine(closure: @escaping MedicineDataBlock)
    func addNewMedicine(completion: (Medicine) -> ())
}

enum MedicineType: Int {
    case Liquid
    case Tablet
    
    var textDescription: String {
        switch self {
        case .Liquid:
            return "Жидкость"
        case .Tablet:
            return "Таблетки"
        }
    }
}

enum MedicineIcons: Int, CaseCountable {
    case pills
    case calendar
    case medicineType
    case book
    case priceTag
    
    var image: UIImage {
        switch self {
        case .pills: return UIImage(named: "pills.png")!
        case .calendar: return UIImage(named: "calendar.png")!
        case .medicineType: return UIImage(named: "medicine-type.png")!
        case .book: return UIImage(named: "book.png")!
        case .priceTag: return UIImage(named: "price-tag.png")!
        }
    }
    
    var label: String {
        switch self {
        case .pills: return "QUANTITY"
        case .calendar: return "EXPIRE DATE"
        case .medicineType: return "MEDICINE TYPE"
        case .book: return "INSTRUCTION"
        case .priceTag: return "PRICE"
        }
    }
    
    static let caseCount = MedicineIcons.count

}

class DataManager: DataManagerDelegate {
    
    let managedObjectContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var _fetchedResultsController: NSFetchedResultsController<Medicine>? = nil
    
    func fetchAllMedicine(closure: @escaping MedicineDataBlock) {
        
        let medicineFetch = NSFetchRequest<Medicine>(entityName: "Medicine")
        
        do {
            let fetchedMedicine = try managedObjectContext.fetch(medicineFetch)
            closure(nil, fetchedMedicine)
            
        } catch {
            closure(error, nil)
            fatalError("Failed to fetch person: \(error)")
        }
        
    }
    
    func addNewMedicine(completion: (Medicine) -> ()) {
        let newMedicine = Medicine(context: managedObjectContext)
        
        // If appropriate, configure the new managed object.
        let date = NSDate()
        newMedicine.expireDate = date
        
        let title = "Тутукон"
        newMedicine.title = title
        
        let amount = "600 ml"
        newMedicine.amount = amount
        
        let image = UIImage(named: "tutukon_300-600mg_small")
        let imageData = UIImageJPEGRepresentation(image!, 0.7)
        newMedicine.image = imageData! as NSData?
        
        let typeMedice = MedicineType.Liquid.rawValue
        newMedicine.typeMedicine = "\(typeMedice)"
        
        let instructions = "3 раза в день по 30 мл"
        newMedicine.instruction = instructions
        
        let price = "484 грн"
        newMedicine.price = price
        
        // Save the context.
        do {
            try managedObjectContext.save()
           completion(newMedicine)
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        
        
        
        
    }
    
}
