Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F4631B4BA
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhBOEgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:36:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBOEgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:36:46 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5654F1AC3;
        Mon, 15 Feb 2021 05:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363327;
        bh=XqAffRlpM8Nn0p+9uV21cHsYMihwTMhqVNwl6r/PO7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U/Il6aZS+A2ZWL9kdyrOOUg1sttpohfoxPW+C8FKzH4cgT5FHsr8GlL7+rHn1exz6
         7ILhIXUjy/2nI9VU71O/KRyvGobLgK4iyRyXXBAWHtCvoc4fVrfbfa0kvmH+QA+oxo
         MDiMVjftVFGo4QYebrMn4nz0WQ/hxmc6om8c6pr4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 47/77] media: imx: imx7-media-csi: Merge all config in imx7_csi_configure()
Date:   Mon, 15 Feb 2021 06:27:11 +0200
Message-Id: <20210215042741.28850-48-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Merge all the configuration steps (imx7_csi_buf_stride_set(),
imx7_csi_deinterlace_enable(), imx7_csi_set_imagpara() and
imx7_csi_init_default()) in the imx7_csi_configure() function. This
simplifies the configuration procedure by removing most
read-update-write cycles, and makes the code generally more readable.

imx7_csi_init_default() is kept as it is also called from
imx7_csi_deinit(). This will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 202 +++++++++------------
 1 file changed, 88 insertions(+), 114 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index ac6763f8810d..9c1e4c8754e2 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -305,23 +305,6 @@ static void imx7_csi_rx_fifo_clear(struct imx7_csi *csi)
 	imx7_csi_reg_write(csi, cr1 | BIT_FCC, CSI_CSICR1);
 }
 
-static void imx7_csi_buf_stride_set(struct imx7_csi *csi, u32 stride)
-{
-	imx7_csi_reg_write(csi, stride, CSI_CSIFBUF_PARA);
-}
-
-static void imx7_csi_deinterlace_enable(struct imx7_csi *csi, bool enable)
-{
-	u32 cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
-
-	if (enable)
-		cr18 |= BIT_DEINTERLACE_EN;
-	else
-		cr18 &= ~BIT_DEINTERLACE_EN;
-
-	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
-}
-
 static void imx7_csi_dmareq_rff_enable(struct imx7_csi *csi)
 {
 	u32 cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
@@ -348,21 +331,6 @@ static void imx7_csi_dmareq_rff_disable(struct imx7_csi *csi)
 	imx7_csi_reg_write(csi, cr3, CSI_CSICR3);
 }
 
-static void imx7_csi_set_imagpara(struct imx7_csi *csi, int width, int height)
-{
-	int imag_para;
-	int rx_count;
-
-	rx_count = (width * height) >> 2;
-	imx7_csi_reg_write(csi, rx_count, CSI_CSIRXCNT);
-
-	imag_para = BIT_IMAGE_WIDTH(width) | BIT_IMAGE_HEIGHT(height);
-	imx7_csi_reg_write(csi, imag_para, CSI_CSIIMAG_PARA);
-
-	/* reflash the embedded DMA controller */
-	imx7_csi_dma_reflash(csi);
-}
-
 static void imx7_csi_sw_reset(struct imx7_csi *csi)
 {
 	imx7_csi_hw_disable(csi);
@@ -482,93 +450,101 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
 	struct v4l2_pix_format *out_pix = &vdev->fmt;
-	u32 cr1, cr18;
 	int width = out_pix->width;
-
-	if (out_pix->field == V4L2_FIELD_INTERLACED) {
-		imx7_csi_deinterlace_enable(csi, true);
-		imx7_csi_buf_stride_set(csi, out_pix->width);
-	} else {
-		imx7_csi_deinterlace_enable(csi, false);
-		imx7_csi_buf_stride_set(csi, 0);
-	}
+	u32 cr1, cr18;
+	u32 stride;
 
 	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
 
+	if (out_pix->field == V4L2_FIELD_INTERLACED) {
+		cr18 |= BIT_DEINTERLACE_EN;
+		stride = out_pix->width;
+	} else {
+		cr18 &= ~BIT_DEINTERLACE_EN;
+		stride = 0;
+	}
+
 	if (!csi->is_csi2) {
+		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_GCLK_MODE | BIT_HSYNC_POL
+		    | BIT_FCC | BIT_MCLKDIV(1) | BIT_MCLKEN;
+
+		cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
+			BIT_BASEADDR_CHG_ERR_EN;
+
 		if (out_pix->pixelformat == V4L2_PIX_FMT_UYVY ||
 		    out_pix->pixelformat == V4L2_PIX_FMT_YUYV)
 			width *= 2;
-
-		imx7_csi_set_imagpara(csi, width, out_pix->height);
-
-		cr18 |= (BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
-			BIT_BASEADDR_CHG_ERR_EN);
-		imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
-
-		return;
-	}
-
-	imx7_csi_set_imagpara(csi, width, out_pix->height);
-
-	cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
-	cr1 &= ~BIT_GCLK_MODE;
-
-	cr18 &= BIT_MIPI_DATA_FORMAT_MASK;
-	cr18 |= BIT_DATA_FROM_MIPI;
-
-	switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
-	case MEDIA_BUS_FMT_Y8_1X8:
-	case MEDIA_BUS_FMT_SBGGR8_1X8:
-	case MEDIA_BUS_FMT_SGBRG8_1X8:
-	case MEDIA_BUS_FMT_SGRBG8_1X8:
-	case MEDIA_BUS_FMT_SRGGB8_1X8:
-		cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
-		break;
-	case MEDIA_BUS_FMT_Y10_1X10:
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-	case MEDIA_BUS_FMT_SGBRG10_1X10:
-	case MEDIA_BUS_FMT_SGRBG10_1X10:
-	case MEDIA_BUS_FMT_SRGGB10_1X10:
-		cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
-		break;
-	case MEDIA_BUS_FMT_Y12_1X12:
-	case MEDIA_BUS_FMT_SBGGR12_1X12:
-	case MEDIA_BUS_FMT_SGBRG12_1X12:
-	case MEDIA_BUS_FMT_SGRBG12_1X12:
-	case MEDIA_BUS_FMT_SRGGB12_1X12:
-		cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
-		break;
-	case MEDIA_BUS_FMT_Y14_1X14:
-	case MEDIA_BUS_FMT_SBGGR14_1X14:
-	case MEDIA_BUS_FMT_SGBRG14_1X14:
-	case MEDIA_BUS_FMT_SGRBG14_1X14:
-	case MEDIA_BUS_FMT_SRGGB14_1X14:
-		cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
-		break;
-	/*
-	 * CSI-2 sources are supposed to use the 1X16 formats, but not all of
-	 * them comply. Support both variants.
-	 */
-	case MEDIA_BUS_FMT_UYVY8_2X8:
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_YUYV8_1X16:
-		cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
-		break;
-	}
-
-	switch (out_pix->pixelformat) {
-	case V4L2_PIX_FMT_Y10:
-	case V4L2_PIX_FMT_Y12:
-	case V4L2_PIX_FMT_SBGGR8:
-	case V4L2_PIX_FMT_SBGGR16:
-		cr1 |= BIT_PIXEL_BIT;
-		break;
+	} else {
+		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC
+		    | BIT_MCLKDIV(1) | BIT_MCLKEN;
+
+		cr18 &= BIT_MIPI_DATA_FORMAT_MASK;
+		cr18 |= BIT_DATA_FROM_MIPI;
+
+		switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
+		case MEDIA_BUS_FMT_Y8_1X8:
+		case MEDIA_BUS_FMT_SBGGR8_1X8:
+		case MEDIA_BUS_FMT_SGBRG8_1X8:
+		case MEDIA_BUS_FMT_SGRBG8_1X8:
+		case MEDIA_BUS_FMT_SRGGB8_1X8:
+			cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
+			break;
+		case MEDIA_BUS_FMT_Y10_1X10:
+		case MEDIA_BUS_FMT_SBGGR10_1X10:
+		case MEDIA_BUS_FMT_SGBRG10_1X10:
+		case MEDIA_BUS_FMT_SGRBG10_1X10:
+		case MEDIA_BUS_FMT_SRGGB10_1X10:
+			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
+			break;
+		case MEDIA_BUS_FMT_Y12_1X12:
+		case MEDIA_BUS_FMT_SBGGR12_1X12:
+		case MEDIA_BUS_FMT_SGBRG12_1X12:
+		case MEDIA_BUS_FMT_SGRBG12_1X12:
+		case MEDIA_BUS_FMT_SRGGB12_1X12:
+			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
+			break;
+		case MEDIA_BUS_FMT_Y14_1X14:
+		case MEDIA_BUS_FMT_SBGGR14_1X14:
+		case MEDIA_BUS_FMT_SGBRG14_1X14:
+		case MEDIA_BUS_FMT_SGRBG14_1X14:
+		case MEDIA_BUS_FMT_SRGGB14_1X14:
+			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
+			break;
+		/*
+		 * CSI-2 sources are supposed to use the 1X16 formats, but not
+		 * all of them comply. Support both variants.
+		 */
+		case MEDIA_BUS_FMT_UYVY8_2X8:
+		case MEDIA_BUS_FMT_UYVY8_1X16:
+		case MEDIA_BUS_FMT_YUYV8_2X8:
+		case MEDIA_BUS_FMT_YUYV8_1X16:
+			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
+			break;
+		}
+
+		switch (out_pix->pixelformat) {
+		case V4L2_PIX_FMT_Y10:
+		case V4L2_PIX_FMT_Y12:
+		case V4L2_PIX_FMT_SBGGR8:
+		case V4L2_PIX_FMT_SBGGR16:
+			cr1 |= BIT_PIXEL_BIT;
+			break;
+		}
 	}
 
 	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
+	imx7_csi_reg_write(csi, 0, CSI_CSICR2);
+	imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
 	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
+
+	imx7_csi_reg_write(csi, (width * out_pix->height) >> 2, CSI_CSIRXCNT);
+	imx7_csi_reg_write(csi, BIT_IMAGE_WIDTH(width) |
+			   BIT_IMAGE_HEIGHT(out_pix->height),
+			   CSI_CSIIMAG_PARA);
+	imx7_csi_reg_write(csi, stride, CSI_CSIFBUF_PARA);
+
+	/* reflash the embedded DMA controller */
+	imx7_csi_dma_reflash(csi);
 }
 
 static int imx7_csi_init(struct imx7_csi *csi)
@@ -579,14 +555,12 @@ static int imx7_csi_init(struct imx7_csi *csi)
 	if (ret < 0)
 		return ret;
 
-	imx7_csi_init_default(csi);
-	imx7_csi_dmareq_rff_enable(csi);
-
-	ret = imx7_csi_dma_setup(csi);
-	if (ret < 0)
-		return ret;
-
 	imx7_csi_configure(csi);
+	imx7_csi_dmareq_rff_enable(csi);
+
+	ret = imx7_csi_dma_setup(csi);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

