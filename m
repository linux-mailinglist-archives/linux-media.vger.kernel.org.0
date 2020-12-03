Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF3E2CD42E
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbgLCLDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728779AbgLCLDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:03:33 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360A1C061A51
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002L1-3Y; Thu, 03 Dec 2020 12:02:51 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNs-00CKiB-1L; Thu, 03 Dec 2020 12:02:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:01:03 +0100
Message-Id: <20201203110106.2939463-16-m.tretter@pengutronix.de>
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
Subject: [PATCH 15/18] media: allegro: rename codec specific functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The maximum bitrate and the size of the CPB are dependent on the level.
As the levels differ between the different codecs, the functions to get
the maximum bitrate and CPB must be codec specific, too.

Rename the functions to make it obvious that the function are only valid
for H.264.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 016c31655467..6a8196735eaf 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -507,7 +507,7 @@ select_minimum_h264_level(unsigned int width, unsigned int height)
 	return level;
 }
 
-static unsigned int maximum_bitrate(enum v4l2_mpeg_video_h264_level level)
+static unsigned int h264_maximum_bitrate(enum v4l2_mpeg_video_h264_level level)
 {
 	switch (level) {
 	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
@@ -546,7 +546,7 @@ static unsigned int maximum_bitrate(enum v4l2_mpeg_video_h264_level level)
 	}
 }
 
-static unsigned int maximum_cpb_size(enum v4l2_mpeg_video_h264_level level)
+static unsigned int h264_maximum_cpb_size(enum v4l2_mpeg_video_h264_level level)
 {
 	switch (level) {
 	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
@@ -2124,7 +2124,7 @@ static void allegro_channel_adjust(struct allegro_channel *channel)
 	v4l2_ctrl_unlock(ctrl);
 
 	ctrl = channel->mpeg_video_bitrate;
-	max = maximum_bitrate(v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level));
+	max = h264_maximum_bitrate(v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level));
 	if (ctrl->maximum < max)
 		v4l2_dbg(1, debug, &dev->v4l2_dev,
 			 "%s: maximum: %lld -> %lld\n",
@@ -2521,10 +2521,10 @@ static int allegro_open(struct file *file)
 			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
 			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
 
-	bitrate_max = maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-	bitrate_def = maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-	cpb_size_max = maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-	cpb_size_def = maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	bitrate_max = h264_maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	bitrate_def = h264_maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	cpb_size_max = h264_maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	cpb_size_def = h264_maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
 	channel->mpeg_video_bitrate = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_BITRATE,
-- 
2.20.1

