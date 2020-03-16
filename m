Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22FBD186E86
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731702AbgCPP0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:26:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34929 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731776AbgCPP0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:26:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdZ-0000lP-Sv; Mon, 16 Mar 2020 16:26:41 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdY-00055V-RZ; Mon, 16 Mar 2020 16:26:40 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 14/18] media: allegro: handle dependency of bitrate and bitrate_peak
Date:   Mon, 16 Mar 2020 16:26:34 +0100
Message-Id: <20200316152638.19457-15-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316152638.19457-1-m.tretter@pengutronix.de>
References: <20200316152638.19457-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The peak bitrate must not be smaller than the configured bitrate. Update
the other control whenever one of the controls changes to reflect this
dependency.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v1 -> v2:
- Use control cluster
---
 .../staging/media/allegro-dvt/allegro-core.c  | 49 ++++++++++++++++---
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6a492de52987..820fb21ab0f1 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -211,9 +211,11 @@ struct allegro_channel {
 	struct v4l2_ctrl *mpeg_video_h264_p_frame_qp;
 	struct v4l2_ctrl *mpeg_video_h264_b_frame_qp;
 	struct v4l2_ctrl *mpeg_video_frame_rc_enable;
-	struct v4l2_ctrl *mpeg_video_bitrate_mode;
-	struct v4l2_ctrl *mpeg_video_bitrate;
-	struct v4l2_ctrl *mpeg_video_bitrate_peak;
+	struct { /* video bitrate mode control cluster */
+		struct v4l2_ctrl *mpeg_video_bitrate_mode;
+		struct v4l2_ctrl *mpeg_video_bitrate;
+		struct v4l2_ctrl *mpeg_video_bitrate_peak;
+	};
 	struct v4l2_ctrl *mpeg_video_cpb_size;
 	struct v4l2_ctrl *mpeg_video_gop_size;
 
@@ -2404,6 +2406,34 @@ static int allegro_clamp_qp(struct allegro_channel *channel,
 	return allegro_clamp_qp(channel, next_ctrl);
 }
 
+static int allegro_clamp_bitrate(struct allegro_channel *channel,
+				 struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_ctrl *ctrl_bitrate = channel->mpeg_video_bitrate;
+	struct v4l2_ctrl *ctrl_bitrate_peak = channel->mpeg_video_bitrate_peak;
+
+	if (ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR &&
+	    ctrl_bitrate_peak->val < ctrl_bitrate->val)
+		ctrl_bitrate_peak->val = ctrl_bitrate->val;
+
+	return 0;
+}
+
+static int allegro_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct allegro_channel *channel = container_of(ctrl->handler,
+						       struct allegro_channel,
+						       ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		allegro_clamp_bitrate(channel, ctrl);
+		break;
+	}
+
+	return 0;
+}
+
 static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct allegro_channel *channel = container_of(ctrl->handler,
@@ -2421,11 +2451,11 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 		channel->frame_rc_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
-		channel->bitrate = ctrl->val;
-		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
-		channel->bitrate_peak = ctrl->val;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		channel->bitrate = channel->mpeg_video_bitrate->val;
+		channel->bitrate_peak = channel->mpeg_video_bitrate_peak->val;
+		v4l2_ctrl_activate(channel->mpeg_video_bitrate_peak,
+				ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
 		channel->cpb_size = ctrl->val;
@@ -2444,6 +2474,7 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static const struct v4l2_ctrl_ops allegro_ctrl_ops = {
+	.try_ctrl = allegro_try_ctrl,
 	.s_ctrl = allegro_s_ctrl,
 };
 
@@ -2547,6 +2578,8 @@ static int allegro_open(struct file *file)
 
 	channel->fh.ctrl_handler = handler;
 
+	v4l2_ctrl_cluster(3, &channel->mpeg_video_bitrate_mode);
+
 	channel->mcu_channel_id = -1;
 	channel->user_id = -1;
 
-- 
2.20.1

