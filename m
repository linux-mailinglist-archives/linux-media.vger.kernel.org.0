Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFF014A74F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbfFRQpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44189 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729946AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-FO; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 06/28] media: coda: fix V4L2_DEC_CMD_STOP when all buffers are already consumed
Date:   Tue, 18 Jun 2019 18:45:13 +0200
Message-Id: <20190618164535.20162-7-p.zabel@pengutronix.de>
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

From: Marco Felsch <m.felsch@pengutronix.de>

When the DEC_CMD_STOP command is issued after the context has already
consumed all the queued buffers, we need to make sure to wake the
destination queue with last_buffer_dequeued set, to allow userspace to
make progress in its EOS handling.

As there might still be picture run workers pending at that point, we
need to synchronize with them, so the sequence number comparison reads
stable values.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
[l.stach@pengutronix.de: rewrite to fix multi-context use-cases,
 reword commit message]
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 7dbeb80d40f4..232bda4b7016 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1071,6 +1071,12 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 		coda_bit_stream_end_flag(ctx);
 		ctx->hold = false;
 		v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
+
+		flush_work(&ctx->pic_run_work);
+
+		/* If there is no buffer in flight, wake up */
+		if (!ctx->streamon_out || ctx->qsequence == ctx->osequence)
+			coda_wake_up_capture_queue(ctx);
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

