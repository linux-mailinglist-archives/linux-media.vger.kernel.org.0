Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A734A75C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730067AbfFRQpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49633 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730020AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-4Y; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 24/28] media: coda: mark last pending buffer or last meta on decoder stop command
Date:   Tue, 18 Jun 2019 18:45:31 +0200
Message-Id: <20190618164535.20162-25-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If there is still a buffer pending, mark it as the last buffer. It will
create a meta that is flagged as last when the buffer is copied into the
bitstream ring buffer. If there are no more buffers pending, find the
last bitstream meta and mark it as last. If there is no bitstream meta
either, wake up the capture queue as there will be no more decoded
frames.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c    |  4 +++
 drivers/media/platform/coda/coda-common.c | 44 +++++++++++++++++++----
 drivers/media/platform/coda/coda.h        |  1 +
 3 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 44085e3d43d5..1157454e3bc8 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -402,6 +402,9 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct list_head *buffer_list)
 				meta->timestamp = src_buf->vb2_buf.timestamp;
 				meta->start = start;
 				meta->end = ctx->bitstream_fifo.kfifo.in;
+				meta->last = src_buf->flags & V4L2_BUF_FLAG_LAST;
+				if (meta->last)
+					coda_dbg(1, ctx, "marking last meta");
 				spin_lock(&ctx->buffer_meta_lock);
 				list_add_tail(&meta->list,
 					      &ctx->buffer_meta_list);
@@ -2334,6 +2337,7 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 			memset(&decoded_frame->meta, 0,
 			       sizeof(struct coda_buffer_meta));
 			decoded_frame->meta.sequence = val;
+			decoded_frame->meta.last = false;
 			ctx->sequence_offset++;
 		}
 
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 829d1e565911..cd33c260409e 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1077,6 +1077,8 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 	struct coda_dev *dev = ctx->dev;
 	struct vb2_v4l2_buffer *buf;
 	struct vb2_queue *dst_vq;
+	bool stream_end;
+	bool wakeup;
 	int ret;
 
 	ret = coda_try_decoder_cmd(file, fh, dc);
@@ -1097,23 +1099,51 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 		mutex_unlock(&ctx->bitstream_mutex);
 		break;
 	case V4L2_DEC_CMD_STOP:
+		stream_end = false;
+		wakeup = false;
+
 		buf = v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);
-		if (buf)
+		if (buf) {
+			coda_dbg(1, ctx, "marking last pending buffer\n");
+
 			/* Mark last buffer */
 			buf->flags |= V4L2_BUF_FLAG_LAST;
 
-		if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) == 0) {
+			if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) == 0) {
+				coda_dbg(1, ctx, "all remaining buffers queued\n");
+				stream_end = true;
+			}
+		} else {
+			coda_dbg(1, ctx, "marking last meta\n");
+
+			/* Mark last meta */
+			spin_lock(&ctx->buffer_meta_lock);
+			if (!list_empty(&ctx->buffer_meta_list)) {
+				struct coda_buffer_meta *meta;
+
+				meta = list_last_entry(&ctx->buffer_meta_list,
+						       struct coda_buffer_meta,
+						       list);
+				meta->last = true;
+				stream_end = true;
+			} else {
+				wakeup = true;
+			}
+			spin_unlock(&ctx->buffer_meta_lock);
+		}
+
+		if (stream_end) {
+			coda_dbg(1, ctx, "all remaining buffers queued\n");
+
 			/* Set the stream-end flag on this context */
 			coda_bit_stream_end_flag(ctx);
 			ctx->hold = false;
 			v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
+		}
 
-			flush_work(&ctx->pic_run_work);
-
+		if (wakeup) {
 			/* If there is no buffer in flight, wake up */
-			if (!ctx->streamon_out ||
-			    ctx->qsequence == ctx->osequence)
-				coda_wake_up_capture_queue(ctx);
+			coda_wake_up_capture_queue(ctx);
 		}
 
 		break;
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index 97845e58fb8b..5c183c1944fe 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -146,6 +146,7 @@ struct coda_buffer_meta {
 	u64			timestamp;
 	unsigned int		start;
 	unsigned int		end;
+	bool			last;
 };
 
 /* Per-queue, driver-specific private data */
-- 
2.20.1

