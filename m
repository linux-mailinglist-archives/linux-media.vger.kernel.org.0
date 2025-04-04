Return-Path: <linux-media+bounces-29372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D81A7B7DF
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 08:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5712117845C
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 06:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDC5199FB0;
	Fri,  4 Apr 2025 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ivw09rEs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A82191F95
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748667; cv=none; b=CH5lu0+fU9soQWOYd5PzfIvSmjL3N1dpLJpLKexMzJO1Mq2B3D220jTcJEEaWfYr8/mdayHEYtNdz0zslgoF3OXOuCzRCX6Q42GR1qO9QAKZ2QmZaR9GL5YJQSqI8W3+H/bIsAI3mD9GxtJI6Qx0QwUeX3qeRepVyUgnsDCS5eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748667; c=relaxed/simple;
	bh=+KkdZxdqvHIlFaUxnw0T/2vUmNZjxcvggpVmgCAVYT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLBGPynJ85fPRY4ehtk4YOjFoBW8EMjAS4NgSrg7JOiVpmTEhz5Wpfq1jmovfqsJq8favCBMvcOXenphQbCbT/mFebyrLUbvJJNv9393mww9jgul1dDs5wnrynBqIfqA1w+FbGYXfSpfXec5HWgz7uD8JfuZpj6FcUodZeowxJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ivw09rEs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499bd3084aso1501607e87.0
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748664; x=1744353464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfKei41NeiW8d42lUMUhoCILXY12OhST2R+tJl7Txyg=;
        b=Ivw09rEsNhTPbGfMN+6Geejw3Q802OsZA1khp0IBkRAmpKdoAmk2HFu3eldwrvCX/R
         dCoUrZDs/g/Rz7lIvc8N9w/CxUqgNlmyJCZfNnVBkvRX6fqIZm/OYHQqm/PGtEZwyynF
         0cWFp36qnWUrTFHtBv14OdYQOaak+BKZUA59Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748664; x=1744353464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfKei41NeiW8d42lUMUhoCILXY12OhST2R+tJl7Txyg=;
        b=Z8ZPrOqtqwoFjU2I3fzqrcXs7M0cnSGw85wdIGnLZXt07j+N+gacnzl7yKGV5n7tKd
         G304zovqV7NBZWusuFYTJdRTxC9Bhg3mNniO10Ew7IBeFK7vvqQts3gZpIwC6OWi3UTR
         df9b/DJyhWFFwJ5mxkjKgIE/uTx4oNZ3yYyQRyfNo1M6RCGNBENYNXpLO0/rzsipBNda
         KT/zoA0IflvSZq2ybKH2v6gvd0T9WMqq2l7oANZbwozNlH3NmKhSV/um8EeljXGm5Udh
         GuON5pwNKgCCyZsNS3LAxTdYxeAAP/+NH9tlzAsTjqlEdrFrWk1+cYIya8fFCaC0EhO2
         zj0w==
X-Gm-Message-State: AOJu0YzzImbGIFxL7/++9LE7CuF9SadcbBZ320GUNVII/exUh3Ylx3Nm
	QLDRVoDZjU8X19uMZgxHXZA/pUwdfhB27G9LgzirJHWTsY2kJDetcgImbNT7mMWzXPwvxcb9BQM
	=
X-Gm-Gg: ASbGncuoOrHnqGEBShoaKhesP0wUwfZfBafyJ2zQSlORwofKXHEd5nhAKYrwfdGKG+W
	N/3MuLhkU10gKAxQGQ3CRD4t9htQmzSNoVxCQ07DqXfRDRVVsJFJ1EJSvqUMYKyWmr2UHOQ5SX0
	1LaC7ZaNDw3PtCdiZ1CQ/wgx/ZQoGl3RgzhhFp9tkvWp7w08DKgpynG7cDdvFlDSQUQE6U9ieqU
	QcxpkpyXDtppNIVssWzXnwnMKmXxL5NdFatgo9wKxcSwP1RHGWnYlpccuOeWk2G3ixZVKLs5Qy8
	jjizMKFIH+R4b4b75UxnmPm0FSt4gZc2UisivGDt/OiSdQGHHnUitwKqYRHWvWIufY2vfDYgXN1
	VlPoya3xdUz1zyus1hdiKG6+9tWAWKIZdsGU=
X-Google-Smtp-Source: AGHT+IGiEq5HAfK9gznqpOik3UfipLmtacM6oeNSqlOetaI/lji+MiW2P1IKEgszzXgZO7Lyb2+qvQ==
X-Received: by 2002:a05:6512:3da1:b0:545:2871:7cd5 with SMTP id 2adb3069b0e04-54c22776fc6mr564255e87.15.1743748663628;
        Thu, 03 Apr 2025 23:37:43 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 04 Apr 2025 06:37:37 +0000
Subject: [PATCH v5 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-uvc-meta-v5-4-f79974fc2d20@chromium.org>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If the camera supports the MSXU_CONTROL_METADATA control, auto set the
MSXU_META quirk.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 54 ++++++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h              |  3 ++
 2 files changed, 57 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index fe2678fc795d7fd5a64e8113199012f34c419176..776d280f34afad515594a873acf075acf0438304 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-ioctl.h>
@@ -187,11 +188,64 @@ static const struct v4l2_file_operations uvc_meta_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
+
+#define MSXU_CONTROL_METADATA 0x9
+static int uvc_enable_msxu(struct uvc_device *dev)
+{
+	u32 *data __free(kfree) = NULL;
+	struct uvc_entity *entity;
+
+	list_for_each_entry(entity, &dev->entities, list) {
+		int ret;
+
+		if (memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
+			continue;
+
+		if (!data)
+			data = kmalloc(sizeof(*data), GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+
+		ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (ret)
+			continue;
+
+		if (*data) {
+			dev->quirks |= UVC_QUIRK_MSXU_META;
+			return 0;
+		}
+
+		ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (ret || !*data)
+			continue;
+
+		ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (!ret) {
+			dev->quirks |= UVC_QUIRK_MSXU_META;
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
 int uvc_meta_register(struct uvc_streaming *stream)
 {
 	struct uvc_device *dev = stream->dev;
 	struct video_device *vdev = &stream->meta.vdev;
 	struct uvc_video_queue *queue = &stream->meta.queue;
+	int ret;
+
+	ret = uvc_enable_msxu(dev);
+	if (ret)
+		return ret;
 
 	stream->meta.format = V4L2_META_FMT_UVC;
 
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -29,6 +29,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_MSXU_1_5 \
+	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
+	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
2.49.0.504.g3bcea36a83-goog


