//
//  MemoViewModel.swift
//  voiceMemo
//
//  Created by 최안용 on 11/7/23.
//

import Foundation
  
class MemoViewModel: ObservableObject {
    @Published var memo: Memo
    
    init(memo: Memo) {
        self.memo = memo
    }
}
