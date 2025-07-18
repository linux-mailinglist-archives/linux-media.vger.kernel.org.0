Return-Path: <linux-media+bounces-38096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026DB0A79B
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 17:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EEF1AA1DA0
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 15:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1040D2E0911;
	Fri, 18 Jul 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K7jTF7MB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE432DEA74
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852557; cv=none; b=BsFGeQ+xnyUDhfCnUbhEd+096rnR9SXXsZ605LP5X33aaF/g4QyQF7DyBz6ai4YutcR04awvvwGKeCG3jFF010Drbdbexj7Xdh9z11BPzJnpFv5AX801reAYEp1Ex7syhEfApMXmGwU+E/TNngNBqqT0gb/6i/vedqPzmHKZv24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852557; c=relaxed/simple;
	bh=/8ITQNX87TDjJtwoqKQOHmwkCLN38DugcUW/GK5Cn4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdJyyDSqBsvlBzhZ7KIpeeD4Z0ZVLGtYtkEaKSh/Xuj1OwAmrGOsoRGitre7q8oB88wxJUlwDUspAEGMUxAUxZugh6uLmMagJwvKrDSiIIqfs17+TrhmUdbeaPNtENHWQ6oxIXGBw5hljn71WvSGqelafm3HZNGeV0GIvhgp2/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K7jTF7MB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-558f7472d64so2858032e87.0
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752852553; x=1753457353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0myKZxZrlimKWecDsKq5/yhMZliT2ThHP1sIZx7oJA=;
        b=K7jTF7MBj7SzA+da7IU/vax9gdhPLf6wf0USul3+V+rreudPSw5S1oUOKUVvN0Bn7A
         rmD3KBLvxxQZsWrXFypU94kcNq8d9v7+ULTa51DMMsWjDXOfF3B1tWRA+5H2lG/7s8eB
         89X9iFtbO2SmKJ3u84EWM45wfNKnpZo67qwNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852553; x=1753457353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0myKZxZrlimKWecDsKq5/yhMZliT2ThHP1sIZx7oJA=;
        b=VG7nzJ13q+t7Fn0t7krGgZiYUUB0Oq8qXAqC9Qx8SV03/GWxbmgV/xlU2LsD3fS2Qg
         Ua5bTCitS9AXVVXrQlAqLt8HUnQF6UkfPrfdaYybOZIYR+nQ9V3BMukegYZ8pKjX6cLg
         u0WYXXwtYDHjm/NR2y2TN7FNUPjxL65BCw2h9tTwvHevOsXQomodD5G7w8owIdElJAjG
         XFM4T+wB70bICtaR1dWrnfs8aHAsynf1arRPRPt7iMEqRLqZQvvv0Eyej1t7lUlwJDPf
         WuYtGq/TB8FNjdTNDcSNGsWbPlS6m76PlliBctafjyrWMMP0jeNw6nlwuWMVEUVLgCm7
         CCYw==
X-Forwarded-Encrypted: i=1; AJvYcCXOetqt/xtek7uljnO7SKGiqti6CdsuVzIg6wtYSMfsPQeAOpUIOA7LS+13PudLzuHonAcIZHH17Aws2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjTC5KRUuRONkIQqj1Xi5Jfcmk887e1TiYXcC5g9Qb07bicIM1
	7QKlXTE+vGT/TicT6shba3jOdfvKG4Ue0tfqV2YwyqQ7F3xFUEJ0u1Xp4yygs2clbQ==
X-Gm-Gg: ASbGncsIyQhQHnnMKerVb2yVzpj0wzPAl9dOHbh3j3S9M15M3FRCbg+VoR9bbV39SZg
	LhDvLltKiupFiz4WcKegkSb6kqEj2Gk9TFsu3NvvR0fCP0r+F8alHuCRx0CN96gY5KoLMvk1zrC
	FGRbWgHcL1XxjaxR5NeHzn9/vk3m2tDQHY4J0Nh5BbORIbwBUv6TiFZlgq2KD+TR2HNaaJhA9Jq
	bGr44VNi0SqGvUKIQLsoy/9odqKiRHHFBSCmVPx59tSexSok+2nbGSoNJOZ1BbaGpyfoCOs7+Zh
	r2OTHcQC2p397xScc8ybtbfZ9EYKpijd5CCRBOoLop0WBC/5quAGKxcbo1pcOx28iv+lYn9fAbL
	roLSwpq/CCKVTAniOB31+WTQDLzXE6j/6UFh+TretUTrQSzrhXmQgsBZ3c+tSEIc0KWXA1T+T3Z
	zFbg==
X-Google-Smtp-Source: AGHT+IGci1vQOFQMMl+qEzOSUifBeMVciDHPPF3UMhgKYZbmLXQkHMvTkLZEJPwdCUkuOzwCEuhUrA==
X-Received: by 2002:ac2:4bd6:0:b0:551:ecf4:2cd8 with SMTP id 2adb3069b0e04-55a2fe66ba5mr1159536e87.23.1752852553168;
        Fri, 18 Jul 2025 08:29:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9d6dsm2268601fa.83.2025.07.18.08.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:29:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Jul 2025 15:29:10 +0000
Subject: [PATCH v5 1/5] media: uvcvideo: Factor out gpio functions to its
 own file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-uvc-subdev-v5-1-a5869b071b0d@chromium.org>
References: <20250718-uvc-subdev-v5-0-a5869b071b0d@chromium.org>
In-Reply-To: <20250718-uvc-subdev-v5-0-a5869b071b0d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, linux-gpio@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

This is just a refactor patch, no new functionality is added.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Makefile     |   3 +-
 drivers/media/usb/uvc/uvc_driver.c | 121 +-----------------------------------
 drivers/media/usb/uvc/uvc_gpio.c   | 122 +++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |   7 +++
 4 files changed, 133 insertions(+), 120 deletions(-)

diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..85514b6e538fbb8284e574ca14700f2d749e1a2e 100644
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
index 775bede0d93d9b3e5391914aa395326d3de6a3b1..56bf741e55ed22052f2f4773244ef49c08a2fdae 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -8,7 +8,6 @@
 
 #include <linux/atomic.h>
 #include <linux/bits.h>
-#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -795,8 +794,8 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
-		unsigned int num_pads, unsigned int extra_size)
+struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
+				    unsigned int extra_size)
 {
 	struct uvc_entity *entity;
 	unsigned int num_inputs;
@@ -1245,122 +1244,6 @@ static int uvc_parse_control(struct uvc_device *dev)
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
-	if (!gpio_privacy)
-		return 0;
-
-	if (IS_ERR(gpio_privacy))
-		return dev_err_probe(&dev->intf->dev,
-				     PTR_ERR(gpio_privacy),
-				     "Can't get privacy GPIO\n");
-
-	irq = gpiod_to_irq(gpio_privacy);
-	if (irq < 0)
-		return dev_err_probe(&dev->intf->dev, irq,
-				     "No IRQ for privacy GPIO\n");
-
-	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
-	if (!unit)
-		return -ENOMEM;
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
index 0000000000000000000000000000000000000000..45c169eb933815baab3d166abace46f269d9241e
--- /dev/null
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -0,0 +1,122 @@
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
+	if (!gpio_privacy)
+		return 0;
+
+	if (IS_ERR(gpio_privacy))
+		return dev_err_probe(&dev->intf->dev,
+				     PTR_ERR(gpio_privacy),
+				     "Can't get privacy GPIO\n");
+
+	irq = gpiod_to_irq(gpio_privacy);
+	if (irq < 0)
+		return dev_err_probe(&dev->intf->dev, irq,
+				     "No IRQ for privacy GPIO\n");
+
+	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
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
index 757254fc4fe930ae61c9d0425f04d4cd074a617e..63df6fb89ed29c76ed0ded9283a2c5e817bf6500 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -688,6 +688,8 @@ do {									\
  */
 
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
+struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
+				    unsigned int extra_size);
 
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
@@ -814,4 +816,9 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
 size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
+/* gpio */
+int uvc_gpio_parse(struct uvc_device *dev);
+int uvc_gpio_init_irq(struct uvc_device *dev);
+void uvc_gpio_deinit(struct uvc_device *dev);
+
 #endif

-- 
2.50.0.727.gbf7dc18ff4-goog


