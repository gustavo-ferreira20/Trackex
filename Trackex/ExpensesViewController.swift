//
//  ExpensesViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit
import RealmSwift

class ExpensesViewController: UIViewController{

    private let realm = try! Realm()
    private var screenLayout = ScreenLayout()
    private var expenses: Results<Expense>?
    private var myIndex = 0

    
    @IBOutlet weak var chartView: UIView!
    
    @IBOutlet weak var foodExpenseButton: UIButton!
    @IBOutlet weak var homeExpenseButton: UIButton!
    @IBOutlet weak var billExpenseButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
 
    
    
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenLayout.layoutDesignExpenses(view: chartView, button1: foodExpenseButton, button2: homeExpenseButton, button3: billExpenseButton)
        screenLayout.layoutDesign(button: addButton)
        loadExpenses()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        print("Expenses from viewDidLoad")
    }
    

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Expenses"
    }
    
    
    
    @IBAction func didPressAddButton(_ sender: Any) {
        self.performSegue(withIdentifier: "ExpensesAddButtonClicked", sender: self)
    }
    
    // Transfering data to another screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExpensesAddButtonClicked"{
            let addExpVC = segue.destination as! AddExpensesViewController
            addExpVC.delegate = self
        }
    }
    
    // Loading itens from Realm DB
    func loadExpenses() {
        expenses = realm.objects(Expense.self)
        collectionView.reloadData()
    }
    
}


// MARK: - UICollectionView methods
// To make a CollectionView works, you must add constraints to the Label in the Cell or at least centralise in the Cell
extension ExpensesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expenses?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let desc = expenses?[indexPath.row].desc ?? "No income added yet"
        let amount = String(expenses![indexPath.row].amount)
        let expType = expenses?[indexPath.row].image ?? "No type added"

        
//        var cell = UICollectionViewCell()
//
//        if let expenseCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as? CollectionViewCell {
//            expenseCell.configure(expenseDescription: desc)
//
//
//            cell = expenseCell
//        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as! CollectionViewCell

        cell.expLabelCell.text = desc
        cell.expAmountCell.text = "$\(amount)"
        
        switch expType {
        case "Home Bills":
            cell.expImageCell.image = UIImage.init(systemName: "house.fill")
        case "Food Bills":
            cell.expImageCell.image = UIImage.init(systemName: "cup.and.saucer.fill")
        case "Others":
            cell.expImageCell.image = UIImage.init(systemName: "creditcard.fill")
        default:
            print("No type added")
        }
        
//        cell.backgroundColor = UIColor.blue
//        cell.tintColor = UIColor.white

        return cell
        
    }
    
    
    
    
}


extension ExpensesViewController: UICollectionViewDelegate{
//    Selecting each row -- Similar to tableView from the project FridgeBuddy
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myIndex = indexPath.row
//        If I wanna redirect to another screen just uncomment the line below
//        self.performSegue(withIdentifier: "editSegue", sender: self)
        print("Selected Expense: \(expenses?[indexPath.row].desc ?? "no name")")
        print(myIndex)
    }
}


// MARK: - Adding Expense to the UICollectionView

extension ExpensesViewController: AddExpenseDelegate{
    func addExpense(exp: Expense) {
        try! self.realm.write{
            self.realm.add(exp)
        }
        
        self.collectionView.reloadData()
        
    }
    
    
}
