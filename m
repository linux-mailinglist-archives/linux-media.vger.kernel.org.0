Return-Path: <linux-media+bounces-15658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 223E0943482
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 18:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2FF51F23C83
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 16:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE101BE87F;
	Wed, 31 Jul 2024 16:53:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DEF1BE853;
	Wed, 31 Jul 2024 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444802; cv=none; b=jfMDP3Y1ReEFlNnHg7omH2Cthy1M4NMKBqsIumGgrEcIx9IU9oLTIoAju6PbE8hK6B0Lxkhh3ttUZujF5QG+dAQO0v0JlaPFaLbXHFp+IpV2Kp8+2rNIquCTWX4VA/oAlJsP19adBeTH1HmmPkBMSO6IZ6n61UeDFbnjO4wKSj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444802; c=relaxed/simple;
	bh=61LypWXsQgnBXJQPrbfutbqDaN/7n/iaBFMg0O8qP1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UR5qy05NDMUFccJXEUYy0dbuMyjaS9mzQGH9ToLkRYCskz3o/xKMj84UW4NJoPrsd26DQu4k94l60WoealdIXDvmZRiWCcxWI/OEY6QQ6IWGrZ2sEruof6nfdjiBofMwpCgyxjQ0uojQpEpHyrTM/hj+tQ3dnMD78n1xxz1shnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 1D13B14649DB; Wed, 31 Jul 2024 18:44:28 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: linux-sunxi@lists.linux.dev
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] media: cedrus: Add JPEG decoder
Date: Wed, 31 Jul 2024 18:44:12 +0200
Message-ID: <20240731164422.206503-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240731164422.206503-1-linkmauve@linkmauve.fr>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Basically all Cedrus variants support JPEG decoding. Add code for it.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/Kconfig    |   1 +
 drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   5 +
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   2 +
 .../staging/media/sunxi/cedrus/cedrus_jpeg.c  | 352 ++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  16 +
 .../staging/media/sunxi/cedrus/cedrus_video.c |   9 +
 7 files changed, 386 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_jpeg.c

diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/staging/media/sunxi/cedrus/Kconfig
index cb07a343c9c2..5683519aead0 100644
--- a/drivers/staging/media/sunxi/cedrus/Kconfig
+++ b/drivers/staging/media/sunxi/cedrus/Kconfig
@@ -9,6 +9,7 @@ config VIDEO_SUNXI_CEDRUS
 	select SUNXI_SRAM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
+	select V4L2_JPEG_HELPER
 	help
 	  Support for the VPU found in Allwinner SoCs, also known as the Cedar
 	  video engine.
diff --git a/drivers/staging/media/sunxi/cedrus/Makefile b/drivers/staging/media/sunxi/cedrus/Makefile
index a647b3690bf8..fa3e949e0788 100644
--- a/drivers/staging/media/sunxi/cedrus/Makefile
+++ b/drivers/staging/media/sunxi/cedrus/Makefile
@@ -3,4 +3,4 @@ obj-$(CONFIG_VIDEO_SUNXI_CEDRUS) += sunxi-cedrus.o
 
 sunxi-cedrus-y = cedrus.o cedrus_video.o cedrus_hw.o cedrus_dec.o \
 		 cedrus_mpeg2.o cedrus_h264.o cedrus_h265.o \
-		 cedrus_vp8.o
+		 cedrus_vp8.o cedrus_jpeg.o
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 522c184e2afc..555f8d124d47 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -34,6 +34,7 @@
 #define CEDRUS_CAPABILITY_MPEG2_DEC	BIT(3)
 #define CEDRUS_CAPABILITY_VP8_DEC	BIT(4)
 #define CEDRUS_CAPABILITY_H265_10_DEC	BIT(5)
+#define CEDRUS_CAPABILITY_JPEG_DEC	BIT(6)
 
 enum cedrus_irq_status {
 	CEDRUS_IRQ_NONE,
@@ -152,6 +153,9 @@ struct cedrus_ctx {
 			u8		*entropy_probs_buf;
 			dma_addr_t	entropy_probs_buf_dma;
 		} vp8;
+		struct {
+			unsigned int	subsampling;
+		} jpeg;
 	} codec;
 };
 
@@ -201,6 +205,7 @@ extern struct cedrus_dec_ops cedrus_dec_ops_mpeg2;
 extern struct cedrus_dec_ops cedrus_dec_ops_h264;
 extern struct cedrus_dec_ops cedrus_dec_ops_h265;
 extern struct cedrus_dec_ops cedrus_dec_ops_vp8;
+extern struct cedrus_dec_ops cedrus_dec_ops_jpeg;
 
 static inline void cedrus_write(struct cedrus_dev *dev, u32 reg, u32 val)
 {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 582b6cb796ea..e237f7d66f7e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -43,7 +43,9 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
 	reg |= VE_MODE_DDR_MODE_BW_128;
 
 	switch (ctx->src_fmt.pixelformat) {
+	/* MPEG2 and JPEG both use the same decoding mode bit. */
 	case V4L2_PIX_FMT_MPEG2_SLICE:
+	case V4L2_PIX_FMT_JPEG:
 		reg |= VE_MODE_DEC_MPEG;
 		break;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_jpeg.c b/drivers/staging/media/sunxi/cedrus/cedrus_jpeg.c
new file mode 100644
index 000000000000..1e8978ebf9dd
--- /dev/null
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_jpeg.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cedrus VPU driver
+ *
+ * Copyright (C) 2022 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+ */
+
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-jpeg.h>
+
+#include "cedrus.h"
+#include "cedrus_hw.h"
+#include "cedrus_regs.h"
+
+static enum cedrus_irq_status cedrus_jpeg_irq_status(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+	u32 reg;
+
+	reg = cedrus_read(dev, VE_DEC_MPEG_STATUS);
+	reg &= VE_DEC_MPEG_STATUS_CHECK_MASK;
+
+	if (!reg)
+		return CEDRUS_IRQ_NONE;
+
+	if (reg & VE_DEC_MPEG_STATUS_CHECK_ERROR)
+		return CEDRUS_IRQ_ERROR;
+
+	return CEDRUS_IRQ_OK;
+}
+
+static void cedrus_jpeg_irq_clear(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+
+	cedrus_write(dev, VE_DEC_MPEG_STATUS, VE_DEC_MPEG_STATUS_CHECK_MASK);
+}
+
+static void cedrus_jpeg_irq_disable(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+	u32 reg = cedrus_read(dev, VE_DEC_MPEG_CTRL);
+
+	reg &= ~VE_DEC_MPEG_CTRL_IRQ_MASK;
+
+	cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
+}
+
+static int cedrus_write_table_header(struct cedrus_dev *dev,
+                                     struct v4l2_jpeg_reference *table)
+{
+	u16 start_codes[16], code;
+	u8 offsets[16], *ptr;
+	unsigned int count;
+	u32 *ptr32;
+	int i;
+
+	ptr = table->start;
+	if (!ptr)
+		return -EINVAL;
+
+	count = 0;
+	code = 0;
+	for (i = 0; i < 16; i++) {
+		offsets[i] = count;
+		start_codes[i] = code;
+		count += ptr[i];
+		code += ptr[i];
+		code *= 2;
+	}
+
+	for (i = 15; i >= 0 && !ptr[i]; i--)
+		start_codes[i] = 0xffff;
+
+	ptr32 = (u32*)start_codes;
+	for (i = 0; i < 8; i++)
+		cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, ptr32[i]);
+
+	ptr32 = (u32*)offsets;
+	for (i = 0; i < 4; i++)
+		cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, ptr32[i]);
+
+	for (i = 0; i < 4; i++)
+		cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, 0);
+
+	return 0;
+}
+
+static int cedrus_jpeg_write_dh_tables(struct cedrus_dev *dev,
+                                       struct v4l2_jpeg_header *hdr)
+{
+	struct v4l2_jpeg_reference *tables[4], *table;
+	struct v4l2_jpeg_scan_component_spec *comp;
+	unsigned int i, j, ret;
+	size_t length;
+	u32 *ptr, val;
+
+	cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_OFFSET, 0);
+
+	j = 0;
+	for (i = 0; i < 2; i++) {
+		comp = &hdr->scan->component[i];
+
+		tables[j++] = &hdr->huffman_tables[comp->dc_entropy_coding_table_selector];
+		tables[j++] = &hdr->huffman_tables[comp->ac_entropy_coding_table_selector + 2];
+	}
+
+	for (i = 0; i < 4; i++) {
+		ret = cedrus_write_table_header(dev, tables[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < 192; i++)
+		cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, 0);
+
+	for (i = 0; i < 4; i++) {
+		table = tables[i];
+		ptr = (u32*)&table->start[16];
+		length = table->length - 16;
+
+		for (j = 0; j < length / 4; j++)
+			cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, ptr[j]);
+
+		if (length & 3) {
+			val = 0;
+			for (j = 0; j < (length & 3); j++)
+				val = (val << 8) | table->start[15 + length - j];
+			cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, val);
+		}
+
+		for (j = 0; j < 64 - DIV_ROUND_UP(length, 4); j++)
+			cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, 0);
+	}
+
+	return 0;
+}
+
+static int cedrus_write_quantization_matrix(struct cedrus_dev *dev, u32 flags,
+                                            struct v4l2_jpeg_reference *table)
+{
+	const u8 *matrix;
+	u32 reg, val;
+	int i;
+
+	matrix = table->start;
+	if (!matrix)
+		return -EINVAL;
+
+	for (i = 0; i < 64; i++) {
+		/* determine if values are 8 or 16 bits */
+		val = *matrix++;
+		if (table->length > 64)
+			val = (val << 8) | *matrix++;
+
+		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, val);
+		reg |= flags;
+
+		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
+	}
+
+	return 0;
+}
+
+static int cedrus_jpeg_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
+{
+	struct cedrus_dev *dev = ctx->dev;
+	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
+	struct v4l2_jpeg_scan_header scan_header;
+	struct v4l2_jpeg_reference quantization_tables[4] = { };
+	struct v4l2_jpeg_reference huffman_tables[4] = { };
+	struct v4l2_jpeg_header header = {
+		.scan = &scan_header,
+		.quantization_tables = quantization_tables,
+		.huffman_tables = huffman_tables,
+	};
+	struct vb2_buffer *src_buf = &run->src->vb2_buf;
+	struct v4l2_jpeg_frame_component_spec *components;
+	u32 reg, subsampling;
+	unsigned long size;
+	int ret, index;
+	u8 hmax, vmax;
+	u16 width, height;
+
+	size = vb2_get_plane_payload(src_buf, 0);
+	ret = v4l2_jpeg_parse_header(vb2_plane_vaddr(src_buf, 0), size, &header);
+	if (ret < 0) {
+		v4l2_err(&dev->v4l2_dev,
+		         "failed to parse JPEG header: %d\n", ret);
+		return -EINVAL;
+	}
+
+	width = header.frame.width;
+	height = header.frame.height;
+	if (width > 2048 || height > 2048) {
+		v4l2_err(&dev->v4l2_dev,
+		         "unsupported JPEG of resolution %ux%u (max 2048x2048)\n",
+		         width, height);
+		return -EINVAL;
+	}
+
+	if (header.frame.precision != 8) {
+		v4l2_err(&dev->v4l2_dev,
+		         "unsupported JPEG with %u bits of precision (8 required)\n",
+		         header.frame.precision);
+		return -EINVAL;
+	}
+
+	if (header.frame.num_components != 3) {
+		v4l2_err(&dev->v4l2_dev,
+		         "unsupported JPEG with %u components (3 required)\n",
+		         header.frame.num_components);
+		return -EINVAL;
+	}
+
+	components = header.frame.component;
+	index = components[0].horizontal_sampling_factor << 20 |
+		components[0].vertical_sampling_factor << 16 |
+		components[1].horizontal_sampling_factor << 12 |
+		components[1].vertical_sampling_factor << 8 |
+		components[2].horizontal_sampling_factor << 4 |
+		components[2].vertical_sampling_factor;
+
+	switch (index) {
+	case 0x221111:
+		subsampling = VE_DEC_MPEG_TRIGGER_CHROMA_FMT_420;
+		break;
+	case 0x211111:
+		subsampling = VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422;
+		break;
+	case 0x111111:
+		subsampling = VE_DEC_MPEG_TRIGGER_CHROMA_FMT_444;
+		break;
+	case 0x121111:
+		subsampling = VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422T;
+		break;
+	default:
+		v4l2_err(&dev->v4l2_dev, "unsupported subsampling %d\n", index);
+		return -EINVAL;
+	}
+
+	ctx->codec.jpeg.subsampling = subsampling;
+
+	/* Activate MPEG engine and select JPEG subengine. */
+	cedrus_engine_enable(ctx);
+
+	reg = VE_DEC_MPEG_TRIGGER_JPEG | subsampling;
+	cedrus_write(dev, VE_DEC_MPEG_TRIGGER, reg);
+
+	/* Set restart interval. */
+	cedrus_write(dev, VE_DEC_MPEG_JPEG_RES_INT, header.restart_interval);
+
+	/* Set resolution in blocks. */
+	hmax = components[0].horizontal_sampling_factor;
+	vmax = components[0].vertical_sampling_factor;
+	for (index = 1; index < 3; index++) {
+		if (hmax < components[index].horizontal_sampling_factor)
+			hmax = components[index].horizontal_sampling_factor;
+		if (vmax < components[index].vertical_sampling_factor)
+			vmax = components[index].vertical_sampling_factor;
+	}
+
+	reg = VE_DEC_MPEG_JPEG_SIZE_WIDTH(DIV_ROUND_UP(width, 8 * hmax));
+	reg |= VE_DEC_MPEG_JPEG_SIZE_HEIGHT(DIV_ROUND_UP(height, 8 * vmax));
+	cedrus_write(dev, VE_DEC_MPEG_JPEG_SIZE, reg);
+
+	/* Set intra quantisation matrix. */
+	index = components[0].quantization_table_selector;
+	ret = cedrus_write_quantization_matrix(dev,
+	                                       VE_DEC_MPEG_IQMINPUT_FLAG_INTRA,
+	                                       &quantization_tables[index]);
+	if (ret)
+		return ret;
+
+	/* Set non-intra quantisation matrix. */
+	index = components[1].quantization_table_selector;
+	ret = cedrus_write_quantization_matrix(dev,
+	                                       VE_DEC_MPEG_IQMINPUT_FLAG_NON_INTRA,
+	                                       &quantization_tables[index]);
+	if (ret)
+		return ret;
+
+	/* Set Diffie-Huffman tables. */
+	ret = cedrus_jpeg_write_dh_tables(dev, &header);
+	if (ret)
+		return ret;
+
+	/* Destination luma and chroma buffers. */
+
+	dst_luma_addr = cedrus_dst_buf_addr(ctx, &run->dst->vb2_buf, 0);
+	dst_chroma_addr = cedrus_dst_buf_addr(ctx, &run->dst->vb2_buf, 1);
+
+	/* JPEG outputs to rotation/scale down output buffers */
+	cedrus_write(dev, VE_DEC_MPEG_ROT_LUMA, dst_luma_addr);
+	cedrus_write(dev, VE_DEC_MPEG_ROT_CHROMA, dst_chroma_addr);
+
+	/* Disable rotation and scaling. */
+	cedrus_write(dev, VE_DEC_MPEG_SD_ROT_DBLK_CTL, 0);
+
+	/* Source offset and length in bits. */
+
+	cedrus_write(dev, VE_DEC_MPEG_VLD_OFFSET, 8 * header.ecs_offset);
+
+	reg = size * 8;
+	cedrus_write(dev, VE_DEC_MPEG_VLD_LEN, reg);
+
+	/* Source beginning and end addresses. */
+
+	src_buf_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+
+	reg = VE_DEC_MPEG_VLD_ADDR_BASE(src_buf_addr);
+	reg |= VE_DEC_MPEG_VLD_ADDR_VALID_PIC_DATA;
+	reg |= VE_DEC_MPEG_VLD_ADDR_LAST_PIC_DATA;
+	reg |= VE_DEC_MPEG_VLD_ADDR_FIRST_PIC_DATA;
+
+	cedrus_write(dev, VE_DEC_MPEG_VLD_ADDR, reg);
+
+	reg = src_buf_addr + size;
+	cedrus_write(dev, VE_DEC_MPEG_VLD_END_ADDR, reg);
+
+	/* Enable appropriate interrupts and components. */
+
+	reg = VE_DEC_MPEG_CTRL_IRQ_MASK;
+	if (subsampling == VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422 ||
+	    subsampling == VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422T ||
+	    subsampling == VE_DEC_MPEG_TRIGGER_CHROMA_FMT_444)
+		reg |= VE_DEC_MPEG_CTRL_JPEG_FORCE_420;
+
+	cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
+
+	return 0;
+}
+
+static void cedrus_jpeg_trigger(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+	u32 reg;
+
+	/* Trigger JPEG engine. */
+	reg = VE_DEC_MPEG_TRIGGER_HW_JPEG_VLD | VE_DEC_MPEG_TRIGGER_JPEG;
+	reg |= ctx->codec.jpeg.subsampling;
+
+	cedrus_write(dev, VE_DEC_MPEG_TRIGGER, reg);
+}
+
+struct cedrus_dec_ops cedrus_dec_ops_jpeg = {
+	.irq_clear   = cedrus_jpeg_irq_clear,
+	.irq_disable = cedrus_jpeg_irq_disable,
+	.irq_status  = cedrus_jpeg_irq_status,
+	.setup       = cedrus_jpeg_setup,
+	.trigger     = cedrus_jpeg_trigger,
+};
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 3acc05e0fb54..cb8b4bb4f44e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -144,6 +144,7 @@
 
 #define VE_DEC_MPEG_CTRL_MC_CACHE_EN		BIT(31)
 #define VE_DEC_MPEG_CTRL_SW_VLD			BIT(27)
+#define VE_DEC_MPEG_CTRL_JPEG_FORCE_420		BIT(18)
 #define VE_DEC_MPEG_CTRL_SW_IQ_IS		BIT(17)
 #define VE_DEC_MPEG_CTRL_QP_AC_DC_OUT_EN	BIT(14)
 #define VE_DEC_MPEG_CTRL_ROTATE_SCALE_OUT_EN	BIT(8)
@@ -165,6 +166,7 @@
 #define VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422	(0x02 << 27)
 #define VE_DEC_MPEG_TRIGGER_CHROMA_FMT_444	(0x03 << 27)
 #define VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422T	(0x04 << 27)
+#define VE_DEC_MPEG_TRIGGER_CHROMA_FMT_400	(0x05 << 27)
 
 #define VE_DEC_MPEG_TRIGGER_MPEG1		(0x01 << 24)
 #define VE_DEC_MPEG_TRIGGER_MPEG2		(0x02 << 24)
@@ -255,10 +257,24 @@
 #define VE_DEC_MPEG_IQMINPUT_WEIGHT(i, v) \
 	(SHIFT_AND_MASK_BITS(i, 13, 8) | SHIFT_AND_MASK_BITS(v, 7, 0))
 
+#define VE_DEC_MPEG_JPEG_SIZE			(VE_ENGINE_DEC_MPEG + 0xb8)
+
+#define VE_DEC_MPEG_JPEG_SIZE_WIDTH(w) \
+	SHIFT_AND_MASK_BITS((w) - 1, 10, 0)
+#define VE_DEC_MPEG_JPEG_SIZE_HEIGHT(h) \
+	SHIFT_AND_MASK_BITS((h) - 1, 26, 16)
+
+#define VE_DEC_MPEG_JPEG_MCU			(VE_ENGINE_DEC_MPEG + 0xbc)
+#define VE_DEC_MPEG_JPEG_RES_INT		(VE_ENGINE_DEC_MPEG + 0xc0)
 #define VE_DEC_MPEG_ERROR			(VE_ENGINE_DEC_MPEG + 0xc4)
 #define VE_DEC_MPEG_CRTMBADDR			(VE_ENGINE_DEC_MPEG + 0xc8)
 #define VE_DEC_MPEG_ROT_LUMA			(VE_ENGINE_DEC_MPEG + 0xcc)
 #define VE_DEC_MPEG_ROT_CHROMA			(VE_ENGINE_DEC_MPEG + 0xd0)
+#define VE_DEC_MPEG_SD_ROT_DBLK_CTL		(VE_ENGINE_DEC_MPEG + 0xd4)
+#define VE_DEC_MPEG_JPEG_MCU_START		(VE_ENGINE_DEC_MPEG + 0xd8)
+#define VE_DEC_MPEG_JPEG_MCU_END		(VE_ENGINE_DEC_MPEG + 0xdc)
+#define VE_DEC_MPEG_SRAM_RW_OFFSET		(VE_ENGINE_DEC_MPEG + 0xe0)
+#define VE_DEC_MPEG_SRAM_RW_DATA		(VE_ENGINE_DEC_MPEG + 0xe4)
 
 #define VE_DEC_H265_DEC_NAL_HDR			(VE_ENGINE_DEC_H265 + 0x00)
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index b00feaf4072c..7205c2315bc5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -55,6 +55,11 @@ static struct cedrus_format cedrus_formats[] = {
 		.directions	= CEDRUS_DECODE_SRC,
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_JPEG,
+		.directions	= CEDRUS_DECODE_SRC,
+		.capabilities	= CEDRUS_CAPABILITY_JPEG_DEC,
+	},
 	{
 		.pixelformat	= V4L2_PIX_FMT_NV12,
 		.directions	= CEDRUS_DECODE_DST,
@@ -118,6 +123,7 @@ void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 	case V4L2_PIX_FMT_H264_SLICE:
 	case V4L2_PIX_FMT_HEVC_SLICE:
 	case V4L2_PIX_FMT_VP8_FRAME:
+	case V4L2_PIX_FMT_JPEG:
 		/* Zero bytes per line for encoded source. */
 		bytesperline = 0;
 		/* Choose some minimum size since this can't be 0 */
@@ -350,6 +356,9 @@ static int cedrus_s_fmt_vid_out_p(struct cedrus_ctx *ctx,
 	case V4L2_PIX_FMT_VP8_FRAME:
 		ctx->current_codec = &cedrus_dec_ops_vp8;
 		break;
+	case V4L2_PIX_FMT_JPEG:
+		ctx->current_codec = &cedrus_dec_ops_jpeg;
+		break;
 	}
 
 	/* Propagate format information to capture. */
-- 
2.45.2


