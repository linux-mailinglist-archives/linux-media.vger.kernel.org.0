Return-Path: <linux-media+bounces-20646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B21E9B7BF4
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD111C2126C
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16291A072A;
	Thu, 31 Oct 2024 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hJsYHpkN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4919F119
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382204; cv=none; b=AshFpH2OlDTyuB6UiWD1toBEe4Yet6qhnVlK2B0ZaXZdLD7jTDSNtIz3zCNKicxzA32UYRuK93SKpeBV9rjtBHtpIh1RhPbV4SYnb9R/nFL5w1FZTg/zFMV9e9+pu8rftq4G1h0gLslWtPw7iWrzLAKFyYQsBNGAR6lrIviUXJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382204; c=relaxed/simple;
	bh=o5SZwy+JWp69unv8PlJuuFqc1ODe+O2YZdNzS7VcWDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTep7t/EyjtOpcFL8rB1WC3UtMBSMm8aA27iXiN2lgPXVODUsZdN6a2jgcIiQxhBK2rn2VShqO90YbArIwFMM0PDnbcHS+7RNimO+R3NV+KCBtjpc0LJgIwEY+WNH+7B6pv/Jvwp4klENz8CR1IbZNGFig+j0XaxpO4XC5tAle0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hJsYHpkN; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b15d330ce1so65903385a.1
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730382200; x=1730987000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdTwYT/n8XLy4Tkx8QW4bUUa3rFfFATFk6EQx2or3es=;
        b=hJsYHpkNsy8dmiAxUdawSPmFZ6ou5Vme0jsDcGuDjyGtXZ/GGpUBboYcDS1os7zB/q
         oMQUfta0bQwfPFRfXgn1vCyWM63QrQis4rCnm8opZEkvXSqu0L10fiOkhsHk0tCvM8iB
         S/i4Y12TXE7t6NehwknMBfQ3QI+mHVkCimL4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382200; x=1730987000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdTwYT/n8XLy4Tkx8QW4bUUa3rFfFATFk6EQx2or3es=;
        b=WFLPC78udoYVnnekBM0GHIKD6CDBZCb6WUAcKFIStLQCCz6JNNvaiAtxR00wxFcUQe
         aNYE8nazPljW043yu+IqYTVBpKBNeS3owSU6QWnYQJgGT0rgB+MDPLrxpxUs1G0d7ugQ
         rhT5D+Lx26gcaPybjSCP6uuO/HZxHzmzKw5VJ/Z8fNci5h4kFProduwYItH9xe9K6z5e
         8CcevMgyG32YlllcEop1JanOn7+xulLYfAWWqIWz8DtvRR03dHMN1657G/eqflHELCS8
         mQx4hyl9i/XzL9NOAC892V2+NpF/b9/hr8RYpgnDmvdyHrVuD2YVXSwovmnsKMVxlHp+
         DD3w==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7WAUSdtTkwEmyGXsDjlud7FNYaA4Q7BVQfHnUuVm8Ei1mcvNe4a78oe9x5AlnTO8G3WQm2H6UTtUGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydRdbkyYgV6NGrUi7peDRGKq6NApegOj2TyaCovN4VaB8Og4Kl
	o4W2M4I4aj1FVGnRijA9hZizHwD0C+Wj5KC8ySaiS9dgyuaGwTQ3M21NjV0fTA==
X-Google-Smtp-Source: AGHT+IFuOP0NJ3O68Rs09w04OGn1q9iQGQkF+HFaYsKydi7l8Zy/IZKkdKMMxKMZtUPSgU4T4Lp3dg==
X-Received: by 2002:a05:6214:5683:b0:6c7:c5b5:a78d with SMTP id 6a1803df08f44-6d351ac1649mr56293456d6.18.1730382200185;
        Thu, 31 Oct 2024 06:43:20 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d354177d2fsm7837776d6.107.2024.10.31.06.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:43:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 31 Oct 2024 13:43:15 +0000
Subject: [PATCH 2/7] media: uvcvideo: reimplement privacy GPIO as a
 separate subdevice
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-uvc-subdev-v1-2-a68331cedd72@chromium.org>
References: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
In-Reply-To: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
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
 drivers/media/usb/uvc/uvc_driver.c |   5 +-
 drivers/media/usb/uvc/uvc_entity.c |   6 ++
 drivers/media/usb/uvc/uvc_gpio.c   | 118 ++++++++++++++++++++++---------------
 drivers/media/usb/uvc/uvcvideo.h   |  18 +++---
 5 files changed, 92 insertions(+), 75 deletions(-)

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
index 94fb8e50a50c..8dacb0783eb1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2169,6 +2169,7 @@ static int uvc_probe(struct usb_interface *intf,
 	if (media_device_register(&dev->mdev) < 0)
 		goto error;
 #endif
+
 	/* Save our data pointer in the interface data. */
 	usb_set_intfdata(intf, dev);
 
@@ -2180,7 +2181,7 @@ static int uvc_probe(struct usb_interface *intf,
 			 ret);
 	}
 
-	ret = uvc_gpio_init_irq(dev);
+	ret = uvc_gpio_init(dev);
 	if (ret < 0) {
 		dev_err(&dev->udev->dev,
 			"Unable to request privacy GPIO IRQ (%d)\n", ret);
@@ -2207,6 +2208,8 @@ static void uvc_disconnect(struct usb_interface *intf)
 {
 	struct uvc_device *dev = usb_get_intfdata(intf);
 
+	uvc_gpio_cleanup(dev->gpio_unit);
+
 	/*
 	 * Set the USB interface data to NULL. This can be done outside the
 	 * lock, as there's no other reader.
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
index 5b74131795c5..e02d46ef9566 100644
--- a/drivers/media/usb/uvc/uvc_gpio.c
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -7,83 +7,66 @@
 
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
+	int ret;
+	struct uvc_gpio *gpio =
+		container_of(ctrl->handler, struct uvc_gpio, hdl);
 
-	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+	ret = gpiod_get_value_cansleep(gpio->gpio_privacy);
+	if (ret < 0)
+		return ret;
 
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
 
-	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
+	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
 					       GPIOD_IN);
 	if (IS_ERR_OR_NULL(gpio_privacy))
 		return PTR_ERR_OR_ZERO(gpio_privacy);
 
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
@@ -91,17 +74,58 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	return 0;
 }
 
-int uvc_gpio_init_irq(struct uvc_device *dev)
+int uvc_gpio_init(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
+	int init_val;
+	int ret;
 
 	if (!unit || unit->gpio.irq < 0)
 		return 0;
 
-	return devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
-					 uvc_gpio_irq,
-					 IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
-					 IRQF_TRIGGER_RISING,
-					 "uvc_privacy_gpio", dev);
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
+	ret = devm_request_threaded_irq(&dev->intf->dev, unit->gpio.irq, NULL,
+					uvc_gpio_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
+					IRQF_TRIGGER_RISING,
+					"uvc_privacy_gpio", &unit->gpio);
+	if (ret)
+		goto cleanup;
+	return 0;
+
+cleanup:
+	v4l2_ctrl_handler_free(&unit->gpio.hdl);
+	return ret;
 }
 
+void uvc_gpio_cleanup(struct uvc_entity *entity)
+{
+	if (!entity)
+		return;
+
+	v4l2_ctrl_handler_free(&entity->gpio.hdl);
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c7519d59d611..1827f4048f5a 100644
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
@@ -171,6 +172,13 @@ struct uvc_control {
 
 #define UVC_ENTITY_FLAG_DEFAULT		(1 << 0)
 
+struct uvc_gpio {
+	struct gpio_desc *gpio_privacy;
+	int irq;
+	struct v4l2_ctrl_handler hdl;
+	struct v4l2_ctrl *privacy_ctrl;
+};
+
 struct uvc_entity {
 	struct list_head list;		/* Entity as part of a UVC device. */
 	struct list_head chain;		/* Entity as part of a video device chain. */
@@ -229,12 +237,7 @@ struct uvc_entity {
 			u8  *bmControlsType;
 		} extension;
 
-		struct {
-			u8  bControlSize;
-			u8  *bmControls;
-			struct gpio_desc *gpio_privacy;
-			int irq;
-		} gpio;
+		struct uvc_gpio gpio;
 	};
 
 	u8 bNrInPins;
@@ -820,7 +823,8 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
 /* gpio */
-int uvc_gpio_init_irq(struct uvc_device *dev);
+int uvc_gpio_init(struct uvc_device *dev);
 int uvc_gpio_parse(struct uvc_device *dev);
+void uvc_gpio_cleanup(struct uvc_entity *entity);
 
 #endif

-- 
2.47.0.163.g1226f6d8fa-goog


