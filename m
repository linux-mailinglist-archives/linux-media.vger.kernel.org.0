Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57AF64A764
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730076AbfFRQqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:46:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54067 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730001AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-T6; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 15/28] media: coda: increment sequence offset for the last returned frame
Date:   Tue, 18 Jun 2019 18:45:22 +0200
Message-Id: <20190618164535.20162-16-p.zabel@pengutronix.de>
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

If no more frames are decoded in bitstream end mode, and a previously
decoded frame has been returned, the firmware still increments the frame
number. To avoid a sequence number mismatch after decoder restart,
increment the sequence_offset correction parameter.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 843f92312f47..bfe6019e68a8 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2280,6 +2280,9 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 		else if (ctx->display_idx < 0)
 			ctx->hold = true;
 	} else if (decoded_idx == -2) {
+		if (ctx->display_idx >= 0 &&
+		    ctx->display_idx < ctx->num_internal_frames)
+			ctx->sequence_offset++;
 		/* no frame was decoded, we still return remaining buffers */
 	} else if (decoded_idx < 0 || decoded_idx >= ctx->num_internal_frames) {
 		v4l2_err(&dev->v4l2_dev,
-- 
2.20.1

