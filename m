Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A389368A2C3
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbjBCTR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbjBCTRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:17:25 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009886DFF5
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:17:23 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id u10so1570139wmj.3
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5entlBeyDhRDGltKJxqFOfBJjrmU0H4Re7/v+cZlz0=;
        b=bFMwNvY5BTbZXG89L5M/N5mKDpyZqPMmAGILfSGkm/MC69/UDeSwNRBYkGMsnoVXIF
         mL2rY1DeCzyZzjzDJSBFliI58lrMUfOuUSlK5n7sjKRZb3KhOyB/y5zmnGU1GzRnFKcF
         Lh9dPfKygkNcM+RrQdjY4tjDGSCRaFWf4o/KOqMzwCxiUtrjpIutcMnEVQfy75bPFqEY
         vEswv1s2uw+gt5S96R/rhJ6a9onebOqVnDOX4d94+Z2Nd/ahU6D/cYitDpfDMvCcc4Qe
         V7fi7UJqWBKXgyZE3u/ZNE+JC1pP0Pz36Yrk5URB/PJkgfesWpM5tMvqG39MriVyvwaw
         yIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5entlBeyDhRDGltKJxqFOfBJjrmU0H4Re7/v+cZlz0=;
        b=TqF3DagBsUjzErhI0xVEHXdOUumKIa1ei6nsUPrVOKHKNENG1SBV6Ik9eANxmHpJl/
         /2MJXx5C9NDHzkm2pN4/cuzosAzy4QUvzPv/LPNjZ93KylCFr6FzfoTAJhwFB3TgXn62
         ZOOazn8/Na3vIM+rZlAFgry/DP+CnOEQpk9xYxeZLSsclTeNTxHgFLeH0PYj/ps2oxb2
         GRGLHyAE0kcUfdOmkzPv0RI9QeZ9NK0mFoaaDUGZDSSLA5cQSro7sgRvM4dZQkc3UYq2
         2gXMkuJpg4h1Qg8StGLzFgQ7bA9uq7/7TFK0OZ1BuN1FaNxwYAmHJipmcLb+eqkfHVYH
         iWnA==
X-Gm-Message-State: AO0yUKUaHqLb/WqqpaYzSjvo2kijwcWV4bZKxaFRf+IHkvlg6hJN0UIT
        eUASmLEfh5beCgkA+aXOIMZL4g==
X-Google-Smtp-Source: AK7set+dT0cb2jw45xZ17CqDfx0w+H72fJdBhyeW7AevJVtzVhG0FNt7EQVwDBg/cLuSyowO6c5DKw==
X-Received: by 2002:a7b:ce97:0:b0:3dc:4cb5:41c with SMTP id q23-20020a7bce97000000b003dc4cb5041cmr10711741wmj.0.1675451842552;
        Fri, 03 Feb 2023 11:17:22 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id l20-20020a05600c089400b003dc41a9836esm3349263wmp.43.2023.02.03.11.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:17:21 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 2/2] media: i2c: imx290: Add support for the mono sensor variant.
Date:   Fri,  3 Feb 2023 19:16:44 +0000
Message-Id: <20230203191644.947643-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203191644.947643-1-dave.stevenson@raspberrypi.com>
References: <20230203191644.947643-1-dave.stevenson@raspberrypi.com>
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

The IMX290 module is available as either mono or colour (Bayer).

Update the driver so that it can advertise the correct mono
formats instead of the colour ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 81 ++++++++++++++++++++++++++++++--------
 1 file changed, 64 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 49d6c8bdec41..9ce839541926 100644
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
 
@@ -1177,6 +1203,31 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
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
+static const struct of_device_id imx290_of_match[] = {
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
+};
+MODULE_DEVICE_TABLE(of, imx290_of_match);
+
 static int imx290_parse_dt(struct imx290 *imx290)
 {
 	/* Only CSI2 is supported for now: */
@@ -1187,6 +1238,8 @@ static int imx290_parse_dt(struct imx290 *imx290)
 	int ret;
 	s64 fq;
 
+	imx290->model = (const struct imx290_model_info *)of_device_get_match_data(imx290->dev);
+
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
 	if (!endpoint) {
 		dev_err(imx290->dev, "Endpoint node not found\n");
@@ -1351,12 +1404,6 @@ static void imx290_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(imx290->dev);
 }
 
-static const struct of_device_id imx290_of_match[] = {
-	{ .compatible = "sony,imx290" },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, imx290_of_match);
-
 static struct i2c_driver imx290_i2c_driver = {
 	.probe_new  = imx290_probe,
 	.remove = imx290_remove,
-- 
2.34.1

