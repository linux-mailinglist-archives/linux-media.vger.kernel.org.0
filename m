Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072D9284A74
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 12:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgJFKo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 06:44:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32972 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgJFKoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 06:44:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1D4F229B127
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH 5/6] coda: coda_buffer_meta housekeeping fix
Date:   Tue,  6 Oct 2020 07:44:13 -0300
Message-Id: <20201006104414.67984-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201006104414.67984-1-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's possible that the VPU was initialized using just one buffer,
containing only codec headers.

In this case, right after the initialization and after updating
the FIFO read pointer, we need to iterate through all the coda_buffer_meta
and release any metas that have been already used by the VPU.

This issue is affecting indirectly the bitstream buffer fill
threshold, which depends on the meta end position of the first
queued meta, which is passed to coda_bitstream_can_fetch_past().

Without this fix, it's possible that for certain videos, the
bitstream buffer level is not filled properly, resulting in a PIC_RUN
timeout.

Reported-by: Benjamin Bara <benjamin.bara@skidata.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/coda/coda-bit.c | 42 +++++++++++++++++++++++---
 drivers/media/platform/coda/coda.h     |  1 +
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 659fcf77b0ed..928a640b0056 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -1836,6 +1836,29 @@ static bool coda_reorder_enable(struct coda_ctx *ctx)
 	return profile > V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
 }
 
+static void __coda_decoder_drop_used_metas(struct coda_ctx *ctx)
+{
+	struct coda_buffer_meta *meta, *tmp;
+
+	/*
+	 * All metas that end at or before the RD pointer (fifo out),
+	 * are now consumed by the VPU and should be released.
+	 */
+	spin_lock(&ctx->buffer_meta_lock);
+	list_for_each_entry_safe(meta, tmp, &ctx->buffer_meta_list, list) {
+		if (ctx->bitstream_fifo.kfifo.out >= meta->end) {
+			coda_dbg(2, ctx, "releasing meta: seq=%d start=%d end=%d\n",
+				 meta->sequence, meta->start, meta->end);
+
+			list_del(&meta->list);
+			ctx->num_metas--;
+			ctx->first_frame_sequence++;
+			kfree(meta);
+		}
+	}
+	spin_unlock(&ctx->buffer_meta_lock);
+}
+
 static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 {
 	struct coda_q_data *q_data_src, *q_data_dst;
@@ -1921,10 +1944,17 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 	}
 	ctx->sequence_offset = ~0U;
 	ctx->initialized = 1;
+	ctx->first_frame_sequence = 0;
 
 	/* Update kfifo out pointer from coda bitstream read pointer */
 	coda_kfifo_sync_from_device(ctx);
 
+	/*
+	 * After updating the read pointer, we need to check if
+	 * any metas are consumed and should be released.
+	 */
+	__coda_decoder_drop_used_metas(ctx);
+
 	if (coda_read(dev, CODA_RET_DEC_SEQ_SUCCESS) == 0) {
 		v4l2_err(&dev->v4l2_dev,
 			"CODA_COMMAND_SEQ_INIT failed, error code = 0x%x\n",
@@ -2395,12 +2425,16 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 		v4l2_err(&dev->v4l2_dev,
 			 "decoded frame index out of range: %d\n", decoded_idx);
 	} else {
+		int sequence;
+
 		decoded_frame = &ctx->internal_frames[decoded_idx];
 
 		val = coda_read(dev, CODA_RET_DEC_PIC_FRAME_NUM);
 		if (ctx->sequence_offset == -1)
 			ctx->sequence_offset = val;
-		val -= ctx->sequence_offset;
+
+		sequence = val + ctx->first_frame_sequence
+			       - ctx->sequence_offset;
 		spin_lock(&ctx->buffer_meta_lock);
 		if (!list_empty(&ctx->buffer_meta_list)) {
 			meta = list_first_entry(&ctx->buffer_meta_list,
@@ -2415,10 +2449,10 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 			 * should be enough to detect most errors and saves us
 			 * from doing different things based on the format.
 			 */
-			if ((val & 0xffff) != (meta->sequence & 0xffff)) {
+			if ((sequence & 0xffff) != (meta->sequence & 0xffff)) {
 				v4l2_err(&dev->v4l2_dev,
 					 "sequence number mismatch (%d(%d) != %d)\n",
-					 val, ctx->sequence_offset,
+					 sequence, ctx->sequence_offset,
 					 meta->sequence);
 			}
 			decoded_frame->meta = *meta;
@@ -2428,7 +2462,7 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 			v4l2_err(&dev->v4l2_dev, "empty timestamp list!\n");
 			memset(&decoded_frame->meta, 0,
 			       sizeof(struct coda_buffer_meta));
-			decoded_frame->meta.sequence = val;
+			decoded_frame->meta.sequence = sequence;
 			decoded_frame->meta.last = false;
 			ctx->sequence_offset++;
 		}
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index b81f3aca9209..e53f7a65d532 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -259,6 +259,7 @@ struct coda_ctx {
 	struct list_head		buffer_meta_list;
 	spinlock_t			buffer_meta_lock;
 	int				num_metas;
+	unsigned int			first_frame_sequence;
 	struct coda_aux_buf		workbuf;
 	int				num_internal_frames;
 	int				idx;
-- 
2.27.0

