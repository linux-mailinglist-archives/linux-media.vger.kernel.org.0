Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023D368BDFE
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 14:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjBFNUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 08:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjBFNTh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 08:19:37 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CDD252A0;
        Mon,  6 Feb 2023 05:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675689505; x=1707225505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qp+sjaVeW1sDky4rZRnFCFT3eWd89cC+36uUMyEd/Bc=;
  b=KNg5yp480jy8s+EQeWGe33kfHLzfsJmiPood3I9rysKRXz+HQBynhZhF
   9hjIH+5lCBiR9GhBJpZQWN0xnGt8X9U+hFdtDEolnqI8FCRqxXfPOkxw5
   OuXMf3usMlMWJ9LMzAI8SqabYBLZ9jFAN3CyKWd/DmrT+p/MNjdXvOuOh
   Ec7JRd1+Q0tUI1NdZU+7Ljdp+b1bV8Op7YWGBOVXrQlwbtNRGjR90qYG9
   IAKHpeWEpjSUYtL5RlZj1V9/msWcKRXaYVLqtkyDCcTS340Nd2SK4b9yn
   tz3HBmTI7CNVhohWe9ZYNl1i0M3/f7GlK2j21FwA2dJ8oo2cu3RIDqkGd
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28891875"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Feb 2023 14:17:42 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 06 Feb 2023 14:17:43 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 06 Feb 2023 14:17:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675689462; x=1707225462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qp+sjaVeW1sDky4rZRnFCFT3eWd89cC+36uUMyEd/Bc=;
  b=S/pdw4BnJXAhr9w9XW5lfm7P01Fe52AqVKPCwDP1z2gYQRh8j/ig71AW
   yU1bOYb5lo/4Qj+OBQVKAE6AVYTCcS9+z5dvGhYmq81sEItRJyjNHDKL4
   wN3nAx9bF8YSAWila+5ebAKO3t3EVvhn0AMhc+Q8+q34GXD64UBE4JBLU
   Nmq70rF6qdfZYftZwyax1FVgrOgYM9b9zEc2LJCNiGMYB929OBMZxbx+W
   dk7Gq1QbxW6O3bmlzUtcVBQU9S6VcwKEhyv1CQoaz50HcIZAv6Lz1O9FV
   vfw99XB8AgunIvoIOYLf66FG/V3AOB+RHcDgAvRgPLKFvNkEJENCOmldv
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28891870"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Feb 2023 14:17:41 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CBF35280078;
        Mon,  6 Feb 2023 14:17:40 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: imx290: Add support for imx327 variant
Date:   Mon,  6 Feb 2023 14:17:31 +0100
Message-Id: <20230206131731.548795-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
References: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both sensors are quite similar. Their specs only differ regarding LVDS
and parallel output but are identical regarding MIPI-CSI-2 interface.
But they use a different init setting of hard-coded values, taken from
the datasheet.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Note: The call to v4l2_i2c_subdev_set_name will change the device name
shown to userspace. So now 'imx290lqr' will be shown instead of 'imx290'.

 drivers/media/i2c/imx290.c | 58 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 1cfdd700bca5..0bfbce8853e6 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -173,10 +173,13 @@ enum imx290_colour_variant {
 enum imx290_model {
 	IMX290_MODEL_IMX290LQR,
 	IMX290_MODEL_IMX290LLR,
+	IMX290_MODEL_IMX327LQR,
 };
 
 struct imx290_model_info {
 	enum imx290_colour_variant colour_variant;
+	enum imx290_model model;
+	const char *name;
 };
 
 enum imx290_clk_freq {
@@ -272,10 +275,14 @@ static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_WINWV, 1097 },
 	{ IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
 			   IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
-	{ IMX290_REG_8BIT(0x300f), 0x00 },
-	{ IMX290_REG_8BIT(0x3010), 0x21 },
+	{ IMX290_REG_8BIT(0x3011), 0x02 },
 	{ IMX290_REG_8BIT(0x3012), 0x64 },
 	{ IMX290_REG_8BIT(0x3013), 0x00 },
+};
+
+static const struct imx290_regval imx290_global_init_settings_290[] = {
+	{ IMX290_REG_8BIT(0x300f), 0x00 },
+	{ IMX290_REG_8BIT(0x3010), 0x21 },
 	{ IMX290_REG_8BIT(0x3016), 0x09 },
 	{ IMX290_REG_8BIT(0x3070), 0x02 },
 	{ IMX290_REG_8BIT(0x3071), 0x11 },
@@ -328,6 +335,12 @@ static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
 	},
 };
 
+static const struct imx290_regval imx290_global_init_settings_327[] = {
+	{ IMX290_REG_8BIT(0x309e), 0x4A },
+	{ IMX290_REG_8BIT(0x309f), 0x4A },
+	{ IMX290_REG_8BIT(0x313b), 0x61 },
+};
+
 static const struct imx290_regval imx290_1080p_settings[] = {
 	/* mode settings */
 	{ IMX290_WINWV_OB, 12 },
@@ -999,9 +1012,11 @@ static int imx290_start_streaming(struct imx290 *imx290,
 				  struct v4l2_subdev_state *state)
 {
 	const struct v4l2_mbus_framefmt *format;
+	const struct imx290_regval *regs;
+	unsigned int reg_num;
 	int ret;
 
-	/* Set init register settings */
+	/* Set common init register settings */
 	ret = imx290_set_register_array(imx290, imx290_global_init_settings,
 					ARRAY_SIZE(imx290_global_init_settings));
 	if (ret < 0) {
@@ -1009,6 +1024,28 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
+	switch (imx290->model->model) {
+	case IMX290_MODEL_IMX290LQR:
+	case IMX290_MODEL_IMX290LLR:
+		regs = imx290_global_init_settings_290;
+		reg_num = ARRAY_SIZE(imx290_global_init_settings_290);
+		break;
+	case IMX290_MODEL_IMX327LQR:
+		regs = imx290_global_init_settings_327;
+		reg_num = ARRAY_SIZE(imx290_global_init_settings_327);
+		break;
+	default:
+		dev_err(imx290->dev, "Invalid model: %u\n", imx290->model->model);
+		return -EINVAL;
+	}
+
+	/* Set init register settings */
+	ret = imx290_set_register_array(imx290, regs, reg_num);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not set init registers\n");
+		return ret;
+	}
+
 	/* Set clock parameters based on mode and xclk */
 	ret = imx290_set_clock(imx290);
 	if (ret < 0) {
@@ -1479,9 +1516,18 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
 static const struct imx290_model_info imx290_models[] = {
 	[IMX290_MODEL_IMX290LQR] = {
 		.colour_variant = IMX290_VARIANT_COLOUR,
+		.model = IMX290_MODEL_IMX290LQR,
+		.name = "imx290lqr",
 	},
 	[IMX290_MODEL_IMX290LLR] = {
 		.colour_variant = IMX290_VARIANT_MONO,
+		.model = IMX290_MODEL_IMX290LLR,
+		.name = "imx290llr",
+	},
+	[IMX290_MODEL_IMX327LQR] = {
+		.colour_variant = IMX290_VARIANT_COLOUR,
+		.model = IMX290_MODEL_IMX327LQR,
+		.name = "imx327lqr",
 	},
 };
 
@@ -1496,6 +1542,9 @@ static const struct of_device_id imx290_of_match[] = {
 	}, {
 		.compatible = "sony,imx290llr",
 		.data = &imx290_models[IMX290_MODEL_IMX290LLR],
+	}, {
+		.compatible = "sony,imx327lqr",
+		.data = &imx290_models[IMX290_MODEL_IMX327LQR],
 	},
 	{ /* sentinel */ },
 };
@@ -1630,6 +1679,9 @@ static int imx290_probe(struct i2c_client *client)
 	if (ret)
 		goto err_pm;
 
+	v4l2_i2c_subdev_set_name(&imx290->sd, client,
+				 imx290->model->name, NULL);
+
 	/*
 	 * Finally, register the V4L2 subdev. This must be done after
 	 * initializing everything as the subdev can be used immediately after
-- 
2.34.1

