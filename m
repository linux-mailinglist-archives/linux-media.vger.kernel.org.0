Return-Path: <linux-media+bounces-44459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66EBDACFD
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 85FA9355C20
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DD230B536;
	Tue, 14 Oct 2025 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fysBBMMV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B883074B2
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463659; cv=none; b=ccrxY0efz2xzLQ+dui6nmCYm99/3xhLsIrGtgiPReP0vuXccSURLslCj+4kSW676tskwW24OLaOsUt6U+xkEYpaixQNW2gd7VlZkEdruZ4r7ARyQCEbVaUKUa74LaJqOlWyJ5Qss3bbTHD1Zv2AIH1a6hZ5e3702nRfeJsT+O+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463659; c=relaxed/simple;
	bh=fIgQlmZoYq3ivop+QYwJoqBoEFHMR1vhkfv61srs6xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XS64Ia9FIpZwwneWF3Ny7+yxwv1EMd7L8PwOodxR1Ynok4WP5kN2hJglPAS4wZ6MSWs2MRNLWOFD5rjUnqvVDNABfe3oCYvw4wxhta4Wl4VAshd5SBC+nTVY4BvpxQwDsv9NZA4/mMn1WJqRwLo/vgGv8DFxIEAiWGUTkzhAdYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fysBBMMV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D657FC4CEE7;
	Tue, 14 Oct 2025 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463659;
	bh=fIgQlmZoYq3ivop+QYwJoqBoEFHMR1vhkfv61srs6xE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fysBBMMV6b2Zder4JEB7sVfm/xHW5twctD+na+wgJA7au4ZCmkb9kW3W5bp6nlRVj
	 u8/TLxMHDJm/onM0O+BlBzVHEv8k6bMl+S8pmpmMOui82PfP4c6bcwY/C4W2+c7HBe
	 GXw116tz1m0MxGQxIeUNbV7Pxwc0fL/ypa3GLEV8YfLIWEmzBkKOigQE58M9WkwDYK
	 k6OcJXyD3wevlo3ZdiGlUs0MSqeP4l97SFGsOMSss0nNxObgJTjVuf1SICAN5l3eQo
	 3Yz93Zb4YAq/ySOJDgiHudWDuzUFeia2Is72JdJ2hZ+t+EqGxRwgUHHJiXqbdAJjAj
	 3NuYLizShphhw==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 12/25] media: i2c: ov01a10: Add power on/off sequencing support
Date: Tue, 14 Oct 2025 19:40:20 +0200
Message-ID: <20251014174033.20534-13-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far the ov01a10 driver has only been used on laptops with an IVSC chip
where the IVSC chip controls the power on/off sequencing of the sensor.

But there are also designs with an ov01a10 sensor where the kernel needs
to directly take care of the power-sequencing, controlling clks, regulators
and GPIOs. Add support for these designs.

The 2 ms minimum reset assertion time is taken from other Omnivision sensor
drivers like the ov5675. The 20 ms delay after reset de-assert comes from
the out of tree ov01a1s driver.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 126 +++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 666c75b19dd9..8fe0b0d4f9e6 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -7,10 +7,14 @@
 
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
@@ -20,6 +24,7 @@
 #define OV01A10_LINK_FREQ_400MHZ	400000000ULL
 #define OV01A10_SCLK			80000000LL
 #define OV01A10_DATA_LANES		1
+#define OV01A10_MCLK			19200000
 
 #define OV01A10_REG_CHIP_ID		CCI_REG24(0x300a)
 #define OV01A10_CHIP_ID			0x560141
@@ -279,6 +284,12 @@ static const struct ov01a10_mode supported_modes[] = {
 	},
 };
 
+static const char * const ov01a10_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct ov01a10 {
 	struct device *dev;
 	struct regmap *regmap;
@@ -295,6 +306,11 @@ struct ov01a10 {
 
 	const struct ov01a10_mode *cur_mode;
 	u32 link_freq_index;
+
+	struct clk *clk;
+	struct gpio_desc *reset;
+	struct gpio_desc *powerdown;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov01a10_supply_names)];
 };
 
 static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
@@ -727,6 +743,92 @@ static const struct media_entity_operations ov01a10_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static int ov01a10_get_pm_resources(struct ov01a10 *ov01a10)
+{
+	unsigned long freq;
+	int i, ret;
+
+	ov01a10->clk = devm_v4l2_sensor_clk_get(ov01a10->dev, NULL);
+	if (IS_ERR(ov01a10->clk))
+		return dev_err_probe(ov01a10->dev, PTR_ERR(ov01a10->clk),
+				     "getting clock\n");
+
+	freq = clk_get_rate(ov01a10->clk);
+	if (freq != OV01A10_MCLK)
+		return dev_err_probe(ov01a10->dev, -EINVAL,
+				     "external clock %lu is not supported",
+				     freq);
+
+	ov01a10->reset = devm_gpiod_get_optional(ov01a10->dev, "reset",
+						 GPIOD_OUT_HIGH);
+	if (IS_ERR(ov01a10->reset))
+		return dev_err_probe(ov01a10->dev, PTR_ERR(ov01a10->reset),
+				     "getting reset gpio\n");
+
+	ov01a10->powerdown = devm_gpiod_get_optional(ov01a10->dev, "powerdown",
+						 GPIOD_OUT_HIGH);
+	if (IS_ERR(ov01a10->powerdown))
+		return dev_err_probe(ov01a10->dev, PTR_ERR(ov01a10->powerdown),
+				     "getting powerdown gpio\n");
+
+	for (i = 0; i < ARRAY_SIZE(ov01a10_supply_names); i++)
+		ov01a10->supplies[i].supply = ov01a10_supply_names[i];
+
+	ret = devm_regulator_bulk_get(ov01a10->dev,
+				      ARRAY_SIZE(ov01a10_supply_names),
+				      ov01a10->supplies);
+	if (ret)
+		return dev_err_probe(ov01a10->dev, ret, "getting regulators\n");
+
+	return 0;
+}
+
+static int ov01a10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+	int ret;
+
+	ret = clk_prepare_enable(ov01a10->clk);
+	if (ret) {
+		dev_err(dev, "Error enabling clk: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov01a10_supply_names),
+				    ov01a10->supplies);
+	if (ret) {
+		dev_err(dev, "Error enabling regulators: %d\n", ret);
+		clk_disable_unprepare(ov01a10->clk);
+		return ret;
+	}
+
+	if (ov01a10->reset || ov01a10->powerdown) {
+		/* Assert reset/powerdown for at least 2ms on back to back off-on */
+		fsleep(2000);
+		gpiod_set_value_cansleep(ov01a10->powerdown, 0);
+		gpiod_set_value_cansleep(ov01a10->reset, 0);
+		fsleep(20000);
+	}
+
+	return 0;
+}
+
+static int ov01a10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+
+	gpiod_set_value_cansleep(ov01a10->reset, 1);
+	gpiod_set_value_cansleep(ov01a10->powerdown, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(ov01a10_supply_names),
+			       ov01a10->supplies);
+
+	clk_disable_unprepare(ov01a10->clk);
+	return 0;
+}
+
 static int ov01a10_identify_module(struct ov01a10 *ov01a10)
 {
 	int ret;
@@ -802,7 +904,10 @@ static void ov01a10_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		ov01a10_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static int ov01a10_probe(struct i2c_client *client)
@@ -827,15 +932,23 @@ static int ov01a10_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = ov01a10_identify_module(ov01a10);
+	ret = ov01a10_get_pm_resources(ov01a10);
 	if (ret)
 		return ret;
 
+	ret = ov01a10_power_on(&client->dev);
+	if (ret)
+		return ret;
+
+	ret = ov01a10_identify_module(ov01a10);
+	if (ret)
+		goto err_power_off;
+
 	ov01a10->cur_mode = &supported_modes[0];
 
 	ret = ov01a10_init_controls(ov01a10);
 	if (ret)
-		return ret;
+		goto err_power_off;
 
 	ov01a10->sd.state_lock = ov01a10->ctrl_handler.lock;
 	ov01a10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -876,9 +989,15 @@ static int ov01a10_probe(struct i2c_client *client)
 err_handler_free:
 	v4l2_ctrl_handler_free(ov01a10->sd.ctrl_handler);
 
+err_power_off:
+	ov01a10_power_off(&client->dev);
+
 	return ret;
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(ov01a10_pm_ops, ov01a10_power_off,
+				 ov01a10_power_on, NULL);
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov01a10_acpi_ids[] = {
 	{ "OVTI01A0" },
@@ -891,6 +1010,7 @@ MODULE_DEVICE_TABLE(acpi, ov01a10_acpi_ids);
 static struct i2c_driver ov01a10_i2c_driver = {
 	.driver = {
 		.name = "ov01a10",
+		.pm = pm_sleep_ptr(&ov01a10_pm_ops),
 		.acpi_match_table = ACPI_PTR(ov01a10_acpi_ids),
 	},
 	.probe = ov01a10_probe,
-- 
2.51.0


