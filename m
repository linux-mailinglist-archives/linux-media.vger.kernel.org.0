Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC4F1F8BD1
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgFOACR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728277AbgFOACQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:02:16 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2758B2147;
        Mon, 15 Jun 2020 02:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179261;
        bh=7c3Xdi3BWn4iaX8BTsegEHXxyzz6h8NtJmZ9fTFG+iU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wYlt5hC5mNGIMLLzMEwAA4dVnREZ/dXjtTW40BQxvppQqdG9frcF/PtDs00FsPDOC
         GNT/e1dvnuLB3mK/padeXr1yJ2ENBbyB8Qw0KJB8N5BTgROPqJ507nQIGBhm+NTwLB
         mV9FI2SW7RG7aX3cVmxJDdyqAg6mF150/xQ77kYs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 105/107] media: ti-vpe: cal: Store buffer DMA address in dma_addr_t
Date:   Mon, 15 Jun 2020 02:59:42 +0300
Message-Id: <20200614235944.17716-106-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dma_addr_t is the correct type to store DMA addresses. Replace incorrect
usage of unsigned long and unsigned int.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 2 +-
 drivers/media/platform/ti-vpe/cal.c       | 6 +++---
 drivers/media/platform/ti-vpe/cal.h       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 1f34e9b1aa55..0b4e5b11474d 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -509,7 +509,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	struct cal_buffer *buf;
-	unsigned long addr;
+	dma_addr_t addr;
 	int ret;
 
 	spin_lock_irq(&ctx->dma.lock);
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index c4ba52d2c196..520f9e8ec917 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -406,9 +406,9 @@ void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", cal_read(ctx->cal, CAL_CTRL));
 }
 
-void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
+void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
 {
-	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), dmaaddr);
+	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), addr);
 }
 
 void cal_ctx_wr_dma_disable(struct cal_ctx *ctx)
@@ -491,7 +491,7 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 		 * hardware.
 		 */
 		struct cal_buffer *buf;
-		unsigned long addr;
+		dma_addr_t addr;
 
 		buf = list_first_entry(&ctx->dma.queue, struct cal_buffer,
 				       list);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 2eeb01996c4e..26b5eb20fd57 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -299,7 +299,7 @@ void cal_camerarx_destroy(struct cal_camerarx *phy);
 void cal_ctx_csi2_config(struct cal_ctx *ctx);
 void cal_ctx_pix_proc_config(struct cal_ctx *ctx);
 void cal_ctx_wr_dma_config(struct cal_ctx *ctx);
-void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr);
+void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, dma_addr_t addr);
 void cal_ctx_wr_dma_disable(struct cal_ctx *ctx);
 int cal_ctx_wr_dma_stop(struct cal_ctx *ctx);
 void cal_ctx_enable_irqs(struct cal_ctx *ctx);
-- 
Regards,

Laurent Pinchart

