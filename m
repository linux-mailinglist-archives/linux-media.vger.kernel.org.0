Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5912BAEFB
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 16:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgKTPbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 10:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbgKTPbI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 10:31:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A32C0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 07:31:08 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 900212A3;
        Fri, 20 Nov 2020 16:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605886265;
        bh=lgqFxxAclQAFBYoh9/n14XkNgUu8aA7aa0G6i0MDkDY=;
        h=From:To:Cc:Subject:Date:From;
        b=nrsEGLnqRe0lLw5X2eMDwihktQG1DBtEC0roGIbjixv4wlkNSEr2R39PrzOWkmSQb
         v7ToSpd/sYZ+zUVbkcjoe2+2a8o7nwR+CM59txVh7YDSs0T+UBSPqS3htAm3FORUUy
         N2EM+lsi5xfcXYL0RxKYelfNW5crD3+hd6/zG6Ao=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 1bcf:0b40
Date:   Fri, 20 Nov 2020 17:30:55 +0200
Message-Id: <20201120153055.16803-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Shenzhen Aoni Electronic Co.,Ltd 2K FHD camera reports a UVC 1.10
version, but implements UVC 1.0a as shown by the UVC probe control being
26 bytes long. Force the UVC version for that device.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reported-by: Doncho Minkov <donchominkov@gmail.com>
Tested-by: Doncho Minkov <donchominkov@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ddb9eaa11be7..ae970f19bfca 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2274,6 +2274,12 @@ static int uvc_probe(struct usb_interface *intf,
 			"linux-uvc-devel mailing list.\n");
 	}
 
+	if (dev->info->uvc_version) {
+		dev->uvc_version = dev->info->uvc_version;
+		uvc_printk(KERN_INFO, "Forcing UVC version to %u.%02x\n",
+			   dev->uvc_version >> 8, dev->uvc_version & 0xff);
+	}
+
 	/* Register the V4L2 device. */
 	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
 		goto error;
@@ -2923,6 +2929,17 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+	/* Shenzhen Aoni Electronic Co.,Ltd 2K FHD camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1bcf,
+	  .idProduct		= 0x0b40,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version = 0x010a,
+	  } },
 	/* SiGma Micro USB Web Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a3dfacf069c4..8ec9eca07f06 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -635,6 +635,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
 struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
+	u16	uvc_version;
 };
 
 struct uvc_device {
-- 
Regards,

Laurent Pinchart

