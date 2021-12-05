Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9157E468CF3
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 20:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237649AbhLETWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 14:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbhLETWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 14:22:05 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66479C061714
        for <linux-media@vger.kernel.org>; Sun,  5 Dec 2021 11:18:38 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5F276C603C; Sun,  5 Dec 2021 19:18:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638731915; bh=TBwLAr0ZhsDO36jhBfJPFR8bAz4vYCn5pI3iFhzMOLE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CG2hmTibovVvkuaKkSHF4T8VhE44n2rnC9vyyoJIUWU3tICmhyYnmyUrLSau2nIhf
         tRIdZqNY6fs8tLzS4SPlHhGbkSV3Rx1z7Q1TUQu6AMBXFPDUmxxt7vIxRmmjGgRJ8A
         DcOb486txKrc9qhjJdQhL0thu0JfDiv8ZmsYDxIvWVBBQyESHLU+C/2b1h4FhptBEK
         /5I+0PJ12kxsVUJyJBBQR39DhS6Gbyqn0m/vholskH4o04A9MPv3v4deLBwYpWLUoU
         VZbrESY1cIW1SQEYXNWDfj0NfTU/rAeOjH4WK6DC9Cz5B0Z61Or0PsWUIC+Vjg9Nn1
         PpZIS5pbBsrKA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: streamzap: no need for usb pid/vid in device name
Date:   Sun,  5 Dec 2021 19:18:35 +0000
Message-Id: <93926dc67db003add60eda3a4eb874ef5a74843b.1638731886.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <8a5f192d46f6bf631feeec91f6942b568bac8c05.1638731886.git.sean@mess.org>
References: <8a5f192d46f6bf631feeec91f6942b568bac8c05.1638731886.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The usb pid/vid can be found elsewhere, the idVendor/idProduct usb sysfs
files for example.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 76f5c72501c4..1de4ce1b2033 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -88,7 +88,6 @@ struct streamzap_ir {
 	ktime_t			signal_start;
 	bool			timeout_enabled;
 
-	char			name[128];
 	char			phys[64];
 };
 
@@ -277,13 +276,10 @@ static struct rc_dev *streamzap_init_rc_dev(struct streamzap_ir *sz)
 		goto out;
 	}
 
-	snprintf(sz->name, sizeof(sz->name), "Streamzap PC Remote Infrared Receiver (%04x:%04x)",
-		 le16_to_cpu(sz->usbdev->descriptor.idVendor),
-		 le16_to_cpu(sz->usbdev->descriptor.idProduct));
 	usb_make_path(sz->usbdev, sz->phys, sizeof(sz->phys));
 	strlcat(sz->phys, "/input0", sizeof(sz->phys));
 
-	rdev->device_name = sz->name;
+	rdev->device_name = "Streamzap PC Remote Infrared Receiver";
 	rdev->input_phys = sz->phys;
 	usb_to_input_id(sz->usbdev, &rdev->input_id);
 	rdev->dev.parent = dev;
-- 
2.33.1

