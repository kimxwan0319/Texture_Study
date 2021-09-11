//
//  QuickListCellNode.swift
//  Texture_Study
//
//  Created by 김수완 on 2021/09/10.
//

import AsyncDisplayKit
import Then

final class QuickListCellNode: ASCellNode {
    private let imageNode = ASImageNode().then {
        $0.image = UIImage(named: "image")
        $0.borderColor = UIColor.gray.cgColor
        $0.borderWidth = 1
        $0.cornerRadius = 15
        $0.contentMode = .scaleAspectFit
    }
    private let titleNode = ASTextNode().then {
        $0.maximumNumberOfLines = 0
    }

    init(item: String) {
        super.init()
        self.backgroundColor = .clear
        self.automaticallyManagesSubnodes = true
        self.selectionStyle = .none
        self.titleNode.attributedText = NSAttributedString(
            string: item,
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.gray
            ]
        )
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0),
            child: self.contentLayoutSpec()
        )
    }

    private func contentLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                self.imageLayoutSpec().styled {
                    $0.flexBasis =  ASDimension(unit: .fraction, value: 0.2)
                },
                self.titleNode.styled {
                    $0.flexBasis =  ASDimension(unit: .fraction, value: 0.8)
                }
            ]
        )
    }

    private func imageLayoutSpec() -> ASLayoutSpec {
        return ASRatioLayoutSpec(ratio: 1.0, child: self.imageNode)
    }
}
