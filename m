Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E43A74DA8E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 17:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbjGJPyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 11:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbjGJPyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 11:54:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A244DE49
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 08:54:24 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 105672FEA;
        Mon, 10 Jul 2023 17:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689004292;
        bh=wLPhLN1G8lSUEv2e29ODZ0GOA7SXfq1ACHyJGaRLnHo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q70X7eWXwbx5lZzm6CznYzQ30y3MvNBWfWWPbk5ziGlROJ5W3MhE1zOgaDVNn/87m
         RGcrdzXfhDbIcKBOcNzFlpSMhGb8Qpdp3ah8sIrfb/9pZJZoSjpTqQRZu99laOe6ts
         UsZderFhQN/6bVfLWyS/Bgouc0w2+SU1Z2KyNXk8=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v2 6/7] media: i2c: imx219: Simplify format assignment
Date:   Mon, 10 Jul 2023 17:52:02 +0200
Message-Id: <20230710155203.92366-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 48 ++++++++++++++------------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 73e06583d651..4f214f10846c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -670,6 +670,20 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
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
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
 static int imx219_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state)
 {
@@ -679,15 +693,8 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
 
 	/* Initialize try_fmt */
 	format = v4l2_subdev_get_pad_format(sd, state, 0);
-	format->width = supported_modes[0].width;
-	format->height = supported_modes[0].height;
-	format->code = imx219_get_format_code(imx219,
-					      MEDIA_BUS_FMT_SRGGB10_1X10);
-	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_RAW;
-	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
-	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
-	format->xfer_func = V4L2_XFER_FUNC_NONE;
+	imx219_update_pad_format(imx219, &supported_modes[0], format,
+				 MEDIA_BUS_FMT_SRGGB10_1X10);
 
 	/* Initialize crop rectangle. */
 	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
@@ -735,23 +742,6 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
-{
-	fmt->colorspace = V4L2_COLORSPACE_RAW;
-	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
-	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
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
@@ -768,15 +758,13 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
 	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
 	if (imx219->mode == mode && format->code == fmt->format.code)
-- 
2.40.1

