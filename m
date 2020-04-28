Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE301BC786
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 20:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgD1SH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 14:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728653AbgD1SH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 14:07:26 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF09C03C1AD
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 11:07:24 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k1so25822023wrx.4
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 11:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DWltPrJIPj2U1pq2RNL53+f1OFAV7BP1wwaGZV16ICI=;
        b=eVf/zNOORX0c+cxJnJ3sjYjFzwtDrffYhSlAdllWKK2ZeJWB5RjOhk2Jsg9hzDK+g5
         LYgq2DqXFXfOGHicGSC3/J+/Wf91JJSMWfFRk6KJ+9FR97p648BTrszUQADzxxRgDTxs
         n4IUEWOlTB2Nm44B4EuMErVYKP48zaFEsF+hzUPjLBa2QoqrRmdF2NM4cuf8/Tz86C+n
         jtixFKpno5AaXtd/Rz/ZfvFz9XN+1AN3V33pZsnijyoibjA7z1FReFvAykpR3LesLYs8
         bmetURWAyUMcZ3iDL3baJI9ZegvmDdTHfs+rnraARa5imuu/SfaSbnibT71pRauspqti
         +v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DWltPrJIPj2U1pq2RNL53+f1OFAV7BP1wwaGZV16ICI=;
        b=eFSEYCqzonkHLgV81Z7bVNxVaYRZ+bDjHnr3bivXTWBckgqgGqw5Uu5sBJA0X6UHQC
         g97pMdJ/pY7hYC6Dz87rQl5pmX/2Wa5Qtv+SFZxTJniANW0rUd8tylv22XeRcllE7Gkq
         vXhMV7YbnBN4Lj1jPDVLeUhYGsX0qYPcBIC0MJM08LZRBe6sOKKDNXJTsQ0ZnpLj0d+4
         NHSd/DehtXBXQNRBs1NpTrLKSvZG9uUhLZTDqnhnrxVmD2iXX4NwPlatfVHM5Yxaz9B3
         fC0xfOH9P9hwCbDKTRsMQ0rYw+djlGYTvg7V+TG33ArB+m43XAOn38XTXG8jYlCYpg15
         JayA==
X-Gm-Message-State: AGi0PuZ9dw9JgUh4PdmdG+g+PLsM/piSYZHVts84CDczP01r1o+2PDPt
        Rr6C5f71T0pozZcl+tdTMCjCCQ==
X-Google-Smtp-Source: APiQypK6gyhGESlhUy3nzPZsB05FbmMK7Pp3d6aM4aqQkcc7l4OOlCa7ldK9pnOqdrxaJZWn7k+RLA==
X-Received: by 2002:adf:aad4:: with SMTP id i20mr32722752wrc.47.1588097243365;
        Tue, 28 Apr 2020 11:07:23 -0700 (PDT)
Received: from xps7590.local ([37.120.81.28])
        by smtp.gmail.com with ESMTPSA id m14sm26202789wrs.76.2020.04.28.11.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 11:07:22 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v5 v5 2/3] media: ov8856: Add devicetree support
Date:   Tue, 28 Apr 2020 20:07:17 +0200
Message-Id: <20200428180718.1609826-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200428180718.1609826-1-robert.foss@linaro.org>
References: <20200428180718.1609826-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add match table, enable ov8856_probe() to support
both ACPI and DT modes.

ACPI and DT modes are primarily distinguished from
each other by relying on devm_XXX_get_optional()
will return NULL instead of a reference for the
desired managed resource.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

- Changes since v4:
  * Maxime & Sakari: Switch to clock-frequency

- Changes since v3:
  * Remove redundant {}-brackets
  * Compare xvclk_rate to 5% tolerance
  * Andy: Use dev_fwnode()
  * Andy: Use %pe instead of %ld + PTR_ERR()
  * Andy: Invert reset_gpio logic
  * Andy: Remove dev_dbg() from failing reset_gpio setup
  * Andy: Use dev_err for logging for failures
  * Andy: Remove dev_warn from EDEFER/regulator error path
  * Andy & Sakari: Replaced GPIOD_OUT_XXX with 0/1
  * Maxime & Sakari: Verify clock frequency from DT
  * Sakari: Verify the 'xvclk_rate' is set correctly for ACPI/DT devices
  * Sakari: Remove duplicate ov8856->dev assignment

- Changes since v2:
  * Added "struct device *dev" member to struct ov8856
  * Andy: Switch to optional version of devm_gpiod_get
  * Andy: Switch to optional version of devm_clk_get
  * Fabio: Add reset sleep period
  * Sakari: Unify defines for 19.2Mhz
  * Sakari: Remove 24Mhz clock, since it isn't needed for supported modes
  * Sakari: Replace dev_info() with dev_dbg()
  * Sakari: Switch induction variable type to unsigned
  * Sakari: Don't wait for reset_gpio when in ACPI mode
  * Sakari: Pull reset GPIO high on power on failure
  * Sakari: Add power on/off to resume/suspend
  * Sakari: Fix indentation
  * Sakari: Power off during ov8856_remove()
  * Sakari: Don't sleep during power-on in ACPI mode
  * Sakari: Switch to getting xvclk from clk_get_rate

- Changes since v1:
  * Andy & Sakari: Make XVCLK optional since to not break ACPI
  * Fabio: Change n_shutdown_gpio name to reset_gpio
  * Fabio: Invert reset_gpio due to GPIO_ACTIVE_HIGH -> GPIO_ACTIVE_LOW change
  * Fabio: Remove empty line
  * Fabio: Remove real error from devm_gpiod_get() failures
  * Sakari: ARRAY_SIZE() directly instead of through OV8856_NUM_SUPPLIES
  * Sakari: Use XVCLK rate as provided by DT

 drivers/media/i2c/ov8856.c | 139 +++++++++++++++++++++++++++++++++----
 1 file changed, 126 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 8655842af275..48b02b8d205f 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -3,10 +3,13 @@
 
 #include <asm/unaligned.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -18,7 +21,7 @@
 #define OV8856_LINK_FREQ_360MHZ		360000000ULL
 #define OV8856_LINK_FREQ_180MHZ		180000000ULL
 #define OV8856_SCLK			144000000ULL
-#define OV8856_MCLK			19200000
+#define OV8856_XVCLK_19_2		19200000
 #define OV8856_DATA_LANES		4
 #define OV8856_RGB_DEPTH		10
 
@@ -64,6 +67,12 @@
 
 #define to_ov8856(_sd)			container_of(_sd, struct ov8856, sd)
 
+static const char * const ov8856_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 enum {
 	OV8856_LINK_FREQ_720MBPS,
 	OV8856_LINK_FREQ_360MBPS,
@@ -566,6 +575,11 @@ struct ov8856 {
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
 
+	struct device		*dev;
+	struct clk		*xvclk;
+	struct gpio_desc	*reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8856_supply_names)];
+
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
@@ -908,6 +922,52 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int __ov8856_power_on(struct ov8856 *ov8856)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
+	int ret;
+
+	ret = clk_prepare_enable(ov8856->xvclk);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to enable xvclk\n");
+		return ret;
+	}
+
+	if (is_acpi_node(dev_fwnode(ov8856->dev)))
+		return 0;
+
+	if (ov8856->reset_gpio) {
+		gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
+		usleep_range(1000, 2000);
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
+				    ov8856->supplies);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to enable regulators\n");
+		goto disable_clk;
+	}
+
+	gpiod_set_value_cansleep(ov8856->reset_gpio, 0);
+	usleep_range(1500, 1800);
+
+	return 0;
+
+disable_clk:
+	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
+	clk_disable_unprepare(ov8856->xvclk);
+
+	return ret;
+}
+
+static void __ov8856_power_off(struct ov8856 *ov8856)
+{
+	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
+			       ov8856->supplies);
+	clk_disable_unprepare(ov8856->xvclk);
+}
+
 static int __maybe_unused ov8856_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -918,6 +978,7 @@ static int __maybe_unused ov8856_suspend(struct device *dev)
 	if (ov8856->streaming)
 		ov8856_stop_streaming(ov8856);
 
+	__ov8856_power_off(ov8856);
 	mutex_unlock(&ov8856->mutex);
 
 	return 0;
@@ -931,6 +992,8 @@ static int __maybe_unused ov8856_resume(struct device *dev)
 	int ret;
 
 	mutex_lock(&ov8856->mutex);
+
+	__ov8856_power_on(ov8856);
 	if (ov8856->streaming) {
 		ret = ov8856_start_streaming(ov8856);
 		if (ret) {
@@ -1092,29 +1155,58 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 	return 0;
 }
 
-static int ov8856_check_hwcfg(struct device *dev)
+static int ov8856_get_hwcfg(struct ov8856 *ov8856)
 {
+	struct device *dev = ov8856->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	u32 mclk;
+	u32 xvclk_rate;
 	int ret;
 	unsigned int i, j;
 
 	if (!fwnode)
 		return -ENXIO;
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
+	ret = fwnode_property_read_u32(fwnode, "clock-frequency",
+		&xvclk_rate);
 	if (ret)
 		return ret;
 
-	if (mclk != OV8856_MCLK) {
-		dev_err(dev, "external clock %d is not supported", mclk);
+	if (!is_acpi_node(fwnode)) {
+		ov8856->xvclk = devm_clk_get(dev, "xvclk");
+		if (IS_ERR(ov8856->xvclk)) {
+			dev_err(dev, "could not get xvclk clock (%pe)\n",
+					ov8856->xvclk);
+			return PTR_ERR(ov8856->xvclk);
+		}
+
+		clk_set_rate(ov8856->xvclk, xvclk_rate);
+		xvclk_rate = clk_get_rate(ov8856->xvclk);
+	}
+
+	/* external clock must be 19.2MHz, allow 5% tolerance */
+	if (xvclk_rate < OV8856_XVCLK_19_2 * 0.95 ||
+	    xvclk_rate > OV8856_XVCLK_19_2 * 1.05) {
+		dev_err(dev, "external clock %d is not supported", xvclk_rate);
 		return -EINVAL;
 	}
 
+	ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+		GPIOD_OUT_LOW);
+	if (IS_ERR(ov8856->reset_gpio))
+		return PTR_ERR(ov8856->reset_gpio);
+
+	for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
+		ov8856->supplies[i].supply = ov8856_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov8856_supply_names),
+				      ov8856->supplies);
+	if (ret)
+		return ret;
+
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
@@ -1169,6 +1261,8 @@ static int ov8856_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 	mutex_destroy(&ov8856->mutex);
 
+	__ov8856_power_off(ov8856);
+
 	return 0;
 }
 
@@ -1177,22 +1271,31 @@ static int ov8856_probe(struct i2c_client *client)
 	struct ov8856 *ov8856;
 	int ret;
 
-	ret = ov8856_check_hwcfg(&client->dev);
+	ov8856 = devm_kzalloc(&client->dev, sizeof(*ov8856), GFP_KERNEL);
+	if (!ov8856)
+		return -ENOMEM;
+
+	ov8856->dev = &client->dev;
+
+	ret = ov8856_get_hwcfg(ov8856);
 	if (ret) {
-		dev_err(&client->dev, "failed to check HW configuration: %d",
+		dev_err(&client->dev, "failed to get HW configuration: %d",
 			ret);
 		return ret;
 	}
 
-	ov8856 = devm_kzalloc(&client->dev, sizeof(*ov8856), GFP_KERNEL);
-	if (!ov8856)
-		return -ENOMEM;
-
 	v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
+
+	ret = __ov8856_power_on(ov8856);
+	if (ret) {
+		dev_err(&client->dev, "failed to power on\n");
+		return ret;
+	}
+
 	ret = ov8856_identify_module(ov8856);
 	if (ret) {
 		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		return ret;
+		goto probe_power_off;
 	}
 
 	mutex_init(&ov8856->mutex);
@@ -1238,6 +1341,9 @@ static int ov8856_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov8856->sd.ctrl_handler);
 	mutex_destroy(&ov8856->mutex);
 
+probe_power_off:
+	__ov8856_power_off(ov8856);
+
 	return ret;
 }
 
@@ -1254,11 +1360,18 @@ static const struct acpi_device_id ov8856_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov8856_acpi_ids);
 #endif
 
+static const struct of_device_id ov8856_of_match[] = {
+	{ .compatible = "ovti,ov8856" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov8856_of_match);
+
 static struct i2c_driver ov8856_i2c_driver = {
 	.driver = {
 		.name = "ov8856",
 		.pm = &ov8856_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov8856_acpi_ids),
+		.of_match_table = ov8856_of_match,
 	},
 	.probe_new = ov8856_probe,
 	.remove = ov8856_remove,
-- 
2.25.1

