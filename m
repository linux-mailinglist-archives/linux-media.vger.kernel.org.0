Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1732CD440
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388888AbgLCLEj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388620AbgLCLEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B982FC08ED7E
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:55 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002L3-59; Thu, 03 Dec 2020 12:02:54 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNs-00CKiH-2J; Thu, 03 Dec 2020 12:02:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:01:05 +0100
Message-Id: <20201203110106.2939463-18-m.tretter@pengutronix.de>
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
X-Spam-Status: No, score=-1.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 17/18] media: allegro: activate v4l2-ctrls only for current codec
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These controls are specific to H.264 and shall only be activated, if the
coded format is H.264.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 4eacad3d53cb..5ff4509be13d 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -2105,6 +2105,7 @@ static int allegro_create_channel(struct allegro_channel *channel)
 static void allegro_channel_adjust(struct allegro_channel *channel)
 {
 	struct allegro_dev *dev = channel->dev;
+	u32 codec = channel->codec;
 	struct v4l2_ctrl *ctrl;
 	s64 min;
 	s64 max;
@@ -2140,6 +2141,21 @@ static void allegro_channel_adjust(struct allegro_channel *channel)
 				 ctrl->step, ctrl->default_value);
 	v4l2_ctrl_unlock(ctrl);
 
+	v4l2_ctrl_activate(channel->mpeg_video_h264_profile,
+			   codec == V4L2_PIX_FMT_H264);
+	v4l2_ctrl_activate(channel->mpeg_video_h264_level,
+			   codec == V4L2_PIX_FMT_H264);
+	v4l2_ctrl_activate(channel->mpeg_video_h264_i_frame_qp,
+			   codec == V4L2_PIX_FMT_H264);
+	v4l2_ctrl_activate(channel->mpeg_video_h264_max_qp,
+			   codec == V4L2_PIX_FMT_H264);
+	v4l2_ctrl_activate(channel->mpeg_video_h264_min_qp,
+			   codec == V4L2_PIX_FMT_H264);
+	v4l2_ctrl_activate(channel->mpeg_video_h264_p_frame_qp,
+			   codec == V4L2_PIX_FMT_H264);
+	v4l2_ctrl_activate(channel->mpeg_video_h264_b_frame_qp,
+			   codec == V4L2_PIX_FMT_H264);
+
 	channel->log2_max_frame_num = LOG2_MAX_FRAME_NUM;
 	channel->temporal_mvp_enable = true;
 
-- 
2.20.1

