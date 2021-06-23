Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290E73B2014
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 20:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhFWSPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 14:15:25 -0400
Received: from retiisi.eu ([95.216.213.190]:44466 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229882AbhFWSPX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 14:15:23 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id EFA96634C8C;
        Wed, 23 Jun 2021 21:12:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 3/3] ccs: Implement support for manual LP control
Date:   Wed, 23 Jun 2021 21:13:02 +0300
Message-Id: <20210623181302.14660-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
References: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the pre_streamon callback to transition the transmitter to either
LP-11 or LP-111 mode if supported by the sensor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a9403a227c6b..918be5a020f2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1943,6 +1943,49 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 	return rval;
 }
 
+static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	int rval;
+
+	switch (sensor->hwcfg.csi_signalling_mode) {
+	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
+		if (!(CCS_LIM(sensor, PHY_CTRL_CAPABILITY_2) &
+		      CCS_PHY_CTRL_CAPABILITY_2_MANUAL_LP_DPHY))
+			return -EACCES;
+		break;
+	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
+		if (!(CCS_LIM(sensor, PHY_CTRL_CAPABILITY_2) &
+		      CCS_PHY_CTRL_CAPABILITY_2_MANUAL_LP_CPHY))
+			return -EACCES;
+		break;
+	default:
+		return -EACCES;
+	}
+
+	rval = ccs_pm_get_init(sensor);
+	if (rval)
+		return rval;
+
+	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP) {
+		rval = ccs_write(sensor, MANUAL_LP_CTRL,
+				 CCS_MANUAL_LP_CTRL_ENABLE);
+		if (rval)
+			pm_runtime_put(&client->dev);
+	}
+
+	return rval;
+}
+
+static int ccs_post_streamoff(struct v4l2_subdev *subdev)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+
+	return pm_runtime_put(&client->dev);
+}
+
 static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
@@ -3058,6 +3101,8 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
 	.s_stream = ccs_set_stream,
+	.pre_streamon = ccs_pre_streamon,
+	.post_streamoff = ccs_post_streamoff,
 };
 
 static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
-- 
2.30.2

