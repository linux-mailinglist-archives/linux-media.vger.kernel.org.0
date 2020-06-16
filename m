Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187171FB3BB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 16:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729403AbgFPOJi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 10:09:38 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:50419 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgFPOJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 10:09:38 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C891EE0008;
        Tue, 16 Jun 2020 14:09:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 02/10] media: i2c: Use the new get_mbus_config pad op
Date:   Tue, 16 Jun 2020 16:12:37 +0200
Message-Id: <20200616141244.49407-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
References: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the existing users of the g_mbus_config video operation to use the
newly introduced get_mbus_config pad operations.

All the ported drivers report a static media bus configuration and do no
support s_mbus_config so the operation implementation has not changed.

Bridge drivers needs to call the new pad operation and will receive an
-ENOICTLCMD when calling the old g_mbus_config video operation

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv7180.c   | 7 ++++---
 drivers/media/i2c/ml86v7667.c | 7 ++++---
 drivers/media/i2c/mt9m001.c   | 7 ++++---
 drivers/media/i2c/mt9m111.c   | 7 ++++---
 drivers/media/i2c/ov9640.c    | 7 ++++---
 drivers/media/i2c/tc358743.c  | 7 ++++---
 drivers/media/i2c/tvp5150.c   | 7 ++++---
 7 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 00159daa6fcd..e8744efe3cf0 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -760,8 +760,9 @@ static int adv7180_init_cfg(struct v4l2_subdev *sd,
 	return adv7180_set_pad_format(sd, cfg, &fmt);
 }
 
-static int adv7180_g_mbus_config(struct v4l2_subdev *sd,
-				 struct v4l2_mbus_config *cfg)
+static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
+				   unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
 {
 	struct adv7180_state *state = to_state(sd);
 
@@ -852,7 +853,6 @@ static const struct v4l2_subdev_video_ops adv7180_video_ops = {
 	.querystd = adv7180_querystd,
 	.g_input_status = adv7180_g_input_status,
 	.s_routing = adv7180_s_routing,
-	.g_mbus_config = adv7180_g_mbus_config,
 	.g_pixelaspect = adv7180_g_pixelaspect,
 	.g_tvnorms = adv7180_g_tvnorms,
 	.s_stream = adv7180_s_stream,
@@ -869,6 +869,7 @@ static const struct v4l2_subdev_pad_ops adv7180_pad_ops = {
 	.enum_mbus_code = adv7180_enum_mbus_code,
 	.set_fmt = adv7180_set_pad_format,
 	.get_fmt = adv7180_get_pad_format,
+	.get_mbus_config = adv7180_get_mbus_config,
 };
 
 static const struct v4l2_subdev_sensor_ops adv7180_sensor_ops = {
diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
index c444bd6a0658..ff212335326a 100644
--- a/drivers/media/i2c/ml86v7667.c
+++ b/drivers/media/i2c/ml86v7667.c
@@ -219,8 +219,9 @@ static int ml86v7667_fill_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ml86v7667_g_mbus_config(struct v4l2_subdev *sd,
-				   struct v4l2_mbus_config *cfg)
+static int ml86v7667_get_mbus_config(struct v4l2_subdev *sd,
+				     unsigned int pad,
+				     struct v4l2_mbus_config *cfg)
 {
 	cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_PCLK_SAMPLE_RISING |
 		     V4L2_MBUS_DATA_ACTIVE_HIGH;
@@ -291,13 +292,13 @@ static const struct v4l2_subdev_video_ops ml86v7667_subdev_video_ops = {
 	.s_std = ml86v7667_s_std,
 	.querystd = ml86v7667_querystd,
 	.g_input_status = ml86v7667_g_input_status,
-	.g_mbus_config = ml86v7667_g_mbus_config,
 };
 
 static const struct v4l2_subdev_pad_ops ml86v7667_subdev_pad_ops = {
 	.enum_mbus_code = ml86v7667_enum_mbus_code,
 	.get_fmt = ml86v7667_fill_fmt,
 	.set_fmt = ml86v7667_fill_fmt,
+	.get_mbus_config = ml86v7667_get_mbus_config,
 };
 
 static const struct v4l2_subdev_core_ops ml86v7667_subdev_core_ops = {
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 210ea76adb53..3b0ba8ed5233 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -689,8 +689,9 @@ static int mt9m001_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mt9m001_g_mbus_config(struct v4l2_subdev *sd,
-				struct v4l2_mbus_config *cfg)
+static int mt9m001_get_mbus_config(struct v4l2_subdev *sd,
+				   unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
 {
 	/* MT9M001 has all capture_format parameters fixed */
 	cfg->flags = V4L2_MBUS_PCLK_SAMPLE_FALLING |
@@ -703,7 +704,6 @@ static int mt9m001_g_mbus_config(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops mt9m001_subdev_video_ops = {
 	.s_stream	= mt9m001_s_stream,
-	.g_mbus_config	= mt9m001_g_mbus_config,
 };
 
 static const struct v4l2_subdev_sensor_ops mt9m001_subdev_sensor_ops = {
@@ -717,6 +717,7 @@ static const struct v4l2_subdev_pad_ops mt9m001_subdev_pad_ops = {
 	.set_selection	= mt9m001_set_selection,
 	.get_fmt	= mt9m001_get_fmt,
 	.set_fmt	= mt9m001_set_fmt,
+	.get_mbus_config = mt9m001_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops mt9m001_subdev_ops = {
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 17e8253f5748..69697386ffcd 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1137,8 +1137,9 @@ static int mt9m111_init_cfg(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mt9m111_g_mbus_config(struct v4l2_subdev *sd,
-				struct v4l2_mbus_config *cfg)
+static int mt9m111_get_mbus_config(struct v4l2_subdev *sd,
+				   unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
 {
 	struct mt9m111 *mt9m111 = container_of(sd, struct mt9m111, subdev);
 
@@ -1155,7 +1156,6 @@ static int mt9m111_g_mbus_config(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops mt9m111_subdev_video_ops = {
-	.g_mbus_config	= mt9m111_g_mbus_config,
 	.s_stream	= mt9m111_s_stream,
 	.g_frame_interval = mt9m111_g_frame_interval,
 	.s_frame_interval = mt9m111_s_frame_interval,
@@ -1168,6 +1168,7 @@ static const struct v4l2_subdev_pad_ops mt9m111_subdev_pad_ops = {
 	.set_selection	= mt9m111_set_selection,
 	.get_fmt	= mt9m111_get_fmt,
 	.set_fmt	= mt9m111_set_fmt,
+	.get_mbus_config = mt9m111_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops mt9m111_subdev_ops = {
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index 482609665305..0ef5af026d09 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -648,8 +648,9 @@ static const struct v4l2_subdev_core_ops ov9640_core_ops = {
 };
 
 /* Request bus settings on camera side */
-static int ov9640_g_mbus_config(struct v4l2_subdev *sd,
-				struct v4l2_mbus_config *cfg)
+static int ov9640_get_mbus_config(struct v4l2_subdev *sd,
+				  unsigned int pad,
+				  struct v4l2_mbus_config *cfg)
 {
 	cfg->flags = V4L2_MBUS_PCLK_SAMPLE_RISING | V4L2_MBUS_MASTER |
 		V4L2_MBUS_VSYNC_ACTIVE_HIGH | V4L2_MBUS_HSYNC_ACTIVE_HIGH |
@@ -661,13 +662,13 @@ static int ov9640_g_mbus_config(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops ov9640_video_ops = {
 	.s_stream	= ov9640_s_stream,
-	.g_mbus_config	= ov9640_g_mbus_config,
 };
 
 static const struct v4l2_subdev_pad_ops ov9640_pad_ops = {
 	.enum_mbus_code = ov9640_enum_mbus_code,
 	.get_selection	= ov9640_get_selection,
 	.set_fmt	= ov9640_set_fmt,
+	.get_mbus_config = ov9640_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops ov9640_subdev_ops = {
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index dbbab75f135e..a03dcab5ce61 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1602,8 +1602,9 @@ static int tc358743_dv_timings_cap(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int tc358743_g_mbus_config(struct v4l2_subdev *sd,
-			     struct v4l2_mbus_config *cfg)
+static int tc358743_get_mbus_config(struct v4l2_subdev *sd,
+				    unsigned int pad,
+				    struct v4l2_mbus_config *cfg)
 {
 	struct tc358743_state *state = to_state(sd);
 
@@ -1836,7 +1837,6 @@ static const struct v4l2_subdev_video_ops tc358743_video_ops = {
 	.s_dv_timings = tc358743_s_dv_timings,
 	.g_dv_timings = tc358743_g_dv_timings,
 	.query_dv_timings = tc358743_query_dv_timings,
-	.g_mbus_config = tc358743_g_mbus_config,
 	.s_stream = tc358743_s_stream,
 };
 
@@ -1848,6 +1848,7 @@ static const struct v4l2_subdev_pad_ops tc358743_pad_ops = {
 	.set_edid = tc358743_s_edid,
 	.enum_dv_timings = tc358743_enum_dv_timings,
 	.dv_timings_cap = tc358743_dv_timings_cap,
+	.get_mbus_config = tc358743_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops tc358743_ops = {
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index eb39cf5ea089..53b344a64983 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1191,8 +1191,9 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
-static int tvp5150_g_mbus_config(struct v4l2_subdev *sd,
-				 struct v4l2_mbus_config *cfg)
+static int tvp5150_get_mbus_config(struct v4l2_subdev *sd,
+				   unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
 
@@ -1719,7 +1720,6 @@ static const struct v4l2_subdev_video_ops tvp5150_video_ops = {
 	.querystd = tvp5150_querystd,
 	.s_stream = tvp5150_s_stream,
 	.s_routing = tvp5150_s_routing,
-	.g_mbus_config = tvp5150_g_mbus_config,
 };
 
 static const struct v4l2_subdev_vbi_ops tvp5150_vbi_ops = {
@@ -1737,6 +1737,7 @@ static const struct v4l2_subdev_pad_ops tvp5150_pad_ops = {
 	.get_fmt = tvp5150_fill_fmt,
 	.get_selection = tvp5150_get_selection,
 	.set_selection = tvp5150_set_selection,
+	.get_mbus_config = tvp5150_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops tvp5150_ops = {
-- 
2.27.0

