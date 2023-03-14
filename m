Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F8D6B93A4
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 13:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbjCNMW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 08:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbjCNMV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 08:21:56 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEC851FBD
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678796278; x=1710332278;
  h=from:to:cc:subject:date:message-id;
  bh=5IsS0CxHfioVZqRPpTWigsY0HckntjM47j7bDhvtrbg=;
  b=InET40bo6pUIdNdkl+ZqlLWjuTdUDWtl9PCooNetQyHLdIDNbQMbgqDw
   jd1TycUK+y8hZ7cEO4O/rFLYEAysBXmiBTsE50dxGcFBby14ih7qs0Zwv
   BACGQEKQxB8z2I01zfz/M/z7JEDRg+FBQj9YNWiEwPM9YTktfnCRHFFoG
   NnyNff7/2/QtUpgQHWWcmBTW3T8WuqIqK76mB0DOusbYlrZi2ialV7f6r
   FUqBxux7WaFB2qWW30lmWRP6AmTNGHix+92XWAgPP7UKIQNs6OxrgH5/G
   1R6xCDixgCiZqHt/Lma1REwV3w84yD0hoEUABJZ42Wlh9ZY16OkzoexeB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317053124"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="317053124"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 05:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="629026907"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="629026907"
Received: from arec-bm6650.itwn.intel.com ([10.5.253.20])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 05:14:41 -0700
From:   Arec Kao <arec.kao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com,
        andy.yeh@intel.com, arec.kao@intel.com
Subject: [PATCH v2] media: ov13b10: Support device probe in non-zero ACPI D state
Date:   Tue, 14 Mar 2023 20:14:36 +0800
Message-Id: <20230314121436.13538-1-arec.kao@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 549e5d93e568..722f490f9db4 100644
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

