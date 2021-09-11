//
//  UpDownNode.swift
//  Texture_Study
//
//  Created by 김수완 on 2021/09/11.
//

import AsyncDisplayKit
import Then

final class UpDownNode: ASDisplayNode {
    private var counter: Int = 0{
        willSet(val) {
            counterTextNode.attributedText = NSAttributedString(
                string: String(val),
                attributes: [
                    .font: UIFont.systemFont(ofSize: 20)
                ]
            )
        }
    }
    private lazy var counterTextNode = ASTextNode().then {
        $0.attributedText = NSAttributedString(
            string: "0",
            attributes: [
                .font: UIFont.systemFont(ofSize: 20)
            ]
        )
    }
    private lazy var upButtonNode = ASButtonNode().then {
        $0.setTitle(
            "UP",
            with: .systemFont(ofSize: 15),
            with: .link,
            for: .normal
        )
        $0.addTarget(self, action: #selector(self.CounterUp), forControlEvents: .touchUpInside)
    }
    private lazy var downButtonNode = ASButtonNode().then {
        $0.setTitle(
            "DOWN",
            with: .systemFont(ofSize: 15),
            with: .link,
            for: .normal
        )
        $0.addTarget(self, action: #selector(self.CounterDown), forControlEvents: .touchUpInside)
    }
    
    override init() {
        super.init()
        self.backgroundColor = .systemBackground
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    override func layoutSpecThatFits(_ constraintedSize: ASSizeRange) -> ASLayoutSpec {
        var containerInsets: UIEdgeInsets = self.safeAreaInsets
        containerInsets.left += 15.0
        containerInsets.right += 15.0
        containerInsets.top = containerInsets.bottom
        
        return ASInsetLayoutSpec(
            insets: containerInsets,
            child: self.contentLayoutSpec()
        )
    }
    
    private func contentLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10.0,
            justifyContent: .center,
            alignItems: .center,
            children: [
                self.upButtonNode,
                self.counterTextNode,
                self.downButtonNode
            ]
        )
    }
    
    @objc func CounterUp() {
        self.counter += 1
    }
    @objc func CounterDown() {
        self.counter -= 1
    }
    
}
