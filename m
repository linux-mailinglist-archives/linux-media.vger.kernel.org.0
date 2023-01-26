Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E5067CF42
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjAZPHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbjAZPHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702C56AF4B
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B97861886
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48FEC4339C;
        Thu, 26 Jan 2023 15:07:15 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 14/17] media: usb: go7007: add second unwind label
Date:   Thu, 26 Jan 2023 16:06:54 +0100
Message-Id: <20230126150657.367921-15-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most of the time the same unwind code was used for errors,
except in one case where it just returned. But smatch didn't like
that, so make a new goto label for that situation.

This fixes this smatch warning:

go7007-usb.c:702 go7007_usb_ezusb_write_interrupt() warn: missing unwind goto?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/go7007/go7007-usb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index eeb85981e02b..d8524d761c32 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -697,10 +697,9 @@ static int go7007_usb_ezusb_write_interrupt(struct go7007 *go,
 	}
 	if (r < 0)
 		goto write_int_error;
-	if (i == 100) {
-		dev_err(go->dev, "device is hung, status reg = 0x%04x\n", status_reg);
-		return -1;
-	}
+	if (i == 100)
+		goto dev_is_hung;
+
 	r = usb_control_msg(usb->usbdev, usb_sndctrlpipe(usb->usbdev, 0), 0x12,
 			USB_TYPE_VENDOR | USB_RECIP_DEVICE, data,
 			INT_PARAM_ADDR, NULL, 0, timeout);
@@ -716,6 +715,10 @@ static int go7007_usb_ezusb_write_interrupt(struct go7007 *go,
 write_int_error:
 	dev_err(go->dev, "error in WriteInterrupt: %d\n", r);
 	return r;
+
+dev_is_hung:
+	dev_err(go->dev, "device is hung, status reg = 0x%04x\n", status_reg);
+	return -1;
 }
 
 static int go7007_usb_onboard_write_interrupt(struct go7007 *go,
-- 
2.39.0

