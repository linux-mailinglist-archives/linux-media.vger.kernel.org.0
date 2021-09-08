Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE76403A3A
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbhIHNEc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238371AbhIHNE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:04:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D258C061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxEV-0004sM-EB; Wed, 08 Sep 2021 15:03:19 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxEU-0004St-Op; Wed, 08 Sep 2021 15:03:18 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-00DpGR-Mx; Wed, 08 Sep 2021 15:03:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 6/6] media: allegro: add control to disable encoder buffer
Date:   Wed,  8 Sep 2021 15:03:15 +0200
Message-Id: <20210908130315.3295253-7-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130315.3295253-1-m.tretter@pengutronix.de>
References: <20210908130315.3295253-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The encoder buffer can have a negative impact on the quality of the
encoded video.

Add a control to allow user space to disable the encoder buffer per
channel if the VCU supports the encoder buffer but the quality is not
sufficient.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 32 +++++++++++++++++--
 include/uapi/linux/v4l2-controls.h            |  5 +++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index cb42b6e3d85a..7ec85299d03e 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -105,6 +105,12 @@
 #define BETA_OFFSET_DIV_2		-1
 #define TC_OFFSET_DIV_2			-1
 
+/*
+ * This control allows applications to explicitly disable the encoder buffer.
+ * This value is Allegro specific.
+ */
+#define V4L2_CID_USER_ALLEGRO_ENCODER_BUFFER (V4L2_CID_USER_ALLEGRO_BASE + 0)
+
 static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Debug level (0-2)");
@@ -275,6 +281,8 @@ struct allegro_channel {
 	struct v4l2_ctrl *mpeg_video_cpb_size;
 	struct v4l2_ctrl *mpeg_video_gop_size;
 
+	struct v4l2_ctrl *encoder_buffer;
+
 	/* user_id is used to identify the channel during CREATE_CHANNEL */
 	/* not sure, what to set here and if this is actually required */
 	int user_id;
@@ -1255,7 +1263,7 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->max_transfo_depth_intra = channel->max_transfo_depth_intra;
 	param->max_transfo_depth_inter = channel->max_transfo_depth_inter;
 
-	param->encoder_buffer_enabled = channel->dev->has_encoder_buffer;
+	param->encoder_buffer_enabled = v4l2_ctrl_g_ctrl(channel->encoder_buffer);
 	param->encoder_buffer_offset = 0;
 
 	param->rate_control_mode = channel->frame_rc_enable ?
@@ -1381,7 +1389,7 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 					 u64 src_handle)
 {
 	struct mcu_msg_encode_frame msg;
-	bool use_encoder_buffer = channel->dev->has_encoder_buffer;
+	bool use_encoder_buffer = v4l2_ctrl_g_ctrl(channel->encoder_buffer);
 
 	memset(&msg, 0, sizeof(msg));
 
@@ -2466,6 +2474,8 @@ static void allegro_destroy_channel(struct allegro_channel *channel)
 	v4l2_ctrl_grab(channel->mpeg_video_cpb_size, false);
 	v4l2_ctrl_grab(channel->mpeg_video_gop_size, false);
 
+	v4l2_ctrl_grab(channel->encoder_buffer, false);
+
 	if (channel->user_id != -1) {
 		clear_bit(channel->user_id, &dev->channel_user_ids);
 		channel->user_id = -1;
@@ -2532,6 +2542,8 @@ static int allegro_create_channel(struct allegro_channel *channel)
 	v4l2_ctrl_grab(channel->mpeg_video_cpb_size, true);
 	v4l2_ctrl_grab(channel->mpeg_video_gop_size, true);
 
+	v4l2_ctrl_grab(channel->encoder_buffer, true);
+
 	reinit_completion(&channel->completion);
 	allegro_mcu_send_create_channel(dev, channel);
 	timeout = wait_for_completion_timeout(&channel->completion,
@@ -2915,6 +2927,10 @@ static int allegro_try_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
 		allegro_clamp_bitrate(channel, ctrl);
 		break;
+	case V4L2_CID_USER_ALLEGRO_ENCODER_BUFFER:
+		if (!channel->dev->has_encoder_buffer)
+			ctrl->val = 0;
+		break;
 	}
 
 	return 0;
@@ -2955,6 +2971,16 @@ static const struct v4l2_ctrl_ops allegro_ctrl_ops = {
 	.s_ctrl = allegro_s_ctrl,
 };
 
+static const struct v4l2_ctrl_config allegro_encoder_buffer_ctrl_config = {
+	.id = V4L2_CID_USER_ALLEGRO_ENCODER_BUFFER,
+	.name = "Encoder Buffer Enable",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 1,
+};
+
 static int allegro_open(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -3106,6 +3132,8 @@ static int allegro_open(struct file *file)
 			V4L2_CID_MPEG_VIDEO_GOP_SIZE,
 			0, ALLEGRO_GOP_SIZE_MAX,
 			1, ALLEGRO_GOP_SIZE_DEFAULT);
+	channel->encoder_buffer = v4l2_ctrl_new_custom(handler,
+			&allegro_encoder_buffer_ctrl_config, NULL);
 	v4l2_ctrl_new_std(handler,
 			  &allegro_ctrl_ops,
 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5532b5f68493..8788cbfec28d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -211,6 +211,11 @@ enum v4l2_colorfx {
  * We reserve 128 controls for this driver.
  */
 #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE + 0x10f0)
+/*
+ * The base for Allegro driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_ALLEGRO_BASE		(V4L2_CID_USER_BASE + 0x1170)
 
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
-- 
2.30.2

