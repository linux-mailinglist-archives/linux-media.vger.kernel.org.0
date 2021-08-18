Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBEF83F0CD7
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 22:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbhHRUfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 16:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhHRUfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 16:35:41 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09331C0613CF
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 13:35:06 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bt14so7726576ejb.3
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 13:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2w1vSuT1tH9Ybxo97VpBG8kj77ZOt5fncj54b1Z/4R4=;
        b=m3jlFtgdrR9kQKISjmF6YSNHIN6AUjyLp5Qshmuz62x/bGt9ZuZJl+lx7FYD0EWa5n
         SxM59XGaNKETVufiqmddRoQnYoDkjrmwGbHxm0a3i4tt+v4NKtsgRnhI7FPQBLSJucKM
         W0NJ+L8my4LfGEc07qEeFAq+rPwTBK7BnQbK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2w1vSuT1tH9Ybxo97VpBG8kj77ZOt5fncj54b1Z/4R4=;
        b=MP9WJ1061iC+kco5w0BBHJxCJdMT6q1KIqyLoGzeMu5oujhwoZPcrCeRzgaagx1UAD
         sGAwhyyX0KqQ5C4u7VkYk6nj1GYtbhC0RL4N6qtmweE+zy5rXPopZHFRaAHUsUcvHdnB
         ykTz9FFuWDLj7xexJlb73YC3dCd0Cdu7EjJilgVnTzuk6u+vO0YOP5C7Lspl+lIclQDT
         dKyltkVfoZk1LNl8oZRyO4XFvtLPegvP50n8AP18UYifhDAFlL0SMMcqfkCKQRQ7DHwf
         pT3/4yajEZ6kfsIiybyQIkorMF9uBpqB1uGx/uoCMDmDWx3h/TeyDjo2A4DAp73lnKpB
         ffmg==
X-Gm-Message-State: AOAM530SpQkM1wLI8iS/piWOTD9SN0IK3cqTb779iEswHM0JEFbgnxLT
        dn1c0sukhsV50xCZ9tg68N0FAA==
X-Google-Smtp-Source: ABdhPJwWQIvnGTiQlyxemd0ECkMsnSw7ex01olghXILxpbidr3dEckq/7kspPKT9iQnSY5HHdqCfSQ==
X-Received: by 2002:a17:906:d9dc:: with SMTP id qk28mr3519111ejb.491.1629318904574;
        Wed, 18 Aug 2021 13:35:04 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id f19sm602192edt.44.2021.08.18.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:35:04 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2] media: uvcvideo: Quirk for hardware with invalid sof
Date:   Wed, 18 Aug 2021 22:35:02 +0200
Message-Id: <20210818203502.269889-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The hardware timestamping code has the assumption than the device_sof
and the host_sof run at the same frequency (1 KHz).

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
v2: Fix typo in frequency

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

