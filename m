Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C81C30B013
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 20:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhBATJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 14:09:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:39344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230298AbhBATJo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 14:09:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D383164E24;
        Mon,  1 Feb 2021 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612206544;
        bh=VG9mPOtHquxNPBKnhHB+LOqEx1qe2BWhHRznBKT4Igc=;
        h=From:To:Cc:Subject:Date:From;
        b=bxFD/N7/oWqJ06XkQFYjmyxnf5kLAG/QYwQpe8vMqbKTH1GzCQZEq3eDVxrG/GiJO
         ZrhGplskzsMM/+KhMHPE3b7do07fEsgAdhGcUMMhid15jvkXcK2Uds9kHdHO5xqbcZ
         ehUSnrXTUxhamq+QGyUApQsz4VS3PJzUS7XweTfPD2F+enp0UojThlVfZ7OkqLKvZG
         FjDuyMpKPRy/qDVqrjdjtt8sPdPwyKyBBjYvt8OT04fSORPIRlMfJYlilwgljfbEq+
         8UFIaxwBX/TnbORHe6NwVMy6RPk6WMxn7I4xTywTBKWz7qmAXMIsXT6Xfu34Y/rquV
         B8FgsEnpjZ2Vg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1l6eZJ-000M4m-9a; Mon, 01 Feb 2021 20:09:01 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: uvc: limit max bandwidth for HDMI capture
Date:   Mon,  1 Feb 2021 20:08:59 +0100
Message-Id: <b791d5874c83663505cbd4f74907ac38d00bb727.1612206534.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This device:
        534d:2109 MacroSilicon

Announces that it supports several frame intervals for
their resolutions for MJPEG compression:

        VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                   768000
        dwMaxBitRate                196608000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  5
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)           1000000

However, the highest frame interval (166666), which means 60 fps
is not supported. For such resolution, the maximum interval
is, instead 333333 (30 fps).

The last format that supports such frame interval is 1280x720.

Add a quirk to estimate a raw bandwidth, by doing:
        width * height * framerate
E. g.:
        1920 * 1080 * 30 = 62208000

if the bandwidth is greater than such threshold, get
the next value from the dwFrameInterval.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 15 +++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 26 +++++++++++++++++++++++---
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1abc122a0977..c83a329f6527 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2339,6 +2339,7 @@ static int uvc_probe(struct usb_interface *intf,
 	dev->info = info ? info : &uvc_quirk_none;
 	dev->quirks = uvc_quirks_param == -1
 		    ? dev->info->quirks : uvc_quirks_param;
+	dev->max_bandwidth = dev->info->max_bandwidth;
 
 	if (id->idVendor && id->idProduct)
 		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",
@@ -2615,6 +2616,11 @@ static const struct uvc_device_info uvc_quirk_fix_bandwidth = {
 	.quirks = UVC_QUIRK_FIX_BANDWIDTH,
 };
 
+static const struct uvc_device_info uvc_quirk_fix_bw_622 = {
+	.quirks = UVC_QUIRK_FIX_BANDWIDTH,
+	.max_bandwidth = 62208000,
+};
+
 static const struct uvc_device_info uvc_quirk_probe_def = {
 	.quirks = UVC_QUIRK_PROBE_DEF,
 };
@@ -2830,6 +2836,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
+	/* MacroSilicon HDMI capture */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x534d,
+	  .idProduct		= 0x2109,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bw_622 },
 	/* Genesys Logic USB 2.0 PC Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f2f565281e63..4afc1fbe0801 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -162,9 +162,29 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
 		ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
 
-	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
-	    stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
-	    stream->intf->num_altsetting > 1) {
+
+	if (!(stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH))
+		return;
+
+	/* Handle UVC_QUIRK_FIX_BANDWIDTH */
+
+	if (format->flags & UVC_FMT_FLAG_COMPRESSED &&
+	    stream->dev->max_bandwidth && frame->bFrameIntervalType) {
+		u32 bandwidth;
+
+		for (i = 0; i < frame->bFrameIntervalType - 1; ++i) {
+			bandwidth = frame->wWidth * frame->wHeight;
+			bandwidth *= 10000000 / frame->dwFrameInterval[i];
+
+			if (bandwidth <= stream->dev->max_bandwidth)
+				break;
+		}
+
+		ctrl->dwFrameInterval = frame->dwFrameInterval[i];
+		return;
+	}
+
+	if (stream->intf->num_altsetting > 1) {
 		u32 interval;
 		u32 bandwidth;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 97df5ecd66c9..b44e0cd4c826 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -658,6 +658,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
 
 struct uvc_device_info {
 	u32	quirks;
+	u32	max_bandwidth;
 	u32	meta_format;
 	u16	uvc_version;
 };
@@ -667,6 +668,7 @@ struct uvc_device {
 	struct usb_interface *intf;
 	unsigned long warnings;
 	u32 quirks;
+	u32 max_bandwidth;
 	int intfnum;
 	char name[32];
 
-- 
2.29.2

