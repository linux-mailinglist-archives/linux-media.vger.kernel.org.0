Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C054A755
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbfFRQpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:47 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60325 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730022AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-55; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 25/28] media: coda: mark last returned frame
Date:   Tue, 18 Jun 2019 18:45:32 +0200
Message-Id: <20190618164535.20162-26-p.zabel@pengutronix.de>
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

If reordering is not enabled, the last decoded frame has to be the last
returned buffer. Otherwise wait for the firmware to report no more
frame to display. In that case the return buffer is the last one as
well, and can be reported as such.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 1157454e3bc8..167a92772c84 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2381,6 +2381,23 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 					     V4L2_BUF_FLAG_BFRAME);
 		dst_buf->flags |= ready_frame->type;
 		meta = &ready_frame->meta;
+		if (meta->last && !coda_reorder_enable(ctx)) {
+			/*
+			 * If this was the last decoded frame, and reordering
+			 * is disabled, this will be the last display frame.
+			 */
+			coda_dbg(1, ctx, "last meta, marking as last frame\n");
+			dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+		} else if (ctx->bit_stream_param & CODA_BIT_STREAM_END_FLAG &&
+			   display_idx == -1) {
+			/*
+			 * If there is no designated presentation frame anymore,
+			 * this frame has to be the last one.
+			 */
+			coda_dbg(1, ctx,
+				 "no more frames to return, marking as last frame\n");
+			dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+		}
 		dst_buf->timecode = meta->timecode;
 		dst_buf->vb2_buf.timestamp = meta->timestamp;
 
-- 
2.20.1

