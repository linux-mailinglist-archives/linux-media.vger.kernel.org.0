Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0304A757
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbfFRQpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44895 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730004AbfFRQpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:46 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-W0; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 18/28] media: coda: only set the stream end flags if there are no more pending output buffers
Date:   Tue, 18 Jun 2019 18:45:25 +0200
Message-Id: <20190618164535.20162-19-p.zabel@pengutronix.de>
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

If there are still queued output buffers pending to be copied into the
bitstream ring buffer, setting the stream end flag should be deferred
until the marked last output buffer is written into the bitstream ring
buffer.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 9b32b5862aa8..4002a5b8c9ea 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1098,16 +1098,20 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 			/* Mark last buffer */
 			buf->flags |= V4L2_BUF_FLAG_LAST;
 
-		/* Set the stream-end flag on this context */
-		coda_bit_stream_end_flag(ctx);
-		ctx->hold = false;
-		v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
+		if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) == 0) {
+			/* Set the stream-end flag on this context */
+			coda_bit_stream_end_flag(ctx);
+			ctx->hold = false;
+			v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
 
-		flush_work(&ctx->pic_run_work);
+			flush_work(&ctx->pic_run_work);
+
+			/* If there is no buffer in flight, wake up */
+			if (!ctx->streamon_out ||
+			    ctx->qsequence == ctx->osequence)
+				coda_wake_up_capture_queue(ctx);
+		}
 
-		/* If there is no buffer in flight, wake up */
-		if (!ctx->streamon_out || ctx->qsequence == ctx->osequence)
-			coda_wake_up_capture_queue(ctx);
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

