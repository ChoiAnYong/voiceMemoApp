//
//  AppDelegate.swift
//  voiceMemo
//
//  Created by 최안용 on 11/7/23.
//

import UIKit

//AppDelegate를 통해서 앱에서 일어나는 상호작용이나 시스템 로우 레벨에서 할 수 있는 것들을 컨트롤할 수 있다.
class AppDelegate: NSObject, UIApplicationDelegate {
    var notificationDelegate = NotificationDelegate()
     
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = notificationDelegate
        return true
    }
}
