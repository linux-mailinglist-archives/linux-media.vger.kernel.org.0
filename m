Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE2A2D085C
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgLFX56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:57:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbgLFX55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:57:57 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8727918D2;
        Mon,  7 Dec 2020 00:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298849;
        bh=u1VJInksnE3kTfxsWeu0db89Iu/hN4jqiCtRWsxTb28=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XQgsatlHN05Ng/NqcvfUPaIO0BnmmYiQ6zihCOtKozhcbOyi5euF3BzMjejx1a2l9
         IYnwLqyBkzaIzut5s+I6PORv8DrOMOCNJ6DDYZOyZAY55MTy0pN/QL8klINaOD6ars
         pBRMqNDttEz2k3TTudh3+r7BAaDt6iKiZ4LKxQH0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 21/24] media: ti-vpe: cal: Set cal_dmaqueue.pending to NULL when no pending buffer
Date:   Mon,  7 Dec 2020 01:53:50 +0200
Message-Id: <20201206235353.26968-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 14 ++++++++------
 drivers/media/platform/ti-vpe/cal.c       |  6 +++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 34dfe38dc960..438447728b46 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -491,12 +491,15 @@ static void cal_release_buffers(struct cal_ctx *ctx,
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
@@ -510,12 +513,11 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
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
index 3e0a69bb7fe5..547dffcfe68f 100644
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

