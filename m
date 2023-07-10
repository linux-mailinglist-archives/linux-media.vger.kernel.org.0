Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56AD74DA85
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 17:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbjGJPyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 11:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbjGJPyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 11:54:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722C31B3
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 08:53:58 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90B5B123B;
        Mon, 10 Jul 2023 17:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689004291;
        bh=M+BAzvygINY4qmn/iF2oJWXS+DUjaQDbrVghbDfEnIg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rVa5F0D1epHHVmtFF6pVi16slFuK6M9hx4a7syg2iLmgYXO1mfZ0EBlZ4mk8IXGJx
         wRZx8UPqdBdw043jsV4c6zUMad/78d7F7d5p91x4Wsqv0SO3LiH3aT8PjIQOSiH42P
         RrtX3IBHk1w3jShwZPm0n9Dz2P4AXa0TRVovx0jo=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v2 4/7] media: i2c: imx219: Fix colorspace info
Date:   Mon, 10 Jul 2023 17:52:00 +0200
Message-Id: <20230710155203.92366-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX219 is a RAW sensor. Fix the colorspace configuration by
using V4L2_COLORSPACE_RAW and adjust the quantization and transfer
function values. Drop ycbcr_enc as it doesn't apply to RAW sensors.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index cd43a897391c..6963e24e1bc2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -597,15 +597,12 @@ static void imx219_set_default_format(struct imx219 *imx219)
 
 	fmt = &imx219->fmt;
 	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
-	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
-							  fmt->colorspace,
-							  fmt->ycbcr_enc);
-	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->width = supported_modes[0].width;
 	fmt->height = supported_modes[0].height;
 	fmt->field = V4L2_FIELD_NONE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -714,12 +711,10 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
 	format->code = imx219_get_format_code(imx219,
 					      MEDIA_BUS_FMT_SRGGB10_1X10);
 	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_SRGB;
+	format->colorspace = V4L2_COLORSPACE_RAW;
 	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
-	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
-							     format->colorspace,
-							     format->ycbcr_enc);
-	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
+	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	format->xfer_func = V4L2_XFER_FUNC_NONE;
 
 	/* Initialize crop rectangle. */
 	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
@@ -775,12 +770,9 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 
 static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
-	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
-							  fmt->colorspace,
-							  fmt->ycbcr_enc);
-	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
 static void imx219_update_pad_format(struct imx219 *imx219,
-- 
2.40.1

