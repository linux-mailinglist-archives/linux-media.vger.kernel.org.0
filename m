Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C313DD59C
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 14:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233498AbhHBM0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 08:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233557AbhHBM0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 08:26:33 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D68C06175F
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 05:26:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b13so10409742wrs.3
        for <linux-media@vger.kernel.org>; Mon, 02 Aug 2021 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kxR0X9YG0kXtm9glbe87gH0rqaiQqmAiB0pj4N0mww4=;
        b=G0ndpLEm0QIhNyM0lXdANhZI6frBKaBPGFxi/CxzvAlEgIdi5h7JSMwH2olm00d25f
         v05tylE4CKc74sY/2wF7TDL1dQfErCUjjpw9rBatnX7edKnXnLPKzwhxNnfgLqYJ5yUb
         WTB8U7CFY+IyaloUytob+Grndrayu3cLbjJFnG9K0u0B3bWyL+PCNSsFenyn7+3/F6Dy
         6hEiBfhnC7hK51X9d2OhZPrZmagUjvauWRwAFLsV9iZMyir8V4eKCpqRZwxEs1AIRaac
         Dif0HdzFIWznZVUeAdmilg1/V/tP1h/PNxwWoSZz5ziUK1u2etcOHrqgL9C4pZX25MOJ
         xa6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kxR0X9YG0kXtm9glbe87gH0rqaiQqmAiB0pj4N0mww4=;
        b=K2khRP/oOxbONLQ/7oyCrRN5GNJI8kn42b5qIL2+6VHYzcZ7C+ewJsLdshYk9TNfrC
         gjm23Jds1vWPnU91VubtO9VePNHbTYV60gGl+1vyEkRY+pnwAPLfheZ5CCBmGXXVNXdV
         iE/YbqQRGv1MIJ6yCzqr5u3xj/zbT8fSQs5AJ02SktLtkC6YWEyefWmtCr/PlykKJLcC
         hwhUUXx5ib2p2BceLkA3o94UVu0vOz4xkTLgzJPpPIRynKAA+qyXjzDF8M3g6M/muYpJ
         2wxanLaWisugPc5g59Eqs+zABYEAlv1ugsgSGwEL3VK+IXwKEkszZJBzz6YYQjS2XOpB
         8PVg==
X-Gm-Message-State: AOAM533pzGN0eT4I4q10Jx9k//P3OEvdBhT7TgRhpxwXwA9g7mx3Gmwn
        Fnqv6GHtsrz+HhoyunyRp7HdyLnhkhqI+72LkNk8Qg==
X-Google-Smtp-Source: ABdhPJyymqTb1xvW9MsPoes7HMCaj79qHHJ8AyTq7tavlP2pVsPXx0YOol7kYqgc/rDLXbrJzeH0ZA==
X-Received: by 2002:a5d:5090:: with SMTP id a16mr6691841wrt.21.1627907181816;
        Mon, 02 Aug 2021 05:26:21 -0700 (PDT)
Received: from beast-under-water.home ([95.149.132.0])
        by smtp.gmail.com with ESMTPSA id d7sm4631855wrs.39.2021.08.02.05.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 05:26:21 -0700 (PDT)
From:   Pete Hemery <hembeddedsoftware@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     kieran.bingham@ideasonboard.com,
        Pete Hemery <petehemery@hotmail.com>
Subject: [PATCH] media: gspca/sn9c20x: Add ability to control built-in webcam LEDs
Date:   Mon,  2 Aug 2021 13:26:20 +0100
Message-Id: <20210802122620.353458-1-hembeddedsoftware@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Pete Hemery <petehemery@hotmail.com>

If you image search "microdia sonix webcam", or SN9C120, you can find
 examples of the type of webcam I have. It has 6 built-in LEDs.
It's ancient (2006 maybe?) but in 2020 it was the only USB webcam I had.
It doesn't perform well, especially in low light.

The Windows XP drivers had the ability to toggle the LEDs, as well as
 "Auto" mode which would read and adjust the exposure and turn them
 on when it got "too dark", along with other nice features, like
 smoothing dead pixels, funky filters, effects and face tracking.

Watching Wireshark usbmon with the Windows driver I was able to discover
 which values are required to toggle the LEDs.

Reading ext-ctrls-flash.rst, V4L2_FLASH_LED_MODE_TORCH seems to describe
 mostly what I want it to do.
Ideally the control would be boolean/checkbox, but the existing
 implementation seems to require a menu.

This patch implements the ability to control the LEDs, attempting to
 minimise changes to external files and other webcams.

Review by anyone more familiar with the code base for unintended
 side effects would be welcome and appreciated. First kernel submission.

Signed-off-by: Pete Hemery <petehemery@hotmail.com>
---
 drivers/media/usb/gspca/sn9c20x.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sn9c20x.c b/drivers/media/usb/gspca/sn9c20x.c
index bfd194c61819..da916127a896 100644
--- a/drivers/media/usb/gspca/sn9c20x.c
+++ b/drivers/media/usb/gspca/sn9c20x.c
@@ -50,6 +50,7 @@ MODULE_LICENSE("GPL");
 #define HAS_NO_BUTTON	0x1
 #define LED_REVERSE	0x2 /* some cameras unset gpio to turn on leds */
 #define FLIP_DETECT	0x4
+#define HAS_LED_TORCH	0x8
 
 /* specific webcam descriptor */
 struct sd {
@@ -77,6 +78,8 @@ struct sd {
 	};
 	struct v4l2_ctrl *jpegqual;
 
+	struct v4l2_ctrl *led_mode;
+
 	struct work_struct work;
 
 	u32 pktsz;			/* (used by pkt_scan) */
@@ -1533,6 +1536,12 @@ static void set_gain(struct gspca_dev *gspca_dev, s32 g)
 	i2c_w(gspca_dev, gain);
 }
 
+static void set_led_mode(struct gspca_dev *gspca_dev, s32 val)
+{
+	reg_w1(gspca_dev, 0x1007, 0x60);
+	reg_w1(gspca_dev, 0x1006, val ? 0x40 : 0x00);
+}
+
 static void set_quality(struct gspca_dev *gspca_dev, s32 val)
 {
 	struct sd *sd = (struct sd *) gspca_dev;
@@ -1699,6 +1708,9 @@ static int sd_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
 		set_quality(gspca_dev, ctrl->val);
 		break;
+	case V4L2_CID_FLASH_LED_MODE:
+		set_led_mode(gspca_dev, ctrl->val);
+		break;
 	}
 	return gspca_dev->usb_err;
 }
@@ -1757,6 +1769,12 @@ static int sd_init_controls(struct gspca_dev *gspca_dev)
 
 	sd->jpegqual = v4l2_ctrl_new_std(hdl, &sd_ctrl_ops,
 			V4L2_CID_JPEG_COMPRESSION_QUALITY, 50, 90, 1, 80);
+
+	if (sd->flags & HAS_LED_TORCH)
+		sd->led_mode = v4l2_ctrl_new_std_menu(hdl, &sd_ctrl_ops,
+				V4L2_CID_FLASH_LED_MODE, V4L2_FLASH_LED_MODE_TORCH,
+				~0x5, V4L2_FLASH_LED_MODE_NONE);
+
 	if (hdl->error) {
 		pr_err("Could not initialize controls\n");
 		return hdl->error;
@@ -2048,6 +2066,8 @@ static int sd_start(struct gspca_dev *gspca_dev)
 		sd->pktsz = sd->npkt = 0;
 		sd->nchg = 0;
 	}
+	if (sd->led_mode)
+		v4l2_ctrl_s_ctrl(sd->led_mode, 0);
 
 	return gspca_dev->usb_err;
 }
@@ -2325,7 +2345,7 @@ static const struct sd_desc sd_desc = {
 
 static const struct usb_device_id device_table[] = {
 	{USB_DEVICE(0x0c45, 0x6240), SN9C20X(MT9M001, 0x5d, 0)},
-	{USB_DEVICE(0x0c45, 0x6242), SN9C20X(MT9M111, 0x5d, 0)},
+	{USB_DEVICE(0x0c45, 0x6242), SN9C20X(MT9M111, 0x5d, HAS_LED_TORCH)},
 	{USB_DEVICE(0x0c45, 0x6248), SN9C20X(OV9655, 0x30, 0)},
 	{USB_DEVICE(0x0c45, 0x624c), SN9C20X(MT9M112, 0x5d, 0)},
 	{USB_DEVICE(0x0c45, 0x624e), SN9C20X(SOI968, 0x30, LED_REVERSE)},
-- 
2.25.1

