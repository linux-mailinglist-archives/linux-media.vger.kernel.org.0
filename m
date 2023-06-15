Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5EC8730EB7
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 07:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjFOFnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 01:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjFOFm6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 01:42:58 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FF210E9
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686807776; x=1718343776;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iPqd/bD2DfNIUl/mr4CPl7fLWVWL+wqv0Bb/6K775Hs=;
  b=Owe9fAArsj+dC/3BOrt1ZpRueVq7SbYWOCWLHYcddNXHtEjsemqmUi4D
   ZO+cAwC7Smus9tk84M5K8kEDlKkhhDEoX57LXaAdy3RGPQ+gG4n876Ieb
   He/CEeaSw0d3XPVvCennRjE4+nmF3irm8X4d4hFgpwPtfMu6p3KaXJDjM
   bApFxshbvh9WD8a6z/1gyxOaCI7sGBGbDHd9TjKHnh7sezf2RxemaVZR3
   gOwrnHAAukagGJEReHsWy238uwvG2NVSMIBu5X5SVp+raOmU434ZQtgzN
   9O9t8md5Q2SFdEUbuN13FRxGn0Qtd9ixwv6ZAvJ0/mfbT/2kSIcXkntWU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387242563"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="387242563"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 22:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="886524968"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="886524968"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga005.jf.intel.com with ESMTP; 14 Jun 2023 22:42:53 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hdegoede@redhat.com, dan.scally@ideasonboard.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH v3] media: ov13b10: add PM control support based on power resources
Date:   Thu, 15 Jun 2023 13:54:16 +0800
Message-Id: <20230615055416.2975328-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

On ACPI based platforms, the ov13b10 camera sensor need to be powered
up by acquire the PM resource from INT3472. INT3472 will register one
regulator 'avdd', one reset gpio and clock source for ov13b10.
Add 2 power interfaces that are registered as runtime PM callbacks.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hao Yao <hao.yao@intel.com>
Suggested-by: Hans de Goede <hdegoede@redhat.com>
---

v2->v3:
 - remove unnecessary 'reset' gpio NULL check
 - use DEFINE_RUNTIME_DEV_PM_OPS() to simplify the PM ops
v1->v2:
 - use supply name 'avdd' instead of 'vcc'
 - remove some unnecessary checks
 - correct the power on error handling

---
 drivers/media/i2c/ov13b10.c | 120 +++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 96d3bd6ab3bd..8ae335549413 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -2,6 +2,9 @@
 // Copyright (c) 2021 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -573,6 +576,11 @@ struct ov13b10 {
 	struct media_pad pad;
 
 	struct v4l2_ctrl_handler ctrl_handler;
+
+	struct clk *img_clk;
+	struct regulator *avdd;
+	struct gpio_desc *reset;
+
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
@@ -1051,6 +1059,49 @@ static int ov13b10_identify_module(struct ov13b10 *ov13b)
 	return 0;
 }
 
+static int ov13b10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov13b10 *ov13b10 = to_ov13b10(sd);
+
+	gpiod_set_value_cansleep(ov13b10->reset, 1);
+
+	if (ov13b10->avdd)
+		regulator_disable(ov13b10->avdd);
+
+	clk_disable_unprepare(ov13b10->img_clk);
+
+	return 0;
+}
+
+static int ov13b10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov13b10 *ov13b10 = to_ov13b10(sd);
+	int ret;
+
+	ret = clk_prepare_enable(ov13b10->img_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		return ret;
+	}
+
+	if (ov13b10->avdd) {
+		ret = regulator_enable(ov13b10->avdd);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable avdd: %d", ret);
+			clk_disable_unprepare(ov13b10->img_clk);
+			return ret;
+		}
+	}
+
+	gpiod_set_value_cansleep(ov13b10->reset, 0);
+	/* 5ms to wait ready after XSHUTDN assert */
+	usleep_range(5000, 5500);
+
+	return 0;
+}
+
 static int ov13b10_start_streaming(struct ov13b10 *ov13b)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
@@ -1145,7 +1196,7 @@ static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int __maybe_unused ov13b10_suspend(struct device *dev)
+static int ov13b10_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov13b10 *ov13b = to_ov13b10(sd);
@@ -1153,26 +1204,35 @@ static int __maybe_unused ov13b10_suspend(struct device *dev)
 	if (ov13b->streaming)
 		ov13b10_stop_streaming(ov13b);
 
+	ov13b10_power_off(dev);
+
 	return 0;
 }
 
-static int __maybe_unused ov13b10_resume(struct device *dev)
+static int ov13b10_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov13b10 *ov13b = to_ov13b10(sd);
 	int ret;
 
+	ret = ov13b10_power_on(dev);
+	if (ret)
+		goto pm_fail;
+
 	if (ov13b->streaming) {
 		ret = ov13b10_start_streaming(ov13b);
 		if (ret)
-			goto error;
+			goto stop_streaming;
 	}
 
 	return 0;
 
-error:
+stop_streaming:
 	ov13b10_stop_streaming(ov13b);
+	ov13b10_power_off(dev);
+pm_fail:
 	ov13b->streaming = false;
+
 	return ret;
 }
 
@@ -1317,6 +1377,34 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
 	mutex_destroy(&ov13b->mutex);
 }
 
+static int ov13b10_get_pm_resources(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov13b10 *ov13b = to_ov13b10(sd);
+	int ret;
+
+	ov13b->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ov13b->reset))
+		return dev_err_probe(dev, PTR_ERR(ov13b->reset),
+				     "failed to get reset gpio\n");
+
+	ov13b->img_clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ov13b->img_clk))
+		return dev_err_probe(dev, PTR_ERR(ov13b->img_clk),
+				     "failed to get imaging clock\n");
+
+	ov13b->avdd = devm_regulator_get_optional(dev, "avdd");
+	if (IS_ERR(ov13b->avdd)) {
+		ret = PTR_ERR(ov13b->avdd);
+		ov13b->avdd = NULL;
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to get avdd regulator\n");
+	}
+
+	return 0;
+}
+
 static int ov13b10_check_hwcfg(struct device *dev)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1407,13 +1495,23 @@ static int ov13b10_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
 
+	ret = ov13b10_get_pm_resources(&client->dev);
+	if (ret)
+		return ret;
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
+		ov13b10_power_on(&client->dev);
+		if (ret) {
+			dev_err(&client->dev, "failed to power on\n");
+			return ret;
+		}
+
 		/* Check module identity */
 		ret = ov13b10_identify_module(ov13b);
 		if (ret) {
 			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
-			return ret;
+			goto error_power_off;
 		}
 	}
 
@@ -1422,7 +1520,7 @@ static int ov13b10_probe(struct i2c_client *client)
 
 	ret = ov13b10_init_controls(ov13b);
 	if (ret)
-		return ret;
+		goto error_power_off;
 
 	/* Initialize subdev */
 	ov13b->sd.internal_ops = &ov13b10_internal_ops;
@@ -1462,6 +1560,9 @@ static int ov13b10_probe(struct i2c_client *client)
 	ov13b10_free_controls(ov13b);
 	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
 
+error_power_off:
+	ov13b10_power_off(&client->dev);
+
 	return ret;
 }
 
@@ -1477,9 +1578,8 @@ static void ov13b10_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-static const struct dev_pm_ops ov13b10_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
+				 ov13b10_resume, NULL);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov13b10_acpi_ids[] = {
@@ -1493,7 +1593,7 @@ MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
 static struct i2c_driver ov13b10_i2c_driver = {
 	.driver = {
 		.name = "ov13b10",
-		.pm = &ov13b10_pm_ops,
+		.pm = pm_ptr(&ov13b10_pm_ops),
 		.acpi_match_table = ACPI_PTR(ov13b10_acpi_ids),
 	},
 	.probe_new = ov13b10_probe,
-- 
2.40.1

