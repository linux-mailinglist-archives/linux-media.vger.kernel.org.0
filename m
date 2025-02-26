Return-Path: <linux-media+bounces-27034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F3A45FF1
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E0DA171B1C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C169A149C50;
	Wed, 26 Feb 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IRKXXwVN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4531476035
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740574848; cv=none; b=f5o5q6MbJL1yufwLjUid7QFi7o1IGTNHPhBD6pLHoJ79ZVe5Khy4N8fClcP7C2EXOE5Lg5lIyHvsS7ynZxeoIQjxL7eafkOZL9IVkYDHsNDxlxrgNzL7xbUvAWLju3VVbkz7MGnTsLxbyMOu0W8CVgBBTX2zAuXbwO93+cN48Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740574848; c=relaxed/simple;
	bh=J4phSIV1IsjqS10A2sa1wgkOOB8DmVkKChjhEjWMup8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bjdSkLrZElCETKuTmuwfuJasWQQAZD5J6L5ogDM7IFY6IqG64BwfTTe3CNtCmwpK31MrHRnTwktqzPk0cKCTfb88+rzHoeAmQqGa7Qx/7q6XN2txHH+ton6tMvIY94cJ1HBbijz7YRjs8pA7Tzcfl0hWcS20Isfp5IIZkEmigmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IRKXXwVN; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ddcff5a823so54137946d6.0
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 05:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740574845; x=1741179645; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyjZzj7d18wJwwwvJyvuoYwwAkfDubW7UUdetywU8Bk=;
        b=IRKXXwVNU54sXzlm27W1xKiTvSFCjGoeHlL43XUCwBEFb7qrr+FTKXR8WsTAfyoNEg
         //zmegksQAkBTa6LwjeSzJb0FpyUtoeKi9U3FaeqNpg0fKKywMT9VmsjZZBCQDenR3+m
         2G2UgeSpu4Jdvz0IKmODG79lIx81hkR0XoNpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740574845; x=1741179645;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyjZzj7d18wJwwwvJyvuoYwwAkfDubW7UUdetywU8Bk=;
        b=aohTxUqBkcGOOA/kCuLpcAOJQq/1hcRiV1eiL2n8h2fX90fUYXpE0ddQ0oxpSZGHIY
         eIWIYKiLomY5H7d09peEa/ptRnhFX5MhIjK+eGgGB5wlr6Af+NF/bn8X8jxNC6y6UYx1
         HUGXNkYrlXYAG7Vty6RwlhBll0n1RCFF6jt92C+BTLW4Br76jq5tzBDzaP8HPQFNxpgH
         foqZ++sawbHIwZkOGCtvbLj6pm+XU6JKfKSY6oYzuPNxKiIwb+4BIWasjmfEwBjcNYFf
         /+nuDhrTCkcw4xax3aFJWXm3LHMu+hAbcaeIgJtwLwuCivfxF/zgH/BM9E0kkAjDFh1L
         Y99g==
X-Gm-Message-State: AOJu0Yx5sO8wI8tCmM//9Kiy74VWVZlwJYAz9mQS9NlrtIJ5v7lKm8dt
	yxuLaWQWMLmpC6teKpkyWJL+bl8fwKBZ6ZT8rGttczlJM6jrSknJd5h1sxKERA==
X-Gm-Gg: ASbGnctDhZcCjiAWpuBXZ5FuSrVB3Y6CMsE9zgWVoKRRR60s+iR/wIbM2hzltY8aQcX
	hgg7ykIan7I96XAVUZM82UuIKWBpOOJ+3Z0AzXxm7sPVOt11uXy/RX0z9UaeiIySFwa8S11njfU
	a+Eopke7PXMUUTmHFZ24Ck/7CLldBrA60UK4aZWxNLk0dgdJG2lSmSWx6VJ6WcOM7On0KtUDp0/
	tzyKE90VyOgd70KVNZRtDQLgtygRuAF+S/neWwGMr2Mqt/gl0I2YWVGlSBkbVa44wDbfOqLHEM9
	wU5DxHd2QtVcnsUsl5SLlLpM27IV6vufQhL116gxrkBDw0fgaGxxL7KIUioox0JgnHR18tH+KUs
	ctbc=
X-Google-Smtp-Source: AGHT+IGilKUCIddlifEHfV55Je9mp/wb6bVRPjoaxtBcDtdpEkbeF145mOvbHiuK5gNopTCnvtipWA==
X-Received: by 2002:a05:6214:3001:b0:6d4:215d:91b5 with SMTP id 6a1803df08f44-6e88688790amr48200446d6.11.1740574845021;
        Wed, 26 Feb 2025 05:00:45 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e87b19af0asm21698536d6.121.2025.02.26.05.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 05:00:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 26 Feb 2025 13:00:41 +0000
Subject: [PATCH] media: uvcvideo: Enable full UVC metadata for all devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHgQv2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMz3dKyZN3c1JLElMSSRF2jVPNUExNTSzOzlFQloJaCotS0zAqwcdG
 xtbUAQVuZil4AAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
V4L2_META_FMT_D4XX. The only difference between the two of them is that
V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
V4L2_META_FMT_D4XX copies the whole metadata section.

Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
devices, but it is useful for any device where vendors include other
metadata, such as the one described by Microsoft:
- https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata

This patch removes the UVC_INFO_META macro and enables
V4L2_META_FMT_D4XX for every device. It also updates the documentation
to reflect the change.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../userspace-api/media/v4l/metafmt-d4xx.rst       | 19 +++--
 .../userspace-api/media/v4l/metafmt-uvc.rst        |  6 +-
 drivers/media/usb/uvc/uvc_driver.c                 | 83 ----------------------
 drivers/media/usb/uvc/uvc_metadata.c               | 15 ++--
 drivers/media/usb/uvc/uvcvideo.h                   |  1 -
 5 files changed, 23 insertions(+), 101 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
index 0686413b16b2..1b18ef056934 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
@@ -6,12 +6,23 @@
 V4L2_META_FMT_D4XX ('D4XX')
 *******************************
 
-Intel D4xx UVC Cameras Metadata
+UVC Full Payload Header Data (formerly known as Intel D4xx UVC Cameras
+Metadata).
 
 
 Description
 ===========
 
+V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
+V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
+payload header data. It was originally implemented for Intel D4xx cameras, and
+thus the name, but now it can be used by any UVC device, when userspace wants
+full access to the UVC Metadata.
+
+
+Intel D4xx Metadata
+===================
+
 Intel D4xx (D435, D455 and others) cameras include per-frame metadata in their UVC
 payload headers, following the Microsoft(R) UVC extension proposal [1_]. That
 means, that the private D4XX metadata, following the standard UVC header, is
@@ -21,10 +32,8 @@ types are MetadataId_CaptureStats (ID 3), MetadataId_CameraExtrinsics (ID 4),
 and MetadataId_CameraIntrinsics (ID 5). For their description see [1_]. This
 document describes proprietary metadata types, used by D4xx cameras.
 
-V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
-V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
-payload header data. D4xx cameras use bulk transfers and only send one payload
-per frame, therefore their headers cannot be larger than 255 bytes.
+D4xx cameras use bulk transfers and only send one payload per frame, therefore
+their headers cannot be larger than 255 bytes.
 
 This document implements Intel Configuration version 3 [9_].
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbd..a3aae580e89e 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -6,7 +6,7 @@
 V4L2_META_FMT_UVC ('UVCH')
 *******************************
 
-UVC Payload Header Data
+UVC Partial Payload Header Data (formerly known as UVC Payload Header Data).
 
 
 Description
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field (please note that
+        regardless of this value, the driver will never copy more than 12
+        bytes).
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index deadbcea5e22..f19dcd4a7ac6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2488,8 +2488,6 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
 };
 
 #define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
-#define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
-	{.meta_format = m}
 
 /*
  * The Logitech cameras listed below have their interface class set to
@@ -3107,87 +3105,6 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
-	/* Intel D410/ASR depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0ad2,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D415/ASRC depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0ad3,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D430/AWG depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0ad4,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel RealSense D4M */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b03,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D435/AWGC depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b07,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D435i depth camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b3a,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D405 Depth Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b5b,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D455 Depth Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x0b5c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D421 Depth Module */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x8086,
-	  .idProduct		= 0x1155,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6..5c44e6cdb83c 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -60,18 +60,16 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 				    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file->private_data;
-	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
-	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
-	u32 fmeta = fmt->dataformat;
+	u32 fmeta = fmt->dataformat == V4L2_META_FMT_D4XX ?
+		    V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
 
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
 	memset(fmt, 0, sizeof(*fmt));
 
-	fmt->dataformat = fmeta == dev->info->meta_format
-			? fmeta : V4L2_META_FMT_UVC;
+	fmt->dataformat = fmeta;
 	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
 	return 0;
@@ -110,19 +108,16 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 				      struct v4l2_fmtdesc *fdesc)
 {
 	struct v4l2_fh *vfh = file->private_data;
-	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
-	struct uvc_device *dev = stream->dev;
 	u32 index = fdesc->index;
 
-	if (fdesc->type != vfh->vdev->queue->type ||
-	    index > 1U || (index && !dev->info->meta_format))
+	if (fdesc->type != vfh->vdev->queue->type || index > 1U)
 		return -EINVAL;
 
 	memset(fdesc, 0, sizeof(*fdesc));
 
 	fdesc->type = vfh->vdev->queue->type;
 	fdesc->index = index;
-	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
+	fdesc->pixelformat = index ? V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..cc2092ae9987 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -534,7 +534,6 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
 
 struct uvc_device_info {
 	u32	quirks;
-	u32	meta_format;
 	u16	uvc_version;
 };
 

---
base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
change-id: 20250226-uvc-metadata-2e7e445966de

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


