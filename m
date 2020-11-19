Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503D02B97AA
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgKSQUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:20:12 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:49673 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727853AbgKSQUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:20:12 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C94121C001C;
        Thu, 19 Nov 2020 16:20:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v4 02/30] media: ov5647: Add support for PWDN GPIO.
Date:   Thu, 19 Nov 2020 17:19:28 +0100
Message-Id: <20201119161956.756455-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119161956.756455-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Add support for an optional GPIO connected to PWDN on the sensor. This
allows the use of hardware standby mode where internal device clock
and circuit activities are halted.

Please note that power is off when PWDN is high.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e7d2e5b4ad4b9..5dde138763eb0 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -21,6 +21,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -35,6 +36,13 @@
 
 #define SENSOR_NAME "ov5647"
 
+/*
+ * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
+ * high if reset is inserted after PWDN goes high, host can access sensor's
+ * SCCB to initialize sensor."
+ */
+#define PWDN_ACTIVE_DELAY_MS	20
+
 #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
@@ -86,6 +94,7 @@ struct ov5647 {
 	unsigned int			height;
 	int				power_count;
 	struct clk			*xclk;
+	struct gpio_desc		*pwdn;
 };
 
 static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
@@ -355,6 +364,11 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 	if (on && !ov5647->power_count)	{
 		dev_dbg(&client->dev, "OV5647 power on\n");
 
+		if (ov5647->pwdn) {
+			gpiod_set_value_cansleep(ov5647->pwdn, 0);
+			msleep(PWDN_ACTIVE_DELAY_MS);
+		}
+
 		ret = clk_prepare_enable(ov5647->xclk);
 		if (ret < 0) {
 			dev_err(&client->dev, "clk prepare enable failed\n");
@@ -392,6 +406,8 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 			dev_dbg(&client->dev, "soft stby failed\n");
 
 		clk_disable_unprepare(ov5647->xclk);
+
+		gpiod_set_value_cansleep(ov5647->pwdn, 1);
 	}
 
 	/* Update the power count. */
@@ -581,6 +597,14 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	/* Request the power down GPIO asserted */
+	sensor->pwdn = devm_gpiod_get_optional(&client->dev, "pwdn",
+					       GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->pwdn)) {
+		dev_err(dev, "Failed to get 'pwdn' gpio\n");
+		return -EINVAL;
+	}
+
 	mutex_init(&sensor->lock);
 
 	sd = &sensor->sd;
@@ -594,7 +618,15 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto mutex_remove;
 
+	if (sensor->pwdn) {
+		gpiod_set_value_cansleep(sensor->pwdn, 0);
+		msleep(PWDN_ACTIVE_DELAY_MS);
+	}
+
 	ret = ov5647_detect(sd);
+
+	gpiod_set_value_cansleep(sensor->pwdn, 1);
+
 	if (ret < 0)
 		goto error;
 
-- 
2.29.1

