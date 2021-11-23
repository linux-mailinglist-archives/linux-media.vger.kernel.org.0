Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062974598CF
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbhKWADz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbhKWADj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:39 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC07C061757
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:31 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso594428wms.3
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QAOFuTZDcU6UY2gLUMYLWM7C8t9BlrHjSO1QA9m0wvE=;
        b=HhRigLZtH8/BVsDQDM2RUBb5nKctu0DjsZKjzZGfUuvEJ8MHBw5MN3ZO9IQeAI+g8d
         JexwbMWpW2u6u/LnWt82XS4ndJMHuxneD7dCoGlIuVK43MG+0M3I1orqoz5MDnWvrQ20
         7QjZkncq25M85MGpzrLXXq/X7M2pN2us3t6g8V69Do14rgnbAxqzrckic7XU3fZ19f4w
         xUqi9uzSj3dUcijvNV54ayrdQFZCcqY0in20ya+4m5HdV1ubxCXZzuWe12j5QD/3QtF/
         6/ldW7P+DuPck//z4r+F2D9oKS7xd4fZiesanXe0yqLlFFR4cKyfbWAxnld2kzRWv8p+
         J8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QAOFuTZDcU6UY2gLUMYLWM7C8t9BlrHjSO1QA9m0wvE=;
        b=2wfiB5BLbF9Ivb59VwljoTizQ+pwWCLkEgDTac7rL2zC7i8n95/H8JeWu29+su+avD
         emGOC8oXmmcPfi6gL0NAH6GX+x13i+9s87RbcFdiMo/FUdb6rclM8c3VTxIaUGh9vfPI
         Cwie9hRImT6eSuUtaFJEwEUGn6ttxzqYB+myEpaAUjrfOAuFjShEu+HOmmqc+My8iz8a
         9zSM+wwkskvQMMTZwR8C6UTRYePE+X6uFhvBRONvTjy2Qo92xW+JaEbsc+RDpAV9S2fV
         vl4Omxn7DcUNhORYeffxzLGbveO88QcOEojK6CSZuTBB/ifn7E1wYJmKK3LLJK9bpcjf
         7d6g==
X-Gm-Message-State: AOAM531/Cxgr9gZMG9wsm+B+LjsJrGstJJKOK+jhFcE/O75GE2WR42SA
        zB8kDa1/B4y+n41iuPBhhiFRQAR/nu4=
X-Google-Smtp-Source: ABdhPJyppJWYvAfZRaGhJC4runXAfl6hMNdPSLHBFFEwjTnziZpj3Ju9isP6xur4vMtmQgKwRTO51w==
X-Received: by 2002:a05:600c:3489:: with SMTP id a9mr1484770wmq.120.1637625630315;
        Mon, 22 Nov 2021 16:00:30 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:29 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 06/17] media: i2c: Support 19.2MHz input clock in ov8865
Date:   Tue, 23 Nov 2021 00:00:06 +0000
Message-Id: <20211123000017.43187-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
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
Changes in v5: 

	- (Sakari) Constified some new structs
	- (Sakari) Reworked .probe() to account for the possibility of no
	clock being acquired, provided a clock-frequency is present in fwnode
	properties.

 drivers/media/i2c/ov8865.c | 195 +++++++++++++++++++++++++++----------
 1 file changed, 143 insertions(+), 52 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 68fdb1ce1e94..e52e43bd7787 100644
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
@@ -567,6 +563,25 @@ struct ov8865_sclk_config {
 	unsigned int sclk_div;
 };
 
+struct ov8865_pll_configs {
+	const struct ov8865_pll1_config *pll1_config;
+	const struct ov8865_pll2_config *pll2_config_native;
+	const struct ov8865_pll2_config *pll2_config_binning;
+};
+
+/* Clock rate */
+
+enum extclk_rate {
+	OV8865_19_2_MHZ,
+	OV8865_24_MHZ,
+	OV8865_NUM_SUPPORTED_RATES
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
@@ -635,9 +650,7 @@ struct ov8865_mode {
 
 	struct v4l2_fract frame_interval;
 
-	const struct ov8865_pll1_config *pll1_config;
-	const struct ov8865_pll2_config *pll2_config;
-	const struct ov8865_sclk_config *sclk_config;
+	bool pll2_binning;
 
 	const struct ov8865_register_value *register_values;
 	unsigned int register_values_count;
@@ -665,6 +678,9 @@ struct ov8865_sensor {
 	struct regulator *avdd;
 	struct regulator *dvdd;
 	struct regulator *dovdd;
+
+	unsigned long extclk_rate;
+	const struct ov8865_pll_configs *pll_configs;
 	struct clk *extclk;
 
 	struct v4l2_fwnode_endpoint endpoint;
@@ -680,43 +696,70 @@ struct ov8865_sensor {
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
+static const struct ov8865_pll1_config ov8865_pll1_config_native_19_2mhz = {
+		.pll_pre_div_half	= 1,
+		.pll_pre_div		= 2,
+		.pll_mul		= 75,
+		.m_div			= 1,
+		.mipi_div		= 3,
+		.pclk_div		= 1,
+		.sys_pre_div		= 1,
+		.sys_div		= 2,
+};
+
+static const struct ov8865_pll1_config ov8865_pll1_config_native_24mhz = {
+		.pll_pre_div_half	= 1,
+		.pll_pre_div		= 0,
+		.pll_mul		= 30,
+		.m_div			= 1,
+		.mipi_div		= 3,
+		.pclk_div		= 1,
+		.sys_pre_div		= 1,
+		.sys_div		= 2,
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
+static const struct ov8865_pll2_config ov8865_pll2_config_native_19_2mhz = {
+		.pll_pre_div_half	= 1,
+		.pll_pre_div		= 5,
+		.pll_mul		= 75,
+		.dac_div		= 1,
+		.sys_pre_div		= 1,
+		.sys_div		= 3,
+};
+
+static const struct ov8865_pll2_config ov8865_pll2_config_native_24mhz = {
+		.pll_pre_div_half	= 1,
+		.pll_pre_div		= 0,
+		.pll_mul		= 30,
+		.dac_div		= 2,
+		.sys_pre_div		= 5,
+		.sys_div		= 0,
 };
 
 /*
- * EXTCLK = 24 MHz
  * DAC_CLK = 360 MHz
  * SCLK = 72 MHz
  */
 
-static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
+static const struct ov8865_pll2_config ov8865_pll2_config_binning_19_2mhz = {
+	.pll_pre_div_half	= 1,
+	.pll_pre_div		= 2,
+	.pll_mul		= 75,
+	.dac_div		= 2,
+	.sys_pre_div		= 10,
+	.sys_div		= 0,
+};
+
+static const struct ov8865_pll2_config ov8865_pll2_config_binning_24mhz = {
 	.pll_pre_div_half	= 1,
 	.pll_pre_div		= 0,
 	.pll_mul		= 30,
@@ -725,6 +768,23 @@ static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
 	.sys_div		= 0,
 };
 
+static const struct ov8865_pll_configs ov8865_pll_configs_19_2mhz = {
+	.pll1_config = &ov8865_pll1_config_native_19_2mhz,
+	.pll2_config_native = &ov8865_pll2_config_native_19_2mhz,
+	.pll2_config_binning = &ov8865_pll2_config_binning_19_2mhz,
+};
+
+static const struct ov8865_pll_configs ov8865_pll_configs_24mhz = {
+	.pll1_config = &ov8865_pll1_config_native_24mhz,
+	.pll2_config_native = &ov8865_pll2_config_native_24mhz,
+	.pll2_config_binning = &ov8865_pll2_config_binning_24mhz,
+};
+
+static const struct ov8865_pll_configs *ov8865_pll_configs[] = {
+	&ov8865_pll_configs_19_2mhz,
+	&ov8865_pll_configs_24mhz,
+};
+
 static const struct ov8865_sclk_config ov8865_sclk_config_native = {
 	.sys_sel		= 1,
 	.sclk_sel		= 0,
@@ -934,9 +994,7 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_native,
-		.sclk_config			= &ov8865_sclk_config_native,
+		.pll2_binning			= false,
 
 		/* Registers */
 		.register_values	= ov8865_register_values_native,
@@ -990,9 +1048,7 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_native,
-		.sclk_config			= &ov8865_sclk_config_native,
+		.pll2_binning			= false,
 
 		/* Registers */
 		.register_values	= ov8865_register_values_native,
@@ -1050,9 +1106,7 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_binning,
-		.sclk_config			= &ov8865_sclk_config_native,
+		.pll2_binning			= true,
 
 		/* Registers */
 		.register_values	= ov8865_register_values_binning,
@@ -1116,9 +1170,7 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 90 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_binning,
-		.sclk_config			= &ov8865_sclk_config_native,
+		.pll2_binning			= true,
 
 		/* Registers */
 		.register_values	= ov8865_register_values_binning,
@@ -1513,12 +1565,11 @@ static int ov8865_isp_configure(struct ov8865_sensor *sensor)
 static unsigned long ov8865_mode_pll1_rate(struct ov8865_sensor *sensor,
 					   const struct ov8865_mode *mode)
 {
-	const struct ov8865_pll1_config *config = mode->pll1_config;
-	unsigned long extclk_rate;
+	const struct ov8865_pll1_config *config;
 	unsigned long pll1_rate;
 
-	extclk_rate = clk_get_rate(sensor->extclk);
-	pll1_rate = extclk_rate * config->pll_mul / config->pll_pre_div_half;
+	config = sensor->pll_configs->pll1_config;
+	pll1_rate = sensor->extclk_rate * config->pll_mul / config->pll_pre_div_half;
 
 	switch (config->pll_pre_div) {
 	case 0:
@@ -1552,10 +1603,12 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
 				      const struct ov8865_mode *mode,
 				      u32 mbus_code)
 {
-	const struct ov8865_pll1_config *config = mode->pll1_config;
+	const struct ov8865_pll1_config *config;
 	u8 value;
 	int ret;
 
+	config = sensor->pll_configs->pll1_config;
+
 	switch (mbus_code) {
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 		value = OV8865_MIPI_BIT_SEL(10);
@@ -1622,9 +1675,12 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
 static int ov8865_mode_pll2_configure(struct ov8865_sensor *sensor,
 				      const struct ov8865_mode *mode)
 {
-	const struct ov8865_pll2_config *config = mode->pll2_config;
+	const struct ov8865_pll2_config *config;
 	int ret;
 
+	config = mode->pll2_binning ? sensor->pll_configs->pll2_config_binning :
+				      sensor->pll_configs->pll2_config_native;
+
 	ret = ov8865_write(sensor, OV8865_PLL_CTRL12_REG,
 			   OV8865_PLL_CTRL12_PRE_DIV_HALF(config->pll_pre_div_half) |
 			   OV8865_PLL_CTRL12_DAC_DIV(config->dac_div));
@@ -1658,7 +1714,7 @@ static int ov8865_mode_pll2_configure(struct ov8865_sensor *sensor,
 static int ov8865_mode_sclk_configure(struct ov8865_sensor *sensor,
 				      const struct ov8865_mode *mode)
 {
-	const struct ov8865_sclk_config *config = mode->sclk_config;
+	const struct ov8865_sclk_config *config = &ov8865_sclk_config_native;
 	int ret;
 
 	ret = ov8865_write(sensor, OV8865_CLK_SEL0_REG,
@@ -2053,9 +2109,11 @@ static int ov8865_mode_configure(struct ov8865_sensor *sensor,
 static unsigned long ov8865_mode_mipi_clk_rate(struct ov8865_sensor *sensor,
 					       const struct ov8865_mode *mode)
 {
-	const struct ov8865_pll1_config *config = mode->pll1_config;
+	const struct ov8865_pll1_config *config;
 	unsigned long pll1_rate;
 
+	config = sensor->pll_configs->pll1_config;
+
 	pll1_rate = ov8865_mode_pll1_rate(sensor, mode);
 
 	return pll1_rate / config->m_div / 2;
@@ -2783,7 +2841,8 @@ static int ov8865_probe(struct i2c_client *client)
 	struct ov8865_sensor *sensor;
 	struct v4l2_subdev *subdev;
 	struct media_pad *pad;
-	unsigned long rate;
+	unsigned int rate = 0;
+	unsigned int i;
 	int ret;
 
 	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
@@ -2852,19 +2911,51 @@ static int ov8865_probe(struct i2c_client *client)
 	/* External Clock */
 
 	sensor->extclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(sensor->extclk)) {
+	if (PTR_ERR(sensor->extclk) == -ENOENT) {
+		dev_info(dev, "no external clock found, continuing...\n");
+		sensor->extclk = NULL;
+	} else if (IS_ERR(sensor->extclk)) {
 		dev_err(dev, "failed to get external clock\n");
 		ret = PTR_ERR(sensor->extclk);
 		goto error_endpoint;
 	}
 
-	rate = clk_get_rate(sensor->extclk);
-	if (rate != OV8865_EXTCLK_RATE) {
-		dev_err(dev, "clock rate %lu Hz is unsupported\n", rate);
+	/*
+	 * We could have either a 24MHz or 19.2MHz clock rate from either dt or
+	 * ACPI...but we also need to support the weird IPU3 case which will
+	 * have an external clock AND a clock-frequency property. Check for the
+	 * clock-frequency property and if found, set that rate if we managed
+	 * to acquire a clock. This should cover the ACPI case. If the system
+	 * uses devicetree then the configured rate should already be set, so
+	 * we can just read it.
+	 */
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+				       &rate);
+	if (!ret && sensor->extclk) {
+		ret = clk_set_rate(sensor->extclk, rate);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to set clock rate\n");
+	} else if (ret && !sensor->extclk) {
+		return dev_err_probe(dev, ret, "invalid clock config\n");
+	}
+
+	sensor->extclk_rate = rate ? rate : clk_get_rate(sensor->extclk);
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
 
+	sensor->pll_configs = ov8865_pll_configs[i];
+
 	/* Subdev, entity and pad */
 
 	subdev = &sensor->subdev;
-- 
2.25.1

