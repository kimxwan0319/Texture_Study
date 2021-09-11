//
//  QuickListNodeController.swift
//  Texture_Study
//
//  Created by 김수완 on 2021/09/10.
//

import AsyncDisplayKit
import Then

final class QuickListNodeController: ASDKViewController<ASTableNode> {
    var items: [String] = [
        "Welcome to Texture-KR",
        "Welcome to Texture-KR",
        "Welcome to Texture-KR, long test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    ]

    override init() {
        super.init(node: ASTableNode(style: .plain))
        self.node.backgroundColor = .clear
        self.node.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuickListNodeController: ASTableDataSource {
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            return QuickListCellNode(item: self.items[indexPath.row])
        }
    }
}
