//
//  CategoryViewController.swift
//  ToDo
//
//  Created by Jamie on 2020/08/05.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  loadCategories()
        
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "CategoryCell")
        
        
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "Not added yet"
        
        //cell.accessoryType = (item.done == true) ? .checkmark : .none
        // cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    
    
    //MARK: - Data Manipulation methods
    
    
    
    
    //MARK: - Add New Categories
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let categories = Category()
            categories.name = textField.text!
            // item.done = false
            
            //self.categories.append(categories)
            
            self.save(category: categories)
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Category"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func save(category: Category) {
        
        //  let encoder = PropertyListEncoder()
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("error encoding item array")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
        
        
        //let request: NSfetchRe
        
//        do {
//            categoryArray = try context.fetch(request)
//        } catch {
//            print(error)
//        }
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
        
        //itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        //saveItems()
        
        //tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            destinationVC.selectedCategory = categories?[indexPath.row]
            
        }
    }
}
