Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510534A752
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730046AbfFRQpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:46 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45327 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730011AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-3P; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 22/28] media: coda: flag the last encoded buffer
Date:   Tue, 18 Jun 2019 18:45:29 +0200
Message-Id: <20190618164535.20162-23-p.zabel@pengutronix.de>
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

Use the flagged last output buffer to also flag the corresponding
capture buffer after encoding. This causes the end of stream event
to be issued and the buffer to be dequeued with the last flag set.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index cbcec571a014..7bcdfe8dcf3d 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -1565,13 +1565,14 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 	coda_read(dev, CODA_RET_ENC_PIC_SLICE_NUM);
 	coda_read(dev, CODA_RET_ENC_PIC_FLAG);
 
-	if (coda_read(dev, CODA_RET_ENC_PIC_TYPE) == 0) {
+	dst_buf->flags &= ~(V4L2_BUF_FLAG_KEYFRAME |
+			    V4L2_BUF_FLAG_PFRAME |
+			    V4L2_BUF_FLAG_LAST);
+	if (coda_read(dev, CODA_RET_ENC_PIC_TYPE) == 0)
 		dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
-		dst_buf->flags &= ~V4L2_BUF_FLAG_PFRAME;
-	} else {
+	else
 		dst_buf->flags |= V4L2_BUF_FLAG_PFRAME;
-		dst_buf->flags &= ~V4L2_BUF_FLAG_KEYFRAME;
-	}
+	dst_buf->flags |= src_buf->flags & V4L2_BUF_FLAG_LAST;
 
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
@@ -1584,8 +1585,9 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 	if (ctx->gopcounter < 0)
 		ctx->gopcounter = ctx->params.gop_size - 1;
 
-	coda_dbg(1, ctx, "job finished: encoded %c frame (%d)\n",
-		 coda_frame_type_char(dst_buf->flags), dst_buf->sequence);
+	coda_dbg(1, ctx, "job finished: encoded %c frame (%d)%s\n",
+		 coda_frame_type_char(dst_buf->flags), dst_buf->sequence,
+		 (dst_buf->flags & V4L2_BUF_FLAG_LAST) ? " (last)" : "");
 }
 
 static void coda_seq_end_work(struct work_struct *work)
-- 
2.20.1

