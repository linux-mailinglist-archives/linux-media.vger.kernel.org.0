Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76DD44A9B5
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 09:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244542AbhKIIzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 03:55:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:10464 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244536AbhKIIzI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 03:55:08 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219306240"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="219306240"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 00:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="491585324"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2021 00:52:17 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        rafael@kernel.org
Cc:     shawnx.tu@intel.com, tian.shu.qiu@intel.com,
        chiranjeevi.rapolu@intel.com, hyungwoo.yang@intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        linux-kernel@vger.kernel.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 2/6] media: ov5670: Support device probe in non-zero ACPI D state
Date:   Tue,  9 Nov 2021 16:48:31 +0800
Message-Id: <1636447715-15526-3-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636447715-15526-1-git-send-email-bingbu.cao@intel.com>
References: <1636447715-15526-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Tell ACPI device PM code that the driver supports the device being in
non-zero ACPI D state when the driver's probe function is entered.

Also do identification on the first access of the device, whether in probe
or when starting streaming.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5670.c | 78 +++++++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 251f459ab484..5adf73cb88d4 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1833,6 +1833,8 @@ struct ov5670 {
 
 	/* Streaming on/off */
 	bool streaming;
+	/* True if the device has been identified */
+	bool identified;
 };
 
 #define to_ov5670(_sd)	container_of(_sd, struct ov5670, sd)
@@ -2273,6 +2275,32 @@ static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 	return 0;
 }
 
+/* Verify chip ID */
+static int ov5670_identify_module(struct ov5670 *ov5670)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
+	int ret;
+	u32 val;
+
+	if (ov5670->identified)
+		return 0;
+
+	ret = ov5670_read_reg(ov5670, OV5670_REG_CHIP_ID,
+			      OV5670_REG_VALUE_24BIT, &val);
+	if (ret)
+		return ret;
+
+	if (val != OV5670_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+			OV5670_CHIP_ID, val);
+		return -ENXIO;
+	}
+
+	ov5670->identified = true;
+
+	return 0;
+}
+
 /* Prepare streaming by writing default values and customized values */
 static int ov5670_start_streaming(struct ov5670 *ov5670)
 {
@@ -2281,6 +2309,10 @@ static int ov5670_start_streaming(struct ov5670 *ov5670)
 	int link_freq_index;
 	int ret;
 
+	ret = ov5670_identify_module(ov5670);
+	if (ret)
+		return ret;
+
 	/* Get out of from software reset */
 	ret = ov5670_write_reg(ov5670, OV5670_REG_SOFTWARE_RST,
 			       OV5670_REG_VALUE_08BIT, OV5670_SOFTWARE_RST);
@@ -2400,27 +2432,6 @@ static int __maybe_unused ov5670_resume(struct device *dev)
 	return 0;
 }
 
-/* Verify chip ID */
-static int ov5670_identify_module(struct ov5670 *ov5670)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
-	int ret;
-	u32 val;
-
-	ret = ov5670_read_reg(ov5670, OV5670_REG_CHIP_ID,
-			      OV5670_REG_VALUE_24BIT, &val);
-	if (ret)
-		return ret;
-
-	if (val != OV5670_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
-			OV5670_CHIP_ID, val);
-		return -ENXIO;
-	}
-
-	return 0;
-}
-
 static const struct v4l2_subdev_core_ops ov5670_core_ops = {
 	.log_status = v4l2_ctrl_subdev_log_status,
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
@@ -2462,6 +2473,7 @@ static int ov5670_probe(struct i2c_client *client)
 	struct ov5670 *ov5670;
 	const char *err_msg;
 	u32 input_clk = 0;
+	bool full_power;
 	int ret;
 
 	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
@@ -2478,11 +2490,14 @@ static int ov5670_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
 
-	/* Check module identity */
-	ret = ov5670_identify_module(ov5670);
-	if (ret) {
-		err_msg = "ov5670_identify_module() error";
-		goto error_print;
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		/* Check module identity */
+		ret = ov5670_identify_module(ov5670);
+		if (ret) {
+			err_msg = "ov5670_identify_module() error";
+			goto error_print;
+		}
 	}
 
 	mutex_init(&ov5670->mutex);
@@ -2519,11 +2534,9 @@ static int ov5670_probe(struct i2c_client *client)
 
 	ov5670->streaming = false;
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
-	 */
-	pm_runtime_set_active(&client->dev);
+	/* Set the device's state to active if it's in D0 state. */
+	if (full_power)
+		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
@@ -2565,7 +2578,7 @@ static const struct dev_pm_ops ov5670_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5670_acpi_ids[] = {
-	{"INT3479"},
+	{ "INT3479" },
 	{ /* sentinel */ }
 };
 
@@ -2580,6 +2593,7 @@ static struct i2c_driver ov5670_i2c_driver = {
 	},
 	.probe_new = ov5670_probe,
 	.remove = ov5670_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 module_i2c_driver(ov5670_i2c_driver);
-- 
2.7.4

