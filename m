Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB2B1615D3
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgBQPOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:04 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34273 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbgBQPOE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:04 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005WG-BM; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001af-CW; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 13/18] media: allegro: read bitrate mode directly from control
Date:   Mon, 17 Feb 2020 16:13:53 +0100
Message-Id: <20200217151358.5695-14-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200217151358.5695-1-m.tretter@pengutronix.de>
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
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

There is no need to copy the bitrate mode to a field in the channel and
the value can be read directly from the control.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index c25f76fffa5e..8c26158eab93 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -197,7 +197,6 @@ struct allegro_channel {
 	unsigned int sizeimage_encoded;
 	unsigned int csequence;
 
-	enum v4l2_mpeg_video_bitrate_mode bitrate_mode;
 	bool frame_rc_enable;
 	unsigned int bitrate;
 	unsigned int bitrate_peak;
@@ -1137,7 +1136,7 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 
 	if (channel->frame_rc_enable)
 		msg.rate_control_mode =
-			v4l2_bitrate_mode_to_mcu_mode(channel->bitrate_mode);
+			v4l2_bitrate_mode_to_mcu_mode(v4l2_ctrl_g_ctrl(channel->mpeg_video_bitrate_mode));
 	else
 		msg.rate_control_mode = 0;
 
@@ -2206,7 +2205,6 @@ static void allegro_set_default_params(struct allegro_channel *channel)
 	channel->sizeimage_encoded =
 		estimate_stream_size(channel->width, channel->height);
 
-	channel->bitrate_mode = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR;
 	channel->bitrate = maximum_bitrate(channel->level);
 	channel->bitrate_peak = maximum_bitrate(channel->level);
 	channel->cpb_size = maximum_cpb_size(channel->level);
@@ -2403,9 +2401,6 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 		channel->frame_rc_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
-		channel->bitrate_mode = ctrl->val;
-		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE:
 		channel->bitrate = ctrl->val;
 		break;
@@ -2496,7 +2491,7 @@ static int allegro_open(struct file *file)
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
 			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
-			channel->bitrate_mode);
+			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
 	channel->mpeg_video_bitrate = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_BITRATE,
-- 
2.20.1

