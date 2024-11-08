Return-Path: <linux-media+bounces-21202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7509C268B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 21:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F24FDB23C8D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 20:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB91E2123F8;
	Fri,  8 Nov 2024 20:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oVPGNSog"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3820DD55
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097561; cv=none; b=VMsCtXk8HvRTTNFkOZMl3xFhRWY00+Y2/QrseMCF+C7zoellLcmS4UxhU1a646bXsV0+c2asCoMPEbZ1tf+Tneult9LNQ3zttHnL9SKtP0PFdoC/QbDp5YlXCuh6fx4Ic0bTs1Yw89l6iQIswibA9NsatZa2G1WDhtzu2yZfdDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097561; c=relaxed/simple;
	bh=bv2xpeEQjNLAp21efZpYAjV5xpc0pddIbvZdh95eckE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgwzkuH3lBAVVWkS+tUGzVYkejKoYixDToClulU0kk36t5YbHjNDNUbeb2XxGljucRQFsqWQuCVKf/NGFivBbaLpa6LgdifZHUBytziF070PtEIR5oUVCc3YiATEPHAQI4N+DP/RRLP5O9OjmYTJCqN5gN37/QbJKi8TkI8X7r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oVPGNSog; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4608e389407so28944241cf.2
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 12:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731097558; x=1731702358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJt80kpod+xHyChc26qzkMobFWguRBFXjCM77byxZYI=;
        b=oVPGNSogt+aeMWcfkYPTch2xVS/2TbxkLifs0VZMf8VbDpyKZkUFoQDj1bhuilA3E6
         OfQLuqpJJlRI41c9i062iF/1pQCj9AwSIyQbnKqcz05GGc1TPsLxL3TLZmYkXuCdTJYl
         X4V7X9gQyfLwWvK9lKro4qkTm7avtI4JHoKOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097558; x=1731702358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJt80kpod+xHyChc26qzkMobFWguRBFXjCM77byxZYI=;
        b=MpFdwGySt38VyGCi9yO14WPNtIwyP6Qk4iC8n5bjU9INDrNx9FX5FnUJGWQcEEq4zj
         SL0b2b+icAEV3UxTXWP7DFcFFPIx6iovgdXIdPLKCukyCH0e3aRX8F0CoI6rqfyH+InY
         7YBNCpq/0MFshFFybO3Yy7YyVZcW/k04lgC9pZw8LY+gInVtMmJoKiRJQZE+DvFut2Aw
         dV4Hb/nbUAjRgTIiC5fV3dVD+AHrHkoLA1psRvBuNsn6/vWF2Gcy6r0y2C0cVcrzunCa
         rW2LtLQwZkD/kwiUmvNuI5XfKhoWZr77j+9OgXdL7MVmrtd+2c1Ajn1w5GD1k+FyHxTl
         RfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzLLLQKdbscfsq8hEyKxvZd0rgkAYtSfAORsbkSev35dp291Ny3KLuPB1XVUUxOUCpAssCtbNbT8U0Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZqnTdA7ohXwMyn25ri2CVsNGGjHk7eEZa3PzYdqwke/DcIM6P
	y3pw0ZvX3jnHEbDri/xiAnjSmNxiGkVLoVn7cC3kcYqj1ekQNoHSGz96NPV2zA==
X-Google-Smtp-Source: AGHT+IFrMsD49sco7THtDJddO2E5ypfxEJBg2QPMDiX35nTCJWi7xmGAeIZoTnyGQHomtHpXL0UJYw==
X-Received: by 2002:a05:622a:2a0d:b0:458:3a34:b7b5 with SMTP id d75a77b69052e-46309370c73mr50476121cf.26.1731097558066;
        Fri, 08 Nov 2024 12:25:58 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff46d440sm24207341cf.52.2024.11.08.12.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:25:57 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 08 Nov 2024 20:25:50 +0000
Subject: [PATCH v2 6/6] media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO
 entity
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-uvc-subdev-v2-6-85d8a051a3d3@chromium.org>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
In-Reply-To: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Right now we are setting the entity type to unknown for the privacy GPIO
entity. Which results in the following error in dmesg.
uvcvideo 3-6:1.0: Entity type for entity GPIO was not initialized!

Use the newly created type to fix this.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_entity.c |  4 +++-
 drivers/media/usb/uvc/uvc_gpio.c   | 46 ++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  |  4 ++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 4 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index dad77b96fe16..3cb95df1f670 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -114,6 +114,9 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_ITT_CAMERA:
 			function = MEDIA_ENT_F_CAM_SENSOR;
 			break;
+		case UVC_EXT_GPIO_UNIT:
+			function = MEDIA_ENT_F_GPIO;
+			break;
 		case UVC_TT_VENDOR_SPECIFIC:
 		case UVC_ITT_VENDOR_SPECIFIC:
 		case UVC_ITT_MEDIA_TRANSPORT_INPUT:
@@ -121,7 +124,6 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_OTT_DISPLAY:
 		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		case UVC_EXTERNAL_VENDOR_SPECIFIC:
-		case UVC_EXT_GPIO_UNIT:
 		default:
 			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
 			break;
diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
index af72df96bc57..b19ca222c9f2 100644
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
 		container_of(ctrl->handler, struct uvc_gpio, hdl);
 	int ret;
 
+	if (!gpio->gpio_ready)
+		return -EBUSY;
+
 	ret = gpiod_get_value_cansleep(gpio->gpio_privacy);
 	if (ret < 0)
 		return ret;
@@ -34,6 +38,9 @@ static irqreturn_t uvc_gpio_irq(int irq, void *data)
 	struct uvc_gpio *uvc_gpio = data;
 	int new_val;
 
+	if (!uvc_gpio->gpio_ready)
+		return IRQ_HANDLED;
+
 	new_val = gpiod_get_value_cansleep(uvc_gpio->gpio_privacy);
 	if (new_val < 0)
 		return IRQ_HANDLED;
@@ -43,6 +50,24 @@ static irqreturn_t uvc_gpio_irq(int irq, void *data)
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
@@ -64,6 +89,15 @@ int uvc_gpio_parse(struct uvc_device *dev)
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
@@ -74,6 +108,16 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	return 0;
 }
 
+void uvc_gpio_quirk(struct uvc_device *dev, bool stream_on)
+{
+	if (!dev->gpio_unit || !(dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM))
+		return;
+
+	dev->gpio_unit->gpio.gpio_ready = stream_on;
+	if (stream_on)
+		uvc_gpio_irq(0, &dev->gpio_unit->gpio);
+}
+
 int uvc_gpio_init(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
@@ -97,6 +141,8 @@ int uvc_gpio_init(struct uvc_device *dev)
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
index 1eeef2c12fbe..b03152c9651b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -77,6 +77,7 @@
 #define UVC_QUIRK_NO_RESET_RESUME	0x00004000
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
+#define UVC_QUIRK_PRIVACY_DURING_STREAM	0x00020000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -175,6 +176,7 @@ struct uvc_control {
 struct uvc_gpio {
 	int irq;
 	bool initialized;
+	bool gpio_ready;
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_ctrl *privacy_ctrl;
 	struct gpio_desc *gpio_privacy;
@@ -823,5 +825,6 @@ int uvc_gpio_parse(struct uvc_device *dev);
 int uvc_gpio_init(struct uvc_device *dev);
 void uvc_gpio_deinit(struct uvc_device *dev);
 void uvc_gpio_cleanup(struct uvc_device *dev);
+void uvc_gpio_quirk(struct uvc_device *dev, bool stream_on);
 
 #endif

-- 
2.47.0.277.g8800431eea-goog


