Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3E4215EDB
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbgGFSjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730047AbgGFSjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:17 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28C3925D6;
        Mon,  6 Jul 2020 20:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060715;
        bh=jcyZenTjmU7jNsOIpLFZJX3e8lNVtHe6ReG37eR31fI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fe2l34U7F+8Zydo0aZ2fpAmS4IAmG3W/HX3y6s29W2nvrcAydnSDgdCKsN81l5thr
         tZYbb7dhdHPnmC0+TuhxOyDC0GB/tpC19Jwpiqyl31bMX+3E8OAKV9e+UOz41xgMWp
         HH1GNfHqgk64OMeTQd2vdN0l1CBa8htSSC60IaS8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 105/108] media: ti-vpe: cal: Set cal_dmaqueue.pending to NULL when no pending buffer
Date:   Mon,  6 Jul 2020 21:37:06 +0300
Message-Id: <20200706183709.12238-106-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Benoit Parrot <bparrot@ti.com>
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

