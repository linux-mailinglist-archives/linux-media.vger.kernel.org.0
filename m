Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CA23AFF43
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 10:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFVIb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 04:31:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:46196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhFVIb0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 04:31:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 750516128C;
        Tue, 22 Jun 2021 08:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624350551;
        bh=NXPyza1D6FRsjY/khyfK7k7VgOA4Al1gpFPKZWvZH+I=;
        h=From:To:Cc:Subject:Date:From;
        b=qHBDtrTowS9f4IffNuDZpH6Jqbmvn+a4J9zVQQxdXpTT+k4zsGK2jMyqs+dn25oOC
         U6thlLweCYN+clKZyXqRsj3vxlok0vPMP0FfoH23F91RqMdPpLxkk78QkXtSfVVnE1
         cY5LwtrdIRJzx0+2fVV7a1PGG4rObB1qBopCMt/kPvXAaVpeFAZVju2AVn7/QOuwT5
         yGBUZqVMypOMH0m/IZ8Rw92NcHVs0GL1lDPCMnDzkpHdR/PZA7syXSuTRWe8n2f7+T
         dDstawnqqpZwz9vGPJwSZWObHWd/sTRQcsXwVSk1+znCAideUkYm2qUV3JrauPauM0
         mNnsAhTq022cw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lvbmO-000pAO-VT; Tue, 22 Jun 2021 10:29:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2] media: uvc: limit max bandwidth for HDMI capture
Date:   Tue, 22 Jun 2021 10:29:07 +0200
Message-Id: <bca0634691cea503c2c5df62b98ba66f0c85bf85.1624350539.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
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
is not supported. If set to it, URB packages will be dropped,
causing JPEG decoding errors and part of the video frames will
be missed.

Also, as specified at the device's documentation, for such
resolution, the maximum interval is 30 fps (interval == 333333).

The last format that supports such frame interval is 1280x720.

Add a quirk to estimate a raw bandwidth, by doing:
        width * height * framerate
E. g.:
        1920 * 1080 * 30 = 62208000

if the bandwidth is greater than such threshold, get
the next value from the dwFrameInterval.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 30 +++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 30ef2a3110f7..bb66e71b3064 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2615,6 +2615,11 @@ static const struct uvc_device_info uvc_quirk_fix_bandwidth = {
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
@@ -2830,6 +2835,15 @@ static const struct usb_device_id uvc_ids[] = {
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
index f2f565281e63..84edaa7cc24d 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -162,9 +162,33 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
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
+	if (format->flags & UVC_FMT_FLAG_COMPRESSED) {
+		u32 bandwidth;
+
+		if (!stream->dev->info->max_bandwidth || !frame->bFrameIntervalType)
+			return;
+
+		for (i = 0; i < frame->bFrameIntervalType; ++i) {
+			bandwidth = frame->wWidth * frame->wHeight;
+			bandwidth *= 10000000 / frame->dwFrameInterval[i];
+
+			if (bandwidth <= stream->dev->info->max_bandwidth)
+				break;
+		}
+
+		if (ctrl->dwFrameInterval < frame->dwFrameInterval[i])
+			ctrl->dwFrameInterval = frame->dwFrameInterval[i];
+
+		return;
+	}
+
+	if (stream->intf->num_altsetting > 1) {
 		u32 interval;
 		u32 bandwidth;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 97df5ecd66c9..f1c34225d896 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -658,6 +658,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
 
 struct uvc_device_info {
 	u32	quirks;
+	u32	max_bandwidth;
 	u32	meta_format;
 	u16	uvc_version;
 };
-- 
2.31.1

