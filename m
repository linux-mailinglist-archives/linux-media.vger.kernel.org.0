Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B5F3D2DC0
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhGVTyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhGVTx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:53:58 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B636C061757;
        Thu, 22 Jul 2021 13:34:31 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id g12so4070317wme.2;
        Thu, 22 Jul 2021 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HNd/zrFSnbVVK7tkVRqXgL3ZTic0XmSJrzcwHUq0XkQ=;
        b=a3gJDB86ofKDN3ZwkGguIggb5pxkABuCH2vqJf/+hRte8qePyV6hKOMYhPkT/iwMk+
         XQ1GIDqu4a3++cCx3FhIe/3UsBJmhkGXAFoN6DdTKJdzYFToyvcQ5T8Fu3ELVExgL8wU
         APqGXsxGGkAfnl0TdMRHMyHoPxxslXkh511rZ0+aVKz/SMUSsCOYVMoVGvmzva0/gzJR
         2U1MAwvn9zyjA7boMx4piCmOjA0IhQl9suqwpHa97Es2ahLOmb+e0pv/diAHhztMG01a
         2t+SMSgrAUPACRnKlMQvuyJbQd4CKrBzLaAlKz3iwC2F1dGiqazpE2VMwB09BD0QfMK1
         D9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HNd/zrFSnbVVK7tkVRqXgL3ZTic0XmSJrzcwHUq0XkQ=;
        b=AAzsSecS5/q3GY+n58Um9uHe4FxfXIYYlyesfp5HaBA+xqZDPdKG30Spdiq69dWWzQ
         xaDgt2dYg2iciHLDs7pz5EGpeT+xhtMgIaqMNTaaJ3SvFnm34Cwvpe5Q43izytt1O3sn
         H1kJWb+LtrSdLfqR8uHdGEDPyhBaqwKStn3tFoQZek00oLz/VdG6y+sRUqktXaEcfuLE
         kkrwC49NGvf4yHhV1cL5fuEW+5BVKv+tp4o11+vqLZao2PL0ywwCkWUGnSfB1fFcEo8N
         RLZLVr8c895V9jc7UF8qfYcqIfCEH4TL23DTlQ5LVGPmbCi03LjRbnH6gYMyHd9rZWRN
         Totw==
X-Gm-Message-State: AOAM5327WVCbddQ8lLMJn3S0Bqb97OZF+i5M3V6ek+DCtJ3IV1/SPOyA
        IUEg3HHJAxXL+8WL8kiAXbY=
X-Google-Smtp-Source: ABdhPJz+t4qUAGg3biFXCrklIBGjL8wMqIqI+QhxXLEIlZFzzY0u9ajyv4sU75PWjsCh29BsJuvAQw==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr10751114wmj.76.1626986070049;
        Thu, 22 Jul 2021 13:34:30 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:29 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 04/13] media: i2c: Support 19.2MHz input clock in ov8865
Date:   Thu, 22 Jul 2021 21:33:58 +0100
Message-Id: <20210722203407.3588046-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
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
 drivers/media/i2c/ov8865.c | 158 +++++++++++++++++++++++++++----------
 1 file changed, 115 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 66182142c28b..8739eea762c5 100644
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
@@ -665,6 +661,9 @@ struct ov8865_sensor {
 	struct regulator *avdd;
 	struct regulator *dvdd;
 	struct regulator *dovdd;
+
+	unsigned long extclk_rate;
+	unsigned int extclk_rate_idx;
 	struct clk *extclk;
 
 	struct v4l2_fwnode_endpoint endpoint;
@@ -680,49 +679,83 @@ struct ov8865_sensor {
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
@@ -934,8 +967,8 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_native,
+		.pll1_config			= ov8865_pll1_configs_native,
+		.pll2_config			= ov8865_pll2_configs_native,
 		.sclk_config			= &ov8865_sclk_config_native,
 
 		/* Registers */
@@ -990,8 +1023,8 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_native,
+		.pll1_config			= ov8865_pll1_configs_native,
+		.pll2_config			= ov8865_pll2_configs_native,
 		.sclk_config			= &ov8865_sclk_config_native,
 
 		/* Registers */
@@ -1050,8 +1083,8 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 30 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_binning,
+		.pll1_config			= ov8865_pll1_configs_native,
+		.pll2_config			= ov8865_pll2_configs_binning,
 		.sclk_config			= &ov8865_sclk_config_native,
 
 		/* Registers */
@@ -1116,8 +1149,8 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.frame_interval			= { 1, 90 },
 
 		/* PLL */
-		.pll1_config			= &ov8865_pll1_config_native,
-		.pll2_config			= &ov8865_pll2_config_binning,
+		.pll1_config			= ov8865_pll1_configs_native,
+		.pll2_config			= ov8865_pll2_configs_binning,
 		.sclk_config			= &ov8865_sclk_config_native,
 
 		/* Registers */
@@ -1266,6 +1299,13 @@ static const struct ov8865_register_value ov8865_init_sequence[] = {
 	{ 0x4503, 0x10 },
 };
 
+/* Clock rate */
+
+static const unsigned long supported_extclk_rates[] = {
+	19200000,
+	24000000,
+};
+
 static const s64 ov8865_link_freq_menu[] = {
 	360000000,
 };
@@ -1513,12 +1553,11 @@ static int ov8865_isp_configure(struct ov8865_sensor *sensor)
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
@@ -1552,10 +1591,12 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
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
@@ -1622,9 +1663,11 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
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
@@ -2053,9 +2096,11 @@ static int ov8865_mode_configure(struct ov8865_sensor *sensor,
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
@@ -2783,7 +2828,8 @@ static int ov8865_probe(struct i2c_client *client)
 	struct ov8865_sensor *sensor;
 	struct v4l2_subdev *subdev;
 	struct media_pad *pad;
-	unsigned long rate;
+	unsigned int rate;
+	unsigned int i;
 	int ret;
 
 	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
@@ -2858,13 +2904,39 @@ static int ov8865_probe(struct i2c_client *client)
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

