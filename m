Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4899131B4AC
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbhBOEe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:34:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhBOEe4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:34:56 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DB971A64;
        Mon, 15 Feb 2021 05:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363316;
        bh=ILinmrZV7q/aQZ1LB3P4BVXggxrjs3ICoGQ0+VCR5HQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pS94OyXzn4gQPxMbyZ/68xUsMWVu8DQQ9JU8FvhZarunEiuW0XVj1sc0OXyrNw8Ca
         esIG+/JBBNGsEMS2pe9V/1J654r8F7S7VGYRcl56eVXrnCN9jpmg5FKBFcOVCgxSgW
         tmGDKQ63Bk3UbgBvMIoyBB/UJQOliqAeplK78VZk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 35/77] media: imx: imx7-media-csi: Tidy up register fields macros
Date:   Mon, 15 Feb 2021 06:26:59 +0200
Message-Id: <20210215042741.28850-36-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Describe multi-bit fields with parameterized macros where applicable,
and use them to replace manual shifts and hardcoded numerical values.
Add macros for the CSICR2 fields used in the driver.

While at it, align the indentation for all macros, and use lower-case
hex numbers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 196 +++++++++++----------
 1 file changed, 102 insertions(+), 94 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 072047e059ef..a5971b958b64 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -28,79 +28,88 @@
 #include <media/imx.h>
 #include "imx-media.h"
 
-#define IMX7_CSI_PAD_SINK	0
-#define IMX7_CSI_PAD_SRC	1
-#define IMX7_CSI_PADS_NUM	2
+#define IMX7_CSI_PAD_SINK		0
+#define IMX7_CSI_PAD_SRC		1
+#define IMX7_CSI_PADS_NUM		2
 
 /* csi control reg 1 */
-#define BIT_SWAP16_EN		BIT(31)
-#define BIT_EXT_VSYNC		BIT(30)
-#define BIT_EOF_INT_EN		BIT(29)
-#define BIT_PRP_IF_EN		BIT(28)
-#define BIT_CCIR_MODE		BIT(27)
-#define BIT_COF_INT_EN		BIT(26)
-#define BIT_SF_OR_INTEN		BIT(25)
-#define BIT_RF_OR_INTEN		BIT(24)
-#define BIT_SFF_DMA_DONE_INTEN  BIT(22)
-#define BIT_STATFF_INTEN	BIT(21)
-#define BIT_FB2_DMA_DONE_INTEN  BIT(20)
-#define BIT_FB1_DMA_DONE_INTEN  BIT(19)
-#define BIT_RXFF_INTEN		BIT(18)
-#define BIT_SOF_POL		BIT(17)
-#define BIT_SOF_INTEN		BIT(16)
-#define BIT_MCLKDIV		(0xF << 12)
-#define BIT_HSYNC_POL		BIT(11)
-#define BIT_CCIR_EN		BIT(10)
-#define BIT_MCLKEN		BIT(9)
-#define BIT_FCC			BIT(8)
-#define BIT_PACK_DIR		BIT(7)
-#define BIT_CLR_STATFIFO	BIT(6)
-#define BIT_CLR_RXFIFO		BIT(5)
-#define BIT_GCLK_MODE		BIT(4)
-#define BIT_INV_DATA		BIT(3)
-#define BIT_INV_PCLK		BIT(2)
-#define BIT_REDGE		BIT(1)
-#define BIT_PIXEL_BIT		BIT(0)
+#define BIT_SWAP16_EN			BIT(31)
+#define BIT_EXT_VSYNC			BIT(30)
+#define BIT_EOF_INT_EN			BIT(29)
+#define BIT_PRP_IF_EN			BIT(28)
+#define BIT_CCIR_MODE			BIT(27)
+#define BIT_COF_INT_EN			BIT(26)
+#define BIT_SF_OR_INTEN			BIT(25)
+#define BIT_RF_OR_INTEN			BIT(24)
+#define BIT_SFF_DMA_DONE_INTEN		BIT(22)
+#define BIT_STATFF_INTEN		BIT(21)
+#define BIT_FB2_DMA_DONE_INTEN		BIT(20)
+#define BIT_FB1_DMA_DONE_INTEN		BIT(19)
+#define BIT_RXFF_INTEN			BIT(18)
+#define BIT_SOF_POL			BIT(17)
+#define BIT_SOF_INTEN			BIT(16)
+#define BIT_MCLKDIV(n)			((n) << 12)
+#define BIT_MCLKDIV_MASK		(0xf << 12)
+#define BIT_HSYNC_POL			BIT(11)
+#define BIT_CCIR_EN			BIT(10)
+#define BIT_MCLKEN			BIT(9)
+#define BIT_FCC				BIT(8)
+#define BIT_PACK_DIR			BIT(7)
+#define BIT_CLR_STATFIFO		BIT(6)
+#define BIT_CLR_RXFIFO			BIT(5)
+#define BIT_GCLK_MODE			BIT(4)
+#define BIT_INV_DATA			BIT(3)
+#define BIT_INV_PCLK			BIT(2)
+#define BIT_REDGE			BIT(1)
+#define BIT_PIXEL_BIT			BIT(0)
 
-#define SHIFT_MCLKDIV		12
+/* control reg 2 */
+#define BIT_DMA_BURST_TYPE_RFF_INCR4	(1 << 30)
+#define BIT_DMA_BURST_TYPE_RFF_INCR8	(2 << 30)
+#define BIT_DMA_BURST_TYPE_RFF_INCR16	(3 << 30)
+#define BIT_DMA_BURST_TYPE_RFF_MASK	(3 << 30)
 
 /* control reg 3 */
-#define BIT_FRMCNT		(0xFFFF << 16)
-#define BIT_FRMCNT_RST		BIT(15)
-#define BIT_DMA_REFLASH_RFF	BIT(14)
-#define BIT_DMA_REFLASH_SFF	BIT(13)
-#define BIT_DMA_REQ_EN_RFF	BIT(12)
-#define BIT_DMA_REQ_EN_SFF	BIT(11)
-#define BIT_STATFF_LEVEL	(0x7 << 8)
-#define BIT_HRESP_ERR_EN	BIT(7)
-#define BIT_RXFF_LEVEL		(0x7 << 4)
-#define BIT_TWO_8BIT_SENSOR	BIT(3)
-#define BIT_ZERO_PACK_EN	BIT(2)
-#define BIT_ECC_INT_EN		BIT(1)
-#define BIT_ECC_AUTO_EN		BIT(0)
-
-#define SHIFT_FRMCNT		16
-#define SHIFT_RXFIFO_LEVEL	4
+#define BIT_FRMCNT(n)			((n) << 16)
+#define BIT_FRMCNT_MASK			(0xffff << 16)
+#define BIT_FRMCNT_RST			BIT(15)
+#define BIT_DMA_REFLASH_RFF		BIT(14)
+#define BIT_DMA_REFLASH_SFF		BIT(13)
+#define BIT_DMA_REQ_EN_RFF		BIT(12)
+#define BIT_DMA_REQ_EN_SFF		BIT(11)
+#define BIT_STATFF_LEVEL(n)		((n) << 8)
+#define BIT_STATFF_LEVEL_MASK		(0x7 << 8)
+#define BIT_HRESP_ERR_EN		BIT(7)
+#define BIT_RXFF_LEVEL(n)		((n) << 4)
+#define BIT_RXFF_LEVEL_MASK		(0x7 << 4)
+#define BIT_TWO_8BIT_SENSOR		BIT(3)
+#define BIT_ZERO_PACK_EN		BIT(2)
+#define BIT_ECC_INT_EN			BIT(1)
+#define BIT_ECC_AUTO_EN			BIT(0)
 
 /* csi status reg */
-#define BIT_ADDR_CH_ERR_INT	BIT(28)
-#define BIT_FIELD0_INT		BIT(27)
-#define BIT_FIELD1_INT		BIT(26)
-#define BIT_SFF_OR_INT		BIT(25)
-#define BIT_RFF_OR_INT		BIT(24)
-#define BIT_DMA_TSF_DONE_SFF	BIT(22)
-#define BIT_STATFF_INT		BIT(21)
-#define BIT_DMA_TSF_DONE_FB2	BIT(20)
-#define BIT_DMA_TSF_DONE_FB1	BIT(19)
-#define BIT_RXFF_INT		BIT(18)
-#define BIT_EOF_INT		BIT(17)
-#define BIT_SOF_INT		BIT(16)
-#define BIT_F2_INT		BIT(15)
-#define BIT_F1_INT		BIT(14)
-#define BIT_COF_INT		BIT(13)
-#define BIT_HRESP_ERR_INT	BIT(7)
-#define BIT_ECC_INT		BIT(1)
-#define BIT_DRDY		BIT(0)
+#define BIT_ADDR_CH_ERR_INT		BIT(28)
+#define BIT_FIELD0_INT			BIT(27)
+#define BIT_FIELD1_INT			BIT(26)
+#define BIT_SFF_OR_INT			BIT(25)
+#define BIT_RFF_OR_INT			BIT(24)
+#define BIT_DMA_TSF_DONE_SFF		BIT(22)
+#define BIT_STATFF_INT			BIT(21)
+#define BIT_DMA_TSF_DONE_FB2		BIT(20)
+#define BIT_DMA_TSF_DONE_FB1		BIT(19)
+#define BIT_RXFF_INT			BIT(18)
+#define BIT_EOF_INT			BIT(17)
+#define BIT_SOF_INT			BIT(16)
+#define BIT_F2_INT			BIT(15)
+#define BIT_F1_INT			BIT(14)
+#define BIT_COF_INT			BIT(13)
+#define BIT_HRESP_ERR_INT		BIT(7)
+#define BIT_ECC_INT			BIT(1)
+#define BIT_DRDY			BIT(0)
+
+/* csi image parameter reg */
+#define BIT_IMAGE_WIDTH(n)		((n) << 16)
+#define BIT_IMAGE_HEIGHT(n)		(n)
 
 /* csi control reg 18 */
 #define BIT_CSI_HW_ENABLE		BIT(31)
@@ -109,8 +118,7 @@
 #define BIT_MIPI_DATA_FORMAT_RAW12	(0x2c << 25)
 #define BIT_MIPI_DATA_FORMAT_RAW14	(0x2d << 25)
 #define BIT_MIPI_DATA_FORMAT_YUV422_8B	(0x1e << 25)
-#define BIT_MIPI_DATA_FORMAT_MASK	(0x3F << 25)
-#define BIT_MIPI_DATA_FORMAT_OFFSET	25
+#define BIT_MIPI_DATA_FORMAT_MASK	(0x3f << 25)
 #define BIT_DATA_FROM_MIPI		BIT(22)
 #define BIT_MIPI_YU_SWAP		BIT(21)
 #define BIT_MIPI_DOUBLE_CMPNT		BIT(20)
@@ -122,29 +130,29 @@
 #define BIT_TVDECODER_IN_EN		BIT(1)
 #define BIT_NTSC_EN			BIT(0)
 
-#define CSI_MCLK_VF		1
-#define CSI_MCLK_ENC		2
-#define CSI_MCLK_RAW		4
-#define CSI_MCLK_I2C		8
+#define CSI_MCLK_VF			1
+#define CSI_MCLK_ENC			2
+#define CSI_MCLK_RAW			4
+#define CSI_MCLK_I2C			8
 
-#define CSI_CSICR1		0x0
-#define CSI_CSICR2		0x4
-#define CSI_CSICR3		0x8
-#define CSI_STATFIFO		0xC
-#define CSI_CSIRXFIFO		0x10
-#define CSI_CSIRXCNT		0x14
-#define CSI_CSISR		0x18
+#define CSI_CSICR1			0x00
+#define CSI_CSICR2			0x04
+#define CSI_CSICR3			0x08
+#define CSI_STATFIFO			0x0c
+#define CSI_CSIRXFIFO			0x10
+#define CSI_CSIRXCNT			0x14
+#define CSI_CSISR			0x18
 
-#define CSI_CSIDBG		0x1C
-#define CSI_CSIDMASA_STATFIFO	0x20
-#define CSI_CSIDMATS_STATFIFO	0x24
-#define CSI_CSIDMASA_FB1	0x28
-#define CSI_CSIDMASA_FB2	0x2C
-#define CSI_CSIFBUF_PARA	0x30
-#define CSI_CSIIMAG_PARA	0x34
+#define CSI_CSIDBG			0x1c
+#define CSI_CSIDMASA_STATFIFO		0x20
+#define CSI_CSIDMATS_STATFIFO		0x24
+#define CSI_CSIDMASA_FB1		0x28
+#define CSI_CSIDMASA_FB2		0x2c
+#define CSI_CSIFBUF_PARA		0x30
+#define CSI_CSIIMAG_PARA		0x34
 
-#define CSI_CSICR18		0x48
-#define CSI_CSICR19		0x4c
+#define CSI_CSICR18			0x48
+#define CSI_CSICR19			0x4c
 
 struct imx7_csi {
 	struct device *dev;
@@ -227,10 +235,10 @@ static void imx7_csi_init_interface(struct imx7_csi *csi)
 	unsigned int imag_para;
 
 	val = BIT_SOF_POL | BIT_REDGE | BIT_GCLK_MODE | BIT_HSYNC_POL |
-		BIT_FCC | 1 << SHIFT_MCLKDIV | BIT_MCLKEN;
+		BIT_FCC | BIT_MCLKDIV(1) | BIT_MCLKEN;
 	imx7_csi_reg_write(csi, val, CSI_CSICR1);
 
-	imag_para = (800 << 16) | 600;
+	imag_para = BIT_IMAGE_WIDTH(800) | BIT_IMAGE_HEIGHT(600);
 	imx7_csi_reg_write(csi, imag_para, CSI_CSIIMAG_PARA);
 
 	val = BIT_DMA_REFLASH_RFF;
@@ -329,12 +337,12 @@ static void imx7_csi_dmareq_rff_enable(struct imx7_csi *csi)
 	u32 cr2 = imx7_csi_reg_read(csi, CSI_CSICR2);
 
 	/* Burst Type of DMA Transfer from RxFIFO. INCR16 */
-	cr2 |= 0xC0000000;
+	cr2 |= BIT_DMA_BURST_TYPE_RFF_INCR16;
 
 	cr3 |= BIT_DMA_REQ_EN_RFF;
 	cr3 |= BIT_HRESP_ERR_EN;
-	cr3 &= ~BIT_RXFF_LEVEL;
-	cr3 |= 0x2 << 4;
+	cr3 &= ~BIT_RXFF_LEVEL_MASK;
+	cr3 |= BIT_RXFF_LEVEL(2);
 
 	imx7_csi_reg_write(csi, cr3, CSI_CSICR3);
 	imx7_csi_reg_write(csi, cr2, CSI_CSICR2);
@@ -357,7 +365,7 @@ static void imx7_csi_set_imagpara(struct imx7_csi *csi, int width, int height)
 	rx_count = (width * height) >> 2;
 	imx7_csi_reg_write(csi, rx_count, CSI_CSIRXCNT);
 
-	imag_para = (width << 16) | height;
+	imag_para = BIT_IMAGE_WIDTH(width) | BIT_IMAGE_HEIGHT(height);
 	imx7_csi_reg_write(csi, imag_para, CSI_CSIIMAG_PARA);
 
 	/* reflash the embedded DMA controller */
-- 
Regards,

Laurent Pinchart

