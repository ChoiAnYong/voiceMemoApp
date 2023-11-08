//
//  TimerViewModel.swift
//  voiceMemo
//
//  Created by 최안용 on 11/7/23.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var isDisplaySetTimeView: Bool
    @Published var time: Time
    @Published var timer: Timer?
    @Published var timeRemaining: Int
    @Published var isPaused: Bool
    
    init(
        isDisplaySetTimeView: Bool = true,
        time: Time = .init(hours: 0, minutes: 0, seconds: 0),
        timer: Timer? = nil,
        timeRemaining: Int = 0,
        isPaused: Bool = false
    ) {
        self.isDisplaySetTimeView = isDisplaySetTimeView
        self.time = time
        self.timer = timer
        self.timeRemaining = timeRemaining
        self.isPaused = isPaused
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
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true
        ) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
                //다음 시간에 추가 구현
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
