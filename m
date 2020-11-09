Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237752AC160
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730887AbgKIQu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:50:27 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37227 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730208AbgKIQu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:50:26 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 491741BF20D;
        Mon,  9 Nov 2020 16:50:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v3 18/29] media: ov5647: Implement set_fmt pad operation
Date:   Mon,  9 Nov 2020 17:49:23 +0100
Message-Id: <20201109164934.134919-19-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the driver supports more than a single mode, implement the
.set_fmt pad operation and adjust the existing .get_fmt one to report
the currently applied format.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 66 +++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index c65aacc0e04d3..68eab61d53493 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1019,14 +1019,72 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
+static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_pad_config *cfg,
 			      struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
+	const struct v4l2_mbus_framefmt *sensor_format;
+	struct ov5647 *sensor = to_sensor(sd);
 
 	memset(fmt, 0, sizeof(*fmt));
-	*fmt = OV5647_DEFAULT_FORMAT;
+
+	mutex_lock(&sensor->lock);
+	switch (format->which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		sensor_format = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		break;
+	default:
+		sensor_format = &sensor->mode->format;
+		break;
+	}
+
+	*fmt = *sensor_format;
+	mutex_unlock(&sensor->lock);
+
+	return 0;
+}
+
+static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	const struct ov5647_mode *ov5647_mode_list;
+	struct ov5647 *sensor = to_sensor(sd);
+	const struct ov5647_mode *mode;
+	unsigned int num_modes;
+
+	/*
+	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
+	 * is not supported.
+	 */
+	if (fmt->code == MEDIA_BUS_FMT_SBGGR8_1X8) {
+		ov5647_mode_list = ov5647_8bpp_modes;
+		num_modes = ARRAY_SIZE(ov5647_8bpp_modes);
+	} else {
+		ov5647_mode_list = ov5647_10bpp_modes;
+		num_modes = ARRAY_SIZE(ov5647_10bpp_modes);
+	}
+
+	mode = v4l2_find_nearest_size(ov5647_mode_list, num_modes,
+				      format.width, format.height,
+				      fmt->width, fmt->height);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		mutex_lock(&sensor->lock);
+		*v4l2_subdev_get_try_format(sd, cfg, format->pad) = mode->format;
+		*fmt = mode->format;
+		mutex_unlock(&sensor->lock);
+
+		return 0;
+	}
+
+	/* Update the sensor mode and apply at it at streamon time. */
+	mutex_lock(&sensor->lock);
+	sensor->mode = mode;
+	*fmt = mode->format;
+	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -1071,8 +1129,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
 static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
 	.enum_mbus_code		= ov5647_enum_mbus_code,
 	.enum_frame_size	= ov5647_enum_frame_size,
-	.set_fmt		= ov5647_set_get_fmt,
-	.get_fmt		= ov5647_set_get_fmt,
+	.set_fmt		= ov5647_set_pad_fmt,
+	.get_fmt		= ov5647_get_pad_fmt,
 	.get_selection		= ov5647_get_selection,
 };
 
-- 
2.29.1

