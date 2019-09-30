Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C49C2152
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 15:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731314AbfI3NEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 09:04:52 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53750 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731306AbfI3NEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 09:04:52 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4icx032933;
        Mon, 30 Sep 2019 08:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569848684;
        bh=/HaeBZsL45WrA4xHL7zWjnhhg9gU6/ad02YthATuAgU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CmUv7s2Db2ts3cv94A1QcagknEuztPNDRhYjGJszBLqb7nyhwu5oadyog1w+aHqev
         8ATlqilbct7Mg5RUFKTwszBT6XELDPYn3mHZN1+cuQ1Ubz72+60HgNKa3N38Ss2Fl4
         0WonatV+HGey/tfb7zni8Fj44IWzvzupZpNQ7kF0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UD4i2k119205
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 08:04:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 08:04:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 08:04:35 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4Zil115624;
        Mon, 30 Sep 2019 08:04:44 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v5 6/8] media: i2c: ov2659: Add powerdown/reset gpio handling
Date:   Mon, 30 Sep 2019 08:06:42 -0500
Message-ID: <20190930130644.8704-7-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930130644.8704-1-bparrot@ti.com>
References: <20190930130644.8704-1-bparrot@ti.com>
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
up/down sequence when it is available otherwise the sensor will be
powered on at module insertion/probe and powered off at module removal.

Now originally the driver assumed that the sensor would always stay
powered and keep its register setting. We cannot assume this anymore, so
every time we "power up" we need to re-program the initial registers
configuration first. This was previously done only at probe time.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/ov2659.c | 86 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 85 insertions(+), 3 deletions(-)

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
index da181a13cf44..80de2e35aeca 100644
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
@@ -218,6 +220,10 @@ struct ov2659 {
 	struct sensor_register *format_ctrl_regs;
 	struct ov2659_pll_ctrl pll;
 	int streaming;
+	/* used to control the sensor PWDN pin */
+	struct gpio_desc *pwdn_gpio;
+	/* used to control the sensor RESETB pin */
+	struct gpio_desc *resetb_gpio;
 };
 
 static const struct sensor_register ov2659_init_regs[] = {
@@ -1184,10 +1190,19 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
 		/* Stop Streaming Sequence */
 		ov2659_set_streaming(ov2659, 0);
 		ov2659->streaming = on;
+		pm_runtime_put(&client->dev);
 		goto unlock;
 	}
 
-	ret = ov2659_set_pixel_clock(ov2659);
+	ret = pm_runtime_get_sync(&client->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&client->dev);
+		goto unlock;
+	}
+
+	ret = ov2659_init(sd, 0);
+	if (!ret)
+		ret = ov2659_set_pixel_clock(ov2659);
 	if (!ret)
 		ret = ov2659_set_frame_size(ov2659);
 	if (!ret)
@@ -1229,12 +1244,18 @@ static int ov2659_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov2659 *ov2659 =
 			container_of(ctrl->handler, struct ov2659, ctrls);
+	struct i2c_client *client = ov2659->client;
+
+	/* V4L2 controls values will be applied only when power is already up */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
 
 	switch (ctrl->id) {
 	case V4L2_CID_TEST_PATTERN:
 		return ov2659_set_test_pattern(ov2659, ctrl->val);
 	}
 
+	pm_runtime_put(&client->dev);
 	return 0;
 }
 
@@ -1247,6 +1268,39 @@ static const char * const ov2659_test_pattern_menu[] = {
 	"Vertical Color Bars",
 };
 
+static int ov2659_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2659 *ov2659 = to_ov2659(sd);
+
+	dev_dbg(&client->dev, "%s:\n", __func__);
+
+	gpiod_set_value(ov2659->pwdn_gpio, 1);
+
+	return 0;
+}
+
+static int ov2659_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2659 *ov2659 = to_ov2659(sd);
+
+	dev_dbg(&client->dev, "%s:\n", __func__);
+
+	gpiod_set_value(ov2659->pwdn_gpio, 0);
+
+	if (ov2659->resetb_gpio) {
+		gpiod_set_value(ov2659->resetb_gpio, 1);
+		usleep_range(500, 1000);
+		gpiod_set_value(ov2659->resetb_gpio, 0);
+		usleep_range(3000, 5000);
+	}
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 subdev internal operations
  */
@@ -1327,7 +1381,6 @@ static int ov2659_detect(struct v4l2_subdev *sd)
 			ret = -ENODEV;
 		} else {
 			dev_info(&client->dev, "Found OV%04X sensor\n", id);
-			ret = ov2659_init(sd, 0);
 		}
 	}
 
@@ -1404,6 +1457,18 @@ static int ov2659_probe(struct i2c_client *client)
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
@@ -1449,6 +1514,8 @@ static int ov2659_probe(struct i2c_client *client)
 	ov2659->frame_size = &ov2659_framesizes[2];
 	ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
 
+	ov2659_power_on(&client->dev);
+
 	ret = ov2659_detect(sd);
 	if (ret < 0)
 		goto error;
@@ -1462,10 +1529,15 @@ static int ov2659_probe(struct i2c_client *client)
 
 	dev_info(&client->dev, "%s sensor driver registered !!\n", sd->name);
 
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
+
 	return 0;
 
 error:
 	v4l2_ctrl_handler_free(&ov2659->ctrls);
+	ov2659_power_off(&client->dev);
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&ov2659->lock);
 	return ret;
@@ -1481,9 +1553,18 @@ static int ov2659_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&ov2659->lock);
 
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov2659_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+
 	return 0;
 }
 
+static const struct dev_pm_ops ov2659_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov2659_power_off, ov2659_power_on, NULL)
+};
+
 static const struct i2c_device_id ov2659_id[] = {
 	{ "ov2659", 0 },
 	{ /* sentinel */ },
@@ -1501,6 +1582,7 @@ MODULE_DEVICE_TABLE(of, ov2659_of_match);
 static struct i2c_driver ov2659_i2c_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
+		.pm	= &ov2659_pm_ops,
 		.of_match_table = of_match_ptr(ov2659_of_match),
 	},
 	.probe_new	= ov2659_probe,
-- 
2.17.1

