Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD961468D8B
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 22:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239615AbhLEWCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 17:02:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239569AbhLEWCx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 17:02:53 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68D4C061714
        for <linux-media@vger.kernel.org>; Sun,  5 Dec 2021 13:59:24 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 07F0DC63C2; Sun,  5 Dec 2021 21:59:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638741563; bh=j8JyTw4YXmAGrhWOPH9JAk/7avBxWV5GlqFN+j0wU3U=;
        h=From:To:Subject:Date:From;
        b=W15XdDNMcw/3Xx+O9wopoEOLz1R3g6n1eSa+ou5QA2LAUF7ueLVAQUsN4nCstgn8z
         xHiOPfVgTyi3OQfRRKO/0L0YlOi7s0kX3txJRhASDDadu0KldrvAUHnIoNP/mYE+Hm
         QI2qFKyHpaeHEMmNdwKPJlFFliPt84KAl0KhqZXN9/Hqt/aHlw87nCVSi020zaaMaN
         hPae6TMUuAxPS4wJD5XF7FnnW2639UiCVHbPxzE68+SSsP89ndwDCX5Z8RWN3+ztUX
         tmsW1inVI+SRY/wv8fkdlqK1IEGPTJ1fVWdbZO4gdwEjfF2oBkCuIPCSjB3TUVaicm
         BWB8m0PsMZmOw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: streamzap: less chatter
Date:   Sun,  5 Dec 2021 21:59:22 +0000
Message-Id: <20211205215922.25636-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove superfluous messages which add no information.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 1de4ce1b2033..3378ec7df459 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -26,7 +26,6 @@
 #include <linux/usb/input.h>
 #include <media/rc-core.h>
 
-#define DRIVER_VERSION	"1.61"
 #define DRIVER_NAME	"streamzap"
 #define DRIVER_DESC	"Streamzap Remote Control driver"
 
@@ -271,10 +270,8 @@ static struct rc_dev *streamzap_init_rc_dev(struct streamzap_ir *sz)
 	int ret;
 
 	rdev = rc_allocate_device(RC_DRIVER_IR_RAW);
-	if (!rdev) {
-		dev_err(dev, "remote dev allocation failed\n");
+	if (!rdev)
 		goto out;
-	}
 
 	usb_make_path(sz->usbdev, sz->phys, sizeof(sz->phys));
 	strlcat(sz->phys, "/input0", sizeof(sz->phys));
@@ -415,9 +412,6 @@ static int streamzap_probe(struct usb_interface *intf,
 	if (usb_submit_urb(sz->urb_in, GFP_ATOMIC))
 		dev_err(sz->dev, "urb submit failed\n");
 
-	dev_info(sz->dev, "Registered %s on usb%d:%d\n", name,
-		 usbdev->bus->busnum, usbdev->devnum);
-
 	return 0;
 
 rc_dev_fail:
-- 
2.33.1

