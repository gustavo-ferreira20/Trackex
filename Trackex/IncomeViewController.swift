//
//  IncomeViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit
import RealmSwift

class IncomeViewController: UIViewController {
    private let realm = try! Realm()
    
    
    private var screenLayout = ScreenLayout()
//    private var incomes = [Income]()
    private var incomes: Results<Income>?
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Income from viewDidLoad")
        tableView.dataSource = self
        screenLayout.layoutDesign(button: addButton)
        loadIncomes()

    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Income"
        print("Income from viewWillAppear")
    }

 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Income from viewWillDisappear")
    }
    
    // Transfering data to another screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IncomeAddButtonClicked"{
            let addIncVC = segue.destination as! AddIncomeViewController
            addIncVC.delegate = self
        }
    }
    
    // Loading itens from Realm DB
    func loadIncomes() {
        incomes = realm.objects(Income.self)
        tableView.reloadData()
    }
    
    
    @IBAction func didPressAddButton(_ sender: Any) {
        self.performSegue(withIdentifier: "IncomeAddButtonClicked", sender: self)
        
    }
    

}


extension IncomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incomes?.count ?? 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        
        cell.textLabel?.text = incomes?[indexPath.row].desc ?? "No income added yet"
        cell.detailTextLabel?.text = String(incomes![indexPath.row].amount)
        return cell
    }
   
    
}


extension IncomeViewController: AddIncomeDelegate{
    func addIncome(inc: Income) {
//        self.incomes.append(inc)
//        self.tableView.reloadData()
        
        try! self.realm.write{
            self.realm.add(inc)
        }
        
        self.tableView.reloadData()
        
    }
    
    
}
