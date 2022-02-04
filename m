Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86ACC4A9D6D
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 18:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376742AbiBDRKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 12:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242365AbiBDRKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 12:10:48 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BF5C06173D
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 09:10:48 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id p15so21286263ejc.7
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 09:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GfG7+eN0faSdt04jThM25jndsLCbneWwcnw4yLBWIqQ=;
        b=lvlF4tompMjGDck07Ya1IW8CblQ6XLlwXGuG1zjJNgB3sGDUMxrTF6Oo7qv5flpZYI
         WuMZGdoa6H6xpDrFDdlL6Rl+CBNE1FgrujNNGuSIDMIr5jddsf2jQdv1e2RqW0D7r5lk
         vlxib7CAHllmdJofWMo+mBj+MbbZN8Y32lQtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GfG7+eN0faSdt04jThM25jndsLCbneWwcnw4yLBWIqQ=;
        b=cuxrRmLE3bkS6iIvpn2eWKSLlWW5zDZtceZzWSzZbov++PuJkw6piYb2lm9Jc+iptr
         3WEAQ0THmA741YjDJdxbfYTzskA7QWv4xGU8NWbwik8QcSUEhdNBAOIapQyZJcZnk0AF
         LoGPD3Rm2p7mkAY4IV3X6itnKSQdBitr45G34C3XU0MrIKnve2K1l9GZmQkjZ663QUIO
         Uu5IsfUrNg5hsr6BDEARfKkObvXt+C071Rpm8hWBT9AWAEdrjTDTZ+3uHGBAU6CMYiF5
         HrO9v0dicWrqQxe2FC4wGGU/6b7i0PchNwriVF50IFe90qW8kx9YIMwJVYh1GAr1Ak52
         00fQ==
X-Gm-Message-State: AOAM530qxKaGubH20kSIyZo13a3U9KBRZsf1Y3hMq3sq51DlAP7QWrnW
        Vj5NW1aLQNNvaM8hfLGfFTrWkJcNYvjJlQ==
X-Google-Smtp-Source: ABdhPJzA0w6RBfgDcLTUJ8fdt3wN0XtIOlUmzxaZ8b/P8uwqCjsetYjZc4w7r67y6M5R2ZHzNXV/PA==
X-Received: by 2002:a17:907:16a3:: with SMTP id hc35mr3550585ejc.299.1643994646560;
        Fri, 04 Feb 2022 09:10:46 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id bf21sm1103800edb.2.2022.02.04.09.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:10:46 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 1/3] media: uvcvideo: Only create input devs if hw supports it
Date:   Fri,  4 Feb 2022 18:10:41 +0100
Message-Id: <20220204171043.1271215-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Examine the stream headers to figure out if the device has a button and
can be used as an input.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 753c8226db70..6149bfafd1cc 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -18,11 +18,34 @@
  * Input device
  */
 #ifdef CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
+
+static bool uvc_input_has_button(struct uvc_device *dev)
+{
+	struct uvc_streaming *stream;
+
+	/*
+	 * The device has button events if both bTriggerSupport and
+	 * bTriggerUsage are one. Otherwise the camera button does not
+	 * exist or is handled automatically by the camera without host
+	 * driver or client application intervention.
+	 */
+	list_for_each_entry(stream, &dev->streams, list) {
+		if (stream->header.bTriggerSupport == 1 &&
+		    stream->header.bTriggerUsage == 1)
+			return true;
+	}
+
+	return false;
+}
+
 static int uvc_input_init(struct uvc_device *dev)
 {
 	struct input_dev *input;
 	int ret;
 
+	if (!uvc_input_has_button(dev))
+		return 0;
+
 	input = input_allocate_device();
 	if (input == NULL)
 		return -ENOMEM;
-- 
2.35.0.263.gb82422642f-goog

