Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6EA94A9D64
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 18:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356896AbiBDRHt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 12:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbiBDRHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 12:07:49 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBC4C06173D
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 09:07:48 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id p15so21266242ejc.7
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSQO/B2pXj/5Se04MXFeD+50vb9mnHw6bljwLcxZ4y0=;
        b=mL7qqRokkKO2UqVoOFAn4R3/KpvyVLNXqVNxNtzD5FavNZpaxr4aZekK3NIJkrwAYJ
         G4clsh0IPACaf4HA3DiVUnfeD7yg1G13FrlONnfPX5pHMpFnEUtWmrZLlB+IZIb+LNIH
         Ewkzadrza5bwAqwP5IumX2G0j87aSw6YcyQpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSQO/B2pXj/5Se04MXFeD+50vb9mnHw6bljwLcxZ4y0=;
        b=YN3r/pE5JgQxcrZfOv0fr5svG3V8uozcPOotfWwvsQyh5Qq6p1DjqoQoyEfw2+2nA8
         0DCvEsEZm+X0YCjYCY4VG2GSAkCHqrUIwsTTP8T9yH/CjmS4ZwqloEa4rFGiDri6klsf
         hgjYCXVfs3FkAqVk1VbhqdjVMj38ySO/HAOMSFLsyWL2R8NxiMsk7dA6etUtP7pr7pHV
         lyAbhtLr/6243+vPTq+Fc1Zme0vJWGNp9NWavnyRW7666fPl0saLoi/96nCfFt7MhMYW
         sw5d7mYL8Lz9i8CBqajpNCHsXhJjsQ1IgpN+2A0BPuxHwBzyj8tKPP5frctqh/LuKEAx
         jYLA==
X-Gm-Message-State: AOAM530jIJeN5qskY8yorTEThfroyaDPn3PcUL4EvhEWR1shFr674c/K
        rTOy5ljNcxZ0TP4krgvJbOytjkd6okWrPw==
X-Google-Smtp-Source: ABdhPJx1oepq/dn2zEkY1XQ96XNmLR9bQMAUh5i2QBt0soxm9hrLmpsHQ6txZIKaHylBQQsFZWCGhg==
X-Received: by 2002:a17:907:1c8a:: with SMTP id nb10mr3369595ejc.273.1643994467545;
        Fri, 04 Feb 2022 09:07:47 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id gv36sm840753ejc.94.2022.02.04.09.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:07:46 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 1/3] media: uvcvideo: Only create input devs if hw supports it
Date:   Fri,  4 Feb 2022 18:07:43 +0100
Message-Id: <20220204170745.1269482-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Examine the stream headers to figure out if the device has a button and
can be used as an input.

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

