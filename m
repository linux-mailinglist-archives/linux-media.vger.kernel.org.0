Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023C32DFF8C
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgLUSUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgLUSUQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:20:16 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E01C0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:19:36 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 3so11842421wmg.4
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dw71v3CL2kM3raQJeeszspBPFX2F58JASjvYTnrWOCM=;
        b=XOv3mP7zUK4jneYBbu/i4GBH/kEqUFHETXAhDBUJrLmK6HUbonxcaTAu8F6Ohru5UX
         rAwsaNimKdp05wcbnmOu2XsGfPhqgup77quWUSS7RUvUrIC5KaJoj1wTz3ChGWOBMAyZ
         nHwzAKxwOKTYmMRmeebWMQueyrhZ3SqPLyluU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dw71v3CL2kM3raQJeeszspBPFX2F58JASjvYTnrWOCM=;
        b=IaXPbRzRttU8vTZKdTCn35N9PgVHyWUTDW4msUjdTjWnRKk3TXourQAMyatlT96hLk
         Nl9mYOzyiJK2O9tdzjj/u64Y/vj10kLk20KReIxd5EupwizYbbBW4tjUTw9ntzzyFBI8
         O6wWEOYkwCwUAIGuJA/AVF+9QuyCl0zEpyrbHKZ9YHmrpy5TuEqEUbFnKFxZq/ig3RsS
         EviEWSfv1MijH+VdYvIXE3mHDVWRRtUxsMojIJRXnMUc17illqXHdV01p+IYjomZMBHe
         lTzqirImYVktULeemm3I+tWxHDGdppRVAoLy/Dfibuckz0b4kME/bDIchetU5lhSYJww
         x4+A==
X-Gm-Message-State: AOAM533axUA0kNDn/TdAY1XqNldii6TLiSvU8VkvAWFzPKsrHbqoFoPp
        9zK0CSApGVp2Jf9ZIZM3YQjj2wqHOUBVpkBq5hk=
X-Google-Smtp-Source: ABdhPJydw13iQ9B5q81Px8W3R+OZXO2wPlxvontCOvnnKaWO5tOhYWFAenan2mUZOZgLkc6o+nEe5Q==
X-Received: by 2002:a1c:7f8c:: with SMTP id a134mr15711577wmd.184.1608569308687;
        Mon, 21 Dec 2020 08:48:28 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:28 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 09/12] media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM
Date:   Mon, 21 Dec 2020 17:48:16 +0100
Message-Id: <20201221164819.792019-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
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
 drivers/media/usb/uvc/uvc_driver.c | 57 ++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_queue.c  |  3 ++
 drivers/media/usb/uvc/uvcvideo.h   |  4 +++
 3 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 72516101fdd0..7af37d4bd60a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -1472,6 +1473,17 @@ static int uvc_parse_control(struct uvc_device *dev)
 /* -----------------------------------------------------------------------------
  * Privacy GPIO
  */
+static bool uvc_gpio_is_streaming(struct uvc_device *dev)
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
 
 
 static u8 uvc_gpio_update_value(struct uvc_device *dev,
@@ -1499,7 +1511,12 @@ static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
 	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
 		return -EINVAL;
 
+	if ((dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM) &&
+	    !uvc_gpio_is_streaming(dev))
+		return -EBUSY;
+
 	*(uint8_t *)data = uvc_gpio_update_value(dev, entity);
+
 	return 0;
 }
 
@@ -1528,19 +1545,50 @@ static struct uvc_entity *uvc_gpio_find_entity(struct uvc_device *dev)
 	return NULL;
 }
 
-static irqreturn_t uvc_gpio_irq(int irq, void *data)
+void uvc_privacy_gpio_event(struct uvc_device *dev)
 {
-	struct uvc_device *dev = data;
 	struct uvc_entity *unit;
 
+
 	unit = uvc_gpio_find_entity(dev);
 	if (!unit)
-		return IRQ_HANDLED;
+		return;
 
 	uvc_gpio_update_value(dev, unit);
+}
+
+static irqreturn_t uvc_gpio_irq(int irq, void *data)
+{
+	struct uvc_device *dev = data;
+
+	/* Ignore privacy events during streamoff */
+	if (dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
+		if (!uvc_gpio_is_streaming(dev))
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
 static int uvc_gpio_parse(struct uvc_device *dev)
 {
 	struct uvc_entity *unit;
@@ -1577,6 +1625,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 
 	list_add_tail(&unit->list, &dev->entities);
 
+	if (dmi_check_system(privacy_valid_during_streamon))
+		dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
+
 	return 0;
 }
 
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
index 079a407ebba5..32c1ba246d97 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -209,6 +209,7 @@
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
+#define UVC_QUIRK_PRIVACY_DURING_STREAM	0x00002000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -826,6 +827,9 @@ extern const struct v4l2_file_operations uvc_fops;
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

