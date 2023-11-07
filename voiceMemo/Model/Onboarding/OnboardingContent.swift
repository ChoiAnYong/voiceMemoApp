//
//  OnboardingContent.swift
//  voiceMemo
//
//  Created by 최안용 on 11/7/23.
//

import Foundation

struct OnboardingContent: Hashable {//Hashable를 채택한 이유는 추후에 TabView에서도 사용하기 때문
    var imageFileName: String
    var title: String
    var subTitle: String
    
    init(imageFileName: String,
         title: String,
         subTitle: String
    ) {
        self.imageFileName = imageFileName
        self.title = title
        self.subTitle = subTitle
    }
}
