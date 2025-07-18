Return-Path: <linux-media+bounces-38099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C505AB0A7B2
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 17:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 069185C1B75
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB5E2E1C53;
	Fri, 18 Jul 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MRCajQuy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BD2E0417
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852561; cv=none; b=qEuibMJcVJayAo/t/RJL1yo38vVVR1akXMpa8WI+8bg8kpqrk400DGEz8eM8M7mpkHFHPz3xqakbVn8qYvMkneFcDigbDtdC/Q4LMZV5YEsvcFm4/VuWPUBM51Syf5Nqn2hU/g2zxx60X6X0PvZXHYS//jSt99f+oLH9fUoGNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852561; c=relaxed/simple;
	bh=jswtptbP7BU30DkQJa9LKXhBgvdihRwmLkqJGTFd6vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lp01bT9QEbr3/C+ObCMcUnexaq3Ahtdv1jlMcWEG7d8p0rwXGoFXoDE9Ik+OJJCYc/Kh05p29NDkBnyiTqtt5C2Xq3Xy1gDXgvnMuoaONyToG1iooAzfXSixaWaN4AhIHtW1BYiwcjVCl4viFfEOIixMNEGtnes0wm8hCM6BCvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MRCajQuy; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b435ef653so17221011fa.2
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752852555; x=1753457355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aDpTgnQPPvRmQrHT77aLOY5jY2VFuPA/ovdljmguB4=;
        b=MRCajQuyXxTQc7Nr8SJekfjPTNsuqXhItwoflKGGOigxcFu5X42z0x8rSF/UNDUaP/
         1p4dKaDdjFuxJ+c27Qyp9Em0ulx5/WJ3hJkmD/mqqMnpbAqk3eahCBu2FT8863tO0TvX
         s7UIbY+pYJK19d0WSEzZZkcNpPOqWbMH3H1GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852555; x=1753457355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aDpTgnQPPvRmQrHT77aLOY5jY2VFuPA/ovdljmguB4=;
        b=qbCFwQe13btSAmdMJkfNEbxcGr+hVp1ojJz/pyCRX+AgJvfojDd4WiPGRTh7yEiN9+
         1lNxHre24xXydkbKCzY3G+Pc4A6zNT9q/uYaN7k3IByiOGqvuOXN8HkJW7YpjlA8rAc4
         wDstEzjdL0pSFPuspk3OYWdy1punk2dFZT1waYicud3iqAoccwAfGRpkZqIPjFw1cUXC
         DG1wgUqWnpiLYw7XNvfw/RFfGwW9Y8yiE8d7wNOQrD+XqQhRzlJoHGovH8r4zAOMUX+x
         pe5ZOVk2rcGqYhwkRvibcBc4TOyCoYG3ZgSaqHVqStzU+clAjAhg9TY9tY1gXW70GDxf
         S0WA==
X-Forwarded-Encrypted: i=1; AJvYcCUieSoUVDLa7vNjmSLw8ua9IfW7PSJMkuaMXBFS5UGJghGSup0juynzNvJyjzj8b3xOGCbsGgtgZ+hvLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCX5rGF1il05ziMPcRbZu4Hje7m75PQc6HlPrDylNi5hn1Hq47
	qZvFgB8Xem8xQ6W8ErRiHYv63oEKWADP7FheZltN+HVNerlasFKfbgH/mRUI1AOvHg==
X-Gm-Gg: ASbGncv/jY2Kwx1raOD0ELGNtORxSmxGPMx8yoGLUpi4I5+YGdGT7CjcOeHvWav6tFp
	FA2VAtFs+C73ZeIy/KGrQljXaJ0XrbpeOVwnVuC4OgS/RNGbb32DWbAIU8EJbhYo7AXeg3RNlPy
	GiSvtjhQqCfwlq8Oil66B3F9e45eieZsHFXERHm1voV0NWaSundJ+JU8mW3J5BaAVbrkD0g6EIp
	oXXcgtMzz4m6g1hJ3EBe9umiMkpeG2BKkBQoNfpQjpYflNteu9lyzTZq6V+lSI7hq5VM0Ogs2Sd
	LGA3Bg+U8Mu8TJbOh4vQC5+L0h7WhWc9Zd8OJQDMooiVwwX49YXN6IavSMLglkjSe5+Oh+4lHiZ
	yH/ecD0sYw+6w0zlyoXYGSwd2nQAqG7HUs6jcLawnzIwpeYTTA0FMzdtXgin4hgeUl92sM6zy5l
	MhoaYq8dmIVZHS
X-Google-Smtp-Source: AGHT+IH0fb8dYdBwEnxw/wvuoV9A2tmNmLlLkqb1iZQSIYHHpJCcEfC1vgh7mpiRVMnNAFT2fJEXvQ==
X-Received: by 2002:a05:651c:2c7:b0:32a:86ea:a1f2 with SMTP id 38308e7fff4ca-3309a578a3emr16245931fa.22.1752852554678;
        Fri, 18 Jul 2025 08:29:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9d6dsm2268601fa.83.2025.07.18.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:29:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Jul 2025 15:29:13 +0000
Subject: [PATCH v5 4/5] media: uvcvideo: Make gpio_unit entity-less
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-uvc-subdev-v5-4-a5869b071b0d@chromium.org>
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

Now that we do not need to export a control there is no need to create
an entity. Move the uvc_gpio structure to uvc_device.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  7 -------
 drivers/media/usb/uvc/uvc_gpio.c   | 39 +++++++++++++++-----------------------
 drivers/media/usb/uvc/uvc_status.c |  4 ++--
 drivers/media/usb/uvc/uvcvideo.h   |  2 +-
 4 files changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 89a4ac8a358f508220bca43078964bc2a8a6c4a5..b79d276732bc80ef175ffdbaa73b6395585ff07b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1755,13 +1755,6 @@ static int uvc_scan_device(struct uvc_device *dev)
 		return -ENODEV;
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
index f575b848058f48e3b73a6793e59d25a3eed1c61a..5da67c260f02dff7bbe2eb3849e8dfc939ad1d82 100644
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
@@ -69,10 +68,6 @@ int uvc_gpio_parse(struct uvc_device *dev)
 		return dev_err_probe(&dev->intf->dev, irq,
 				     "No IRQ for privacy GPIO\n");
 
-	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
-	if (!unit)
-		return -ENOMEM;
-
 	/*
 	 * Note: This quirk will not match external UVC cameras,
 	 * as they will not have the corresponding ACPI GPIO entity.
@@ -80,38 +75,33 @@ int uvc_gpio_parse(struct uvc_device *dev)
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
@@ -122,11 +112,12 @@ int uvc_gpio_init(struct uvc_device *dev)
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
@@ -134,15 +125,15 @@ int uvc_gpio_init(struct uvc_device *dev)
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
index 664ba59af8ecad5511c9dea924bf037b2aafc0d0..dbffed828761202c62c003b9200fd9916b16a969 100644
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
index 827ea2eb676c81cabb8051485b6e6813e9c6dca8..c098f30b07797281576d7ff533cde25309be8b61 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -628,7 +628,7 @@ struct uvc_device {
 		const void *data;
 	} async_ctrl;
 
-	struct uvc_entity *gpio_unit;
+	struct uvc_gpio gpio_unit;
 };
 
 struct uvc_fh {

-- 
2.50.0.727.gbf7dc18ff4-goog


