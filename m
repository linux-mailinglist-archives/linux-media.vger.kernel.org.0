Return-Path: <linux-media+bounces-22049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008829D8CFF
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 20:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12D828ADB7
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED311CEE88;
	Mon, 25 Nov 2024 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VsyEFGDK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF381CDFB9
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732564165; cv=none; b=RJmeYYUZLd8CvNNiD0ixIOX38N5wA8W/ZA3XV+NNd02ksO+4+GQSYDQ6pWRVJ6T91rcnCV8hzjyGcrhhVb5KxttHqHEim65iop5uV+NFIGv788+XhnB5+w+25eq5njcRm68hiszD1ZwQwuCXVXjZwOHQ09ahHmomSi1sS+PKVVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732564165; c=relaxed/simple;
	bh=LJwMS6MJ8Ltz6IYWDIRFRnplCJ9F2eVGdbiFdyt/WMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQhasnls1Ks1G7wY8CIzIHf9TYs+Vkcj3PkVGSzueymW2ctVFu0lTnFe1iEie9pBPpiSSGAHy4MKy7y0uX95zU9Ew58bPKhMDRlCZHAIlISbyovQKYxRhJjpRA0Yferyto/OCUOMrCNKtNiq2cAgDTTw6ghJhCitY2wfGH6xb/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VsyEFGDK; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4ad633f4cd9so1333347137.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 11:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732564163; x=1733168963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImPJuXy1q7OulXoOIZvimBy9/1LlGfl5z3fyGupJqII=;
        b=VsyEFGDKspaTWTQcfOwoAlPhZOoIt4lQUKhLuG23My9RK56hKRXoM4LETAJ40oRDiO
         DG+gHabGKWsvaxtNXNp3nugIzLC3f4/9Mq51DDwAvFqkK0NwYpRYVModibUJUj1jij+b
         qEYTKD0/zMLAPr5UoVCNTt2Qj381DQYJgG70g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564163; x=1733168963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImPJuXy1q7OulXoOIZvimBy9/1LlGfl5z3fyGupJqII=;
        b=cKWHmCK3tUamD8TZh9l8+2dRgF4coR1judPbFAcDsktLfJvqlagDsxIXBr6UwRszxE
         xC4cxPnJ5qZud4oni1dPcP5MKc1ub9lpgouto+MKvsSCpSdxNJEkFqlOffDk8YdGIH+b
         v5wLA08VaympfdYEzcdB7ki0at7y6d5Wkb7L3+vBsT3O3bJyqMi6g9256qMDkokikYuh
         FG/UqDcVVcLkLxQq88KcliblK1z2Wli41XYEW+J4V8DHHXgSSZifB3HKRjkHrWQSZM2i
         0VVnW8J/eeTOI2LrQlAFb1AgLJqS17RYDi8K1lmZn/97xpm8ZvDxiglLJm/QEziwe2dI
         HFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7sKgwXgMWGRbdDHgVAlDWX89FMyZuPGa22rJGMoTWxtxuY9IZicJ/bf3QU3z5eR2EpOwneyrq5ohhrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTSuizwNlUkFuQPmJ9d4S/a7vEn/khPvEvVczAcEUPztC9l7AG
	hJixkiC06LzTL+wuUz6PGY3GiwqM38bauiJ5yujxOPKlIIrjmumsdt9yKyznCA==
X-Gm-Gg: ASbGncscUf6GlpMiY1glfQ21cn1GWqL+J6zLpeWYai543A2hB9eIJXNH1BzzTHytI8B
	IdExkxFI0v+HH/cKjQw8piRJ/qLRAZMDp/p5NS1NsfqNqUOtdkUPidVfjl0jGl+II+POUMFNEB5
	GCSQE50Td/ZAN0kONZAUHoe2Va8sDoq1Jvseex0/gum69TAnHzGzAZ4k0bIMsn6Co8bXpvT4DJg
	MF6C+FdMe+qlqL6s60QO/Yku152nu8FpYlimsAs3uNNRatHivabghTQCUdQPcUzwFfuAjPRpoFh
	hwAFnlzH7UsKsr4XivbqYG5C
X-Google-Smtp-Source: AGHT+IGmPA/X88hhCinX2JdfqBivCFQ7s6RNh6d830PSDJ9V+HQ4CIYEu7z7dwlCqNiOvRpEMNaIpQ==
X-Received: by 2002:a05:6102:3749:b0:4af:958:97d5 with SMTP id ada2fe7eead31-4af0958989bmr7687165137.25.1732564162778;
        Mon, 25 Nov 2024 11:49:22 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af358d2f9asm75324137.23.2024.11.25.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:49:21 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Nov 2024 19:49:11 +0000
Subject: [PATCH v4 6/7] media: uvcvideo: Make gpio_unit entity-less
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-uvc-subdev-v4-6-51e040599f1a@chromium.org>
References: <20241125-uvc-subdev-v4-0-51e040599f1a@chromium.org>
In-Reply-To: <20241125-uvc-subdev-v4-0-51e040599f1a@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now that we do not need to export a control there is no need to create
an entity. Move the uvc_gpio structure to uvc_device.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  7 -------
 drivers/media/usb/uvc/uvc_gpio.c   | 40 ++++++++++++++------------------------
 drivers/media/usb/uvc/uvc_status.c |  4 ++--
 drivers/media/usb/uvc/uvcvideo.h   |  2 +-
 4 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index c34bfadce60c..ec07c74a5d26 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1750,13 +1750,6 @@ static int uvc_scan_device(struct uvc_device *dev)
 		return -1;
 	}
 
-	/* Add GPIO entity to the first chain. */
-	if (dev->gpio_unit) {
-		chain = list_first_entry(&dev->chains,
-					 struct uvc_video_chain, list);
-		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
-	}
-
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
index e6fe1845bd01..ad3716d0cf56 100644
--- a/drivers/media/usb/uvc/uvc_gpio.c
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -14,7 +14,7 @@
 static irqreturn_t uvc_gpio_irq(int irq, void *data)
 {
 	struct uvc_device *dev = data;
-	struct uvc_gpio *uvc_gpio = &dev->gpio_unit->gpio;
+	struct uvc_gpio *uvc_gpio = &dev->gpio_unit;
 	int new_val;
 
 	if (!uvc_gpio->gpio_ready)
@@ -51,7 +51,6 @@ static const struct dmi_system_id privacy_valid_during_streamon[] = {
 int uvc_gpio_parse(struct uvc_device *dev)
 {
 	struct gpio_desc *gpio_privacy;
-	struct uvc_entity *unit;
 	int irq;
 
 	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
@@ -64,11 +63,6 @@ int uvc_gpio_parse(struct uvc_device *dev)
 		return dev_err_probe(&dev->intf->dev, irq,
 				     "No IRQ for privacy GPIO\n");
 
-	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
-				    UVC_EXT_GPIO_UNIT_ID, 0, 0);
-	if (IS_ERR(unit))
-		return PTR_ERR(unit);
-
 	/*
 	 * Note: This quirk will not match external UVC cameras,
 	 * as they will not have the corresponding ACPI GPIO entity.
@@ -76,38 +70,33 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	if (dmi_check_system(privacy_valid_during_streamon))
 		dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
 	else
-		unit->gpio.gpio_ready = true;
-
-	unit->gpio.gpio_privacy = gpio_privacy;
-	unit->gpio.irq = irq;
-	strscpy(unit->name, "GPIO", sizeof(unit->name));
-	list_add_tail(&unit->list, &dev->entities);
+		dev->gpio_unit.gpio_ready = true;
 
-	dev->gpio_unit = unit;
+	dev->gpio_unit.gpio_privacy = gpio_privacy;
+	dev->gpio_unit.irq = irq;
 
 	return 0;
 }
 
 void uvc_gpio_quirk(struct uvc_device *dev, bool stream_on)
 {
-	if (!dev->gpio_unit || !(dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM))
+	if (!(dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM))
 		return;
 
-	dev->gpio_unit->gpio.gpio_ready = stream_on;
+	dev->gpio_unit.gpio_ready = stream_on;
 	if (stream_on)
 		uvc_gpio_irq(0, dev);
 }
 
 int uvc_gpio_init(struct uvc_device *dev)
 {
-	struct uvc_entity *unit = dev->gpio_unit;
 	int init_val;
 	int ret;
 
-	if (!unit || unit->gpio.irq < 0)
+	if (!dev->gpio_unit.gpio_privacy)
 		return 0;
 
-	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
+	ret = request_threaded_irq(dev->gpio_unit.irq, NULL, uvc_gpio_irq,
 				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
 				   IRQF_TRIGGER_RISING,
 				   "uvc_privacy_gpio", dev);
@@ -118,11 +107,12 @@ int uvc_gpio_init(struct uvc_device *dev)
 		uvc_gpio_quirk(dev, false);
 		init_val = false;
 	} else {
-		unit->gpio.gpio_ready = true;
+		dev->gpio_unit.gpio_ready = true;
 
-		init_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+		init_val =
+			gpiod_get_value_cansleep(dev->gpio_unit.gpio_privacy);
 		if (init_val < 0) {
-			free_irq(unit->gpio.irq, dev);
+			free_irq(dev->gpio_unit.irq, dev);
 			return init_val;
 		}
 	}
@@ -130,15 +120,15 @@ int uvc_gpio_init(struct uvc_device *dev)
 	input_report_switch(dev->input, SW_CAMERA_LENS_COVER, init_val);
 	input_sync(dev->input);
 
-	unit->gpio.initialized = true;
+	dev->gpio_unit.initialized = true;
 
 	return 0;
 }
 
 void uvc_gpio_deinit(struct uvc_device *dev)
 {
-	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
+	if (!dev->gpio_unit.initialized)
 		return;
 
-	free_irq(dev->gpio_unit->gpio.irq, dev);
+	free_irq(dev->gpio_unit.irq, dev);
 }
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 319f472213f6..e5ebac1e7093 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -44,7 +44,7 @@ static int uvc_input_init(struct uvc_device *dev)
 	struct input_dev *input;
 	int ret;
 
-	if (!uvc_input_has_button(dev) && !dev->gpio_unit)
+	if (!uvc_input_has_button(dev) && !dev->gpio_unit.gpio_privacy)
 		return 0;
 
 	input = input_allocate_device();
@@ -64,7 +64,7 @@ static int uvc_input_init(struct uvc_device *dev)
 		__set_bit(KEY_CAMERA, input->keybit);
 	}
 
-	if (dev->gpio_unit) {
+	if (dev->gpio_unit.gpio_privacy) {
 		__set_bit(EV_SW, input->evbit);
 		__set_bit(SW_CAMERA_LENS_COVER, input->swbit);
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 1a784fb76ed7..642449acce1c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -596,7 +596,7 @@ struct uvc_device {
 		const void *data;
 	} async_ctrl;
 
-	struct uvc_entity *gpio_unit;
+	struct uvc_gpio gpio_unit;
 };
 
 enum uvc_handle_state {

-- 
2.47.0.338.g60cca15819-goog


