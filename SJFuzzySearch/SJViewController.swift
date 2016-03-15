//
//  SJViewController.swift
//  SJFuzzySearch
//
//  Created by shejun.zhou on 15/6/12.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

import UIKit

class SJViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var data = []
    var dataHold = []
    
    var titleWithClosuer:((title:String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.resetData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // pragma mark - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SJTableViewCellIdentifier") as! UITableViewCell
        cell.textLabel!.text = data[indexPath.row] as? String
        return cell
    }
    
    // pragma mark - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.searchBarCancelButtonClicked(self.searchBar)
         titleWithClosuer?(title: self.data[indexPath.row] as! String)
        self.navigationController?.popViewControllerAnimated(true)
    }

    // pragma mark - UISearchBarDelegate
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        var cancelButton:UIButton?
        var topView = searchBar.subviews[0] as! UIView
        for subView in topView.subviews {
            if subView.isKindOfClass(NSClassFromString("UINavigationButton")){
                cancelButton = subView as? UIButton
                break
            }
        }
        if (cancelButton != nil) {
            cancelButton?.setTitle("取消", forState: UIControlState.Normal)
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.data = self.dataHold.copy() as! NSArray

            self.tableView.reloadData()
            return
        }
        
        /** 模糊查找 */
        let predicateString:NSPredicate = NSPredicate(format: "self contains[cd] %@", searchText)
        self.data = self.dataHold.filteredArrayUsingPredicate(predicateString) as Array
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBarCancelButtonClicked(searchBar)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    // pragma mark - private methods
    
    func dataWithFuzzySearch() {
        
    }
    
    func resetData() {
        data = ["北京市",
            "上海市",
            "天津市",
            "重庆市",
            "黑龙江省",
            "吉林省",
            "辽宁省",
            "江苏省",
            "山东省",
            "安徽省",
            "河北省",
            "河南省",
            "湖北省",
            "湖南省",
            "江西省",
            "陕西省",
            "山西省",
            "四川省",
            "青海省",
            "海南省",
            "广东省",
            "贵州省",
            "浙江省",
            "福建省",
            "台湾省",
            "甘肃省",
            "云南省",
            "内蒙古自治区",
            "宁夏回族自治区",
            "新疆维吾尔自治区",
            "西藏自治区",
            "广西壮族自治区",
            "香港特别行政区",
            "澳门特别行政区"]
        dataHold = data
    }

}
