Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802992203B6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 06:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgGOEXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 00:23:32 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4803 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgGOEX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 00:23:27 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e84b20000>; Tue, 14 Jul 2020 21:23:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:23:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 Jul 2020 21:23:27 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:23:26 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:23:26 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e84bd0002>; Tue, 14 Jul 2020 21:23:26 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/3] media: i2c: imx274: Add IMX274 power on and off sequence
Date:   Tue, 14 Jul 2020 21:24:56 -0700
Message-ID: <1594787096-26685-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594787096-26685-1-git-send-email-skomatineni@nvidia.com>
References: <1594787096-26685-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786994; bh=G83mFRo9SRI6GnNGzS3t+LhHlj25287C3UQMYW1Icas=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ibs7++MpRFu0IBxa4MXmoPpDRg3t4zemASl9v09rX8RyP7Mw/sg8IRaFQcu59nlAo
         rZVWXgLQ5/6/okiTQLqjENUvPcRvGQL+Ude1g4VfO42+/F+qbdkpFHuvlnjBllrM5q
         SLEVyuE/jpun1xUFYmauqjGvXqZVqH+qBCnWbJaEDxI6B5FyKIsaxHv6JVrucxP0SM
         YAlJwKIarcUqRY+8BRZ+4QztNRHrVSn1Ec7wfIoFwHwhOiXrYdj30wfx7oV2xzVT1I
         yAj4iic9A3yeuLfn/e37Dzp4bxDAtZJqNDg1EuTGX+/VlXuT96t2pNpxYC/hIV5RjA
         XHEPWe/1j+lTQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
and VDDL digital io 1.2V supply which are optional based on camera
module design.

IMX274 also need external 24Mhz clock and is optional based on
camera module design.

This patch adds support for IMX274 power on and off to enable and
disable these supplies and external clock.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/media/i2c/imx274.c | 170 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 55869ff..8a34c07 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/of_gpio.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/videodev2.h>
@@ -27,6 +28,8 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-subdev.h>
 
+#define IMX274_DEFAULT_CLK_FREQ			24000000
+
 /*
  * See "SHR, SVR Setting" in datasheet
  */
@@ -501,6 +504,10 @@ struct imx274_ctrls {
  * @frame_rate: V4L2 frame rate structure
  * @regmap: Pointer to regmap structure
  * @reset_gpio: Pointer to reset gpio
+ * @vana_supply: VANA analog supply regulator
+ * @vdig_supply: VDIG digital core supply regulator
+ * @vddl_supply: VDDL digital io supply regulator
+ * @xclk: system clock to imx274
  * @lock: Mutex structure
  * @mode: Parameters for the selected readout mode
  */
@@ -514,6 +521,10 @@ struct stimx274 {
 	struct v4l2_fract frame_interval;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpio;
+	struct regulator *vana_supply;
+	struct regulator *vdig_supply;
+	struct regulator *vddl_supply;
+	struct clk *xclk;
 	struct mutex lock; /* mutex lock for operations */
 	const struct imx274_mode *mode;
 };
@@ -767,6 +778,138 @@ static void imx274_reset(struct stimx274 *priv, int rst)
 	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
 }
 
+/*
+ * imx274_power_on - Function called to power on the sensor
+ * @imx274: Pointer to device structure
+ */
+static int imx274_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct stimx274 *imx274 = to_imx274(sd);
+	int ret;
+
+	ret = clk_prepare_enable(imx274->xclk);
+	if (ret) {
+		dev_err(&imx274->client->dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	if (imx274->vana_supply) {
+		ret = regulator_enable(imx274->vana_supply);
+		if (ret < 0) {
+			dev_err(&imx274->client->dev,
+				"Failed to enable VANA supply: %d\n", ret);
+			goto disable_clk;
+		}
+	}
+
+	if (imx274->vdig_supply) {
+		ret = regulator_enable(imx274->vdig_supply);
+		if (ret < 0) {
+			dev_err(&imx274->client->dev,
+				"Failed to enable VDIG supply: %d\n", ret);
+			goto disable_vana_reg;
+		}
+	}
+
+	if (imx274->vddl_supply) {
+		ret = regulator_enable(imx274->vddl_supply);
+		if (ret < 0) {
+			dev_err(&imx274->client->dev,
+				"Failed to enable VDDL supply: %d\n", ret);
+			goto disable_vdig_reg;
+		}
+	}
+
+	usleep_range(1, 2);
+	imx274_reset(imx274, 1);
+
+	return 0;
+
+disable_vdig_reg:
+	if (imx274->vdig_supply)
+		regulator_disable(imx274->vdig_supply);
+disable_vana_reg:
+	if (imx274->vana_supply)
+		regulator_disable(imx274->vana_supply);
+disable_clk:
+	clk_disable_unprepare(imx274->xclk);
+	return ret;
+}
+
+/*
+ * imx274_power_off - Function called to power off the sensor
+ * @imx274: Pointer to device structure
+ */
+static int imx274_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct stimx274 *imx274 = to_imx274(sd);
+
+	imx274_reset(imx274, 0);
+
+	if (imx274->vddl_supply)
+		regulator_disable(imx274->vddl_supply);
+
+	if (imx274->vdig_supply)
+		regulator_disable(imx274->vdig_supply);
+
+	if (imx274->vana_supply)
+		regulator_disable(imx274->vana_supply);
+
+	clk_disable_unprepare(imx274->xclk);
+
+	return 0;
+}
+
+static int imx274_get_regulators(struct device *dev, struct stimx274 *imx274)
+{
+	int i;
+
+	imx274->vana_supply = devm_regulator_get_optional(dev, "VANA");
+	if (IS_ERR(imx274->vana_supply)) {
+		if (PTR_ERR(imx274->vana_supply) != -ENODEV) {
+			if (PTR_ERR(imx274->vana_supply) != -EPROBE_DEFER)
+				dev_err(&imx274->client->dev,
+					"Failed to get VANA supply: %ld\n",
+					PTR_ERR(imx274->vana_supply));
+			return PTR_ERR(imx274->vana_supply);
+		}
+
+		imx274->vana_supply = NULL;
+	}
+
+	imx274->vdig_supply = devm_regulator_get_optional(dev, "VDIG");
+	if (IS_ERR(imx274->vdig_supply)) {
+		if (PTR_ERR(imx274->vdig_supply) != -ENODEV) {
+			if (PTR_ERR(imx274->vdig_supply) != -EPROBE_DEFER)
+				dev_err(&imx274->client->dev,
+					"Failed to get VDIG supply: %ld\n",
+					PTR_ERR(imx274->vdig_supply));
+			return PTR_ERR(imx274->vdig_supply);
+		}
+
+		imx274->vdig_supply = NULL;
+	}
+
+	imx274->vddl_supply = devm_regulator_get_optional(dev, "VDDL");
+	if (IS_ERR(imx274->vddl_supply)) {
+		if (PTR_ERR(imx274->vddl_supply) != -ENODEV) {
+			if (PTR_ERR(imx274->vddl_supply) != -EPROBE_DEFER)
+				dev_err(&imx274->client->dev,
+					"Failed to get VDIG supply: %ld\n",
+					PTR_ERR(imx274->vddl_supply));
+			return PTR_ERR(imx274->vddl_supply);
+		}
+
+		imx274->vddl_supply = NULL;
+	}
+
+	return 0;
+}
+
 /**
  * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
  * @ctrl: V4L2 control to be set
@@ -1836,6 +1979,19 @@ static int imx274_probe(struct i2c_client *client)
 
 	mutex_init(&imx274->lock);
 
+	imx274->xclk = devm_clk_get_optional(&client->dev, "xclk");
+	ret = clk_set_rate(imx274->xclk, IMX274_DEFAULT_CLK_FREQ);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to set xclk rate\n");
+		return ret;
+	}
+
+	ret = imx274_get_regulators(&client->dev, imx274);
+	if (ret) {
+		dev_err(&client->dev, "Failed to get power regulators, err: %d\n", ret);
+		return ret;
+	}
+
 	/* initialize format */
 	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
 	imx274->crop.width = IMX274_MAX_WIDTH;
@@ -1883,15 +2039,20 @@ static int imx274_probe(struct i2c_client *client)
 		goto err_me;
 	}
 
-	/* pull sensor out of reset */
-	imx274_reset(imx274, 1);
+	/* power on the sensor */
+	ret = imx274_power_on(&client->dev);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"%s : imx274 power on failed\n", __func__);
+		goto err_me;
+	}
 
 	/* initialize controls */
 	ret = v4l2_ctrl_handler_init(&imx274->ctrls.handler, 4);
 	if (ret < 0) {
 		dev_err(&client->dev,
 			"%s : ctrl handler init Failed\n", __func__);
-		goto err_me;
+		goto err_power_off;
 	}
 
 	imx274->ctrls.handler.lock = &imx274->lock;
@@ -1958,6 +2119,8 @@ static int imx274_probe(struct i2c_client *client)
 
 err_ctrls:
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
+err_power_off:
+	imx274_power_off(&client->dev);
 err_me:
 	media_entity_cleanup(&sd->entity);
 err_regmap:
@@ -1975,6 +2138,7 @@ static int imx274_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
+	imx274_power_off(&client->dev);
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&imx274->lock);
 	return 0;
-- 
2.7.4

