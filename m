Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E648D3C149D
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 15:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhGHNri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 09:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhGHNri (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 09:47:38 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8794DC061574
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 06:44:56 -0700 (PDT)
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C53FF634C87;
        Thu,  8 Jul 2021 16:44:14 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 3/3] ccs: Implement support for manual LP control
Date:   Thu,  8 Jul 2021 16:44:53 +0300
Message-Id: <20210708134453.459-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623181302.14660-4-sakari.ailus@linux.intel.com>
References: <20210623181302.14660-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the pre_streamon callback to transition the transmitter to either
LP-11 or LP-111 mode if supported by the sensor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Only check sensor capabilities if manual LP control is requested.

 drivers/media/i2c/ccs/ccs-core.c | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 121cbe406fe4..5363f3bcafe3 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1943,6 +1943,51 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 	return rval;
 }
 
+static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	int rval;
+
+	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP) {
+		switch (sensor->hwcfg.csi_signalling_mode) {
+		case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
+			if (!(CCS_LIM(sensor, PHY_CTRL_CAPABILITY_2) &
+			      CCS_PHY_CTRL_CAPABILITY_2_MANUAL_LP_DPHY))
+				return -EACCES;
+			break;
+		case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
+			if (!(CCS_LIM(sensor, PHY_CTRL_CAPABILITY_2) &
+			      CCS_PHY_CTRL_CAPABILITY_2_MANUAL_LP_CPHY))
+				return -EACCES;
+			break;
+		default:
+			return -EACCES;
+		}
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
@@ -3055,6 +3100,8 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
 	.s_stream = ccs_set_stream,
+	.pre_streamon = ccs_pre_streamon,
+	.post_streamoff = ccs_post_streamoff,
 };
 
 static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
-- 
2.30.2

