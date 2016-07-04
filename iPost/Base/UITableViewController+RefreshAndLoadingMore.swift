//
//  UITableViewController+RefreshAndLoadingMore.swift
//  iPost
//
//  Created by Tyler.Yin on 16/7/2.
//  Copyright © 2016年 ayong. All rights reserved.
//

import Foundation

//protocol RefreshLoadingProtocol {
//    
//    func startRefresh(refreshControl: UIRefreshControl) -> Void
//    func startLoadMore(activityIndicatorView: UIActivityIndicatorView) -> Void
//}

extension UITableViewController {
    
    private struct AssociatedKey {
        
        /**
         *  分页的页码
         */
        static var page = 1
        /**
         *  一页的数量
         */
        static var pageCount = 50
        
        /**
         *  界面不需要上拉，禁止上拉
         **/
        static var loadMoreDragEnable = true
        /**
         *  是否正在刷新
         */
        static var isRefreshing = false
        /**
         *  是否正在加载
         */
        static var isLoading = false
        /**
         *  是否加载完毕
         */
        static var loadedAllData = false
    }
    
    /**
     *  分页的页码
     */
    var page: Int? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.page) as? Int
        }set {
            if let value = newValue {
                objc_setAssociatedObject(self, &AssociatedKey.page, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
    
    /**
     *  一页的数量
     */
    var pageCount: Int? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.pageCount) as? Int
        }set {
            if let value = newValue {
                objc_setAssociatedObject(self, &AssociatedKey.pageCount, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
    /**
     *  界面不需要上拉，禁止上拉
     **/
    var loadMoreDragEnable: Bool? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.loadMoreDragEnable) as? Bool
        }set {
            if let value = newValue {
                objc_setAssociatedObject(self, &AssociatedKey.loadMoreDragEnable, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
    /**
     *  是否正在刷新
     */
    var isRefreshing: Bool? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.isRefreshing) as? Bool
        }set {
            if let value = newValue {
                objc_setAssociatedObject(self, &AssociatedKey.isRefreshing, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
    /**
     *  是否正在加载
     */
    var isLoading: Bool? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.isLoading) as? Bool
        }set {
            if let value = newValue {
                objc_setAssociatedObject(self, &AssociatedKey.isLoading, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
    /**
     *  是否加载完毕
     */
    var loadedAllData: Bool? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.loadedAllData) as? Bool
        }set {
            if let value = newValue {
                objc_setAssociatedObject(self, &AssociatedKey.loadedAllData, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
    
    
    func addRefreshControToTableView() -> Void {
        //添加刷新
        self.refreshControl = UIRefreshControl.init()
        if self.respondsToSelector(Selector("startRefresh:")) {
            self.refreshControl?.addTarget(self, action: Selector("startRefresh:"), forControlEvents: UIControlEvents.ValueChanged)
        }
        //[_refreshControl setAttributedTitle:[[NSAttributedString alloc] initWithString:@"松手更新数据"]];
        self.tableView.insertSubview(self.refreshControl!, atIndex: 0)
    }
    
//    func startRefresh(refreshControl:UIRefreshControl) -> Void {
//        
//    }
    
    
    
    
//
//    
//    //varNSString * uuidString;
//    
//    
//    /**
//     *  创建并初始化tableview
//     *
//     *  @param style 表格类型
//     */
//    -(void)initTableView:(UITableViewStyle)style;
//    
//    -(void)createRefreshControl;
//    
//    
//    /**
//     *  隐藏最后一个cell之后的分割线（通过设置footview）
//     */
//    -(void)hiddenBottomCellLine;
//    
//    -(void)startRefresh:(UIRefreshControl *)refresh;
//    -(void)startLoadMore:(UIActivityIndicatorView *)sender;
    
    

}