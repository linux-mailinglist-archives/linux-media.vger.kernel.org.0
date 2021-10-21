Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF02436CE9
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbhJUVqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbhJUVqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:17 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A25C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:00 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k7so1571743wrd.13
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RvxVegX1FXBoOxhaC4k1bmOAp6kDipSv5INLjBBFwQ=;
        b=MJilh3lL4kjBbe8qBv26wuejT9Hz2v6d5XBEsFjox28M9kVO3InU9Gd+2P/kE1oTVh
         gr8Io4TIPhfhSJOsfPR+J3kZsRTLT5AZosjzp+9uc+75juY9Hvosu2Dh4KcpY0MZpIda
         p6YRgFi74AN54/dGlN6wir+ytfCum/RbUJGUWuHQ8Lg3XCKniBW5EKuqbOlO6WKj/DkT
         GgOiHMVNsgj5A+ruCVhKb+FplJNootXSu0GTCwxZ4tH+4rtpNyVFFRyKUyepp2d8eoLz
         guoe7jMjWMAmsZouvkR5MeaBRujqFG6+5n8ogDdXIifkQwVKhIH1mJUrCXR5uetHmiTk
         mQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RvxVegX1FXBoOxhaC4k1bmOAp6kDipSv5INLjBBFwQ=;
        b=c+690RsiAbzwSGExYwxXBCqXEW0cHIhp0hAVolzjydAgGfyYOrTnXMKYHkbZbMf/k4
         aCambDd9YLPyD8yu5Gst+j/TzRwwV5Y/ow37cCm7QSawHWfwa1mjHVP2EK016A9t4MKH
         2x49uF3pgwK8ET1iiNo81vonxFz5br+ol98cSSl6DnKNzV7gjQ9be40ppT8gyZZ0uiR2
         DmmAJkuUs8o40zywqXOK6A5L6KKZdwN5epR3W1a4wDCcsf+VI8f6lfIkjvfjq3gT4SSX
         n73rErRIByak0BX9RJmfPYEiqDov7civhF/XFZo6lj3tKR1304DO9T+ffhZ2bRd2wav8
         SM1Q==
X-Gm-Message-State: AOAM533e0X4TRwVn78KiofdOtDTXj+h85wElZkcnzgakaMDf2nn0OyHV
        L2kIScwbHX/7US1RFnjVCU7+ZiGoR1I=
X-Google-Smtp-Source: ABdhPJx2rmDik9Hobn8cg6hMIa32V8HIs60ouz9UlBvwZup7t8rWjtmwoWmoo0Mgg/BfddxZs2ZXjQ==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr10492346wrg.359.1634852639268;
        Thu, 21 Oct 2021 14:43:59 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:43:58 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 04/16] media: i2c: Support 19.2MHz input clock in ov8865
Date:   Thu, 21 Oct 2021 22:43:19 +0100
Message-Id: <20211021214331.1188787-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
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
Changes in v3:

	- Switched to a frequency specific struct for each possible frequency
	(sakari - hope I understood you right here!)

 drivers/media/i2c/ov8865.c | 186 +++++++++++++++++++++++++++----------
 1 file changed, 135 insertions(+), 51 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index ae3902d3de95..23e80d8114d7 100644
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
 
+static struct ov8865_pll_configs ov8865_pll_configs_19_2mhz = {
+	.pll1_config = &ov8865_pll1_config_native_19_2mhz,
+	.pll2_config_native = &ov8865_pll2_config_native_19_2mhz,
+	.pll2_config_binning = &ov8865_pll2_config_binning_19_2mhz,
+};
+
+static struct ov8865_pll_configs ov8865_pll_configs_24mhz = {
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
+	unsigned int rate;
+	unsigned int i;
 	int ret;
 
 	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
@@ -2858,13 +2917,38 @@ static int ov8865_probe(struct i2c_client *client)
 		goto error_endpoint;
 	}
 
-	rate = clk_get_rate(sensor->extclk);
-	if (rate != OV8865_EXTCLK_RATE) {
-		dev_err(dev, "clock rate %lu Hz is unsupported\n", rate);
+	/*
+	 * We could have either a 24MHz or 19.2MHz clock rate. Check for a
+	 * clock-frequency property and if found, set that rate. This should
+	 * cover the ACPI case. If the system uses devicetree then the
+	 * configured rate should already be set, so we'll have to check it.
+	 */
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
 
+	sensor->pll_configs = ov8865_pll_configs[i];
+
 	/* Subdev, entity and pad */
 
 	subdev = &sensor->subdev;
-- 
2.25.1

