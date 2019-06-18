Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BF24A754
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730053AbfFRQpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:46 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43461 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730010AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-2r; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 21/28] media: coda: only wake up capture queue if no pending buffers to encode
Date:   Tue, 18 Jun 2019 18:45:28 +0200
Message-Id: <20190618164535.20162-22-p.zabel@pengutronix.de>
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

If there are no pending queued output buffers to be encoded, waking up
the capture queue with -EPIPE signals end of stream. If there are
pending buffers on the other hand, setting the V4L2_BUF_FLAG_LAST on
the resulting encoded capture buffers is all that is needed.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 9349df773077..0d64ddc49494 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1035,17 +1035,18 @@ static int coda_encoder_cmd(struct file *file, void *fh,
 		return ret;
 
 	buf = v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);
-	if (buf)
+	if (buf) {
 		buf->flags |= V4L2_BUF_FLAG_LAST;
+	} else {
+		/* Set the stream-end flag on this context */
+		ctx->bit_stream_param |= CODA_BIT_STREAM_END_FLAG;
 
-	/* Set the stream-end flag on this context */
-	ctx->bit_stream_param |= CODA_BIT_STREAM_END_FLAG;
-
-	flush_work(&ctx->pic_run_work);
+		flush_work(&ctx->pic_run_work);
 
-	/* If there is no buffer in flight, wake up */
-	if (!ctx->streamon_out || ctx->qsequence == ctx->osequence)
-		coda_wake_up_capture_queue(ctx);
+		/* If there is no buffer in flight, wake up */
+		if (!ctx->streamon_out || ctx->qsequence == ctx->osequence)
+			coda_wake_up_capture_queue(ctx);
+	}
 
 	return 0;
 }
-- 
2.20.1

