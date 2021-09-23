Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8759416381
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 18:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhIWQpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 12:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhIWQpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 12:45:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975BDC061574
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 09:43:41 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mTRox-0007X7-VN; Thu, 23 Sep 2021 18:43:39 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH] media: tc358743: implement pre_streamon to put all lanes into LP-11 state
Date:   Thu, 23 Sep 2021 18:43:32 +0200
Message-Id: <20210923164332.18227-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the connected MIPI CSI-2 RX driver uses the new pre_streamon subdev
call, we don't have to reinitialize the CSI-2 TX after streamoff.
Just put all lanes into LP-11 state during pre_streamon if requested.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/i2c/tc358743.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 3205cd8298dd..40eec67604e0 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -93,6 +93,7 @@ struct tc358743_state {
 	struct v4l2_dv_timings timings;
 	u32 mbus_fmt_code;
 	u8 csi_lanes_in_use;
+	bool pre_streamon_used;
 
 	struct gpio_desc *reset_gpio;
 
@@ -1637,8 +1638,10 @@ static int tc358743_get_mbus_config(struct v4l2_subdev *sd,
 
 static int tc358743_s_stream(struct v4l2_subdev *sd, int enable)
 {
+	struct tc358743_state *state = to_state(sd);
+
 	enable_stream(sd, enable);
-	if (!enable) {
+	if (!enable && !state->pre_streamon_used) {
 		/* Put all lanes in LP-11 state (STOPSTATE) */
 		tc358743_set_csi(sd);
 	}
@@ -1646,6 +1649,19 @@ static int tc358743_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
+static int tc358743_pre_streamon(struct v4l2_subdev *sd, u32 flags)
+{
+	struct tc358743_state *state = to_state(sd);
+
+	/* Put all lanes in LP-11 state (STOPSTATE) if requested */
+	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP)
+		tc358743_set_csi(sd);
+
+	state->pre_streamon_used = true;
+
+	return 0;
+}
+
 /* --------------- PAD OPS --------------- */
 
 static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
@@ -1840,6 +1856,7 @@ static const struct v4l2_subdev_video_ops tc358743_video_ops = {
 	.g_dv_timings = tc358743_g_dv_timings,
 	.query_dv_timings = tc358743_query_dv_timings,
 	.s_stream = tc358743_s_stream,
+	.pre_streamon = tc358743_pre_streamon,
 };
 
 static const struct v4l2_subdev_pad_ops tc358743_pad_ops = {
-- 
2.30.2

