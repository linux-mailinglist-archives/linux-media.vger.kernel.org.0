Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80744B7B01
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243245AbiBOXII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241021AbiBOXIH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:07 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1197365E0
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:56 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d27so518806wrb.5
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7YNBUO8XgUFmBpbbAekPgNEEx1eoBe6SU8q8/QoD89s=;
        b=NAwNs5H/3Z5UlLXwzs59eJ1V/KqfMhnYE+x/l8H5D4vIMMPbsEa2YrapZ33hSRNRG5
         Xql6SPV5m/mSbtQM/OIJWvOGxMqKsDuvp8Nmo/LZF9nkNlIT3TTv/rTy00R/Ra2WgTqN
         OUN4US97weIWPgwOlQWI9831Lt4dGxCzQt5ffX11th/rY4SzL/BryXtYGaVRC0n7C4uD
         8aguPXF4va+J7BIkC9jcHvgx+i9Q1bYO4o9DFo6YVIEV9i57X6gAprOL3XveJv9m32nG
         2bMv0zBM/ftMcgPSGS1t+84x6Xh14ZeKHXVfrNUpnMJXBwN1JDkJPRFFm3oKXr8C0+/p
         czLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7YNBUO8XgUFmBpbbAekPgNEEx1eoBe6SU8q8/QoD89s=;
        b=jRS5Qus1w5AAtRcGiw1pffuIb5RtAyR+iNMs/ZRcnLQZbep5iBuiKmbbiBoDnYHWMG
         rabQZEKPoK08JzdX8erH9kt8fG/L9B4RigudJPbv22WN2dMtfjJas19tW7PMXRFpNdnp
         MBaw51sYyoDUku00Wk57zTwIMVz4tXZRR2O7GSM9TcNl8UtMKk99zvti1hevTJPZvH67
         Rf5mckhjqPLZB9Oythviz3gyxRoaOyJzBuaUPS1pLS330VhmqPWZycCm9G1VVORki33f
         ZU9E5o9tKZy5l8UTBv+3jaCTzowzxycljm+MSlPZCSTlv+sSnNAl/VJcByk+KKWElWqS
         +zsg==
X-Gm-Message-State: AOAM5307tnKal99i1WihNj9eXJNFa9hngnrQEhZy4ZaVELz4AWNWZ1ay
        U8kUcOUqCqPUMAq2qs5GAdj8uIB6Tnt3cQ==
X-Google-Smtp-Source: ABdhPJwXJaqq0Wgr6KOLL3xpxOqHaFW9lQqXbO+HuPGcQKB1g5hW+QTHsOC9OZPzkXg/lu2o8NYqyw==
X-Received: by 2002:adf:dec8:0:b0:1e4:9a2f:e3d1 with SMTP id i8-20020adfdec8000000b001e49a2fe3d1mr170878wrn.374.1644966474679;
        Tue, 15 Feb 2022 15:07:54 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:54 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 05/10] media: i2c: Add ov7251_pll_configure()
Date:   Tue, 15 Feb 2022 23:07:32 +0000
Message-Id: <20220215230737.1870630-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rather than having the pll settings hidden inside mode blobs, define
them in structs and use a dedicated function to set them. This makes
it simpler to extend the driver to support other external clock
frequencies.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov7251.c | 165 ++++++++++++++++++++++++++++++-------
 1 file changed, 135 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 5c5f7a15a640..809450b5a99a 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -42,6 +42,16 @@
 #define OV7251_TIMING_FORMAT2_MIRROR	BIT(2)
 #define OV7251_PRE_ISP_00		0x5e00
 #define OV7251_PRE_ISP_00_TEST_PATTERN	BIT(7)
+#define OV7251_PLL1_PRE_DIV_REG		0x30b4
+#define OV7251_PLL1_MULT_REG		0x30b3
+#define OV7251_PLL1_DIVIDER_REG		0x30b1
+#define OV7251_PLL1_PIX_DIV_REG		0x30b0
+#define OV7251_PLL1_MIPI_DIV_REG	0x30b5
+#define OV7251_PLL2_PRE_DIV_REG		0x3098
+#define OV7251_PLL2_MULT_REG		0x3099
+#define OV7251_PLL2_DIVIDER_REG		0x309d
+#define OV7251_PLL2_SYS_DIV_REG		0x309a
+#define OV7251_PLL2_ADC_DIV_REG		0x309b
 
 struct reg_value {
 	u16 reg;
@@ -60,6 +70,27 @@ struct ov7251_mode_info {
 	struct v4l2_fract timeperframe;
 };
 
+struct ov7251_pll1_config {
+	unsigned int pre_div;
+	unsigned int mult;
+	unsigned int div;
+	unsigned int pix_div;
+	unsigned int mipi_div;
+};
+
+struct ov7251_pll2_config {
+	unsigned int pre_div;
+	unsigned int mult;
+	unsigned int div;
+	unsigned int sys_div;
+	unsigned int adc_div;
+};
+
+struct ov7251_pll_configs {
+	const struct ov7251_pll1_config *pll1;
+	const struct ov7251_pll2_config *pll2;
+};
+
 struct ov7251 {
 	struct i2c_client *i2c_client;
 	struct device *dev;
@@ -71,6 +102,8 @@ struct ov7251 {
 	struct clk *xclk;
 	u32 xclk_freq;
 
+	const struct ov7251_pll_configs *pll_configs;
+
 	struct regulator *io_regulator;
 	struct regulator *core_regulator;
 	struct regulator *analog_regulator;
@@ -100,6 +133,36 @@ static inline struct ov7251 *to_ov7251(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov7251, sd);
 }
 
+enum xclk_rate {
+	OV7251_24_MHZ,
+	OV7251_NUM_SUPPORTED_RATES
+};
+
+static const struct ov7251_pll1_config ov7251_pll1_config_24_mhz = {
+	.pre_div = 0x03,
+	.mult = 0x64,
+	.div = 0x01,
+	.pix_div = 0x0a,
+	.mipi_div = 0x05
+};
+
+static const struct ov7251_pll2_config ov7251_pll2_config_24_mhz = {
+	.pre_div = 0x04,
+	.mult = 0x28,
+	.div = 0x00,
+	.sys_div = 0x05,
+	.adc_div = 0x04
+};
+
+static const struct ov7251_pll_configs ov7251_pll_configs_24_mhz = {
+	.pll1 = &ov7251_pll1_config_24_mhz,
+	.pll2 = &ov7251_pll2_config_24_mhz
+};
+
+static const struct ov7251_pll_configs *ov7251_pll_configs[] = {
+	[OV7251_24_MHZ] = &ov7251_pll_configs_24_mhz
+};
+
 static const struct reg_value ov7251_global_init_setting[] = {
 	{ 0x0103, 0x01 },
 	{ 0x303b, 0x02 },
@@ -118,16 +181,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
 	{ 0x301c, 0xf0 },
 	{ 0x3023, 0x05 },
 	{ 0x3037, 0xf0 },
-	{ 0x3098, 0x04 }, /* pll2 pre divider */
-	{ 0x3099, 0x28 }, /* pll2 multiplier */
-	{ 0x309a, 0x05 }, /* pll2 sys divider */
-	{ 0x309b, 0x04 }, /* pll2 adc divider */
-	{ 0x309d, 0x00 }, /* pll2 divider */
-	{ 0x30b0, 0x0a }, /* pll1 pix divider */
-	{ 0x30b1, 0x01 }, /* pll1 divider */
-	{ 0x30b3, 0x64 }, /* pll1 multiplier */
-	{ 0x30b4, 0x03 }, /* pll1 pre divider */
-	{ 0x30b5, 0x05 }, /* pll1 mipi divider */
 	{ 0x3106, 0xda },
 	{ 0x3503, 0x07 },
 	{ 0x3509, 0x10 },
@@ -256,16 +309,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
 	{ 0x301c, 0x00 },
 	{ 0x3023, 0x05 },
 	{ 0x3037, 0xf0 },
-	{ 0x3098, 0x04 }, /* pll2 pre divider */
-	{ 0x3099, 0x28 }, /* pll2 multiplier */
-	{ 0x309a, 0x05 }, /* pll2 sys divider */
-	{ 0x309b, 0x04 }, /* pll2 adc divider */
-	{ 0x309d, 0x00 }, /* pll2 divider */
-	{ 0x30b0, 0x0a }, /* pll1 pix divider */
-	{ 0x30b1, 0x01 }, /* pll1 divider */
-	{ 0x30b3, 0x64 }, /* pll1 multiplier */
-	{ 0x30b4, 0x03 }, /* pll1 pre divider */
-	{ 0x30b5, 0x05 }, /* pll1 mipi divider */
 	{ 0x3106, 0xda },
 	{ 0x3503, 0x07 },
 	{ 0x3509, 0x10 },
@@ -394,16 +437,6 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
 	{ 0x301c, 0x00 },
 	{ 0x3023, 0x05 },
 	{ 0x3037, 0xf0 },
-	{ 0x3098, 0x04 }, /* pll2 pre divider */
-	{ 0x3099, 0x28 }, /* pll2 multiplier */
-	{ 0x309a, 0x05 }, /* pll2 sys divider */
-	{ 0x309b, 0x04 }, /* pll2 adc divider */
-	{ 0x309d, 0x00 }, /* pll2 divider */
-	{ 0x30b0, 0x0a }, /* pll1 pix divider */
-	{ 0x30b1, 0x01 }, /* pll1 divider */
-	{ 0x30b3, 0x64 }, /* pll1 multiplier */
-	{ 0x30b4, 0x03 }, /* pll1 pre divider */
-	{ 0x30b5, 0x05 }, /* pll1 mipi divider */
 	{ 0x3106, 0xda },
 	{ 0x3503, 0x07 },
 	{ 0x3509, 0x10 },
@@ -519,6 +552,10 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
 	{ 0x5001, 0x80 },
 };
 
+static const unsigned long supported_xclk_rates[] = {
+	[OV7251_24_MHZ] = 24000000,
+};
+
 static const s64 link_freq[] = {
 	240000000,
 };
@@ -692,6 +729,63 @@ static int ov7251_read_reg(struct ov7251 *ov7251, u16 reg, u8 *val)
 	return 0;
 }
 
+static int ov7251_pll_configure(struct ov7251 *ov7251)
+{
+	const struct ov7251_pll_configs *configs;
+	int ret;
+
+	configs = ov7251->pll_configs;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_PRE_DIV_REG,
+			       configs->pll1->pre_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_MULT_REG,
+			       configs->pll1->mult);
+	if (ret < 0)
+		return ret;
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_DIVIDER_REG,
+			       configs->pll1->div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_PIX_DIV_REG,
+			       configs->pll1->pix_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_MIPI_DIV_REG,
+			       configs->pll1->mipi_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_PRE_DIV_REG,
+			       configs->pll2->pre_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_MULT_REG,
+			       configs->pll2->mult);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_DIVIDER_REG,
+			       configs->pll2->div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_SYS_DIV_REG,
+			       configs->pll2->sys_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_ADC_DIV_REG,
+			       configs->pll2->adc_div);
+
+	return ret;
+}
+
 static int ov7251_set_exposure(struct ov7251 *ov7251, s32 exposure)
 {
 	u16 reg;
@@ -1143,6 +1237,11 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 	mutex_lock(&ov7251->lock);
 
 	if (enable) {
+		ret = ov7251_pll_configure(ov7251);
+		if (ret)
+			return dev_err_probe(ov7251->dev, ret,
+					     "error configuring PLLs\n");
+
 		ret = ov7251_set_register_array(ov7251,
 					ov7251->current_mode->data,
 					ov7251->current_mode->data_size);
@@ -1325,6 +1424,7 @@ static int ov7251_probe(struct i2c_client *client)
 	struct ov7251 *ov7251;
 	u8 chip_id_high, chip_id_low, chip_rev;
 	int ret;
+	int i;
 
 	ov7251 = devm_kzalloc(dev, sizeof(struct ov7251), GFP_KERNEL);
 	if (!ov7251)
@@ -1363,6 +1463,11 @@ static int ov7251_probe(struct i2c_client *client)
 		dev_err(dev, "could not set xclk frequency\n");
 		return ret;
 	}
+	for (i = 0; i < ARRAY_SIZE(supported_xclk_rates); i++)
+		if (ov7251->xclk_freq == supported_xclk_rates[i])
+			break;
+
+	ov7251->pll_configs = ov7251_pll_configs[i];
 
 	ov7251->io_regulator = devm_regulator_get(dev, "vdddo");
 	if (IS_ERR(ov7251->io_regulator)) {
-- 
2.25.1

