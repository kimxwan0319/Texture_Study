//
//  MessageNode.swift
//  Texture_Study
//
//  Created by 김수완 on 2021/05/19.
//

import AsyncDisplayKit

class MessageNode: ASDisplayNode {
    
    lazy var textNode = { () -> ASTextNode in
        let node = ASTextNode()
        node.attributedText = NSAttributedString(
            string: "Hello, Texture!",
            attributes:
                [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        )
        return node
    }()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .systemBackground
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec { // Background
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .center,
            alignItems: .center,
            children: [textNode]
        )
    }
    
    override func layout() {
        super.layout()
    }
}
