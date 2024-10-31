Return-Path: <linux-media+bounces-20651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1ED9B7C02
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB21280ABC
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D41319F127;
	Thu, 31 Oct 2024 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k4cRaQxm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F019F105
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382210; cv=none; b=IcwgoRc1HRA8e6G8oMTmlZVQL4Mjchyx7vDtjNdg/bLCBGIJO6BTboLoCdPagQvn4ixgbBKPXIqz31qRv6D8KTVSbwpJbOKJnsnzZKSJ9GsyThL7CJfFB1Eg0wIB7YJc6P/RPwpyxcdKxk5klS/0FjyPa9f8UN7YRmBwYKQdNP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382210; c=relaxed/simple;
	bh=XAuQri7r83r7UrrPiZpMw36VK0lmC8P7Lm6jAuq7hQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNvWogtuJHXm6a/AomXyP85AdHfAHCn2ySdKeaUbzbOhhjQe3u7vuAfJ5X30Vo+XswQMzBxamd86ZdKx9HhArGtA4RgoosTvGny8wECJBGq423lzHDj5gAv9hGIlEcTOdZlEK2vCOtSaWYBdSlwyZVwG3FRHgjW8sSF9o/QZJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k4cRaQxm; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b14077ec5aso186237185a.1
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730382206; x=1730987006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdfYX4pDnMcuiGGGMc2I3sYePXU0/ipv/UNJ6CbzEgg=;
        b=k4cRaQxmvi/ZmxaVNGduwSHBPClLr91T6DsldnxXYcTfh9BCQpcIEx2GCgaXI/sAg/
         YCw/ovUSLm5vhxMUUWjahJVkaDKPeRdXW6Lxz/2kr4BNtYRrBk51apqKDFJ1HVrTsQ9i
         LJdGC5Pbkg18ySyp41yAZSwNsKmNCRHDyViUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382206; x=1730987006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdfYX4pDnMcuiGGGMc2I3sYePXU0/ipv/UNJ6CbzEgg=;
        b=FT2zBBdZH0KSRyv/q+3K92XFF9XY+Jey5DmYBAUD4RvzJtZekD8rGIj1RyFieZD8Tp
         TxSJYz/T9VJ0uf7ZgXgDFvTc2Ig1T9URLgKuDDxL2y60HdVq4nuFTlHrwZpdCLX3AJq7
         d/atIcUIwwUEW2wBmrQg5aADQP2XHmdinPNtyPkUbJQvL/i4CLyJD4P/ad9sP2xSMtMR
         MjJMYHj+Z7vNSCps78sm6U3ORbTaNFLi4w4611TNbyFiluB1xGBZD22oV5+/96SJRPbM
         l2tVAk+iJVpX3iMm0s+OUzgJzDKKpcAd+OouayBJijKM1BVsn+AHjckPtyzQ+XcG9T1a
         6QXA==
X-Forwarded-Encrypted: i=1; AJvYcCUA1kJhh848C/JbzOJvobMBHweJrr3qOGkTBir3+SwHY8wIi11y+v1vcNWNcjYqnqCOgkw8AvaoDU3Yrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPp5jZvc5jLd9yO2w0AZ3Y3GUfvMOIPB0ckXYMorw7fLikjp4R
	lrN3uWvMPmlEFPqqHuO4JbvQVyfDlyJl2ttu0AKk3KHi/v13SwvZPrxnUUzs5g==
X-Google-Smtp-Source: AGHT+IFVLV7yvPMMB7uMkf5gM87MCX9H9id1mCqPzY7DKuqs39zQEJrBzuTMVcPV3lfquCXZJIgu3g==
X-Received: by 2002:a05:6214:1308:b0:6cb:c845:ed0f with SMTP id 6a1803df08f44-6d35b9529afmr402756d6.17.1730382206036;
        Thu, 31 Oct 2024 06:43:26 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d354177d2fsm7837776d6.107.2024.10.31.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:43:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 31 Oct 2024 13:43:20 +0000
Subject: [PATCH 7/7] media: uvcvideo: Introduce
 UVC_QUIRK_PRIVACY_DURING_STREAM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-uvc-subdev-v1-7-a68331cedd72@chromium.org>
References: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
In-Reply-To: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Some devices power the GPIO pull-up with the same power-supply as the
camera. Avoid reading the GPIO if the device is not streaming.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_gpio.c  | 47 +++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c |  4 ++++
 drivers/media/usb/uvc/uvcvideo.h  |  7 ++++--
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
index e02d46ef9566..b49a7fbd5adf 100644
--- a/drivers/media/usb/uvc/uvc_gpio.c
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -5,6 +5,7 @@
  *      Copyright 2024 Google LLC
  */
 
+#include <linux/dmi.h>
 #include <linux/kernel.h>
 #include <linux/gpio/consumer.h>
 #include <media/v4l2-ctrls.h>
@@ -16,6 +17,9 @@ static int uvc_gpio_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	struct uvc_gpio *gpio =
 		container_of(ctrl->handler, struct uvc_gpio, hdl);
 
+	if (!gpio->gpio_ready)
+		return -EBUSY;
+
 	ret = gpiod_get_value_cansleep(gpio->gpio_privacy);
 	if (ret < 0)
 		return ret;
@@ -43,6 +47,24 @@ static irqreturn_t uvc_gpio_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct dmi_system_id privacy_valid_during_streamon[] = {
+	{
+		.ident = "HP Elite c1030 Chromebook",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Jinlon"),
+		},
+	},
+	{
+		.ident = "HP Pro c640 Chromebook",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dratini"),
+		},
+	},
+	{ } /* terminate list */
+};
+
 int uvc_gpio_parse(struct uvc_device *dev)
 {
 	struct gpio_desc *gpio_privacy;
@@ -64,6 +86,15 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	if (IS_ERR(unit))
 		return PTR_ERR(unit);
 
+	/*
+	 * Note: This quirk will not match external UVC cameras,
+	 * as they will not have the corresponding ACPI GPIO entity.
+	 */
+	if (dmi_check_system(privacy_valid_during_streamon))
+		dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
+	else
+		unit->gpio.gpio_ready = true;
+
 	unit->gpio.gpio_privacy = gpio_privacy;
 	unit->gpio.irq = irq;
 	strscpy(unit->name, "GPIO", sizeof(unit->name));
@@ -74,6 +105,20 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	return 0;
 }
 
+void uvc_gpio_quirk(struct uvc_device *dev, bool stream_on)
+{
+	if (!dev->gpio_unit || !(dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM))
+		return;
+
+	dev->gpio_unit->gpio.gpio_ready = stream_on;
+	if (stream_on) {
+		enable_irq(dev->gpio_unit->gpio.irq);
+		uvc_gpio_irq(0, &dev->gpio_unit->gpio);
+	} else {
+		disable_irq(dev->gpio_unit->gpio.irq);
+	}
+}
+
 int uvc_gpio_init(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
@@ -97,6 +142,8 @@ int uvc_gpio_init(struct uvc_device *dev)
 		goto cleanup;
 	}
 
+	uvc_gpio_quirk(dev, false);
+
 	unit->gpio.privacy_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE |
 					  V4L2_CTRL_FLAG_READ_ONLY;
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index cd9c29532fb0..0d542176ccde 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -2296,6 +2296,8 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 	if (ret < 0)
 		goto error_video;
 
+	uvc_gpio_quirk(stream->dev, true);
+
 	return 0;
 
 error_video:
@@ -2308,6 +2310,8 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 
 void uvc_video_stop_streaming(struct uvc_streaming *stream)
 {
+	uvc_gpio_quirk(stream->dev, false);
+
 	uvc_video_stop_transfer(stream, 1);
 
 	if (stream->intf->num_altsetting > 1) {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 37991d35088c..f154cb2932a0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -77,6 +77,7 @@
 #define UVC_QUIRK_NO_RESET_RESUME	0x00004000
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
+#define UVC_QUIRK_PRIVACY_DURING_STREAM	0x00020000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -173,10 +174,11 @@ struct uvc_control {
 #define UVC_ENTITY_FLAG_DEFAULT		(1 << 0)
 
 struct uvc_gpio {
-	struct gpio_desc *gpio_privacy;
+	bool gpio_ready;
 	int irq;
-	struct v4l2_ctrl_handler hdl;
 	struct v4l2_ctrl *privacy_ctrl;
+	struct v4l2_ctrl_handler hdl;
+	struct gpio_desc *gpio_privacy;
 };
 
 struct uvc_entity {
@@ -821,5 +823,6 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 int uvc_gpio_init(struct uvc_device *dev);
 int uvc_gpio_parse(struct uvc_device *dev);
 void uvc_gpio_cleanup(struct uvc_entity *entity);
+void uvc_gpio_quirk(struct uvc_device *dev, bool stream_on);
 
 #endif

-- 
2.47.0.163.g1226f6d8fa-goog


