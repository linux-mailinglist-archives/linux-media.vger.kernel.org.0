Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1DC746EF3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjGDKlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbjGDKlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:41:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F655195
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:41:13 -0700 (PDT)
Received: from uno.localdomain (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08FCB2C6;
        Tue,  4 Jul 2023 12:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688467226;
        bh=QlAkJMRKJXzjhQnq9hORGQ2cLtHSLGFTxAOkiNZhCiQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eSkjnOpIAia2uMw49ffMm7GK0PQJadk+R2MWd++w4DRA1hplJoIQeIunbDsEZlBbB
         TyAEwLcMTWn6+Keuo4ipaXXDHwQFcIarcp6wcJgGrHs/jbGqija4WwxEaa79VP0iG7
         oUsAIRS/Woyr6T302F88w/eIGDKAB5FdEU+XJms8=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH 4/5] media: i2c: imx219: Simplify format assignment
Date:   Tue,  4 Jul 2023 12:40:56 +0200
Message-Id: <20230704104057.149837-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The set_fmt and init_cfg functions both fills a v4l2_mbus_framefmt
instance, passing in the mode and the media bus code. While set_fmt
uses function helpers, init_cfg open-codes the assignments.

Simplify the format initialization by moving it to a common helper.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 56 ++++++++++++++------------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 127ecee3643d..c1246bd23b0d 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -670,6 +670,23 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
 	.s_ctrl = imx219_set_ctrl,
 };
 
+static void imx219_update_pad_format(struct imx219 *imx219,
+				     const struct imx219_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt, u32 code)
+{
+	/* Bayer order varies with flips */
+	fmt->code = imx219_get_format_code(imx219, code);
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
+							  fmt->colorspace,
+							  fmt->ycbcr_enc);
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+}
+
 static int imx219_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state)
 {
@@ -679,17 +696,8 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
 
 	/* Initialize try_fmt */
 	format = v4l2_subdev_get_pad_format(sd, state, 0);
-	format->width = supported_modes[0].width;
-	format->height = supported_modes[0].height;
-	format->code = imx219_get_format_code(imx219,
-					      MEDIA_BUS_FMT_SRGGB10_1X10);
-	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_SRGB;
-	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
-	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
-							  format->colorspace,
-							  format->ycbcr_enc);
-	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
+	imx219_update_pad_format(imx219, &supported_modes[0], format,
+				 MEDIA_BUS_FMT_SRGGB10_1X10);
 
 	/* Initialize try_crop rectangle. */
 	try_crop = v4l2_subdev_get_pad_crop(sd, state, 0);
@@ -737,26 +745,6 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
-{
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
-	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
-							  fmt->colorspace,
-							  fmt->ycbcr_enc);
-	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
-}
-
-static void imx219_update_pad_format(struct imx219 *imx219,
-				     const struct imx219_mode *mode,
-				     struct v4l2_subdev_format *fmt)
-{
-	fmt->format.width = mode->width;
-	fmt->format.height = mode->height;
-	fmt->format.field = V4L2_FIELD_NONE;
-	imx219_reset_colorspace(&fmt->format);
-}
-
 static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -772,15 +760,13 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (i >= ARRAY_SIZE(imx219_mbus_formats))
 		i = 0;
 
-	/* Bayer order varies with flips */
-	fmt->format.code = imx219_get_format_code(imx219, imx219_mbus_formats[i]);
-
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
-	imx219_update_pad_format(imx219, mode, fmt);
+	imx219_update_pad_format(imx219, mode, &fmt->format,
+				 imx219_mbus_formats[i]);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx219->mode = mode;
-- 
2.40.1

