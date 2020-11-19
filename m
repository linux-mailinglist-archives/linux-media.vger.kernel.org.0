Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E612B9813
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgKSQeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:34:01 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44513 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728727AbgKSQeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:34:01 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A16DC40026;
        Thu, 19 Nov 2020 16:33:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 19/30] media: ov5647: Implement set_fmt pad operation
Date:   Thu, 19 Nov 2020 17:32:38 +0100
Message-Id: <20201119163238.783142-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119163238.783142-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119163238.783142-1-jacopo@jmondi.org>
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
index bb570be487175..bb85e9c53c9cc 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1021,13 +1021,71 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
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
+	unsigned int i;
+
+	for (i = 0; i < OV5647_NUM_FORMATS; ++i) {
+		if (ov5647_formats[i].mbus_code != fmt->code)
+			continue;
+
+		ov5647_mode_list = ov5647_formats[i].modes;
+		num_modes = ov5647_formats[i].num_modes;
+		break;
+	}
+
+	/*
+	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one is
+	 * not supported.
+	 */
+	if (i == OV5647_NUM_FORMATS) {
+		ov5647_mode_list = ov5647_10bpp_modes;
+		num_modes = ARRAY_SIZE(ov5647_10bpp_modes);
+	}
+
+	mode = v4l2_find_nearest_size(ov5647_mode_list, num_modes,
+				      format.width, format.height,
+				      fmt->width, fmt->height);
 
-	*fmt = OV5647_DEFAULT_FORMAT;
+	/* Update the sensor mode and apply at it at streamon time. */
+	mutex_lock(&sensor->lock);
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		*v4l2_subdev_get_try_format(sd, cfg, format->pad) = mode->format;
+	else
+		sensor->mode = mode;
+	*fmt = mode->format;
+	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -1072,8 +1130,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
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

