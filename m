Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B988E2057EF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733053AbgFWQwz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:52:55 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37143 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732973AbgFWQwz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:52:55 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1C10A20000A;
        Tue, 23 Jun 2020 16:52:49 +0000 (UTC)
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
Subject: [PATCH 23/25] media: ov5647: Support V4L2_CID_HBLANK control
Date:   Tue, 23 Jun 2020 18:55:48 +0200
Message-Id: <20200623165550.45835-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
index 218576a05e66b..3467a8090b38d 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -77,6 +77,7 @@ struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
 	u64				pixel_rate;
+	int				hts;
 	struct regval_list		*reg_list;
 	unsigned int			num_regs;
 };
@@ -99,6 +100,7 @@ struct ov5647 {
 	struct ov5647_mode		*mode;
 	struct ov5647_mode		*current_mode;
 	struct v4l2_ctrl		*pixel_rate;
+	struct v4l2_ctrl		*hblank;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -586,6 +588,7 @@ static struct ov5647_mode ov5647_sbggr8_modes[] = {
 			.height		= 960,
 		},
 		.pixel_rate	= 77291670,
+		.hts		= 1896,
 		.reg_list	= ov5647_640x480_sbggr8,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr8)
 	},
@@ -608,6 +611,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.height		= 1944
 		},
 		.pixel_rate	= 87500000,
+		.hts		= 2844,
 		.reg_list	= ov5647_2592x1944_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_sbggr10)
 	},
@@ -627,6 +631,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.height		= 1080,
 		},
 		.pixel_rate	= 81666700,
+		.hts		= 2416,
 		.reg_list	= ov5647_1080p30_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_1080p30_sbggr10)
 	},
@@ -646,6 +651,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.height		= 1944,
 		},
 		.pixel_rate	= 81666700,
+		.hts		= 1896,
 		.reg_list	= ov5647_2x2binned_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_2x2binned_sbggr10)
 	},
@@ -665,6 +671,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.height		= 1920,
 		},
 		.pixel_rate	= 55000000,
+		.hts		= 1852,
 		.reg_list	= ov5647_640x480_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr10)
 	},
@@ -1072,6 +1079,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	struct ov5647_mode *ov5647_mode_list;
 	struct ov5647_mode *mode;
 	unsigned int num_modes;
+	int hblank;
 
 	/*
 	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
@@ -1105,6 +1113,9 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	__v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
 				 mode->pixel_rate, 1, mode->pixel_rate);
 
+	hblank = mode->hts - mode->format.width;
+	__v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, 1, hblank);
+
 	*fmt = mode->format;
 	mutex_unlock(&sensor->lock);
 
@@ -1309,6 +1320,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_PIXEL_RATE:
 		/* Read-only, but we adjust it based on mode. */
 		return 0;
+	case V4L2_CID_HBLANK:
+		/* Read-only, but we adjust it based on mode. */
+		return 0;
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1326,8 +1340,9 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	int hblank;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 6);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 7);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1357,6 +1372,15 @@ static int ov5647_init_controls(struct ov5647 *sensor)
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
2.27.0

