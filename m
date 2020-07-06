Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD546215E94
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbgGFSiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbgGFSiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:04 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E6FB1964;
        Mon,  6 Jul 2020 20:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060670;
        bh=uy1Paq1Fs2zyPZc7dlhi6z2pfnHB4BkDF1i+ecKUe04=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iJZJ/pz3kt+FtovmYfqudtYlSPTi0MzLbbvfjHLbGPqsu7hugbmvk89+Dwfu480aC
         asj3as+nJ2x7QG8YXDWtfhkUkoWTkqYulxCwEoF3VgNszA8p5IiEC+P28dpgD9jjnJ
         YtsYiwBy4Q7tkNyvOQBMfzSicHpxTM1nrCz9qtBg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 036/108] media: ti-vpe: cal: Create consistent naming for context functions
Date:   Mon,  6 Jul 2020 21:35:57 +0300
Message-Id: <20200706183709.12238-37-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename all functions related to contexts with a cal_ctx_ prefix to
increase readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 5b89d03d1f62..7914a0f22f0e 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1007,7 +1007,12 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
 	return regmap;
 }
 
-static void csi2_ctx_config(struct cal_ctx *ctx)
+/* ------------------------------------------------------------------
+ *	Context Management
+ * ------------------------------------------------------------------
+ */
+
+static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 {
 	u32 val;
 
@@ -1033,7 +1038,7 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
 		reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->csi2_port)));
 }
 
-static void pix_proc_config(struct cal_ctx *ctx)
+static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 {
 	u32 val, extract, pack;
 
@@ -1084,8 +1089,8 @@ static void pix_proc_config(struct cal_ctx *ctx)
 		reg_read(ctx->cal, CAL_PIX_PROC(ctx->csi2_port)));
 }
 
-static void cal_wr_dma_config(struct cal_ctx *ctx,
-			      unsigned int width, unsigned int height)
+static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
+				  unsigned int width, unsigned int height)
 {
 	u32 val;
 
@@ -1138,7 +1143,7 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
 	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", reg_read(ctx->cal, CAL_CTRL));
 }
 
-static void cal_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
+static void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 {
 	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
 }
@@ -1154,7 +1159,7 @@ static inline void cal_schedule_next_buffer(struct cal_ctx *ctx)
 	list_del(&buf->list);
 
 	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-	cal_wr_dma_addr(ctx, addr);
+	cal_ctx_wr_dma_addr(ctx, addr);
 }
 
 static inline void cal_process_buffer_complete(struct cal_ctx *ctx)
@@ -1662,10 +1667,10 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	pm_runtime_get_sync(&ctx->cal->pdev->dev);
 
-	csi2_ctx_config(ctx);
-	pix_proc_config(ctx);
-	cal_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
-			  ctx->v_fmt.fmt.pix.height);
+	cal_ctx_csi2_config(ctx);
+	cal_ctx_pix_proc_config(ctx);
+	cal_ctx_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
+			      ctx->v_fmt.fmt.pix.height);
 	cal_camerarx_lane_config(ctx->phy);
 
 	cal_camerarx_enable_irqs(ctx->phy);
@@ -1680,7 +1685,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	cal_camerarx_wait_ready(ctx->phy);
-	cal_wr_dma_addr(ctx, addr);
+	cal_ctx_wr_dma_addr(ctx, addr);
 	cal_camerarx_ppi_enable(ctx->phy);
 
 	if (debug >= 4)
-- 
Regards,

Laurent Pinchart

