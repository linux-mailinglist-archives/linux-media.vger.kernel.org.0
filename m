Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154FC498ADE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 20:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344599AbiAXTHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 14:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346231AbiAXTFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 14:05:13 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D56C0613E6
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:00:16 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id m4so24149944ejb.9
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nT/ZnOHsKJlxYz4RqSgPwsd6TUWvpfzybqxkqHLwAN4=;
        b=k9IWBrqvExqU3irvTU/m+erA5ybtTbL59pFHFgYqkP57ohTZ/v3GlH9Tu7iUlhg6hG
         a/TNhyk/+HHdmMH/HYBmjBFQuKCdgJCKebYkoDz3tOkFFaZye31lrvmlV+MEUvZuBgug
         PfEsTeO1eGfHVbT+6Gl68gmAEz54KK/oow/vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nT/ZnOHsKJlxYz4RqSgPwsd6TUWvpfzybqxkqHLwAN4=;
        b=MoYwx+EshTB3+2Qwk3MKJUdpTsRWOfo4/ppTgrLRuP8+St9PVoPJqKmFQ8k6iQfPDJ
         l9/c0WWbFJsXIKp96jXnJqLpWz0mhH3htvc4wIlgzlaYLE9Skf5IXtN9TWlmjn71XyIZ
         uzNZjg8LyXKdqOyA3rP0L7IBrAdO8VGd43fN0HpyfGqKh9TcLbex9LbRBjPAhNYVBV70
         NWxLLd/N4WY225XD1hcuLzPMxYeS3HqsBiX/OIFxfg7+mdQrLyM8WF3ew/r9piRZHlwi
         H4IxiaZJ4dTkVuE4QbnLnkaxL55JR1LS6l1N74ehJtTdjnQ+9CsTFP2I6ufPPcqFalK1
         3+mw==
X-Gm-Message-State: AOAM532Coj0BZuzKzwVmtNarePm2dkO5Ny2phbVPJpMvkvMjuOvvI5DW
        1lLCFdY8SkxC6O5A+IgVOtbzsw==
X-Google-Smtp-Source: ABdhPJwYGNun9Hzk3k6pwp4tGzmkEh86jeWwUHDIfzQx2wPsTL5GWj1R20Vl0XN/0YmqK56g5Z7M/w==
X-Received: by 2002:a17:906:4acd:: with SMTP id u13mr13618410ejt.563.1643050814994;
        Mon, 24 Jan 2022 11:00:14 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id by22sm5221518ejb.84.2022.01.24.11.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 11:00:14 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 1/2] media: uvcvideo: Only create input devs if hw supports it
Date:   Mon, 24 Jan 2022 20:00:12 +0100
Message-Id: <20220124190013.221601-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Examine the stream headers to figure out if the device has a GPIO and
can be used as an input.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 753c8226db70..3ef0b281ffc5 100644
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
+	 * The device has GPIO button event if both bTriggerSupport and
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
2.35.0.rc0.227.g00780c9af4-goog

