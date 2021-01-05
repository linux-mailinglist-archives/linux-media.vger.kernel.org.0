Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226332EAEB6
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbhAEPgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:36:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbhAEPgc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:36:32 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAE361BBB;
        Tue,  5 Jan 2021 16:30:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860604;
        bh=PsQDAGv+NYvYHIpSFAmgjQDAkYg7ztRanBf+SaUPfZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dn/NFPJfkpwpiUookIuMfchx/3gnLto/cYyUZLWjkYSQ3NRvy43qmnhY3xXxtDUIa
         FCy3bhQ1fNwFqceEBHIL4mM7PdE3VhiNkXys1k2hbmJE7cvPh06VyQd0GkS6FIjMjg
         5cePfnrnLyTmy01cUAavUiJOdPm0d7ctSmaFenyU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 43/75] media: imx: imx7-media-csi: Merge hw_reset() with init_interface()
Date:   Tue,  5 Jan 2021 17:28:20 +0200
Message-Id: <20210105152852.5733-44-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7_csi_hw_reset() and imx7_csi_init_interface() functions are
always called together. Merge them. This allows simplifying the code by
avoiding duplicated register writes.

As the imx7_csi_hw_reset() function didn't perform a hardware reset by
initialized the registers to reset defaults (in addition to resetting
the frame counter), name the resulting function imx7_csi_init_default()
as it sets default values.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 37 +++++++---------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 8680f5d9ff71..0bdd169c3801 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -212,17 +212,6 @@ static void imx7_csi_reg_write(struct imx7_csi *csi, unsigned int value,
 	writel(value, csi->regbase + offset);
 }
 
-static void imx7_csi_hw_reset(struct imx7_csi *csi)
-{
-	imx7_csi_reg_write(csi,
-			   imx7_csi_reg_read(csi, CSI_CSICR3) | BIT_FRMCNT_RST,
-			   CSI_CSICR3);
-
-	imx7_csi_reg_write(csi, BIT_EXT_VSYNC | BIT_HSYNC_POL, CSI_CSICR1);
-	imx7_csi_reg_write(csi, 0, CSI_CSICR2);
-	imx7_csi_reg_write(csi, 0, CSI_CSICR3);
-}
-
 static u32 imx7_csi_irq_clear(struct imx7_csi *csi)
 {
 	u32 isr;
@@ -233,20 +222,18 @@ static u32 imx7_csi_irq_clear(struct imx7_csi *csi)
 	return isr;
 }
 
-static void imx7_csi_init_interface(struct imx7_csi *csi)
+static void imx7_csi_init_default(struct imx7_csi *csi)
 {
-	unsigned int val = 0;
-	unsigned int imag_para;
+	imx7_csi_reg_write(csi, BIT_SOF_POL | BIT_REDGE | BIT_GCLK_MODE |
+			   BIT_HSYNC_POL | BIT_FCC | BIT_MCLKDIV(1) |
+			   BIT_MCLKEN, CSI_CSICR1);
+	imx7_csi_reg_write(csi, 0, CSI_CSICR2);
+	imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
 
-	val = BIT_SOF_POL | BIT_REDGE | BIT_GCLK_MODE | BIT_HSYNC_POL |
-		BIT_FCC | BIT_MCLKDIV(1) | BIT_MCLKEN;
-	imx7_csi_reg_write(csi, val, CSI_CSICR1);
+	imx7_csi_reg_write(csi, BIT_IMAGE_WIDTH(800) | BIT_IMAGE_HEIGHT(600),
+			   CSI_CSIIMAG_PARA);
 
-	imag_para = BIT_IMAGE_WIDTH(800) | BIT_IMAGE_HEIGHT(600);
-	imx7_csi_reg_write(csi, imag_para, CSI_CSIIMAG_PARA);
-
-	val = BIT_DMA_REFLASH_RFF;
-	imx7_csi_reg_write(csi, val, CSI_CSICR3);
+	imx7_csi_reg_write(csi, BIT_DMA_REFLASH_RFF, CSI_CSICR3);
 }
 
 static void imx7_csi_hw_enable_irq(struct imx7_csi *csi)
@@ -578,8 +565,7 @@ static int imx7_csi_init(struct imx7_csi *csi)
 	if (ret < 0)
 		return ret;
 
-	imx7_csi_hw_reset(csi);
-	imx7_csi_init_interface(csi);
+	imx7_csi_init_default(csi);
 	imx7_csi_dmareq_rff_enable(csi);
 
 	ret = imx7_csi_dma_setup(csi);
@@ -594,8 +580,7 @@ static int imx7_csi_init(struct imx7_csi *csi)
 static void imx7_csi_deinit(struct imx7_csi *csi)
 {
 	imx7_csi_dma_cleanup(csi);
-	imx7_csi_hw_reset(csi);
-	imx7_csi_init_interface(csi);
+	imx7_csi_init_default(csi);
 	imx7_csi_dmareq_rff_disable(csi);
 	clk_disable_unprepare(csi->mclk);
 }
-- 
Regards,

Laurent Pinchart

