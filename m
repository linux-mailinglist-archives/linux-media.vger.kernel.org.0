Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881012DB07E
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 16:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730153AbgLOPt3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 10:49:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730417AbgLOPqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 10:46:36 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB40C0611BB
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 07:45:01 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a6so17288475wmc.2
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/lEo1sURN+Xzzvd/ZdibJhpngvkvztGXIx39CJjBFoo=;
        b=N9UzK3xRboarfmoaqoKuN1CIM+VKZ9ZePZpeasHhEFgyPQWRM4Xjtr/4TRTbChM3jJ
         Wb2BiLt5RyraE4BBUj6eeJzykQtPCWy+a6AacaQ/WYFvdjGCPOwaR1FNG69qTW4FDntx
         JLz+DQDasKgPh2KXjazzu2BDwOViK8y9sCz7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/lEo1sURN+Xzzvd/ZdibJhpngvkvztGXIx39CJjBFoo=;
        b=OZfP0nJBCf48ufHuFdBapMSOkdXoCNj6lqgtk1H39SjIIQieZgYvzTTw/oHxv2/N6R
         yCHGO0hIQVg1aJd27OW2BwRw17oast5VDkIfh//dwSYasWBQeiACqCLIPqkV0iTYJbuh
         A08LlwEo7SnyMeJroSS2xC2Op7oIb9nbK91E7O5s/koEhUqWV1GDcs3bwfpo8W01lc5l
         s6V9tXeo5B01M3eGbeyijlhsy3s1Gl+5hMHNpVDNkT0YDg5EVWt6ulvWfrCUU2psvpsS
         VHd6Jjx6vfaQ30GD2Wq0/LiCAIINoCmnJGsGDQSwmmOHzsmcs0BBJV+bRFk9V1QVWjZp
         qPHQ==
X-Gm-Message-State: AOAM530TyplZzdo98i0nC1nbeJrCZhaaD8ULZslMdTltPFa1Nvf6HSLX
        /x3EOKUBTfMp8UsvRD8mIoJugA==
X-Google-Smtp-Source: ABdhPJxlT0NjD6rKxQ0ZIf3AWp81FVcwSI2XckoVC3uBW/ff0tEOEGmkIaHQxSPpsqrWBwqh7huyaQ==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr33366735wmh.25.1608047100650;
        Tue, 15 Dec 2020 07:45:00 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id 125sm38204141wmc.27.2020.12.15.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:45:00 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 9/9] media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM
Date:   Tue, 15 Dec 2020 16:44:39 +0100
Message-Id: <20201215154439.69062-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201215154439.69062-1-ribalda@chromium.org>
References: <20201215154439.69062-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices, can only read the privacy_pin if the device is
streaming.

This patch implement a quirk for such devices, in order to avoid invalid
reads and/or spurious events.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 97 ++++++++++++++++++++++++++----
 drivers/media/usb/uvc/uvc_queue.c  |  3 +
 drivers/media/usb/uvc/uvcvideo.h   |  6 ++
 3 files changed, 94 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e49491250e87..61313019e226 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -1471,13 +1472,39 @@ static int uvc_parse_control(struct uvc_device *dev)
 	return 0;
 }
 
+static bool uvc_ext_gpio_is_streaming(struct uvc_device *dev)
+{
+	struct uvc_streaming *streaming;
+
+	list_for_each_entry(streaming, &dev->streams, list) {
+		if (uvc_queue_streaming(&streaming->queue))
+			return true;
+	}
+
+	return false;
+}
+
+/* Update the cached value and return true if it has changed */
+static bool uvc_gpio_update_value(struct uvc_entity *unit, u8 *new_val)
+{
+	*new_val = gpiod_get_value(unit->gpio.gpio_privacy);
+
+	return atomic_xchg(&unit->gpio.gpio_privacy_value, *new_val) !=
+								      *new_val;
+}
+
 static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
 			    u8 cs, void *data, u16 size)
 {
 	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
 		return -EINVAL;
 
-	*(uint8_t *)data = gpiod_get_value(entity->gpio.gpio_privacy);
+	if ((dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM) &&
+	    !uvc_ext_gpio_is_streaming(dev))
+		return -EBUSY;
+
+	uvc_gpio_update_value(entity, (uint8_t *)data);
+
 	return 0;
 }
 
@@ -1491,26 +1518,69 @@ static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
 	return 0;
 }
 
-static irqreturn_t uvc_privacy_gpio_irq(int irq, void *data)
+static struct uvc_entity *uvc_find_ext_gpio_unit(struct uvc_device *dev)
 {
-	struct uvc_device *dev = data;
-	struct uvc_video_chain *chain;
 	struct uvc_entity *unit;
-	u8 value;
 
-	/* GPIO entities are always on the first chain */
-	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
 	list_for_each_entry(unit, &dev->entities, list) {
-		if (UVC_ENTITY_TYPE(unit) != UVC_EXT_GPIO_UNIT)
-			continue;
-		value = gpiod_get_value(unit->gpio.gpio_privacy);
-		uvc_ctrl_status_event(NULL, chain, unit->controls, &value);
-		return IRQ_HANDLED;
+		if (UVC_ENTITY_TYPE(unit) == UVC_EXT_GPIO_UNIT)
+			return unit;
 	}
 
+	return unit;
+}
+
+void uvc_privacy_gpio_event(struct uvc_device *dev)
+{
+	struct uvc_entity *unit;
+	struct uvc_video_chain *chain;
+	u8 new_value;
+
+	unit = uvc_find_ext_gpio_unit(dev);
+	if (WARN_ONCE(!unit, "Unable to find entity ext_gpio_unit"))
+		return;
+
+	if (!uvc_gpio_update_value(unit, &new_value))
+		return;
+
+	/* GPIO entities are always on the first chain */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	uvc_ctrl_status_event(NULL, chain, unit->controls, &new_value);
+}
+
+static irqreturn_t uvc_privacy_gpio_irq(int irq, void *data)
+{
+	struct uvc_device *dev = data;
+
+	/* Ignore privacy events during streamoff */
+	if (dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
+		if (!uvc_ext_gpio_is_streaming(dev))
+			return IRQ_HANDLED;
+
+	uvc_privacy_gpio_event(dev);
+
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
+
 static int uvc_parse_gpio(struct uvc_device *dev)
 {
 	struct uvc_entity *unit;
@@ -1545,6 +1615,9 @@ static int uvc_parse_gpio(struct uvc_device *dev)
 	if (irq == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
+	if (dmi_check_system(privacy_valid_during_streamon))
+		dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
+
 	if (irq < 0)
 		return 0;
 
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index cd60c6c1749e..e800d491303f 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -337,9 +337,12 @@ int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
 int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
 {
 	int ret;
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
 
 	mutex_lock(&queue->mutex);
 	ret = vb2_streamon(&queue->queue, type);
+	if (stream->dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
+		uvc_privacy_gpio_event(stream->dev);
 	mutex_unlock(&queue->mutex);
 
 	return ret;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 2b5ba4b02d3a..2a95b3ed3ea8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -6,6 +6,7 @@
 #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
 #endif /* __KERNEL__ */
 
+#include <linux/atomic.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/poll.h>
@@ -209,6 +210,7 @@
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
+#define UVC_QUIRK_PRIVACY_DURING_STREAM	0x00002000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -359,6 +361,7 @@ struct uvc_entity {
 			u8  bControlSize;
 			u8  *bmControls;
 			struct gpio_desc *gpio_privacy;
+			atomic_t  gpio_privacy_value;
 		} gpio;
 	};
 
@@ -815,6 +818,9 @@ extern const struct v4l2_file_operations uvc_fops;
 int uvc_mc_register_entities(struct uvc_video_chain *chain);
 void uvc_mc_cleanup_entity(struct uvc_entity *entity);
 
+/* Privacy gpio */
+void uvc_privacy_gpio_event(struct uvc_device *dev);
+
 /* Video */
 int uvc_video_init(struct uvc_streaming *stream);
 int uvc_video_suspend(struct uvc_streaming *stream);
-- 
2.29.2.684.gfbc64c5ab5-goog

