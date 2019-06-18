Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F874A76A
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730079AbfFRQqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:46:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43155 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-R2; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 14/28] media: coda: flush bitstream ring buffer on decoder restart
Date:   Tue, 18 Jun 2019 18:45:21 +0200
Message-Id: <20190618164535.20162-15-p.zabel@pengutronix.de>
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

The bitstream ringbuffer might be in an underrun state after draining,
or it might still contain unread data if the previous decoder stop
command was flagged as immediate. Flush the bitstream ring buffer
during V4L2_DEC_CMD_START to get into a well defined state. Also fill
the bitstream with buffers that have been queued during draining,
to resume decoding immediately.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c    | 20 ++++++++++++++++++++
 drivers/media/platform/coda/coda-common.c |  7 +++++++
 drivers/media/platform/coda/coda.h        |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 5a1016243032..843f92312f47 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -199,6 +199,26 @@ static int coda_h264_bitstream_pad(struct coda_ctx *ctx, u32 size)
 	return (n < size) ? -ENOSPC : 0;
 }
 
+int coda_bitstream_flush(struct coda_ctx *ctx)
+{
+	int ret;
+
+	if (ctx->inst_type != CODA_INST_DECODER || !ctx->use_bit)
+		return 0;
+
+	ret = coda_command_sync(ctx, CODA_COMMAND_DEC_BUF_FLUSH);
+	if (ret < 0) {
+		v4l2_err(&ctx->dev->v4l2_dev, "failed to flush bitstream\n");
+		return ret;
+	}
+
+	kfifo_init(&ctx->bitstream_fifo, ctx->bitstream.vaddr,
+		   ctx->bitstream.size);
+	coda_kfifo_sync_to_device_full(ctx);
+
+	return 0;
+}
+
 static int coda_bitstream_queue(struct coda_ctx *ctx, const u8 *buf, u32 size)
 {
 	u32 n = kfifo_in(&ctx->bitstream_fifo, buf, size);
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index dc9bce896003..ddd819ea13f2 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1052,6 +1052,7 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 			    struct v4l2_decoder_cmd *dc)
 {
 	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_dev *dev = ctx->dev;
 	struct vb2_queue *dst_vq;
 	int ret;
 
@@ -1061,10 +1062,16 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 
 	switch (dc->cmd) {
 	case V4L2_DEC_CMD_START:
+		mutex_lock(&ctx->bitstream_mutex);
+		mutex_lock(&dev->coda_mutex);
+		coda_bitstream_flush(ctx);
+		mutex_unlock(&dev->coda_mutex);
 		dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 					 V4L2_BUF_TYPE_VIDEO_CAPTURE);
 		vb2_clear_last_buffer_dequeued(dst_vq);
 		ctx->bit_stream_param &= ~CODA_BIT_STREAM_END_FLAG;
+		coda_fill_bitstream(ctx, NULL);
+		mutex_unlock(&ctx->bitstream_mutex);
 		break;
 	case V4L2_DEC_CMD_STOP:
 		/* Set the stream-end flag on this context */
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index 12bbd3129269..6911c1c811ce 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -322,6 +322,7 @@ static inline bool coda_bitstream_can_fetch_past(struct coda_ctx *ctx,
 }
 
 bool coda_bitstream_can_fetch_past(struct coda_ctx *ctx, unsigned int pos);
+int coda_bitstream_flush(struct coda_ctx *ctx);
 
 void coda_bit_stream_end_flag(struct coda_ctx *ctx);
 
-- 
2.20.1

