Return-Path: <linux-media+bounces-38098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DC4B0A790
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 17:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F44C18909FC
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53762E1722;
	Fri, 18 Jul 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dQEKioxu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667552E0404
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852559; cv=none; b=gTuTwOjPapvGRN0qSb+BIKm4cO/WbvTiM19aC/pNdd1RaIq3DBpqq3f0Ecbpli0jhRXBSVEnsRodu4mPff/u/79S0nBAXsORwLMvB9D/m8mN1aHcQDyF5Mo6nUaS4vwKwy+3v9IY98FOr9O3MaW9MQdn1/dWdw1NKZ3usCB700o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852559; c=relaxed/simple;
	bh=SILD7FqXDKzPN+v5mJfgmM2lCLPnFDjcKYYpG/ct3s0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2nLEK+pp1uXNCVsDGB+WALUJ65Vf+BHTo2CAH75qKaGy0SjHAhmaQO+qBDzjmFPadrK0SCDR25JClxasLidDlFVj+QZc/3LIBwAuf/bDUtYuLmvG57WZ66A0ULkb3eKPfjXk4B05WaTtXtBIqIXvvsHjqd85vg1zTXUl5Pqao8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dQEKioxu; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b5931037eso17027821fa.2
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752852555; x=1753457355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW6jrFQzXbLcjEcOPYhLhert2s0KBo9YRnvAtQmafP0=;
        b=dQEKioxuMUhEVjxMKVd1pE1pf6VdIUG+LptdSUJX2R9XvqQgtRoAk43/8eYaUsrzU/
         0wYiBYvDQDPo0pI9Qy7xkEtH8Sthbqe3mUDcda040WmzjrSQ0jJ4jweJXJ6xJAQ8lzrP
         qo4yYrfeBvnD82w5MK1xQQtqcR5vbPYe68Hj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852555; x=1753457355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW6jrFQzXbLcjEcOPYhLhert2s0KBo9YRnvAtQmafP0=;
        b=m5pLbiQRJhlY5DDXsRCrvuZSwZmmCTgKvGJwoymfzVJOZdgGqiKCliqc407W30o/SS
         A4+AbsMRPifPd0GrLGJaaX5psf+s5rt6/EC7ubawlKaywDfY+rjACclkk+whEqTCZKAL
         yHwS1k+iHwp5P/pPXS5k/cGP0t61vrEmlsZmYdruJFubUqrzydTg9mB/y72ozGmtMxj2
         6UPDLB1XKZLPZ7WFzx84mcfrvSpYXSX1SC55NX1jCqxqkLaD80osZBt1KW90xF9k1tia
         ZEgw104JwKaan0jTbAxVWl8ZZEfTNWv4Lj0cGXrebQKBZacNCBwYa32qnWy+M7FnIwAF
         2JhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCjR0NJUlL0litSiaBctnn+SRC1vtsK9a7HYgCHfnvP3+08yfj7gTUq+d6Wn1Y3q/tNDmPFmQvgZmPzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/kBubljXLJqEkK6PIYpCAjwlyX6zvWn3BuRkeyGV5KWdWmaaZ
	sK0nee9FBUIhla7cXej8KJf6ODqcw0fN3h1aotJr5G8V+sol/p5b0JZQIQY7ncWwBQ==
X-Gm-Gg: ASbGncvB55diIgNGzKU/MRuz9Jbzmm0VLk1tb4PzlmkcrlrJySsWgYmremDA0D0s57Y
	GvMWq/g12FxgToA3trQdJpGHoxQQghP82oGpkFloH6qjpqy67LyW6hvWlVbEiPIcYQl7xnHWRAR
	zqeOSdo4sMtFlBGnirps2ddt4+SziKI+QKI607MD/c7M0flZn93o4WZi0fPdYcffWauSc8NeLYW
	YdLZRQHVmohIMBNEgKxBqNb6TryMm5evNa48ndufuu8x4J/yuRuq0q3Un3GihaX+AO3gDY4rzQO
	gLZfabk8vBBC1zy1WgKBUxXLH05XNaj7LMUAmB5YFWJC8sCu2tg6ulW11VmBcWYv/c1komijr3Q
	MaDqdh/VyHUVWoOkOc+vKpz6dEymbU1KjmEAE5IkLZoNKc4pfiXNA+5TupTZPPJxDhNJupqW04G
	k7Lg==
X-Google-Smtp-Source: AGHT+IFzEZudqyc1gvkTsADJ1J0J6zl9peQTdQgm9si/Z20OV6QzPGlTr3dUVncj75ikKEgrskz53A==
X-Received: by 2002:a05:651c:2149:b0:32b:2fba:8b90 with SMTP id 38308e7fff4ca-3308e37166fmr22654361fa.14.1752852555208;
        Fri, 18 Jul 2025 08:29:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9d6dsm2268601fa.83.2025.07.18.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:29:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Jul 2025 15:29:14 +0000
Subject: [PATCH v5 5/5] media: uvcvideo: Remove UVC_EXT_GPIO entity
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-uvc-subdev-v5-5-a5869b071b0d@chromium.org>
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

The only implementation of this entity was the external privacy gpio,
which now does not require to emulate an entity.
Remove all the dead code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ----
 drivers/media/usb/uvc/uvc_entity.c |  1 -
 drivers/media/usb/uvc/uvcvideo.h   | 20 +++++++-------------
 include/linux/usb/uvc.h            |  3 ---
 4 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b79d276732bc80ef175ffdbaa73b6395585ff07b..d19b5a200971654161267dc755aec2a06b5fdc9e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -789,7 +789,6 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 }
 
 static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
-static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
 static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
@@ -821,9 +820,6 @@ struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
 	 * is initialized by the caller.
 	 */
 	switch (type) {
-	case UVC_EXT_GPIO_UNIT:
-		memcpy(entity->guid, uvc_gpio_guid, 16);
-		break;
 	case UVC_ITT_CAMERA:
 		memcpy(entity->guid, uvc_camera_guid, 16);
 		break;
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..94e0119746e4689a45960955a35be93a25bc16c4 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -105,7 +105,6 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_OTT_DISPLAY:
 		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		case UVC_EXTERNAL_VENDOR_SPECIFIC:
-		case UVC_EXT_GPIO_UNIT:
 		default:
 			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
 			break;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c098f30b07797281576d7ff533cde25309be8b61..b4eaca187d61b2e9f8a4af6ac6ac071145b48df2 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -39,9 +39,6 @@
 	(UVC_ENTITY_IS_TERM(entity) && \
 	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
 
-#define UVC_EXT_GPIO_UNIT		0x7ffe
-#define UVC_EXT_GPIO_UNIT_ID		0x100
-
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */
@@ -189,8 +186,7 @@ struct uvc_entity {
 
 	/*
 	 * Entities exposed by the UVC device use IDs 0-255, extra entities
-	 * implemented by the driver (such as the GPIO entity) use IDs 256 and
-	 * up.
+	 * implemented by the driver use IDs 256 and up.
 	 */
 	u16 id;
 	u16 type;
@@ -239,13 +235,6 @@ struct uvc_entity {
 			u8  *bmControls;
 			u8  *bmControlsType;
 		} extension;
-
-		struct uvc_gpio {
-			int irq;
-			bool initialized;
-			bool gpio_ready;
-			struct gpio_desc *gpio_privacy;
-		} gpio;
 	};
 
 	u8 bNrInPins;
@@ -628,7 +617,12 @@ struct uvc_device {
 		const void *data;
 	} async_ctrl;
 
-	struct uvc_gpio gpio_unit;
+	struct uvc_gpio {
+		int irq;
+		bool initialized;
+		bool gpio_ready;
+		struct gpio_desc *gpio_privacy;
+	} gpio_unit;
 };
 
 struct uvc_fh {
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index ee19e9f915b8370c333c426dc1ee4202c7b75c5b..6858675ce70dc0a872edd47531682bc415f83bd9 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -26,9 +26,6 @@
 #define UVC_GUID_UVC_SELECTOR \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
-#define UVC_GUID_EXT_GPIO_CONTROLLER \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
 #define UVC_GUID_MSXU_1_5 \
 	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
 	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}

-- 
2.50.0.727.gbf7dc18ff4-goog


