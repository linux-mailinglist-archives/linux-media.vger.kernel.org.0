Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0631FCCBA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgFQLp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQLp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:45:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD54C061794
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:45:55 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVt-0002Wa-7I; Wed, 17 Jun 2020 13:45:53 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVs-0000rX-Gk; Wed, 17 Jun 2020 13:45:52 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 09/12] media: allegro: set num_ref_idx using response of configured channels
Date:   Wed, 17 Jun 2020 13:45:47 +0200
Message-Id: <20200617114550.3235-10-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200617114550.3235-1-m.tretter@pengutronix.de>
References: <20200617114550.3235-1-m.tretter@pengutronix.de>
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

The firmware decides how many reference frames shall be used und returns
this information via the config blob. In order to set the number of
reference frames in the PPS, the driver has to read these values from
the config blob after the channel has been created in the firmware.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 10 ++++++++--
 drivers/staging/media/allegro-dvt/allegro-mail.c |  6 +++++-
 drivers/staging/media/allegro-dvt/allegro-mail.h |  5 ++++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 44086712e61d..16e5453829e7 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -208,6 +208,9 @@ struct allegro_channel {
 
 	struct allegro_buffer config_blob;
 
+	unsigned int num_ref_idx_l0;
+	unsigned int num_ref_idx_l1;
+
 	struct v4l2_ctrl *mpeg_video_h264_profile;
 	struct v4l2_ctrl *mpeg_video_h264_level;
 	struct v4l2_ctrl *mpeg_video_h264_i_frame_qp;
@@ -1340,8 +1343,8 @@ static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
 	pps->entropy_coding_mode_flag = 0;
 	pps->bottom_field_pic_order_in_frame_present_flag = 0;
 	pps->num_slice_groups_minus1 = 0;
-	pps->num_ref_idx_l0_default_active_minus1 = 2;
-	pps->num_ref_idx_l1_default_active_minus1 = 2;
+	pps->num_ref_idx_l0_default_active_minus1 = channel->num_ref_idx_l0 - 1;
+	pps->num_ref_idx_l1_default_active_minus1 = channel->num_ref_idx_l1 - 1;
 	pps->weighted_pred_flag = 0;
 	pps->weighted_bipred_idc = 0;
 	pps->pic_init_qp_minus26 = 0;
@@ -1643,6 +1646,9 @@ allegro_handle_create_channel(struct allegro_dev *dev,
 	if (err)
 		goto out;
 
+	channel->num_ref_idx_l0 = param.num_ref_idx_l0;
+	channel->num_ref_idx_l1 = param.num_ref_idx_l1;
+
 	v4l2_dbg(1, debug, &dev->v4l2_dev,
 		 "channel %d: intermediate buffers: %d x %d bytes\n",
 		 channel->mcu_channel_id,
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index 746e70d5ad66..a687d533e061 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -172,6 +172,9 @@ ssize_t allegro_decode_config_blob(struct create_channel_param *param,
 				   struct mcu_msg_create_channel_response *msg,
 				   u32 *src)
 {
+	param->num_ref_idx_l0 = msg->num_ref_idx_l0;
+	param->num_ref_idx_l1 = msg->num_ref_idx_l1;
+
 	return 0;
 }
 
@@ -272,7 +275,8 @@ allegro_dec_create_channel(struct mcu_msg_create_channel_response *msg,
 	msg->user_id = src[i++];
 	msg->options = src[i++];
 	msg->num_core = src[i++];
-	msg->pps_param = src[i++];
+	msg->num_ref_idx_l0 = FIELD_GET(GENMASK(7, 4), src[i]);
+	msg->num_ref_idx_l1 = FIELD_GET(GENMASK(11, 8), src[i++]);
 	msg->int_buffers_count = src[i++];
 	msg->int_buffers_size = src[i++];
 	msg->rec_buffers_count = src[i++];
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index 07ed0a8d3de3..a4d829f6f99d 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -55,6 +55,8 @@ struct create_channel_param {
 	u32 log2_max_frame_num;
 	u32 temporal_mvp_enable;
 	u32 dbf_ovr_en;
+	u32 num_ref_idx_l0;
+	u32 num_ref_idx_l1;
 	u32 rdo_cost_mode;
 	u32 lf;
 	u32 lf_x_tile;
@@ -127,7 +129,8 @@ struct mcu_msg_create_channel_response {
 	u32 user_id;
 	u32 options;
 	u32 num_core;
-	u32 pps_param;
+	u32 num_ref_idx_l0;
+	u32 num_ref_idx_l1;
 	u32 int_buffers_count;
 	u32 int_buffers_size;
 	u32 rec_buffers_count;
-- 
2.20.1

