Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE442CD43D
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388850AbgLCLEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388801AbgLCLEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4F1C08E860
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:54 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002Kw-5H; Thu, 03 Dec 2020 12:02:52 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhw-V8; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:58 +0100
Message-Id: <20201203110106.2939463-11-m.tretter@pengutronix.de>
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
Subject: [PATCH 10/18] media: allegro: implement scaling of cpb size in SPS
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cbp_size_value_minus1 in the SPS can scaled using cpb_size_scale to
reduce the number of bits necessary to encode the value. For simplicity,
the scaling was set to 1.

Restructure to the code to make it easier to drop the cbp_size from the
channel and as we are at it, also properly implement the scaling.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index db504c4a81f6..4e5590e8f875 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1279,6 +1279,8 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	/* Calculation of crop units in Rec. ITU-T H.264 (04/2017) p. 76 */
 	unsigned int crop_unit_x = 2;
 	unsigned int crop_unit_y = 2;
+	unsigned int cpb_size;
+	unsigned int cpb_size_scale;
 
 	sps = kzalloc(sizeof(*sps), GFP_KERNEL);
 	if (!sps)
@@ -1336,13 +1338,15 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->vui.vcl_hrd_parameters_present_flag = 1;
 	sps->vui.vcl_hrd_parameters.cpb_cnt_minus1 = 0;
 	sps->vui.vcl_hrd_parameters.bit_rate_scale = 0;
-	sps->vui.vcl_hrd_parameters.cpb_size_scale = 1;
 	/* See Rec. ITU-T H.264 (04/2017) p. 410 E-53 */
 	sps->vui.vcl_hrd_parameters.bit_rate_value_minus1[0] =
 		channel->bitrate_peak / (1 << (6 + sps->vui.vcl_hrd_parameters.bit_rate_scale)) - 1;
 	/* See Rec. ITU-T H.264 (04/2017) p. 410 E-54 */
+	cpb_size = channel->cpb_size;
+	cpb_size_scale = ffs(cpb_size) - 4;
+	sps->vui.vcl_hrd_parameters.cpb_size_scale = cpb_size_scale;
 	sps->vui.vcl_hrd_parameters.cpb_size_value_minus1[0] =
-		(channel->cpb_size * 1000) / (1 << (4 + sps->vui.vcl_hrd_parameters.cpb_size_scale)) - 1;
+		(cpb_size * 1000) / (1 << (4 + cpb_size_scale)) - 1;
 	sps->vui.vcl_hrd_parameters.cbr_flag[0] =
 		!v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
 	sps->vui.vcl_hrd_parameters.initial_cpb_removal_delay_length_minus1 = 31;
-- 
2.20.1

