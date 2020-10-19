Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D33292CB6
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 19:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731203AbgJSR0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 13:26:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731187AbgJSR0l (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 13:26:41 -0400
Received: from localhost.localdomain (unknown [194.230.155.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C599522314;
        Mon, 19 Oct 2020 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603128400;
        bh=9VekKCyuc32rUGeAXkmomZLwHOrivk4pY7Iug35yAUU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=l0MdbRXi3Sk9vqBToW3jKl5mPLRUQjgfGtDe/X0LBiqInwgEFwjvarUJX0xCLCXT5
         kU9Hp/mj4HfIdg9KWd4HRLhVxBjLxSYgNGdNi2dBUOc8p0gRAlayUaP1hdFVD1bE7G
         MjH+otrr9k5ybae8xMVpcLX2xd26qy4VLvpBMD7c=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] media: i2c: imx258: get clock from device properties and enable it via runtime PM
Date:   Mon, 19 Oct 2020 19:26:17 +0200
Message-Id: <20201019172617.92815-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019172617.92815-1-krzk@kernel.org>
References: <20201019170247.92002-1-krzk@kernel.org>
 <20201019172617.92815-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX258 sensor driver checked in device properties for a
clock-frequency property which actually does not mean that the clock is
really running such frequency or is it even enabled.

Get the provided clock and check it frequency.  If none is provided,
fall back to old property.

Enable the clock when accessing the IMX258 registers and when streaming
starts with runtime PM.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v4:
1. Add missing imx258_power_off.

Changes since v3:
1. None

Changes since v2:
1. Do not try to set drvdata, wrap lines.
2. Use dev_dbg.

Changes since v1:
1. Use runtime PM for clock toggling
---
 drivers/media/i2c/imx258.c | 73 +++++++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index ae183b0dbba9..038115471f17 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2018 Intel Corporation
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -68,6 +69,9 @@
 #define REG_CONFIG_MIRROR_FLIP		0x03
 #define REG_CONFIG_FLIP_TEST_PATTERN	0x02
 
+/* Input clock frequency in Hz */
+#define IMX258_INPUT_CLOCK_FREQ		19200000
+
 struct imx258_reg {
 	u16 address;
 	u8 val;
@@ -610,6 +614,8 @@ struct imx258 {
 
 	/* Streaming on/off */
 	bool streaming;
+
+	struct clk *clk;
 };
 
 static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
@@ -972,6 +978,29 @@ static int imx258_stop_streaming(struct imx258 *imx258)
 	return 0;
 }
 
+static int imx258_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx258 *imx258 = to_imx258(sd);
+	int ret;
+
+	ret = clk_prepare_enable(imx258->clk);
+	if (ret)
+		dev_err(dev, "failed to enable clock\n");
+
+	return ret;
+}
+
+static int imx258_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx258 *imx258 = to_imx258(sd);
+
+	clk_disable_unprepare(imx258->clk);
+
+	return 0;
+}
+
 static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx258 *imx258 = to_imx258(sd);
@@ -1199,9 +1228,28 @@ static int imx258_probe(struct i2c_client *client)
 	int ret;
 	u32 val = 0;
 
-	device_property_read_u32(&client->dev, "clock-frequency", &val);
-	if (val != 19200000)
-		return -EINVAL;
+	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
+	if (!imx258)
+		return -ENOMEM;
+
+	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
+	if (!imx258->clk) {
+		dev_dbg(&client->dev,
+			"no clock provided, using clock-frequency property\n");
+
+		device_property_read_u32(&client->dev, "clock-frequency", &val);
+		if (val != IMX258_INPUT_CLOCK_FREQ)
+			return -EINVAL;
+	} else if (IS_ERR(imx258->clk)) {
+		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
+				     "error getting clock\n");
+	} else {
+		if (clk_get_rate(imx258->clk) != IMX258_INPUT_CLOCK_FREQ) {
+			dev_err(&client->dev,
+				"input clock frequency not supported\n");
+			return -EINVAL;
+		}
+	}
 
 	/*
 	 * Check that the device is mounted upside down. The driver only
@@ -1211,24 +1259,25 @@ static int imx258_probe(struct i2c_client *client)
 	if (ret || val != 180)
 		return -EINVAL;
 
-	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
-	if (!imx258)
-		return -ENOMEM;
-
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
+	/* Will be powered off via pm_runtime_idle */
+	ret = imx258_power_on(&client->dev);
+	if (ret)
+		return ret;
+
 	/* Check module identity */
 	ret = imx258_identify_module(imx258);
 	if (ret)
-		return ret;
+		goto error_identify;
 
 	/* Set default mode to max resolution */
 	imx258->cur_mode = &supported_modes[0];
 
 	ret = imx258_init_controls(imx258);
 	if (ret)
-		return ret;
+		goto error_identify;
 
 	/* Initialize subdev */
 	imx258->sd.internal_ops = &imx258_internal_ops;
@@ -1258,6 +1307,9 @@ static int imx258_probe(struct i2c_client *client)
 error_handler_free:
 	imx258_free_controls(imx258);
 
+error_identify:
+	imx258_power_off(&client->dev);
+
 	return ret;
 }
 
@@ -1271,6 +1323,8 @@ static int imx258_remove(struct i2c_client *client)
 	imx258_free_controls(imx258);
 
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		imx258_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
 	return 0;
@@ -1278,6 +1332,7 @@ static int imx258_remove(struct i2c_client *client)
 
 static const struct dev_pm_ops imx258_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(imx258_suspend, imx258_resume)
+	SET_RUNTIME_PM_OPS(imx258_power_off, imx258_power_on, NULL)
 };
 
 #ifdef CONFIG_ACPI
-- 
2.25.1

