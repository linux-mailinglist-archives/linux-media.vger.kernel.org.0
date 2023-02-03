Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C888F68A2C9
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjBCTSf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbjBCTSe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:34 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7D470D58
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:32 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so6723651wma.1
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+tArQniRx14r7yZucrdT8fDuMw1hl5b1bA0Bop/kfs=;
        b=rXQ+HqLSAHgdTyoTyzAIRGN3QBiXasGVNpim/TTzwIjaCxV1oJU0HEoVM2h+mVkUAD
         LZG935MprevD0xaexjLE2lM+owZGKE8soUNbnBP2dVYYQI76Q7PnUZBnablSWSxDTgZQ
         /i7lq0FmeBAKGlFq37baa5zrYULYJD83NGqVXTtemxnaixUt+YjfCXHSBecEw0wE5T0n
         6QbhuMnILmYYLXqY8quR2m8KnTIuH5SoebBjXdxR3WuwtFx1RcoIbynk4Efj6XTjNKKx
         8W/dfFBCgOCHz+/BS8O2dJJN+I0w6x/wHZwGjn2mj/bdUIuq64fOGiDFwYhwcoh5rjir
         sPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+tArQniRx14r7yZucrdT8fDuMw1hl5b1bA0Bop/kfs=;
        b=TY7VHnwiW2LX7KhfnLf4cFmWKPpkOts955fs7ah8xHdoXiZWQKRfFk6WpQtTEWnLZT
         7tc7qXtdKwKVeIAQukFAzFMmku92Wyo6sziT1wCtPWtGRaJ5MslKIMRTlglTUsG8CyUz
         QVPHd4xXEIPyusiEintcYdXpICXzixTSDj4e8I2Yo6Ia3gWdd6M4gYvjKOGFxWMMtI2x
         xNYOWHA8CcyUeidDUsUzJRqRrh8gYym/l3IXwTTIpjipHhJpptBj584zIB5sWKB9DUUI
         NfmqRSzt7TqfNyT5RKd4FKIiE3nX/VsVprk+sO8VgVT2+JdCK57oKXIkIOu7y32ALeRa
         kB+g==
X-Gm-Message-State: AO0yUKW4bgGTTboH8ouDbVCwTnpD/5ibgfTEOpw7YmmGgbvmMQzFGVx6
        y+ctRrjkmtHfT/l+JcxlpSgwr9TSrlxJuciY
X-Google-Smtp-Source: AK7set8Scy9tPpUQmTl+YbaK9jOxDr/wXlDvwN4X2wiCM/MWfGzNNuOqfmBQN7bPUaSP1kkSQDYJ1A==
X-Received: by 2002:a05:600c:3b1c:b0:3dc:443e:420e with SMTP id m28-20020a05600c3b1c00b003dc443e420emr10304799wms.2.1675451911482;
        Fri, 03 Feb 2023 11:18:31 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:31 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 04/13] media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
Date:   Fri,  3 Feb 2023 19:18:02 +0000
Message-Id: <20230203191811.947697-5-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The datasheet lists the link frequency changes between
1080p and 720p modes. This is correct that the link frequency
changes as measured on an oscilloscope.

Link frequency is not necessarily the same as pixel rate.

The datasheet gives standard configurations for 1080p and 720p
modes at a number of frame rates.
Looking at the 1080p mode it gives:
HMAX = 0x898 = 2200
VMAX = 0x465 = 1125
2200 * 1125 * 60fps = 148.5MPix/s

Looking at the 720p mode it gives:
HMAX = 0xce4 = 3300
VMAX = 0x2ee = 750
3300 * 750 * 60fps = 148.5Mpix/s

This driver currently scales the pixel rate proportionally to the
link frequency, however the above shows that this is not the
correct thing to do, and currently all frame rate and exposure
calculations give incorrect results.

Correctly report the pixel rate as being 148.5MPix/s under any
mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 22faa9b54810..e83c458c7cf8 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -107,6 +107,8 @@
 
 #define IMX290_VMAX_DEFAULT				1125
 
+#define IMX290_PIXEL_RATE				148500000
+
 /*
  * The IMX290 pixel array is organized as follows:
  *
@@ -205,7 +207,6 @@ struct imx290 {
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *link_freq;
-	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 };
@@ -669,15 +670,8 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 {
 	unsigned int hblank = mode->hmax - mode->width;
 	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
-	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
-	u64 pixel_rate;
-
-	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = link_freq * 2 * imx290->nlanes;
-	do_div(pixel_rate, imx290_format_info(format->code)->bpp);
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
-	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
 
 	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
 	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
@@ -727,9 +721,9 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	if (imx290->link_freq)
 		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE,
-					       1, INT_MAX, 1, 1);
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  IMX290_PIXEL_RATE, IMX290_PIXEL_RATE, 1,
+			  IMX290_PIXEL_RATE);
 
 	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.34.1

