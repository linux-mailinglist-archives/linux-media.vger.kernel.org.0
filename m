Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63C86186E7E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731806AbgCPP0p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:26:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34707 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731775AbgCPP0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:26:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdZ-0000lQ-Tt; Mon, 16 Mar 2020 16:26:41 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdY-00055Y-SA; Mon, 16 Mar 2020 16:26:40 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 15/18] media: allegro: verify source and destination buffer in VCU response
Date:   Mon, 16 Mar 2020 16:26:35 +0100
Message-Id: <20200316152638.19457-16-m.tretter@pengutronix.de>
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

The PUT_STREAM_BUFFER and ENCODE_FRAME request have fields that allow to
pass arbitrary 64 bit values through the firmware to the ENCODE_FRAME
response. Use these values to verify that the buffers when finishing the
frame are actually the same buffers that have been sent for encoding a
frame.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v1 -> v2:
- Fix warnings about lines over 80 characters
- Fix warnings about cast from ptr to u64
---
 .../staging/media/allegro-dvt/allegro-core.c  | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 820fb21ab0f1..45e0d2c2fc44 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -567,6 +567,11 @@ static inline u32 to_codec_addr(struct allegro_dev *dev, dma_addr_t phys)
 	return lower_32_bits(phys);
 }
 
+static inline u64 ptr_to_u64(const void *ptr)
+{
+	return (uintptr_t)ptr;
+}
+
 /* Helper functions for channel and user operations */
 
 static unsigned long allegro_next_user_id(struct allegro_dev *dev)
@@ -1215,7 +1220,8 @@ static int allegro_mcu_send_destroy_channel(struct allegro_dev *dev,
 static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 					      struct allegro_channel *channel,
 					      dma_addr_t paddr,
-					      unsigned long size)
+					      unsigned long size,
+					      u64 stream_id)
 {
 	struct mcu_msg_put_stream_buffer msg;
 
@@ -1229,7 +1235,8 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 	msg.mcu_addr = to_mcu_addr(dev, paddr);
 	msg.size = size;
 	msg.offset = ENCODER_STREAM_OFFSET;
-	msg.stream_id = 0; /* copied to mcu_msg_encode_frame_response */
+	/* copied to mcu_msg_encode_frame_response */
+	msg.stream_id = stream_id;
 
 	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
 	allegro_mcu_interrupt(dev);
@@ -1239,7 +1246,8 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 
 static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 					 struct allegro_channel *channel,
-					 dma_addr_t src_y, dma_addr_t src_uv)
+					 dma_addr_t src_y, dma_addr_t src_uv,
+					 u64 src_handle)
 {
 	struct mcu_msg_encode_frame msg;
 
@@ -1252,7 +1260,8 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 	msg.encoding_options = AL_OPT_FORCE_LOAD;
 	msg.pps_qp = 26; /* qp are relative to 26 */
 	msg.user_param = 0; /* copied to mcu_msg_encode_frame_response */
-	msg.src_handle = 0; /* copied to mcu_msg_encode_frame_response */
+	/* src_handle is copied to mcu_msg_encode_frame_response */
+	msg.src_handle = src_handle;
 	msg.src_y = to_codec_addr(dev, src_y);
 	msg.src_uv = to_codec_addr(dev, src_uv);
 	msg.stride = channel->stride;
@@ -1602,8 +1611,17 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 	ssize_t free;
 
 	src_buf = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx);
+	if (ptr_to_u64(src_buf) != msg->src_handle)
+		v4l2_warn(&dev->v4l2_dev,
+			  "channel %d: invalid source buffer (0x%llx)\n",
+			  channel->mcu_channel_id, msg->src_handle);
 
 	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
+	if (ptr_to_u64(dst_buf) != msg->stream_id)
+		v4l2_warn(&dev->v4l2_dev,
+			  "channel %d: invalid stream buffer (0x%llx)\n",
+			  channel->mcu_channel_id, msg->stream_id);
+
 	dst_buf->sequence = channel->csequence++;
 
 	if (msg->error_code & AL_ERROR) {
@@ -3025,14 +3043,16 @@ static void allegro_device_run(void *priv)
 	dst_buf = v4l2_m2m_next_dst_buf(channel->fh.m2m_ctx);
 	dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	dst_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
-	allegro_mcu_send_put_stream_buffer(dev, channel, dst_addr, dst_size);
+	allegro_mcu_send_put_stream_buffer(dev, channel, dst_addr, dst_size,
+					   ptr_to_u64(dst_buf));
 
 	src_buf = v4l2_m2m_next_src_buf(channel->fh.m2m_ctx);
 	src_buf->sequence = channel->osequence++;
 
 	src_y = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	src_uv = src_y + (channel->stride * channel->height);
-	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv);
+	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv,
+				      ptr_to_u64(src_buf));
 }
 
 static const struct v4l2_m2m_ops allegro_m2m_ops = {
-- 
2.20.1

