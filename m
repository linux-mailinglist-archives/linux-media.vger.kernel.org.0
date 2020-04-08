Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41B8B1A1F6E
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 13:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgDHLId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 07:08:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36307 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgDHLIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 07:08:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id d202so4996822wmd.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 04:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IUNFIM4tJIflmczFsSMqJ1YMyCdkqcCqkHsbt7Hulfo=;
        b=L5kDuOec69USIK0cUeccqs5mm+lP6Br4kH8AWPjkuxQtC8DOHvjS5CHZMmkiPLsBd6
         vu0U7UpCqd9dp1GJ2SXKP6jofSWHf9IrnDLWN+z+YXqvdecFt6Xjhoqgr5PiUj5yj21d
         Zzvd4hh1anmA6DsN0bbydIsB7p4ci56XXLPWoiZW6k9LLDj4OZJbbH19qdYJoq85dU2P
         C5W8fraE4Mv3EgEYM/YO/x8zeqOdNmP8Btx8e9V14GCR9L38KDf/YkAwQBN9PZEW8AiF
         9PQJbfyGbyHm7VlQl6ehyVI9d60PGtT3X5tbe0wJAJQC58tr5HX+Uo4UZ2u7tfZAw2Li
         5S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IUNFIM4tJIflmczFsSMqJ1YMyCdkqcCqkHsbt7Hulfo=;
        b=VAsl/tryUEkpJg1krtMgeAwA9Nj/XKzb8H11/UemP2F8zD/V3Lw7EaEyjH3imeJZcz
         L69iiwbQDPreCRAHJVgUTA/j1h89v6CC66uhRCkbB5s8CrktlFCmxMj60RRfzWCcHmcL
         JyN8OyDNq7uKxIKBhMY0u1p9GDVKi04t2y0UqYT9jC+NpraXfNJ75zm7KPldwRmTHb/O
         IbuN3uJm2U6RxoyD5siBxNbA40MgxXDRS1uYGKelmaD7Gs+Y+YQqvYevvxDSr0s+gCdg
         h6Cw+dz2wZbCCMpGD6LT/fXX9toSNIqiffuoF+Rw9sAdW59QxflP5z57Vywkvg54sEz5
         nAYQ==
X-Gm-Message-State: AGi0PuaQuJYtECa2kTp7+wwMRCi+oIY+IhjCVYKpj2AArI7VF2x1N7Qr
        +pwc9wWRNwTpC61FZVAX8m4d1yeJLMC5RQ==
X-Google-Smtp-Source: APiQypLqRpydvZrHRauRJnFjJpmqKZYAUWKcpkg1CHL2up7wZqe4uqNNZCCB7mJ0OySGEUNslXamtA==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr4070181wmc.93.1586344105926;
        Wed, 08 Apr 2020 04:08:25 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id i8sm37596253wrb.41.2020.04.08.04.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 04:08:25 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 2/3] media: ov8856: Add devicetree support
Date:   Wed,  8 Apr 2020 13:08:15 +0200
Message-Id: <20200408110816.2712841-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408110816.2712841-1-robert.foss@linaro.org>
References: <20200408110816.2712841-1-robert.foss@linaro.org>
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

 drivers/media/i2c/ov8856.c | 143 +++++++++++++++++++++++++++++++++----
 1 file changed, 128 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 8655842af275..473d3245344a 100644
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
-	if (ret)
-		return ret;
+	if (is_acpi_node(fwnode)) {
+		ret = fwnode_property_read_u32(fwnode, "clock-frequency",
+			&xvclk_rate);
+		if (ret)
+			return ret;
+	} else {
+		ov8856->xvclk = devm_clk_get(dev, "xvclk");
+		if (IS_ERR(ov8856->xvclk)) {
+			dev_err(dev, "could not get xvclk clock (%pe)\n",
+				ov8856->xvclk);
+			return PTR_ERR(ov8856->xvclk);
+		}
+
+		xvclk_rate = clk_get_rate(ov8856->xvclk);
+	}
 
-	if (mclk != OV8856_MCLK) {
-		dev_err(dev, "external clock %d is not supported", mclk);
+	/* external clock must be 19.2MHz, allow 5% tolerance */
+	if (xvclk_rate < OV8856_XVCLK_19_2 * 0.95 ||
+	    xvclk_rate > OV8856_XVCLK_19_2 * 1.05) {
+		dev_err(dev, "external clock %d is not supported", xvclk_rate);
 		return -EINVAL;
 	}
 
+
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

