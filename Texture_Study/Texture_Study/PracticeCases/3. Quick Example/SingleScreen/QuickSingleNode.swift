//
//  QuickSingleNode.swift
//  Texture_Study
//
//  Created by 김수완 on 2021/09/10.
//

import AsyncDisplayKit
import Then

final class QuickSingleNode: ASDisplayNode {
    private let imageNode = ASImageNode().then {
        $0.image = UIImage(named: "image")
        $0.borderColor = UIColor.gray.cgColor
        $0.borderWidth = 1
        $0.cornerRadius = 15
        $0.contentMode = .scaleAspectFit
    }
    private let titleNode = ASTextNode().then {
        $0.attributedText = NSAttributedString(
            string: "Hello, Texture!",
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.gray
            ]
        )
    }

    override init() {
        super.init()
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
                self.imageLayoutSpec(),
                self.titleNode
            ]
        )
    }
    
    private func imageLayoutSpec() -> ASLayoutSpec {
        return ASRatioLayoutSpec(ratio: 1.0, child: self.imageNode).styled {
            $0.flexShrink = 1.0
        }
    }
    
}
