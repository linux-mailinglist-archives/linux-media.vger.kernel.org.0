Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE3D0FB330
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 16:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfKMPGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 10:06:02 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38525 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbfKMPGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 10:06:01 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iUuDY-00064Z-4O; Wed, 13 Nov 2019 16:06:00 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
Subject: [PATCH 4/5] media: s5p-jpeg: use v4l2 JPEG helpers
Date:   Wed, 13 Nov 2019 16:05:37 +0100
Message-Id: <20191113150538.9807-5-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113150538.9807-1-p.zabel@pengutronix.de>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
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

Use the v4l2 JPEG helpers for header parsing.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/Kconfig              |   1 +
 drivers/media/platform/s5p-jpeg/jpeg-core.c | 388 +++++---------------
 drivers/media/platform/s5p-jpeg/jpeg-core.h |  14 +-
 3 files changed, 105 insertions(+), 298 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 34b634c5fcd2..9e338bd26df2 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -281,6 +281,7 @@ config VIDEO_SAMSUNG_S5P_JPEG
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_JPEG_HELPER
 	select V4L2_MEM2MEM_DEV
 	help
 	  This is a v4l2 driver for Samsung S5P, EXYNOS3250
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index ac2162235cef..773a396414c9 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -22,6 +22,7 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-jpeg.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
@@ -757,75 +758,59 @@ static inline int exynos4_huff_tbl_val(int class, int id)
 	return __exynos4_huff_tbl(class, id, false);
 }
 
-static int get_byte(struct s5p_jpeg_buffer *buf);
-static int get_word_be(struct s5p_jpeg_buffer *buf, unsigned int *word);
-static void skip(struct s5p_jpeg_buffer *buf, long len);
-
 static void exynos4_jpeg_parse_decode_h_tbl(struct s5p_jpeg_ctx *ctx)
 {
 	struct s5p_jpeg *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	struct s5p_jpeg_buffer jpeg_buffer;
-	unsigned int word;
-	int c, x, components;
-
-	jpeg_buffer.size = 2; /* Ls */
-	jpeg_buffer.data =
-		(unsigned long)vb2_plane_vaddr(&vb->vb2_buf, 0) + ctx->out_q.sos + 2;
-	jpeg_buffer.curr = 0;
-
-	word = 0;
+	u8 *buffer = vb2_plane_vaddr(&vb->vb2_buf, 0);
+	struct v4l2_jpeg_scan_header scan_header;
+	int i, ret;
 
-	if (get_word_be(&jpeg_buffer, &word))
+	ret = v4l2_jpeg_parse_scan_header(buffer + ctx->out_q.sos + 2,
+					  ctx->out_q.sos_len, &scan_header);
+	if (ret < 0)
 		return;
-	jpeg_buffer.size = (long)word - 2;
-	jpeg_buffer.data += 2;
-	jpeg_buffer.curr = 0;
 
-	components = get_byte(&jpeg_buffer);
-	if (components == -1)
-		return;
-	while (components--) {
-		c = get_byte(&jpeg_buffer);
-		if (c == -1)
-			return;
-		x = get_byte(&jpeg_buffer);
-		if (x == -1)
-			return;
-		exynos4_jpeg_select_dec_h_tbl(jpeg->regs, c,
-					(((x >> 4) & 0x1) << 1) | (x & 0x1));
-	}
+	for (i = 0; i < scan_header.num_components; i++) {
+		struct v4l2_jpeg_scan_component_spec *component;
 
+		component = &scan_header.component[i];
+		exynos4_jpeg_select_dec_h_tbl(jpeg->regs,
+				component->component_selector,
+				((component->dc_entropy_coding_table_selector &
+				  0x1) << 1) |
+				(component->ac_entropy_coding_table_selector &
+				 0x1));
+	}
 }
 
 static void exynos4_jpeg_parse_huff_tbl(struct s5p_jpeg_ctx *ctx)
 {
 	struct s5p_jpeg *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	struct s5p_jpeg_buffer jpeg_buffer;
+	u8 *buffer = vb2_plane_vaddr(&vb->vb2_buf, 0);
+	struct v4l2_jpeg_reference huffman_tables[4] = { 0 };
 	unsigned int word;
 	int c, i, n, j;
+	int ret;
 
 	for (j = 0; j < ctx->out_q.dht.n; ++j) {
-		jpeg_buffer.size = ctx->out_q.dht.len[j];
-		jpeg_buffer.data = (unsigned long)vb2_plane_vaddr(&vb->vb2_buf, 0) +
-				   ctx->out_q.dht.marker[j];
-		jpeg_buffer.curr = 0;
+		ret = v4l2_jpeg_parse_huffman_tables(
+				buffer + ctx->out_q.dht.marker[j],
+				ctx->out_q.dht.len[j], huffman_tables);
+		if (ret < 0)
+			return;
+	}
 
-		word = 0;
-		while (jpeg_buffer.curr < jpeg_buffer.size) {
-			char id, class;
-
-			c = get_byte(&jpeg_buffer);
-			if (c == -1)
-				return;
-			id = c & 0xf;
-			class = (c >> 4) & 0xf;
+	for (j = 0; j < ARRAY_SIZE(huffman_tables); ++j) {
+		if (huffman_tables[j].start) {
+			char class = (j >> 1) & 1;
+			char id = j & 1;
+
+			word = 0;
 			n = 0;
 			for (i = 0; i < 16; ++i) {
-				c = get_byte(&jpeg_buffer);
-				if (c == -1)
-					return;
+				c = huffman_tables[j].start[i];
 				word |= c << ((i % 4) * 8);
 				if ((i + 1) % 4 == 0) {
 					writel(word, jpeg->regs +
@@ -837,9 +822,7 @@ static void exynos4_jpeg_parse_huff_tbl(struct s5p_jpeg_ctx *ctx)
 			}
 			word = 0;
 			for (i = 0; i < n; ++i) {
-				c = get_byte(&jpeg_buffer);
-				if (c == -1)
-					return;
+				c = huffman_tables[j].start[16 + i];
 				word |= c << ((i % 4) * 8);
 				if ((i + 1) % 4 == 0) {
 					writel(word, jpeg->regs +
@@ -852,7 +835,6 @@ static void exynos4_jpeg_parse_huff_tbl(struct s5p_jpeg_ctx *ctx)
 				writel(word, jpeg->regs +
 				exynos4_huff_tbl_val(class, id) + (i / 4) * 4);
 			}
-			word = 0;
 		}
 	}
 }
@@ -861,30 +843,26 @@ static void exynos4_jpeg_parse_decode_q_tbl(struct s5p_jpeg_ctx *ctx)
 {
 	struct s5p_jpeg *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	struct s5p_jpeg_buffer jpeg_buffer;
-	int c, x, components;
-
-	jpeg_buffer.size = ctx->out_q.sof_len;
-	jpeg_buffer.data =
-		(unsigned long)vb2_plane_vaddr(&vb->vb2_buf, 0) + ctx->out_q.sof;
-	jpeg_buffer.curr = 0;
+	u8 *buffer = vb2_plane_vaddr(&vb->vb2_buf, 0);
+	struct v4l2_jpeg_frame_header frame_header;
+	int i, ret;
 
-	skip(&jpeg_buffer, 5); /* P, Y, X */
-	components = get_byte(&jpeg_buffer);
-	if (components == -1)
+	ret = v4l2_jpeg_parse_frame_header(buffer + ctx->out_q.sof,
+					   ctx->out_q.sof_len + 2,
+					   &frame_header);
+	if (ret < 0)
 		return;
 
-	exynos4_jpeg_set_dec_components(jpeg->regs, components);
+	exynos4_jpeg_set_dec_components(jpeg->regs,
+					frame_header.num_components);
 
-	while (components--) {
-		c = get_byte(&jpeg_buffer);
-		if (c == -1)
-			return;
-		skip(&jpeg_buffer, 1);
-		x = get_byte(&jpeg_buffer);
-		if (x == -1)
-			return;
-		exynos4_jpeg_select_dec_q_tbl(jpeg->regs, c, x);
+	for (i = 0; i < frame_header.num_components; i++) {
+		struct v4l2_jpeg_frame_component_spec *component;
+
+		component = &frame_header.component[i];
+		exynos4_jpeg_select_dec_q_tbl(jpeg->regs,
+				component->component_identifier,
+				component->quantization_table_selector);
 	}
 }
 
@@ -892,39 +870,33 @@ static void exynos4_jpeg_parse_q_tbl(struct s5p_jpeg_ctx *ctx)
 {
 	struct s5p_jpeg *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	struct s5p_jpeg_buffer jpeg_buffer;
+	u8 *buffer = vb2_plane_vaddr(&vb->vb2_buf, 0);
+	struct v4l2_jpeg_reference quantization_tables[4] = { 0 };
 	unsigned int word;
 	int c, i, j;
+	int ret;
 
 	for (j = 0; j < ctx->out_q.dqt.n; ++j) {
-		jpeg_buffer.size = ctx->out_q.dqt.len[j];
-		jpeg_buffer.data = (unsigned long)vb2_plane_vaddr(&vb->vb2_buf, 0) +
-				   ctx->out_q.dqt.marker[j];
-		jpeg_buffer.curr = 0;
+		ret = v4l2_jpeg_parse_quantization_tables(buffer +
+				ctx->out_q.dqt.marker[j],
+				ctx->out_q.dqt.len[j], quantization_tables);
+		if (ret < 0)
+			return;
+	}
+
+	for (j = 0; j < 4; ++j) {
+		if (!quantization_tables[j].start)
+			continue;
 
 		word = 0;
-		while (jpeg_buffer.size - jpeg_buffer.curr >= 65) {
-			char id;
-
-			c = get_byte(&jpeg_buffer);
-			if (c == -1)
-				return;
-			id = c & 0xf;
-			/* nonzero means extended mode - not supported */
-			if ((c >> 4) & 0xf)
-				return;
-			for (i = 0; i < 64; ++i) {
-				c = get_byte(&jpeg_buffer);
-				if (c == -1)
-					return;
-				word |= c << ((i % 4) * 8);
-				if ((i + 1) % 4 == 0) {
-					writel(word, jpeg->regs +
-					EXYNOS4_QTBL_CONTENT(id) + (i / 4) * 4);
-					word = 0;
-				}
+		for (i = 0; i < 64; ++i) {
+			c = quantization_tables[j].start[i];
+			word |= c << ((i % 4) * 8);
+			if ((i + 1) % 4 == 0) {
+				writel(word, jpeg->regs +
+				EXYNOS4_QTBL_CONTENT(j) + (i / 4) * 4);
+				word = 0;
 			}
-			word = 0;
 		}
 	}
 }
@@ -1036,206 +1008,50 @@ static const struct v4l2_file_operations s5p_jpeg_fops = {
  * ============================================================================
  */
 
-static int get_byte(struct s5p_jpeg_buffer *buf)
-{
-	if (buf->curr >= buf->size)
-		return -1;
-
-	return ((unsigned char *)buf->data)[buf->curr++];
-}
-
-static int get_word_be(struct s5p_jpeg_buffer *buf, unsigned int *word)
+static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
+			       u8 *buffer, unsigned long size,
+			       struct s5p_jpeg_ctx *ctx)
 {
-	unsigned int temp;
-	int byte;
-
-	byte = get_byte(buf);
-	if (byte == -1)
-		return -1;
-	temp = byte << 8;
-	byte = get_byte(buf);
-	if (byte == -1)
-		return -1;
-	*word = (unsigned int)byte | temp;
-	return 0;
-}
+	struct v4l2_jpeg_header header;
+	unsigned int subsampling;
+	int i, ret;
 
-static void skip(struct s5p_jpeg_buffer *buf, long len)
-{
-	if (len <= 0)
-		return;
+	memset(&header, 0, sizeof(header));
+	ret = v4l2_jpeg_parse_header(buffer, size, &header);
+	if (ret < 0)
+		return false;
 
-	while (len--)
-		get_byte(buf);
-}
+	subsampling = (header.frame.num_components == 1) ? 0x33 :
+		(header.frame.component[0].horizontal_sampling_factor << 4) |
+		 header.frame.component[0].vertical_sampling_factor;
 
-static bool s5p_jpeg_subsampling_decode(struct s5p_jpeg_ctx *ctx,
-					unsigned int subsampling)
-{
-	unsigned int version;
+	/* 4:1:1 subsampling only supported by 3250, 5420, and 5433 variants */
+	if (header.frame.subsampling == V4L2_JPEG_CHROMA_SUBSAMPLING_411) {
+		unsigned int version = ctx->jpeg->variant->version;
 
-	switch (subsampling) {
-	case 0x11:
-		ctx->subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_444;
-		break;
-	case 0x21:
-		ctx->subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_422;
-		break;
-	case 0x22:
-		ctx->subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_420;
-		break;
-	case 0x33:
-		ctx->subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_GRAY;
-		break;
-	case 0x41:
-		/*
-		 * 4:1:1 subsampling only supported by 3250, 5420, and 5433
-		 * variants
-		 */
-		version = ctx->jpeg->variant->version;
 		if (version != SJPEG_EXYNOS3250 &&
 		    version != SJPEG_EXYNOS5420 &&
 		    version != SJPEG_EXYNOS5433)
 			return false;
-
-		ctx->subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_411;
-		break;
-	default:
-		return false;
-	}
-
-	return true;
-}
-
-static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
-			       unsigned long buffer, unsigned long size,
-			       struct s5p_jpeg_ctx *ctx)
-{
-	int c, components = 0, notfound, n_dht = 0, n_dqt = 0;
-	unsigned int height = 0, width = 0, word, subsampling = 0;
-	unsigned int sos = 0, sof = 0, sof_len = 0;
-	unsigned int dht[S5P_JPEG_MAX_MARKER], dht_len[S5P_JPEG_MAX_MARKER];
-	unsigned int dqt[S5P_JPEG_MAX_MARKER], dqt_len[S5P_JPEG_MAX_MARKER];
-	long length;
-	struct s5p_jpeg_buffer jpeg_buffer;
-
-	jpeg_buffer.size = size;
-	jpeg_buffer.data = buffer;
-	jpeg_buffer.curr = 0;
-
-	notfound = 1;
-	while (notfound || !sos) {
-		c = get_byte(&jpeg_buffer);
-		if (c == -1)
-			return false;
-		if (c != 0xff)
-			continue;
-		do
-			c = get_byte(&jpeg_buffer);
-		while (c == 0xff);
-		if (c == -1)
-			return false;
-		if (c == 0)
-			continue;
-		length = 0;
-		switch (c) {
-		/* SOF0: baseline JPEG */
-		case SOF0:
-			if (get_word_be(&jpeg_buffer, &word))
-				break;
-			length = (long)word - 2;
-			if (!length)
-				return false;
-			sof = jpeg_buffer.curr; /* after 0xffc0 */
-			sof_len = length;
-			if (get_byte(&jpeg_buffer) == -1)
-				break;
-			if (get_word_be(&jpeg_buffer, &height))
-				break;
-			if (get_word_be(&jpeg_buffer, &width))
-				break;
-			components = get_byte(&jpeg_buffer);
-			if (components == -1)
-				break;
-
-			if (components == 1) {
-				subsampling = 0x33;
-			} else {
-				skip(&jpeg_buffer, 1);
-				subsampling = get_byte(&jpeg_buffer);
-				skip(&jpeg_buffer, 1);
-			}
-			if (components > 3)
-				return false;
-			skip(&jpeg_buffer, components * 2);
-			notfound = 0;
-			break;
-
-		case DQT:
-			if (get_word_be(&jpeg_buffer, &word))
-				break;
-			length = (long)word - 2;
-			if (!length)
-				return false;
-			if (n_dqt >= S5P_JPEG_MAX_MARKER)
-				return false;
-			dqt[n_dqt] = jpeg_buffer.curr; /* after 0xffdb */
-			dqt_len[n_dqt++] = length;
-			skip(&jpeg_buffer, length);
-			break;
-
-		case DHT:
-			if (get_word_be(&jpeg_buffer, &word))
-				break;
-			length = (long)word - 2;
-			if (!length)
-				return false;
-			if (n_dht >= S5P_JPEG_MAX_MARKER)
-				return false;
-			dht[n_dht] = jpeg_buffer.curr; /* after 0xffc4 */
-			dht_len[n_dht++] = length;
-			skip(&jpeg_buffer, length);
-			break;
-
-		case SOS:
-			sos = jpeg_buffer.curr - 2; /* 0xffda */
-			break;
-
-		/* skip payload-less markers */
-		case RST ... RST + 7:
-		case SOI:
-		case EOI:
-		case TEM:
-			break;
-
-		/* skip uninteresting payload markers */
-		default:
-			if (get_word_be(&jpeg_buffer, &word))
-				break;
-			length = (long)word - 2;
-			skip(&jpeg_buffer, length);
-			break;
-		}
 	}
+	ctx->subsampling = header.frame.subsampling;
 
-	if (notfound || !sos || !s5p_jpeg_subsampling_decode(ctx, subsampling))
-		return false;
-
-	result->w = width;
-	result->h = height;
-	result->sos = sos;
-	result->dht.n = n_dht;
-	while (n_dht--) {
-		result->dht.marker[n_dht] = dht[n_dht];
-		result->dht.len[n_dht] = dht_len[n_dht];
+	result->w = header.frame.width;
+	result->h = header.frame.height;
+	result->sos = header.sos.start - buffer - 2;
+	result->sos_len = header.sos.length;
+	result->dht.n = header.num_dht;
+	for (i = 0; i < header.num_dht; i++) {
+		result->dht.marker[i] = header.dht[i].start - buffer;
+		result->dht.len[i] = header.dht[i].length;
 	}
-	result->dqt.n = n_dqt;
-	while (n_dqt--) {
-		result->dqt.marker[n_dqt] = dqt[n_dqt];
-		result->dqt.len[n_dqt] = dqt_len[n_dqt];
+	result->dqt.n = header.num_dqt;
+	for (i = 0; i < header.num_dqt; i++) {
+		result->dqt.marker[i] = header.dqt[i].start - buffer;
+		result->dqt.len[i] = header.dqt[i].length;
 	}
-	result->sof = sof;
-	result->sof_len = sof_len;
+	result->sof = header.sof.start - buffer;
+	result->sof_len = header.sof.length - 2;
 
 	return true;
 }
@@ -2550,7 +2366,7 @@ static void s5p_jpeg_buf_queue(struct vb2_buffer *vb)
 		ori_h = ctx->out_q.h;
 
 		ctx->hdr_parsed = s5p_jpeg_parse_hdr(&ctx->out_q,
-		     (unsigned long)vb2_plane_vaddr(vb, 0),
+		     (u8 *)vb2_plane_vaddr(vb, 0),
 		     min((unsigned long)ctx->out_q.size,
 			 vb2_get_plane_payload(vb, 0)), ctx);
 		if (!ctx->hdr_parsed) {
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.h b/drivers/media/platform/s5p-jpeg/jpeg-core.h
index 4407fe775afa..9254f1ef9dc4 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.h
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.h
@@ -186,6 +186,7 @@ struct s5p_jpeg_marker {
  * @w:		image width
  * @h:		image height
  * @sos:	SOS marker's position relative to the buffer beginning
+ * @sos_len:	SOS marker's payload length (including length field)
  * @dht:	DHT markers' positions relative to the buffer beginning
  * @dqt:	DQT markers' positions relative to the buffer beginning
  * @sof:	SOF0 marker's position relative to the buffer beginning
@@ -197,6 +198,7 @@ struct s5p_jpeg_q_data {
 	u32			w;
 	u32			h;
 	u32			sos;
+	u32			sos_len;
 	struct s5p_jpeg_marker	dht;
 	struct s5p_jpeg_marker	dqt;
 	u32			sof;
@@ -238,18 +240,6 @@ struct s5p_jpeg_ctx {
 	enum s5p_jpeg_ctx_state	state;
 };
 
-/**
- * s5p_jpeg_buffer - description of memory containing input JPEG data
- * @size:	buffer size
- * @curr:	current position in the buffer
- * @data:	pointer to the data
- */
-struct s5p_jpeg_buffer {
-	unsigned long size;
-	unsigned long curr;
-	unsigned long data;
-};
-
 /**
  * struct s5p_jpeg_addr - JPEG converter physical address set for DMA
  * @y:   luminance plane physical address
-- 
2.20.1

