Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8A9C683662
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjAaTVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjAaTVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:21:15 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979A8589A6
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:21:05 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id o18so5740593wrj.3
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmLsXD5N2VDr1p+YGeciMrKRrG4q8uLP5itzXU5xuBQ=;
        b=D0nUoP7nGU/qfQRqaky69JGzpST8Q/zfsZsQcNWVc95sTyuB9RPYNkzjQPjX+sh+Bo
         0aS8+6o1muPhhRAol2AGKT1JRlnJZyfMbnN+eXZnwHikTSCMzEQtVHJgtxPIrS6/9oTQ
         9ODplCwG7Ig5K1+PxLW4kmqQD4eq/s2BUjPUQiTsWdQSRX1dofFEDie+4JRxRHxFHTx5
         fA1IkYu94KPLJR8ZzkJ3tYTTX8uAErA0QJ23UvihoNfNEcnlTFZXkH9I/OfRizR88fYh
         vRFGkQBBLEfZBcVZHvioEpEijasMP9cMmgapgDC0pYgRu2cQWYR+W/TMec7KvWzmnUz/
         oczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmLsXD5N2VDr1p+YGeciMrKRrG4q8uLP5itzXU5xuBQ=;
        b=iE2bNCJ94wBGY0yO51c+vBpIwnA8cEnSV7N/y/Orq2NQUX7YBQq47jSnCuAGpksj1q
         IUCEEZsKrhEdm6xSlirhSysNOr0MCA6nKywHC5XyEK4SCyR2a6xYICY1KimzXYrVwTeG
         K8vETRjt9bn/+ozb0ETl83/pvZ/+HLBf5nrJ/uOkZoM/Zz841/wPDDmHpOxn2YIvFyUh
         cwcrlBqD8IUa2jeaaGinc/y1v0/HAwnPJGT8prVbHM1vgVUY2K1M4aaS0i9bZ+JrAgEG
         6rR6/bEL8dhyax+/imzIl7kC30kMWKwLQgAtWUt82ASwcS3LKtkyinoyKZW/s8WdvQMD
         o71Q==
X-Gm-Message-State: AO0yUKWyzXOhLJ1bEkgkuql9ICKGQU9oRdQgbSo8WZ+fMWsteIKTZ1NJ
        EuFKFSj+/JuSR+qJT+upSmDxJA==
X-Google-Smtp-Source: AK7set+uIJJ+7/+aeAvoU8mxo0eKFi9pqg2ptdHLMBtGKodzXMdWoXPKvxkGM0A2p3btjj48zYxBrw==
X-Received: by 2002:a5d:634b:0:b0:2bf:b0ff:737b with SMTP id b11-20020a5d634b000000b002bfb0ff737bmr3537255wrw.36.1675192864141;
        Tue, 31 Jan 2023 11:21:04 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:21:03 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 10/11] media: i2c: imx290: Add support for 74.25MHz external clock
Date:   Tue, 31 Jan 2023 19:20:15 +0000
Message-Id: <20230131192016.3476937-11-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
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
 drivers/media/i2c/imx290.c | 120 +++++++++++++++++++++++++++++++------
 1 file changed, 103 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 5202ef3cc3e6..7f6746f74040 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -102,6 +102,7 @@
 #define IMX290_TCLKPREPARE				IMX290_REG_16BIT(0x3452)
 #define IMX290_TLPX					IMX290_REG_16BIT(0x3454)
 #define IMX290_X_OUT_SIZE				IMX290_REG_16BIT(0x3472)
+#define IMX290_INCKSEL7					IMX290_REG_8BIT(0x3480)
 
 #define IMX290_PGCTRL_REGEN				BIT(0)
 #define IMX290_PGCTRL_THRU				BIT(1)
@@ -159,11 +160,27 @@
 
 #define IMX290_NUM_SUPPLIES				3
 
+#define CLK_37_125	0
+#define CLK_74_25	1
+#define NUM_CLK		2
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
@@ -173,6 +190,8 @@ struct imx290_mode {
 
 	const struct imx290_regval *data;
 	u32 data_size;
+
+	const struct imx290_clk_cfg *clk_cfg;
 };
 
 struct imx290_csi_cfg {
@@ -191,6 +210,7 @@ struct imx290 {
 	struct device *dev;
 	struct clk *xclk;
 	struct regmap *regmap;
+	u32 xclk_freq;
 	u8 nlanes;
 	u8 mono;
 
@@ -219,7 +239,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
  */
 
 static const struct imx290_regval imx290_global_init_settings[] = {
-	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
 	{ IMX290_WINPV, 0 },
@@ -269,7 +288,16 @@ static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_REG_8BIT(0x33b0), 0x50 },
 	{ IMX290_REG_8BIT(0x33b2), 0x1a },
 	{ IMX290_REG_8BIT(0x33b3), 0x04 },
-	{ IMX290_REG_8BIT(0x3480), 0x49 },
+};
+
+static const struct imx290_regval imx290_37_125mhz_clock[] = {
+	{ IMX290_EXTCK_FREQ, 0x2520 },
+	{ IMX290_INCKSEL7, 0x49 },
+};
+
+static const struct imx290_regval imx290_74_25mhz_clock[] = {
+	{ IMX290_EXTCK_FREQ, 0x4a40 },
+	{ IMX290_INCKSEL7, 0x92 },
 };
 
 static const struct imx290_regval imx290_1080p_settings[] = {
@@ -279,12 +307,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
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
@@ -294,12 +316,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
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
@@ -405,6 +421,48 @@ static inline int imx290_link_freqs_num(const struct imx290 *imx290)
 		return ARRAY_SIZE(imx290_link_freq_4lanes);
 }
 
+static const struct imx290_clk_cfg imx290_1080p_clock_config[NUM_CLK] = {
+	[CLK_37_125] = {
+		/* 37.125MHz clock config */
+		.incksel1 = 0x18,
+		.incksel2 = 0x03,
+		.incksel3 = 0x20,
+		.incksel4 = 0x01,
+		.incksel5 = 0x1a,
+		.incksel6 = 0x1a,
+	},
+	[CLK_74_25] = {
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
+static const struct imx290_clk_cfg imx290_720p_clock_config[NUM_CLK] = {
+	[CLK_37_125] = {
+		/* 37.125MHz clock config */
+		.incksel1 = 0x20,
+		.incksel2 = 0x00,
+		.incksel3 = 0x20,
+		.incksel4 = 0x01,
+		.incksel5 = 0x1a,
+		.incksel6 = 0x1a,
+	},
+	[CLK_74_25] = {
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
@@ -415,6 +473,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
+		.clk_cfg = imx290_1080p_clock_config,
 	},
 	{
 		.width = 1280,
@@ -424,6 +483,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
+		.clk_cfg = imx290_720p_clock_config,
 	},
 };
 
@@ -436,6 +496,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
+		.clk_cfg = imx290_1080p_clock_config,
 	},
 	{
 		.width = 1280,
@@ -445,6 +506,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
+		.clk_cfg = imx290_720p_clock_config,
 	},
 };
 
@@ -563,6 +625,23 @@ static int imx290_set_register_array(struct imx290 *imx290,
 	return 0;
 }
 
+static int imx290_set_clock(struct imx290 *imx290)
+{
+	int clk_idx = (imx290->xclk_freq == 37125000) ? 0 : 1;
+	const struct imx290_mode *mode = imx290->current_mode;
+	const struct imx290_clk_cfg *clk_cfg = &mode->clk_cfg[clk_idx];
+	int ret = 0;
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
@@ -863,6 +942,13 @@ static int imx290_start_streaming(struct imx290 *imx290,
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
@@ -1259,14 +1345,14 @@ static int imx290_init_clk(struct imx290 *imx290)
 	int ret;
 
 	ret = fwnode_property_read_u32(dev_fwnode(imx290->dev),
-				       "clock-frequency", &xclk_freq);
+				       "clock-frequency", &imx290->xclk_freq);
 	if (ret) {
 		dev_err(imx290->dev, "Could not get xclk frequency\n");
 		return ret;
 	}
 
-	/* external clock must be 37.125 MHz */
-	if (xclk_freq != 37125000) {
+	/* external clock must be 37.125 MHz or 74.25MHz */
+	if (imx290->xclk_freq != 37125000 && imx290->xclk_freq != 74250000) {
 		dev_err(imx290->dev, "External clock frequency %u is not supported\n",
 			xclk_freq);
 		return -EINVAL;
-- 
2.34.1

