//
//  Path.swift
//  voiceMemo
//
//  Created by 최안용 on 11/7/23.
//

import Foundation

//ObservableObject를 채택한 이유는 감지를 할 것이기 때문
class PathModel: ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
}
