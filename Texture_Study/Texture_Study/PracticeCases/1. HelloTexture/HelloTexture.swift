//
//  HelloTexture.swift
//  Texture_Study
//
//  Created by 김수완 on 2021/05/19.
//

import AsyncDisplayKit

class HelloTextureViewController: ASDKViewController<MessageNode> {

    override init() {
        super.init(node: MessageNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

