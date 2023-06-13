Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099FA72D8CF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 06:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237677AbjFMEyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 00:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbjFMEyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 00:54:09 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D04510D7
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 21:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686632048; x=1718168048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2HOLMMgdcuDhEM6L5rLNn/ii+RC2Hg8hItbbxXBaBcA=;
  b=d+CsNennCRm9zyIcYV4OMbsE7YPPJ7YseJDPOXvssDpdZrbI+KILM+CE
   R30JGhu9I/vhZbyUX7jqP3nImrASU2d+ehgxuAOv4DkXIfglL4jxx4Rsd
   AAMMnURsDP7ap6nEZ8jg0Vh0HVGroHd66EutD9EgOWJYqme1GTXUQk4fj
   oipeHToPu364V9mW2i3Ip+WgEMVQtSHEjIQwNtzSFAd1V/c/LjFGqtKzf
   seB6ME8q55ScP3ZC9uDx8lbQnvUi0rBt1wUzO1WMJQiBJ2c5MGal9q7K/
   8h+KZWjAjmGrfNlmJcpUzua8AD5FCH8WJ+J1mNZnPJbV1qPsQDUNXoien
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="421818613"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="421818613"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 21:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705655235"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="705655235"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2023 21:53:59 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hdegoede@redhat.com, dan.scally@ideasonboard.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH v2] media: ov13b10: add PM control support based on power resources
Date:   Tue, 13 Jun 2023 13:05:20 +0800
Message-Id: <20230613050520.1580151-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
---
 drivers/media/i2c/ov13b10.c | 100 +++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 96d3bd6ab3bd..be2c7d8c83ac 100644
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
@@ -1051,6 +1059,52 @@ static int ov13b10_identify_module(struct ov13b10 *ov13b)
 	return 0;
 }
 
+static int ov13b10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov13b10 *ov13b10 = to_ov13b10(sd);
+
+	if (ov13b10->reset)
+		gpiod_set_value_cansleep(ov13b10->reset, 1);
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
+	if (ov13b10->reset) {
+		gpiod_set_value_cansleep(ov13b10->reset, 0);
+		/* 5ms to wait ready after XSHUTDN assert */
+		usleep_range(5000, 5500);
+	}
+
+	return 0;
+}
+
 static int ov13b10_start_streaming(struct ov13b10 *ov13b)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
@@ -1317,6 +1371,34 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
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
@@ -1407,13 +1489,23 @@ static int ov13b10_probe(struct i2c_client *client)
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
 
@@ -1422,7 +1514,7 @@ static int ov13b10_probe(struct i2c_client *client)
 
 	ret = ov13b10_init_controls(ov13b);
 	if (ret)
-		return ret;
+		goto error_power_off;
 
 	/* Initialize subdev */
 	ov13b->sd.internal_ops = &ov13b10_internal_ops;
@@ -1462,6 +1554,9 @@ static int ov13b10_probe(struct i2c_client *client)
 	ov13b10_free_controls(ov13b);
 	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
 
+error_power_off:
+	ov13b10_power_off(&client->dev);
+
 	return ret;
 }
 
@@ -1479,6 +1574,7 @@ static void ov13b10_remove(struct i2c_client *client)
 
 static const struct dev_pm_ops ov13b10_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
+	SET_RUNTIME_PM_OPS(ov13b10_power_off, ov13b10_power_on, NULL)
 };
 
 #ifdef CONFIG_ACPI
-- 
2.40.1

