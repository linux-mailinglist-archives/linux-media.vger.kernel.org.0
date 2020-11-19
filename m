Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748AF2B9824
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgKSQga (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:36:30 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:32977 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgKSQga (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:36:30 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3E2FA2400F9;
        Thu, 19 Nov 2020 16:36:26 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 22/30] media: ov5647: Support V4L2_CID_HBLANK control
Date:   Thu, 19 Nov 2020 17:35:42 +0100
Message-Id: <20201119163549.793282-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119163549.793282-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119163549.793282-1-jacopo@jmondi.org>
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
 drivers/media/i2c/ov5647.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 86612f941e891..2ffca9f658bfa 100644
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
@@ -1090,9 +1097,15 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_get_try_format(sd, cfg, format->pad) = mode->format;
 	} else {
+		int hblank;
+
 		sensor->mode = mode;
 		__v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
 					 mode->pixel_rate, 1, mode->pixel_rate);
+
+		hblank = mode->hts - mode->format.width;
+		__v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, 1,
+					 hblank);
 	}
 	*fmt = mode->format;
 	mutex_unlock(&sensor->lock);
@@ -1301,6 +1314,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_PIXEL_RATE:
 		/* Read-only, but we adjust it based on mode. */
 		return 0;
+	case V4L2_CID_HBLANK:
+		/* Read-only, but we adjust it based on mode. */
+		return 0;
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1318,8 +1334,9 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	int hblank;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 6);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 7);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1345,10 +1362,18 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 					       sensor->mode->pixel_rate,
 					       sensor->mode->pixel_rate, 1,
 					       sensor->mode->pixel_rate);
+
+	/* By default, HBLANK is read only, but it does change per mode. */
+	hblank = sensor->mode->hts - sensor->mode->format.width;
+	sensor->hblank = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+
 	if (sensor->ctrls.error)
 		goto handler_free;
 
 	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->sd.ctrl_handler = &sensor->ctrls;
 
 	return 0;
-- 
2.29.1

