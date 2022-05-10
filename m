Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C775214A5
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241482AbiEJMDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241477AbiEJMDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7476F5418B
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:53 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0759B1224;
        Tue, 10 May 2022 13:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183978;
        bh=OjRGMuHjDHAG1XZV5zDaeOrnmZ9X52Jw4ZXN1k9DDgM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WyoZW3fkLiKCrsxoy4eVEBTfrHcMZPiY9HggNw2GtDYGTwNfsf3FJbcq/UWb4/4Ry
         g6NnV7Nahz3twyYDqGe4dWweiQzS/0v+y9ulMAM+1TcC3FcbzM2w2NNr8YM9Vucu+x
         SOQ/Y6yH/d3/qzgRApoUiu41qoDFy3pOiTs8pOec=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 33/50] staging: media: imx: imx7-media-csi: Import format helpers
Date:   Tue, 10 May 2022 14:58:42 +0300
Message-Id: <20220510115859.19777-34-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for code refactoring, copy the format helpers used by this
driver from imx-media-utils.c. Rename structures and functions to avoid
name clashes, no functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 660 +++++++++++++++++++--
 1 file changed, 615 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index e5dc9525fa52..42f1485b3550 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -174,6 +174,23 @@ enum imx_csi_model {
 	IMX7_CSI_IMX8MQ,
 };
 
+struct imx7_csi_pixfmt {
+	/* the in-memory FourCC pixel format */
+	u32     fourcc;
+	/*
+	 * the set of equivalent media bus codes for the fourcc.
+	 * NOTE! codes pointer is NULL for in-memory-only formats.
+	 */
+	const u32 *codes;
+	int     bpp;     /* total bpp */
+	/* cycles per pixel for generic (bayer) formats for the parallel bus */
+	int	cycles;
+	enum ipu_color_space cs;
+	bool    planar;  /* is a planar format */
+	bool    bayer;   /* is a raw bayer format */
+	bool    ipufmt;  /* is one of the IPU internal formats */
+};
+
 struct imx7_csi_vb2_buffer {
 	struct vb2_v4l2_buffer vbuf;
 	struct list_head list;
@@ -218,14 +235,14 @@ struct imx7_csi {
 	struct media_pad pad[IMX7_CSI_PADS_NUM];
 
 	struct v4l2_mbus_framefmt format_mbus[IMX7_CSI_PADS_NUM];
-	const struct imx_media_pixfmt *cc[IMX7_CSI_PADS_NUM];
+	const struct imx7_csi_pixfmt *cc[IMX7_CSI_PADS_NUM];
 
 	/* Video device */
 	struct video_device *vdev;		/* Video device */
 	struct media_pad vdev_pad;		/* Video device pad */
 
 	struct v4l2_pix_format vdev_fmt;	/* The user format */
-	const struct imx_media_pixfmt *vdev_cc;
+	const struct imx7_csi_pixfmt *vdev_cc;
 	struct v4l2_rect vdev_compose;		/* The compose rectangle */
 
 	struct mutex vdev_mutex;		/* Protect vdev operations */
@@ -784,30 +801,518 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/* -----------------------------------------------------------------------------
+ * Format Helpers
+ */
+
+#define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
+
+enum imx7_csi_pixfmt_sel {
+	IMX7_CSI_PIXFMT_SEL_YUV   = BIT(0), /* select YUV formats */
+	IMX7_CSI_PIXFMT_SEL_RGB   = BIT(1), /* select RGB formats */
+	IMX7_CSI_PIXFMT_SEL_BAYER = BIT(2), /* select BAYER formats */
+	IMX7_CSI_PIXFMT_SEL_IPU   = BIT(3), /* select IPU-internal formats */
+	IMX7_CSI_PIXFMT_SEL_YUV_RGB = IMX7_CSI_PIXFMT_SEL_YUV
+				    | IMX7_CSI_PIXFMT_SEL_RGB,
+	IMX7_CSI_PIXFMT_SEL_ANY = IMX7_CSI_PIXFMT_SEL_YUV
+				| IMX7_CSI_PIXFMT_SEL_RGB
+				| IMX7_CSI_PIXFMT_SEL_BAYER,
+};
+
+/*
+ * List of supported pixel formats for the subdevs.
+ */
+static const struct imx7_csi_pixfmt pixel_formats[] = {
+	/*** YUV formats start here ***/
+	{
+		.fourcc	= V4L2_PIX_FMT_UYVY,
+		.codes  = IMX_BUS_FMTS(
+			MEDIA_BUS_FMT_UYVY8_2X8,
+			MEDIA_BUS_FMT_UYVY8_1X16
+		),
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 16,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_YUYV,
+		.codes  = IMX_BUS_FMTS(
+			MEDIA_BUS_FMT_YUYV8_2X8,
+			MEDIA_BUS_FMT_YUYV8_1X16
+		),
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 16,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_YUV420,
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 12,
+		.planar = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU420,
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 12,
+		.planar = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV422P,
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 16,
+		.planar = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 12,
+		.planar = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 16,
+		.planar = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV32,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_AYUV8_1X32),
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 32,
+		.ipufmt = true,
+	},
+	/*** RGB formats start here ***/
+	{
+		.fourcc	= V4L2_PIX_FMT_RGB565,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.cycles = 2,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_RGB24,
+		.codes  = IMX_BUS_FMTS(
+			MEDIA_BUS_FMT_RGB888_1X24,
+			MEDIA_BUS_FMT_RGB888_2X12_LE
+		),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 24,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_BGR24,
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 24,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_XRGB32,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_XRGB32,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
+		.ipufmt = true,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_XBGR32,
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_BGRX32,
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_RGBX32,
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
+	},
+	/*** raw bayer and grayscale formats start here ***/
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 8,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 8,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 8,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 8,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR16,
+		.codes  = IMX_BUS_FMTS(
+			MEDIA_BUS_FMT_SBGGR10_1X10,
+			MEDIA_BUS_FMT_SBGGR12_1X12,
+			MEDIA_BUS_FMT_SBGGR14_1X14,
+			MEDIA_BUS_FMT_SBGGR16_1X16
+		),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG16,
+		.codes  = IMX_BUS_FMTS(
+			MEDIA_BUS_FMT_SGBRG10_1X10,
+			MEDIA_BUS_FMT_SGBRG12_1X12,
+			MEDIA_BUS_FMT_SGBRG14_1X14,
+			MEDIA_BUS_FMT_SGBRG16_1X16
+		),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG16,
+		.codes  = IMX_BUS_FMTS(
+			MEDIA_BUS_FMT_SGRBG10_1X10,
+			MEDIA_BUS_FMT_SGRBG12_1X12,
+			MEDIA_BUS_FMT_SGRBG14_1X14,
+			MEDIA_BUS_FMT_SGRBG16_1X16
+		),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB16,
+		.codes  = IMX_BUS_FMTS(
+			MEDIA_BUS_FMT_SRGGB10_1X10,
+			MEDIA_BUS_FMT_SRGGB12_1X12,
+			MEDIA_BUS_FMT_SRGGB14_1X14,
+			MEDIA_BUS_FMT_SRGGB16_1X16
+		),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.codes = IMX_BUS_FMTS(
+			MEDIA_BUS_FMT_Y8_1X8,
+			MEDIA_BUS_FMT_Y10_1X10,
+			MEDIA_BUS_FMT_Y12_1X12
+		),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 8,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y10,
+		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y12,
+		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	},
+};
+
+/*
+ * Search in the pixel_formats[] array for an entry with the given fourcc
+ * that matches the requested selection criteria and return it.
+ *
+ * @fourcc: Search for an entry with the given fourcc pixel format.
+ * @fmt_sel: Allow entries only with the given selection criteria.
+ */
+static const struct imx7_csi_pixfmt *
+imx7_csi_find_pixel_format(u32 fourcc, enum imx7_csi_pixfmt_sel fmt_sel)
+{
+	bool sel_ipu = fmt_sel & IMX7_CSI_PIXFMT_SEL_IPU;
+	unsigned int i;
+
+	fmt_sel &= ~IMX7_CSI_PIXFMT_SEL_IPU;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
+		enum imx7_csi_pixfmt_sel sel;
+
+		if (sel_ipu != fmt->ipufmt)
+			continue;
+
+		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 IMX7_CSI_PIXFMT_SEL_YUV : IMX7_CSI_PIXFMT_SEL_RGB);
+
+		if ((fmt_sel & sel) && fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+/*
+ * Search in the pixel_formats[] array for an entry with the given media
+ * bus code that matches the requested selection criteria and return it.
+ *
+ * @code: Search for an entry with the given media-bus code.
+ * @fmt_sel: Allow entries only with the given selection criteria.
+ */
+static const struct imx7_csi_pixfmt *
+imx7_csi_find_mbus_format(u32 code, enum imx7_csi_pixfmt_sel fmt_sel)
+{
+	bool sel_ipu = fmt_sel & IMX7_CSI_PIXFMT_SEL_IPU;
+	unsigned int i;
+
+	fmt_sel &= ~IMX7_CSI_PIXFMT_SEL_IPU;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
+		enum imx7_csi_pixfmt_sel sel;
+		unsigned int j;
+
+		if (sel_ipu != fmt->ipufmt)
+			continue;
+
+		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 IMX7_CSI_PIXFMT_SEL_YUV : IMX7_CSI_PIXFMT_SEL_RGB);
+
+		if (!(fmt_sel & sel) || !fmt->codes)
+			continue;
+
+		for (j = 0; fmt->codes[j]; j++) {
+			if (code == fmt->codes[j])
+				return fmt;
+		}
+	}
+
+	return NULL;
+}
+
+static inline const struct imx7_csi_pixfmt *
+imx7_csi_find_ipu_format(u32 code, enum imx7_csi_pixfmt_sel fmt_sel)
+{
+	return imx7_csi_find_mbus_format(code, fmt_sel | IMX7_CSI_PIXFMT_SEL_IPU);
+}
+
+/*
+ * Enumerate entries in the pixel_formats[] array that match the
+ * requested selection criteria. Return the fourcc that matches the
+ * selection criteria at the requested match index.
+ *
+ * @fourcc: The returned fourcc that matches the search criteria at
+ *          the requested match index.
+ * @index: The requested match index.
+ * @fmt_sel: Include in the enumeration entries with the given selection
+ *           criteria.
+ * @code: If non-zero, only include in the enumeration entries matching this
+ *	media bus code.
+ */
+static int imx7_csi_enum_pixel_formats(u32 *fourcc, u32 index,
+				       enum imx7_csi_pixfmt_sel fmt_sel,
+				       u32 code)
+{
+	bool sel_ipu = fmt_sel & IMX7_CSI_PIXFMT_SEL_IPU;
+	unsigned int i;
+
+	fmt_sel &= ~IMX7_CSI_PIXFMT_SEL_IPU;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
+		enum imx7_csi_pixfmt_sel sel;
+
+		if (sel_ipu != fmt->ipufmt)
+			continue;
+
+		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 IMX7_CSI_PIXFMT_SEL_YUV : IMX7_CSI_PIXFMT_SEL_RGB);
+
+		if (!(fmt_sel & sel))
+			continue;
+
+		/*
+		 * If a media bus code is specified, only consider formats that
+		 * match it.
+		 */
+		if (code) {
+			unsigned int j;
+
+			if (!fmt->codes)
+				continue;
+
+			for (j = 0; fmt->codes[j]; j++) {
+				if (code == fmt->codes[j])
+					break;
+			}
+
+			if (!fmt->codes[j])
+				continue;
+		}
+
+		if (index == 0) {
+			*fourcc = fmt->fourcc;
+			return 0;
+		}
+
+		index--;
+	}
+
+	return -EINVAL;
+}
+
+/*
+ * Enumerate entries in the pixel_formats[] array that match the
+ * requested search criteria. Return the media-bus code that matches
+ * the search criteria at the requested match index.
+ *
+ * @code: The returned media-bus code that matches the search criteria at
+ *        the requested match index.
+ * @index: The requested match index.
+ * @fmt_sel: Include in the enumeration entries with the given selection
+ *           criteria.
+ */
+static int imx7_csi_enum_mbus_formats(u32 *code, u32 index,
+				      enum imx7_csi_pixfmt_sel fmt_sel)
+{
+	bool sel_ipu = fmt_sel & IMX7_CSI_PIXFMT_SEL_IPU;
+	unsigned int i;
+
+	fmt_sel &= ~IMX7_CSI_PIXFMT_SEL_IPU;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
+		enum imx7_csi_pixfmt_sel sel;
+		unsigned int j;
+
+		if (sel_ipu != fmt->ipufmt)
+			continue;
+
+		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 IMX7_CSI_PIXFMT_SEL_YUV : IMX7_CSI_PIXFMT_SEL_RGB);
+
+		if (!(fmt_sel & sel) || !fmt->codes)
+			continue;
+
+		for (j = 0; fmt->codes[j]; j++) {
+			if (index == 0) {
+				*code = fmt->codes[j];
+				return 0;
+			}
+
+			index--;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int imx7_csi_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
+				  u32 width, u32 height, u32 code, u32 field,
+				  const struct imx7_csi_pixfmt **cc)
+{
+	const struct imx7_csi_pixfmt *lcc;
+
+	mbus->width = width;
+	mbus->height = height;
+	mbus->field = field;
+
+	if (code == 0)
+		imx7_csi_enum_mbus_formats(&code, 0, IMX7_CSI_PIXFMT_SEL_YUV);
+
+	lcc = imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_ANY);
+	if (!lcc) {
+		lcc = imx7_csi_find_ipu_format(code, IMX7_CSI_PIXFMT_SEL_YUV_RGB);
+		if (!lcc)
+			return -EINVAL;
+	}
+
+	mbus->code = code;
+
+	mbus->colorspace = V4L2_COLORSPACE_SRGB;
+	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
+	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
+	mbus->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(lcc->cs == IPUV3_COLORSPACE_RGB,
+					      mbus->colorspace,
+					      mbus->ycbcr_enc);
+
+	if (cc)
+		*cc = lcc;
+
+	return 0;
+}
+
+static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+					const struct v4l2_mbus_framefmt *mbus,
+					const struct imx7_csi_pixfmt *cc)
+{
+	u32 width;
+	u32 stride;
+
+	if (!cc) {
+		cc = imx7_csi_find_ipu_format(mbus->code,
+					      IMX7_CSI_PIXFMT_SEL_YUV_RGB);
+		if (!cc)
+			cc = imx7_csi_find_mbus_format(mbus->code,
+						       IMX7_CSI_PIXFMT_SEL_ANY);
+		if (!cc)
+			return -EINVAL;
+	}
+
+	/*
+	 * TODO: the IPU currently does not support the AYUV32 format,
+	 * so until it does convert to a supported YUV format.
+	 */
+	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
+		u32 code;
+
+		imx7_csi_enum_mbus_formats(&code, 0, IMX7_CSI_PIXFMT_SEL_YUV);
+		cc = imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_YUV);
+	}
+
+	/* Round up width for minimum burst size */
+	width = round_up(mbus->width, 8);
+
+	/* Round up stride for IDMAC line start address alignment */
+	if (cc->planar)
+		stride = round_up(width, 16);
+	else
+		stride = round_up((width * cc->bpp) >> 3, 8);
+
+	pix->width = width;
+	pix->height = mbus->height;
+	pix->pixelformat = cc->fourcc;
+	pix->colorspace = mbus->colorspace;
+	pix->xfer_func = mbus->xfer_func;
+	pix->ycbcr_enc = mbus->ycbcr_enc;
+	pix->quantization = mbus->quantization;
+	pix->field = mbus->field;
+	pix->bytesperline = stride;
+	pix->sizeimage = cc->planar ? ((stride * pix->height * cc->bpp) >> 3) :
+			 stride * pix->height;
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Video Capture Device - IOCTLs
  */
 
-static const struct imx_media_pixfmt *
+static const struct imx7_csi_pixfmt *
 imx7_csi_video_find_format(u32 code, u32 fourcc)
 {
-	const struct imx_media_pixfmt *cc;
+	const struct imx7_csi_pixfmt *cc;
 
-	cc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV_RGB);
+	cc = imx7_csi_find_ipu_format(code, IMX7_CSI_PIXFMT_SEL_YUV_RGB);
 	if (cc) {
-		enum imx_pixfmt_sel fmt_sel = cc->cs == IPUV3_COLORSPACE_YUV
-					    ? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
+		enum imx7_csi_pixfmt_sel fmt_sel = cc->cs == IPUV3_COLORSPACE_YUV
+						 ? IMX7_CSI_PIXFMT_SEL_YUV
+						 : IMX7_CSI_PIXFMT_SEL_RGB;
 
-		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
+		cc = imx7_csi_find_pixel_format(fourcc, fmt_sel);
 		if (!cc) {
-			imx_media_enum_pixel_formats(&fourcc, 0, fmt_sel, 0);
-			cc = imx_media_find_pixel_format(fourcc, fmt_sel);
+			imx7_csi_enum_pixel_formats(&fourcc, 0, fmt_sel, 0);
+			cc = imx7_csi_find_pixel_format(fourcc, fmt_sel);
 		}
 
 		return cc;
 	}
 
-	return imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
+	return imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_ANY);
 }
 
 static int imx7_csi_video_querycap(struct file *file, void *fh,
@@ -826,19 +1331,21 @@ static int imx7_csi_video_querycap(struct file *file, void *fh,
 static int imx7_csi_video_enum_fmt_vid_cap(struct file *file, void *fh,
 					   struct v4l2_fmtdesc *f)
 {
-	return imx_media_enum_pixel_formats(&f->pixelformat, f->index,
-					    PIXFMT_SEL_ANY, f->mbus_code);
+	return imx7_csi_enum_pixel_formats(&f->pixelformat, f->index,
+					   IMX7_CSI_PIXFMT_SEL_ANY,
+					   f->mbus_code);
 }
 
 static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
 					  struct v4l2_frmsizeenum *fsize)
 {
-	const struct imx_media_pixfmt *cc;
+	const struct imx7_csi_pixfmt *cc;
 
 	if (fsize->index > 0)
 		return -EINVAL;
 
-	cc = imx_media_find_pixel_format(fsize->pixel_format, PIXFMT_SEL_ANY);
+	cc = imx7_csi_find_pixel_format(fsize->pixel_format,
+					IMX7_CSI_PIXFMT_SEL_ANY);
 	if (!cc)
 		return -EINVAL;
 
@@ -868,23 +1375,24 @@ static int imx7_csi_video_g_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static const struct imx_media_pixfmt *
+static const struct imx7_csi_pixfmt *
 __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 			 struct v4l2_rect *compose)
 {
 	struct v4l2_mbus_framefmt fmt_src;
-	const struct imx_media_pixfmt *cc;
+	const struct imx7_csi_pixfmt *cc;
 
 	/*
 	 * Find the pixel format, default to the first supported format if not
 	 * found.
 	 */
-	cc = imx_media_find_pixel_format(pixfmt->pixelformat, PIXFMT_SEL_ANY);
+	cc = imx7_csi_find_pixel_format(pixfmt->pixelformat,
+					IMX7_CSI_PIXFMT_SEL_ANY);
 	if (!cc) {
-		imx_media_enum_pixel_formats(&pixfmt->pixelformat, 0,
-					     PIXFMT_SEL_ANY, 0);
-		cc = imx_media_find_pixel_format(pixfmt->pixelformat,
-						 PIXFMT_SEL_ANY);
+		imx7_csi_enum_pixel_formats(&pixfmt->pixelformat, 0,
+					    IMX7_CSI_PIXFMT_SEL_ANY, 0);
+		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat,
+						IMX7_CSI_PIXFMT_SEL_ANY);
 	}
 
 	/* Allow IDMAC interweave but enforce field order from source. */
@@ -902,7 +1410,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	}
 
 	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
-	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
 
 	if (compose) {
 		compose->width = fmt_src.width;
@@ -923,7 +1431,7 @@ static int imx7_csi_video_s_fmt_vid_cap(struct file *file, void *fh,
 					struct v4l2_format *f)
 {
 	struct imx7_csi *csi = video_drvdata(file);
-	const struct imx_media_pixfmt *cc;
+	const struct imx7_csi_pixfmt *cc;
 
 	if (vb2_is_busy(&csi->q)) {
 		dev_err(csi->dev, "%s queue busy\n", __func__);
@@ -1084,7 +1592,7 @@ static void imx7_csi_video_buf_queue(struct vb2_buffer *vb)
 static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 {
 	struct v4l2_subdev_format fmt_src;
-	const struct imx_media_pixfmt *cc;
+	const struct imx7_csi_pixfmt *cc;
 	int ret;
 
 	/* Retrieve the media bus format on the source subdev. */
@@ -1279,12 +1787,12 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
 	fmt_src.format.width = IMX7_CSI_VIDEO_DEF_PIX_WIDTH;
 	fmt_src.format.height = IMX7_CSI_VIDEO_DEF_PIX_HEIGHT;
 
-	imx_media_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &fmt_src.format, NULL);
+	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &fmt_src.format, NULL);
 	csi->vdev_compose.width = fmt_src.format.width;
 	csi->vdev_compose.height = fmt_src.format.height;
 
-	csi->vdev_cc = imx_media_find_pixel_format(csi->vdev_fmt.pixelformat,
-						   PIXFMT_SEL_ANY);
+	csi->vdev_cc = imx7_csi_find_pixel_format(csi->vdev_fmt.pixelformat,
+						  IMX7_CSI_PIXFMT_SEL_ANY);
 
 	return 0;
 }
@@ -1466,8 +1974,8 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 		struct v4l2_mbus_framefmt *mf =
 			imx7_csi_get_format(csi, sd_state, i, which);
 
-		ret = imx_media_init_mbus_fmt(mf, 800, 600, 0, V4L2_FIELD_NONE,
-					      &csi->cc[i]);
+		ret = imx7_csi_init_mbus_fmt(mf, 800, 600, 0, V4L2_FIELD_NONE,
+					     &csi->cc[i]);
 		if (ret < 0)
 			return ret;
 	}
@@ -1490,8 +1998,8 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
-		ret = imx_media_enum_mbus_formats(&code->code, code->index,
-						  PIXFMT_SEL_ANY);
+		ret = imx7_csi_enum_mbus_formats(&code->code, code->index,
+						 IMX7_CSI_PIXFMT_SEL_ANY);
 		break;
 	case IMX7_CSI_PAD_SRC:
 		if (code->index != 0) {
@@ -1536,12 +2044,74 @@ static int imx7_csi_get_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+/*
+ * Default the colorspace in tryfmt to SRGB if set to an unsupported
+ * colorspace or not initialized. Then set the remaining colorimetry
+ * parameters based on the colorspace if they are uninitialized.
+ *
+ * tryfmt->code must be set on entry.
+ *
+ * If this format is destined to be routed through the Image Converter,
+ * Y`CbCr encoding must be fixed. The IC supports only BT.601 Y`CbCr
+ * or Rec.709 Y`CbCr encoding.
+ */
+static void imx7_csi_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
+				     bool ic_route)
+{
+	const struct imx7_csi_pixfmt *cc;
+	bool is_rgb = false;
+
+	cc = imx7_csi_find_mbus_format(tryfmt->code, IMX7_CSI_PIXFMT_SEL_ANY);
+	if (!cc)
+		cc = imx7_csi_find_ipu_format(tryfmt->code,
+					      IMX7_CSI_PIXFMT_SEL_YUV_RGB);
+
+	if (cc && cc->cs == IPUV3_COLORSPACE_RGB)
+		is_rgb = true;
+
+	switch (tryfmt->colorspace) {
+	case V4L2_COLORSPACE_SMPTE170M:
+	case V4L2_COLORSPACE_REC709:
+	case V4L2_COLORSPACE_JPEG:
+	case V4L2_COLORSPACE_SRGB:
+	case V4L2_COLORSPACE_BT2020:
+	case V4L2_COLORSPACE_OPRGB:
+	case V4L2_COLORSPACE_DCI_P3:
+	case V4L2_COLORSPACE_RAW:
+		break;
+	default:
+		tryfmt->colorspace = V4L2_COLORSPACE_SRGB;
+		break;
+	}
+
+	if (tryfmt->xfer_func == V4L2_XFER_FUNC_DEFAULT)
+		tryfmt->xfer_func =
+			V4L2_MAP_XFER_FUNC_DEFAULT(tryfmt->colorspace);
+
+	if (ic_route) {
+		if (tryfmt->ycbcr_enc != V4L2_YCBCR_ENC_601 &&
+		    tryfmt->ycbcr_enc != V4L2_YCBCR_ENC_709)
+			tryfmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	} else {
+		if (tryfmt->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT) {
+			tryfmt->ycbcr_enc =
+				V4L2_MAP_YCBCR_ENC_DEFAULT(tryfmt->colorspace);
+		}
+	}
+
+	if (tryfmt->quantization == V4L2_QUANTIZATION_DEFAULT)
+		tryfmt->quantization =
+			V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb,
+						      tryfmt->colorspace,
+						      tryfmt->ycbcr_enc);
+}
+
 static int imx7_csi_try_fmt(struct imx7_csi *csi,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat,
-			    const struct imx_media_pixfmt **cc)
+			    const struct imx7_csi_pixfmt **cc)
 {
-	const struct imx_media_pixfmt *in_cc;
+	const struct imx7_csi_pixfmt *in_cc;
 	struct v4l2_mbus_framefmt *in_fmt;
 	u32 code;
 
@@ -1552,8 +2122,8 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 
 	switch (sdformat->pad) {
 	case IMX7_CSI_PAD_SRC:
-		in_cc = imx_media_find_mbus_format(in_fmt->code,
-						   PIXFMT_SEL_ANY);
+		in_cc = imx7_csi_find_mbus_format(in_fmt->code,
+						  IMX7_CSI_PIXFMT_SEL_ANY);
 
 		sdformat->format.width = in_fmt->width;
 		sdformat->format.height = in_fmt->height;
@@ -1567,13 +2137,13 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		sdformat->format.ycbcr_enc = in_fmt->ycbcr_enc;
 		break;
 	case IMX7_CSI_PAD_SINK:
-		*cc = imx_media_find_mbus_format(sdformat->format.code,
-						 PIXFMT_SEL_ANY);
+		*cc = imx7_csi_find_mbus_format(sdformat->format.code,
+						IMX7_CSI_PIXFMT_SEL_ANY);
 		if (!*cc) {
-			imx_media_enum_mbus_formats(&code, 0,
-						    PIXFMT_SEL_YUV_RGB);
-			*cc = imx_media_find_mbus_format(code,
-							 PIXFMT_SEL_YUV_RGB);
+			imx7_csi_enum_mbus_formats(&code, 0,
+						   IMX7_CSI_PIXFMT_SEL_YUV_RGB);
+			*cc = imx7_csi_find_mbus_format(code,
+							IMX7_CSI_PIXFMT_SEL_YUV_RGB);
 			sdformat->format.code = (*cc)->codes[0];
 		}
 
@@ -1584,7 +2154,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		return -EINVAL;
 	}
 
-	imx_media_try_colorimetry(&sdformat->format, false);
+	imx7_csi_try_colorimetry(&sdformat->format, false);
 
 	return 0;
 }
@@ -1594,9 +2164,9 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_format *sdformat)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	const struct imx_media_pixfmt *outcc;
+	const struct imx7_csi_pixfmt *outcc;
 	struct v4l2_mbus_framefmt *outfmt;
-	const struct imx_media_pixfmt *cc;
+	const struct imx7_csi_pixfmt *cc;
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_format format;
 	int ret = 0;
-- 
Regards,

Laurent Pinchart

