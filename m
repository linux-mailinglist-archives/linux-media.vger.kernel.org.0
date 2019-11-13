Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A633FB32D
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 16:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfKMPF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 10:05:57 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42167 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727550AbfKMPF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 10:05:57 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iUuDT-00064Z-V7; Wed, 13 Nov 2019 16:05:56 +0100
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
Subject: [PATCH 1/5] media: add v4l2 JPEG helpers
Date:   Wed, 13 Nov 2019 16:05:34 +0100
Message-Id: <20191113150538.9807-2-p.zabel@pengutronix.de>
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

Add helpers for JPEG header parsing. They allow both scanning for marker
segment positions and later parsing the segments individually, as
required by s5p-jpeg, as well as parsing all headers in one go, as
required by coda-vpu. The frame header is always parsed, as basically
all decoders are interested in width, height, and number of components.
For convenience, the JPEG chroma subsampling factors are decoded into a
v4l2_jpeg_chroma_subsampling enum.

Only baseline DCT encoded JPEGs with 8-bit precision and either
grayscale (1 component) or YCbCr (3 components) encodings are supported,
as current drivers do not support different formats.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/v4l2-core/Kconfig     |   4 +
 drivers/media/v4l2-core/Makefile    |   2 +
 drivers/media/v4l2-core/v4l2-jpeg.c | 614 ++++++++++++++++++++++++++++
 include/media/v4l2-jpeg.h           | 135 ++++++
 4 files changed, 755 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
 create mode 100644 include/media/v4l2-jpeg.h

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 39e3fb30ba0b..89809ec24779 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -45,6 +45,10 @@ config VIDEO_PCI_SKELETON
 config VIDEO_TUNER
 	tristate
 
+# Used by drivers that need v4l2-jpeg.ko
+config V4L2_JPEG_HELPER
+	tristate
+
 # Used by drivers that need v4l2-mem2mem.ko
 config V4L2_MEM2MEM_DEV
 	tristate
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 786bd1ec4d1b..144564656d22 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -24,6 +24,8 @@ obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 
+obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
+
 obj-$(CONFIG_VIDEOBUF_GEN) += videobuf-core.o
 obj-$(CONFIG_VIDEOBUF_DMA_SG) += videobuf-dma-sg.o
 obj-$(CONFIG_VIDEOBUF_DMA_CONTIG) += videobuf-dma-contig.o
diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
new file mode 100644
index 000000000000..f1e1a818b47c
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -0,0 +1,614 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * V4L2 JPEG header parser helpers.
+ *
+ * Copyright (C) 2019 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
+ *
+ * For reference, see JPEG ITU-T.81 (ISO/IEC 10918-1) [1]
+ *
+ * [1] https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+
+#include <asm/unaligned.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <media/v4l2-jpeg.h>
+
+MODULE_DESCRIPTION("V4L2 JPEG header parser helpers");
+MODULE_AUTHOR("Philipp Zabel <kernel@pengutronix.de>");
+MODULE_LICENSE("GPL");
+
+/* Table B.1 - Marker code assignments */
+#define SOF0	0xffc0	/* start of frame */
+#define SOF1	0xffc1
+#define SOF3	0xffc3
+#define SOF5	0xffc5
+#define SOF7	0xffc7
+#define JPG	0xffc8	/* extensions */
+#define SOF9	0xffc9
+#define SOF11	0xffcb
+#define SOF13	0xffcd
+#define SOF15	0xffcf
+#define DHT	0xffc4	/* huffman table */
+#define DAC	0xffcc	/* arithmetic coding conditioning */
+#define RST0	0xffd0	/* restart */
+#define RST7	0xffd7
+#define SOI	0xffd8	/* start of image */
+#define EOI	0xffd9	/* end of image */
+#define SOS	0xffda	/* start of stream */
+#define DQT	0xffdb	/* quantization table */
+#define DNL	0xffdc	/* number of lines */
+#define DRI	0xffdd	/* restart interval */
+#define DHP	0xffde	/* hierarchical progression */
+#define EXP	0xffdf	/* expand reference */
+#define APP0	0xffe0	/* application data */
+#define APP15	0xffef
+#define JPG0	0xfff0	/* extensions */
+#define JPG13	0xfffd
+#define COM	0xfffe	/* comment */
+#define TEM	0xff01	/* temporary */
+
+/**
+ * struct jpeg_stream - JPEG byte stream
+ * @curr: current position in stream
+ * @end: end position, after last byte
+ */
+struct jpeg_stream {
+	u8 *curr;
+	u8 *end;
+};
+
+/* returns a value that fits into u8, or negative error */
+static int jpeg_get_byte(struct jpeg_stream *stream)
+{
+	if (stream->curr >= stream->end)
+		return -EINVAL;
+
+	return *stream->curr++;
+}
+
+/* returns a value that fits into u16, or negative error */
+static int jpeg_get_word_be(struct jpeg_stream *stream)
+{
+	u16 word;
+
+	if (stream->curr + sizeof(__be16) > stream->end)
+		return -EINVAL;
+
+	word = get_unaligned_be16(stream->curr);
+	stream->curr += sizeof(__be16);
+
+	return word;
+}
+
+static int jpeg_skip(struct jpeg_stream *stream, size_t len)
+{
+	if (stream->curr + len > stream->end)
+		return -EINVAL;
+
+	stream->curr += len;
+
+	return 0;
+}
+
+static int jpeg_next_marker(struct jpeg_stream *stream)
+{
+	int byte;
+	u16 marker = 0;
+
+	while ((byte = jpeg_get_byte(stream)) >= 0) {
+		marker = (marker << 8) | byte;
+		/* skip stuffing bytes and REServed markers */
+		if (marker == TEM || (marker > 0xffbf && marker < 0xffff))
+			return marker;
+	}
+
+	return byte;
+}
+
+/* this does not advance the current position in the stream */
+static int jpeg_reference_segment(struct jpeg_stream *stream,
+				  struct v4l2_jpeg_reference *segment)
+{
+	u16 len;
+
+	if (stream->curr + sizeof(__be16) > stream->end)
+		return -EINVAL;
+
+	len = get_unaligned_be16(stream->curr);
+	if (stream->curr + len > stream->end)
+		return -EINVAL;
+
+	segment->start = stream->curr;
+	segment->length = len;
+
+	return 0;
+}
+
+static int v4l2_jpeg_decode_subsampling(u8 nf, u8 h_v)
+{
+	if (nf == 1)
+		return V4L2_JPEG_CHROMA_SUBSAMPLING_GRAY;
+
+	switch (h_v) {
+	case 0x11:
+		return V4L2_JPEG_CHROMA_SUBSAMPLING_444;
+	case 0x21:
+		return V4L2_JPEG_CHROMA_SUBSAMPLING_422;
+	case 0x22:
+		return V4L2_JPEG_CHROMA_SUBSAMPLING_420;
+	case 0x41:
+		return V4L2_JPEG_CHROMA_SUBSAMPLING_411;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int jpeg_parse_frame_header(struct jpeg_stream *stream,
+				   struct v4l2_jpeg_frame_header *frame_header)
+{
+	int len = jpeg_get_word_be(stream);
+
+	if (len < 0)
+		return len;
+	/* Lf = 8 + 3 * Nf, Nf >= 1 */
+	if (len < 8 + 3)
+		return -EINVAL;
+
+	if (frame_header) {
+		/* Table B.2 - Frame header parameter sizes and values */
+		int p, y, x, nf;
+		int i;
+
+		p = jpeg_get_byte(stream);
+		if (p < 0)
+			return p;
+		/* baseline DCT only supports 8-bit precision */
+		if (p != 8)
+			return -EINVAL;
+
+		y = jpeg_get_word_be(stream);
+		if (y < 0)
+			return y;
+		if (y == 0)
+			return -EINVAL;
+
+		x = jpeg_get_word_be(stream);
+		if (x < 0)
+			return x;
+		if (x == 0)
+			return -EINVAL;
+
+		nf = jpeg_get_byte(stream);
+		if (nf < 0)
+			return nf;
+		/*
+		 * The spec allows 1 <= Nf <= 255, but we only support YCbCr
+		 * and grayscale.
+		 */
+		if (nf != 1 && nf != 3)
+			return -EINVAL;
+		if (len != 8 + 3 * nf)
+			return -EINVAL;
+
+		frame_header->precision = p;
+		frame_header->height = y;
+		frame_header->width = x;
+		frame_header->num_components = nf;
+
+		for (i = 0; i < nf; i++) {
+			struct v4l2_jpeg_frame_component_spec *component;
+			int c, h_v, tq;
+
+			c = jpeg_get_byte(stream);
+			if (c < 0)
+				return c;
+
+			h_v = jpeg_get_byte(stream);
+			if (h_v < 0)
+				return h_v;
+			if (i == 0) {
+				int subs;
+
+				subs = v4l2_jpeg_decode_subsampling(nf, h_v);
+				if (subs < 0)
+					return subs;
+				frame_header->subsampling = subs;
+			} else if (h_v != 0x11) {
+				/* all chroma sampling factors must be 1 */
+				return -EINVAL;
+			}
+
+			tq = jpeg_get_byte(stream);
+			if (tq < 0)
+				return tq;
+
+			component = &frame_header->component[i];
+			component->component_identifier = c;
+			component->horizontal_sampling_factor =
+				(h_v >> 4) & 0xf;
+			component->vertical_sampling_factor = h_v & 0xf;
+			component->quantization_table_selector = tq;
+		}
+	} else {
+		return jpeg_skip(stream, len - 2);
+	}
+
+	return 0;
+}
+
+static int jpeg_parse_scan_header(struct jpeg_stream *stream,
+				  struct v4l2_jpeg_scan_header *scan_header)
+{
+	size_t skip;
+	int len = jpeg_get_word_be(stream);
+
+	if (len < 0)
+		return len;
+	/* Ls = 8 + 3 * Ns, Ns >= 1 */
+	if (len < 6 + 2)
+		return -EINVAL;
+
+	if (scan_header) {
+		int ns;
+		int i;
+
+		ns = jpeg_get_byte(stream);
+		if (ns < 0)
+			return ns;
+		if (ns < 1 || ns > 4 || len != 6 + 2 * ns)
+			return -EINVAL;
+
+		scan_header->num_components = ns;
+
+		for (i = 0; i < ns; i++) {
+			struct v4l2_jpeg_scan_component_spec *component;
+			int cs, td_ta;
+
+			cs = jpeg_get_byte(stream);
+			if (cs < 0)
+				return cs;
+
+			td_ta = jpeg_get_byte(stream);
+			if (td_ta < 0)
+				return td_ta;
+
+			component = &scan_header->component[i];
+			component->component_selector = cs;
+			component->dc_entropy_coding_table_selector =
+				(td_ta >> 4) & 0xf;
+			component->ac_entropy_coding_table_selector =
+				td_ta & 0xf;
+		}
+
+		skip = 3; /* skip Ss, Se, Ah, and Al */
+	} else {
+		skip = len - 2;
+	}
+
+	return jpeg_skip(stream, skip);
+}
+
+/* B.2.4.1 Quantization table-specification syntax */
+static int jpeg_parse_quantization_tables(struct jpeg_stream *stream,
+					  struct v4l2_jpeg_reference *tables)
+{
+	int len = jpeg_get_word_be(stream);
+
+	if (len < 0)
+		return len;
+	/* Lq = 2 + n * 65 (for baseline DCT), n >= 1 */
+	if (len < 2 + 65)
+		return -EINVAL;
+
+	for (len -= 2; len >= 65; len -= 65) {
+		u8 pq, tq, *qk;
+		int ret;
+		int pq_tq = jpeg_get_byte(stream);
+
+		if (pq_tq < 0)
+			return pq_tq;
+
+		/* quantization table element precision */
+		pq = (pq_tq >> 4) & 0xf;
+		/* only 8-bit Qk values for baseline DCT */
+		if (pq != 0)
+			return -EINVAL;
+
+		/* quantization table destination identifier */
+		tq = pq_tq & 0xf;
+		if (tq > 3)
+			return -EINVAL;
+
+		/* quantization table element */
+		qk = stream->curr;
+		ret = jpeg_skip(stream, 64);
+		if (ret < 0)
+			return -EINVAL;
+
+		if (tables) {
+			tables[tq].start = qk;
+			tables[tq].length = 64;
+		}
+	}
+
+	return 0;
+}
+
+/* B.2.4.2 Huffman table-specification syntax */
+static int jpeg_parse_huffman_tables(struct jpeg_stream *stream,
+				     struct v4l2_jpeg_reference *tables)
+{
+	int mt;
+	int len = jpeg_get_word_be(stream);
+
+	if (len < 0)
+		return len;
+	/* Table B.5 - Huffman table specification parameter sizes and values */
+	if (len < 2 + 17)
+		return -EINVAL;
+
+	for (len -= 2; len >= 17; len -= 17 + mt) {
+		u8 tc, th, *table;
+		int tc_th = jpeg_get_byte(stream);
+		int i, ret;
+
+		if (tc_th < 0)
+			return tc_th;
+
+		/* table class - 0 = DC, 1 = AC */
+		tc = (tc_th >> 4) & 0xf;
+		if (tc > 1)
+			return -EINVAL;
+
+		/* huffman table destination identifier */
+		th = tc_th & 0xf;
+		/* only two Huffman tables for baseline DCT */
+		if (th > 1)
+			return -EINVAL;
+
+		/* BITS - number of Huffman codes with length i */
+		table = stream->curr;
+		mt = 0;
+		for (i = 0; i < 16; i++) {
+			int li;
+
+			li = jpeg_get_byte(stream);
+			if (li < 0)
+				return li;
+
+			mt += li;
+		}
+		/* HUFFVAL - values associated with each Huffman code */
+		ret = jpeg_skip(stream, mt);
+		if (ret < 0)
+			return ret;
+
+		if (tables) {
+			tables[(tc << 1) | th].start = table;
+			tables[(tc << 1) | th].length = stream->curr - table;
+		}
+	}
+
+	return jpeg_skip(stream, len - 2);
+}
+
+/* B.2.4.4 Restart interval definition syntax */
+static int jpeg_parse_restart_interval(struct jpeg_stream *stream,
+				       u16 *restart_interval)
+{
+	int len = jpeg_get_word_be(stream);
+	int ri;
+
+	if (len < 0)
+		return len;
+	if (len != 4)
+		return -EINVAL;
+
+	ri = jpeg_get_word_be(stream);
+	if (ri < 0)
+		return ri;
+
+	*restart_interval = ri;
+
+	return 0;
+}
+
+static int jpeg_skip_segment(struct jpeg_stream *stream)
+{
+	int len = jpeg_get_word_be(stream);
+
+	if (len < 0)
+		return len;
+	if (len < 2)
+		return -EINVAL;
+
+	return jpeg_skip(stream, len - 2);
+}
+
+/**
+ * jpeg_parse_header - locate marker segments and optionally parse headers
+ * @buf: address of the JPEG buffer, should start with a SOI marker
+ * @len: length of the JPEG buffer
+ * @out: returns marker segment positions and optionally parsed headers
+ *
+ * The out->scan_header pointer must be initialized to NULL or point to a valid
+ * v4l2_jpeg_scan_header structure. The out->huffman_tables and
+ * out->quantization_tables pointers must be initialized to NULL or point to a
+ * valid array of 4 v4l2_jpeg_reference structures each.
+ *
+ * Returns 0 or negative error if parsing failed.
+ */
+int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
+{
+	struct jpeg_stream stream;
+	int marker;
+	int ret = 0;
+
+	stream.curr = buf;
+	stream.end = stream.curr + len;
+
+	out->num_dht = 0;
+	out->num_dqt = 0;
+
+	/* the first marker must be SOI */
+	marker = jpeg_next_marker(&stream);
+	if (marker < 0)
+		return marker;
+	if (marker != SOI)
+		return -EINVAL;
+
+	/* loop through marker segments */
+	while ((marker = jpeg_next_marker(&stream)) >= 0) {
+		switch (marker) {
+		/* baseline DCT */
+		case SOF0:
+			ret = jpeg_reference_segment(&stream, &out->sof);
+			if (ret < 0)
+				return ret;
+			ret = jpeg_parse_frame_header(&stream, &out->frame);
+			break;
+		/* extended sequential, progressive, lossless */
+		case SOF1 ... SOF3:
+		/* differential coding */
+		case SOF5 ... SOF7:
+		/* arithmetic coding */
+		case SOF9 ... SOF11:
+		case SOF13 ... SOF15:
+			/* fallthrough */
+		case DAC:
+		case TEM:
+			return -EINVAL;
+
+		case DHT:
+			ret = jpeg_reference_segment(&stream,
+					&out->dht[out->num_dht++ % 4]);
+			if (ret < 0)
+				return ret;
+			ret = jpeg_parse_huffman_tables(&stream,
+							out->huffman_tables);
+			break;
+		case DQT:
+			ret = jpeg_reference_segment(&stream,
+					&out->dqt[out->num_dqt++ % 4]);
+			if (ret < 0)
+				return ret;
+			ret = jpeg_parse_quantization_tables(&stream,
+					out->quantization_tables);
+			break;
+		case DRI:
+			ret = jpeg_parse_restart_interval(&stream,
+							&out->restart_interval);
+			break;
+
+		case SOS:
+			ret = jpeg_reference_segment(&stream, &out->sos);
+			if (ret < 0)
+				return ret;
+			ret = jpeg_parse_scan_header(&stream, out->scan);
+			/*
+			 * stop parsing, the scan header marks the beginning of
+			 * the entropy coded segment
+			 */
+			out->ecs_offset = stream.curr - (u8 *)buf;
+			return ret;
+
+		/* markers without parameters */
+		case RST0 ... RST7: /* restart */
+		case SOI: /* start of image */
+		case EOI: /* end of image */
+			break;
+
+		/* skip unknown or unsupported marker segments */
+		default:
+			ret = jpeg_skip_segment(&stream);
+			break;
+		}
+		if (ret < 0)
+			return ret;
+	}
+
+	return marker;
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_header);
+
+/**
+ * v4l2_jpeg_parse_frame_header - parse frame header
+ * @buf: address of the frame header, after the SOF0 marker
+ * @len: length of the frame header
+ * @frame_header: returns the parsed frame header
+ *
+ * Returns 0 or negative error if parsing failed.
+ */
+int v4l2_jpeg_parse_frame_header(void *buf, size_t len,
+				 struct v4l2_jpeg_frame_header *frame_header)
+{
+	struct jpeg_stream stream;
+
+	stream.curr = buf;
+	stream.end = stream.curr + len;
+	return jpeg_parse_frame_header(&stream, frame_header);
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_frame_header);
+
+/**
+ * v4l2_jpeg_parse_scan_header - parse scan header
+ * @buf: address of the scan header, after the SOS marker
+ * @len: length of the scan header
+ * @scan_header: returns the parsed scan header
+ *
+ * Returns 0 or negative error if parsing failed.
+ */
+int v4l2_jpeg_parse_scan_header(void *buf, size_t len,
+				struct v4l2_jpeg_scan_header *scan_header)
+{
+	struct jpeg_stream stream;
+
+	stream.curr = buf;
+	stream.end = stream.curr + len;
+	return jpeg_parse_scan_header(&stream, scan_header);
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_scan_header);
+
+/**
+ * v4l2_jpeg_parse_quantization_tables - parse quantization tables segment
+ * @buf: address of the quantization table segment, after the DQT marker
+ * @len: length of the quantization table segment
+ * @q_tables: returns four references into the buffer for the
+ *            four possible quantization table destinations
+ *
+ * Returns 0 or negative error if parsing failed.
+ */
+int v4l2_jpeg_parse_quantization_tables(void *buf, size_t len,
+					struct v4l2_jpeg_reference *q_tables)
+{
+	struct jpeg_stream stream;
+
+	stream.curr = buf;
+	stream.end = stream.curr + len;
+	return jpeg_parse_quantization_tables(&stream, q_tables);
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_quantization_tables);
+
+/**
+ * v4l2_jpeg_parse_huffman_tables - parse huffman tables segment
+ * @buf: address of the Huffman table segment, after the DHT marker
+ * @len: length of the Huffman table segment
+ * @huffman_tables: returns four references into the buffer for the
+ *                  four possible Huffman table destinations, in
+ *                  the order DC0, DC1, AC0, AC1
+ *
+ * Returns 0 or negative error if parsing failed.
+ */
+int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
+				   struct v4l2_jpeg_reference *huffman_tables)
+{
+	struct jpeg_stream stream;
+
+	stream.curr = buf;
+	stream.end = stream.curr + len;
+	return jpeg_parse_huffman_tables(&stream, huffman_tables);
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_huffman_tables);
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
new file mode 100644
index 000000000000..2f6292c75122
--- /dev/null
+++ b/include/media/v4l2-jpeg.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * V4L2 JPEG helpers header
+ *
+ * Copyright (C) 2019 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
+ *
+ * For reference, see JPEG ITU-T.81 (ISO/IEC 10918-1)
+ */
+
+#ifndef _V4L2_JPEG_H
+#define _V4L2_JPEG_H
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_JPEG_MAX_COMPONENTS	3
+#define V4L2_JPEG_MAX_TABLES		4
+
+/**
+ * struct v4l2_jpeg_reference - reference into the JPEG buffer
+ * @start: pointer to the start of the referenced segment or table
+ * @length: size of the referenced segment or table
+ *
+ * Wnen referencing marker segments, start points right after the marker code,
+ * and length is the size of the segment parameters, excluding the marker code.
+ */
+struct v4l2_jpeg_reference {
+	u8 *start;
+	size_t length;
+};
+
+/* B.2.2 Frame header syntax */
+
+/**
+ * struct v4l2_jpeg_frame_component_spec - frame component-specification
+ * @component_identifier: C[i]
+ * @horizontal_sampling_factor: H[i]
+ * @vertical_sampling_factor: V[i]
+ * @quantization_table_selector: quantization table destination selector Tq[i]
+ */
+struct v4l2_jpeg_frame_component_spec {
+	u8 component_identifier;
+	u8 horizontal_sampling_factor;
+	u8 vertical_sampling_factor;
+	u8 quantization_table_selector;
+};
+
+/**
+ * struct v4l2_jpeg_frame_header - JPEG frame header
+ * @height: Y
+ * @width: X
+ * @precision: P
+ * @num_components: Nf
+ * @component: component-specification, see v4l2_jpeg_frame_component_spec
+ * @subsampling: decoded subsampling from component-specification
+ */
+struct v4l2_jpeg_frame_header {
+	u16 height;
+	u16 width;
+	u8 precision;
+	u8 num_components;
+	struct v4l2_jpeg_frame_component_spec component[V4L2_JPEG_MAX_COMPONENTS];
+	enum v4l2_jpeg_chroma_subsampling subsampling;
+};
+
+/* B.2.3 Scan header syntax */
+
+/**
+ * struct v4l2_jpeg_scan_component_spec - scan component-specification
+ * @component_selector: Cs[j]
+ * @dc_entropy_coding_table_selector: Td[j]
+ * @ac_entropy_coding_table_selector: Ta[j]
+ */
+struct v4l2_jpeg_scan_component_spec {
+	u8 component_selector;
+	u8 dc_entropy_coding_table_selector;
+	u8 ac_entropy_coding_table_selector;
+};
+
+/**
+ * struct v4l2_jpeg_scan_header - JPEG scan header
+ * @num_components: Ns
+ * @component: component-specification, see v4l2_jpeg_scan_component_spec
+ */
+struct v4l2_jpeg_scan_header {
+	u8 num_components;				/* Ns */
+	struct v4l2_jpeg_scan_component_spec component[V4L2_JPEG_MAX_COMPONENTS];
+	/* Ss, Se, Ah, and Al are not used by any driver */
+};
+
+/**
+ * struct v4l2_jpeg_header - parsed JPEG header
+ * @sof: pointer to frame header and size
+ * @sos: pointer to scan header and size
+ * @dht: pointers to huffman tables and sizes
+ * @dqt: pointers to quantization tables and sizes
+ * @frame: parsed frame header
+ * @scan: pointer to parsed scan header, optional
+ * @quantization_tables: references to four quantization tables, optional
+ * @huffman_tables: references to four Huffman tables in DC0, DC1, AC0, AC1
+ *                  order, optional
+ * @restart_interval: number of MCU per restart interval, Ri
+ * @ecs_offset: buffer offset in bytes to the entropy coded segment
+ *
+ * When this structure is passed to v4l2_jpeg_parse_header, the optional scan,
+ * quantization_tables, and huffman_tables pointers must be initialized to NULL
+ * or point at valid memory.
+ */
+struct v4l2_jpeg_header {
+	struct v4l2_jpeg_reference sof;
+	struct v4l2_jpeg_reference sos;
+	unsigned int num_dht;
+	struct v4l2_jpeg_reference dht[V4L2_JPEG_MAX_TABLES];
+	unsigned int num_dqt;
+	struct v4l2_jpeg_reference dqt[V4L2_JPEG_MAX_TABLES];
+
+	struct v4l2_jpeg_frame_header frame;
+	struct v4l2_jpeg_scan_header *scan;
+	struct v4l2_jpeg_reference *quantization_tables;
+	struct v4l2_jpeg_reference *huffman_tables;
+	u16 restart_interval;
+	size_t ecs_offset;
+};
+
+int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);
+
+int v4l2_jpeg_parse_frame_header(void *buf, size_t len,
+				 struct v4l2_jpeg_frame_header *frame_header);
+int v4l2_jpeg_parse_scan_header(void *buf, size_t len,
+				struct v4l2_jpeg_scan_header *scan_header);
+int v4l2_jpeg_parse_quantization_tables(void *buf, size_t len,
+					struct v4l2_jpeg_reference *q_tables);
+int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
+				   struct v4l2_jpeg_reference *huffman_tables);
+
+#endif
-- 
2.20.1

