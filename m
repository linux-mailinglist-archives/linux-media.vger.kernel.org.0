Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E1A3E4F9F
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236944AbhHIW7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhHIW7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A79C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id f5so7709574wrm.13
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SJrufKJjaLxdMoyjsvkVa1bnKNgVyDCa5SfbalBDx3M=;
        b=ux3mrfR7KxKshAB1dPtqQegTFA/4Mw49CG3CSr1ZYjZYlNzti87ryMaT78x+VuDuCo
         8NADQlU8b3lKb+3hhyJAe6uxk6q+wv7gUKvDMRC7U5s8Gi7z9p/OLz4YQl7U76tJDXy5
         jTWRpgRYgS6QLx4+6OiaAZ1JmFfUuX/gp3h25eMsnK5JKbaEPLrGArfCe9GvFsvKLtYo
         4FOnKCfg4u51Co2bnHpuLdJG6Nc0NJEu/o4eDXHPFQUmXl5oqyGyR2uuV10B3AHAkR0D
         OtF9hCPmAt7VLlmu9KP9EB7qdmp8n+PWRCUCPYxp59Lykzq8JtTyokuFiuLzWgL2wME8
         8Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SJrufKJjaLxdMoyjsvkVa1bnKNgVyDCa5SfbalBDx3M=;
        b=V3pTuT6HaVzkKfRkfWInQ2wUABqQPzNbfoPINU1t7LcZAyXgAMubrLLlioP/ZnSfM5
         iIZaGsuomYD4esPSxrm+PJB4NiVuSf89vK3j8gIpbNjtb0xr//g4+cYoj4qY40JDSHVG
         AhHKrbH02q2qKq9OkuSnR3XE9E2l1gHyGF82yecdegtRKklcc1IgTUZaATlEnXy7WIHz
         RXxRblsQcCu3xgPV5irc0J5DNEVVhvsTYAcImLmBX9+XMWu4uv/DKx4LyWhYIk9xGTIF
         AlgSGQLxGM0C323YsC/yaHohCg2kbck1v9OQWzAMX4U9JQX0Sxbft5y6YNx22dJ37NBC
         BD5g==
X-Gm-Message-State: AOAM532oslL9KlR9bnChJtUjK4Pi10i08Cz76IW2le98/ruzgEBgrmK1
        pD0D06xpuBxBHFQTZoWbCXk=
X-Google-Smtp-Source: ABdhPJwdvVxFqKwjqrnQ98qqmwzSIHqNdE386Gr2+n6T5VFdYB7DZwB0YFSafKeTa8LoTgVTOZ/FCw==
X-Received: by 2002:a05:6000:1805:: with SMTP id m5mr12773826wrh.265.1628549942123;
        Mon, 09 Aug 2021 15:59:02 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:01 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 04/12] media: i2c: Support 19.2MHz input clock in ov8865
Date:   Mon,  9 Aug 2021 23:58:37 +0100
Message-Id: <20210809225845.916430-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver as written expects a 24MHz input clock, but the sensor
is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
Add a set of PLL configurations to the driver to support that rate too.
As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
during probe and set that rate if one is found.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- Added an enum defining the possible frequency rates to index the
	  array (Andy)

 drivers/media/i2c/ov8865.c | 164 +++++++++++++++++++++++++++----------
 1 file changed, 121 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index fe700787bfb9..1382b16d1a09 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -21,10 +21,6 @@
 #include <media/v4l2-image-sizes.h>
 #include <media/v4l2-mediabus.h>
 
-/* Clock rate */
-
-#define OV8865_EXTCLK_RATE			24000000
-
 /* Register definitions */
 
 /* System */
@@ -567,6 +563,19 @@ struct ov8865_sclk_config {
 	unsigned int sclk_div;
 };
 
+/* Clock rate */
+
+enum extclk_rate {
+	OV8865_19_2_MHZ,
+	OV8865_24_MHZ,
+	OV8865_NUM_SUPPORTED_RATES,
+};
+
+static const unsigned long supported_extclk_rates[] = {
+	[OV8865_19_2_MHZ] = 19200000,
+	[OV8865_24_MHZ] = 24000000,
+};
+
 /*
  * General formulas for (array-centered) mode calculation:
  * - photo_array_width = 3296
@@ -665,6 +674,9 @@ struct ov8865_sensor {
 	struct regulator *avdd;
 	struct regulator *dvdd;
 	struct regulator *dovdd;
+
+	unsigned long extclk_rate;
+	enum extclk_rate extclk_rate_idx;
 	struct clk *extclk;
 
 	struct v4l2_fwnode_endpoint endpoint;
@@ -680,49 +692,83 @@ struct ov8865_sensor {
 /* Static definitions */
 
 /*
- * EXTCLK = 24 MHz
  * PHY_SCLK = 720 MHz
  * MIPI_PCLK = 90 MHz
  */
-static const struct ov8865_pll1_config ov8865_pll1_config_native = {
-	.pll_pre_div_half	= 1,
-	.pll_pre_div		= 0,
-	.pll_mul		= 30,
-	.m_div			= 1,
-	.mipi_div		= 3,
-	.pclk_div		= 1,
-	.sys_pre_div		= 1,
-	.sys_div		= 2,
+
+static const struct ov8865_pll1_config ov8865_pll1_configs_native[] = {
+	{ /* 19.2 MHz input clock */
+		.pll_pre_div_half	= 1,
+		.pll_pre_div		= 2,
+		.pll_mul		= 75,
+		.m_div			= 1,
+		.mipi_div		= 3,
+		.pclk_div		= 1,
+		.sys_pre_div		= 1,
+		.sys_div		= 2,
+	},
+	{ /* 24MHz input clock */
+		.pll_pre_div_half	= 1,
+		.pll_pre_div		= 0,
+		.pll_mul		= 30,
+		.m_div			= 1,
+		.mipi_div		= 3,
+		.pclk_div		= 1,
+		.sys_pre_div		= 1,
+		.sys_div		= 2,
+	},
 };
 
 /*
- * EXTCLK = 24 MHz
  * DAC_CLK = 360 MHz
  * SCLK = 144 MHz
  */
 
-static const struct ov8865_pll2_config ov8865_pll2_config_native = {
-	.pll_pre_div_half	= 1,
-	.pll_pre_div		= 0,
-	.pll_mul		= 30,
-	.dac_div		= 2,
-	.sys_pre_div		= 5,
-	.sys_div		= 0,
+static const struct ov8865_pll2_config ov8865_pll2_configs_native[] = {
+	/* 19.2MHz input clock */
+	{
+		.pll_pre_div_half	= 1,
+		.pll_pre_div		= 5,
+		.pll_mul		= 75,
+		.dac_div		= 1,
+		.sys_pre_div		= 1,
+		.sys_div		= 3,
+	},
+	/* 24MHz input clock */
+	{
+		.pll_pre_div_half	= 1,
+		.pll_pre_div		= 0,
+		.pll_mul		= 30,
+		.dac_div		= 2,
+		.sys_pre_div		= 5,
+		.sys_div		= 0,
+	}
 };
 
 /*
- * EXTCLK = 24 MHz
  * DAC_CLK = 360 MHz
  * SCLK = 72 MHz
  */
 
-static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
+static const struct ov8865_pll2_config ov8865_pll2_configs_binning[] = {
+	/* 19.2MHz input clock */
+	{
+	.pll_pre_div_half	= 1,
+	.pll_pre_div		= 2,
+	.pll_mul		= 75,
+	.dac_div		= 2,
+	.sys_pre_div		= 10,
+	.sys_div		= 0,
+	},
+	/* 24MHz input clock */
+	{
 	.pll_pre_div_half	= 1,
 	.pll_pre_div		= 0,
 	.pll_mul		= 30,
 	.dac_div		= 2,
 	.sys_pre_div		= 10,
 	.sys_div		= 0,
+	}
 };
 
 static const struct ov8865_sclk_config ov8865_sclk_config_native = {
@@ -934,8 +980,8 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_native,
+		.pll1_config			= ov8865_pll1_configs_native,
+		.pll2_config			= ov8865_pll2_configs_native,
 		.sclk_config			= &ov8865_sclk_config_native,
 
 		/* Registers */
@@ -990,8 +1036,8 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_native,
+		.pll1_config			= ov8865_pll1_configs_native,
+		.pll2_config			= ov8865_pll2_configs_native,
 		.sclk_config			= &ov8865_sclk_config_native,
 
 		/* Registers */
@@ -1050,8 +1096,8 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_binning,
+		.pll1_config			= ov8865_pll1_configs_native,
+		.pll2_config			= ov8865_pll2_configs_binning,
 		.sclk_config			= &ov8865_sclk_config_native,
 
 		/* Registers */
@@ -1116,8 +1162,8 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 90 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_binning,
+		.pll1_config			= ov8865_pll1_configs_native,
+		.pll2_config			= ov8865_pll2_configs_binning,
 		.sclk_config			= &ov8865_sclk_config_native,
 
 		/* Registers */
@@ -1513,12 +1559,11 @@ static int ov8865_isp_configure(struct ov8865_sensor *sensor)
 static unsigned long ov8865_mode_pll1_rate(struct ov8865_sensor *sensor,
 					   const struct ov8865_mode *mode)
 {
-	const struct ov8865_pll1_config *config = mode->pll1_config;
-	unsigned long extclk_rate;
+	const struct ov8865_pll1_config *config;
 	unsigned long pll1_rate;
 
-	extclk_rate = clk_get_rate(sensor->extclk);
-	pll1_rate = extclk_rate * config->pll_mul / config->pll_pre_div_half;
+	config = &mode->pll1_config[sensor->extclk_rate_idx];
+	pll1_rate = sensor->extclk_rate * config->pll_mul / config->pll_pre_div_half;
 
 	switch (config->pll_pre_div) {
 	case 0:
@@ -1552,10 +1597,12 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
 				      const struct ov8865_mode *mode,
 				      u32 mbus_code)
 {
-	const struct ov8865_pll1_config *config = mode->pll1_config;
+	const struct ov8865_pll1_config *config;
 	u8 value;
 	int ret;
 
+	config = &mode->pll1_config[sensor->extclk_rate_idx];
+
 	switch (mbus_code) {
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 		value = OV8865_MIPI_BIT_SEL(10);
@@ -1622,9 +1669,11 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
 static int ov8865_mode_pll2_configure(struct ov8865_sensor *sensor,
 				      const struct ov8865_mode *mode)
 {
-	const struct ov8865_pll2_config *config = mode->pll2_config;
+	const struct ov8865_pll2_config *config;
 	int ret;
 
+	config = &mode->pll2_config[sensor->extclk_rate_idx];
+
 	ret = ov8865_write(sensor, OV8865_PLL_CTRL12_REG,
 			   OV8865_PLL_CTRL12_PRE_DIV_HALF(config->pll_pre_div_half) |
 			   OV8865_PLL_CTRL12_DAC_DIV(config->dac_div));
@@ -2053,9 +2102,11 @@ static int ov8865_mode_configure(struct ov8865_sensor *sensor,
 static unsigned long ov8865_mode_mipi_clk_rate(struct ov8865_sensor *sensor,
 					       const struct ov8865_mode *mode)
 {
-	const struct ov8865_pll1_config *config = mode->pll1_config;
+	const struct ov8865_pll1_config *config;
 	unsigned long pll1_rate;
 
+	config = &mode->pll1_config[sensor->extclk_rate_idx];
+
 	pll1_rate = ov8865_mode_pll1_rate(sensor, mode);
 
 	return pll1_rate / config->m_div / 2;
@@ -2783,7 +2834,8 @@ static int ov8865_probe(struct i2c_client *client)
 	struct ov8865_sensor *sensor;
 	struct v4l2_subdev *subdev;
 	struct media_pad *pad;
-	unsigned long rate;
+	unsigned int rate;
+	unsigned int i;
 	int ret;
 
 	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
@@ -2858,13 +2910,39 @@ static int ov8865_probe(struct i2c_client *client)
 		goto error_endpoint;
 	}
 
-	rate = clk_get_rate(sensor->extclk);
-	if (rate != OV8865_EXTCLK_RATE) {
-		dev_err(dev, "clock rate %lu Hz is unsupported\n", rate);
+	/*
+	 * We could have either a 24MHz or 19.2MHz clock rate. Check for a
+	 * clock-frequency property and if found, set that rate. This should
+	 * cover ACPI case. If the system uses devicetree then the configured
+	 * rate should already be set, so we'll have to check it.
+	 */
+
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+				       &rate);
+	if (!ret) {
+		ret = clk_set_rate(sensor->extclk, rate);
+		if (ret) {
+			dev_err(dev, "failed to set clock rate\n");
+			return ret;
+		}
+	}
+
+	sensor->extclk_rate = clk_get_rate(sensor->extclk);
+
+	for (i = 0; i < ARRAY_SIZE(supported_extclk_rates); i++) {
+		if (sensor->extclk_rate == supported_extclk_rates[i])
+			break;
+	}
+
+	if (i == ARRAY_SIZE(supported_extclk_rates)) {
+		dev_err(dev, "clock rate %lu Hz is unsupported\n",
+			sensor->extclk_rate);
 		ret = -EINVAL;
 		goto error_endpoint;
 	}
 
+	sensor->extclk_rate_idx = i;
+
 	/* Subdev, entity and pad */
 
 	subdev = &sensor->subdev;
-- 
2.25.1

