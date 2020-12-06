Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84F42D085D
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgLFX6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:58:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgLFX6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:58:13 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3B3F19B0;
        Mon,  7 Dec 2020 00:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298850;
        bh=R8WQBbj9+nO3JH2rv+uPcIB/tVvwtoJMpn9i13IsDLs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mYaP+hUWTgmOcnMtFeaG+552v7o0Aw/OvaFPCjfBkWCWKZmI+KL/YyzSvpFMERyHS
         rZm3jZyu7y6JCpHPX9HwSIo3STCBZVcYW/A9OJKURUAA/aKKdTrF4OZgq3eOTa/SeO
         del6sWEdYD2YXCdx5CqZRkbWZ1wfedMcVJ5yXHqk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 22/24] media: ti-vpe: cal: Store buffer DMA address in dma_addr_t
Date:   Mon,  7 Dec 2020 01:53:51 +0200
Message-Id: <20201206235353.26968-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dma_addr_t is the correct type to store DMA addresses. Replace incorrect
usage of unsigned long and unsigned int.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 2 +-
 drivers/media/platform/ti-vpe/cal.c       | 6 +++---
 drivers/media/platform/ti-vpe/cal.h       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 438447728b46..511767dd69bd 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -508,7 +508,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	struct cal_buffer *buf;
-	unsigned long addr;
+	dma_addr_t addr;
 	int ret;
 
 	spin_lock_irq(&ctx->dma.lock);
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 547dffcfe68f..3cf625262d32 100644
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
index 9d3cbc13f915..26916f72fd60 100644
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

