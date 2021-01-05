Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFC72EAEC6
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbhAEPhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:37:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbhAEPhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:37:54 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A9801BDB;
        Tue,  5 Jan 2021 16:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860613;
        bh=KrM2/mZWOF1bc5wLlkUytTj0Rq5As2PW/jhwS5v+U1s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DW0zOpv1UegkitD2z02Rwv4wjiMv3ZpknZoEyn+eHFrzz3buIeRrYsGnmsKT/6Cv6
         0UnRp2VFmAjyHb7jQ+lc50WysMz+WA2yQVtsyKGdsL73mZB11VKJtI+FumH4uWPpcv
         8LPrFdsZaRh/l+DCxCk69ILHXh/JvzUwDHtOjbu0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 53/75] media: imx: imx7-media-csi: Don't enable SOF and EOF interrupts
Date:   Tue,  5 Jan 2021 17:28:30 +0200
Message-Id: <20210105152852.5733-54-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The SOF and EOF interrupts are not used. Don't enable them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 30 ++++++++--------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 7aec88b27915..b13c4c17382c 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -240,15 +240,10 @@ static void imx7_csi_hw_enable_irq(struct imx7_csi *csi)
 {
 	u32 cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
 
-	cr1 |= BIT_SOF_INTEN;
 	cr1 |= BIT_RFF_OR_INT;
-
-	/* still capture needs DMA interrupt */
 	cr1 |= BIT_FB1_DMA_DONE_INTEN;
 	cr1 |= BIT_FB2_DMA_DONE_INTEN;
 
-	cr1 |= BIT_EOF_INT_EN;
-
 	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
 }
 
@@ -256,11 +251,9 @@ static void imx7_csi_hw_disable_irq(struct imx7_csi *csi)
 {
 	u32 cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
 
-	cr1 &= ~BIT_SOF_INTEN;
 	cr1 &= ~BIT_RFF_OR_INT;
 	cr1 &= ~BIT_FB1_DMA_DONE_INTEN;
 	cr1 &= ~BIT_FB2_DMA_DONE_INTEN;
-	cr1 &= ~BIT_EOF_INT_EN;
 
 	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
 }
@@ -322,17 +315,6 @@ static void imx7_csi_dmareq_rff_disable(struct imx7_csi *csi)
 	imx7_csi_reg_write(csi, cr3, CSI_CSICR3);
 }
 
-static void imx7_csi_sw_reset(struct imx7_csi *csi)
-{
-	imx7_csi_rx_fifo_clear(csi);
-
-	imx7_csi_dma_reflash(csi);
-
-	usleep_range(2000, 3000);
-
-	imx7_csi_irq_clear(csi);
-}
-
 static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t phys,
 				int buf_num)
 {
@@ -559,10 +541,18 @@ static void imx7_csi_deinit(struct imx7_csi *csi)
 
 static void imx7_csi_enable(struct imx7_csi *csi)
 {
-	imx7_csi_sw_reset(csi);
+	/* Clear the Rx FIFO and reflash the DMA controller. */
+	imx7_csi_rx_fifo_clear(csi);
+	imx7_csi_dma_reflash(csi);
 
-	imx7_csi_dmareq_rff_enable(csi);
+	usleep_range(2000, 3000);
+
+	/* Clear and enable the interrupts. */
+	imx7_csi_irq_clear(csi);
 	imx7_csi_hw_enable_irq(csi);
+
+	/* Enable the RxFIFO DMA and the CSI. */
+	imx7_csi_dmareq_rff_enable(csi);
 	imx7_csi_hw_enable(csi);
 }
 
-- 
Regards,

Laurent Pinchart

