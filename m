Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B8D4A762
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730075AbfFRQp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:59 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49637 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729949AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-Iz; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 10/28] media: coda: integrate internal frame metadata into a structure
Date:   Tue, 18 Jun 2019 18:45:17 +0200
Message-Id: <20190618164535.20162-11-p.zabel@pengutronix.de>
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

Combine the separate auxiliary buffer, buffer meta, frame type, and
decode error arrays into an array of struct coda_internal_frame.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 62 +++++++++++++-------------
 drivers/media/platform/coda/coda.h     | 12 +++--
 2 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 9f8e2342d175..494bc130c7af 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -395,7 +395,7 @@ static void coda_free_framebuffers(struct coda_ctx *ctx)
 	int i;
 
 	for (i = 0; i < CODA_MAX_FRAMEBUFFERS; i++)
-		coda_free_aux_buf(ctx->dev, &ctx->internal_frames[i]);
+		coda_free_aux_buf(ctx->dev, &ctx->internal_frames[i].buf);
 }
 
 static int coda_alloc_framebuffers(struct coda_ctx *ctx,
@@ -435,7 +435,7 @@ static int coda_alloc_framebuffers(struct coda_ctx *ctx,
 			coda_free_framebuffers(ctx);
 			return -ENOMEM;
 		}
-		ret = coda_alloc_context_buf(ctx, &ctx->internal_frames[i],
+		ret = coda_alloc_context_buf(ctx, &ctx->internal_frames[i].buf,
 					     size, name);
 		kfree(name);
 		if (ret < 0) {
@@ -449,7 +449,7 @@ static int coda_alloc_framebuffers(struct coda_ctx *ctx,
 		u32 y, cb, cr, mvcol;
 
 		/* Start addresses of Y, Cb, Cr planes */
-		y = ctx->internal_frames[i].paddr;
+		y = ctx->internal_frames[i].buf.paddr;
 		cb = y + ysize;
 		cr = y + ysize + ysize/4;
 		mvcol = y + ysize + ysize/4 + ysize/4;
@@ -1202,9 +1202,9 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 			coda9_set_frame_cache(ctx, q_data_src->fourcc);
 
 			/* FIXME */
-			coda_write(dev, ctx->internal_frames[2].paddr,
+			coda_write(dev, ctx->internal_frames[2].buf.paddr,
 				   CODA9_CMD_SET_FRAME_SUBSAMP_A);
-			coda_write(dev, ctx->internal_frames[3].paddr,
+			coda_write(dev, ctx->internal_frames[3].buf.paddr,
 				   CODA9_CMD_SET_FRAME_SUBSAMP_B);
 		}
 	}
@@ -1993,7 +1993,7 @@ static int coda_prepare_decode(struct coda_ctx *ctx)
 	    ctx->display_idx < ctx->num_internal_frames) {
 		vdoa_device_run(ctx->vdoa,
 				vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0),
-				ctx->internal_frames[ctx->display_idx].paddr);
+				ctx->internal_frames[ctx->display_idx].buf.paddr);
 	} else {
 		if (dev->devtype->product == CODA_960) {
 			/*
@@ -2091,6 +2091,7 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 	int width, height;
 	int decoded_idx;
 	int display_idx;
+	struct coda_internal_frame *decoded_frame = NULL;
 	u32 src_fourcc;
 	int success;
 	u32 err_mb;
@@ -2216,6 +2217,8 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 		v4l2_err(&dev->v4l2_dev,
 			 "decoded frame index out of range: %d\n", decoded_idx);
 	} else {
+		decoded_frame = &ctx->internal_frames[decoded_idx];
+
 		val = coda_read(dev, CODA_RET_DEC_PIC_FRAME_NUM);
 		if (ctx->sequence_offset == -1)
 			ctx->sequence_offset = val;
@@ -2240,28 +2243,25 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 					 val, ctx->sequence_offset,
 					 meta->sequence);
 			}
-			ctx->frame_metas[decoded_idx] = *meta;
+			decoded_frame->meta = *meta;
 			kfree(meta);
 		} else {
 			spin_unlock(&ctx->buffer_meta_lock);
 			v4l2_err(&dev->v4l2_dev, "empty timestamp list!\n");
-			memset(&ctx->frame_metas[decoded_idx], 0,
+			memset(&decoded_frame->meta, 0,
 			       sizeof(struct coda_buffer_meta));
-			ctx->frame_metas[decoded_idx].sequence = val;
+			decoded_frame->meta.sequence = val;
 			ctx->sequence_offset++;
 		}
 
-		trace_coda_dec_pic_done(ctx, &ctx->frame_metas[decoded_idx]);
+		trace_coda_dec_pic_done(ctx, &decoded_frame->meta);
 
 		val = coda_read(dev, CODA_RET_DEC_PIC_TYPE) & 0x7;
-		if (val == 0)
-			ctx->frame_types[decoded_idx] = V4L2_BUF_FLAG_KEYFRAME;
-		else if (val == 1)
-			ctx->frame_types[decoded_idx] = V4L2_BUF_FLAG_PFRAME;
-		else
-			ctx->frame_types[decoded_idx] = V4L2_BUF_FLAG_BFRAME;
+		decoded_frame->type = (val == 0) ? V4L2_BUF_FLAG_KEYFRAME :
+				      (val == 1) ? V4L2_BUF_FLAG_PFRAME :
+						   V4L2_BUF_FLAG_BFRAME;
 
-		ctx->frame_errors[decoded_idx] = err_mb;
+		decoded_frame->error = err_mb;
 	}
 
 	if (display_idx == -1) {
@@ -2281,6 +2281,10 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 	/* If a frame was copied out, return it */
 	if (ctx->display_idx >= 0 &&
 	    ctx->display_idx < ctx->num_internal_frames) {
+		struct coda_internal_frame *ready_frame;
+
+		ready_frame = &ctx->internal_frames[ctx->display_idx];
+
 		dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 		dst_buf->sequence = ctx->osequence++;
 
@@ -2288,8 +2292,8 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 		dst_buf->flags &= ~(V4L2_BUF_FLAG_KEYFRAME |
 					     V4L2_BUF_FLAG_PFRAME |
 					     V4L2_BUF_FLAG_BFRAME);
-		dst_buf->flags |= ctx->frame_types[ctx->display_idx];
-		meta = &ctx->frame_metas[ctx->display_idx];
+		dst_buf->flags |= ready_frame->type;
+		meta = &ready_frame->meta;
 		dst_buf->timecode = meta->timecode;
 		dst_buf->vb2_buf.timestamp = meta->timestamp;
 
@@ -2298,18 +2302,17 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
 				      q_data_dst->sizeimage);
 
-		if (ctx->frame_errors[ctx->display_idx] || err_vdoa)
+		if (ready_frame->error || err_vdoa)
 			coda_m2m_buf_done(ctx, dst_buf, VB2_BUF_STATE_ERROR);
 		else
 			coda_m2m_buf_done(ctx, dst_buf, VB2_BUF_STATE_DONE);
 
-		if (decoded_idx >= 0 &&
-		    decoded_idx < ctx->num_internal_frames) {
+		if (decoded_frame) {
 			coda_dbg(1, ctx, "job finished: decoded %c frame %u, returned %c frame %u (%u/%u)%s\n",
-				 coda_frame_type_char(ctx->frame_types[decoded_idx]),
-				 ctx->frame_metas[decoded_idx].sequence,
+				 coda_frame_type_char(decoded_frame->type),
+				 decoded_frame->meta.sequence,
 				 coda_frame_type_char(dst_buf->flags),
-				 ctx->frame_metas[ctx->display_idx].sequence,
+				 ready_frame->meta.sequence,
 				 dst_buf->sequence, ctx->qsequence,
 				 (dst_buf->flags & V4L2_BUF_FLAG_LAST) ?
 				 " (last)" : "");
@@ -2317,17 +2320,16 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 			coda_dbg(1, ctx, "job finished: no frame decoded (%d), returned %c frame %u (%u/%u)%s\n",
 				 decoded_idx,
 				 coda_frame_type_char(dst_buf->flags),
-				 ctx->frame_metas[ctx->display_idx].sequence,
+				 ready_frame->meta.sequence,
 				 dst_buf->sequence, ctx->qsequence,
 				 (dst_buf->flags & V4L2_BUF_FLAG_LAST) ?
 				 " (last)" : "");
 		}
 	} else {
-		if (decoded_idx >= 0 &&
-		    decoded_idx < ctx->num_internal_frames) {
+		if (decoded_frame) {
 			coda_dbg(1, ctx, "job finished: decoded %c frame %u, no frame returned (%d)\n",
-				 coda_frame_type_char(ctx->frame_types[decoded_idx]),
-				 ctx->frame_metas[decoded_idx].sequence,
+				 coda_frame_type_char(decoded_frame->type),
+				 decoded_frame->meta.sequence,
 				 ctx->display_idx);
 		} else {
 			coda_dbg(1, ctx, "job finished: no frame decoded (%d) or returned (%d)\n",
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index c97ea3e24b80..10207e9534c2 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -190,6 +190,13 @@ struct coda_context_ops {
 	void (*release)(struct coda_ctx *ctx);
 };
 
+struct coda_internal_frame {
+	struct coda_aux_buf		buf;
+	struct coda_buffer_meta		meta;
+	u32				type;
+	u32				error;
+};
+
 struct coda_ctx {
 	struct coda_dev			*dev;
 	struct mutex			buffer_mutex;
@@ -233,10 +240,7 @@ struct coda_ctx {
 	struct coda_aux_buf		parabuf;
 	struct coda_aux_buf		psbuf;
 	struct coda_aux_buf		slicebuf;
-	struct coda_aux_buf		internal_frames[CODA_MAX_FRAMEBUFFERS];
-	u32				frame_types[CODA_MAX_FRAMEBUFFERS];
-	struct coda_buffer_meta		frame_metas[CODA_MAX_FRAMEBUFFERS];
-	u32				frame_errors[CODA_MAX_FRAMEBUFFERS];
+	struct coda_internal_frame	internal_frames[CODA_MAX_FRAMEBUFFERS];
 	struct list_head		buffer_meta_list;
 	spinlock_t			buffer_meta_lock;
 	int				num_metas;
-- 
2.20.1

