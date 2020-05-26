Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB9A19E0E8
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 00:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgDCWOF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 18:14:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60984 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728636AbgDCWOE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 18:14:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EA8A4298621
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v8 1/5] media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists
Date:   Fri,  3 Apr 2020 19:13:41 -0300
Message-Id: <20200403221345.16702-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200403221345.16702-1-ezequiel@collabora.com>
References: <20200403221345.16702-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Building those list is a standard procedure described in section
'8.2.4 Decoding process for reference picture lists construction' of
the H264 specification.

We already have 2 drivers needing the same logic (hantro and rkvdec) and
I suspect we will soon have more.

Let's provide generic helpers to create those lists.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
--
v8:
* None.
v7:
* Replace magic numbers with macros,
  as pointed out by Mauro.
* Prevent and WARN_ON() out of bounds access.
---
 drivers/media/v4l2-core/Kconfig     |   4 +
 drivers/media/v4l2-core/Makefile    |   1 +
 drivers/media/v4l2-core/v4l2-h264.c | 270 ++++++++++++++++++++++++++++
 include/media/h264-ctrls.h          |   8 +-
 include/media/v4l2-h264.h           |  85 +++++++++
 5 files changed, 367 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
 create mode 100644 include/media/v4l2-h264.h

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 89809ec24779..db09e8b643fd 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -49,6 +49,10 @@ config VIDEO_TUNER
 config V4L2_JPEG_HELPER
 	tristate
 
+# Used by drivers that need v4l2-h264.ko
+config V4L2_H264
+	tristate
+
 # Used by drivers that need v4l2-mem2mem.ko
 config V4L2_MEM2MEM_DEV
 	tristate
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 144564656d22..2ef0c7c958a2 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
 obj-$(CONFIG_VIDEO_TUNER) += tuner.o
 
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
+obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
 
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 
diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
new file mode 100644
index 000000000000..edf6225f0522
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-h264.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 H264 helpers.
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *
+ * Author: Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#include <linux/module.h>
+#include <linux/sort.h>
+
+#include <media/v4l2-h264.h>
+
+/**
+ * v4l2_h264_init_reflist_builder() - Initialize a P/B0/B1 reference list
+ *				      builder
+ *
+ * @b: the builder context to initialize
+ * @dec_params: decode parameters control
+ * @slice_params: first slice parameters control
+ * @sps: SPS control
+ * @dpb: DPB to use when creating the reference list
+ */
+void
+v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
+		const struct v4l2_ctrl_h264_decode_params *dec_params,
+		const struct v4l2_ctrl_h264_slice_params *slice_params,
+		const struct v4l2_ctrl_h264_sps *sps,
+		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES])
+{
+	int cur_frame_num, max_frame_num;
+	unsigned int i;
+
+	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
+	cur_frame_num = slice_params->frame_num;
+
+	memset(b, 0, sizeof(*b));
+	if (!(slice_params->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
+		b->cur_pic_order_count = min(dec_params->bottom_field_order_cnt,
+					     dec_params->top_field_order_cnt);
+	else if (slice_params->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+		b->cur_pic_order_count = dec_params->bottom_field_order_cnt;
+	else
+		b->cur_pic_order_count = dec_params->top_field_order_cnt;
+
+	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
+		u32 pic_order_count;
+
+		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		b->refs[i].pic_num = dpb[i].pic_num;
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+			b->refs[i].longterm = true;
+
+		/*
+		 * Handle frame_num wraparound as described in section
+		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
+		 * TODO: This logic will have to be adjusted when we start
+		 * supporting interlaced content.
+		 */
+		if (dpb[i].frame_num > cur_frame_num)
+			b->refs[i].frame_num = (int)dpb[i].frame_num -
+					       max_frame_num;
+		else
+			b->refs[i].frame_num = dpb[i].frame_num;
+
+		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
+			pic_order_count = min(dpb[i].top_field_order_cnt,
+					      dpb[i].bottom_field_order_cnt);
+		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
+			pic_order_count = dpb[i].bottom_field_order_cnt;
+		else
+			pic_order_count = dpb[i].top_field_order_cnt;
+
+		b->refs[i].pic_order_count = pic_order_count;
+		b->unordered_reflist[b->num_valid] = i;
+		b->num_valid++;
+	}
+
+	for (i = b->num_valid; i < ARRAY_SIZE(b->unordered_reflist); i++)
+		b->unordered_reflist[i] = i;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder);
+
+static int v4l2_h264_p_ref_list_cmp(const void *ptra, const void *ptrb,
+				    const void *data)
+{
+	const struct v4l2_h264_reflist_builder *builder = data;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+
+	if (WARN_ON(idxa >= V4L2_H264_NUM_DPB_ENTRIES ||
+		    idxb >= V4L2_H264_NUM_DPB_ENTRIES))
+		return 1;
+
+	if (builder->refs[idxa].longterm != builder->refs[idxb].longterm) {
+		/* Short term pics first. */
+		if (!builder->refs[idxa].longterm)
+			return -1;
+		else
+			return 1;
+	}
+
+	/*
+	 * Short term pics in descending pic num order, long term ones in
+	 * ascending order.
+	 */
+	if (!builder->refs[idxa].longterm)
+		return builder->refs[idxb].frame_num <
+		       builder->refs[idxa].frame_num ?
+		       -1 : 1;
+
+	return builder->refs[idxa].pic_num < builder->refs[idxb].pic_num ?
+	       -1 : 1;
+}
+
+static int v4l2_h264_b0_ref_list_cmp(const void *ptra, const void *ptrb,
+				     const void *data)
+{
+	const struct v4l2_h264_reflist_builder *builder = data;
+	s32 poca, pocb;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+
+	if (WARN_ON(idxa >= V4L2_H264_NUM_DPB_ENTRIES ||
+		    idxb >= V4L2_H264_NUM_DPB_ENTRIES))
+		return 1;
+
+	if (builder->refs[idxa].longterm != builder->refs[idxb].longterm) {
+		/* Short term pics first. */
+		if (!builder->refs[idxa].longterm)
+			return -1;
+		else
+			return 1;
+	}
+
+	/* Long term pics in ascending pic num order. */
+	if (builder->refs[idxa].longterm)
+		return builder->refs[idxa].pic_num <
+		       builder->refs[idxb].pic_num ?
+		       -1 : 1;
+
+	poca = builder->refs[idxa].pic_order_count;
+	pocb = builder->refs[idxb].pic_order_count;
+
+	/*
+	 * Short term pics with POC < cur POC first in POC descending order
+	 * followed by short term pics with POC > cur POC in POC ascending
+	 * order.
+	 */
+	if ((poca < builder->cur_pic_order_count) !=
+	     (pocb < builder->cur_pic_order_count))
+		return poca < pocb ? -1 : 1;
+	else if (poca < builder->cur_pic_order_count)
+		return pocb < poca ? -1 : 1;
+
+	return poca < pocb ? -1 : 1;
+}
+
+static int v4l2_h264_b1_ref_list_cmp(const void *ptra, const void *ptrb,
+				     const void *data)
+{
+	const struct v4l2_h264_reflist_builder *builder = data;
+	s32 poca, pocb;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+
+	if (WARN_ON(idxa >= V4L2_H264_NUM_DPB_ENTRIES ||
+		    idxb >= V4L2_H264_NUM_DPB_ENTRIES))
+		return 1;
+
+	if (builder->refs[idxa].longterm != builder->refs[idxb].longterm) {
+		/* Short term pics first. */
+		if (!builder->refs[idxa].longterm)
+			return -1;
+		else
+			return 1;
+	}
+
+	/* Long term pics in ascending pic num order. */
+	if (builder->refs[idxa].longterm)
+		return builder->refs[idxa].pic_num <
+		       builder->refs[idxb].pic_num ?
+		       -1 : 1;
+
+	poca = builder->refs[idxa].pic_order_count;
+	pocb = builder->refs[idxb].pic_order_count;
+
+	/*
+	 * Short term pics with POC > cur POC first in POC ascending order
+	 * followed by short term pics with POC < cur POC in POC descending
+	 * order.
+	 */
+	if ((poca < builder->cur_pic_order_count) !=
+	    (pocb < builder->cur_pic_order_count))
+		return pocb < poca ? -1 : 1;
+	else if (poca < builder->cur_pic_order_count)
+		return pocb < poca ? -1 : 1;
+
+	return poca < pocb ? -1 : 1;
+}
+
+/**
+ * v4l2_h264_build_p_ref_list() - Build the P reference list
+ *
+ * @builder: reference list builder context
+ * @reflist: 16-bytes array used to store the P reference list. Each entry
+ *	     is an index in the DPB
+ *
+ * This functions builds the P reference lists. This procedure is describe in
+ * section '8.2.4 Decoding process for reference picture lists construction'
+ * of the H264 spec. This function can be used by H264 decoder drivers that
+ * need to pass a P reference list to the hardware.
+ */
+void
+v4l2_h264_build_p_ref_list(const struct v4l2_h264_reflist_builder *builder,
+			   u8 *reflist)
+{
+	memcpy(reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist[0]) * builder->num_valid);
+	sort_r(reflist, builder->num_valid, sizeof(*reflist),
+	       v4l2_h264_p_ref_list_cmp, NULL, builder);
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_build_p_ref_list);
+
+/**
+ * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
+ *
+ * @builder: reference list builder context
+ * @b0_reflist: 16-bytes array used to store the B0 reference list. Each entry
+ *		is an index in the DPB
+ * @b1_reflist: 16-bytes array used to store the B1 reference list. Each entry
+ *		is an index in the DPB
+ *
+ * This functions builds the B0/B1 reference lists. This procedure is described
+ * in section '8.2.4 Decoding process for reference picture lists construction'
+ * of the H264 spec. This function can be used by H264 decoder drivers that
+ * need to pass B0/B1 reference lists to the hardware.
+ */
+void
+v4l2_h264_build_b_ref_lists(const struct v4l2_h264_reflist_builder *builder,
+			    u8 *b0_reflist, u8 *b1_reflist)
+{
+	memcpy(b0_reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist[0]) * builder->num_valid);
+	sort_r(b0_reflist, builder->num_valid, sizeof(*b0_reflist),
+	       v4l2_h264_b0_ref_list_cmp, NULL, builder);
+
+	memcpy(b1_reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist[0]) * builder->num_valid);
+	sort_r(b1_reflist, builder->num_valid, sizeof(*b1_reflist),
+	       v4l2_h264_b1_ref_list_cmp, NULL, builder);
+
+	if (builder->num_valid > 1 &&
+	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
+		swap(b1_reflist[0], b1_reflist[1]);
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_build_b_ref_lists);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("V4L2 H264 Helpers");
+MODULE_AUTHOR("Boris Brezillon <boris.brezillon@collabora.com>");
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 1c6ff7d63bca..080fd1293c42 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -13,6 +13,12 @@
 
 #include <linux/videodev2.h>
 
+/*
+ * Maximum DPB size, as specified by section 'A.3.1 Level limits
+ * common to the Baseline, Main, and Extended profiles'.
+ */
+#define V4L2_H264_NUM_DPB_ENTRIES 16
+
 /* Our pixel format isn't stable at the moment */
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 
@@ -201,7 +207,7 @@ struct v4l2_h264_dpb_entry {
 #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC	0x01
 
 struct v4l2_ctrl_h264_decode_params {
-	struct v4l2_h264_dpb_entry dpb[16];
+	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
 	__u16 num_slices;
 	__u16 nal_ref_idc;
 	__s32 top_field_order_cnt;
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
new file mode 100644
index 000000000000..bc9ebb560ccf
--- /dev/null
+++ b/include/media/v4l2-h264.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Helper functions for H264 codecs.
+ *
+ * Copyright (c) 2019 Collabora, Ltd.
+ *
+ * Author: Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#ifndef _MEDIA_V4L2_H264_H
+#define _MEDIA_V4L2_H264_H
+
+#include <media/h264-ctrls.h>
+
+/**
+ * struct v4l2_h264_reflist_builder - Reference list builder object
+ *
+ * @refs.pic_order_count: reference picture order count
+ * @refs.frame_num: reference frame number
+ * @refs.pic_num: reference picture number
+ * @refs.longterm: set to true for a long term reference
+ * @refs: array of references
+ * @cur_pic_order_count: picture order count of the frame being decoded
+ * @unordered_reflist: unordered list of references. Will be used to generate
+ *		       ordered P/B0/B1 lists
+ * @num_valid: number of valid references in the refs array
+ *
+ * This object stores the context of the P/B0/B1 reference list builder.
+ * This procedure is described in section '8.2.4 Decoding process for reference
+ * picture lists construction' of the H264 spec.
+ */
+struct v4l2_h264_reflist_builder {
+	struct {
+		s32 pic_order_count;
+		int frame_num;
+		u16 pic_num;
+		u16 longterm : 1;
+	} refs[V4L2_H264_NUM_DPB_ENTRIES];
+	s32 cur_pic_order_count;
+	u8 unordered_reflist[V4L2_H264_NUM_DPB_ENTRIES];
+	u8 num_valid;
+};
+
+void
+v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
+		const struct v4l2_ctrl_h264_decode_params *dec_params,
+		const struct v4l2_ctrl_h264_slice_params *slice_params,
+		const struct v4l2_ctrl_h264_sps *sps,
+		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]);
+
+/**
+ * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
+ *
+ * @builder: reference list builder context
+ * @b0_reflist: 16-bytes array used to store the B0 reference list. Each entry
+ *		is an index in the DPB
+ * @b1_reflist: 16-bytes array used to store the B1 reference list. Each entry
+ *		is an index in the DPB
+ *
+ * This functions builds the B0/B1 reference lists. This procedure is described
+ * in section '8.2.4 Decoding process for reference picture lists construction'
+ * of the H264 spec. This function can be used by H264 decoder drivers that
+ * need to pass B0/B1 reference lists to the hardware.
+ */
+void
+v4l2_h264_build_b_ref_lists(const struct v4l2_h264_reflist_builder *builder,
+			    u8 *b0_reflist, u8 *b1_reflist);
+
+/**
+ * v4l2_h264_build_b_ref_lists() - Build the P reference list
+ *
+ * @builder: reference list builder context
+ * @p_reflist: 16-bytes array used to store the P reference list. Each entry
+ *	       is an index in the DPB
+ *
+ * This functions builds the P reference lists. This procedure is describe in
+ * section '8.2.4 Decoding process for reference picture lists construction'
+ * of the H264 spec. This function can be used by H264 decoder drivers that
+ * need to pass a P reference list to the hardware.
+ */
+void
+v4l2_h264_build_p_ref_list(const struct v4l2_h264_reflist_builder *builder,
+			   u8 *reflist);
+
+#endif /* _MEDIA_V4L2_H264_H */
-- 
2.26.0.rc2

