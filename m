Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D9B69A8A1
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 10:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjBQJwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Feb 2023 04:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBQJwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Feb 2023 04:52:42 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440775F82B;
        Fri, 17 Feb 2023 01:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676627559; x=1708163559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dfdINc9Z+hvhRZTRN1xdjn74m0eSkLV2CuxJRb6AAsk=;
  b=J8c06aoM5Q/xIuBxJfvqFHoodG9PLQXXft6tt8bH3s2MW8yexRimU7+K
   yXRavd32VfEdmIYbHvmNCZN1TCktkdeFQk6XsCf4fO96mKl47ayyHvnKy
   5DFwQAqpRdYeHyCDKiSuQJM/vzQJUEaqK8DWPki4CazVSFEt9jxLsSq4p
   X15yb+0ph5pv499qblpeO0ASAKQq5eb1LLjcvb8Olf+V+xIrC65J/Dzoq
   WOGmeLPw1c6OnCTBwFv9DxYq6OTHNqlxY69tzOxjDiDrpA1sCf6r1KDAF
   S54VACoT5UiRi7UNWuVlJgaT1lureER4QHIu/g67a/ArkU0j4Twp5Uk/V
   w==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29151776"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 10:52:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 17 Feb 2023 10:52:34 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 10:52:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676627554; x=1708163554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dfdINc9Z+hvhRZTRN1xdjn74m0eSkLV2CuxJRb6AAsk=;
  b=dhld0QRECIVwkFoMEWcF4LYHeySTsEfFy7nYLXTmj1MN2o3g/xMMK0Ho
   CbNj62ghg1LW9DOcN3JbnzQBvhwd2AjOd1nRERmmEJE3L0Q3qWSowNhHJ
   Phdx4hUIMAoSHXd0yuP8Aj9zRojp+vG7nBYx6bU07CMZIDCJMGWdgwDcI
   bvg5TVPCx/mWNczVw/s9HjZLo+ZE85GvBLGANhP4wVptOxCP+7AcdQpB3
   u4+GIEZRJ2sz40oWdF8f8vufVNTXtlRnIM62hiN8uG3jZlXo8xAh/ao9q
   RYZxhr3hAoGXUZkcQvSSOicpxogSL5RveYQjrLSdUFjjKDfKbY5yo2NjT
   A==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29151775"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Feb 2023 10:52:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5F638280073;
        Fri, 17 Feb 2023 10:52:34 +0100 (CET)
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
Subject: [PATCH v3 2/2] media: i2c: imx290: Add support for imx327 variant
Date:   Fri, 17 Feb 2023 10:52:21 +0100
Message-Id: <20230217095221.499463-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217095221.499463-1-alexander.stein@ew.tq-group.com>
References: <20230217095221.499463-1-alexander.stein@ew.tq-group.com>
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
 drivers/media/i2c/imx290.c | 44 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index a975bbbc0d69a..1f3f7181a8585 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -173,10 +173,14 @@ enum imx290_colour_variant {
 enum imx290_model {
 	IMX290_MODEL_IMX290LQR,
 	IMX290_MODEL_IMX290LLR,
+	IMX290_MODEL_IMX327LQR,
 };
 
 struct imx290_model_info {
 	enum imx290_colour_variant colour_variant;
+	const struct imx290_regval *init_regs;
+	size_t init_regs_num;
+	const char *name;
 };
 
 enum imx290_clk_freq {
@@ -272,10 +276,14 @@ static const struct imx290_regval imx290_global_init_settings[] = {
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
@@ -328,6 +336,12 @@ static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
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
@@ -1004,6 +1018,14 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
+	/* Set mdel specific init register settings */
+	ret = imx290_set_register_array(imx290, imx290->model->init_regs,
+					imx290->model->init_regs_num);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not set model specific init registers\n");
+		return ret;
+	}
+
 	/* Set clock parameters based on mode and xclk */
 	ret = imx290_set_clock(imx290);
 	if (ret < 0) {
@@ -1474,9 +1496,21 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
 static const struct imx290_model_info imx290_models[] = {
 	[IMX290_MODEL_IMX290LQR] = {
 		.colour_variant = IMX290_VARIANT_COLOUR,
+		.init_regs = imx290_global_init_settings_290,
+		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
+		.name = "imx290",
 	},
 	[IMX290_MODEL_IMX290LLR] = {
 		.colour_variant = IMX290_VARIANT_MONO,
+		.init_regs = imx290_global_init_settings_290,
+		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
+		.name = "imx290",
+	},
+	[IMX290_MODEL_IMX327LQR] = {
+		.colour_variant = IMX290_VARIANT_COLOUR,
+		.init_regs = imx290_global_init_settings_327,
+		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_327),
+		.name = "imx327",
 	},
 };
 
@@ -1609,6 +1643,9 @@ static int imx290_probe(struct i2c_client *client)
 	if (ret)
 		goto err_pm;
 
+	v4l2_i2c_subdev_set_name(&imx290->sd, client,
+				 imx290->model->name, NULL);
+
 	/*
 	 * Finally, register the V4L2 subdev. This must be done after
 	 * initializing everything as the subdev can be used immediately after
@@ -1667,6 +1704,9 @@ static const struct of_device_id imx290_of_match[] = {
 	}, {
 		.compatible = "sony,imx290llr",
 		.data = &imx290_models[IMX290_MODEL_IMX290LLR],
+	}, {
+		.compatible = "sony,imx327lqr",
+		.data = &imx290_models[IMX290_MODEL_IMX327LQR],
 	},
 	{ /* sentinel */ },
 };
-- 
2.34.1

