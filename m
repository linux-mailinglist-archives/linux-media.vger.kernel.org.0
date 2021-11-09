Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90A044A9BD
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 09:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244579AbhKIIzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 03:55:24 -0500
Received: from mga18.intel.com ([134.134.136.126]:10464 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244572AbhKIIzX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 03:55:23 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219306304"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="219306304"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 00:52:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="491585393"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2021 00:52:34 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        rafael@kernel.org
Cc:     shawnx.tu@intel.com, tian.shu.qiu@intel.com,
        chiranjeevi.rapolu@intel.com, hyungwoo.yang@intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        linux-kernel@vger.kernel.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 6/6] media: hi556: Support device probe in non-zero ACPI D state
Date:   Tue,  9 Nov 2021 16:48:35 +0800
Message-Id: <1636447715-15526-7-git-send-email-bingbu.cao@intel.com>
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
Signed-off-by: Kao, Arec <arec.kao@intel.com>
---
 drivers/media/i2c/hi556.c | 67 +++++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 8db1cbedc1fd..c8011467d1a4 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -495,6 +495,9 @@ struct hi556 {
 
 	/* Streaming on/off */
 	bool streaming;
+
+	/* True if the device has been identified */
+	bool identified;
 };
 
 static u64 to_pixel_rate(u32 f_index)
@@ -757,12 +760,38 @@ static void hi556_assign_pad_format(const struct hi556_mode *mode,
 	fmt->field = V4L2_FIELD_NONE;
 }
 
+static int hi556_identify_module(struct hi556 *hi556)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
+	int ret;
+	u32 val;
+
+	ret = hi556_read_reg(hi556, HI556_REG_CHIP_ID,
+			     HI556_REG_VALUE_16BIT, &val);
+	if (ret)
+		return ret;
+
+	if (val != HI556_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+			HI556_CHIP_ID, val);
+		return -ENXIO;
+	}
+
+	hi556->identified = true;
+
+	return 0;
+}
+
 static int hi556_start_streaming(struct hi556 *hi556)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
 	const struct hi556_reg_list *reg_list;
 	int link_freq_index, ret;
 
+	ret = hi556_identify_module(hi556);
+	if (ret)
+		return ret;
+
 	link_freq_index = hi556->cur_mode->link_freq_index;
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = hi556_write_reg_list(hi556, reg_list);
@@ -1001,26 +1030,6 @@ static const struct v4l2_subdev_internal_ops hi556_internal_ops = {
 	.open = hi556_open,
 };
 
-static int hi556_identify_module(struct hi556 *hi556)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
-	int ret;
-	u32 val;
-
-	ret = hi556_read_reg(hi556, HI556_REG_CHIP_ID,
-			     HI556_REG_VALUE_16BIT, &val);
-	if (ret)
-		return ret;
-
-	if (val != HI556_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
-			HI556_CHIP_ID, val);
-		return -ENXIO;
-	}
-
-	return 0;
-}
-
 static int hi556_check_hwcfg(struct device *dev)
 {
 	struct fwnode_handle *ep;
@@ -1106,6 +1115,7 @@ static int hi556_remove(struct i2c_client *client)
 static int hi556_probe(struct i2c_client *client)
 {
 	struct hi556 *hi556;
+	bool full_power;
 	int ret;
 
 	ret = hi556_check_hwcfg(&client->dev);
@@ -1120,10 +1130,14 @@ static int hi556_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	v4l2_i2c_subdev_init(&hi556->sd, client, &hi556_subdev_ops);
-	ret = hi556_identify_module(hi556);
-	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		return ret;
+
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		ret = hi556_identify_module(hi556);
+		if (ret) {
+			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			return ret;
+		}
 	}
 
 	mutex_init(&hi556->mutex);
@@ -1152,7 +1166,9 @@ static int hi556_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
-	pm_runtime_set_active(&client->dev);
+	/* Set the device's state to active if it's in D0 state. */
+	if (full_power)
+		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
@@ -1189,6 +1205,7 @@ static struct i2c_driver hi556_i2c_driver = {
 	},
 	.probe_new = hi556_probe,
 	.remove = hi556_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 module_i2c_driver(hi556_i2c_driver);
-- 
2.7.4

