Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C569215ED3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730031AbgGFSjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730026AbgGFSjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:10 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22F602177;
        Mon,  6 Jul 2020 20:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060711;
        bh=1nY71wsvqOuCUvvlnrWcbYW6WF7qi06lkKdcuMVBfAw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=joEXH1MyU3uZ8oRvBFaFGDFHuWDP/Gufksu4ubSi0+9I2HBkx41yyDNDluqZiUBKa
         ocqHH5rPvIEsTSeRVTAM7dNwTIqrWTJ81Kx6arWhwyHyvoX5lUj9vRntaI+4UTqm3z
         X6pLN/u+M7vVa8STacRwRrYiGTD93PPlp7CAFAOA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 096/108] media: ti-vpe: cal: Fold PPI enable in CAMERARX .s_stream()
Date:   Mon,  6 Jul 2020 21:36:57 +0300
Message-Id: <20200706183709.12238-97-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To further decouple the context and CAMERARX components, move the call
to cal_camerarx_ppi_enable() from cal_start_streaming() to the CAMERARX
.s_stream() operation. The DMA destination address has to be set before
starting the CAMERARX, which is desirable anyway.

cal_camerarx_ppi_disable() will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 31 +++++++++++---------
 drivers/media/platform/ti-vpe/cal-video.c    |  4 +--
 drivers/media/platform/ti-vpe/cal.h          |  1 -
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index ce46046c9ba4..941efa99e3b5 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -256,6 +256,20 @@ static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance), 0);
 }
 
+static void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
+{
+	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+		  CAL_CSI2_PPI_CTRL_FRAME_MASK);
+	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
+}
+
+void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
+{
+	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
+}
+
 static int cal_camerarx_start(struct cal_camerarx *phy)
 {
 	s64 external_rate;
@@ -384,6 +398,9 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	 * implemented.
 	 */
 
+	/* Finally, enable the PHY Protocol Interface (PPI). */
+	cal_camerarx_ppi_enable(phy);
+
 	return 0;
 }
 
@@ -455,20 +472,6 @@ void cal_camerarx_i913_errata(struct cal_camerarx *phy)
 	camerarx_write(phy, CAL_CSI2_PHY_REG10, reg10);
 }
 
-void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
-{
-	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
-		  CAL_CSI2_PPI_CTRL_FRAME_MASK);
-	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
-			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
-}
-
-void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
-{
-	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
-			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
-}
-
 static int cal_camerarx_regmap_init(struct cal_dev *cal,
 				    struct cal_camerarx *phy)
 {
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 3807d91f0392..627d816548b8 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -517,15 +517,13 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_csi2_config(ctx);
 	cal_ctx_pix_proc_config(ctx);
 	cal_ctx_wr_dma_config(ctx);
+	cal_ctx_wr_dma_addr(ctx, addr);
 	cal_ctx_enable_irqs(ctx);
 
 	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
 	if (ret)
 		goto err;
 
-	cal_ctx_wr_dma_addr(ctx, addr);
-	cal_camerarx_ppi_enable(ctx->phy);
-
 	if (cal_debug >= 4)
 		cal_quickdump_regs(ctx->cal);
 
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 3b99cf928f6b..cfa99e643ce6 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -262,7 +262,6 @@ const struct cal_format_info *cal_format_by_code(u32 code);
 void cal_quickdump_regs(struct cal_dev *cal);
 
 void cal_camerarx_disable(struct cal_camerarx *phy);
-void cal_camerarx_ppi_enable(struct cal_camerarx *phy);
 void cal_camerarx_ppi_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
-- 
Regards,

Laurent Pinchart

