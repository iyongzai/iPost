//
//  AYHomeViewController.swift
//  iPost
//
//  Created by Tyler.Yin on 16/7/1.
//  Copyright © 2016年 ayong. All rights reserved.
//

import UIKit

class AYHomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        let rightItem = UIBarButtonItem.init(title: "微博登录", style: .Plain, target: self, action: #selector(AYHomeViewController.weiboLogin))
//        self.navigationItem.rightBarButtonItem = rightItem
        
        self.addRefreshControToTableView()
        self.isRefreshing = false
        self.isLoading = false
        
        //请求数据
        self.startRefresh(self.refreshControl!)
    }
    
    func startRefresh(refreshControl:UIRefreshControl) -> Void {
        if self.isRefreshing! || self.isLoading! {
            return
        }
        self.isRefreshing = true
        
        let authorizeInfo = AYUtility.getModelByNSUserDefaultsForKey(kSinaAuthorizeInfo) as? AuthorizeInfo
        if authorizeInfo?.userID == nil {//TODO: 没有授权或者token过期、无效，都需要重新授权， 后期补充
            self.isRefreshing = false
            self.refreshControl?.endRefreshing()
            SinaAuthorizeHelper().authorize({[weak self] (platform, response, userInfo) -> Void in
                print("hahah")
                if response is WBAuthorizeResponse && (response as! WBAuthorizeResponse).userID != nil {
                    self?.startRefresh((self?.refreshControl)!)
                }
                }, userInfo: nil)
        }else{
            SinaWeiboGetHelper().getPublicTimeline(nil, pageCount: nil, baseApp: nil, otherParams: nil) {[weak self] (platform, response, userInfo) in
                self?.refreshControl?.endRefreshing()
                self?.isRefreshing = false
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func weiboLogin()->Void {
        SinaAuthorizeHelper().authorize({ (platform, response, userInfo) -> Void in
            print("hahah")
            }, userInfo: nil)
    }

}
