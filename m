Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4DC79EA3F
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241196AbjIMN44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241195AbjIMN4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B0C1BC8
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 678B216B7;
        Wed, 13 Sep 2023 15:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613318;
        bh=ZWeosycwC4hdK8MzL57o9CmSuXQ/twykxGrVygkql0M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=okELuNG/HWxFLHkfEnft47VwOqgu3d8ZpOQJwdTHCV0XAsiEs0vtR+KCXFWplCLmk
         5YXrxK96SYGG0aFQMzOeA5mmMUtf9dMSNfW0QrhquiCDZ+hUt2rV1921/RrZyj4xwP
         5gX7e84dvOJVIPj2fBLUdCO8qYReQ7kUdipexot8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 18/20] media: i2c: imx219: Calculate crop rectangle dynamically
Date:   Wed, 13 Sep 2023 16:56:36 +0300
Message-ID: <20230913135638.26277-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calculate the crop rectangle size and location dynamically when setting
the format, instead of storing it in the imx219_mode structure. This
removes duplicated information from the mode, to guarantee consistency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Handle horizontal and vertical binning separately
---
 drivers/media/i2c/imx219.c | 45 +++++++++++++-------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index bf1c2a1dad95..2b88c5b8a7bf 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -153,9 +154,6 @@ struct imx219_mode {
 	/* Frame height */
 	unsigned int height;
 
-	/* Analog crop rectangle. */
-	struct v4l2_rect crop;
-
 	/* V-timing */
 	unsigned int vts_def;
 };
@@ -292,48 +290,24 @@ static const struct imx219_mode supported_modes[] = {
 		/* 8MPix 15fps mode */
 		.width = 3280,
 		.height = 2464,
-		.crop = {
-			.left = IMX219_PIXEL_ARRAY_LEFT,
-			.top = IMX219_PIXEL_ARRAY_TOP,
-			.width = 3280,
-			.height = 2464
-		},
 		.vts_def = 3526,
 	},
 	{
 		/* 1080P 30fps cropped */
 		.width = 1920,
 		.height = 1080,
-		.crop = {
-			.left = 688,
-			.top = 700,
-			.width = 1920,
-			.height = 1080
-		},
 		.vts_def = 1763,
 	},
 	{
 		/* 2x2 binned 30fps mode */
 		.width = 1640,
 		.height = 1232,
-		.crop = {
-			.left = IMX219_PIXEL_ARRAY_LEFT,
-			.top = IMX219_PIXEL_ARRAY_TOP,
-			.width = 3280,
-			.height = 2464
-		},
 		.vts_def = 1763,
 	},
 	{
 		/* 640x480 30fps mode */
 		.width = 640,
 		.height = 480,
-		.crop = {
-			.left = 1008,
-			.top = 760,
-			.width = 1280,
-			.height = 960
-		},
 		.vts_def = 1763,
 	},
 };
@@ -844,6 +818,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	int exposure_max, exposure_def, hblank;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	unsigned int bin_h, bin_v;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
@@ -853,10 +828,20 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
 
 	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
-	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
-
 	*format = fmt->format;
-	*crop = mode->crop;
+
+	/*
+	 * Use binning to maximize the crop rectangle size, and centre it in the
+	 * sensor.
+	 */
+	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
+	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
+
+	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
+	crop->width = format->width * bin_h;
+	crop->height = format->height * bin_v;
+	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
+	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Update limits and set FPS to default */
-- 
Regards,

Laurent Pinchart

