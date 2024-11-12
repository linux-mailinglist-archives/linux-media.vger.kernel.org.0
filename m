Return-Path: <linux-media+bounces-21325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE99C5F0C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 18:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CCFE28480F
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 17:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7682161F3;
	Tue, 12 Nov 2024 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hDcS1nLj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B692E2144CE
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432666; cv=none; b=XgMV/d06nvVxgwcba5+QvaenBeeB7j9qXuqSHOS9AnHiPvqClqGDuJB/3VJgZ87ceThZProIEell0iJirSk5+JkLwp+KYzIGoMIndCbF0XEoPwr9nXNK/6NzsU3NOLSq3DUxMCMZ7rGXxeSbWVRbPc8B/iQteCw5JhgjtNi8bWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432666; c=relaxed/simple;
	bh=ARE05qnYrbG1PaurfMt4sWTURGohFvkDjj+xaPdokqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tlBTJasY/sGQQi4cJ1a8SxYmXq2Q+aHSoVdxJj5TwXKu4LtubVCRtBQUJZ8eRDcfUz85x/5Jd/O1xLJXe18MhWPPW08eRaV3GOUgPuxM1yGZj+8wEXsT+GB7iZkZcKhCbswaqAugVdo/WpWoLbPxIgUlWgGB1NkKP1l8yh84RtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hDcS1nLj; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b15416303aso425399485a.1
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731432664; x=1732037464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vaVDRM1V2OFL5Lfp0Tp3fV8e2l0lPm3Um6LzAvGga4=;
        b=hDcS1nLjvJL051sV9jI6NIwcChetZa+6iPVRhLK3y9FWSZBAoFk3CcjfwMiVIFmADL
         N6rGVuX3/1GH+GMuLsjWnZ1Iax+LgdM+Kb/m/rxTLUI/PxdEhaac9tnI0pTy5474H7J7
         8BOjCodnjkPWU+GWrvPjKUHiArbVlF2tVSeno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731432664; x=1732037464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vaVDRM1V2OFL5Lfp0Tp3fV8e2l0lPm3Um6LzAvGga4=;
        b=PwsJSX48cpsGrfaKc0jWoLwaSQA2Bo3s88iRyIZ1Z0xq6+0vkHEOaoKkbmGZT5yFFa
         BnHtRgpQYFoJ8KzP2gAupFl6Iu0f/3VkE5v/1DTQ8dA6cuRCxjgtfe8i1XWByRZPU6Sa
         NlG46HLS7dg/pXB2AMbFh2okuJK72cU+uXymMqtI4mm5/P5kopfKo5OPV/c+Wyn4whz9
         3dh6wkUT06XegptKdkNAYPZwxXbzF3+Ks5qtkNIoTWXbljBMhqWlISDylcHsCaViV9Ik
         pdXAyJMcw0Zcx2gxLZhkZyi76GxNiAA9F3HKuypAsXQSKSYLeyY2/fCr7LVIe41MK/cw
         FoOA==
X-Forwarded-Encrypted: i=1; AJvYcCUiC7r+XSlyx4fPHR91kFA4Ca20xlTEHwx1UcLZTwDeZXiPXfIvewWycYvD/NStIXibqsH/MF0yZnqBmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkidK7NGIv9r0XlCnafWC7+HySPukOmr5NiQkLDVk6HBPZxqh
	JBcQW4DCJGfH4J9fvhrPF9jgRWMnukACg5oKeL4s740HZdLmD6zBxrZ+xUUh1A==
X-Google-Smtp-Source: AGHT+IGUTjDChRDa1wzOvaVmFTddH5hipHL9tXZqCooGO5Ga3pReVfa85TjuhqS2jvbpEsS9IJI3eg==
X-Received: by 2002:a05:620a:1a25:b0:7ab:3ec9:f4c7 with SMTP id af79cd13be357-7b331eafd8fmr2426728285a.35.1731432663499;
        Tue, 12 Nov 2024 09:31:03 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac2dcebsm608292285a.7.2024.11.12.09.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:31:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 Nov 2024 17:30:46 +0000
Subject: [PATCH v3 3/8] media: uvcvideo: Re-implement privacy GPIO as an
 input device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-uvc-subdev-v3-3-0ea573d41a18@chromium.org>
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
In-Reply-To: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Reimplement privacy GPIO as an input device.

This is an attempt to unify how we notify userspace about a camera that
is covered.

Replace the previous V4L2_CID_PRIVACY control with evdev
SW_CAMERA_LENS_COVER.

This has some main benefits:
- It unifies behaviour with other drivers.
- It allows reading the privacy events without powering up the camera.
- It allows reading the privacy gpio and the internal gpio control (if
  present).

Although this introduces an ABI change, we have only seen ChromeOS using
this feature.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Kconfig      |  2 +-
 drivers/media/usb/uvc/Makefile     |  6 ++-
 drivers/media/usb/uvc/uvc_ctrl.c   | 20 ----------
 drivers/media/usb/uvc/uvc_driver.c |  3 +-
 drivers/media/usb/uvc/uvc_entity.c |  6 +++
 drivers/media/usb/uvc/uvc_gpio.c   | 76 +++++++++++++-------------------------
 drivers/media/usb/uvc/uvc_status.c | 13 +++++--
 drivers/media/usb/uvc/uvcvideo.h   | 15 +++++---
 8 files changed, 59 insertions(+), 82 deletions(-)

diff --git a/drivers/media/usb/uvc/Kconfig b/drivers/media/usb/uvc/Kconfig
index 579532272fd6..cdbba7fd5bee 100644
--- a/drivers/media/usb/uvc/Kconfig
+++ b/drivers/media/usb/uvc/Kconfig
@@ -17,6 +17,6 @@ config USB_VIDEO_CLASS_INPUT_EVDEV
 	depends on USB_VIDEO_CLASS=INPUT || INPUT=y
 	help
 	  This option makes USB Video Class devices register an input device
-	  to report button events.
+	  to report button events and privacy GPIO.
 
 	  If you are in doubt, say Y.
diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
index 85514b6e538f..b36b124da7a8 100644
--- a/drivers/media/usb/uvc/Makefile
+++ b/drivers/media/usb/uvc/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
-		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
-		  uvc_gpio.o
+		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
 uvcvideo-objs  += uvc_entity.o
 endif
+ifeq ($(CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV),y)
+uvcvideo-objs  += uvc_gpio.o
+endif
 obj-$(CONFIG_USB_VIDEO_CLASS) += uvcvideo.o
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
index 5b48768a4f7f..d6c12be49b5c 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2171,6 +2171,7 @@ static int uvc_probe(struct usb_interface *intf,
 	if (media_device_register(&dev->mdev) < 0)
 		goto error;
 #endif
+
 	/* Save our data pointer in the interface data. */
 	usb_set_intfdata(intf, dev);
 
@@ -2182,7 +2183,7 @@ static int uvc_probe(struct usb_interface *intf,
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
index 453739acbe8f..80096022ad08 100644
--- a/drivers/media/usb/uvc/uvc_gpio.c
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -7,57 +7,29 @@
 
 #include <linux/kernel.h>
 #include <linux/gpio/consumer.h>
+#include <linux/input.h>
 #include "uvcvideo.h"
 
-static void uvc_gpio_event(struct uvc_device *dev)
-{
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
-
-static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
-			    u8 cs, void *data, u16 size)
-{
-	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
-		return -EINVAL;
-
-	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
-
-	return 0;
-}
-
-static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
-			     u8 cs, u8 *caps)
-{
-	if (cs != UVC_CT_PRIVACY_CONTROL)
-		return -EINVAL;
-
-	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
-	return 0;
-}
-
 static irqreturn_t uvc_gpio_irq(int irq, void *data)
 {
 	struct uvc_device *dev = data;
+	struct uvc_gpio *uvc_gpio = &dev->gpio_unit->gpio;
+	int new_val;
+
+	new_val = gpiod_get_value_cansleep(uvc_gpio->gpio_privacy);
+	if (new_val < 0)
+		return IRQ_HANDLED;
+
+	input_report_switch(dev->input, SW_CAMERA_LENS_COVER, new_val);
+	input_sync(dev->input);
 
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
@@ -67,23 +39,17 @@ int uvc_gpio_parse(struct uvc_device *dev)
 
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
@@ -91,22 +57,32 @@ int uvc_gpio_parse(struct uvc_device *dev)
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
 	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
 				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
 				   IRQF_TRIGGER_RISING,
 				   "uvc_privacy_gpio", dev);
+	if (ret)
+		return ret;
+
+	input_report_switch(dev->input, SW_CAMERA_LENS_COVER, init_val);
+	input_sync(dev->input);
 
-	unit->gpio.initialized = !ret;
+	unit->gpio.initialized = true;
 
-	return ret;
+	return 0;
 }
 
 void uvc_gpio_deinit(struct uvc_device *dev)
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 06c867510c8f..319f472213f6 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -44,7 +44,7 @@ static int uvc_input_init(struct uvc_device *dev)
 	struct input_dev *input;
 	int ret;
 
-	if (!uvc_input_has_button(dev))
+	if (!uvc_input_has_button(dev) && !dev->gpio_unit)
 		return 0;
 
 	input = input_allocate_device();
@@ -59,8 +59,15 @@ static int uvc_input_init(struct uvc_device *dev)
 	usb_to_input_id(dev->udev, &input->id);
 	input->dev.parent = &dev->intf->dev;
 
-	__set_bit(EV_KEY, input->evbit);
-	__set_bit(KEY_CAMERA, input->keybit);
+	if (uvc_input_has_button(dev)) {
+		__set_bit(EV_KEY, input->evbit);
+		__set_bit(KEY_CAMERA, input->keybit);
+	}
+
+	if (dev->gpio_unit) {
+		__set_bit(EV_SW, input->evbit);
+		__set_bit(SW_CAMERA_LENS_COVER, input->swbit);
+	}
 
 	if ((ret = input_register_device(input)) < 0)
 		goto error;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 91ed59b54d9a..06c4d514d02c 100644
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
@@ -229,12 +230,10 @@ struct uvc_entity {
 			u8  *bmControlsType;
 		} extension;
 
-		struct {
-			u8  bControlSize;
-			u8  *bmControls;
-			struct gpio_desc *gpio_privacy;
+		struct uvc_gpio {
 			int irq;
 			bool initialized;
+			struct gpio_desc *gpio_privacy;
 		} gpio;
 	};
 
@@ -821,8 +820,14 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
 /* gpio */
+#ifdef CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
 int uvc_gpio_parse(struct uvc_device *dev);
-int uvc_gpio_init_irq(struct uvc_device *dev);
+int uvc_gpio_init(struct uvc_device *dev);
 void uvc_gpio_deinit(struct uvc_device *dev);
+#else
+static inline int uvc_gpio_parse(struct uvc_device *dev) {return 0; }
+static inline int uvc_gpio_init(struct uvc_device *dev) {return 0; }
+static inline void uvc_gpio_deinit(struct uvc_device *dev) {};
+#endif
 
 #endif

-- 
2.47.0.277.g8800431eea-goog


