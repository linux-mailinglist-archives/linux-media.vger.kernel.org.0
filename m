Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34DC32E1CAF
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 14:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbgLWNhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 08:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgLWNhe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 08:37:34 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39A1C0619D7
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:41 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q18so18674063wrn.1
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5UDVhGAE7V5njhjBmj73xbdjwyTUWtm0VUTGNSFrvIA=;
        b=dqxdmqPoQUPR3p8cfifkew5nJuVMxuuavT1eLvSGCGSB1oSHEFsKiIz5M+chA2P0K4
         /fvsnMwlwkEHmu8nFdwuVftoZNSu2TIE9J79AiMm+3uErsa8l6bsuhlmh+ZmX5feBl2o
         WmFllxm5piMEOEQEaZUS65GtMPLrURaqtpICQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5UDVhGAE7V5njhjBmj73xbdjwyTUWtm0VUTGNSFrvIA=;
        b=RBRG7ZcHiAHXF7C63htnauMVvDVpQ9D1iNYBt0SKKXRXFKXdqs/KMCuDxsm4lL1U5O
         Ue3DjwQYVNBG7lxjPs/V4zY6umgcKMpjowt2BwxeIAE0xcxhN+xPFlu4cQKb08eOezXM
         96WbXSQ0Y2Y/srbIliZBDclbW5ghjA9EZgR5UlsL5X8L4zZBHT7/guCcodd89OIBEuvk
         QlGhhenGD4kE4ApVVSX8BhadoFnnO1M4mkfyQ3kiT3lLDpq0dGoAg5YxxcTtk7IDGP8j
         SUGj4h2aAwPNw9HhZtHRw/ke+UrawbTQbo7ZEcbBr218Z2iurlKnk/pYuCCFzrAvu9pZ
         88tg==
X-Gm-Message-State: AOAM533u2R+XTqScj9o+MI1C9bvteYFsROFMFvgv+EcgqVxZt9fUEcUo
        mxdnDHwuBAM6Yl40w/m1YuLXcQ==
X-Google-Smtp-Source: ABdhPJxN+QiLFqaaEwCejwEa45JKCttRzZgdbhrrTo7+307NxXeh0T5DoXnWd9CdzHucWBmlPRlLwg==
X-Received: by 2002:adf:ca0c:: with SMTP id o12mr29774100wrh.154.1608730540425;
        Wed, 23 Dec 2020 05:35:40 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q143sm31572247wme.28.2020.12.23.05.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 05:35:39 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 12/12] media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM
Date:   Wed, 23 Dec 2020 14:35:28 +0100
Message-Id: <20201223133528.55014-13-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201223133528.55014-1-ribalda@chromium.org>
References: <20201223133528.55014-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices can only read the privacy_pin if the device is
streaming.

This patch implement a quirk for such devices, in order to avoid invalid
reads and/or spurious events.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 55 +++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_video.c  | 27 +++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
 3 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f1f6b9cfa676..4ec14c7fb5c4 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -1478,7 +1479,7 @@ static int uvc_parse_control(struct uvc_device *dev)
  * Privacy GPIO
  */
 
-static void uvc_gpio_event(struct uvc_device *dev)
+void uvc_gpio_event(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
 	struct uvc_video_chain *chain;
@@ -1487,19 +1488,29 @@ static void uvc_gpio_event(struct uvc_device *dev)
 	if (!unit)
 		return;
 
+	mutex_lock(&unit->gpio.event_mutex);
+
 	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+	if (unit->gpio.last_event_val != new_val) {
+		/* GPIO entities are always on the first chain. */
+		chain = list_first_entry(&dev->chains,
+					 struct uvc_video_chain, list);
+		uvc_ctrl_status_event(chain, unit->controls, &new_val);
+	}
+	unit->gpio.last_event_val = new_val;
 
-	/* GPIO entities are always on the first chain. */
-	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
-	uvc_ctrl_status_event(chain, unit->controls, &new_val);
+	mutex_unlock(&unit->gpio.event_mutex);
 }
 
 static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
 			    u8 cs, void *data, u16 size)
 {
-	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
+	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1 || !dev->gpio_unit)
 		return -EINVAL;
 
+	if (!dev->gpio_unit->gpio.is_gpio_ready)
+		return -EBUSY;
+
 	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
 
 	return 0;
@@ -1519,10 +1530,31 @@ static irqreturn_t uvc_gpio_irq(int irq, void *data)
 {
 	struct uvc_device *dev = data;
 
+	if (!dev->gpio_unit->gpio.is_gpio_ready)
+		return IRQ_HANDLED;
+
 	uvc_gpio_event(dev);
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
 static int uvc_gpio_parse(struct uvc_device *dev)
 {
 	struct uvc_entity *unit;
@@ -1547,6 +1579,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 	}
 
 	unit->gpio.gpio_privacy = gpio_privacy;
+	unit->gpio.last_event_val = -1;
 	unit->gpio.irq = irq;
 	unit->gpio.bControlSize = 1;
 	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
@@ -1554,6 +1587,18 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 	unit->get_cur = uvc_gpio_get_cur;
 	unit->get_info = uvc_gpio_get_info;
 	strncpy(unit->name, "GPIO", sizeof(unit->name) - 1);
+	mutex_init(&unit->gpio.event_mutex);
+
+	/*
+	 * Note: This quirk will not match external UVC cameras,
+	 * as they will not have the corresponding ACPI GPIO entity.
+	 */
+	if (dmi_check_system(privacy_valid_during_streamon)) {
+		dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
+		unit->gpio.is_gpio_ready = false;
+	} else {
+		unit->gpio.is_gpio_ready = true;
+	}
 
 	list_add_tail(&unit->list, &dev->entities);
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f2f565281e63..b333c54d18c1 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -2083,6 +2083,29 @@ int uvc_video_init(struct uvc_streaming *stream)
 	return 0;
 }
 
+static void uvc_gpio_privacy_quirks(struct uvc_streaming *stream, bool enable)
+{
+	struct uvc_device *dev = stream->dev;
+	struct uvc_video_chain *first_chain;
+
+	if (!(dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM))
+		return;
+
+	if (!dev->gpio_unit)
+		return;
+
+	first_chain = list_first_entry(&dev->chains,
+				       struct uvc_video_chain, list);
+	/* GPIO entities are always on the first chain. */
+	if (stream->chain != first_chain)
+		return;
+
+	dev->gpio_unit->gpio.is_gpio_ready = enable;
+
+	if (enable)
+		uvc_gpio_event(stream->dev);
+}
+
 int uvc_video_start_streaming(struct uvc_streaming *stream)
 {
 	int ret;
@@ -2100,6 +2123,8 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 	if (ret < 0)
 		goto error_video;
 
+	uvc_gpio_privacy_quirks(stream, true);
+
 	return 0;
 
 error_video:
@@ -2112,6 +2137,8 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 
 void uvc_video_stop_streaming(struct uvc_streaming *stream)
 {
+	uvc_gpio_privacy_quirks(stream, false);
+
 	uvc_video_stop_transfer(stream, 1);
 
 	if (stream->intf->num_altsetting > 1) {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3273d03aca9a..a9290e2d1762 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -209,6 +209,7 @@
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
+#define UVC_QUIRK_PRIVACY_DURING_STREAM	0x00002000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -366,6 +367,9 @@ struct uvc_entity {
 			u8  *bmControls;
 			struct gpio_desc *gpio_privacy;
 			int irq;
+			struct mutex event_mutex;
+			int last_event_val;
+			bool is_gpio_ready;
 		} gpio;
 	};
 
@@ -831,6 +835,9 @@ extern const struct v4l2_file_operations uvc_fops;
 int uvc_mc_register_entities(struct uvc_video_chain *chain);
 void uvc_mc_cleanup_entity(struct uvc_entity *entity);
 
+/* Privacy gpio */
+void uvc_gpio_event(struct uvc_device *dev);
+
 /* Video */
 int uvc_video_init(struct uvc_streaming *stream);
 int uvc_video_suspend(struct uvc_streaming *stream);
-- 
2.29.2.729.g45daf8777d-goog

