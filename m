Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD334F4B23
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573909AbiDEWxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443306AbiDEPjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:39:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE2F149271
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 06:55:29 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nbjeZ-0003Xh-GC; Tue, 05 Apr 2022 15:55:27 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Subject: [PATCH] media: coda: consolidate job_finish calls on decoder prepare_run failure
Date:   Tue,  5 Apr 2022 15:55:17 +0200
Message-Id: <20220405135517.3436381-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the decoder prepare_run callback returns an error, the hardware
is never started and v4l2_m2m_job_finish() is called immediately,
currently in every error path.

Remove the duplicated job_finish calls from the error paths and reuse
the v4l2_m2m_job_finish() at the end of coda_pic_run_work instead.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda-bit.c    | 2 --
 drivers/media/platform/chips-media/coda-common.c | 9 +++------
 drivers/media/platform/chips-media/coda-jpeg.c   | 6 +-----
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-bit.c b/drivers/media/platform/chips-media/coda-bit.c
index 3aad8999a3b3..a082d075b5ee 100644
--- a/drivers/media/platform/chips-media/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda-bit.c
@@ -2179,7 +2179,6 @@ static int coda_prepare_decode(struct coda_ctx *ctx)
 	    (!(ctx->bit_stream_param & CODA_BIT_STREAM_END_FLAG))) {
 		coda_dbg(1, ctx, "bitstream payload: %d, skipping\n",
 			 coda_get_bitstream_payload(ctx));
-		v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
 		return -EAGAIN;
 	}
 
@@ -2189,7 +2188,6 @@ static int coda_prepare_decode(struct coda_ctx *ctx)
 
 		if (ret < 0) {
 			v4l2_err(&dev->v4l2_dev, "failed to start decoding\n");
-			v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
 			return -EAGAIN;
 		} else {
 			ctx->initialized = 1;
diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index cd9ff2fa4147..0d1d92efbfdf 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -1513,12 +1513,8 @@ static void coda_pic_run_work(struct work_struct *work)
 	mutex_lock(&dev->coda_mutex);
 
 	ret = ctx->ops->prepare_run(ctx);
-	if (ret < 0 && ctx->inst_type == CODA_INST_DECODER) {
-		mutex_unlock(&dev->coda_mutex);
-		mutex_unlock(&ctx->buffer_mutex);
-		/* job_finish scheduled by prepare_decode */
-		return;
-	}
+	if (ret < 0 && ctx->inst_type == CODA_INST_DECODER)
+		goto out;
 
 	if (!wait_for_completion_timeout(&ctx->completion,
 					 msecs_to_jiffies(1000))) {
@@ -1540,6 +1536,7 @@ static void coda_pic_run_work(struct work_struct *work)
 	    ctx->ops->seq_end_work)
 		queue_work(dev->workqueue, &ctx->seq_end_work);
 
+out:
 	mutex_unlock(&dev->coda_mutex);
 	mutex_unlock(&ctx->buffer_mutex);
 
diff --git a/drivers/media/platform/chips-media/coda-jpeg.c b/drivers/media/platform/chips-media/coda-jpeg.c
index a72f4655e5ad..21d14f9bd7e5 100644
--- a/drivers/media/platform/chips-media/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda-jpeg.c
@@ -1340,10 +1340,8 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 				      vb2_plane_size(&src_buf->vb2_buf, 0));
 
 	chroma_format = coda9_jpeg_chroma_format(q_data_dst->fourcc);
-	if (chroma_format < 0) {
-		v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
+	if (chroma_format < 0)
 		return chroma_format;
-	}
 
 	ret = coda_jpeg_decode_header(ctx, &src_buf->vb2_buf);
 	if (ret < 0) {
@@ -1355,7 +1353,6 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
 		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
 
-		v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
 		return ret;
 	}
 
@@ -1396,7 +1393,6 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 		if (ret < 0) {
 			v4l2_err(&dev->v4l2_dev,
 				 "failed to set up Huffman tables: %d\n", ret);
-			v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
 			return ret;
 		}
 	}
-- 
2.30.2

