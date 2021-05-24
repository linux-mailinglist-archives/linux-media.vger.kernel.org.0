Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5E938E502
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhEXLLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:36694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232733AbhEXLLK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:11:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85E5661151;
        Mon, 24 May 2021 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621854582;
        bh=LjBPzHdi1VU5NCGXGexHmi9kLJgLIN8NjpuFdA8BasA=;
        h=From:To:Cc:Subject:Date:From;
        b=R7Monon/ROGBciX//tUf1cJxXDrjE12vb/BalO2Y3IATvVItA2QtGp0jmRqRPew11
         SzT88VYq8sNTD/su/yR5kEJYGq9eJo4FLVK0zbd8rY/EEy1/pjmXCoBlrZLnpB2HsI
         8MtngDsywFxwBBgzhwfX0Oytd0ewvWi9YF4lv7DWXIN13zCMiuGsUTc7hrQlexOseg
         8njbPZF7xZ8Wzmfwi+Dc7LDUrmJf0mReVuE3calqqOSawMZNhaPAfpbfiNNBNYNd2W
         zr8VgHDnVu4b2fTVlguX6ShXxWu6iec8QQYFnG1cRG9XTO3mHwibkae6/aEzltPvKn
         1rF4yNtb8RhHg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ll8Sp-0006Pn-7F; Mon, 24 May 2021 13:09:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] media: fix zero-length USB control requests
Date:   Mon, 24 May 2021 13:09:17 +0200
Message-Id: <20210524110920.24599-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The direction of the pipe argument must match the request-type direction
bit or control requests may fail depending on the host-controller-driver
implementation.
    
Control transfers without a data stage are treated as OUT requests by
the USB stack and should be using usb_sndctrlpipe(). Failing to do so
will now trigger a warning.

This series fixes the three media drivers that got this wrong.

Johan


Johan Hovold (3):
  media: gspca/gl860: fix zero-length control requests
  media: gspca/sunplus: fix zero-length control requests
  media: rtl28xxu: fix zero-length control request

 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 3 ++-
 drivers/media/usb/gspca/gl860/gl860.c   | 4 ++--
 drivers/media/usb/gspca/sunplus.c       | 8 ++++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.26.3

