Return-Path: <linux-media+bounces-50418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED03CD11AA2
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C12A3017FB7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F01281370;
	Mon, 12 Jan 2026 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSACgLmV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607FF283CB1
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212012; cv=none; b=reHRQJNkFgRS4roL7eDqjHT8haVJyYVWwBdbuPzbgmMRLwss44AS6yThULjP6QwiS1IyZR+p3mxk5WflklC+/Um26Ihm7Q4LuXeKLRD3YwCZmfSgCG2uzM6FGNm75tb99/oity2aYA3rvDCHcqy1sw+1qqIx8sGumsYvbWT/pac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212012; c=relaxed/simple;
	bh=/ksn4Daf8FjQZ8UWPR9RxUgjg2LK050B86BH0hRbHEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvxBFX/pVqKM6x6E4DJC8xFBraTPajeTJqw6Kd38Idk/OoQuB1i9AKeIRHEiNfuIslv5NXESTnIixYARycpvaFSQYvq+MvdJJ9XvLaQnZWlAQ3/BobdgvCSoCTFWw9BJQQyLH6ONFOYw7wFHdGGaMqGDBE0Qt4k05AgkI69uIAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSACgLmV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212011; x=1799748011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/ksn4Daf8FjQZ8UWPR9RxUgjg2LK050B86BH0hRbHEQ=;
  b=HSACgLmVhMzzfA9aicb2wu1IbcrkGccaoQpv74FLetOI0aAXaKQrVCk8
   tMrbHfwYxh10Rf6asN90CwDaMMYdsKjnvLKHq2+osT4LVA9kn5Qb8WAhP
   ccXijTv4LXTiurkLVH8zpgJk5wvhIPk3owe0W/0zqispW1RgRP/LzRS9e
   Efj6mFqc+swPawYBGPYtJRENnt5WVRaKB1yHbOSC0otriepBFlydw9ort
   kyL5c/24iUlAUqpN7qhRdWIX9qwFgMFxPEBXp5KzIQUrGEo7j4KLi6fd9
   rwSxrdaS+7JxgXzZq8NFR2G0wFwsptSQDdv4ZImV9fzXwy+D5AWwKpUxo
   g==;
X-CSE-ConnectionGUID: 8mxrFdg/TTO4E6ihZe+ykw==
X-CSE-MsgGUID: Zh/zMiq8SO+hjgGgmu2DTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218805"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:58 -0800
X-CSE-ConnectionGUID: wsJ7Ix6FQfCNiTIkv0QSZA==
X-CSE-MsgGUID: NpeMuZ3zRSurNqhy859/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743147"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 41B6E121F8D;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011w-0XVm;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 12/23] media: i2c: ov01a10: Add power on/off sequencing support
Date: Mon, 12 Jan 2026 11:59:38 +0200
Message-ID: <20260112095949.3851-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

So far the ov01a10 driver has only been used on laptops with an IVSC chip
where the IVSC chip controls the power on/off sequencing of the sensor.

But there are also designs with an ov01a10 sensor where the kernel needs
to directly take care of the power-sequencing, controlling clks, regulators
and GPIOs. Add support for these designs.

The 2 ms minimum reset assertion time is taken from other Omnivision sensor
drivers like the ov5675. The 20 ms delay after reset de-assert comes from
the out of tree ov01a1s driver.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 126 +++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 0ef4bbc93d66..fee24acef4b2 100644
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
@@ -278,6 +283,12 @@ static const struct ov01a10_mode supported_modes[] = {
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
@@ -294,6 +305,11 @@ struct ov01a10 {
 
 	const struct ov01a10_mode *cur_mode;
 	u32 link_freq_index;
+
+	struct clk *clk;
+	struct gpio_desc *reset;
+	struct gpio_desc *powerdown;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov01a10_supply_names)];
 };
 
 static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
@@ -726,6 +742,92 @@ static const struct media_entity_operations ov01a10_subdev_entity_ops = {
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
@@ -801,7 +903,10 @@ static void ov01a10_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		ov01a10_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static int ov01a10_probe(struct i2c_client *client)
@@ -826,15 +931,23 @@ static int ov01a10_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = ov01a10_identify_module(ov01a10);
+	ret = ov01a10_get_pm_resources(ov01a10);
+	if (ret)
+		return ret;
+
+	ret = ov01a10_power_on(&client->dev);
 	if (ret)
 		return ret;
 
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
@@ -875,9 +988,15 @@ static int ov01a10_probe(struct i2c_client *client)
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
@@ -890,6 +1009,7 @@ MODULE_DEVICE_TABLE(acpi, ov01a10_acpi_ids);
 static struct i2c_driver ov01a10_i2c_driver = {
 	.driver = {
 		.name = "ov01a10",
+		.pm = pm_sleep_ptr(&ov01a10_pm_ops),
 		.acpi_match_table = ACPI_PTR(ov01a10_acpi_ids),
 	},
 	.probe = ov01a10_probe,
-- 
2.47.3


