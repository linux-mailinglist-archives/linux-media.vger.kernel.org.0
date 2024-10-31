Return-Path: <linux-media+bounces-20645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16B9B7BF2
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDE351C21214
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B34219F47A;
	Thu, 31 Oct 2024 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QPJHoA1R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5919DF60
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382202; cv=none; b=nJnynogxbWYAeeBV5usk8zXDWB91zHx2GLcE44llpITXGZKY8wOurNuPyFKMVg1lrFdT7ui+gmB5kfsxRFq6y0fH71Rua28QAEJ+TBt2YEQzChDvRI5mvio3Ht42x8b/0+qIIjZ8Sdi5f6AkSoLcuGE5+ncA+si7LiRUOCywThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382202; c=relaxed/simple;
	bh=MFSbzsC4qpSDjJpQBpgnBMJ9pfWpXmfF9LukJr0n+kU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvUcbx+q5zxd+kzVghCUgGzaxQ1QZmMWGoO7cf5zzulmBPUtuBxUU0WMnNkFrgI03J6WKayRsvspUkF1s/k+L+yH41Gr1FbJWqY7dZKxlIwdKXtT9f2mzM7ByLNuuXpPQJ9RLtDGldVjyOJt1bU/4+ezFu6dnFyn/MYdGBb0Rrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QPJHoA1R; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ce3fc4e58bso5668656d6.0
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730382199; x=1730986999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OakYK1PNX0QAwWEi796q2AZXJN6/BZIoR2BwFEbcznk=;
        b=QPJHoA1RTHuPspoA84DEU4UvpXq/aHbB1/pKL2yz5mA6ISiF/BPSEMbPxUaerfvZmp
         Yan/csuOVPdEjZ5l8JX2H90e/RHGLC88+3eST7Gu4gfp3CVON/1By+6AQSiubIAvnBq2
         7o7G6s5zzbhaXFgGfscVuZJf8PGpjPXBbebA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382199; x=1730986999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OakYK1PNX0QAwWEi796q2AZXJN6/BZIoR2BwFEbcznk=;
        b=fP4gsPlebC0WeO2s9kAmJu+G0QVnR5yjuQQHfIpEYDEBAzGnNUssHh78TEC9nY+cQh
         3CGvDMlyVOktDQPVX/hYCylKuk/Z1vnjIp2WnoWX8aGWYseGp9NbizpNOjF78MGtIYRj
         rZUb6juCeqnfvUMXOfTgwFRldM1wH04Ko6JSMLsFsfa/yp3wj+N5JlcoEcAJo8U64z5Y
         f03wlAZ0FnAJDaCTa+qqyJCTljXwQmFySDQkJcCLc+ZnLkKN3842vlNLUzFIvxQPwr45
         DmlBz/KFHuToUzwQ4bJCd6IQQJd3bApo2emNY2hf5tF8T6ZZ7XJlPD/r+uv4P3YjXZwd
         mlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHy7UWOHSCw0A4uw5NXp6dnVPYrONrgV7LQgDCEoznCDNrPK7jlddsCffsuzY3hD6khXVtTC7nVXiByw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJoyim2on//IxDmlDgyw2V7y3DjhFY7PknR93NzleFGiYaUycw
	7hmB1SfzcPvDFB8qPdX4WLKTcupu6F9qB5cjJTGrox6E3nlWC2WLIj78xYEP4g==
X-Google-Smtp-Source: AGHT+IFpQLWpV5A+qH3RHM465CbtXgg+GdcRa4Dne3VABdfXEoRAUwc9lj74kFrk0PTSc6TUVlJpNw==
X-Received: by 2002:a05:6214:5c89:b0:6d3:55ee:35d with SMTP id 6a1803df08f44-6d355ee0410mr29414286d6.7.1730382198885;
        Thu, 31 Oct 2024 06:43:18 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d354177d2fsm7837776d6.107.2024.10.31.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:43:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 31 Oct 2024 13:43:14 +0000
Subject: [PATCH 1/7] media: uvcvideo: Factor out gpio functions to its own
 file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-uvc-subdev-v1-1-a68331cedd72@chromium.org>
References: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
In-Reply-To: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This is just a refactor patch, no new functionality is added.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Makefile     |   3 +-
 drivers/media/usb/uvc/uvc_driver.c | 107 ++-----------------------------------
 drivers/media/usb/uvc/uvc_gpio.c   | 107 +++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |   7 +++
 4 files changed, 119 insertions(+), 105 deletions(-)

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
index a96f6ca0889f..94fb8e50a50c 100644
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
@@ -1240,106 +1239,6 @@ static int uvc_parse_control(struct uvc_device *dev)
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
-	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
-					       GPIOD_IN);
-	if (IS_ERR_OR_NULL(gpio_privacy))
-		return PTR_ERR_OR_ZERO(gpio_privacy);
-
-	irq = gpiod_to_irq(gpio_privacy);
-	if (irq < 0)
-		return dev_err_probe(&dev->udev->dev, irq,
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
-
-	if (!unit || unit->gpio.irq < 0)
-		return 0;
-
-	return devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
-					 uvc_gpio_irq,
-					 IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
-					 IRQF_TRIGGER_RISING,
-					 "uvc_privacy_gpio", dev);
-}
-
 /* ------------------------------------------------------------------------
  * UVC device scan
  */
diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
new file mode 100644
index 000000000000..5b74131795c5
--- /dev/null
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -0,0 +1,107 @@
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
+	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
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
+
+	if (!unit || unit->gpio.irq < 0)
+		return 0;
+
+	return devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
+					 uvc_gpio_irq,
+					 IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
+					 IRQF_TRIGGER_RISING,
+					 "uvc_privacy_gpio", dev);
+}
+
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..c7519d59d611 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -672,6 +672,9 @@ do {									\
 extern struct uvc_driver uvc_driver;
 
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
+struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
+					u16 id, unsigned int num_pads,
+					unsigned int extra_size);
 
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
@@ -816,4 +819,8 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
 size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
+/* gpio */
+int uvc_gpio_init_irq(struct uvc_device *dev);
+int uvc_gpio_parse(struct uvc_device *dev);
+
 #endif

-- 
2.47.0.163.g1226f6d8fa-goog


