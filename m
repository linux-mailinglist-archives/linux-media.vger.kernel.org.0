Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F3A3F0CA9
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 22:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbhHRUYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 16:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbhHRUYH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 16:24:07 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4B0C061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 13:23:32 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b7so5095405edu.3
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 13:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yE1jUBvTlSKiQfOB3L5au2tliUnWZLNpdRP8a1r8bhE=;
        b=UzSiYoVDYsdDr1U1Z7itOTxq4ovOxzLmTdQ4YCxF5BTfmv1hqXqq0cLfLcZGC7jHRJ
         61+VSyqb5ow2iTyKIovbUQCgSB/nQv6OC73tBqsEQZG74sy9Jhd8ivyDpDEef3Kmh+Gg
         /Y88ZJTuIw0BaH0gBTbSUMWxXJ8kNvBaImkvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yE1jUBvTlSKiQfOB3L5au2tliUnWZLNpdRP8a1r8bhE=;
        b=aRy5ZqY67H6DiZjXoZ9IkK70Uh8w+hIdkfE87wjuhRoM0hOeaXL8H7CiGFnsEWn+Qu
         Cd2aG5o91qJxkCQP8sCumeSzOy/QbAzbPrjrlyw7erWYT0B+1cRL+nesNBOxu3tuwaY4
         DOoHKg2P7xEEasWbo61rqATAe6JUIkCLUPjR4fBZ0FsXmVX1U414hbPpG9hPdhaGJUzx
         ZM8IojsZQauZzExJ0rsbZKjw4Iy51C+FjRIHu36zSLklmDeJDkUHzsrqvOQCfgQV6e8Y
         01w7HfTuVGX6UCyvo1+NjQWpK0PoCRmuPFurmlObErkd1Uoi4tixoJkhGadr+aRUC497
         JBWA==
X-Gm-Message-State: AOAM533/LqVG0hqHt8UU8cHcdNT1Rf0X16W/Kp7fw3guCvOc4W0qg1GX
        +7YLuIzriMCxq3laFuQgghjPaA==
X-Google-Smtp-Source: ABdhPJw2JwD3yZsePo2kPcmh/lzqRQwV65XVPEW32tN1mP+HlXLaaE4Ba9tQN9u5/krdIW12SwkIaA==
X-Received: by 2002:a05:6402:3128:: with SMTP id dd8mr12263271edb.40.1629318210766;
        Wed, 18 Aug 2021 13:23:30 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id m6sm597920edq.22.2021.08.18.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:23:30 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Quirk for hardware with invalid sof
Date:   Wed, 18 Aug 2021 22:23:28 +0200
Message-Id: <20210818202328.267644-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The hardware timestamping code has the assumption than the device_sof
and the host_sof run at the same frequency (2048 Hz).

Unfortunately, this is not the case for all the hardware. Add a quirk to
support such hardware.

Note on how to identify such hardware:
When running with "yavta -c /dev/videoX" Look for periodic jumps of the
fps. Eg:

30 (6) [-] none 30 614400 B 21.245557 21.395214 34.133 fps ts mono/SoE
31 (7) [-] none 31 614400 B 21.275327 21.427246 33.591 fps ts mono/SoE
32 (0) [-] none 32 614400 B 21.304739 21.459256 34.000 fps ts mono/SoE
33 (1) [-] none 33 614400 B 21.334324 21.495274 33.801 fps ts mono/SoE
34 (2) [-] none 34 614400 B 21.529237 21.527297 5.130 fps ts mono/SoE
35 (3) [-] none 35 614400 B 21.649416 21.559306 8.321 fps ts mono/SoE
36 (4) [-] none 36 614400 B 21.678789 21.595320 34.045 fps ts mono/SoE
...
99 (3) [-] none 99 614400 B 23.542226 23.696352 33.541 fps ts mono/SoE
100 (4) [-] none 100 614400 B 23.571578 23.728404 34.069 fps ts mono/SoE
101 (5) [-] none 101 614400 B 23.601425 23.760420 33.504 fps ts mono/SoE
102 (6) [-] none 102 614400 B 23.798324 23.796428 5.079 fps ts mono/SoE
103 (7) [-] none 103 614400 B 23.916271 23.828450 8.478 fps ts mono/SoE
104 (0) [-] none 104 614400 B 23.945720 23.860479 33.957 fps ts mono/SoE

They happen because the delta_sof calculated at
uvc_video_clock_host_sof(), wraps periodically, as both clocks drift.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
 drivers/media/usb/uvc/uvc_video.c  | 11 +++++++++--
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9a791d8ef200..d1e6cba10b15 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2771,6 +2771,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT) },
+	/* Logitech HD Pro Webcam C922 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x046d,
+	  .idProduct		= 0x085c,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
 	/* Chicony CNF7129 (Asus EEE 100HE) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 6d0e474671a2..760ab015cf9c 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -518,13 +518,20 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	/* To limit the amount of data, drop SCRs with an SOF identical to the
 	 * previous one.
 	 */
-	dev_sof = get_unaligned_le16(&data[header_size - 2]);
+	if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
+		dev_sof = usb_get_current_frame_number(stream->dev->udev);
+	else
+		dev_sof = get_unaligned_le16(&data[header_size - 2]);
+
 	if (dev_sof == stream->clock.last_sof)
 		return;
 
 	stream->clock.last_sof = dev_sof;
 
-	host_sof = usb_get_current_frame_number(stream->dev->udev);
+	if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
+		host_sof = dev_sof;
+	else
+		host_sof = usb_get_current_frame_number(stream->dev->udev);
 	time = uvc_video_get_time();
 
 	/* The UVC specification allows device implementations that can't obtain
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index cce5e38133cd..89d909661915 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -209,6 +209,8 @@
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
+#define UVC_QUIRK_INVALID_DEVICE_SOF	0x00002000
+
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.33.0.rc2.250.ged5fa647cd-goog

