Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A962057EA
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732526AbgFWQwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:52:45 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37779 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732292AbgFWQwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:52:44 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8EDC4200002;
        Tue, 23 Jun 2020 16:52:37 +0000 (UTC)
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
Subject: [PATCH 20/25] media: ov5647: Program mode only if it has changed
Date:   Tue, 23 Jun 2020 18:55:45 +0200
Message-Id: <20200623165550.45835-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Store in the driver structure a pointer to the currently applied mode
and program a new one at s_stream(1) time only if it has changed.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 39e320f321bd8..ac114269e1c73 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -96,6 +96,7 @@ struct ov5647 {
 	bool				clock_ncont;
 	struct v4l2_ctrl_handler	ctrls;
 	struct ov5647_mode		*mode;
+	struct ov5647_mode		*current_mode;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -750,9 +751,13 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 static int ov5647_set_mode(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov5647 *sensor = to_sensor(sd);
 	u8 resetval, rdval;
 	int ret;
 
+	if (sensor->mode == sensor->current_mode)
+		return 0;
+
 	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
 	if (ret < 0)
 		return ret;
@@ -778,6 +783,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 			return ret;
 	}
 
+	sensor->current_mode = sensor->mode;
+
 	return 0;
 }
 
@@ -816,6 +823,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 
 static int ov5647_stream_off(struct v4l2_subdev *sd)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
 	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
@@ -827,7 +835,13 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	ret = ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	if (ret < 0)
+		return ret;
+
+	sensor->current_mode = NULL;
+
+	return 0;
 }
 
 static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
-- 
2.27.0

