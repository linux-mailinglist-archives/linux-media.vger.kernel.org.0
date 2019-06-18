Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D42C4A758
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730058AbfFRQpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35519 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730006AbfFRQpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:46 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-2L; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 20/28] media: coda: retire coda_buf_is_end_of_stream
Date:   Tue, 18 Jun 2019 18:45:27 +0200
Message-Id: <20190618164535.20162-21-p.zabel@pengutronix.de>
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

Using the output queue sequence counter to determine the last buffer to
be encoded or decoded always was fragile at best. Now that we have the
last buffer flag propagating from the output queue to the capture queue
correctly, this is not needed anymore.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index c55124e8b4c8..9349df773077 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -900,13 +900,6 @@ static int coda_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 	return ret;
 }
 
-static bool coda_buf_is_end_of_stream(struct coda_ctx *ctx,
-				      struct vb2_v4l2_buffer *buf)
-{
-	return ((ctx->bit_stream_param & CODA_BIT_STREAM_END_FLAG) &&
-		(buf->sequence == (ctx->qsequence - 1)));
-}
-
 void coda_m2m_buf_done(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 		       enum vb2_buffer_state state)
 {
@@ -914,11 +907,8 @@ void coda_m2m_buf_done(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 		.type = V4L2_EVENT_EOS
 	};
 
-	if (coda_buf_is_end_of_stream(ctx, buf)) {
-		buf->flags |= V4L2_BUF_FLAG_LAST;
-
+	if (buf->flags & V4L2_BUF_FLAG_LAST)
 		v4l2_event_queue_fh(&ctx->fh, &eos_event);
-	}
 
 	v4l2_m2m_buf_done(buf, state);
 }
-- 
2.20.1

