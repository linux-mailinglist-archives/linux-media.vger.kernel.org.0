Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE80740B2D7
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 17:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234803AbhINPTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 11:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234350AbhINPTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 11:19:31 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6809FC061768
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 08:18:12 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7A9BBC64DB; Tue, 14 Sep 2021 16:18:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631632689; bh=X5FVP3NY/rkYiydH64k/xGz1BQQi5i1hZr4CRXtGGRE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ax9Jr0jNhYiI91jz98p9hVBchlDmQnzMXKv56tBwfekLU8DW13elwzaBOSR++m1be
         dXsqYzuUwq8MpKzDz2OYdwYR1FibwEPUssYJ/tdwH5htgoy9qFFot5gzpdfK6mbO44
         hNyZfdKsT0arC4EuPJkGIwMD1hg871zrJCH7XLqNzwKp49dR3cxl8FkGPJK5wYzhzL
         hga1yZJR4Xjk61uUSsSH/z/oYkyUlwiVNYpNqdyR4lbWvxCzI9mTAXk/fM2DkS/IEZ
         VeJZXkvwc66+BnczlQNZ1CL5JlmIRHKuU3WuOI71wMwFbygTO8p1OV9xEbXZCBdgm4
         tXhK9qv6uG4aQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Georgi Bakalski <georgi.bakalski@gmail.com>
Subject: [PATCH 3/4] media: ir_toy: do not resubmit broken urb
Date:   Tue, 14 Sep 2021 16:18:08 +0100
Message-Id: <c6db1a8122d0c8383b0b16c49057d78720675013.1631632442.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <22eeae667aac9d5eaaae2f21904f238ebef0c05b.1631632442.git.sean@mess.org>
References: <22eeae667aac9d5eaaae2f21904f238ebef0c05b.1631632442.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This causes the same urb to resubmitted continuously, hogging up a cpu.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir_toy.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index 2b7c8bba4d6a..d2d9346eb8f5 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -213,10 +213,20 @@ static void irtoy_in_callback(struct urb *urb)
 	struct irtoy *irtoy = urb->context;
 	int ret;
 
-	if (urb->status == 0)
+	switch (urb->status) {
+	case 0:
 		irtoy_response(irtoy, urb->actual_length);
-	else
+		break;
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+	case -EPROTO:
+	case -EPIPE:
+		usb_unlink_urb(urb);
+		return;
+	default:
 		dev_dbg(irtoy->dev, "in urb status: %d\n", urb->status);
+	}
 
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret && ret != -ENODEV)
-- 
2.31.1

