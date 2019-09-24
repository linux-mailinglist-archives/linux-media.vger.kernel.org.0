Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C76BC72A
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440825AbfIXLuL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:50:11 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44495 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395140AbfIXLuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:50:11 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iCjKb-0002f6-Nu; Tue, 24 Sep 2019 13:50:09 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mats Randgaard <matrandg@cisco.com>,
        Steve Longerbeam <slongerbeam@gmail.com>, kernel@pengutronix.de
Subject: [PATCH v4 2/3] media: tc358743: fix connected/active CSI-2 lane reporting
Date:   Tue, 24 Sep 2019 13:49:54 +0200
Message-Id: <20190924114955.13132-3-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924114955.13132-1-p.zabel@pengutronix.de>
References: <20190924114955.13132-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

g_mbus_config was supposed to indicate all supported lane numbers, not
only the number of those currently in active use. Since the TC358743
can dynamically reduce the number of active lanes if the required
bandwidth allows for it, report all lane numbers up to the connected
number of lanes as supported in pdata mode.
In device tree mode, do not report lane count and clock mode at all, as
the receiver driver can determine these from the device tree.

To allow communicating the number of currently active lanes, use the
newly added g_csi_active_lanes() video op.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v3:
 - Use g_csi_active_lanes instead of storing the number of active lanes
   in mbus_config flags.
---
 drivers/media/i2c/tc358743.c | 44 ++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index dbbab75f135e..c2db6419a4b4 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1607,23 +1607,31 @@ static int tc358743_g_mbus_config(struct v4l2_subdev *sd,
 {
 	struct tc358743_state *state = to_state(sd);
 
+	if (state->csi_lanes_in_use > state->bus.num_data_lanes)
+		return -EINVAL;
+
 	cfg->type = V4L2_MBUS_CSI2_DPHY;
+	cfg->flags = 0;
 
-	/* Support for non-continuous CSI-2 clock is missing in the driver */
-	cfg->flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
+	/* In DT mode, there is no need to report the number of data lanes */
+	if (sd->dev->of_node)
+		return 0;
 
-	switch (state->csi_lanes_in_use) {
-	case 1:
-		cfg->flags |= V4L2_MBUS_CSI2_1_LANE;
-		break;
-	case 2:
-		cfg->flags |= V4L2_MBUS_CSI2_2_LANE;
-		break;
+	/* Support for non-continuous CSI-2 clock is missing in pdata mode */
+	cfg->flags |= V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
+
+	switch (state->bus.num_data_lanes) {
+	case 4:
+		cfg->flags |= V4L2_MBUS_CSI2_LANES;
+		/* fallthrough */
 	case 3:
 		cfg->flags |= V4L2_MBUS_CSI2_3_LANE;
-		break;
-	case 4:
-		cfg->flags |= V4L2_MBUS_CSI2_4_LANE;
+		/* fallthrough */
+	case 2:
+		cfg->flags |= V4L2_MBUS_CSI2_2_LANE;
+		/* fallthrough */
+	case 1:
+		cfg->flags |= V4L2_MBUS_CSI2_1_LANE;
 		break;
 	default:
 		return -EINVAL;
@@ -1632,6 +1640,16 @@ static int tc358743_g_mbus_config(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int tc358743_g_csi_active_lanes(struct v4l2_subdev *sd,
+				       u32 *lanes)
+{
+	struct tc358743_state *state = to_state(sd);
+
+	*lanes = state->csi_lanes_in_use;
+
+	return 0;
+}
+
 static int tc358743_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	enable_stream(sd, enable);
@@ -1838,6 +1856,7 @@ static const struct v4l2_subdev_video_ops tc358743_video_ops = {
 	.query_dv_timings = tc358743_query_dv_timings,
 	.g_mbus_config = tc358743_g_mbus_config,
 	.s_stream = tc358743_s_stream,
+	.g_csi_active_lanes = tc358743_g_csi_active_lanes,
 };
 
 static const struct v4l2_subdev_pad_ops tc358743_pad_ops = {
@@ -2052,6 +2071,7 @@ static int tc358743_probe(struct i2c_client *client)
 	if (pdata) {
 		state->pdata = *pdata;
 		state->bus.flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
+		state->bus.num_data_lanes = 4;
 	} else {
 		err = tc358743_probe_of(state);
 		if (err == -ENODEV)
-- 
2.20.1

