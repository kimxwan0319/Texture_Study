//
//  UpDownNodeController.swift
//  Texture_Study
//
//  Created by κΉμμ on 2021/05/20.
//

import AsyncDisplayKit

class UpDownNodeController: ASDKViewController<UpDownNode> {

    override init() {
        super.init(node: UpDownNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
