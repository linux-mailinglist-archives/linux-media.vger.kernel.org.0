Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B1F2B7C06
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbgKRLAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgKRLAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:00:36 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A3BC0613D4
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 03:00:36 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 18E18C63B0; Wed, 18 Nov 2020 11:00:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1605697234; bh=998X+8vPt8etJpRc8hdNJHpH57o8TABOyM0UrXPvuf4=;
        h=From:To:Cc:Subject:Date:From;
        b=KlTALOtGhudY10kRKsKoOThdRrWdxbOrN8up4gYDnLBw99+L9/BHsAA7IKHH63hIa
         1B88Vglmj5FUjNT70APpPlp5XqxpK0SJCNRkLRWajTpERzfQjGi2OywcIVOUxBOfvs
         W4uTNenC45VQS1ZmJtcrpqP0sU5ItaN7bQJly2VNlra4KDVkzi75jXPiNMZdk57sOw
         2PLXcnuf5IR4EPv3u24BHe1mRlfYnzEIQnd5hNpxSNhETqTpZiqoVKe8XIMSVKzjpM
         mSPr/jbOxdjn9DHftSqMi8c+vhXwG9zZ6lzs9xIsjIOeo7eiY2PLgfDd3N+KFGuBpT
         uenf6FPNjDSxw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] media: lirc: ensure RC_PROTO_MAX has documentation
Date:   Wed, 18 Nov 2020 11:00:33 +0000
Message-Id: <20201118110034.19752-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The enum rc_proto value RC_PROTO_MAX has no documentation, this is causing
a warning while building the documentation.

Fixes: 72e637fec558 ("media: rc: validate that "rc_proto" is reasonable")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sean Young <sean@mess.org>
---
 include/uapi/linux/lirc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
index c1eb960adde3..bf0672a6d341 100644
--- a/include/uapi/linux/lirc.h
+++ b/include/uapi/linux/lirc.h
@@ -196,6 +196,7 @@ struct lirc_scancode {
  * @RC_PROTO_RCMM24: RC-MM protocol 24 bits
  * @RC_PROTO_RCMM32: RC-MM protocol 32 bits
  * @RC_PROTO_XBOX_DVD: Xbox DVD Movie Playback Kit protocol
+ * @RC_PROTO_MAX: Maximum value of enum rc_proto
  */
 enum rc_proto {
 	RC_PROTO_UNKNOWN	= 0,
-- 
2.28.0

