Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE2D6987D8
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjBOWaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjBOWaN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2003252D;
        Wed, 15 Feb 2023 14:30:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CDDB46D;
        Wed, 15 Feb 2023 23:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500209;
        bh=8KmgrebNDzY6Pj45O43Fv1SwAEbebMom9KF6Dtq5tZs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=joDaR+gWHli0SBwH0S7xaQvc/LHwSmQ5HDXHA+40yMXXH+WG3xNeIvi7Y5JSQ3W+v
         mxAHwLSxkPN+2dAgaglkIfKEW82MMY0JtIlQoisQq8L4ncQTIABzGDMWfYlv1lR+sX
         DRMO2a+4mz554CAyFIODQbJnzHeOQpq896Qb16Z0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 02/15] media: i2c: imx290: Add support for the mono sensor variant
Date:   Thu, 16 Feb 2023 00:29:50 +0200
Message-Id: <20230215223003.30170-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The IMX290 module is available as either mono or colour (Bayer).

Update the driver so that it can advertise the correct mono
formats instead of the colour ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Fix conflict causing compilation breakage
- Drop unneeded pointer cast
- Don't move imx290_of_match table
---
 drivers/media/i2c/imx290.c | 75 +++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 49d6c8bdec41..febb8aeb9252 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -157,6 +158,21 @@
 
 #define IMX290_NUM_SUPPLIES				3
 
+enum imx290_colour_variant {
+	IMX290_VARIANT_COLOUR,
+	IMX290_VARIANT_MONO,
+	IMX290_VARIANT_MAX
+};
+
+enum imx290_model {
+	IMX290_MODEL_IMX290LQR,
+	IMX290_MODEL_IMX290LLR,
+};
+
+struct imx290_model_info {
+	enum imx290_colour_variant colour_variant;
+};
+
 struct imx290_regval {
 	u32 reg;
 	u32 val;
@@ -177,6 +193,7 @@ struct imx290 {
 	struct clk *xclk;
 	struct regmap *regmap;
 	u8 nlanes;
+	const struct imx290_model_info *model;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -414,7 +431,7 @@ static inline int imx290_modes_num(const struct imx290 *imx290)
 }
 
 struct imx290_format_info {
-	u32 code;
+	u32 code[IMX290_VARIANT_MAX];
 	u8 bpp;
 	const struct imx290_regval *regs;
 	unsigned int num_regs;
@@ -422,26 +439,33 @@ struct imx290_format_info {
 
 static const struct imx290_format_info imx290_formats[] = {
 	{
-		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.code = {
+			[IMX290_VARIANT_COLOUR] = MEDIA_BUS_FMT_SRGGB10_1X10,
+			[IMX290_VARIANT_MONO] = MEDIA_BUS_FMT_Y10_1X10
+		},
 		.bpp = 10,
 		.regs = imx290_10bit_settings,
 		.num_regs = ARRAY_SIZE(imx290_10bit_settings),
 	}, {
-		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.code = {
+			[IMX290_VARIANT_COLOUR] = MEDIA_BUS_FMT_SRGGB12_1X12,
+			[IMX290_VARIANT_MONO] = MEDIA_BUS_FMT_Y12_1X12
+		},
 		.bpp = 12,
 		.regs = imx290_12bit_settings,
 		.num_regs = ARRAY_SIZE(imx290_12bit_settings),
 	}
 };
 
-static const struct imx290_format_info *imx290_format_info(u32 code)
+static const struct imx290_format_info *
+imx290_format_info(const struct imx290 *imx290, u32 code)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(imx290_formats); ++i) {
 		const struct imx290_format_info *info = &imx290_formats[i];
 
-		if (info->code == code)
+		if (info->code[imx290->model->colour_variant] == code)
 			return info;
 	}
 
@@ -536,7 +560,7 @@ static int imx290_set_black_level(struct imx290 *imx290,
 				  const struct v4l2_mbus_framefmt *format,
 				  unsigned int black_level, int *err)
 {
-	unsigned int bpp = imx290_format_info(format->code)->bpp;
+	unsigned int bpp = imx290_format_info(imx290, format->code)->bpp;
 
 	return imx290_write(imx290, IMX290_BLKLEVEL,
 			    black_level >> (16 - bpp), err);
@@ -548,7 +572,7 @@ static int imx290_setup_format(struct imx290 *imx290,
 	const struct imx290_format_info *info;
 	int ret;
 
-	info = imx290_format_info(format->code);
+	info = imx290_format_info(imx290, format->code);
 
 	ret = imx290_set_register_array(imx290, info->regs, info->num_regs);
 	if (ret < 0) {
@@ -649,7 +673,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 
 	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
 	pixel_rate = link_freq * 2 * imx290->nlanes;
-	do_div(pixel_rate, imx290_format_info(format->code)->bpp);
+	do_div(pixel_rate, imx290_format_info(imx290, format->code)->bpp);
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
@@ -844,10 +868,12 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
+	const struct imx290 *imx290 = to_imx290(sd);
+
 	if (code->index >= ARRAY_SIZE(imx290_formats))
 		return -EINVAL;
 
-	code->code = imx290_formats[code->index].code;
+	code->code = imx290_formats[code->index].code[imx290->model->colour_variant];
 
 	return 0;
 }
@@ -859,7 +885,7 @@ static int imx290_enum_frame_size(struct v4l2_subdev *sd,
 	const struct imx290 *imx290 = to_imx290(sd);
 	const struct imx290_mode *imx290_modes = imx290_modes_ptr(imx290);
 
-	if (!imx290_format_info(fse->code))
+	if (!imx290_format_info(imx290, fse->code))
 		return -EINVAL;
 
 	if (fse->index >= imx290_modes_num(imx290))
@@ -888,8 +914,8 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
 
-	if (!imx290_format_info(fmt->format.code))
-		fmt->format.code = imx290_formats[0].code;
+	if (!imx290_format_info(imx290, fmt->format.code))
+		fmt->format.code = imx290_formats[0].code[imx290->model->colour_variant];
 
 	fmt->format.field = V4L2_FIELD_NONE;
 
@@ -1177,6 +1203,15 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
 	return 0;
 }
 
+static const struct imx290_model_info imx290_models[] = {
+	[IMX290_MODEL_IMX290LQR] = {
+		.colour_variant = IMX290_VARIANT_COLOUR,
+	},
+	[IMX290_MODEL_IMX290LLR] = {
+		.colour_variant = IMX290_VARIANT_MONO,
+	},
+};
+
 static int imx290_parse_dt(struct imx290 *imx290)
 {
 	/* Only CSI2 is supported for now: */
@@ -1187,6 +1222,8 @@ static int imx290_parse_dt(struct imx290 *imx290)
 	int ret;
 	s64 fq;
 
+	imx290->model = of_device_get_match_data(imx290->dev);
+
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
 	if (!endpoint) {
 		dev_err(imx290->dev, "Endpoint node not found\n");
@@ -1352,8 +1389,18 @@ static void imx290_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id imx290_of_match[] = {
-	{ .compatible = "sony,imx290" },
-	{ /* sentinel */ }
+	{
+		/* Deprecated - synonym for "sony,imx290lqr" */
+		.compatible = "sony,imx290",
+		.data = &imx290_models[IMX290_MODEL_IMX290LQR],
+	}, {
+		.compatible = "sony,imx290lqr",
+		.data = &imx290_models[IMX290_MODEL_IMX290LQR],
+	}, {
+		.compatible = "sony,imx290llr",
+		.data = &imx290_models[IMX290_MODEL_IMX290LLR],
+	},
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx290_of_match);
 
-- 
Regards,

Laurent Pinchart

