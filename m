Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4552CD437
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388786AbgLCLEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387738AbgLCLEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBEDC061A55
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002Kz-3E; Thu, 03 Dec 2020 12:02:51 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNs-00CKi5-0T; Thu, 03 Dec 2020 12:02:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:01:01 +0100
Message-Id: <20201203110106.2939463-14-m.tretter@pengutronix.de>
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
Subject: [PATCH 13/18] media: allegro: use accessor functions for QP values
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 specifies different controls for the QP values of different codecs.

Simplify users that just care for the QP values by providing accessor
function that return the correct control based on the currently set
codec.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 40 ++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index c0519f7a67b8..004df6ea2430 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -264,6 +264,36 @@ struct allegro_channel {
 	unsigned int error;
 };
 
+static inline int
+allegro_channel_get_i_frame_qp(struct allegro_channel *channel)
+{
+	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_i_frame_qp);
+}
+
+static inline int
+allegro_channel_get_p_frame_qp(struct allegro_channel *channel)
+{
+	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_p_frame_qp);
+}
+
+static inline int
+allegro_channel_get_b_frame_qp(struct allegro_channel *channel)
+{
+	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_b_frame_qp);
+}
+
+static inline int
+allegro_channel_get_min_qp(struct allegro_channel *channel)
+{
+	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_min_qp);
+}
+
+static inline int
+allegro_channel_get_max_qp(struct allegro_channel *channel)
+{
+	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_max_qp);
+}
+
 struct allegro_m2m_buffer {
 	struct v4l2_m2m_buffer buf;
 	struct list_head head;
@@ -917,9 +947,9 @@ static s16 get_qp_delta(int minuend, int subtrahend)
 static int fill_create_channel_param(struct allegro_channel *channel,
 				     struct create_channel_param *param)
 {
-	int i_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_i_frame_qp);
-	int p_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_p_frame_qp);
-	int b_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_b_frame_qp);
+	int i_frame_qp = allegro_channel_get_i_frame_qp(channel);
+	int p_frame_qp = allegro_channel_get_p_frame_qp(channel);
+	int b_frame_qp = allegro_channel_get_b_frame_qp(channel);
 	int bitrate_mode = v4l2_ctrl_g_ctrl(channel->mpeg_video_bitrate_mode);
 	unsigned int cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size);
 	enum v4l2_mpeg_video_h264_profile profile;
@@ -982,8 +1012,8 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->target_bitrate = channel->bitrate;
 	param->max_bitrate = channel->bitrate_peak;
 	param->initial_qp = i_frame_qp;
-	param->min_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_min_qp);
-	param->max_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_max_qp);
+	param->min_qp = allegro_channel_get_min_qp(channel);
+	param->max_qp = allegro_channel_get_max_qp(channel);
 	param->ip_delta = get_qp_delta(i_frame_qp, p_frame_qp);
 	param->pb_delta = get_qp_delta(p_frame_qp, b_frame_qp);
 	param->golden_ref = 0;
-- 
2.20.1

