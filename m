Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1292544A9B3
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 09:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244529AbhKIIzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 03:55:04 -0500
Received: from mga18.intel.com ([134.134.136.126]:10464 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234536AbhKIIzD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 03:55:03 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219306220"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="219306220"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 00:52:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="491585301"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2021 00:52:14 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        rafael@kernel.org
Cc:     shawnx.tu@intel.com, tian.shu.qiu@intel.com,
        chiranjeevi.rapolu@intel.com, hyungwoo.yang@intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        linux-kernel@vger.kernel.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 1/6] media: ov8856: support device probe in non-zero ACPI D state
Date:   Tue,  9 Nov 2021 16:48:30 +0800
Message-Id: <1636447715-15526-2-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636447715-15526-1-git-send-email-bingbu.cao@intel.com>
References: <1636447715-15526-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tell ACPI device PM code that the driver supports the device being in
non-zero ACPI D state when the driver's probe function is entered.

Also do identification on the first access of the device, whether in probe
or when starting streaming.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov8856.c | 162 +++++++++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 73 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index c6c6050cda1a..8785764b7a74 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1445,6 +1445,9 @@ struct ov8856 {
 
 	const struct ov8856_lane_cfg *priv_lane;
 	u8 modes_size;
+
+	/* True if the device has been identified */
+	bool identified;
 };
 
 struct ov8856_lane_cfg {
@@ -1685,6 +1688,71 @@ static int ov8856_write_reg_list(struct ov8856 *ov8856,
 	return 0;
 }
 
+static int ov8856_identify_module(struct ov8856 *ov8856)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
+	int ret;
+	u32 val;
+
+	if (ov8856->identified)
+		return 0;
+
+	ret = ov8856_read_reg(ov8856, OV8856_REG_CHIP_ID,
+			      OV8856_REG_VALUE_24BIT, &val);
+	if (ret)
+		return ret;
+
+	if (val != OV8856_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+			OV8856_CHIP_ID, val);
+		return -ENXIO;
+	}
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
+			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
+	if (ret) {
+		dev_err(&client->dev, "failed to set otp mode");
+		return ret;
+	}
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
+			       OV8856_REG_VALUE_08BIT,
+			       OV8856_OTP_LOAD_CTRL_ENABLE);
+	if (ret) {
+		dev_err(&client->dev, "failed to enable load control");
+		return ret;
+	}
+
+	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret) {
+		dev_err(&client->dev, "failed to read module revision");
+		return ret;
+	}
+
+	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
+		 val,
+		 val == OV8856_2A_MODULE ? "2A" :
+		 val == OV8856_1B_MODULE ? "1B" : "unknown revision",
+		 client->addr);
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY);
+	if (ret) {
+		dev_err(&client->dev, "failed to exit streaming mode");
+		return ret;
+	}
+
+	ov8856->identified = true;
+
+	return 0;
+}
+
 static int ov8856_update_digital_gain(struct ov8856 *ov8856, u32 d_gain)
 {
 	int ret;
@@ -1969,6 +2037,10 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
 	const struct ov8856_reg_list *reg_list;
 	int link_freq_index, ret;
 
+	ret = ov8856_identify_module(ov8856);
+	if (ret)
+		return ret;
+
 	link_freq_index = ov8856->cur_mode->link_freq_index;
 	reg_list = &ov8856->priv_lane->link_freq_configs[link_freq_index].reg_list;
 
@@ -2276,65 +2348,6 @@ static const struct v4l2_subdev_internal_ops ov8856_internal_ops = {
 	.open = ov8856_open,
 };
 
-static int ov8856_identify_module(struct ov8856 *ov8856)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
-	int ret;
-	u32 val;
-
-	ret = ov8856_read_reg(ov8856, OV8856_REG_CHIP_ID,
-			      OV8856_REG_VALUE_24BIT, &val);
-	if (ret)
-		return ret;
-
-	if (val != OV8856_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
-			OV8856_CHIP_ID, val);
-		return -ENXIO;
-	}
-
-	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
-			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
-	if (ret)
-		return ret;
-
-	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
-			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
-	if (ret) {
-		dev_err(&client->dev, "failed to set otp mode");
-		return ret;
-	}
-
-	ret = ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
-			       OV8856_REG_VALUE_08BIT,
-			       OV8856_OTP_LOAD_CTRL_ENABLE);
-	if (ret) {
-		dev_err(&client->dev, "failed to enable load control");
-		return ret;
-	}
-
-	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
-			      OV8856_REG_VALUE_08BIT, &val);
-	if (ret) {
-		dev_err(&client->dev, "failed to read module revision");
-		return ret;
-	}
-
-	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
-		 val,
-		 val == OV8856_2A_MODULE ? "2A" :
-		 val == OV8856_1B_MODULE ? "1B" : "unknown revision",
-		 client->addr);
-
-	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
-			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY);
-	if (ret) {
-		dev_err(&client->dev, "failed to exit streaming mode");
-		return ret;
-	}
-
-	return 0;
-}
 
 static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
 {
@@ -2458,6 +2471,7 @@ static int ov8856_probe(struct i2c_client *client)
 {
 	struct ov8856 *ov8856;
 	int ret;
+	bool full_power;
 
 	ov8856 = devm_kzalloc(&client->dev, sizeof(*ov8856), GFP_KERNEL);
 	if (!ov8856)
@@ -2472,16 +2486,19 @@ static int ov8856_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
 
-	ret = __ov8856_power_on(ov8856);
-	if (ret) {
-		dev_err(&client->dev, "failed to power on\n");
-		return ret;
-	}
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		ret = __ov8856_power_on(ov8856);
+		if (ret) {
+			dev_err(&client->dev, "failed to power on\n");
+			return ret;
+		}
 
-	ret = ov8856_identify_module(ov8856);
-	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		goto probe_power_off;
+		ret = ov8856_identify_module(ov8856);
+		if (ret) {
+			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			goto probe_power_off;
+		}
 	}
 
 	mutex_init(&ov8856->mutex);
@@ -2511,11 +2528,9 @@ static int ov8856_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
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
 
@@ -2562,6 +2577,7 @@ static struct i2c_driver ov8856_i2c_driver = {
 	},
 	.probe_new = ov8856_probe,
 	.remove = ov8856_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 module_i2c_driver(ov8856_i2c_driver);
-- 
2.7.4

