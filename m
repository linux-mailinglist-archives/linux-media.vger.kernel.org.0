Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3688273505
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 23:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgIUVjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 17:39:55 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10740 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 17:39:50 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f691d770002>; Mon, 21 Sep 2020 14:39:03 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 21:39:49 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server id
 15.0.1473.3 via Frontend Transport; Mon, 21 Sep 2020 21:39:48 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 3/3] media: i2c: imx274: Add IMX274 power on and off sequence
Date:   Mon, 21 Sep 2020 14:39:39 -0700
Message-ID: <1600724379-7324-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600724343; bh=YVW64MSwouwIqwlk3QD2VSw1G6wicTON8raqInuCd+s=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=nwS6wEW8/Kc+mtPPOH0QG2pLfX1LzigtTUbyGmn8sgCgMHztwNdAEh9GCygPBL12c
         yjsTSitW/Isbgd3C6TdqJnrs67CC+simnnlhafvQb9YsTvPMTspUtMx0m3qzXFE+4h
         8UTFWJlBd1N8Zv64F0eu8I1H2sHq22szMDRtsDY6DKnpRp3cznh0m2gt6X2jvSyy8L
         1/a/rz4MkJYOJkh64mgVbhnWA34gaC7469obO91vs6Tu3QP9f69+8A5jtXhKSwD/4R
         S3aj2hPov/TE07VJXoEztJsaloymi1DLETewn0JF9pIEZexbL6d6JCJ4rnaVCCDBve
         40SMr1quDpPpQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IMX274 has analog 2.8V supply, digital core 1.8V supply, and vddl digital
io 1.2V supply which are optional based on camera module design.

IMX274 also need external 24Mhz clock and is optional based on
camera module design.

This patch adds support for IMX274 power on and off to enable and
disable these supplies and external clock.

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/media/i2c/imx274.c | 184 +++++++++++++++++++++++++++++++++------------
 1 file changed, 134 insertions(+), 50 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 5e515f0..b3057a5 100644
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
+ * @supplies: List of analog and digital supply regulators
+ * @inck: Pointer to sensor input clock
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
@@ -726,6 +741,12 @@ static int imx274_start_stream(struct stimx274 *priv)
 {
 	int err = 0;
 
+	err = __v4l2_ctrl_handler_setup(&priv->ctrls.handler);
+	if (err) {
+		dev_err(&priv->client->dev, "Error %d setup controls\n", err);
+		return err;
+	}
+
 	/*
 	 * Refer to "Standby Cancel Sequence when using CSI-2" in
 	 * imx274 datasheet, it should wait 10ms or more here.
@@ -767,6 +788,66 @@ static void imx274_reset(struct stimx274 *priv, int rst)
 	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
 }
 
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
+	udelay(2);
+	imx274_reset(imx274, 1);
+
+	return 0;
+
+fail_reg:
+	clk_disable_unprepare(imx274->inck);
+	return ret;
+}
+
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
+static int imx274_regulators_get(struct device *dev, struct stimx274 *imx274)
+{
+	unsigned int i;
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
@@ -781,6 +862,9 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct stimx274 *imx274 = to_imx274(sd);
 	int ret = -EINVAL;
 
+	if (!pm_runtime_get_if_in_use(&imx274->client->dev))
+		return 0;
+
 	dev_dbg(&imx274->client->dev,
 		"%s : s_ctrl: %s, value: %d\n", __func__,
 		ctrl->name, ctrl->val);
@@ -811,6 +895,8 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put(&imx274->client->dev);
+
 	return ret;
 }
 
@@ -1269,10 +1355,8 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
  *
  * Return: 0 on success, errors otherwise
  */
-static int imx274_load_default(struct stimx274 *priv)
+static void imx274_load_default(struct stimx274 *priv)
 {
-	int ret;
-
 	/* load default control values */
 	priv->frame_interval.numerator = 1;
 	priv->frame_interval.denominator = IMX274_DEF_FRAME_RATE;
@@ -1280,29 +1364,6 @@ static int imx274_load_default(struct stimx274 *priv)
 	priv->ctrls.gain->val = IMX274_DEF_GAIN;
 	priv->ctrls.vflip->val = 0;
 	priv->ctrls.test_pattern->val = TEST_PATTERN_DISABLED;
-
-	/* update frame rate */
-	ret = imx274_set_frame_interval(priv,
-					priv->frame_interval);
-	if (ret)
-		return ret;
-
-	/* update exposure time */
-	ret = v4l2_ctrl_s_ctrl(priv->ctrls.exposure, priv->ctrls.exposure->val);
-	if (ret)
-		return ret;
-
-	/* update gain */
-	ret = v4l2_ctrl_s_ctrl(priv->ctrls.gain, priv->ctrls.gain->val);
-	if (ret)
-		return ret;
-
-	/* update vflip */
-	ret = v4l2_ctrl_s_ctrl(priv->ctrls.vflip, priv->ctrls.vflip->val);
-	if (ret)
-		return ret;
-
-	return 0;
 }
 
 /**
@@ -1327,6 +1388,13 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
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
@@ -1347,12 +1415,6 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 		if (ret)
 			goto fail;
 
-		/* update exposure time */
-		ret = __v4l2_ctrl_s_ctrl(imx274->ctrls.exposure,
-					 imx274->ctrls.exposure->val);
-		if (ret)
-			goto fail;
-
 		/* start stream */
 		ret = imx274_start_stream(imx274);
 		if (ret)
@@ -1362,6 +1424,8 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 		ret = imx274_write_table(imx274, imx274_stop);
 		if (ret)
 			goto fail;
+
+		pm_runtime_put(&imx274->client->dev);
 	}
 
 	mutex_unlock(&imx274->lock);
@@ -1369,6 +1433,7 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 	return 0;
 
 fail:
+	pm_runtime_put(&imx274->client->dev);
 	mutex_unlock(&imx274->lock);
 	dev_err(&imx274->client->dev, "s_stream failed\n");
 	return ret;
@@ -1834,6 +1899,17 @@ static int imx274_probe(struct i2c_client *client)
 
 	mutex_init(&imx274->lock);
 
+	imx274->inck = devm_clk_get_optional(&client->dev, "inck");
+	if (IS_ERR(imx274->inck))
+		return PTR_ERR(imx274->inck);
+
+	ret = imx274_regulators_get(&client->dev, imx274);
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to get power regulators, err: %d\n", ret);
+		return ret;
+	}
+
 	/* initialize format */
 	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
 	imx274->crop.width = IMX274_MAX_WIDTH;
@@ -1881,15 +1957,20 @@ static int imx274_probe(struct i2c_client *client)
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
@@ -1925,22 +2006,8 @@ static int imx274_probe(struct i2c_client *client)
 		goto err_ctrls;
 	}
 
-	/* setup default controls */
-	ret = v4l2_ctrl_handler_setup(&imx274->ctrls.handler);
-	if (ret) {
-		dev_err(&client->dev,
-			"Error %d setup default controls\n", ret);
-		goto err_ctrls;
-	}
-
 	/* load default control values */
-	ret = imx274_load_default(imx274);
-	if (ret) {
-		dev_err(&client->dev,
-			"%s : imx274_load_default failed %d\n",
-			__func__, ret);
-		goto err_ctrls;
-	}
+	imx274_load_default(imx274);
 
 	/* register subdevice */
 	ret = v4l2_async_register_subdev(sd);
@@ -1951,11 +2018,17 @@ static int imx274_probe(struct i2c_client *client)
 		goto err_ctrls;
 	}
 
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
+
 	dev_info(&client->dev, "imx274 : imx274 probe success !\n");
 	return 0;
 
 err_ctrls:
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
+err_power_off:
+	imx274_power_off(&client->dev);
 err_me:
 	media_entity_cleanup(&sd->entity);
 err_regmap:
@@ -1968,16 +2041,27 @@ static int imx274_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct stimx274 *imx274 = to_imx274(sd);
 
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		imx274_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
+
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&imx274->lock);
 	return 0;
 }
 
+static const struct dev_pm_ops imx274_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx274_power_off, imx274_power_on, NULL)
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

