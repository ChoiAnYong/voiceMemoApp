//
//  PathType.swift
//  voiceMemo
//
//  Created by 최안용 on 11/7/23.
//

enum PathType: Hashable {
    //Path에 쌓일 수 있는 것
    case homeView
    case todoView
    case memoView(isCreatMode: Bool, memo: Memo?)
}
