Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144901F8BC4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgFOACD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728250AbgFOACB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:02:01 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E4C6F7F;
        Mon, 15 Jun 2020 02:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179254;
        bh=i9Ugj0rbkknuWPIZTdIE6eP4wSQfPUR7jeQrJXEJ1eQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uBVSsdo8n/DcKjbmCb0qhUbboCexk+iqjsBEyP6/wo9vRBF4FIGilD5hRQEtrIYh7
         70M8ta7fTWHVoLBSIBtpl7DkDgEjLVjbmnE/SMbLMZ+JnpdB+GK8VNldmJgeXALZxR
         dM24EuDx+h77+h3ZWcW1UFxpP5xv3VADfdHlkgmQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 092/107] media: ti-vpe: cal: Don't pass format to cal_ctx_wr_dma_config()
Date:   Mon, 15 Jun 2020 02:59:29 +0300
Message-Id: <20200614235944.17716-93-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_ctx_wr_dma_config() function has access to the context, there's
no need to give it format-related values retrieved from the context.
Access the values internally, and reword internal comments. The comment
regarding the CAL_WR_DMA_OFST register not being well understood is
dropped, as the datasheet explicitly documents it as "Offset between two
consecutive line starts".

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c |  3 +--
 drivers/media/platform/ti-vpe/cal.c       | 25 +++++++++--------------
 drivers/media/platform/ti-vpe/cal.h       |  3 +--
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 1ada27d42da1..083389635269 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -516,8 +516,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	cal_ctx_csi2_config(ctx);
 	cal_ctx_pix_proc_config(ctx);
-	cal_ctx_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
-			      ctx->v_fmt.fmt.pix.height);
+	cal_ctx_wr_dma_config(ctx);
 
 	cal_camerarx_enable_irqs(ctx->phy);
 
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ad6e8a1e352b..860e393f3d21 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -356,14 +356,15 @@ void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 		cal_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
 }
 
-void cal_ctx_wr_dma_config(struct cal_ctx *ctx, unsigned int width,
-			    unsigned int height)
+void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 {
+	unsigned int stride = ctx->v_fmt.fmt.pix.bytesperline;
 	u32 val;
 
 	val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
 	cal_set_field(&val, ctx->cport, CAL_WR_DMA_CTRL_CPORT_MASK);
-	cal_set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
+	cal_set_field(&val, ctx->v_fmt.fmt.pix.height,
+		      CAL_WR_DMA_CTRL_YSIZE_MASK);
 	cal_set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
 		      CAL_WR_DMA_CTRL_DTAG_MASK);
 	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
@@ -375,14 +376,8 @@ void cal_ctx_wr_dma_config(struct cal_ctx *ctx, unsigned int width,
 	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->index,
 		cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index)));
 
-	/*
-	 * width/16 not sure but giving it a whirl.
-	 * zero does not work right
-	 */
-	cal_write_field(ctx->cal,
-			CAL_WR_DMA_OFST(ctx->index),
-			(width / 16),
-			CAL_WR_DMA_OFST_MASK);
+	cal_write_field(ctx->cal, CAL_WR_DMA_OFST(ctx->index),
+			stride / 16, CAL_WR_DMA_OFST_MASK);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_OFST(%d) = 0x%08x\n", ctx->index,
 		cal_read(ctx->cal, CAL_WR_DMA_OFST(ctx->index)));
 
@@ -390,11 +385,11 @@ void cal_ctx_wr_dma_config(struct cal_ctx *ctx, unsigned int width,
 	/* 64 bit word means no skipping */
 	cal_set_field(&val, 0, CAL_WR_DMA_XSIZE_XSKIP_MASK);
 	/*
-	 * (width*8)/64 this should be size of an entire line
-	 * in 64bit word but 0 means all data until the end
-	 * is detected automagically
+	 * The XSIZE field is expressed in 64-bit units and prevents overflows
+	 * in case of synchronization issues by limiting the number of bytes
+	 * written per line.
 	 */
-	cal_set_field(&val, (width / 8), CAL_WR_DMA_XSIZE_MASK);
+	cal_set_field(&val, stride / 8, CAL_WR_DMA_XSIZE_MASK);
 	cal_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->index,
 		cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index)));
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 66168f8fe724..2fcd5ba2da28 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -273,8 +273,7 @@ void cal_camerarx_destroy(struct cal_camerarx *phy);
 
 void cal_ctx_csi2_config(struct cal_ctx *ctx);
 void cal_ctx_pix_proc_config(struct cal_ctx *ctx);
-void cal_ctx_wr_dma_config(struct cal_ctx *ctx, unsigned int width,
-			   unsigned int height);
+void cal_ctx_wr_dma_config(struct cal_ctx *ctx);
 void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr);
 
 int cal_ctx_v4l2_register(struct cal_ctx *ctx);
-- 
Regards,

Laurent Pinchart

