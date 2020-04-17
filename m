Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB591AE2EF
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgDQQ7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:46108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbgDQQ7B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B87CE2223F;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=OEv8mhY7vzb5P9tEqEGaJZJoTs4ZmKbJwEh2Z7DF3ng=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VSN+u+T9rmGr7qw9PFIAa9IrSmYCl0irCBAl9Qhk7dYZCgi7+eCSHk4nF33JK0kEY
         wJP8nQOose8aLr5DR/S73bHW+vKVp8iCulxGi4MDW/8hDJAuzQCR7w+2OtS4D7CNfJ
         +l0554LIFV+r0nsBPT06W65E6BRd0IV9HROBx7m4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wLG-26; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>
Subject: [PATCH 03/15] media: pwc-if.c: Update comments about each pwc supported model
Date:   Fri, 17 Apr 2020 18:58:44 +0200
Message-Id: <8b92306b5d04a48b0a1bfe6af93a73fcab892d41.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The USB_DEVICE() list contain some of the product names, but
some are missing, and others are different than the message
printed during device detection.

Update the comments in order to match what the driver prints.

That makes easier to discover what model matches what physical
device.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/pwc/pwc-if.c | 42 +++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index d57b8b786506..8270fb061bd6 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -71,37 +71,37 @@
 
 /* hotplug device table support */
 static const struct usb_device_id pwc_device_table [] = {
-	{ USB_DEVICE(0x0471, 0x0302) }, /* Philips models */
-	{ USB_DEVICE(0x0471, 0x0303) },
-	{ USB_DEVICE(0x0471, 0x0304) },
-	{ USB_DEVICE(0x0471, 0x0307) },
-	{ USB_DEVICE(0x0471, 0x0308) },
-	{ USB_DEVICE(0x0471, 0x030C) },
-	{ USB_DEVICE(0x0471, 0x0310) },
-	{ USB_DEVICE(0x0471, 0x0311) }, /* Philips ToUcam PRO II */
-	{ USB_DEVICE(0x0471, 0x0312) },
-	{ USB_DEVICE(0x0471, 0x0313) }, /* the 'new' 720K */
-	{ USB_DEVICE(0x0471, 0x0329) }, /* Philips SPC 900NC PC Camera */
-	{ USB_DEVICE(0x0471, 0x032C) }, /* Philips SPC 880NC PC Camera */
-	{ USB_DEVICE(0x069A, 0x0001) }, /* Askey */
-	{ USB_DEVICE(0x046D, 0x08B0) }, /* Logitech QuickCam Pro 3000 */
+	{ USB_DEVICE(0x0471, 0x0302) }, /* Philips PCA645VC */
+	{ USB_DEVICE(0x0471, 0x0303) }, /* Philips PCA646VC */
+	{ USB_DEVICE(0x0471, 0x0304) }, /* Askey VC010 type 2 */
+	{ USB_DEVICE(0x0471, 0x0307) }, /* Philips PCVC675K (Vesta) */
+	{ USB_DEVICE(0x0471, 0x0308) }, /* Philips PCVC680K (Vesta Pro) */
+	{ USB_DEVICE(0x0471, 0x030C) }, /* Philips PCVC690K (Vesta Pro Scan) */
+	{ USB_DEVICE(0x0471, 0x0310) }, /* Philips PCVC730K (ToUCam Fun)/PCVC830 (ToUCam II) */
+	{ USB_DEVICE(0x0471, 0x0311) }, /* Philips PCVC740K (ToUCam Pro)/PCVC840 (ToUCam II) */
+	{ USB_DEVICE(0x0471, 0x0312) }, /* Philips PCVC750K (ToUCam Pro Scan) */
+	{ USB_DEVICE(0x0471, 0x0313) }, /* Philips PCVC720K/40 (ToUCam XS) */
+	{ USB_DEVICE(0x0471, 0x0329) }, /* Philips SPC 900NC webcam */
+	{ USB_DEVICE(0x0471, 0x032C) }, /* Philips SPC 880NC webcam */
+	{ USB_DEVICE(0x069A, 0x0001) }, /* Askey VC010 type 1 */
+	{ USB_DEVICE(0x046D, 0x08B0) }, /* Logitech QuickCam 3000 Pro */
 	{ USB_DEVICE(0x046D, 0x08B1) }, /* Logitech QuickCam Notebook Pro */
-	{ USB_DEVICE(0x046D, 0x08B2) }, /* Logitech QuickCam Pro 4000 */
+	{ USB_DEVICE(0x046D, 0x08B2) }, /* Logitech QuickCam 4000 Pro */
 	{ USB_DEVICE(0x046D, 0x08B3) }, /* Logitech QuickCam Zoom (old model) */
 	{ USB_DEVICE(0x046D, 0x08B4) }, /* Logitech QuickCam Zoom (new model) */
 	{ USB_DEVICE(0x046D, 0x08B5) }, /* Logitech QuickCam Orbit/Sphere */
-	{ USB_DEVICE(0x046D, 0x08B6) }, /* Cisco VT Camera */
+	{ USB_DEVICE(0x046D, 0x08B6) }, /* Logitech/Cisco VT Camera */
 	{ USB_DEVICE(0x046D, 0x08B7) }, /* Logitech ViewPort AV 100 */
-	{ USB_DEVICE(0x046D, 0x08B8) }, /* Logitech (reserved) */
+	{ USB_DEVICE(0x046D, 0x08B8) }, /* Logitech QuickCam */
 	{ USB_DEVICE(0x055D, 0x9000) }, /* Samsung MPC-C10 */
 	{ USB_DEVICE(0x055D, 0x9001) }, /* Samsung MPC-C30 */
 	{ USB_DEVICE(0x055D, 0x9002) },	/* Samsung SNC-35E (Ver3.0) */
 	{ USB_DEVICE(0x041E, 0x400C) }, /* Creative Webcam 5 */
 	{ USB_DEVICE(0x041E, 0x4011) }, /* Creative Webcam Pro Ex */
-	{ USB_DEVICE(0x04CC, 0x8116) }, /* Afina Eye */
-	{ USB_DEVICE(0x06BE, 0x8116) }, /* new Afina Eye */
-	{ USB_DEVICE(0x0d81, 0x1910) }, /* Visionite */
-	{ USB_DEVICE(0x0d81, 0x1900) },
+	{ USB_DEVICE(0x04CC, 0x8116) }, /* Sotec Afina Eye */
+	{ USB_DEVICE(0x06BE, 0x8116) }, /* AME Co. Afina Eye */
+	{ USB_DEVICE(0x0d81, 0x1900) }, /* Visionite VCS-UC300 */
+	{ USB_DEVICE(0x0d81, 0x1910) }, /* Visionite VCS-UM100 */
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, pwc_device_table);
-- 
2.25.2

