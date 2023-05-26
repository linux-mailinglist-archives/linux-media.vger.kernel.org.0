Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA1671241E
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 11:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243004AbjEZJ4h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 05:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242988AbjEZJ4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 05:56:36 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EABADF
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685094992; x=1716630992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WL8BBL0DlaNbGtKZAi+IkyqZmQtBpnvTz3A9P+0xaSU=;
  b=IDcM7XpyV9cu8tA6vHNWxBgQxGgdto7niIilc/F159rmpaAFnm4Twn6c
   +BoxveWMueZRVxMBSXbh8v1Gm7d0kmSiJNIEUTXFoOsTIUhdkHOb7Xa2+
   08zV2kZKllBBSjd+arsenAK1ZzIR2lQG/g8ZoGJQ65RELpSVmp1PN2F0m
   RUCoqxaBqDuDGnF/AzXLFa0djGfnYSxDHCRNi6jvKN8TRp+cuGmchvNMl
   6durFfgKE2yL7qJBwAVn/jQxLM+25XG+xWiVsFFeJZNXJwRrKUhEkOasA
   2Ldzxr7K9dzLge5WIrqJx11JZpFHikJR5UJTmGXhoSV6zxo0A192Lx4UR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334517530"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="334517530"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="1035292440"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="1035292440"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by fmsmga005.fm.intel.com with ESMTP; 26 May 2023 02:56:30 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [RESEND PATCH 3/3] media: ov13b10: add PM control support based on power resources
Date:   Fri, 26 May 2023 18:07:25 +0800
Message-Id: <20230526100725.2467635-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526100725.2467635-1-bingbu.cao@intel.com>
References: <20230526100725.2467635-1-bingbu.cao@intel.com>
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
up by acquire the PM resource from INT3472. On such platform, 1 GPIO
can be used to enable AVDD and DOVDD, 1 GPIO to reset, we just have
one power supply 'vdd' for camera. Add 2 power interfaces and also
registered as runtime PM callbacks to support that.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 98 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 2d48c94659a4..b1faa89a3571 100644
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
+	struct regulator *vdd;
+	struct gpio_desc *reset;
+
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
@@ -1051,6 +1059,50 @@ static int ov13b10_identify_module(struct ov13b10 *ov13b)
 	return 0;
 }
 
+static int ov13b10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov13b10 *ov13b10 = to_ov13b10(sd);
+
+	if (!ov13b10->vdd || !ov13b10->reset || !ov13b10->img_clk)
+		return 0;
+
+	gpiod_set_value_cansleep(ov13b10->reset, 1);
+	regulator_disable(ov13b10->vdd);
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
+	if (!ov13b10->vdd || !ov13b10->reset || !ov13b10->img_clk)
+		return 0;
+
+	ret = clk_prepare_enable(ov13b10->img_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(ov13b10->vdd);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable vdd: %d", ret);
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(ov13b10->reset, 0);
+
+	/* 5ms to wait ready after XSHUTDN assert */
+	usleep_range(5000, 5500);
+
+	return 0;
+}
+
 static int ov13b10_start_streaming(struct ov13b10 *ov13b)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
@@ -1317,6 +1369,37 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
 	mutex_destroy(&ov13b->mutex);
 }
 
+static void ov13b10_get_pm_resources(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov13b10 *ov13b = to_ov13b10(sd);
+
+	if (!is_acpi_node(dev_fwnode(dev)))
+		return;
+
+	ov13b->reset = devm_gpiod_get_optional(dev, "reset",
+					       GPIOD_OUT_LOW);
+	if (IS_ERR(ov13b->reset)) {
+		dev_dbg(dev, "failed to get reset gpio: %ld",
+			PTR_ERR(ov13b->reset));
+		ov13b->reset = NULL;
+	}
+
+	ov13b->img_clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ov13b->img_clk)) {
+		dev_dbg(dev, "failed to get imaging clock: %ld",
+			PTR_ERR(ov13b->img_clk));
+		ov13b->img_clk = NULL;
+	}
+
+	ov13b->vdd = devm_regulator_get_optional(dev, "vdd");
+	if (IS_ERR(ov13b->vdd)) {
+		dev_dbg(dev, "failed to get vdd regulator: %ld",
+			PTR_ERR(ov13b->vdd));
+		ov13b->vdd = NULL;
+	}
+}
+
 static int ov13b10_check_hwcfg(struct device *dev)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1407,13 +1490,21 @@ static int ov13b10_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
 
+	ov13b10_get_pm_resources(&client->dev);
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
+		ov13b10_power_on(&client->dev);
+		if (ret) {
+			dev_err(&client->dev, "failed to power on\n");
+			goto error_power_off;
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
 
@@ -1422,7 +1513,7 @@ static int ov13b10_probe(struct i2c_client *client)
 
 	ret = ov13b10_init_controls(ov13b);
 	if (ret)
-		return ret;
+		goto error_power_off;
 
 	/* Initialize subdev */
 	ov13b->sd.internal_ops = &ov13b10_internal_ops;
@@ -1461,6 +1552,8 @@ static int ov13b10_probe(struct i2c_client *client)
 error_handler_free:
 	ov13b10_free_controls(ov13b);
 	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+error_power_off:
+	ov13b10_power_off(&client->dev);
 
 	return ret;
 }
@@ -1479,6 +1572,7 @@ static void ov13b10_remove(struct i2c_client *client)
 
 static const struct dev_pm_ops ov13b10_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
+	SET_RUNTIME_PM_OPS(ov13b10_power_off, ov13b10_power_on, NULL)
 };
 
 #ifdef CONFIG_ACPI
-- 
2.40.1

