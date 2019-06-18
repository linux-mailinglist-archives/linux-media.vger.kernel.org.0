Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301224A75F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730072AbfFRQp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:58 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55033 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729943AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-Ev; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 05/28] media: coda: add coda_wake_up_capture_queue
Date:   Tue, 18 Jun 2019 18:45:12 +0200
Message-Id: <20190618164535.20162-6-p.zabel@pengutronix.de>
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

Combine setting the last_buffer_dequeued flag on the capture video
queue and waking up its done workqueue into a helper function.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index d3b1e7b87a8a..7dbeb80d40f4 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1004,11 +1004,21 @@ static int coda_try_encoder_cmd(struct file *file, void *fh,
 	return v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
 }
 
+static void coda_wake_up_capture_queue(struct coda_ctx *ctx)
+{
+	struct vb2_queue *dst_vq;
+
+	coda_dbg(1, ctx, "waking up capture queue\n");
+
+	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	dst_vq->last_buffer_dequeued = true;
+	wake_up(&dst_vq->done_wq);
+}
+
 static int coda_encoder_cmd(struct file *file, void *fh,
 			    struct v4l2_encoder_cmd *ec)
 {
 	struct coda_ctx *ctx = fh_to_ctx(fh);
-	struct vb2_queue *dst_vq;
 	int ret;
 
 	ret = coda_try_encoder_cmd(file, fh, ec);
@@ -1021,12 +1031,8 @@ static int coda_encoder_cmd(struct file *file, void *fh,
 	flush_work(&ctx->pic_run_work);
 
 	/* If there is no buffer in flight, wake up */
-	if (!ctx->streamon_out || ctx->qsequence == ctx->osequence) {
-		dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
-					 V4L2_BUF_TYPE_VIDEO_CAPTURE);
-		dst_vq->last_buffer_dequeued = true;
-		wake_up(&dst_vq->done_wq);
-	}
+	if (!ctx->streamon_out || ctx->qsequence == ctx->osequence)
+		coda_wake_up_capture_queue(ctx);
 
 	return 0;
 }
-- 
2.20.1

