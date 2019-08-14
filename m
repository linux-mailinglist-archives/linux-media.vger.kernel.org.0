Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F298D72B
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 17:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfHNP2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 11:28:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50762 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfHNP2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 11:28:11 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A48832B2
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 17:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565796489;
        bh=4J8x03fBojg4wiPyMn8N8tQv11qHPkhdG1e12IxgYO4=;
        h=From:To:Subject:Date:From;
        b=whrYA+szxBBvO+UGJUnO9MqFHZV5LmaboaYWYaah4fBlf5GH3uWh3o2T762Z3XzmL
         qThnBxRsqGg09Ux2s+BkgBKF+CN1VDSyu5mogUADVtXkSWpWRr3i8Mr4QNHW+dMJxW
         am8YvMtNSMTQD1W5JtZEY2lE/RqWk+2QAvucLTig=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: uvc: Fix error path in control parsing failure
Date:   Wed, 14 Aug 2019 18:28:02 +0300
Message-Id: <20190814152802.1867-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When parsing the UVC control descriptors fails, the error path tries to
cleanup a media device that hasn't been initialised, potentially
resulting in a crash. Fix this by initialising the media device before
the error handling path can be reached.

Fixes: 5a254d751e52 ("[media] uvcvideo: Register a v4l2_device")
Reported-by: syzbot+c86454eb3af9e8a4da20@syzkaller.appspotmail.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 66ee168ddc7e..428235ca2635 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2151,6 +2151,20 @@ static int uvc_probe(struct usb_interface *intf,
 			   sizeof(dev->name) - len);
 	}
 
+	/* Initialize the media device. */
+#ifdef CONFIG_MEDIA_CONTROLLER
+	dev->mdev.dev = &intf->dev;
+	strscpy(dev->mdev.model, dev->name, sizeof(dev->mdev.model));
+	if (udev->serial)
+		strscpy(dev->mdev.serial, udev->serial,
+			sizeof(dev->mdev.serial));
+	usb_make_path(udev, dev->mdev.bus_info, sizeof(dev->mdev.bus_info));
+	dev->mdev.hw_revision = le16_to_cpu(udev->descriptor.bcdDevice);
+	media_device_init(&dev->mdev);
+
+	dev->vdev.mdev = &dev->mdev;
+#endif
+
 	/* Parse the Video Class control descriptor. */
 	if (uvc_parse_control(dev) < 0) {
 		uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC "
@@ -2171,19 +2185,7 @@ static int uvc_probe(struct usb_interface *intf,
 			"linux-uvc-devel mailing list.\n");
 	}
 
-	/* Initialize the media device and register the V4L2 device. */
-#ifdef CONFIG_MEDIA_CONTROLLER
-	dev->mdev.dev = &intf->dev;
-	strscpy(dev->mdev.model, dev->name, sizeof(dev->mdev.model));
-	if (udev->serial)
-		strscpy(dev->mdev.serial, udev->serial,
-			sizeof(dev->mdev.serial));
-	usb_make_path(udev, dev->mdev.bus_info, sizeof(dev->mdev.bus_info));
-	dev->mdev.hw_revision = le16_to_cpu(udev->descriptor.bcdDevice);
-	media_device_init(&dev->mdev);
-
-	dev->vdev.mdev = &dev->mdev;
-#endif
+	/* Register the V4L2 device. */
 	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
 		goto error;
 
-- 
Regards,

Laurent Pinchart

