Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87CB218A272
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 19:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgCRSf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 14:35:59 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34365 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRSf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 14:35:59 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jEdXp-00011Z-Pe; Wed, 18 Mar 2020 19:35:57 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 3/6] media: coda: jpeg: add CODA960 JPEG decoder support
Date:   Wed, 18 Mar 2020 19:35:33 +0100
Message-Id: <20200318183536.15779-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318183536.15779-1-p.zabel@pengutronix.de>
References: <20200318183536.15779-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds JPEG decoding support for CODA960, handling the JPEG
hardware directly. A separate JPEG decoder video device is created due
to the separate hardware unit and different supported pixel formats.
While the hardware can not change subsampling on the fly, it can decode
4:2:2 subsampled JPEG images into YUV422P.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
[m.felsch@pengutronix.de: fix qsequence counting by explicitly
 checking for the !use_bit case]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes since v1:
 - Merge Huffman table bits and values in struct coda_huff_tab.
 - Use enum v4l2_jpeg_chroma_subsampling to describe chroma subsampling.
 - Use v4l2_err to report errors.
 - Check that the image has 3 components, and that quantization tables
   are 8-bit.
 - Fix MCU alignment of odd-sized 4:2:0 and 4:2:2 images.
---
 drivers/media/platform/Kconfig            |   1 +
 drivers/media/platform/coda/coda-common.c | 114 ++++-
 drivers/media/platform/coda/coda-jpeg.c   | 564 ++++++++++++++++++++++
 drivers/media/platform/coda/coda.h        |  10 +-
 4 files changed, 681 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index e01bbb9dd1c1..0fac2a55f3c6 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -180,6 +180,7 @@ config VIDEO_CODA
 	select SRAM
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
+	select V4L2_JPEG_HELPER
 	select V4L2_MEM2MEM_DEV
 	select GENERIC_ALLOCATOR
 	help
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 46163e524c1e..09244696f132 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -159,6 +159,7 @@ static const struct coda_codec coda9_codecs[] = {
 	CODA_CODEC(CODA9_MODE_DECODE_H264, V4L2_PIX_FMT_H264,   V4L2_PIX_FMT_YUV420, 1920, 1088),
 	CODA_CODEC(CODA9_MODE_DECODE_MP2,  V4L2_PIX_FMT_MPEG2,  V4L2_PIX_FMT_YUV420, 1920, 1088),
 	CODA_CODEC(CODA9_MODE_DECODE_MP4,  V4L2_PIX_FMT_MPEG4,  V4L2_PIX_FMT_YUV420, 1920, 1088),
+	CODA_CODEC(CODA9_MODE_DECODE_MJPG, V4L2_PIX_FMT_JPEG,	V4L2_PIX_FMT_YUV420, 8192, 8192),
 };
 
 struct coda_video_device {
@@ -252,6 +253,22 @@ static const struct coda_video_device coda9_jpeg_encoder = {
 	},
 };
 
+static const struct coda_video_device coda9_jpeg_decoder = {
+	.name = "coda-jpeg-decoder",
+	.type = CODA_INST_DECODER,
+	.ops = &coda9_jpeg_decode_ops,
+	.direct = true,
+	.src_formats = {
+		V4L2_PIX_FMT_JPEG,
+	},
+	.dst_formats = {
+		V4L2_PIX_FMT_NV12,
+		V4L2_PIX_FMT_YUV420,
+		V4L2_PIX_FMT_YVU420,
+		V4L2_PIX_FMT_YUV422P,
+	},
+};
+
 static const struct coda_video_device *codadx6_video_devices[] = {
 	&coda_bit_encoder,
 };
@@ -270,6 +287,7 @@ static const struct coda_video_device *coda7_video_devices[] = {
 
 static const struct coda_video_device *coda9_video_devices[] = {
 	&coda9_jpeg_encoder,
+	&coda9_jpeg_decoder,
 	&coda_bit_encoder,
 	&coda_bit_decoder,
 };
@@ -411,6 +429,12 @@ static int coda_querycap(struct file *file, void *priv,
 	return 0;
 }
 
+static const u32 coda_formats_420[CODA_MAX_FORMATS] = {
+		V4L2_PIX_FMT_NV12,
+		V4L2_PIX_FMT_YUV420,
+		V4L2_PIX_FMT_YVU420,
+};
+
 static int coda_enum_fmt(struct file *file, void *priv,
 			 struct v4l2_fmtdesc *f)
 {
@@ -421,9 +445,31 @@ static int coda_enum_fmt(struct file *file, void *priv,
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		formats = cvd->src_formats;
-	else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+	else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		struct coda_q_data *q_data_src;
+		struct vb2_queue *src_vq;
+
 		formats = cvd->dst_formats;
-	else
+
+		/*
+		 * If the source format is already fixed, only allow the same
+		 * chroma subsampling.
+		 */
+		q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+		src_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+					 V4L2_BUF_TYPE_VIDEO_OUTPUT);
+		if (q_data_src->fourcc == V4L2_PIX_FMT_JPEG &&
+		    vb2_is_streaming(src_vq)) {
+			if (ctx->params.jpeg_chroma_subsampling ==
+			    V4L2_JPEG_CHROMA_SUBSAMPLING_420) {
+				formats = coda_formats_420;
+			} else if (ctx->params.jpeg_chroma_subsampling ==
+				   V4L2_JPEG_CHROMA_SUBSAMPLING_422) {
+				f->pixelformat = V4L2_PIX_FMT_YUV422P;
+				return f->index ? -EINVAL : 0;
+			}
+		}
+	} else
 		return -EINVAL;
 
 	if (f->index >= CODA_MAX_FORMATS || formats[f->index] == 0)
@@ -614,12 +660,23 @@ static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 
 	/*
 	 * If the source format is already fixed, only allow the same output
-	 * resolution
+	 * resolution. When decoding JPEG images, we also have to make sure to
+	 * use the same chroma subsampling.
 	 */
 	src_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
 	if (vb2_is_streaming(src_vq)) {
 		f->fmt.pix.width = q_data_src->width;
 		f->fmt.pix.height = q_data_src->height;
+
+		if (q_data_src->fourcc == V4L2_PIX_FMT_JPEG) {
+			if (ctx->params.jpeg_chroma_subsampling ==
+			    V4L2_JPEG_CHROMA_SUBSAMPLING_420 &&
+			    f->fmt.pix.pixelformat == V4L2_PIX_FMT_YUV422P)
+				f->fmt.pix.pixelformat = V4L2_PIX_FMT_NV12;
+			else if (ctx->params.jpeg_chroma_subsampling ==
+				 V4L2_JPEG_CHROMA_SUBSAMPLING_422)
+				f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUV422P;
+		}
 	}
 
 	f->fmt.pix.colorspace = ctx->colorspace;
@@ -637,12 +694,18 @@ static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 	if (ret < 0)
 		return ret;
 
-	/* The decoders always write complete macroblocks */
+	/* The decoders always write complete macroblocks or MCUs */
 	if (ctx->inst_type == CODA_INST_DECODER) {
-		f->fmt.pix.height = round_up(f->fmt.pix.height, 16);
 		f->fmt.pix.bytesperline = round_up(f->fmt.pix.width, 16);
-		f->fmt.pix.sizeimage = f->fmt.pix.bytesperline *
-				       f->fmt.pix.height * 3 / 2;
+		f->fmt.pix.height = round_up(f->fmt.pix.height, 16);
+		if (codec->src_fourcc == V4L2_PIX_FMT_JPEG &&
+		    f->fmt.pix.pixelformat == V4L2_PIX_FMT_YUV422P) {
+			f->fmt.pix.sizeimage = f->fmt.pix.bytesperline *
+					       f->fmt.pix.height * 2;
+		} else {
+			f->fmt.pix.sizeimage = f->fmt.pix.bytesperline *
+					       f->fmt.pix.height * 3 / 2;
+		}
 
 		ret = coda_try_fmt_vdoa(ctx, f, &use_vdoa);
 		if (ret < 0)
@@ -747,6 +810,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 		/* else fall through */
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
+	case V4L2_PIX_FMT_YUV422P:
 		ctx->tiled_map_type = GDI_LINEAR_FRAME_MAP;
 		break;
 	default:
@@ -1894,6 +1958,42 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
 			}
 		}
 
+		/*
+		 * Check the first input JPEG buffer to determine chroma
+		 * subsampling.
+		 */
+		if (q_data_src->fourcc == V4L2_PIX_FMT_JPEG) {
+			buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+			ret = coda_jpeg_decode_header(ctx, &buf->vb2_buf);
+			if (ret < 0) {
+				v4l2_err(v4l2_dev,
+					 "failed to decode JPEG header: %d\n",
+					 ret);
+				goto err;
+			}
+
+			q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+			q_data_dst->width = round_up(q_data_src->width, 16);
+			q_data_dst->height = round_up(q_data_src->height, 16);
+			q_data_dst->bytesperline = q_data_dst->width;
+			if (ctx->params.jpeg_chroma_subsampling ==
+			    V4L2_JPEG_CHROMA_SUBSAMPLING_420) {
+				q_data_dst->sizeimage =
+						q_data_dst->bytesperline *
+						q_data_dst->height * 3 / 2;
+				if (q_data_dst->fourcc != V4L2_PIX_FMT_YUV420)
+					q_data_dst->fourcc = V4L2_PIX_FMT_NV12;
+			} else {
+				q_data_dst->sizeimage =
+						q_data_dst->bytesperline *
+						q_data_dst->height * 2;
+				q_data_dst->fourcc = V4L2_PIX_FMT_YUV422P;
+			}
+			q_data_dst->rect.left = 0;
+			q_data_dst->rect.top = 0;
+			q_data_dst->rect.width = q_data_src->width;
+			q_data_dst->rect.height = q_data_src->height;
+		}
 		ctx->streamon_out = 1;
 	} else {
 		ctx->streamon_cap = 1;
diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index 92234fd1f4fd..05e755207dfc 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -15,6 +15,7 @@
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-fh.h>
+#include <media/v4l2-jpeg.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
@@ -23,10 +24,12 @@
 #include "trace.h"
 
 #define SOI_MARKER	0xffd8
+#define APP9_MARKER	0xffe9
 #define DRI_MARKER	0xffdd
 #define DQT_MARKER	0xffdb
 #define DHT_MARKER	0xffc4
 #define SOF_MARKER	0xffc0
+#define SOS_MARKER	0xffda
 #define EOI_MARKER	0xffd9
 
 enum {
@@ -37,6 +40,18 @@ enum {
 	CODA9_JPEG_FORMAT_400,
 };
 
+struct coda_huff_tab {
+	u8 luma_dc[16 + 12];
+	u8 chroma_dc[16 + 12];
+	u8 luma_ac[16 + 162];
+	u8 chroma_ac[16 + 162];
+
+	/* DC Luma, DC Chroma, AC Luma, AC Chroma */
+	s16	min[4 * 16];
+	s16	max[4 * 16];
+	s8	ptr[4 * 16];
+};
+
 #define CODA9_JPEG_ENC_HUFF_DATA_SIZE	(256 + 256 + 16 + 16)
 
 /*
@@ -247,6 +262,286 @@ bool coda_jpeg_check_buffer(struct coda_ctx *ctx, struct vb2_buffer *vb)
 	return false;
 }
 
+static int coda9_jpeg_gen_dec_huff_tab(struct coda_ctx *ctx, int tab_num);
+
+int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
+{
+	struct coda_dev *dev = ctx->dev;
+	u8 *buf = vb2_plane_vaddr(vb, 0);
+	size_t len = vb2_get_plane_payload(vb, 0);
+	struct v4l2_jpeg_scan_header scan_header;
+	struct v4l2_jpeg_reference quantization_tables[4] = { 0 };
+	struct v4l2_jpeg_reference huffman_tables[4] = { 0 };
+	struct v4l2_jpeg_header header = {
+		.scan = &scan_header,
+		.quantization_tables = quantization_tables,
+		.huffman_tables = huffman_tables,
+	};
+	struct coda_q_data *q_data_src;
+	struct coda_huff_tab *huff_tab;
+	int i, j, ret;
+
+	ret = v4l2_jpeg_parse_header(buf, len, &header);
+	if (ret < 0) {
+		v4l2_err(&dev->v4l2_dev, "failed to parse header\n");
+		return ret;
+	}
+
+	ctx->params.jpeg_restart_interval = header.restart_interval;
+
+	/* check frame header */
+	if (header.frame.height > ctx->codec->max_h ||
+	    header.frame.width > ctx->codec->max_w) {
+		v4l2_err(&dev->v4l2_dev, "invalid dimensions: %dx%d\n",
+			 header.frame.width, header.frame.height);
+		return -EINVAL;
+	}
+
+	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+	if (header.frame.height != q_data_src->height ||
+	    header.frame.width != q_data_src->width) {
+		v4l2_err(&dev->v4l2_dev,
+			 "dimensions don't match format: %dx%d\n",
+			 header.frame.width, header.frame.height);
+		return -EINVAL;
+	}
+
+	if (header.frame.num_components != 3) {
+		v4l2_err(&dev->v4l2_dev,
+			 "unsupported number of components: %d\n",
+			 header.frame.num_components);
+		return -EINVAL;
+	}
+
+	/* install quantization tables */
+	if (quantization_tables[3].start) {
+		v4l2_err(&dev->v4l2_dev,
+			 "only 3 quantization tables supported\n");
+		return -EINVAL;
+	}
+	for (i = 0; i < 3; i++) {
+		if (!quantization_tables[i].start)
+			continue;
+		if (quantization_tables[i].length != 64) {
+			v4l2_err(&dev->v4l2_dev,
+				 "only 8-bit quantization tables supported\n");
+			continue;
+		}
+		if (!ctx->params.jpeg_qmat_tab[i])
+			ctx->params.jpeg_qmat_tab[i] = kmalloc(64, GFP_KERNEL);
+		memcpy(ctx->params.jpeg_qmat_tab[i],
+		       quantization_tables[i].start, 64);
+	}
+
+	/* install Huffman tables */
+	for (i = 0; i < 4; i++) {
+		if (!huffman_tables[i].start) {
+			v4l2_err(&dev->v4l2_dev, "missing Huffman table\n");
+			return -EINVAL;
+		}
+		if (huffman_tables[i].length != ((i & 2) ? 178 : 28)) {
+			v4l2_err(&dev->v4l2_dev,
+				 "invalid Huffman table %d length: %zu\n",
+				 i, huffman_tables[i].length);
+			return -EINVAL;
+		}
+	}
+	huff_tab = ctx->params.jpeg_huff_tab;
+	if (!huff_tab) {
+		huff_tab = kzalloc(sizeof(struct coda_huff_tab), GFP_KERNEL);
+		if (!huff_tab)
+			return -ENOMEM;
+		ctx->params.jpeg_huff_tab = huff_tab;
+	}
+	memcpy(huff_tab->luma_dc, huffman_tables[0].start, 16 + 12);
+	memcpy(huff_tab->chroma_dc, huffman_tables[1].start, 16 + 12);
+	memcpy(huff_tab->luma_ac, huffman_tables[2].start, 16 + 162);
+	memcpy(huff_tab->chroma_ac, huffman_tables[3].start, 16 + 162);
+
+	/* check scan header */
+	for (i = 0; i < scan_header.num_components; i++) {
+		struct v4l2_jpeg_scan_component_spec *scan_component;
+
+		scan_component = &scan_header.component[i];
+		for (j = 0; j < header.frame.num_components; j++) {
+			if (header.frame.component[j].component_identifier ==
+			    scan_component->component_selector)
+				break;
+		}
+		if (j == header.frame.num_components)
+			continue;
+
+		ctx->params.jpeg_huff_dc_index[j] =
+			scan_component->dc_entropy_coding_table_selector;
+		ctx->params.jpeg_huff_ac_index[j] =
+			scan_component->ac_entropy_coding_table_selector;
+	}
+
+	/* Generate Huffman table information */
+	for (i = 0; i < 4; i++)
+		coda9_jpeg_gen_dec_huff_tab(ctx, i);
+
+	/* start of entropy coded segment */
+	ctx->jpeg_ecs_offset = header.ecs_offset;
+
+	switch (header.frame.subsampling) {
+	case V4L2_JPEG_CHROMA_SUBSAMPLING_420:
+	case V4L2_JPEG_CHROMA_SUBSAMPLING_422:
+		ctx->params.jpeg_chroma_subsampling = header.frame.subsampling;
+		break;
+	default:
+		v4l2_err(&dev->v4l2_dev, "chroma subsampling not supported: %d",
+			 header.frame.subsampling);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static inline void coda9_jpeg_write_huff_values(struct coda_dev *dev, u8 *bits,
+						int num_values)
+{
+	s8 *values = (s8 *)(bits + 16);
+	int huff_length, i;
+
+	for (huff_length = 0, i = 0; i < 16; i++)
+		huff_length += bits[i];
+	for (i = huff_length; i < num_values; i++)
+		values[i] = -1;
+	for (i = 0; i < num_values; i++)
+		coda_write(dev, (s32)values[i], CODA9_REG_JPEG_HUFF_DATA);
+}
+
+static int coda9_jpeg_dec_huff_setup(struct coda_ctx *ctx)
+{
+	struct coda_huff_tab *huff_tab = ctx->params.jpeg_huff_tab;
+	struct coda_dev *dev = ctx->dev;
+	s16 *huff_min = huff_tab->min;
+	s16 *huff_max = huff_tab->max;
+	s8 *huff_ptr = huff_tab->ptr;
+	int i;
+
+	/* MIN Tables */
+	coda_write(dev, 0x003, CODA9_REG_JPEG_HUFF_CTRL);
+	coda_write(dev, 0x000, CODA9_REG_JPEG_HUFF_ADDR);
+	for (i = 0; i < 4 * 16; i++)
+		coda_write(dev, (s32)huff_min[i], CODA9_REG_JPEG_HUFF_DATA);
+
+	/* MAX Tables */
+	coda_write(dev, 0x403, CODA9_REG_JPEG_HUFF_CTRL);
+	coda_write(dev, 0x440, CODA9_REG_JPEG_HUFF_ADDR);
+	for (i = 0; i < 4 * 16; i++)
+		coda_write(dev, (s32)huff_max[i], CODA9_REG_JPEG_HUFF_DATA);
+
+	/* PTR Tables */
+	coda_write(dev, 0x803, CODA9_REG_JPEG_HUFF_CTRL);
+	coda_write(dev, 0x880, CODA9_REG_JPEG_HUFF_ADDR);
+	for (i = 0; i < 4 * 16; i++)
+		coda_write(dev, (s32)huff_ptr[i], CODA9_REG_JPEG_HUFF_DATA);
+
+	/* VAL Tables: DC Luma, DC Chroma, AC Luma, AC Chroma */
+	coda_write(dev, 0xc03, CODA9_REG_JPEG_HUFF_CTRL);
+	coda9_jpeg_write_huff_values(dev, huff_tab->luma_dc, 12);
+	coda9_jpeg_write_huff_values(dev, huff_tab->chroma_dc, 12);
+	coda9_jpeg_write_huff_values(dev, huff_tab->luma_ac, 162);
+	coda9_jpeg_write_huff_values(dev, huff_tab->chroma_ac, 162);
+	coda_write(dev, 0x000, CODA9_REG_JPEG_HUFF_CTRL);
+	return 0;
+}
+
+static inline void coda9_jpeg_write_qmat_tab(struct coda_dev *dev,
+					     u8 *qmat, int index)
+{
+	int i;
+
+	coda_write(dev, index | 0x3, CODA9_REG_JPEG_QMAT_CTRL);
+	for (i = 0; i < 64; i++)
+		coda_write(dev, qmat[i], CODA9_REG_JPEG_QMAT_DATA);
+	coda_write(dev, 0, CODA9_REG_JPEG_QMAT_CTRL);
+}
+
+static void coda9_jpeg_qmat_setup(struct coda_ctx *ctx)
+{
+	struct coda_dev *dev = ctx->dev;
+	int *qmat_index = ctx->params.jpeg_qmat_index;
+	u8 **qmat_tab = ctx->params.jpeg_qmat_tab;
+
+	coda9_jpeg_write_qmat_tab(dev, qmat_tab[qmat_index[0]], 0x00);
+	coda9_jpeg_write_qmat_tab(dev, qmat_tab[qmat_index[1]], 0x40);
+	coda9_jpeg_write_qmat_tab(dev, qmat_tab[qmat_index[2]], 0x80);
+}
+
+static void coda9_jpeg_dec_bbc_gbu_setup(struct coda_ctx *ctx,
+					 struct vb2_buffer *buf, u32 ecs_offset)
+{
+	struct coda_dev *dev = ctx->dev;
+	int page_ptr, word_ptr, bit_ptr;
+	u32 bbc_base_addr, end_addr;
+	int bbc_cur_pos;
+	int ret, val;
+
+	bbc_base_addr = vb2_dma_contig_plane_dma_addr(buf, 0);
+	end_addr = bbc_base_addr + vb2_get_plane_payload(buf, 0);
+
+	page_ptr = ecs_offset / 256;
+	word_ptr = (ecs_offset % 256) / 4;
+	if (page_ptr & 1)
+		word_ptr += 64;
+	bit_ptr = (ecs_offset % 4) * 8;
+	if (word_ptr & 1)
+		bit_ptr += 32;
+	word_ptr &= ~0x1;
+
+	coda_write(dev, end_addr, CODA9_REG_JPEG_BBC_WR_PTR);
+	coda_write(dev, bbc_base_addr, CODA9_REG_JPEG_BBC_BAS_ADDR);
+
+	/* Leave 3 256-byte page margin to avoid a BBC interrupt */
+	coda_write(dev, end_addr + 256 * 3 + 256, CODA9_REG_JPEG_BBC_END_ADDR);
+	val = DIV_ROUND_UP(vb2_plane_size(buf, 0), 256) + 3;
+	coda_write(dev, BIT(31) | val, CODA9_REG_JPEG_BBC_STRM_CTRL);
+
+	bbc_cur_pos = page_ptr;
+	coda_write(dev, bbc_cur_pos, CODA9_REG_JPEG_BBC_CUR_POS);
+	coda_write(dev, bbc_base_addr + (bbc_cur_pos << 8),
+			CODA9_REG_JPEG_BBC_EXT_ADDR);
+	coda_write(dev, (bbc_cur_pos & 1) << 6, CODA9_REG_JPEG_BBC_INT_ADDR);
+	coda_write(dev, 64, CODA9_REG_JPEG_BBC_DATA_CNT);
+	coda_write(dev, 0, CODA9_REG_JPEG_BBC_COMMAND);
+	do {
+		ret = coda_read(dev, CODA9_REG_JPEG_BBC_BUSY);
+	} while (ret == 1);
+
+	bbc_cur_pos++;
+	coda_write(dev, bbc_cur_pos, CODA9_REG_JPEG_BBC_CUR_POS);
+	coda_write(dev, bbc_base_addr + (bbc_cur_pos << 8),
+			CODA9_REG_JPEG_BBC_EXT_ADDR);
+	coda_write(dev, (bbc_cur_pos & 1) << 6, CODA9_REG_JPEG_BBC_INT_ADDR);
+	coda_write(dev, 64, CODA9_REG_JPEG_BBC_DATA_CNT);
+	coda_write(dev, 0, CODA9_REG_JPEG_BBC_COMMAND);
+	do {
+		ret = coda_read(dev, CODA9_REG_JPEG_BBC_BUSY);
+	} while (ret == 1);
+
+	bbc_cur_pos++;
+	coda_write(dev, bbc_cur_pos, CODA9_REG_JPEG_BBC_CUR_POS);
+	coda_write(dev, 1, CODA9_REG_JPEG_BBC_CTRL);
+
+	coda_write(dev, 0, CODA9_REG_JPEG_GBU_TT_CNT);
+	coda_write(dev, word_ptr, CODA9_REG_JPEG_GBU_WD_PTR);
+	coda_write(dev, 0, CODA9_REG_JPEG_GBU_BBSR);
+	coda_write(dev, 127, CODA9_REG_JPEG_GBU_BBER);
+	if (page_ptr & 1) {
+		coda_write(dev, 0, CODA9_REG_JPEG_GBU_BBIR);
+		coda_write(dev, 0, CODA9_REG_JPEG_GBU_BBHR);
+	} else {
+		coda_write(dev, 64, CODA9_REG_JPEG_GBU_BBIR);
+		coda_write(dev, 64, CODA9_REG_JPEG_GBU_BBHR);
+	}
+	coda_write(dev, 4, CODA9_REG_JPEG_GBU_CTRL);
+	coda_write(dev, bit_ptr, CODA9_REG_JPEG_GBU_FF_RPTR);
+	coda_write(dev, 3, CODA9_REG_JPEG_GBU_CTRL);
+}
+
 static const int bus_req_num[] = {
 	[CODA9_JPEG_FORMAT_420] = 2,
 	[CODA9_JPEG_FORMAT_422] = 3,
@@ -345,6 +640,71 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 #define DC_TABLE_INDEX1		    2
 #define AC_TABLE_INDEX1		    3
 
+static u8 *coda9_jpeg_get_huff_bits(struct coda_ctx *ctx, int tab_num)
+{
+	struct coda_huff_tab *huff_tab = ctx->params.jpeg_huff_tab;
+
+	if (!huff_tab)
+		return NULL;
+
+	switch (tab_num) {
+	case DC_TABLE_INDEX0: return huff_tab->luma_dc;
+	case AC_TABLE_INDEX0: return huff_tab->luma_ac;
+	case DC_TABLE_INDEX1: return huff_tab->chroma_dc;
+	case AC_TABLE_INDEX1: return huff_tab->chroma_ac;
+	}
+
+	return NULL;
+}
+
+static int coda9_jpeg_gen_dec_huff_tab(struct coda_ctx *ctx, int tab_num)
+{
+	int ptr_cnt = 0, huff_code = 0, zero_flag = 0, data_flag = 0;
+	u8 *huff_bits;
+	s16 *huff_max;
+	s16 *huff_min;
+	s8 *huff_ptr;
+	int ofs;
+	int i;
+
+	huff_bits = coda9_jpeg_get_huff_bits(ctx, tab_num);
+	if (!huff_bits)
+		return -EINVAL;
+
+	/* DC/AC Luma, DC/AC Chroma -> DC Luma/Chroma, AC Luma/Chroma */
+	ofs = ((tab_num & 1) << 1) | ((tab_num >> 1) & 1);
+	ofs *= 16;
+
+	huff_ptr = ctx->params.jpeg_huff_tab->ptr + ofs;
+	huff_max = ctx->params.jpeg_huff_tab->max + ofs;
+	huff_min = ctx->params.jpeg_huff_tab->min + ofs;
+
+	for (i = 0; i < 16; i++) {
+		if (huff_bits[i]) {
+			huff_ptr[i] = ptr_cnt;
+			ptr_cnt += huff_bits[i];
+			huff_min[i] = huff_code;
+			huff_max[i] = huff_code + (huff_bits[i] - 1);
+			data_flag = 1;
+			zero_flag = 0;
+		} else {
+			huff_ptr[i] = -1;
+			huff_min[i] = -1;
+			huff_max[i] = -1;
+			zero_flag = 1;
+		}
+
+		if (data_flag == 1) {
+			if (zero_flag == 1)
+				huff_code <<= 1;
+			else
+				huff_code = (huff_max[i] + 1) << 1;
+		}
+	}
+
+	return 0;
+}
+
 static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 {
 	struct {
@@ -880,6 +1240,13 @@ static void coda9_jpeg_finish_encode(struct coda_ctx *ctx)
 	coda_dbg(1, ctx, "job finished: encoded frame (%u)%s\n",
 		 dst_buf->sequence,
 		 (dst_buf->flags & V4L2_BUF_FLAG_LAST) ? " (last)" : "");
+
+	/*
+	 * Reset JPEG processing unit after each encode run to work
+	 * around hangups when switching context between encoder and
+	 * decoder.
+	 */
+	coda_hw_reset(ctx);
 }
 
 static void coda9_jpeg_release(struct coda_ctx *ctx)
@@ -893,6 +1260,7 @@ static void coda9_jpeg_release(struct coda_ctx *ctx)
 	for (i = 0; i < 3; i++)
 		kfree(ctx->params.jpeg_qmat_tab[i]);
 	kfree(ctx->params.jpeg_huff_data);
+	kfree(ctx->params.jpeg_huff_tab);
 }
 
 const struct coda_context_ops coda9_jpeg_encode_ops = {
@@ -903,6 +1271,202 @@ const struct coda_context_ops coda9_jpeg_encode_ops = {
 	.release = coda9_jpeg_release,
 };
 
+/*
+ * Decoder context operations
+ */
+
+static int coda9_jpeg_start_decoding(struct coda_ctx *ctx)
+{
+	ctx->params.jpeg_qmat_index[0] = 0;
+	ctx->params.jpeg_qmat_index[1] = 1;
+	ctx->params.jpeg_qmat_index[2] = 1;
+	ctx->params.jpeg_qmat_tab[0] = luma_q;
+	ctx->params.jpeg_qmat_tab[1] = chroma_q;
+	/* nothing more to do here */
+
+	/* TODO: we could already scan the first header to get the chroma
+	 * format.
+	 */
+
+	return 0;
+}
+
+static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
+{
+	struct coda_dev *dev = ctx->dev;
+	int aligned_width, aligned_height;
+	int chroma_format;
+	int ret;
+	u32 val, dst_fourcc;
+	struct coda_q_data *q_data_src, *q_data_dst;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	int chroma_interleave;
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	dst_fourcc = q_data_dst->fourcc;
+
+	if (vb2_get_plane_payload(&src_buf->vb2_buf, 0) == 0)
+		vb2_set_plane_payload(&src_buf->vb2_buf, 0,
+				      vb2_plane_size(&src_buf->vb2_buf, 0));
+
+	chroma_format = coda9_jpeg_chroma_format(q_data_dst->fourcc);
+	if (chroma_format < 0) {
+		v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
+		return chroma_format;
+	}
+
+	ret = coda_jpeg_decode_header(ctx, &src_buf->vb2_buf);
+	if (ret < 0) {
+		v4l2_err(&dev->v4l2_dev, "failed to decode JPEG header: %d\n",
+			 ret);
+
+		src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+
+		v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
+		return ret;
+	}
+
+	/* Round image dimensions to multiple of MCU size */
+	aligned_width = round_up(q_data_src->width, width_align[chroma_format]);
+	aligned_height = round_up(q_data_src->height, height_align[chroma_format]);
+	if (aligned_width != q_data_dst->bytesperline) {
+		v4l2_err(&dev->v4l2_dev, "stride mismatch: %d != %d\n",
+			 aligned_width, q_data_dst->bytesperline);
+	}
+
+	coda_set_gdi_regs(ctx);
+
+	val = ctx->params.jpeg_huff_ac_index[0] << 12 |
+	      ctx->params.jpeg_huff_ac_index[1] << 11 |
+	      ctx->params.jpeg_huff_ac_index[2] << 10 |
+	      ctx->params.jpeg_huff_dc_index[0] << 9 |
+	      ctx->params.jpeg_huff_dc_index[1] << 8 |
+	      ctx->params.jpeg_huff_dc_index[2] << 7;
+	if (ctx->params.jpeg_huff_tab)
+		val |= CODA9_JPEG_PIC_CTRL_USER_HUFFMAN_EN;
+	coda_write(dev, val, CODA9_REG_JPEG_PIC_CTRL);
+
+	coda_write(dev, aligned_width << 16 | aligned_height,
+			CODA9_REG_JPEG_PIC_SIZE);
+
+	chroma_interleave = (dst_fourcc == V4L2_PIX_FMT_NV12);
+	coda_write(dev, 0, CODA9_REG_JPEG_ROT_INFO);
+	coda_write(dev, bus_req_num[chroma_format], CODA9_REG_JPEG_OP_INFO);
+	coda_write(dev, mcu_info[chroma_format], CODA9_REG_JPEG_MCU_INFO);
+	coda_write(dev, 0, CODA9_REG_JPEG_SCL_INFO);
+	coda_write(dev, chroma_interleave, CODA9_REG_JPEG_DPB_CONFIG);
+	coda_write(dev, ctx->params.jpeg_restart_interval,
+			CODA9_REG_JPEG_RST_INTVAL);
+
+	if (ctx->params.jpeg_huff_tab) {
+		ret = coda9_jpeg_dec_huff_setup(ctx);
+		if (ret < 0) {
+			v4l2_err(&dev->v4l2_dev,
+				 "failed to set up Huffman tables: %d\n", ret);
+			v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
+			return ret;
+		}
+	}
+
+	coda9_jpeg_qmat_setup(ctx);
+
+	coda9_jpeg_dec_bbc_gbu_setup(ctx, &src_buf->vb2_buf,
+				     ctx->jpeg_ecs_offset);
+
+	coda_write(dev, 0, CODA9_REG_JPEG_RST_INDEX);
+	coda_write(dev, 0, CODA9_REG_JPEG_RST_COUNT);
+
+	coda_write(dev, 0, CODA9_REG_JPEG_DPCM_DIFF_Y);
+	coda_write(dev, 0, CODA9_REG_JPEG_DPCM_DIFF_CB);
+	coda_write(dev, 0, CODA9_REG_JPEG_DPCM_DIFF_CR);
+
+	coda_write(dev, 0, CODA9_REG_JPEG_ROT_INFO);
+
+	coda_write(dev, 1, CODA9_GDI_CONTROL);
+	do {
+		ret = coda_read(dev, CODA9_GDI_STATUS);
+	} while (!ret);
+
+	val = (chroma_format << 17) | (chroma_interleave << 16) |
+	      q_data_dst->bytesperline;
+	if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
+		val |= 3 << 20;
+	coda_write(dev, val, CODA9_GDI_INFO_CONTROL);
+
+	coda_write(dev, aligned_width << 16 | aligned_height,
+			CODA9_GDI_INFO_PIC_SIZE);
+
+	coda_write_base(ctx, q_data_dst, dst_buf, CODA9_GDI_INFO_BASE_Y);
+
+	coda_write(dev, 0, CODA9_REG_JPEG_DPB_BASE00);
+	coda_write(dev, 0, CODA9_GDI_CONTROL);
+	coda_write(dev, 1, CODA9_GDI_PIC_INIT_HOST);
+
+	trace_coda_jpeg_run(ctx, src_buf);
+
+	coda_write(dev, 1, CODA9_REG_JPEG_PIC_START);
+
+	return 0;
+}
+
+static void coda9_jpeg_finish_decode(struct coda_ctx *ctx)
+{
+	struct coda_dev *dev = ctx->dev;
+	struct vb2_v4l2_buffer *dst_buf, *src_buf;
+	struct coda_q_data *q_data_dst;
+	u32 err_mb;
+
+	err_mb = coda_read(dev, CODA9_REG_JPEG_PIC_ERRMB);
+	if (err_mb)
+		v4l2_err(&dev->v4l2_dev, "ERRMB: 0x%x\n", err_mb);
+
+	coda_write(dev, 0, CODA9_REG_JPEG_BBC_FLUSH_CMD);
+
+	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	dst_buf->sequence = ctx->osequence++;
+
+	trace_coda_jpeg_done(ctx, dst_buf);
+
+	dst_buf->flags &= ~(V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_LAST);
+	dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
+	dst_buf->flags |= src_buf->flags & V4L2_BUF_FLAG_LAST;
+
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
+
+	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, q_data_dst->sizeimage);
+
+	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+	coda_m2m_buf_done(ctx, dst_buf, err_mb ? VB2_BUF_STATE_ERROR :
+						 VB2_BUF_STATE_DONE);
+
+	coda_dbg(1, ctx, "job finished: decoded frame (%u)%s\n",
+		 dst_buf->sequence,
+		 (dst_buf->flags & V4L2_BUF_FLAG_LAST) ? " (last)" : "");
+
+	/*
+	 * Reset JPEG processing unit after each decode run to work
+	 * around hangups when switching context between encoder and
+	 * decoder.
+	 */
+	coda_hw_reset(ctx);
+}
+
+const struct coda_context_ops coda9_jpeg_decode_ops = {
+	.queue_init = coda_encoder_queue_init, /* non-bitstream operation */
+	.start_streaming = coda9_jpeg_start_decoding,
+	.prepare_run = coda9_jpeg_prepare_decode,
+	.finish_run = coda9_jpeg_finish_decode,
+	.release = coda9_jpeg_release,
+};
+
 irqreturn_t coda9_jpeg_irq_handler(int irq, void *data)
 {
 	struct coda_dev *dev = data;
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index 43bda175f517..af0f8252b0c6 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -69,7 +69,7 @@ struct coda_aux_buf {
 
 struct coda_dev {
 	struct v4l2_device	v4l2_dev;
-	struct video_device	vfd[5];
+	struct video_device	vfd[6];
 	struct device		*dev;
 	const struct coda_devtype *devtype;
 	int			firmware;
@@ -123,10 +123,15 @@ struct coda_params {
 	u8			mpeg4_inter_qp;
 	u8			gop_size;
 	int			intra_refresh;
+	enum v4l2_jpeg_chroma_subsampling jpeg_chroma_subsampling;
 	u8			jpeg_quality;
 	u8			jpeg_restart_interval;
 	u8			*jpeg_qmat_tab[3];
+	int			jpeg_qmat_index[3];
+	int			jpeg_huff_dc_index[3];
+	int			jpeg_huff_ac_index[3];
 	u32			*jpeg_huff_data;
+	struct coda_huff_tab	*jpeg_huff_tab;
 	int			codec_mode;
 	int			codec_mode_aux;
 	enum v4l2_mpeg_video_multi_slice_mode slice_mode;
@@ -238,6 +243,7 @@ struct coda_ctx {
 	struct v4l2_fh			fh;
 	int				gopcounter;
 	int				runcounter;
+	int				jpeg_ecs_offset;
 	char				vpu_header[3][64];
 	int				vpu_header_size[3];
 	struct kfifo			bitstream_fifo;
@@ -362,12 +368,14 @@ void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 				     u8 level_idc);
 
 bool coda_jpeg_check_buffer(struct coda_ctx *ctx, struct vb2_buffer *vb);
+int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb);
 int coda_jpeg_write_tables(struct coda_ctx *ctx);
 void coda_set_jpeg_compression_quality(struct coda_ctx *ctx, int quality);
 
 extern const struct coda_context_ops coda_bit_encode_ops;
 extern const struct coda_context_ops coda_bit_decode_ops;
 extern const struct coda_context_ops coda9_jpeg_encode_ops;
+extern const struct coda_context_ops coda9_jpeg_decode_ops;
 
 irqreturn_t coda_irq_handler(int irq, void *data);
 irqreturn_t coda9_jpeg_irq_handler(int irq, void *data);
-- 
2.20.1

