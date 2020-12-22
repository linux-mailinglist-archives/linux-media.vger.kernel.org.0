Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8582E1086
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 00:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgLVXG0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 18:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728231AbgLVXG0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 18:06:26 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10136C0611E4
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:56 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w5so16629909wrm.11
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HWE0LgXhN1ePEIPaVW+b4dVCf4hrX3sC2e2KGYLbmeI=;
        b=f4OtuKSfryieclg3hF3imYpgAYBG6WAHVnGwChPMQAErbUhwT8rfU5O+no7ZYxo8ta
         01t5dRwsf1VQGbxwBA7SIjKy2hLxIrM/EJdyDWwpI9NAU21eGG8KC9TsEFoWv+kXvfMI
         fK8Go8u/ZJEE/g0b2X2cQevjG+Fq9JTTLNXXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HWE0LgXhN1ePEIPaVW+b4dVCf4hrX3sC2e2KGYLbmeI=;
        b=blR1nkoQcQUWzQpTiDlWx4SRouSJBdVSxVaS4ZvpaD+nTNR1PQGJOnUQM8LNmAJrsi
         o8Vewt3AZoyOvHSWCExCwubGZ1vBRjbavGaw+x5MBXuhSmHx1nuhQ48udog443N0kqXl
         hPJZt8tx3LzT3aT9Y5tHNoo6PZuGJoy2ywS4zwCAcMcf3RAx1W+LkUzsbsCMwM0saDzJ
         DnPWz2G3TFZeKNBtViuKBlhv+917JrnAwlc1CDbh0ttNRElseWuA+TkGucKxrux8ulkx
         sUjR+HbbYwdLh2UGOYH/fchC1jkCnE1nvulA5pceoKYOBDd8afszMxLi5eD7K59d0I3H
         vo3g==
X-Gm-Message-State: AOAM533muddj8reIbc6fwKwmc/A9UE/Q7o0asUZ5qpvDhRwhb9tqTA0i
        B+hZedzKi/hsP9Z6Cm15Eh3zTA==
X-Google-Smtp-Source: ABdhPJyNWj7M0xxmyrekS3BabwMSjyxAOJWTcBhq1hPdGB7YU0H9hiUVArZmXnPakpaMm+i048Z8/g==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr26553013wrl.311.1608678294738;
        Tue, 22 Dec 2020 15:04:54 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r16sm34463401wrx.36.2020.12.22.15.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 15:04:54 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 08/11] media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM
Date:   Wed, 23 Dec 2020 00:04:43 +0100
Message-Id: <20201222230446.1027916-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201222230446.1027916-1-ribalda@chromium.org>
References: <20201222230446.1027916-1-ribalda@chromium.org>
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
 drivers/media/usb/uvc/uvc_driver.c | 37 ++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c  | 27 ++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  5 ++++
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 5873237bbfa8..15f7ec7d7e9b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -1473,7 +1474,7 @@ static int uvc_parse_control(struct uvc_device *dev)
  * Privacy GPIO
  */
 
-static u8 uvc_gpio_update_value(struct uvc_device *dev)
+u8 uvc_gpio_update_value(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
 	struct uvc_video_chain *chain;
@@ -1498,6 +1499,9 @@ static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
 	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1 || !dev->gpio_unit)
 		return -EINVAL;
 
+	if (!dev->gpio_unit->gpio.is_gpio_ready)
+		return -EBUSY;
+
 	*(u8 *)data = uvc_gpio_update_value(dev);
 
 	return 0;
@@ -1517,13 +1521,31 @@ static irqreturn_t uvc_gpio_irq(int irq, void *data)
 {
 	struct uvc_device *dev = data;
 
-	if (!dev->gpio_unit)
+	if (!dev->gpio_unit || !dev->gpio_unit->gpio.is_gpio_ready)
 		return IRQ_HANDLED;
 
 	uvc_gpio_update_value(dev);
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
@@ -1557,6 +1579,17 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 	unit->get_info = uvc_gpio_get_info;
 	strncpy(unit->name, "GPIO", sizeof(unit->name) - 1);
 
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
+
 	list_add_tail(&unit->list, &dev->entities);
 
 	dev->gpio_unit = unit;
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a6a441d92b94..03d6ed7fc8ed 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -2077,6 +2077,29 @@ int uvc_video_init(struct uvc_streaming *stream)
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
+		uvc_gpio_update_value(stream->dev);
+}
+
 int uvc_video_start_streaming(struct uvc_streaming *stream)
 {
 	int ret;
@@ -2094,6 +2117,8 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 	if (ret < 0)
 		goto error_video;
 
+	uvc_gpio_privacy_quirks(stream, true);
+
 	return 0;
 
 error_video:
@@ -2106,6 +2131,8 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 
 void uvc_video_stop_streaming(struct uvc_streaming *stream)
 {
+	uvc_gpio_privacy_quirks(stream, false);
+
 	uvc_video_stop_transfer(stream, 1);
 
 	if (stream->intf->num_altsetting > 1) {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 132513a66ee5..58422c99f05f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -209,6 +209,7 @@
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
+#define UVC_QUIRK_PRIVACY_DURING_STREAM	0x00002000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -367,6 +368,7 @@ struct uvc_entity {
 			struct gpio_desc *gpio_privacy;
 			int irq;
 			atomic_t gpio_privacy_value;
+			bool is_gpio_ready;
 		} gpio;
 	};
 
@@ -822,6 +824,9 @@ extern const struct v4l2_file_operations uvc_fops;
 int uvc_mc_register_entities(struct uvc_video_chain *chain);
 void uvc_mc_cleanup_entity(struct uvc_entity *entity);
 
+/* Privacy gpio */
+u8 uvc_gpio_update_value(struct uvc_device *dev);
+
 /* Video */
 int uvc_video_init(struct uvc_streaming *stream);
 int uvc_video_suspend(struct uvc_streaming *stream);
-- 
2.29.2.729.g45daf8777d-goog

