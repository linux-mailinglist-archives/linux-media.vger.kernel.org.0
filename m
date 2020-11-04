Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D7C2A61F0
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbgKDKhy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:37:54 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:44527 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729597AbgKDKhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:37:53 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 09916100015;
        Wed,  4 Nov 2020 10:37:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 23/30] media: ov5647: Support V4L2_CID_HBLANK control
Date:   Wed,  4 Nov 2020 11:36:15 +0100
Message-Id: <20201104103622.595908-24-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104103622.595908-1-jacopo@jmondi.org>
References: <20201104103622.595908-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the V4L2_CID_HBLANK read-only control.

The implementation has been upported from RaspberryPi BSP commit:
commit d82f202156605 ("media: i2c: ov5647: Set V4L2_SUBDEV_FL_HAS_EVENTS flag")

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index b57704e1e15e3..82813f548702e 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -77,6 +77,7 @@ struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
 	u64				pixel_rate;
+	int				hts;
 	const struct regval_list	*reg_list;
 	unsigned int			num_regs;
 };
@@ -99,6 +100,7 @@ struct ov5647 {
 	const struct ov5647_mode	*mode;
 	const struct ov5647_mode	*current_mode;
 	struct v4l2_ctrl		*pixel_rate;
+	struct v4l2_ctrl		*hblank;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -586,6 +588,7 @@ static const struct ov5647_mode ov5647_sbggr8_modes[] = {
 			.height		= 960,
 		},
 		.pixel_rate	= 77291670,
+		.hts		= 1896,
 		.reg_list	= ov5647_640x480_sbggr8,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr8)
 	},
@@ -608,6 +611,7 @@ static const struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.height		= 1944
 		},
 		.pixel_rate	= 87500000,
+		.hts		= 2844,
 		.reg_list	= ov5647_2592x1944_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_sbggr10)
 	},
@@ -627,6 +631,7 @@ static const struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.height		= 1080,
 		},
 		.pixel_rate	= 81666700,
+		.hts		= 2416,
 		.reg_list	= ov5647_1080p30_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_1080p30_sbggr10)
 	},
@@ -646,6 +651,7 @@ static const struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.height		= 1944,
 		},
 		.pixel_rate	= 81666700,
+		.hts		= 1896,
 		.reg_list	= ov5647_2x2binned_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_2x2binned_sbggr10)
 	},
@@ -665,6 +671,7 @@ static const struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.height		= 1920,
 		},
 		.pixel_rate	= 55000000,
+		.hts		= 1852,
 		.reg_list	= ov5647_640x480_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr10)
 	},
@@ -1074,6 +1081,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	struct ov5647 *sensor = to_sensor(sd);
 	const struct ov5647_mode *mode;
 	unsigned int num_modes;
+	int hblank;
 
 	/*
 	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
@@ -1107,6 +1115,9 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	__v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
 				 mode->pixel_rate, 1, mode->pixel_rate);
 
+	hblank = mode->hts - mode->format.width;
+	__v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, 1, hblank);
+
 	*fmt = mode->format;
 	mutex_unlock(&sensor->lock);
 
@@ -1311,6 +1322,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_PIXEL_RATE:
 		/* Read-only, but we adjust it based on mode. */
 		return 0;
+	case V4L2_CID_HBLANK:
+		/* Read-only, but we adjust it based on mode. */
+		return 0;
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1328,8 +1342,9 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	int hblank;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 6);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 7);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1359,6 +1374,15 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 		goto handler_free;
 	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	/* By default, HBLANK is read only, but it does change per mode */
+	hblank = sensor->mode->hts - sensor->mode->format.width;
+	sensor->hblank = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+	if (!sensor->hblank)
+		goto handler_free;
+	sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	if (sensor->ctrls.error)
 		goto handler_free;
 
-- 
2.29.1

