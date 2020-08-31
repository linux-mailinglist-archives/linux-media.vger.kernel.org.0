Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62E2258221
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 21:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbgHaTxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 15:53:06 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2974 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbgHaTww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 15:52:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4d54950000>; Mon, 31 Aug 2020 12:50:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 31 Aug 2020 12:52:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 31 Aug 2020 12:52:51 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 19:52:51 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 31 Aug 2020 19:52:51 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.173.243]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4d55120003>; Mon, 31 Aug 2020 12:52:51 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 4/4] media: i2c: imx274: Add IMX274 power on and off sequence
Date:   Mon, 31 Aug 2020 12:52:38 -0700
Message-ID: <1598903558-9691-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
References: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598903445; bh=lP1zhiAy94Lt2N8VXq4yZb/bmC1XQ1c+uwH/BIDJqd8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=WkneU/+8H0TRxL7R3LjZ4xADK1bfCpq/647GSFvSF1bodE7Qg4Xbd0Ioj3Z6ZkzkO
         W2HP1DpgQoYO3MiFtecQO6Hs0jZ0l9t8kXM9Kip+R5aFfsxaI+T53MjHeeAPGWdPxV
         nCDVEjD8yKJFtiuZwbe3Dovz/fb/ZVGmMXMtntPB6Is4cQv9Qr3Gq6B2HTnWc8qGvR
         qjgQV+20+RMGOFUrc920KYDr8NQObzsw9mYlYOPLbuw8VP6Y9DU8p9Gwg94UBiQmqk
         wwklZIe7Em868tL3ACKR630WlXenQI4O+9ZP0xa7oF70OnQFyqBq1WGOTYnaptq4Xo
         u1HNokKGco/Ow==
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

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/media/i2c/imx274.c | 151 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 148 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index a4b9dfd..18a1e87 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -18,7 +18,9 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_gpio.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/videodev2.h>
@@ -131,6 +133,15 @@
 #define IMX274_TABLE_WAIT_MS			0
 #define IMX274_TABLE_END			1
 
+/* regulator supplies */
+static const char * const imx274_supply_names[] = {
+	"vddl",  /* IF (1.2V) supply */
+	"vdig",  /* Digital Core (1.8V) supply */
+	"vana",  /* Analog (2.8V) supply */
+};
+
+#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
+
 /*
  * imx274 I2C operation related structure
  */
@@ -501,6 +512,8 @@ struct imx274_ctrls {
  * @frame_rate: V4L2 frame rate structure
  * @regmap: Pointer to regmap structure
  * @reset_gpio: Pointer to reset gpio
+ * @supplies: imx274 analog and digital supplies
+ * @inck: input clock to imx274
  * @lock: Mutex structure
  * @mode: Parameters for the selected readout mode
  */
@@ -514,6 +527,8 @@ struct stimx274 {
 	struct v4l2_fract frame_interval;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[IMX274_NUM_SUPPLIES];
+	struct clk *inck;
 	struct mutex lock; /* mutex lock for operations */
 	const struct imx274_mode *mode;
 };
@@ -767,6 +782,75 @@ static void imx274_reset(struct stimx274 *priv, int rst)
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
+	/* keep sensor in reset before power on */
+	imx274_reset(imx274, 0);
+
+	ret = clk_prepare_enable(imx274->inck);
+	if (ret) {
+		dev_err(&imx274->client->dev,
+			"Failed to enable input clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(IMX274_NUM_SUPPLIES, imx274->supplies);
+	if (ret) {
+		dev_err(&imx274->client->dev,
+			"Failed to enable regulators: %d\n", ret);
+		goto fail_reg;
+	}
+
+	usleep_range(1, 2);
+	imx274_reset(imx274, 1);
+
+	return 0;
+
+fail_reg:
+	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
+	clk_disable_unprepare(imx274->inck);
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
+	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
+
+	clk_disable_unprepare(imx274->inck);
+
+	return 0;
+}
+
+static int imx274_get_regulators(struct device *dev, struct stimx274 *imx274)
+{
+	int i;
+
+	for (i = 0; i < IMX274_NUM_SUPPLIES; i++)
+		imx274->supplies[i].supply = imx274_supply_names[i];
+
+	return devm_regulator_bulk_get(dev, IMX274_NUM_SUPPLIES,
+					imx274->supplies);
+}
+
 /**
  * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
  * @ctrl: V4L2 control to be set
@@ -781,6 +865,9 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct stimx274 *imx274 = to_imx274(sd);
 	int ret = -EINVAL;
 
+	if (!pm_runtime_get_if_in_use(&imx274->client->dev))
+		return 0;
+
 	dev_dbg(&imx274->client->dev,
 		"%s : s_ctrl: %s, value: %d\n", __func__,
 		ctrl->name, ctrl->val);
@@ -811,6 +898,8 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put(&imx274->client->dev);
+
 	return ret;
 }
 
@@ -1327,6 +1416,13 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 	mutex_lock(&imx274->lock);
 
 	if (on) {
+		ret = pm_runtime_get_sync(&imx274->client->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(&imx274->client->dev);
+			mutex_unlock(&imx274->lock);
+			return ret;
+		}
+
 		/* load mode registers */
 		ret = imx274_mode_regs(imx274);
 		if (ret)
@@ -1362,6 +1458,7 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 		ret = imx274_write_table(imx274, imx274_stop);
 		if (ret)
 			goto fail;
+		pm_runtime_put(&imx274->client->dev);
 	}
 
 	mutex_unlock(&imx274->lock);
@@ -1369,6 +1466,7 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 	return 0;
 
 fail:
+	pm_runtime_put(&imx274->client->dev);
 	mutex_unlock(&imx274->lock);
 	dev_err(&imx274->client->dev, "s_stream failed\n");
 	return ret;
@@ -1834,6 +1932,14 @@ static int imx274_probe(struct i2c_client *client)
 
 	mutex_init(&imx274->lock);
 
+	imx274->inck = devm_clk_get_optional(&client->dev, "inck");
+	ret = imx274_get_regulators(&client->dev, imx274);
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to get power regulators, err: %d\n", ret);
+		return ret;
+	}
+
 	/* initialize format */
 	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
 	imx274->crop.width = IMX274_MAX_WIDTH;
@@ -1881,15 +1987,23 @@ static int imx274_probe(struct i2c_client *client)
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
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
 
 	/* initialize controls */
 	ret = v4l2_ctrl_handler_init(&imx274->ctrls.handler, 4);
 	if (ret < 0) {
 		dev_err(&client->dev,
 			"%s : ctrl handler init Failed\n", __func__);
-		goto err_me;
+		goto err_disable_rpm;
 	}
 
 	imx274->ctrls.handler.lock = &imx274->lock;
@@ -1951,11 +2065,16 @@ static int imx274_probe(struct i2c_client *client)
 		goto err_ctrls;
 	}
 
+	pm_runtime_idle(&client->dev);
+
 	dev_info(&client->dev, "imx274 : imx274 probe success !\n");
 	return 0;
 
 err_ctrls:
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
+err_disable_rpm:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 err_me:
 	media_entity_cleanup(&sd->entity);
 err_regmap:
@@ -1968,19 +2087,45 @@ static int imx274_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct stimx274 *imx274 = to_imx274(sd);
 
+	pm_runtime_get_sync(&imx274->client->dev);
+
 	/* stop stream */
 	imx274_write_table(imx274, imx274_stop);
 
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
+
+	pm_runtime_put(&client->dev);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&imx274->lock);
 	return 0;
 }
 
+static int __maybe_unused imx274_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return imx274_power_off(&client->dev);
+}
+
+static int __maybe_unused imx274_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return imx274_power_on(&client->dev);
+}
+
+static const struct dev_pm_ops imx274_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx274_runtime_suspend, imx274_runtime_resume, NULL)
+};
+
 static struct i2c_driver imx274_i2c_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
+		.pm = &imx274_pm_ops,
 		.of_match_table	= imx274_of_id_table,
 	},
 	.probe_new	= imx274_probe,
-- 
2.7.4

