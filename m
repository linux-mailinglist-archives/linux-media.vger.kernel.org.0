Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B1B205760
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732679AbgFWQjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:39:24 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:53293 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732174AbgFWQjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:39:23 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 727E460010;
        Tue, 23 Jun 2020 16:39:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     mrodin@de.adit-jv.com, hugues.fruchet@st.com, mripard@kernel.org,
        aford173@gmail.com, sudipi@jp.adit-jv.com,
        andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 14/25] media: ov5647: Rationalize driver structure name
Date:   Tue, 23 Jun 2020 18:42:23 +0200
Message-Id: <20200623164224.44476-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver structure name is referred to with different names ('ov5647',
'state', 'sensor') in different functions in the driver.

Polish this up by using 'struct ov5647 *sensor' everywhere.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 44 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 8cfe315cfd00b..03f4f1a257ecd 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -98,7 +98,7 @@ struct ov5647 {
 	struct v4l2_ctrl_handler	ctrls;
 };
 
-static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
+static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct ov5647, sd);
 }
@@ -310,7 +310,7 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 static int ov5647_stream_on(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5647 *ov5647 = to_state(sd);
+	struct ov5647 *sensor = to_sensor(sd);
 	u8 val = MIPI_CTRL00_BUS_IDLE;
 	int ret;
 
@@ -325,7 +325,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
-	if (ov5647->clock_ncont)
+	if (sensor->clock_ncont)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
 		       MIPI_CTRL00_LINE_SYNC_ENABLE;
 
@@ -379,17 +379,17 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 	struct ov5647 *ov5647 = to_state(sd);
 	int ret = 0;
 
-	mutex_lock(&ov5647->lock);
+	mutex_lock(&sensor->lock);
 
-	if (on && !ov5647->power_count)	{
+	if (on && !sensor->power_count)	{
 		dev_dbg(&client->dev, "OV5647 power on\n");
 
-		if (ov5647->pwdn) {
-			gpiod_set_value_cansleep(ov5647->pwdn, 0);
+		if (sensor->pwdn) {
+			gpiod_set_value_cansleep(sensor->pwdn, 0);
 			msleep(PWDN_ACTIVE_DELAY_MS);
 		}
 
-		ret = clk_prepare_enable(ov5647->xclk);
+		ret = clk_prepare_enable(sensor->xclk);
 		if (ret < 0) {
 			dev_err(&client->dev, "clk prepare enable failed\n");
 			goto out;
@@ -398,7 +398,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 		ret = ov5647_write_array(sd, sensor_oe_enable_regs,
 					 ARRAY_SIZE(sensor_oe_enable_regs));
 		if (ret < 0) {
-			clk_disable_unprepare(ov5647->xclk);
+			clk_disable_unprepare(sensor->xclk);
 			dev_err(&client->dev,
 				"write sensor_oe_enable_regs error\n");
 			goto out;
@@ -407,12 +407,12 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 		/* Stream off to coax lanes into LP-11 state. */
 		ret = ov5647_stream_off(sd);
 		if (ret < 0) {
-			clk_disable_unprepare(ov5647->xclk);
+			clk_disable_unprepare(sensor->xclk);
 			dev_err(&client->dev,
 				"Camera not available, check Power\n");
 			goto out;
 		}
-	} else if (!on && ov5647->power_count == 1) {
+	} else if (!on && sensor->power_count == 1) {
 		dev_dbg(&client->dev, "OV5647 power off\n");
 
 		ret = ov5647_write_array(sd, sensor_oe_disable_regs,
@@ -424,16 +424,16 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0)
 			dev_dbg(&client->dev, "soft stby failed\n");
 
-		clk_disable_unprepare(ov5647->xclk);
-		gpiod_set_value_cansleep(ov5647->pwdn, 1);
+		clk_disable_unprepare(sensor->xclk);
+		gpiod_set_value_cansleep(sensor->pwdn, 1);
 	}
 
 	/* Update the power count. */
-	ov5647->power_count += on ? 1 : -1;
-	WARN_ON(ov5647->power_count < 0);
+	sensor->power_count += on ? 1 : -1;
+	WARN_ON(sensor->power_count < 0);
 
 out:
-	mutex_unlock(&ov5647->lock);
+	mutex_unlock(&sensor->lock);
 
 	return ret;
 }
@@ -473,7 +473,7 @@ static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
 
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct ov5647 *sensor = to_state(sd);
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
 	mutex_lock(&sensor->lock);
@@ -859,13 +859,13 @@ static int ov5647_probe(struct i2c_client *client)
 static int ov5647_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov5647 *ov5647 = to_state(sd);
+	struct ov5647 *sensor = to_sensor(sd);
 
-	v4l2_async_unregister_subdev(&ov5647->sd);
-	media_entity_cleanup(&ov5647->sd.entity);
-	v4l2_ctrl_handler_free(&ov5647->ctrls);
+	v4l2_async_unregister_subdev(&sensor->sd);
+	media_entity_cleanup(&sensor->sd.entity);
+	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
-	mutex_destroy(&ov5647->lock);
+	mutex_destroy(&sensor->lock);
 
 	return 0;
 }
-- 
2.27.0

