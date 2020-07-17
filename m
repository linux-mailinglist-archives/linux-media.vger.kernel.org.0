Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84FD2243F8
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgGQTMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:12:02 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1403 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbgGQTMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:12:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f11f7c40001>; Fri, 17 Jul 2020 12:11:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 12:12:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 12:12:00 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 19:11:59 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 17 Jul 2020 19:11:59 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.115]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f11f7fe0001>; Fri, 17 Jul 2020 12:11:59 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] media: i2c: imx274: Add IMX274 power on and off sequence
Date:   Fri, 17 Jul 2020 12:15:22 -0700
Message-ID: <1595013322-15077-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595013322-15077-1-git-send-email-skomatineni@nvidia.com>
References: <1595013322-15077-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595013060; bh=boIvlrIG2qx41G9zjbey4MygAAMCqMjJQzTJ18Zg5mk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=bJS9Y8xb6VvtxfhFTwdZDiBJ6i32INrBvfuyigyXBuwjhoYX2BbDLm1hGxS9hxQve
         HRfme8lDSqahhvaSrXdkkH4VNEwztHGzi6Q1t8jpW/+TFFQHxkeP4p4FvMt9WGMBWq
         FqZTgeb0ic02lWjg7rRgDhOl4fSgvaC01ZFV+3GfHwCznUuezQphXSIZGuvLtfPz0P
         5dj84UYgvKvQH7SuIItAiBevLel53dEFg9sw9W6CmB73aAz9S9P+MSY/Zv7PWpv7Us
         Q6nU1i6KyE2kIgdxy6G+tbQEFI3FM7kTGhiLcjMsm75ExF6LsssHx6shIHHtr+SxEH
         k0WF8SR1E1N4g==
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
 drivers/media/i2c/imx274.c | 135 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 132 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 55869ff..c3f7bcd 100644
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
@@ -131,6 +134,15 @@
 #define IMX274_TABLE_WAIT_MS			0
 #define IMX274_TABLE_END			1
 
+/* regulator supplies */
+static const char * const imx274_supply_names[] = {
+	"VDDL",  /* IF (1.2V) supply */
+	"VDIG",  /* Digital Core (1.8V) supply */
+	"VANA",  /* Analog (2.8V) supply */
+};
+
+#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
+
 /*
  * imx274 I2C operation related structure
  */
@@ -501,6 +513,8 @@ struct imx274_ctrls {
  * @frame_rate: V4L2 frame rate structure
  * @regmap: Pointer to regmap structure
  * @reset_gpio: Pointer to reset gpio
+ * @supplies: imx274 analog and digital supplies
+ * @inck: input clock to imx274
  * @lock: Mutex structure
  * @mode: Parameters for the selected readout mode
  */
@@ -514,6 +528,8 @@ struct stimx274 {
 	struct v4l2_fract frame_interval;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpio;
+	struct regulator *supplies[IMX274_NUM_SUPPLIES];
+	struct clk *inck;
 	struct mutex lock; /* mutex lock for operations */
 	const struct imx274_mode *mode;
 };
@@ -767,6 +783,98 @@ static void imx274_reset(struct stimx274 *priv, int rst)
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
+	int i, ret;
+
+	ret = clk_prepare_enable(imx274->inck);
+	if (ret) {
+		dev_err(&imx274->client->dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	for (i = 0; i < IMX274_NUM_SUPPLIES; i++) {
+		if (imx274->supplies[i]) {
+			ret = regulator_enable(imx274->supplies[i]);
+			if (ret < 0) {
+				dev_err(&imx274->client->dev,
+					"Failed to enable %s supply: %d\n",
+					imx274_supply_names[i], ret);
+				goto fail_reg;
+			}
+		}
+	}
+
+	usleep_range(1, 2);
+	imx274_reset(imx274, 1);
+
+	return 0;
+
+fail_reg:
+	for (--i; i >= 0; i--) {
+		if (imx274->supplies[i])
+			regulator_disable(imx274->supplies[i]);
+	}
+
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
+	int i;
+
+	imx274_reset(imx274, 0);
+
+	for (i = 0; i < IMX274_NUM_SUPPLIES; i++) {
+		if (imx274->supplies[i])
+			regulator_disable(imx274->supplies[i]);
+	}
+
+	clk_disable_unprepare(imx274->inck);
+
+	return 0;
+}
+
+static int imx274_get_regulators(struct device *dev, struct stimx274 *imx274)
+{
+	int i, err;
+	const char *supply;
+
+	for (i = 0; i < IMX274_NUM_SUPPLIES; i++) {
+		supply = imx274_supply_names[i];
+		imx274->supplies[i] = devm_regulator_get_optional(dev, supply);
+		if (!IS_ERR(imx274->supplies[i]))
+			continue;
+		err = PTR_ERR(imx274->supplies[i]);
+		if (err != -ENODEV) {
+			if (err != -EPROBE_DEFER)
+				dev_err(&imx274->client->dev,
+					"Failed to get %s supply: %d\n",
+					supply, err);
+			return err;
+		}
+
+		imx274->supplies[i] = NULL;
+	}
+
+	return 0;
+}
+
 /**
  * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
  * @ctrl: V4L2 control to be set
@@ -1836,6 +1944,13 @@ static int imx274_probe(struct i2c_client *client)
 
 	mutex_init(&imx274->lock);
 
+	imx274->inck = devm_clk_get_optional(&client->dev, "inck");
+	ret = imx274_get_regulators(&client->dev, imx274);
+	if (ret) {
+		dev_err(&client->dev, "Failed to get power regulators, err: %d\n", ret);
+		return ret;
+	}
+
 	/* initialize format */
 	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
 	imx274->crop.width = IMX274_MAX_WIDTH;
@@ -1883,15 +1998,26 @@ static int imx274_probe(struct i2c_client *client)
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
+	ret = clk_set_rate(imx274->inck, IMX274_DEFAULT_CLK_FREQ);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to set INCK clock rate\n");
+		return ret;
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
@@ -1958,6 +2084,8 @@ static int imx274_probe(struct i2c_client *client)
 
 err_ctrls:
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
+err_power_off:
+	imx274_power_off(&client->dev);
 err_me:
 	media_entity_cleanup(&sd->entity);
 err_regmap:
@@ -1975,6 +2103,7 @@ static int imx274_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
+	imx274_power_off(&client->dev);
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&imx274->lock);
 	return 0;
-- 
2.7.4

