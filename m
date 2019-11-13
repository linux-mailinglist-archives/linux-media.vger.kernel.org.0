Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4A0CFB0E9
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 13:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfKMM6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 07:58:38 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52123 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbfKMM6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 07:58:37 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iUsEF-0000lm-VE; Wed, 13 Nov 2019 13:58:35 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH 1/4] media: coda: do not skip finish_run if aborting
Date:   Wed, 13 Nov 2019 13:58:21 +0100
Message-Id: <20191113125824.19547-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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

Always call finish_run when the hardware signals completion. This
will allow JPEG contexts to clean up even if job_abort was called
during the device_run.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c    | 6 ++++++
 drivers/media/platform/coda/coda-common.c | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 00c7bed3dd57..5475de176ce3 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -1629,6 +1629,9 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 	struct coda_dev *dev = ctx->dev;
 	u32 wr_ptr, start_ptr;
 
+	if (ctx->aborting)
+		return;
+
 	/*
 	 * Lock to make sure that an encoder stop command running in parallel
 	 * will either already have marked src_buf as last, or it will wake up
@@ -2266,6 +2269,9 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 	int err_vdoa = 0;
 	u32 val;
 
+	if (ctx->aborting)
+		return;
+
 	/* Update kfifo out pointer from coda bitstream read pointer */
 	coda_kfifo_sync_from_device(ctx);
 
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 94fb4d2ecc43..556f8e0f52d7 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1421,7 +1421,7 @@ static void coda_pic_run_work(struct work_struct *work)
 
 		if (ctx->ops->run_timeout)
 			ctx->ops->run_timeout(ctx);
-	} else if (!ctx->aborting) {
+	} else {
 		ctx->ops->finish_run(ctx);
 	}
 
-- 
2.20.1

