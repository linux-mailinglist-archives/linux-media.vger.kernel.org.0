Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC832CBE5C
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgLBNcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbgLBNcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 08:32:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469B9C061A47
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 05:30:54 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkSDb-0000LM-5o; Wed, 02 Dec 2020 14:30:52 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkSDa-008CeZ-Ah; Wed, 02 Dec 2020 14:30:50 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org,
        hverkuil-cisco@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Wed,  2 Dec 2020 14:30:39 +0100
Message-Id: <20201202133040.1954837-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201202133040.1954837-1-m.tretter@pengutronix.de>
References: <20201202133040.1954837-1-m.tretter@pengutronix.de>
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
Subject: [PATCH v2 3/4] media: allegro: remove custom drain state handling
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2-m2m has various helpers for correctly handle the draining. Drop
the driver specific state machine and use the m2m helper functions.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2: none
---
 .../media/platform/allegro-dvt/allegro-core.c | 174 +++++-------------
 1 file changed, 45 insertions(+), 129 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 9f718f43282b..902b8af90ac6 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -167,13 +167,6 @@ static struct regmap_config allegro_sram_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-enum allegro_state {
-	ALLEGRO_STATE_ENCODING,
-	ALLEGRO_STATE_DRAIN,
-	ALLEGRO_STATE_WAIT_FOR_BUFFER,
-	ALLEGRO_STATE_STOPPED,
-};
-
 #define fh_to_channel(__fh) container_of(__fh, struct allegro_channel, fh)
 
 struct allegro_channel {
@@ -246,23 +239,8 @@ struct allegro_channel {
 	struct completion completion;
 
 	unsigned int error;
-	enum allegro_state state;
 };
 
-static inline int
-allegro_set_state(struct allegro_channel *channel, enum allegro_state state)
-{
-	channel->state = state;
-
-	return 0;
-}
-
-static inline enum allegro_state
-allegro_get_state(struct allegro_channel *channel)
-{
-	return channel->state;
-}
-
 struct allegro_m2m_buffer {
 	struct v4l2_m2m_buffer buf;
 	struct list_head head;
@@ -1392,45 +1370,13 @@ static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
 	return size;
 }
 
-static bool allegro_channel_is_at_eos(struct allegro_channel *channel)
-{
-	bool is_at_eos = false;
-
-	switch (allegro_get_state(channel)) {
-	case ALLEGRO_STATE_STOPPED:
-		is_at_eos = true;
-		break;
-	case ALLEGRO_STATE_DRAIN:
-	case ALLEGRO_STATE_WAIT_FOR_BUFFER:
-		mutex_lock(&channel->shadow_list_lock);
-		if (v4l2_m2m_num_src_bufs_ready(channel->fh.m2m_ctx) == 0 &&
-		    list_empty(&channel->source_shadow_list))
-			is_at_eos = true;
-		mutex_unlock(&channel->shadow_list_lock);
-		break;
-	default:
-		break;
-	}
-
-	return is_at_eos;
-}
-
-static void allegro_channel_buf_done(struct allegro_channel *channel,
-				     struct vb2_v4l2_buffer *buf,
-				     enum vb2_buffer_state state)
+static void allegro_channel_eos_event(struct allegro_channel *channel)
 {
 	const struct v4l2_event eos_event = {
 		.type = V4L2_EVENT_EOS
 	};
 
-	if (allegro_channel_is_at_eos(channel)) {
-		buf->flags |= V4L2_BUF_FLAG_LAST;
-		v4l2_event_queue_fh(&channel->fh, &eos_event);
-
-		allegro_set_state(channel, ALLEGRO_STATE_STOPPED);
-	}
-
-	v4l2_m2m_buf_done(buf, state);
+	v4l2_event_queue_fh(&channel->fh, &eos_event);
 }
 
 static u64 allegro_put_buffer(struct allegro_channel *channel,
@@ -1500,6 +1446,12 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 	if (!src_buf || !dst_buf)
 		goto err;
 
+	if (v4l2_m2m_is_last_draining_src_buf(channel->fh.m2m_ctx, src_buf)) {
+		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+		allegro_channel_eos_event(channel);
+		v4l2_m2m_mark_stopped(channel->fh.m2m_ctx);
+	}
+
 	dst_buf->sequence = channel->csequence++;
 
 	if (msg->error_code & AL_ERROR) {
@@ -1626,7 +1578,7 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
 
 	if (dst_buf)
-		allegro_channel_buf_done(channel, dst_buf, state);
+		v4l2_m2m_buf_done(dst_buf, state);
 }
 
 static int allegro_handle_init(struct allegro_dev *dev,
@@ -2145,10 +2097,6 @@ static int allegro_buf_prepare(struct vb2_buffer *vb)
 	struct allegro_channel *channel = vb2_get_drv_priv(vb->vb2_queue);
 	struct allegro_dev *dev = channel->dev;
 
-	if (allegro_get_state(channel) == ALLEGRO_STATE_DRAIN &&
-	    V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
-		return -EBUSY;
-
 	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		if (vbuf->field == V4L2_FIELD_ANY)
 			vbuf->field = V4L2_FIELD_NONE;
@@ -2167,10 +2115,21 @@ static void allegro_buf_queue(struct vb2_buffer *vb)
 {
 	struct allegro_channel *channel = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_queue *q = vb->vb2_queue;
+
+	if (V4L2_TYPE_IS_CAPTURE(q->type) &&
+	    vb2_is_streaming(q) &&
+	    v4l2_m2m_dst_buf_is_last(channel->fh.m2m_ctx)) {
+		unsigned int i;
+
+		for (i = 0; i < vb->num_planes; i++)
+			vb->planes[i].bytesused = 0;
 
-	if (allegro_get_state(channel) == ALLEGRO_STATE_WAIT_FOR_BUFFER &&
-	    vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		allegro_channel_buf_done(channel, vbuf, VB2_BUF_STATE_DONE);
+		vbuf->field = V4L2_FIELD_NONE;
+		vbuf->sequence = channel->csequence++;
+
+		v4l2_m2m_last_buffer_done(channel->fh.m2m_ctx, vbuf);
+		allegro_channel_eos_event(channel);
 		return;
 	}
 
@@ -2186,12 +2145,12 @@ static int allegro_start_streaming(struct vb2_queue *q, unsigned int count)
 		 "%s: start streaming\n",
 		 V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture");
 
-	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+	v4l2_m2m_update_start_streaming_state(channel->fh.m2m_ctx, q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		channel->osequence = 0;
-		allegro_set_state(channel, ALLEGRO_STATE_ENCODING);
-	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+	else
 		channel->csequence = 0;
-	}
 
 	return 0;
 }
@@ -2216,10 +2175,9 @@ static void allegro_stop_streaming(struct vb2_queue *q)
 		}
 		mutex_unlock(&channel->shadow_list_lock);
 
-		allegro_set_state(channel, ALLEGRO_STATE_STOPPED);
 		while ((buffer = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx)))
 			v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_ERROR);
-	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+	} else {
 		mutex_lock(&channel->shadow_list_lock);
 		list_for_each_entry_safe(shadow, tmp,
 					 &channel->stream_shadow_list, head) {
@@ -2232,6 +2190,12 @@ static void allegro_stop_streaming(struct vb2_queue *q)
 		while ((buffer = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx)))
 			v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_ERROR);
 	}
+
+	v4l2_m2m_update_stop_streaming_state(channel->fh.m2m_ctx, q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type) &&
+	    v4l2_m2m_has_stopped(channel->fh.m2m_ctx))
+		allegro_channel_eos_event(channel);
 }
 
 static const struct vb2_ops allegro_queue_ops = {
@@ -2670,62 +2634,16 @@ static int allegro_s_fmt_vid_out(struct file *file, void *fh,
 
 static int allegro_channel_cmd_stop(struct allegro_channel *channel)
 {
-	struct allegro_dev *dev = channel->dev;
-	struct vb2_v4l2_buffer *dst_buf;
-
-	switch (allegro_get_state(channel)) {
-	case ALLEGRO_STATE_DRAIN:
-	case ALLEGRO_STATE_WAIT_FOR_BUFFER:
-		return -EBUSY;
-	case ALLEGRO_STATE_ENCODING:
-		allegro_set_state(channel, ALLEGRO_STATE_DRAIN);
-		break;
-	default:
-		return 0;
-	}
-
-	/* If there are output buffers, they must be encoded */
-	if (v4l2_m2m_num_src_bufs_ready(channel->fh.m2m_ctx) != 0) {
-		v4l2_dbg(1, debug,  &dev->v4l2_dev,
-			 "channel %d: CMD_STOP: continue encoding src buffers\n",
-			 channel->mcu_channel_id);
-		return 0;
-	}
-
-	/* If there are capture buffers, use it to signal EOS */
-	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
-	if (dst_buf) {
-		v4l2_dbg(1, debug,  &dev->v4l2_dev,
-			 "channel %d: CMD_STOP: signaling EOS\n",
-			 channel->mcu_channel_id);
-		allegro_channel_buf_done(channel, dst_buf, VB2_BUF_STATE_DONE);
-		return 0;
-	}
-
-	/*
-	 * If there are no capture buffers, we need to wait for the next
-	 * buffer to signal EOS.
-	 */
-	v4l2_dbg(1, debug,  &dev->v4l2_dev,
-		 "channel %d: CMD_STOP: wait for CAPTURE buffer to signal EOS\n",
-		 channel->mcu_channel_id);
-	allegro_set_state(channel, ALLEGRO_STATE_WAIT_FOR_BUFFER);
+	if (v4l2_m2m_has_stopped(channel->fh.m2m_ctx))
+		allegro_channel_eos_event(channel);
 
 	return 0;
 }
 
 static int allegro_channel_cmd_start(struct allegro_channel *channel)
 {
-	switch (allegro_get_state(channel)) {
-	case ALLEGRO_STATE_DRAIN:
-	case ALLEGRO_STATE_WAIT_FOR_BUFFER:
-		return -EBUSY;
-	case ALLEGRO_STATE_STOPPED:
-		allegro_set_state(channel, ALLEGRO_STATE_ENCODING);
-		break;
-	default:
-		return 0;
-	}
+	if (v4l2_m2m_has_stopped(channel->fh.m2m_ctx))
+		vb2_clear_last_buffer_dequeued(&channel->fh.m2m_ctx->cap_q_ctx.q);
 
 	return 0;
 }
@@ -2740,17 +2658,15 @@ static int allegro_encoder_cmd(struct file *file, void *fh,
 	if (err)
 		return err;
 
-	switch (cmd->cmd) {
-	case V4L2_ENC_CMD_STOP:
+	err = v4l2_m2m_ioctl_encoder_cmd(file, fh, cmd);
+	if (err)
+		return err;
+
+	if (cmd->cmd == V4L2_ENC_CMD_STOP)
 		err = allegro_channel_cmd_stop(channel);
-		break;
-	case V4L2_ENC_CMD_START:
+
+	if (cmd->cmd == V4L2_ENC_CMD_START)
 		err = allegro_channel_cmd_start(channel);
-		break;
-	default:
-		err = -EINVAL;
-		break;
-	}
 
 	return err;
 }
-- 
2.20.1

