//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

import Foundation

public class TappableView: UIView {
    let actionBlock : (() -> Void)

    // MARK: - Initializers

    @available(*, unavailable, message: "use other constructor instead.")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Unimplemented")
    }

    public required init(actionBlock : @escaping () -> Void) {
        self.actionBlock = actionBlock
        super.init(frame: CGRect.zero)

        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(wasTapped)))
    }

    @objc func wasTapped(sender: UIGestureRecognizer) {
        Logger.info("\(logTag) \(#function)")

        guard sender.state == .recognized else {
            return
        }
        actionBlock()
    }
}
