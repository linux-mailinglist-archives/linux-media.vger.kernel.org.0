Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A3D2AC169
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730689AbgKIQwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:52:46 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54781 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730608AbgKIQwq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:52:46 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7C3F42000C;
        Mon,  9 Nov 2020 16:52:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v3 21/29] media: ov5647: Support V4L2_CID_HBLANK control
Date:   Mon,  9 Nov 2020 17:49:26 +0100
Message-Id: <20201109164934.134919-22-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
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
index 01978491b97f4..0c46a8605835c 100644
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
@@ -98,6 +99,7 @@ struct ov5647 {
 	struct v4l2_ctrl_handler	ctrls;
 	const struct ov5647_mode	*mode;
 	struct v4l2_ctrl		*pixel_rate;
+	struct v4l2_ctrl		*hblank;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -585,6 +587,7 @@ static const struct ov5647_mode ov5647_8bpp_modes[] = {
 			.height		= 960,
 		},
 		.pixel_rate	= 77291670,
+		.hts		= 1896,
 		.reg_list	= ov5647_640x480_8bpp,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_8bpp)
 	},
@@ -607,6 +610,7 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
 			.height		= 1944
 		},
 		.pixel_rate	= 87500000,
+		.hts		= 2844,
 		.reg_list	= ov5647_2592x1944_10bpp,
 		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_10bpp)
 	},
@@ -626,6 +630,7 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
 			.height		= 1080,
 		},
 		.pixel_rate	= 81666700,
+		.hts		= 2416,
 		.reg_list	= ov5647_1080p30_10bpp,
 		.num_regs	= ARRAY_SIZE(ov5647_1080p30_10bpp)
 	},
@@ -645,6 +650,7 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
 			.height		= 1944,
 		},
 		.pixel_rate	= 81666700,
+		.hts		= 1896,
 		.reg_list	= ov5647_2x2binned_10bpp,
 		.num_regs	= ARRAY_SIZE(ov5647_2x2binned_10bpp)
 	},
@@ -664,6 +670,7 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
 			.height		= 1920,
 		},
 		.pixel_rate	= 55000000,
+		.hts		= 1852,
 		.reg_list	= ov5647_640x480_10bpp,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_10bpp)
 	},
@@ -1061,6 +1068,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	struct ov5647 *sensor = to_sensor(sd);
 	const struct ov5647_mode *mode;
 	unsigned int num_modes;
+	int hblank;
 
 	/*
 	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
@@ -1094,6 +1102,9 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	__v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
 				 mode->pixel_rate, 1, mode->pixel_rate);
 
+	hblank = mode->hts - mode->format.width;
+	__v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, 1, hblank);
+
 	*fmt = mode->format;
 	mutex_unlock(&sensor->lock);
 
@@ -1299,6 +1310,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_PIXEL_RATE:
 		/* Read-only, but we adjust it based on mode. */
 		return 0;
+	case V4L2_CID_HBLANK:
+		/* Read-only, but we adjust it based on mode. */
+		return 0;
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1316,8 +1330,9 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	int hblank;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 6);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 7);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1347,6 +1362,15 @@ static int ov5647_init_controls(struct ov5647 *sensor)
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

