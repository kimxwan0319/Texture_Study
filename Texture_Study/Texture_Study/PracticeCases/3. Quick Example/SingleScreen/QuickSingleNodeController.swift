//
//  QuickSingleNodeController.swift
//  Texture_Study
//
//  Created by κΉμμ on 2021/09/10.
//

import AsyncDisplayKit

final class QuickSingleNodeController: ASDKViewController<QuickSingleNode> {
    override init() {
        super.init(node: QuickSingleNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
