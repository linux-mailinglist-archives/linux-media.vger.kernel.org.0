Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1E02A61BE
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgKDKgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:36:49 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42427 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgKDKgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:36:48 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2E2D720003;
        Wed,  4 Nov 2020 10:36:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 03/30] media: ov5647: Add support for non-continuous clock mode
Date:   Wed,  4 Nov 2020 11:35:55 +0100
Message-Id: <20201104103622.595908-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104103622.595908-1-jacopo@jmondi.org>
References: <20201104103622.595908-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Add support for optional non-continuous clock mode to the ov5647
sensor driver.

Non-continuous clock saves a small amount of power and on some SoCs
is easier to interface with.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 5dde138763eb0..ccb56f9b09fd4 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -44,6 +44,7 @@
 #define PWDN_ACTIVE_DELAY_MS	20
 
 #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
+#define MIPI_CTRL00_LINE_SYNC_ENABLE		BIT(4)
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
 
@@ -95,6 +96,7 @@ struct ov5647 {
 	int				power_count;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
+	bool				clock_ncont;
 };
 
 static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
@@ -269,9 +271,15 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 
 static int ov5647_stream_on(struct v4l2_subdev *sd)
 {
+	struct ov5647 *ov5647 = to_state(sd);
+	u8 val = MIPI_CTRL00_BUS_IDLE;
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_BUS_IDLE);
+	if (ov5647->clock_ncont)
+		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
+		       MIPI_CTRL00_LINE_SYNC_ENABLE;
+
+	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
 	if (ret < 0)
 		return ret;
 
@@ -546,9 +554,11 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
 	.open = ov5647_open,
 };
 
-static int ov5647_parse_dt(struct device_node *np)
+static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 {
-	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
 	struct device_node *ep;
 
 	int ret;
@@ -558,7 +568,13 @@ static int ov5647_parse_dt(struct device_node *np)
 		return -EINVAL;
 
 	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
+	if (ret)
+		goto out;
 
+	sensor->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
+			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
+out:
 	of_node_put(ep);
 	return ret;
 }
@@ -577,7 +593,7 @@ static int ov5647_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	if (IS_ENABLED(CONFIG_OF) && np) {
-		ret = ov5647_parse_dt(np);
+		ret = ov5647_parse_dt(sensor, np);
 		if (ret) {
 			dev_err(dev, "DT parsing error: %d\n", ret);
 			return ret;
-- 
2.29.1

