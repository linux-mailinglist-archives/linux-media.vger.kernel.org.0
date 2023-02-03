Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BB668A2D1
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233720AbjBCTTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbjBCTS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:57 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F2188F1C
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:42 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h16so5515299wrz.12
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDkgCSaLwZZOHl7EllYkYm7lwz1dU/U56dHAvdDPza0=;
        b=qf9V3svOhCsvbu9gEubKZegtj7EHxB9vaFn4aVGa5YvCQZErg7WFiPbBzerjcA3jza
         xPYdPxB21N6uE6uYH8bcVSFmfHb7Ck9wAlFX+OrTK/hZ3OjOzo+Lkc5bBfwqoqFaL3x8
         X3xKnrqDjQhBsoFmTgY6xH9guSLSd5LnPmcrxZiiofnoqDfu3edq6+QiSNpAID8AKRta
         GFK8GsUbjXjyEgpJLCOYltKRS7DhSYVRB5TJA6ujedKXZE2uNxhrjSthvcwetTXs5xPw
         xDJNC8GtyEcXHBxigVL9Rh7kx4nzXyIHvPxdPcvFE5ueMscUJkLI5rv9mHX/9J+jDI0P
         tDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDkgCSaLwZZOHl7EllYkYm7lwz1dU/U56dHAvdDPza0=;
        b=JgbHDYAg7wJBE+dNNPZ/SGH9+jOrziiqAqmv7putiFLVr7b/O4KfbhKT6Lho+kmUG6
         1wzitDx9aKqg+d/8mt8rF08z0uT+iItQH8zhgjiE6OIFJk7IwVmLJ7+wPhVmzNmOeAas
         Al26RUGev6Qua9MlrXd7g7d4HxwYfRTfDp8g+4dZjHHiRAhTqW+thb8QuJK+o5oIE0g9
         3PjO4Vksd66iLHZPIdU6BdxvBkpT7zBusxd8PUSDz9O+vlKv75fmsavcsUzAQNjBjZK1
         6U0VX4J2CYF3yVpGTi7K9tNIH3vXUroD9hoiU3KjfvKwttqV3wfgQNK5m1Hgja63zoLh
         3fMg==
X-Gm-Message-State: AO0yUKWI7aTXYEUL6JcnIDT835v+N/WuIjGzIIgbmWTa54Km04N4Aki8
        4vjywM4QOtDSf8mLkR+UkCi5Ng==
X-Google-Smtp-Source: AK7set+BHzxUIC62x6653MZLwkpzibDQPmbb21iho/s2vO/gnCLcbVcowv6cSko1WWNptioDFJWntQ==
X-Received: by 2002:a5d:6984:0:b0:2bf:bcab:8e20 with SMTP id g4-20020a5d6984000000b002bfbcab8e20mr9285746wru.32.1675451921335;
        Fri, 03 Feb 2023 11:18:41 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:41 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 11/13] media: i2c: imx290: Add support for 74.25MHz external clock
Date:   Fri,  3 Feb 2023 19:18:09 +0000
Message-Id: <20230203191811.947697-12-dave.stevenson@raspberrypi.com>
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

The sensor supports either a 37.125 or 74.25MHz external, but
the driver only supported 37.125MHz.

Add the relevant register configuration for either clock
frequency option.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 132 ++++++++++++++++++++++++++++++++-----
 1 file changed, 116 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index a74930e86a6c..045d27b4d31b 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -102,6 +102,7 @@
 #define IMX290_TCLKPREPARE				IMX290_REG_16BIT(0x3452)
 #define IMX290_TLPX					IMX290_REG_16BIT(0x3454)
 #define IMX290_X_OUT_SIZE				IMX290_REG_16BIT(0x3472)
+#define IMX290_INCKSEL7					IMX290_REG_8BIT(0x3480)
 
 #define IMX290_PGCTRL_REGEN				BIT(0)
 #define IMX290_PGCTRL_THRU				BIT(1)
@@ -178,11 +179,29 @@ struct imx290_model_info {
 	enum imx290_colour_variant colour_variant;
 };
 
+enum imx290_clk_freq {
+	IMX290_CLK_37_125,
+	IMX290_CLK_74_25,
+	IMX290_NUM_CLK
+};
+
 struct imx290_regval {
 	u32 reg;
 	u32 val;
 };
 
+/*
+ * Clock configuration for registers INCKSEL1 to INCKSEL6.
+ */
+struct imx290_clk_cfg {
+	u8 incksel1;
+	u8 incksel2;
+	u8 incksel3;
+	u8 incksel4;
+	u8 incksel5;
+	u8 incksel6;
+};
+
 struct imx290_mode {
 	u32 width;
 	u32 height;
@@ -192,6 +211,8 @@ struct imx290_mode {
 
 	const struct imx290_regval *data;
 	u32 data_size;
+
+	const struct imx290_clk_cfg *clk_cfg;
 };
 
 struct imx290_csi_cfg {
@@ -210,6 +231,7 @@ struct imx290 {
 	struct device *dev;
 	struct clk *xclk;
 	struct regmap *regmap;
+	enum imx290_clk_freq xclk_idx;
 	u8 nlanes;
 	const struct imx290_model_info *model;
 
@@ -238,7 +260,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
  */
 
 static const struct imx290_regval imx290_global_init_settings[] = {
-	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
 	{ IMX290_WINPV, 0 },
@@ -288,7 +309,18 @@ static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_REG_8BIT(0x33b0), 0x50 },
 	{ IMX290_REG_8BIT(0x33b2), 0x1a },
 	{ IMX290_REG_8BIT(0x33b3), 0x04 },
-	{ IMX290_REG_8BIT(0x3480), 0x49 },
+};
+
+#define IMX290_NUM_CLK_REGS	2
+static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
+	[IMX290_CLK_37_125] = {
+		{ IMX290_EXTCK_FREQ, (37125 * 256) / 1000 },
+		{ IMX290_INCKSEL7, 0x49 },
+	},
+	[IMX290_CLK_74_25] = {
+		{ IMX290_EXTCK_FREQ, (74250 * 256) / 1000 },
+		{ IMX290_INCKSEL7, 0x92 },
+	},
 };
 
 static const struct imx290_regval imx290_1080p_settings[] = {
@@ -298,12 +330,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 	{ IMX290_OPB_SIZE_V, 10 },
 	{ IMX290_X_OUT_SIZE, 1920 },
 	{ IMX290_Y_OUT_SIZE, 1080 },
-	{ IMX290_INCKSEL1, 0x18 },
-	{ IMX290_INCKSEL2, 0x03 },
-	{ IMX290_INCKSEL3, 0x20 },
-	{ IMX290_INCKSEL4, 0x01 },
-	{ IMX290_INCKSEL5, 0x1a },
-	{ IMX290_INCKSEL6, 0x1a },
 };
 
 static const struct imx290_regval imx290_720p_settings[] = {
@@ -313,12 +339,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
 	{ IMX290_OPB_SIZE_V, 4 },
 	{ IMX290_X_OUT_SIZE, 1280 },
 	{ IMX290_Y_OUT_SIZE, 720 },
-	{ IMX290_INCKSEL1, 0x20 },
-	{ IMX290_INCKSEL2, 0x00 },
-	{ IMX290_INCKSEL3, 0x20 },
-	{ IMX290_INCKSEL4, 0x01 },
-	{ IMX290_INCKSEL5, 0x1a },
-	{ IMX290_INCKSEL6, 0x1a },
 };
 
 static const struct imx290_regval imx290_10bit_settings[] = {
@@ -424,6 +444,48 @@ static inline int imx290_link_freqs_num(const struct imx290 *imx290)
 		return ARRAY_SIZE(imx290_link_freq_4lanes);
 }
 
+static const struct imx290_clk_cfg imx290_1080p_clock_config[] = {
+	[IMX290_CLK_37_125] = {
+		/* 37.125MHz clock config */
+		.incksel1 = 0x18,
+		.incksel2 = 0x03,
+		.incksel3 = 0x20,
+		.incksel4 = 0x01,
+		.incksel5 = 0x1a,
+		.incksel6 = 0x1a,
+	},
+	[IMX290_CLK_74_25] = {
+		/* 74.25MHz clock config */
+		.incksel1 = 0x0c,
+		.incksel2 = 0x03,
+		.incksel3 = 0x10,
+		.incksel4 = 0x01,
+		.incksel5 = 0x1b,
+		.incksel6 = 0x1b,
+	},
+};
+
+static const struct imx290_clk_cfg imx290_720p_clock_config[] = {
+	[IMX290_CLK_37_125] = {
+		/* 37.125MHz clock config */
+		.incksel1 = 0x20,
+		.incksel2 = 0x00,
+		.incksel3 = 0x20,
+		.incksel4 = 0x01,
+		.incksel5 = 0x1a,
+		.incksel6 = 0x1a,
+	},
+	[IMX290_CLK_74_25] = {
+		/* 74.25MHz clock config */
+		.incksel1 = 0x10,
+		.incksel2 = 0x00,
+		.incksel3 = 0x10,
+		.incksel4 = 0x01,
+		.incksel5 = 0x1b,
+		.incksel6 = 0x1b,
+	},
+};
+
 /* Mode configs */
 static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
@@ -434,6 +496,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
+		.clk_cfg = imx290_1080p_clock_config,
 	},
 	{
 		.width = 1280,
@@ -443,6 +506,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
+		.clk_cfg = imx290_720p_clock_config,
 	},
 };
 
@@ -455,6 +519,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
+		.clk_cfg = imx290_1080p_clock_config,
 	},
 	{
 		.width = 1280,
@@ -464,6 +529,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
+		.clk_cfg = imx290_720p_clock_config,
 	},
 };
 
@@ -587,6 +653,26 @@ static int imx290_set_register_array(struct imx290 *imx290,
 	return 0;
 }
 
+static int imx290_set_clock(struct imx290 *imx290)
+{
+	const struct imx290_mode *mode = imx290->current_mode;
+	enum imx290_clk_freq clk_idx = imx290->xclk_idx;
+	const struct imx290_clk_cfg *clk_cfg = &mode->clk_cfg[clk_idx];
+	int ret;
+
+	ret = imx290_set_register_array(imx290, xclk_regs[clk_idx],
+					IMX290_NUM_CLK_REGS);
+
+	imx290_write(imx290, IMX290_INCKSEL1, clk_cfg->incksel1, &ret);
+	imx290_write(imx290, IMX290_INCKSEL2, clk_cfg->incksel2, &ret);
+	imx290_write(imx290, IMX290_INCKSEL3, clk_cfg->incksel3, &ret);
+	imx290_write(imx290, IMX290_INCKSEL4, clk_cfg->incksel4, &ret);
+	imx290_write(imx290, IMX290_INCKSEL5, clk_cfg->incksel5, &ret);
+	imx290_write(imx290, IMX290_INCKSEL6, clk_cfg->incksel6, &ret);
+
+	return ret;
+}
+
 static int imx290_set_data_lanes(struct imx290 *imx290)
 {
 	int ret = 0;
@@ -891,6 +977,13 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
+	/* Set clock parameters based on mode and xclk */
+	ret = imx290_set_clock(imx290);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not set clocks\n");
+		return ret;
+	}
+
 	/* Set data lane count */
 	ret = imx290_set_data_lanes(imx290);
 	if (ret < 0) {
@@ -1290,8 +1383,15 @@ static int imx290_init_clk(struct imx290 *imx290)
 		return ret;
 	}
 
-	/* external clock must be 37.125 MHz */
-	if (xclk_freq != 37125000) {
+	/* external clock must be 37.125 MHz or 74.25MHz */
+	switch (xclk_freq) {
+	case 37125000:
+		imx290->xclk_idx = IMX290_CLK_37_125;
+		break;
+	case 74250000:
+		imx290->xclk_idx = IMX290_CLK_74_25;
+		break;
+	default:
 		dev_err(imx290->dev, "External clock frequency %u is not supported\n",
 			xclk_freq);
 		return -EINVAL;
-- 
2.34.1

