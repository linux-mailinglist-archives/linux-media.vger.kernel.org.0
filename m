Return-Path: <linux-media+bounces-21198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3469C267B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 21:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61A44B238FA
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 20:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B4E1F26EC;
	Fri,  8 Nov 2024 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gYS99ee1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D48F1AA1D5
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097555; cv=none; b=aaFy3SVbF2xCRaIdBlh//uP6Q7nPMEO4McQA4Lx7RPeP351xw+ponbvy+1i8LIWirXbW4vCOEmILXAV58Svbs5quw+DGA7lDndDbKDsFoGfA5BPLUKGzGOnG29FO8jsmkJvr98nr7M8YLx8WAidTbiHABpqNCYiaUfEtbVJ49z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097555; c=relaxed/simple;
	bh=RkrsccvEqQUhBk8Z1PddvWJhE1cp8KwJo0AXadlFoHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmA4EC943tt+7yiJnf64KxwIkSKx5TLC5YkSMccksurXcAZj2d93fpZpXsv288yCxVNaTrBwsDWdyAprzaKcVKH1miulFgZG1H1pGXvjcK7j8pk2H+rjZzoPNBaGi0mP28S3jgCem5UJ2AeVIuJXs20lD8quO4BWLRzRLtA8O6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gYS99ee1; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5ebc0992560so1566214eaf.0
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731097553; x=1731702353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTqnfrQkIAHFL33oi5aoABfM2DMERBuyBRyMEKrhpSg=;
        b=gYS99ee13fU73SLFFM+H9ecSUU3Qh+xnJahLav4CbL5RBDPiOywuwaHma5dMFxuvW2
         /5y4Tw/287xCrGkzLHT+OJwTFszMB36kQMdd5FUoD/EhgR6gqcOrFR7TTf9zPY4/Eg5o
         Z4zKligX+0zkIIrtJMRt/9d7bBNjMnQx87unI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097553; x=1731702353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTqnfrQkIAHFL33oi5aoABfM2DMERBuyBRyMEKrhpSg=;
        b=k07DTpJHfU+KSImfRNxywtpgxMg9MrJsXGJGz7khdoiYdOqYNOGQebiGCU4UfSb7IQ
         ogHo7Tc7aM0FeQJcMlOO5zC9s4emo9oXE8QhR7CnVHqN9vW6MXsa3JBsdpwn/SaEl55o
         c0bTi//ZVfm5uduOH1iO8ImhGmEJkYX6lB/A8B5XtOWVxAsMNpBtpxfV9X7EHQ3Mlz4U
         WScRBcQbgVItxtRR9dshfaYODyq5dgGQMXRIakD5H2Y31dgGhx1rY9BE/CDqYG6M6Ooh
         z8Vms8ALMPEWFyIzPlwNUz99pRKOJCsEzjQMFfVF2M6RE4GgCyZnCiJaBnKrkUpqfzcT
         AxcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNjWwzAkerZreanPnsbEWvuUSFw8UskqQQXSOdaLOopjOCP+Y/6RwGvF5nsSTlzIHYlfCJCrPKgn23iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHaJvRZF96WPz3o0RAimdwWe8t75O9F3TE0tCLbZNPRRSshowx
	TslhvioOr3Q/odfKDf64KYPDv9PBgHeXVlQo14oUOiOH4AIwHhTqWek+BA0Jmw==
X-Google-Smtp-Source: AGHT+IHmHYRy0E+sQthEgfdGj/TkGxFgaoIi6XIOBa1bTk+Jd+XHo+4m5D+wXbV70YzRd/iB3CQhoA==
X-Received: by 2002:a05:6359:514a:b0:1c6:1d02:9be0 with SMTP id e5c5f4694b2df-1c641ea8956mr388148555d.7.1731097551160;
        Fri, 08 Nov 2024 12:25:51 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff46d440sm24207341cf.52.2024.11.08.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:25:50 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 08 Nov 2024 20:25:45 +0000
Subject: [PATCH v2 1/6] media: uvcvideo: Factor out gpio functions to its
 own file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-uvc-subdev-v2-1-85d8a051a3d3@chromium.org>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
In-Reply-To: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This is just a refactor patch, no new functionality is added.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Makefile     |   3 +-
 drivers/media/usb/uvc/uvc_driver.c | 119 +------------------------------------
 drivers/media/usb/uvc/uvc_gpio.c   | 118 ++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |   8 +++
 4 files changed, 131 insertions(+), 117 deletions(-)

diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
index 4f9eee4f81ab..85514b6e538f 100644
--- a/drivers/media/usb/uvc/Makefile
+++ b/drivers/media/usb/uvc/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
-		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
+		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
+		  uvc_gpio.o
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
 uvcvideo-objs  += uvc_entity.o
 endif
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cd13bf01265d..5b48768a4f7f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -8,7 +8,6 @@
 
 #include <linux/atomic.h>
 #include <linux/bits.h>
-#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -775,9 +774,9 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
-					       u16 id, unsigned int num_pads,
-					       unsigned int extra_size)
+struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
+					u16 id, unsigned int num_pads,
+					unsigned int extra_size)
 {
 	struct uvc_entity *entity;
 	unsigned int num_inputs;
@@ -1240,118 +1239,6 @@ static int uvc_parse_control(struct uvc_device *dev)
 	return 0;
 }
 
-/* -----------------------------------------------------------------------------
- * Privacy GPIO
- */
-
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
-static irqreturn_t uvc_gpio_irq(int irq, void *data)
-{
-	struct uvc_device *dev = data;
-
-	uvc_gpio_event(dev);
-	return IRQ_HANDLED;
-}
-
-static int uvc_gpio_parse(struct uvc_device *dev)
-{
-	struct uvc_entity *unit;
-	struct gpio_desc *gpio_privacy;
-	int irq;
-
-	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
-					       GPIOD_IN);
-	if (IS_ERR_OR_NULL(gpio_privacy))
-		return PTR_ERR_OR_ZERO(gpio_privacy);
-
-	irq = gpiod_to_irq(gpio_privacy);
-	if (irq < 0)
-		return dev_err_probe(&dev->intf->dev, irq,
-				     "No IRQ for privacy GPIO\n");
-
-	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
-				    UVC_EXT_GPIO_UNIT_ID, 0, 1);
-	if (IS_ERR(unit))
-		return PTR_ERR(unit);
-
-	unit->gpio.gpio_privacy = gpio_privacy;
-	unit->gpio.irq = irq;
-	unit->gpio.bControlSize = 1;
-	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
-	unit->gpio.bmControls[0] = 1;
-	unit->get_cur = uvc_gpio_get_cur;
-	unit->get_info = uvc_gpio_get_info;
-	strscpy(unit->name, "GPIO", sizeof(unit->name));
-
-	list_add_tail(&unit->list, &dev->entities);
-
-	dev->gpio_unit = unit;
-
-	return 0;
-}
-
-static int uvc_gpio_init_irq(struct uvc_device *dev)
-{
-	struct uvc_entity *unit = dev->gpio_unit;
-	int ret;
-
-	if (!unit || unit->gpio.irq < 0)
-		return 0;
-
-	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
-				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
-				   IRQF_TRIGGER_RISING,
-				   "uvc_privacy_gpio", dev);
-
-	unit->gpio.initialized = !ret;
-
-	return ret;
-}
-
-static void uvc_gpio_deinit(struct uvc_device *dev)
-{
-	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
-		return;
-
-	free_irq(dev->gpio_unit->gpio.irq, dev);
-}
-
 /* ------------------------------------------------------------------------
  * UVC device scan
  */
diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
new file mode 100644
index 000000000000..453739acbe8f
--- /dev/null
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *      uvc_gpio.c  --  USB Video Class driver
+ *
+ *      Copyright 2024 Google LLC
+ */
+
+#include <linux/kernel.h>
+#include <linux/gpio/consumer.h>
+#include "uvcvideo.h"
+
+static void uvc_gpio_event(struct uvc_device *dev)
+{
+	struct uvc_entity *unit = dev->gpio_unit;
+	struct uvc_video_chain *chain;
+	u8 new_val;
+
+	if (!unit)
+		return;
+
+	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+
+	/* GPIO entities are always on the first chain. */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	uvc_ctrl_status_event(chain, unit->controls, &new_val);
+}
+
+static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
+			    u8 cs, void *data, u16 size)
+{
+	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
+		return -EINVAL;
+
+	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
+
+	return 0;
+}
+
+static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
+			     u8 cs, u8 *caps)
+{
+	if (cs != UVC_CT_PRIVACY_CONTROL)
+		return -EINVAL;
+
+	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
+	return 0;
+}
+
+static irqreturn_t uvc_gpio_irq(int irq, void *data)
+{
+	struct uvc_device *dev = data;
+
+	uvc_gpio_event(dev);
+	return IRQ_HANDLED;
+}
+
+int uvc_gpio_parse(struct uvc_device *dev)
+{
+	struct uvc_entity *unit;
+	struct gpio_desc *gpio_privacy;
+	int irq;
+
+	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
+					       GPIOD_IN);
+	if (IS_ERR_OR_NULL(gpio_privacy))
+		return PTR_ERR_OR_ZERO(gpio_privacy);
+
+	irq = gpiod_to_irq(gpio_privacy);
+	if (irq < 0)
+		return dev_err_probe(&dev->udev->dev, irq,
+				     "No IRQ for privacy GPIO\n");
+
+	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
+				    UVC_EXT_GPIO_UNIT_ID, 0, 1);
+	if (IS_ERR(unit))
+		return PTR_ERR(unit);
+
+	unit->gpio.gpio_privacy = gpio_privacy;
+	unit->gpio.irq = irq;
+	unit->gpio.bControlSize = 1;
+	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
+	unit->gpio.bmControls[0] = 1;
+	unit->get_cur = uvc_gpio_get_cur;
+	unit->get_info = uvc_gpio_get_info;
+	strscpy(unit->name, "GPIO", sizeof(unit->name));
+
+	list_add_tail(&unit->list, &dev->entities);
+
+	dev->gpio_unit = unit;
+
+	return 0;
+}
+
+int uvc_gpio_init_irq(struct uvc_device *dev)
+{
+	struct uvc_entity *unit = dev->gpio_unit;
+	int ret;
+
+	if (!unit || unit->gpio.irq < 0)
+		return 0;
+
+	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
+				   IRQF_TRIGGER_RISING,
+				   "uvc_privacy_gpio", dev);
+
+	unit->gpio.initialized = !ret;
+
+	return ret;
+}
+
+void uvc_gpio_deinit(struct uvc_device *dev)
+{
+	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
+		return;
+
+	free_irq(dev->gpio_unit->gpio.irq, dev);
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 965a789ed03e..91ed59b54d9a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -673,6 +673,9 @@ do {									\
 extern struct uvc_driver uvc_driver;
 
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
+struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
+					u16 id, unsigned int num_pads,
+					unsigned int extra_size);
 
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
@@ -817,4 +820,9 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
 size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
+/* gpio */
+int uvc_gpio_parse(struct uvc_device *dev);
+int uvc_gpio_init_irq(struct uvc_device *dev);
+void uvc_gpio_deinit(struct uvc_device *dev);
+
 #endif

-- 
2.47.0.277.g8800431eea-goog


