Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3C64A75B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730060AbfFRQpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53417 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730023AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-3t; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 23/28] media: coda: lock capture queue wakeup against encoder stop command
Date:   Tue, 18 Jun 2019 18:45:30 +0200
Message-Id: <20190618164535.20162-24-p.zabel@pengutronix.de>
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

Make sure that an encoder stop command running concurrently with an
encoder finish_run always either flags the last returned buffer or wakes
up the capture queue to signal the end of stream condition afterwards.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c    |  7 +++++++
 drivers/media/platform/coda/coda-common.c | 19 ++++++++++++++-----
 drivers/media/platform/coda/coda.h        |  6 ++++++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 7bcdfe8dcf3d..44085e3d43d5 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -1540,6 +1540,12 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 	struct coda_dev *dev = ctx->dev;
 	u32 wr_ptr, start_ptr;
 
+	/*
+	 * Lock to make sure that an encoder stop command running in parallel
+	 * will either already have marked src_buf as last, or it will wake up
+	 * the capture queue after the buffers are returned.
+	 */
+	mutex_lock(&ctx->wakeup_mutex);
 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
@@ -1580,6 +1586,7 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	coda_m2m_buf_done(ctx, dst_buf, VB2_BUF_STATE_DONE);
+	mutex_unlock(&ctx->wakeup_mutex);
 
 	ctx->gopcounter--;
 	if (ctx->gopcounter < 0)
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 0d64ddc49494..829d1e565911 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1034,19 +1034,27 @@ static int coda_encoder_cmd(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
+	mutex_lock(&ctx->wakeup_mutex);
 	buf = v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);
 	if (buf) {
+		/*
+		 * If the last output buffer is still on the queue, make sure
+		 * that decoder finish_run will see the last flag and report it
+		 * to userspace.
+		 */
 		buf->flags |= V4L2_BUF_FLAG_LAST;
 	} else {
 		/* Set the stream-end flag on this context */
 		ctx->bit_stream_param |= CODA_BIT_STREAM_END_FLAG;
 
-		flush_work(&ctx->pic_run_work);
-
-		/* If there is no buffer in flight, wake up */
-		if (!ctx->streamon_out || ctx->qsequence == ctx->osequence)
-			coda_wake_up_capture_queue(ctx);
+		/*
+		 * If the last output buffer has already been taken from the
+		 * queue, wake up the capture queue and signal end of stream
+		 * via the -EPIPE mechanism.
+		 */
+		coda_wake_up_capture_queue(ctx);
 	}
+	mutex_unlock(&ctx->wakeup_mutex);
 
 	return 0;
 }
@@ -2466,6 +2474,7 @@ static int coda_open(struct file *file)
 
 	mutex_init(&ctx->bitstream_mutex);
 	mutex_init(&ctx->buffer_mutex);
+	mutex_init(&ctx->wakeup_mutex);
 	INIT_LIST_HEAD(&ctx->buffer_meta_list);
 	spin_lock_init(&ctx->buffer_meta_lock);
 
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index 6911c1c811ce..97845e58fb8b 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -258,6 +258,12 @@ struct coda_ctx {
 	bool				use_bit;
 	bool				use_vdoa;
 	struct vdoa_ctx			*vdoa;
+	/*
+	 * wakeup mutex used to serialize encoder stop command and finish_run,
+	 * ensures that finish_run always either flags the last returned buffer
+	 * or wakes up the capture queue to signal EOS afterwards.
+	 */
+	struct mutex			wakeup_mutex;
 };
 
 extern int coda_debug;
-- 
2.20.1

