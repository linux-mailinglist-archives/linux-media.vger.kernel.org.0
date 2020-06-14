Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6561F8BD0
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgFOACQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbgFOACP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:02:15 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4D0C2171;
        Mon, 15 Jun 2020 02:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179261;
        bh=TVD2rS1WEoYawPqfghMdSvDLe5WuzP3usPlbzoSCrm0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=um1G6/6bU5kQk1qp619nJQmzs+OLk7vPvUQA3X88yZfui6e68lvpY+w0OputyBUZ7
         SYR6ZKIRyj/nI5cxZvwhxpzAWBLG2U3wfYJlu/UHEUz2fyPKZn6zS5oSi2GdalAFVs
         TvOSoybhf1N0IVJqU2ORYInb4lnQIn5k5VldLgmg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 104/107] media: ti-vpe: cal: Set cal_dmaqueue.pending to NULL when no pending buffer
Date:   Mon, 15 Jun 2020 02:59:41 +0300
Message-Id: <20200614235944.17716-105-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a pending buffer becomes active, the cal_dmaqueue.active field is
updated, but the pending field keeps the same value until a new buffer
becomes pending. This requires handling the special case of
pending == active in different places. Simplify the code by setting the
pending field to NULL when the pending buffer becomes active. Buffers
are now simply moved from queue to pending and from pending to active.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 14 ++++++++------
 drivers/media/platform/ti-vpe/cal.c       |  6 +++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 996b0b94648e..1f34e9b1aa55 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -492,12 +492,15 @@ static void cal_release_buffers(struct cal_ctx *ctx,
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 
-	if (ctx->dma.pending != ctx->dma.active)
+	if (ctx->dma.pending) {
 		vb2_buffer_done(&ctx->dma.pending->vb.vb2_buf, state);
-	vb2_buffer_done(&ctx->dma.active->vb.vb2_buf, state);
+		ctx->dma.pending = NULL;
+	}
 
-	ctx->dma.active = NULL;
-	ctx->dma.pending = NULL;
+	if (ctx->dma.active) {
+		vb2_buffer_done(&ctx->dma.active->vb.vb2_buf, state);
+		ctx->dma.active = NULL;
+	}
 
 	spin_unlock_irq(&ctx->dma.lock);
 }
@@ -511,12 +514,11 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	spin_lock_irq(&ctx->dma.lock);
 	buf = list_first_entry(&ctx->dma.queue, struct cal_buffer, list);
-	ctx->dma.active = buf;
 	ctx->dma.pending = buf;
 	list_del(&buf->list);
 	spin_unlock_irq(&ctx->dma.lock);
 
-	addr = vb2_dma_contig_plane_dma_addr(&ctx->dma.active->vb.vb2_buf, 0);
+	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 	ctx->sequence = 0;
 	ctx->dma.state = CAL_DMA_RUNNING;
 
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index edecd3b4c24f..c4ba52d2c196 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -485,8 +485,7 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 		 */
 		cal_ctx_wr_dma_disable(ctx);
 		ctx->dma.state = CAL_DMA_STOP_PENDING;
-	} else if (!list_empty(&ctx->dma.queue) &&
-		   ctx->dma.active == ctx->dma.pending) {
+	} else if (!list_empty(&ctx->dma.queue) && !ctx->dma.pending) {
 		/*
 		 * Otherwise, if a new buffer is available, queue it to the
 		 * hardware.
@@ -519,9 +518,10 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 	}
 
 	/* If a new buffer was queued, complete the current buffer. */
-	if (ctx->dma.active != ctx->dma.pending) {
+	if (ctx->dma.pending) {
 		buf = ctx->dma.active;
 		ctx->dma.active = ctx->dma.pending;
+		ctx->dma.pending = NULL;
 	}
 
 	spin_unlock(&ctx->dma.lock);
-- 
Regards,

Laurent Pinchart

