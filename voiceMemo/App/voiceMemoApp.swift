//
//  voiceMemoApp.swift
//  voiceMemo
//
//  Created by 최안용 on 11/7/23.
//

import SwiftUI

@main
struct voiceMemoApp: App {
    //이게 필요한 이유는 구현을 하다보면 앱구조체가 때로는 UIKit의 기능이나 더 로우 레벨의 iOS 시스템의 이벤트를 처리해야되는 경우가 있다.
    //지금 NotificationDelegate가 그런 경우이다.
    //그럴 때 UIApplicationDelegateAdaptor를 이용할 수 있는데 SwiftUI 앱에서는 UIKit의 UIApplicationDelegate와 상호작용을 할 수 있다.
    //즉, SwiftUI에서 UIKit 앱딜리게이트를 생성하는데 사용하는 프로퍼티 wrapper가 UIApplicationDelegateAdaptor이다.
    //SwiftUI의 라이프사이클을 사용하는 앱에서 앱딜리게이트 콜벡을 처리하려면 UIApplicationDelegate 프로토콜을 준수해야하고 각자 필요한 Delegate 메서드를 구현해야한다.
    //그래서 우리는 AppDelegate 파일을 생성하고 선행으로 구현을 해주었다.
    //그후에 이제 SwiftUI 앱 코드에서 UIApplicationDelegateAdaptor wrapper를 사용해서 SwiftUI의 delegate 타입에 대한 선언을 해준다.
    //SwiftUI는 delegate를 인스턴스화하고 생명주기 이벤트가 발생할때마다 응답해서 delegate 메서드를 호출하게 된다.
    //delegateAdaptor는 앱 선언부에서만 정의하고 꼭 앱에서 한 번만 선언해야한다.
    //만약 여러번 선언해서 사용하게 되면 런타임 에러를 일으키게 된다.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
