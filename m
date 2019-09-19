Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B959EB82A1
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392628AbfISUiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:38:25 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42476 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392528AbfISUh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:37:58 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JKbud5116637;
        Thu, 19 Sep 2019 15:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568925476;
        bh=tsBmjzi9hLfO4Z1XFvwOJKvOG2eQliXcESn/VYx9n4c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=DUg4dv1B5+9t7nd8TQtiZ0Cy7FSqHWc3H1klknxxmukuhWZMWHKQsMK0YJpkny4ZU
         PMrzO6u1bmD1PmGAVSPP+wBJw0zaJN4g/CM8PpTNIwF4vvSLFlD1AeaZqV/ikNGIRo
         Hwj03BNTAuM9Xr7FztZyzQVLkSJs/XhBaGOYk0c4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JKbum8001182
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 15:37:56 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 15:37:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 15:37:56 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKboc4083029;
        Thu, 19 Sep 2019 15:37:56 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 5/7] media: i2c: ov2659: Add powerdown/reset gpio handling
Date:   Thu, 19 Sep 2019 15:39:53 -0500
Message-ID: <20190919203955.15125-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919203955.15125-1-bparrot@ti.com>
References: <20190919203955.15125-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On some board it is possible that the sensor 'powerdown' and or 'reset'
pin might be controlled by gpio instead of being tied.

To implement we add pm_runtime support which will handle the power
up/down sequence.

Now originally the driver assumed tat the sensor would always stay
powered and there keep its register setting. We cannot assume that this
anymore, so every time we "power up" we need to re-program the initial
registers configuration first. This was previously done only at probe
time.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/ov2659.c | 88 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7eee1812bba3..315c1d8bdb7b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -634,7 +634,7 @@ config VIDEO_OV2640
 config VIDEO_OV2659
 	tristate "OmniVision OV2659 sensor support"
 	depends on VIDEO_V4L2 && I2C
-	depends on MEDIA_CAMERA_SUPPORT
+	depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index f77320e8a60d..170f80a1a51f 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -22,9 +22,11 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
 
 #include <media/i2c/ov2659.h>
 #include <media/v4l2-ctrls.h>
@@ -218,6 +220,11 @@ struct ov2659 {
 	struct sensor_register *format_ctrl_regs;
 	struct ov2659_pll_ctrl pll;
 	int streaming;
+	/* used to control the sensor PWDN pin */
+	struct gpio_desc *pwdn_gpio;
+	/* used to control the sensor RESETB pin */
+	struct gpio_desc *resetb_gpio;
+	int on;
 };
 
 static const struct sensor_register ov2659_init_regs[] = {
@@ -1184,9 +1191,17 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
 		/* Stop Streaming Sequence */
 		ov2659_set_streaming(ov2659, 0);
 		ov2659->streaming = on;
+		pm_runtime_put(&client->dev);
 		goto unlock;
 	}
 
+	ret = pm_runtime_get_sync(&client->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&client->dev);
+		goto unlock;
+	}
+
+	ov2659_init(sd, 0);
 	ov2659_set_pixel_clock(ov2659);
 	ov2659_set_frame_size(ov2659);
 	ov2659_set_format(ov2659);
@@ -1243,6 +1258,32 @@ static const char * const ov2659_test_pattern_menu[] = {
 	"Vertical Color Bars",
 };
 
+static int ov2659_set_power(struct ov2659 *ov2659, int on)
+{
+	struct i2c_client *client = ov2659->client;
+
+	dev_dbg(&client->dev, "%s: on: %d\n", __func__, on);
+
+	if (on) {
+		if (ov2659->pwdn_gpio)
+			gpiod_direction_output(ov2659->pwdn_gpio, 0);
+
+		if (ov2659->resetb_gpio) {
+			gpiod_set_value(ov2659->resetb_gpio, 1);
+			usleep_range(500, 1000);
+			gpiod_set_value(ov2659->resetb_gpio, 0);
+			usleep_range(3000, 5000);
+		}
+	} else {
+		if (ov2659->pwdn_gpio)
+			gpiod_direction_output(ov2659->pwdn_gpio, 1);
+	}
+
+	ov2659->on = on;
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 subdev internal operations
  */
@@ -1323,7 +1364,6 @@ static int ov2659_detect(struct v4l2_subdev *sd)
 			ret = -ENODEV;
 		} else {
 			dev_info(&client->dev, "Found OV%04X sensor\n", id);
-			ret = ov2659_init(sd, 0);
 		}
 	}
 
@@ -1400,6 +1440,18 @@ static int ov2659_probe(struct i2c_client *client)
 	    ov2659->xvclk_frequency > 27000000)
 		return -EINVAL;
 
+	/* Optional gpio don't fail if not present */
+	ov2659->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(ov2659->pwdn_gpio))
+		return PTR_ERR(ov2659->pwdn_gpio);
+
+	/* Optional gpio don't fail if not present */
+	ov2659->resetb_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2659->resetb_gpio))
+		return PTR_ERR(ov2659->resetb_gpio);
+
 	v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
 	ov2659->link_frequency =
 			v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
@@ -1445,6 +1497,9 @@ static int ov2659_probe(struct i2c_client *client)
 	ov2659->frame_size = &ov2659_framesizes[2];
 	ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
 
+	pm_runtime_enable(&client->dev);
+	pm_runtime_get_sync(&client->dev);
+
 	ret = ov2659_detect(sd);
 	if (ret < 0)
 		goto error;
@@ -1458,10 +1513,14 @@ static int ov2659_probe(struct i2c_client *client)
 
 	dev_info(&client->dev, "%s sensor driver registered !!\n", sd->name);
 
+	pm_runtime_put(&client->dev);
+
 	return 0;
 
 error:
 	v4l2_ctrl_handler_free(&ov2659->ctrls);
+	pm_runtime_put(&client->dev);
+	pm_runtime_disable(&client->dev);
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&ov2659->lock);
 	return ret;
@@ -1477,9 +1536,35 @@ static int ov2659_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&ov2659->lock);
 
+	pm_runtime_disable(&client->dev);
+
 	return 0;
 }
 
+static int ov2659_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2659 *ov2659 = to_ov2659(sd);
+
+	ov2659_set_power(ov2659, 0);
+
+	return 0;
+}
+
+static int ov2659_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2659 *ov2659 = to_ov2659(sd);
+
+	return ov2659_set_power(ov2659, 1);
+}
+
+static const struct dev_pm_ops ov2659_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov2659_runtime_suspend, ov2659_runtime_resume, NULL)
+};
+
 static const struct i2c_device_id ov2659_id[] = {
 	{ "ov2659", 0 },
 	{ /* sentinel */ },
@@ -1497,6 +1582,7 @@ MODULE_DEVICE_TABLE(of, ov2659_of_match);
 static struct i2c_driver ov2659_i2c_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
+		.pm	= &ov2659_pm_ops,
 		.of_match_table = of_match_ptr(ov2659_of_match),
 	},
 	.probe_new	= ov2659_probe,
-- 
2.17.1

