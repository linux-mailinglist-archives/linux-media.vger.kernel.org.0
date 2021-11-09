Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196EE44A9B7
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 09:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244546AbhKIIzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 03:55:12 -0500
Received: from mga18.intel.com ([134.134.136.126]:10464 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244536AbhKIIzL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 03:55:11 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219306265"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="219306265"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 00:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="491585345"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2021 00:52:22 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        rafael@kernel.org
Cc:     shawnx.tu@intel.com, tian.shu.qiu@intel.com,
        chiranjeevi.rapolu@intel.com, hyungwoo.yang@intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        linux-kernel@vger.kernel.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 3/6] media: ov2740: support device probe in non-zero ACPI D state
Date:   Tue,  9 Nov 2021 16:48:32 +0800
Message-Id: <1636447715-15526-4-git-send-email-bingbu.cao@intel.com>
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
 drivers/media/i2c/ov2740.c | 69 ++++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 934c9d65cb09..bab720c7c1de 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -345,6 +345,9 @@ struct ov2740 {
 
 	/* NVM data inforamtion */
 	struct nvm_data *nvm;
+
+	/* True if the device has been identified */
+	bool identified;
 };
 
 static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
@@ -440,6 +443,30 @@ static int ov2740_write_reg_list(struct ov2740 *ov2740,
 	return 0;
 }
 
+static int ov2740_identify_module(struct ov2740 *ov2740)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
+	int ret;
+	u32 val;
+
+	if (ov2740->identified)
+		return 0;
+
+	ret = ov2740_read_reg(ov2740, OV2740_REG_CHIP_ID, 3, &val);
+	if (ret)
+		return ret;
+
+	if (val != OV2740_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+			OV2740_CHIP_ID, val);
+		return -ENXIO;
+	}
+
+	ov2740->identified = true;
+
+	return 0;
+}
+
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
 	int ret = 0;
@@ -724,6 +751,10 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	int link_freq_index;
 	int ret = 0;
 
+	ret = ov2740_identify_module(ov2740);
+	if (ret)
+		return ret;
+
 	ov2740_load_otp_data(nvm);
 
 	link_freq_index = ov2740->cur_mode->link_freq_index;
@@ -956,25 +987,6 @@ static const struct v4l2_subdev_internal_ops ov2740_internal_ops = {
 	.open = ov2740_open,
 };
 
-static int ov2740_identify_module(struct ov2740 *ov2740)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
-	int ret;
-	u32 val;
-
-	ret = ov2740_read_reg(ov2740, OV2740_REG_CHIP_ID, 3, &val);
-	if (ret)
-		return ret;
-
-	if (val != OV2740_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
-			OV2740_CHIP_ID, val);
-		return -ENXIO;
-	}
-
-	return 0;
-}
-
 static int ov2740_check_hwcfg(struct device *dev)
 {
 	struct fwnode_handle *ep;
@@ -1137,6 +1149,7 @@ static int ov2740_probe(struct i2c_client *client)
 {
 	struct ov2740 *ov2740;
 	int ret = 0;
+	bool full_power;
 
 	ret = ov2740_check_hwcfg(&client->dev);
 	if (ret) {
@@ -1149,6 +1162,15 @@ static int ov2740_probe(struct i2c_client *client)
 	if (!ov2740)
 		return -ENOMEM;
 
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		ret = ov2740_identify_module(ov2740);
+		if (ret) {
+			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			return ret;
+		}
+	}
+
 	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	ret = ov2740_identify_module(ov2740);
 	if (ret) {
@@ -1186,11 +1208,9 @@ static int ov2740_probe(struct i2c_client *client)
 	if (ret)
 		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
 
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
 
@@ -1225,6 +1245,7 @@ static struct i2c_driver ov2740_i2c_driver = {
 	},
 	.probe_new = ov2740_probe,
 	.remove = ov2740_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 module_i2c_driver(ov2740_i2c_driver);
-- 
2.7.4

