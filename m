Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEAF2CD432
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbgLCLD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgLCLD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:03:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1EDC061A54
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002Kv-1w; Thu, 03 Dec 2020 12:02:51 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKht-Ub; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:57 +0100
Message-Id: <20201203110106.2939463-10-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203110106.2939463-1-m.tretter@pengutronix.de>
References: <20201203110106.2939463-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 09/18] media: allegro: initialize bitrate using v4l2_ctrl
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the driver now uses the v4l2-ctrls to setup the channel, there is no
need to explicitly set the bitrate. The initial bitrate is now set via
the same path as if it is set from userspace using the v4l2-ctrl.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 859a2c81c782..db504c4a81f6 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -2132,8 +2132,6 @@ static void allegro_set_default_params(struct allegro_channel *channel)
 	channel->level =
 		select_minimum_h264_level(channel->width, channel->height);
 
-	channel->bitrate = maximum_bitrate(channel->level);
-	channel->bitrate_peak = maximum_bitrate(channel->level);
 	channel->cpb_size = maximum_cpb_size(channel->level);
 	channel->gop_size = ALLEGRO_GOP_SIZE_DEFAULT;
 }
@@ -2421,6 +2419,8 @@ static int allegro_open(struct file *file)
 	struct v4l2_ctrl_handler *handler;
 	u64 mask;
 	int ret;
+	unsigned int bitrate_max;
+	unsigned int bitrate_def;
 
 	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
 	if (!channel)
@@ -2486,16 +2486,17 @@ static int allegro_open(struct file *file)
 			V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
 			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
 			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+
+	bitrate_max = maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	bitrate_def = maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
 	channel->mpeg_video_bitrate = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_BITRATE,
-			0, maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
-			1, channel->bitrate);
+			0, bitrate_max, 1, bitrate_def);
 	channel->mpeg_video_bitrate_peak = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
-			0, maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
-			1, channel->bitrate_peak);
+			0, bitrate_max, 1, bitrate_def);
 	channel->mpeg_video_cpb_size = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE,
-- 
2.20.1

