Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A89231B4B8
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhBOEgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:36:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhBOEg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:36:27 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F30BE1ABD;
        Mon, 15 Feb 2021 05:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363325;
        bh=JfTvVABhlt3Csu3jsi2JcHP9eSz1nhnVgworFD9KI24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nHp6jw5y/0uDz2TSzlvFVnfYbuz9R9Pajw3+36h59sSSccVidNT3Owu32u1dRRNqg
         XeEIz949GGV0dzWd84hP1X6dNh10J+cStpMR5/e3pHhGWEvkUe8xthk9EfUSeuBIHE
         oW0qdZXyeYpMDFxMLp3wQdwWX60mro15tuOXKYFQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 44/77] media: imx: imx7-media-csi: Merge hw_reset() with init_interface()
Date:   Mon, 15 Feb 2021 06:27:08 +0200
Message-Id: <20210215042741.28850-45-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 37 +++++++---------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 53bab0a0a878..0ad18885542b 100644
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

