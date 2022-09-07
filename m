Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 431565B0CFC
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 21:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiIGTQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 15:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiIGTQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 15:16:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C39BFC65
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 12:16:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98D8A883;
        Wed,  7 Sep 2022 21:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662578166;
        bh=ga/XQTyDxRsShQeLA6Uq+LUHj3YPF/k5p9BSXrLg51A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WKO8nJLMmwLcVSVZO1Od1dAlw2mh4ayNjjHoK45EUVcFAmK6s/SYvc0Vdy1fAIaCO
         0j1gyuuhnAHtSBW1U89BTA1IzKi8K5squtmLaC6IcltY1XZp0RG+WbODDzYfbGrrGx
         3QkhDCl912/mAsR31moTtEXo5XxMjL2FKS2rB+wo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 2/3] media: imx: imx7-media-csi: Rename phys variables to dma_addr
Date:   Wed,  7 Sep 2022 22:15:46 +0300
Message-Id: <20220907191547.19255-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220907191547.19255-1-laurent.pinchart@ideasonboard.com>
References: <20220907191547.19255-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All the phys variables and structure fields store a DMA address, not a
physical address. Even if the two are effectively identical on all
platforms where this driver is used due to the lack of IOMMU, rename the
variables to dma_addr to make their usage clearer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 1aef2cf41745..03986445c0da 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -200,7 +200,7 @@ to_imx7_csi_vb2_buffer(struct vb2_buffer *vb)
 
 struct imx7_csi_dma_buf {
 	void *virt;
-	dma_addr_t phys;
+	dma_addr_t dma_addr;
 	unsigned long len;
 };
 
@@ -384,13 +384,13 @@ static void imx7_csi_dmareq_rff_disable(struct imx7_csi *csi)
 	imx7_csi_reg_write(csi, cr3, CSI_CSICR3);
 }
 
-static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t phys,
+static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t dma_addr,
 				int buf_num)
 {
 	if (buf_num == 1)
-		imx7_csi_reg_write(csi, phys, CSI_CSIDMASA_FB2);
+		imx7_csi_reg_write(csi, dma_addr, CSI_CSIDMASA_FB2);
 	else
-		imx7_csi_reg_write(csi, phys, CSI_CSIDMASA_FB1);
+		imx7_csi_reg_write(csi, dma_addr, CSI_CSIDMASA_FB1);
 }
 
 static struct imx7_csi_vb2_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi);
@@ -402,19 +402,19 @@ static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 	int i;
 
 	for (i = 0; i < 2; i++) {
-		dma_addr_t phys;
+		dma_addr_t dma_addr;
 
 		buf = imx7_csi_video_next_buf(csi);
 		if (buf) {
 			csi->active_vb2_buf[i] = buf;
 			vb2_buf = &buf->vbuf.vb2_buf;
-			phys = vb2_dma_contig_plane_dma_addr(vb2_buf, 0);
+			dma_addr = vb2_dma_contig_plane_dma_addr(vb2_buf, 0);
 		} else {
 			csi->active_vb2_buf[i] = NULL;
-			phys = csi->underrun_buf.phys;
+			dma_addr = csi->underrun_buf.dma_addr;
 		}
 
-		imx7_csi_update_buf(csi, phys, i);
+		imx7_csi_update_buf(csi, dma_addr, i);
 	}
 }
 
@@ -441,10 +441,10 @@ static void imx7_csi_free_dma_buf(struct imx7_csi *csi,
 				  struct imx7_csi_dma_buf *buf)
 {
 	if (buf->virt)
-		dma_free_coherent(csi->dev, buf->len, buf->virt, buf->phys);
+		dma_free_coherent(csi->dev, buf->len, buf->virt, buf->dma_addr);
 
 	buf->virt = NULL;
-	buf->phys = 0;
+	buf->dma_addr = 0;
 }
 
 static int imx7_csi_alloc_dma_buf(struct imx7_csi *csi,
@@ -453,7 +453,7 @@ static int imx7_csi_alloc_dma_buf(struct imx7_csi *csi,
 	imx7_csi_free_dma_buf(csi, buf);
 
 	buf->len = PAGE_ALIGN(size);
-	buf->virt = dma_alloc_coherent(csi->dev, buf->len, &buf->phys,
+	buf->virt = dma_alloc_coherent(csi->dev, buf->len, &buf->dma_addr,
 				       GFP_DMA | GFP_KERNEL);
 	if (!buf->virt)
 		return -ENOMEM;
@@ -714,7 +714,7 @@ static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 {
 	struct imx7_csi_vb2_buffer *done, *next;
 	struct vb2_buffer *vb;
-	dma_addr_t phys;
+	dma_addr_t dma_addr;
 
 	done = csi->active_vb2_buf[csi->buf_num];
 	if (done) {
@@ -729,14 +729,14 @@ static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 	/* get next queued buffer */
 	next = imx7_csi_video_next_buf(csi);
 	if (next) {
-		phys = vb2_dma_contig_plane_dma_addr(&next->vbuf.vb2_buf, 0);
+		dma_addr = vb2_dma_contig_plane_dma_addr(&next->vbuf.vb2_buf, 0);
 		csi->active_vb2_buf[csi->buf_num] = next;
 	} else {
-		phys = csi->underrun_buf.phys;
+		dma_addr = csi->underrun_buf.dma_addr;
 		csi->active_vb2_buf[csi->buf_num] = NULL;
 	}
 
-	imx7_csi_update_buf(csi, phys, csi->buf_num);
+	imx7_csi_update_buf(csi, dma_addr, csi->buf_num);
 }
 
 static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
@@ -1301,14 +1301,14 @@ static bool imx7_csi_fast_track_buffer(struct imx7_csi *csi,
 				       struct imx7_csi_vb2_buffer *buf)
 {
 	unsigned long flags;
-	dma_addr_t phys;
+	dma_addr_t dma_addr;
 	int buf_num;
 	u32 isr;
 
 	if (!csi->is_streaming)
 		return false;
 
-	phys = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
+	dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
 
 	/*
 	 * buf_num holds the framebuffer ID of the most recently (*not* the next
@@ -1345,7 +1345,7 @@ static bool imx7_csi_fast_track_buffer(struct imx7_csi *csi,
 		return false;
 	}
 
-	imx7_csi_update_buf(csi, phys, buf_num);
+	imx7_csi_update_buf(csi, dma_addr, buf_num);
 
 	isr = imx7_csi_reg_read(csi, CSI_CSISR);
 	if (isr & (buf_num ? BIT_DMA_TSF_DONE_FB1 : BIT_DMA_TSF_DONE_FB2)) {
-- 
Regards,

Laurent Pinchart

