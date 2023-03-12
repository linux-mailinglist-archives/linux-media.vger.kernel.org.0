Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2396B67B8
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 16:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjCLP45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 11:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjCLP45 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 11:56:57 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CC54989C
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678636616; x=1710172616;
  h=from:to:cc:subject:date:message-id;
  bh=lix1jC/eZM3iSvfT+VxRoeweXTxCfhWM9s+ZnlPjzHQ=;
  b=aElEAa7lWve3Urg0vNnaNvdEY+caHnawXRCLJUQnZ6yWqI/fiQNeaGC3
   aGR8XSeBt8j8pvVDSjFLLitTx+KM7Dv3kcIE2SxhUsUTzvkiVMGpKLaZA
   ZtFxJN5U9KmHsxXJiYWAfCdIEALzM8HX+bM6e8zozSvtkWMVosLfC4rY0
   +hMCn+y+/Dc70kZi+6wxV9K09WSaYdwcBmbY6QK3CgHOnmM5JEFjcNhmC
   EorCBkixe7Y2AGkOJuGTIa69CYtALoNhy1djOyXRnFgZ5lgSz3FAk6oNs
   ThVUKXnmlTvSvkFHZP5Ea33zEeWXvRMA6sKjN+VOv0eh/pjcoY0FOoM3g
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="317390544"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="317390544"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 08:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="852475539"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="852475539"
Received: from arec-bm6650.itwn.intel.com ([10.5.253.20])
  by orsmga005.jf.intel.com with ESMTP; 12 Mar 2023 08:56:54 -0700
From:   Arec Kao <arec.kao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com,
        andy.yeh@intel.com, arec.kao@intel.com
Subject: [PATCH] media: ov13b10: Support device probe in non-zero ACPI D state
Date:   Sun, 12 Mar 2023 23:56:37 +0800
Message-Id: <20230312155637.29961-1-arec.kao@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tell ACPI device PM code that the driver supports the device being in
non-zero ACPI D state when the driver's probe function is entered.

Also do identification on the first access of the device, whether in
probe or when starting streaming.

Signed-off-by: Arec Kao <arec.kao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 74 +++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 27 deletions(-)
 mode change 100644 => 100755 drivers/media/i2c/ov13b10.c

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
old mode 100644
new mode 100755
index 549e5d93e568..722f490f9db4
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -589,6 +589,9 @@ struct ov13b10 {
 
 	/* Streaming on/off */
 	bool streaming;
+
+	/* True if the device has been identified */
+	bool identified;
 };
 
 #define to_ov13b10(_sd)	container_of(_sd, struct ov13b10, sd)
@@ -1023,12 +1026,42 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+/* Verify chip ID */
+static int ov13b10_identify_module(struct ov13b10 *ov13b)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
+	int ret;
+	u32 val;
+
+	if (ov13b->identified)
+		return 0;
+
+	ret = ov13b10_read_reg(ov13b, OV13B10_REG_CHIP_ID,
+			       OV13B10_REG_VALUE_24BIT, &val);
+	if (ret)
+		return ret;
+
+	if (val != OV13B10_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+			OV13B10_CHIP_ID, val);
+		return -EIO;
+	}
+
+	ov13b->identified = true;
+
+	return 0;
+}
+
 static int ov13b10_start_streaming(struct ov13b10 *ov13b)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
 	const struct ov13b10_reg_list *reg_list;
 	int ret, link_freq_index;
 
+	ret = ov13b10_identify_module(ov13b);
+	if (ret)
+		return ret;
+
 	/* Get out of from software reset */
 	ret = ov13b10_write_reg(ov13b, OV13B10_REG_SOFTWARE_RST,
 				OV13B10_REG_VALUE_08BIT, OV13B10_SOFTWARE_RST);
@@ -1144,27 +1177,6 @@ static int __maybe_unused ov13b10_resume(struct device *dev)
 	return ret;
 }
 
-/* Verify chip ID */
-static int ov13b10_identify_module(struct ov13b10 *ov13b)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
-	int ret;
-	u32 val;
-
-	ret = ov13b10_read_reg(ov13b, OV13B10_REG_CHIP_ID,
-			       OV13B10_REG_VALUE_24BIT, &val);
-	if (ret)
-		return ret;
-
-	if (val != OV13B10_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
-			OV13B10_CHIP_ID, val);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static const struct v4l2_subdev_video_ops ov13b10_video_ops = {
 	.s_stream = ov13b10_set_stream,
 };
@@ -1379,6 +1391,7 @@ static int ov13b10_check_hwcfg(struct device *dev)
 static int ov13b10_probe(struct i2c_client *client)
 {
 	struct ov13b10 *ov13b;
+	bool full_power;
 	int ret;
 
 	/* Check HW config */
@@ -1395,11 +1408,14 @@ static int ov13b10_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
 
-	/* Check module identity */
-	ret = ov13b10_identify_module(ov13b);
-	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
-		return ret;
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		/* Check module identity */
+		ret = ov13b10_identify_module(ov13b);
+		if (ret) {
+			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+			return ret;
+		}
 	}
 
 	/* Set default mode to max resolution */
@@ -1431,7 +1447,10 @@ static int ov13b10_probe(struct i2c_client *client)
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
 	 */
-	pm_runtime_set_active(&client->dev);
+
+	/* Set the device's state to active if it's in D0 state. */
+	if (full_power)
+		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
@@ -1480,6 +1499,7 @@ static struct i2c_driver ov13b10_i2c_driver = {
 	},
 	.probe_new = ov13b10_probe,
 	.remove = ov13b10_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 module_i2c_driver(ov13b10_i2c_driver);
-- 
2.17.1

