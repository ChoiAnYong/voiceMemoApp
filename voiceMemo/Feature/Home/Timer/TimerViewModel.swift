//
//  TimerViewModel.swift
//  voiceMemo
//
//  Created by 최안용 on 11/7/23.
//

import Foundation
import UIKit

class TimerViewModel: ObservableObject {
    @Published var isDisplaySetTimeView: Bool
    @Published var time: Time
    @Published var timer: Timer?
    @Published var timeRemaining: Int
    @Published var isPaused: Bool
    var notificationService: NotificationService
    
    init(
        isDisplaySetTimeView: Bool = true,
        time: Time = .init(hours: 0, minutes: 0, seconds: 0),
        timer: Timer? = nil,
        timeRemaining: Int = 0,
        isPaused: Bool = false,
        notificationService: NotificationService = .init()
    ) {
        self.isDisplaySetTimeView = isDisplaySetTimeView
        self.time = time
        self.timer = timer
        self.timeRemaining = timeRemaining
        self.isPaused = isPaused
        self.notificationService = notificationService
    }
}

extension TimerViewModel {
    func settingBtnTapped() {
        isDisplaySetTimeView = false
        timeRemaining = time.convertedSeconds
        startTimer()
    }
    
    func cancelBtnTapped() {
        stopTimer()
        isDisplaySetTimeView = true
    }
    
    func pauseOrRestartBtnTapped() {
        if isPaused {
            startTimer()
        } else {
            timer?.invalidate()
            timer = nil
        }
        isPaused.toggle()
    }
}

//private으로 extension하면 내부에 들어오는 것들고 private를 붙히지 않아도 private으로 된다.
private extension TimerViewModel {
    func startTimer() {
        guard timer == nil else { return }
        
        var backgroundTaskID: UIBackgroundTaskIdentifier?//벡그라운드 작업ID를 저장할 변수를 선언한 것이며 초기값은 nil일 것이다.
        backgroundTaskID = UIApplication.shared.beginBackgroundTask() {//앱이 백그라운드로 전환됐을 때 일부 작업을 계속 수행할 수 있게 해주는 메서드
            if let task = backgroundTaskID {
                UIApplication.shared.endBackgroundTask(task)
                backgroundTaskID = .invalid
            }
        }
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true
        ) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
                self.notificationService.sendNotification()//이것만 하면 백그라운드에서는 동작하지 않는다.
                
                if let task = backgroundTaskID {
                    UIApplication.shared.endBackgroundTask(task)
                    backgroundTaskID = .invalid
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
