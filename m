Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8412B97B3
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgKSQU2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:20:28 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60399 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728265AbgKSQU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:20:28 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1AACF1C0012;
        Thu, 19 Nov 2020 16:20:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v4 09/30] media: ov5647: Program mode at s_stream(1) time
Date:   Thu, 19 Nov 2020 17:19:35 +0100
Message-Id: <20201119161956.756455-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119161956.756455-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename __sensor_init() function to ov5647_set_mode() as the function
is a regular one and the double underscores prefix shall be removed, and
then move it to program the mode at s_stream(1) time, not at sensor power
up.

Break out from __sensor_init() the stream_off() operation call at sensor
power up to coax the lanes in LP-11 state.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 81 +++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 79ac8c76baeac..ad3397881c9a5 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -265,12 +265,54 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 			    channel_id | (channel << 6));
 }
 
+static int ov5647_set_mode(struct v4l2_subdev *sd)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	u8 resetval, rdval;
+	int ret;
+
+	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
+	if (ret < 0)
+		return ret;
+
+	ret = ov5647_write_array(sd, ov5647_640x480,
+				 ARRAY_SIZE(ov5647_640x480));
+	if (ret < 0) {
+		dev_err(&client->dev, "write sensor default regs error\n");
+		return ret;
+	}
+
+	ret = ov5647_set_virtual_channel(sd, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
+	if (ret < 0)
+		return ret;
+
+	if (!(resetval & 0x01)) {
+		dev_err(&client->dev, "Device was in SW standby");
+		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int ov5647_stream_on(struct v4l2_subdev *sd)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *ov5647 = to_state(sd);
 	u8 val = MIPI_CTRL00_BUS_IDLE;
 	int ret;
 
+	ret = ov5647_set_mode(sd);
+	if (ret) {
+		dev_err(&client->dev, "Failed to program sensor mode: %d\n", ret);
+		return ret;
+	}
+
 	if (ov5647->clock_ncont)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
 		       MIPI_CTRL00_LINE_SYNC_ENABLE;
@@ -320,42 +362,6 @@ static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
 	return ov5647_write(sd, OV5647_SW_STANDBY, rdval);
 }
 
-static int __sensor_init(struct v4l2_subdev *sd)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 resetval, rdval;
-	int ret;
-
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
-	if (ret < 0)
-		return ret;
-
-	ret = ov5647_write_array(sd, ov5647_640x480,
-				 ARRAY_SIZE(ov5647_640x480));
-	if (ret < 0) {
-		dev_err(&client->dev, "write sensor default regs error\n");
-		return ret;
-	}
-
-	ret = ov5647_set_virtual_channel(sd, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
-	if (ret < 0)
-		return ret;
-
-	if (!(resetval & 0x01)) {
-		dev_err(&client->dev, "Device was in SW standby");
-		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
-		if (ret < 0)
-			return ret;
-	}
-
-	/* Stream off to make the clock lane into LP-11 state. */
-	return ov5647_stream_off(sd);
-}
-
 static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -387,7 +393,8 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 			goto out;
 		}
 
-		ret = __sensor_init(sd);
+		/* Stream off to coax lanes into LP-11 state. */
+		ret = ov5647_stream_off(sd);
 		if (ret < 0) {
 			clk_disable_unprepare(ov5647->xclk);
 			dev_err(&client->dev,
-- 
2.29.1

