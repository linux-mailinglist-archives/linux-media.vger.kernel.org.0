Return-Path: <linux-media+bounces-21197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 174219C2679
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 21:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86001B224AE
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 20:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34311F26E7;
	Fri,  8 Nov 2024 20:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CcN+KPEh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C615D1C1F1E
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097555; cv=none; b=BSJGR4+s3Zw10IIpXdkGSHu7TLSKmbQOJn6inOhpbRM2Vj2rZ/TqSXksd1yd38lajZpQ4iGOLVrOLL5TAh2kXJFeilgbS4xpMbuXntkabxFZm5lZFSumfvIfoZ7hDbNR5L3A7vr/kzUsPE/YYo7ILGc17Qk4H7LVNxZLm9x706M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097555; c=relaxed/simple;
	bh=yPKYz/hddeimT0WKUPAUKGdG+sPhSfCtkdHHyL8Jc9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhlzd9DkuJdeY7IPl26QKk6o62ATl8298RFhEjJ2QQP9dlHIpjDkyHbu3v3RzirAA3QILmDUsT/cGzUg0GdQH8hyc9LdGDkhoL+5WvQ1Y5pdCxaqW1cSaQKEMCT8/6eYhiweSbqIuBpMXqGC6yUpnAM63TroNvMEI/Xy0CSpgBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CcN+KPEh; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebc0dbc566so1280389eaf.3
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 12:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731097552; x=1731702352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4Vaj5JzGb6k86tSoIS6h1LsetC5KChYUtTpZZAf/u8=;
        b=CcN+KPEhn2pBDE2dQSSGjmJXRWKL9C7cQlW6HuI6s119tkxC9SJhYt9vDNWFPKayrR
         O/W5UVL7KBQuqWy5cMV5OnUD8jFm2FBjAgJZQTId1ZM33v5SBtPAwoTRYmGjOrZy0ext
         zPBxrOzd0sWQ+PGLNwuUlBLhz3GuQgZl6jug0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097552; x=1731702352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4Vaj5JzGb6k86tSoIS6h1LsetC5KChYUtTpZZAf/u8=;
        b=vVwW7GqCu/gyG51hKC/t6BSy4tsB1Lrf7VaCOun1gNlU1FHOczGTUlKVdBMsCQBCzv
         YLl3QozxWwM9XKvVnYDWJ55twan65oVcePN9dfWWzxJGGTMa10p0eC+FVaPylwAg+Lrr
         vqaXVFrDyOX6ny218eVUVZi11R69Izs3xyqgfHkD35vH93IxMmyMSnnM2vz4LjjpDbKC
         WJ8eUgOUkkyntbFFOF42hKtqm9w2bd70UfGGHFwUjPy37xL7/1X6dJy6Lre9uUUjI3Uw
         B6NIGTAWyqQaXNb7zeSokqQGudG/LLr7EyPTfSp/TuOXQfkf5w7KC96Z+YUVuzhPmqIg
         wbzw==
X-Forwarded-Encrypted: i=1; AJvYcCXKBq73Y97Eu63c9cguIQSBlOz+460xSrIrngrHiAg1kEiNvQaEAuvTcMt3MjNwsHgQVWhLzvDavqae8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrQWJLxXlW6LOKJ/xHSXA59Nz/tyfXHJZv6DrkKtVVHupSHPdQ
	CPHboRhg3IU+amFP0TwlL52uKPlQjalnRjXRBVGu++HXotBbl+Za3TNjWdQmew==
X-Google-Smtp-Source: AGHT+IEfFBPTdYt/LYc9fDKOshvJgoHOK95eB0z49jQWlrewsUhiqGrH2ZMzs1sQXG7vQ+NPMO93YA==
X-Received: by 2002:a05:6358:5d84:b0:1bc:d0a4:3d3a with SMTP id e5c5f4694b2df-1c641ec23bcmr362536455d.12.1731097551888;
        Fri, 08 Nov 2024 12:25:51 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff46d440sm24207341cf.52.2024.11.08.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:25:51 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 08 Nov 2024 20:25:46 +0000
Subject: [PATCH v2 2/6] media: uvcvideo: Re-implement privacy GPIO as a
 separate subdevice
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-uvc-subdev-v2-2-85d8a051a3d3@chromium.org>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
In-Reply-To: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@chromium.org>

Reimplement privacy GPIO as a v4l2 subdev with a volatile privacy control.
A v4l2 control event is sent in irq when privacy control value changes.

The behavior matches the original implementation, except that the
control is of a separate subdevice.

V4L2 control kAPI is used for simplicity.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   |  20 -------
 drivers/media/usb/uvc/uvc_driver.c |   4 +-
 drivers/media/usb/uvc/uvc_entity.c |   6 ++
 drivers/media/usb/uvc/uvc_gpio.c   | 111 ++++++++++++++++++++++---------------
 drivers/media/usb/uvc/uvcvideo.h   |  20 ++++---
 5 files changed, 88 insertions(+), 73 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..b98f4778d8aa 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -350,14 +350,6 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_RESTORE
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
-	{
-		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
-		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.index		= 0,
-		.size		= 1,
-		.flags		= UVC_CTRL_FLAG_GET_CUR
-				| UVC_CTRL_FLAG_AUTO_UPDATE,
-	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -827,15 +819,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
-	{
-		.id		= V4L2_CID_PRIVACY,
-		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
-		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.size		= 1,
-		.offset		= 0,
-		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
-		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
-	},
 	{
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
@@ -2718,9 +2701,6 @@ static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
 		} else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
 			bmControls = entity->camera.bmControls;
 			bControlSize = entity->camera.bControlSize;
-		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
-			bmControls = entity->gpio.bmControls;
-			bControlSize = entity->gpio.bControlSize;
 		}
 
 		/* Remove bogus/blacklisted controls */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 5b48768a4f7f..fe5a53fd0e14 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1779,6 +1779,7 @@ static void uvc_delete(struct kref *kref)
 	struct uvc_device *dev = container_of(kref, struct uvc_device, ref);
 	struct list_head *p, *n;
 
+	uvc_gpio_cleanup(dev);
 	uvc_status_cleanup(dev);
 	uvc_ctrl_cleanup_device(dev);
 
@@ -2171,6 +2172,7 @@ static int uvc_probe(struct usb_interface *intf,
 	if (media_device_register(&dev->mdev) < 0)
 		goto error;
 #endif
+
 	/* Save our data pointer in the interface data. */
 	usb_set_intfdata(intf, dev);
 
@@ -2182,7 +2184,7 @@ static int uvc_probe(struct usb_interface *intf,
 			 ret);
 	}
 
-	ret = uvc_gpio_init_irq(dev);
+	ret = uvc_gpio_init(dev);
 	if (ret < 0) {
 		dev_err(&dev->udev->dev,
 			"Unable to request privacy GPIO IRQ (%d)\n", ret);
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index cc68dd24eb42..c1b69f9eaa56 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -56,7 +56,13 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static const struct v4l2_subdev_core_ops uvc_subdev_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops uvc_subdev_ops = {
+	.core = &uvc_subdev_core_ops,
 };
 
 void uvc_mc_cleanup_entity(struct uvc_entity *entity)
diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
index 453739acbe8f..af72df96bc57 100644
--- a/drivers/media/usb/uvc/uvc_gpio.c
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -7,57 +7,46 @@
 
 #include <linux/kernel.h>
 #include <linux/gpio/consumer.h>
+#include <media/v4l2-ctrls.h>
 #include "uvcvideo.h"
 
-static void uvc_gpio_event(struct uvc_device *dev)
+static int uvc_gpio_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct uvc_entity *unit = dev->gpio_unit;
-	struct uvc_video_chain *chain;
-	u8 new_val;
-
-	if (!unit)
-		return;
-
-	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
-
-	/* GPIO entities are always on the first chain. */
-	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
-	uvc_ctrl_status_event(chain, unit->controls, &new_val);
-}
+	struct uvc_gpio *gpio =
+		container_of(ctrl->handler, struct uvc_gpio, hdl);
+	int ret;
 
-static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
-			    u8 cs, void *data, u16 size)
-{
-	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
-		return -EINVAL;
+	ret = gpiod_get_value_cansleep(gpio->gpio_privacy);
+	if (ret < 0)
+		return ret;
 
-	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
+	ctrl->cur.val = ret;
 
 	return 0;
 }
 
-static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
-			     u8 cs, u8 *caps)
-{
-	if (cs != UVC_CT_PRIVACY_CONTROL)
-		return -EINVAL;
-
-	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
-	return 0;
-}
+static const struct v4l2_ctrl_ops uvc_gpio_ctrl_ops = {
+	.g_volatile_ctrl = uvc_gpio_g_volatile_ctrl,
+};
 
 static irqreturn_t uvc_gpio_irq(int irq, void *data)
 {
-	struct uvc_device *dev = data;
+	struct uvc_gpio *uvc_gpio = data;
+	int new_val;
+
+	new_val = gpiod_get_value_cansleep(uvc_gpio->gpio_privacy);
+	if (new_val < 0)
+		return IRQ_HANDLED;
+
+	v4l2_ctrl_s_ctrl(uvc_gpio->privacy_ctrl, new_val);
 
-	uvc_gpio_event(dev);
 	return IRQ_HANDLED;
 }
 
 int uvc_gpio_parse(struct uvc_device *dev)
 {
-	struct uvc_entity *unit;
 	struct gpio_desc *gpio_privacy;
+	struct uvc_entity *unit;
 	int irq;
 
 	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
@@ -67,23 +56,17 @@ int uvc_gpio_parse(struct uvc_device *dev)
 
 	irq = gpiod_to_irq(gpio_privacy);
 	if (irq < 0)
-		return dev_err_probe(&dev->udev->dev, irq,
+		return dev_err_probe(&dev->intf->dev, irq,
 				     "No IRQ for privacy GPIO\n");
 
 	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
-				    UVC_EXT_GPIO_UNIT_ID, 0, 1);
+				    UVC_EXT_GPIO_UNIT_ID, 0, 0);
 	if (IS_ERR(unit))
 		return PTR_ERR(unit);
 
 	unit->gpio.gpio_privacy = gpio_privacy;
 	unit->gpio.irq = irq;
-	unit->gpio.bControlSize = 1;
-	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
-	unit->gpio.bmControls[0] = 1;
-	unit->get_cur = uvc_gpio_get_cur;
-	unit->get_info = uvc_gpio_get_info;
 	strscpy(unit->name, "GPIO", sizeof(unit->name));
-
 	list_add_tail(&unit->list, &dev->entities);
 
 	dev->gpio_unit = unit;
@@ -91,21 +74,53 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	return 0;
 }
 
-int uvc_gpio_init_irq(struct uvc_device *dev)
+int uvc_gpio_init(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
+	int init_val;
 	int ret;
 
 	if (!unit || unit->gpio.irq < 0)
 		return 0;
 
+	init_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+	if (init_val < 0)
+		return init_val;
+
+	v4l2_ctrl_handler_init(&unit->gpio.hdl, 1);
+	unit->gpio.privacy_ctrl = v4l2_ctrl_new_std(&unit->gpio.hdl,
+						    &uvc_gpio_ctrl_ops,
+						    V4L2_CID_PRIVACY,
+						    0, 1, 1, init_val);
+	if (!unit->gpio.privacy_ctrl) {
+		ret = unit->gpio.hdl.error;
+		goto cleanup;
+	}
+
+	unit->gpio.privacy_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE |
+					  V4L2_CTRL_FLAG_READ_ONLY;
+
+	unit->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			      V4L2_SUBDEV_FL_HAS_EVENTS;
+	unit->subdev.ctrl_handler = &unit->gpio.hdl;
+
+	ret = v4l2_device_register_subdev_nodes(&dev->vdev);
+	if (ret)
+		goto cleanup;
+
 	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
 				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
 				   IRQF_TRIGGER_RISING,
-				   "uvc_privacy_gpio", dev);
+				   "uvc_privacy_gpio", &unit->gpio);
+	if (ret)
+		goto cleanup;
 
-	unit->gpio.initialized = !ret;
+	unit->gpio.initialized = true;
 
+	return 0;
+
+cleanup:
+	v4l2_ctrl_handler_free(&unit->gpio.hdl);
 	return ret;
 }
 
@@ -114,5 +129,13 @@ void uvc_gpio_deinit(struct uvc_device *dev)
 	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
 		return;
 
-	free_irq(dev->gpio_unit->gpio.irq, dev);
+	free_irq(dev->gpio_unit->gpio.irq, &dev->gpio_unit->gpio);
+}
+
+void uvc_gpio_cleanup(struct uvc_device *dev)
+{
+	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
+		return;
+
+	v4l2_ctrl_handler_free(&dev->gpio_unit->gpio.hdl);
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 91ed59b54d9a..4a06db329aa9 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -15,6 +15,7 @@
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/media-device.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
@@ -171,6 +172,14 @@ struct uvc_control {
 
 #define UVC_ENTITY_FLAG_DEFAULT		(1 << 0)
 
+struct uvc_gpio {
+	int irq;
+	bool initialized;
+	struct v4l2_ctrl_handler hdl;
+	struct v4l2_ctrl *privacy_ctrl;
+	struct gpio_desc *gpio_privacy;
+};
+
 struct uvc_entity {
 	struct list_head list;		/* Entity as part of a UVC device. */
 	struct list_head chain;		/* Entity as part of a video device chain. */
@@ -229,13 +238,7 @@ struct uvc_entity {
 			u8  *bmControlsType;
 		} extension;
 
-		struct {
-			u8  bControlSize;
-			u8  *bmControls;
-			struct gpio_desc *gpio_privacy;
-			int irq;
-			bool initialized;
-		} gpio;
+		struct uvc_gpio gpio;
 	};
 
 	u8 bNrInPins;
@@ -822,7 +825,8 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 
 /* gpio */
 int uvc_gpio_parse(struct uvc_device *dev);
-int uvc_gpio_init_irq(struct uvc_device *dev);
+int uvc_gpio_init(struct uvc_device *dev);
 void uvc_gpio_deinit(struct uvc_device *dev);
+void uvc_gpio_cleanup(struct uvc_device *dev);
 
 #endif

-- 
2.47.0.277.g8800431eea-goog


