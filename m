Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E34FC11E3EA
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 13:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfLMMyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 07:54:25 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57210 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbfLMMyY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 07:54:24 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4C806292CD5;
        Fri, 13 Dec 2019 12:54:21 +0000 (GMT)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 4/7] media: hantro: h264: Use the generic H264 reflist builder
Date:   Fri, 13 Dec 2019 13:54:11 +0100
Message-Id: <20191213125414.90725-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213125414.90725-1-boris.brezillon@collabora.com>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the core provides generic reflist builders, we can use them
instead of implementing our own.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* New patch
---
 drivers/staging/media/hantro/hantro_h264.c | 237 +--------------------
 1 file changed, 8 insertions(+), 229 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 568640eab3a6..d998272d20e6 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -11,7 +11,7 @@
  */
 
 #include <linux/types.h>
-#include <linux/sort.h>
+#include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "hantro.h"
@@ -240,229 +240,6 @@ static void prepare_table(struct hantro_ctx *ctx)
 	reorder_scaling_list(ctx);
 }
 
-struct hantro_h264_reflist_builder {
-	const struct v4l2_h264_dpb_entry *dpb;
-	s32 pocs[HANTRO_H264_DPB_SIZE];
-	u8 unordered_reflist[HANTRO_H264_DPB_SIZE];
-	int frame_nums[HANTRO_H264_DPB_SIZE];
-	s32 curpoc;
-	u8 num_valid;
-};
-
-static s32 get_poc(enum v4l2_field field, s32 top_field_order_cnt,
-		   s32 bottom_field_order_cnt)
-{
-	switch (field) {
-	case V4L2_FIELD_TOP:
-		return top_field_order_cnt;
-	case V4L2_FIELD_BOTTOM:
-		return bottom_field_order_cnt;
-	default:
-		break;
-	}
-
-	return min(top_field_order_cnt, bottom_field_order_cnt);
-}
-
-static void
-init_reflist_builder(struct hantro_ctx *ctx,
-		     struct hantro_h264_reflist_builder *b)
-{
-	const struct v4l2_ctrl_h264_slice_params *slice_params;
-	const struct v4l2_ctrl_h264_decode_params *dec_param;
-	const struct v4l2_ctrl_h264_sps *sps;
-	struct vb2_v4l2_buffer *buf = hantro_get_dst_buf(ctx);
-	const struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
-	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
-	int cur_frame_num, max_frame_num;
-	unsigned int i;
-
-	dec_param = ctx->h264_dec.ctrls.decode;
-	slice_params = &ctx->h264_dec.ctrls.slices[0];
-	sps = ctx->h264_dec.ctrls.sps;
-	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
-	cur_frame_num = slice_params->frame_num;
-
-	memset(b, 0, sizeof(*b));
-	b->dpb = dpb;
-	b->curpoc = get_poc(buf->field, dec_param->top_field_order_cnt,
-			    dec_param->bottom_field_order_cnt);
-
-	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++) {
-		int buf_idx;
-
-		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
-			continue;
-
-		buf_idx = vb2_find_timestamp(cap_q, dpb[i].reference_ts, 0);
-		if (buf_idx < 0)
-			continue;
-
-		buf = to_vb2_v4l2_buffer(vb2_get_buffer(cap_q, buf_idx));
-
-		/*
-		 * Handle frame_num wraparound as described in section
-		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
-		 * TODO: This logic will have to be adjusted when we start
-		 * supporting interlaced content.
-		 */
-		if (dpb[i].frame_num > cur_frame_num)
-			b->frame_nums[i] = (int)dpb[i].frame_num - max_frame_num;
-		else
-			b->frame_nums[i] = dpb[i].frame_num;
-
-		b->pocs[i] = get_poc(buf->field, dpb[i].top_field_order_cnt,
-				     dpb[i].bottom_field_order_cnt);
-		b->unordered_reflist[b->num_valid] = i;
-		b->num_valid++;
-	}
-
-	for (i = b->num_valid; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++)
-		b->unordered_reflist[i] = i;
-}
-
-static int p_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
-{
-	const struct hantro_h264_reflist_builder *builder = data;
-	const struct v4l2_h264_dpb_entry *a, *b;
-	u8 idxa, idxb;
-
-	idxa = *((u8 *)ptra);
-	idxb = *((u8 *)ptrb);
-	a = &builder->dpb[idxa];
-	b = &builder->dpb[idxb];
-
-	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
-	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
-		/* Short term pics firt. */
-		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
-			return -1;
-		else
-			return 1;
-	}
-
-	/*
-	 * Short term pics in descending pic num order, long term ones in
-	 * ascending order.
-	 */
-	if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
-		return HANTRO_CMP(builder->frame_nums[idxb],
-				  builder->frame_nums[idxa]);
-
-	return HANTRO_CMP(a->pic_num, b->pic_num);
-}
-
-static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
-{
-	const struct hantro_h264_reflist_builder *builder = data;
-	const struct v4l2_h264_dpb_entry *a, *b;
-	s32 poca, pocb;
-	u8 idxa, idxb;
-
-	idxa = *((u8 *)ptra);
-	idxb = *((u8 *)ptrb);
-	a = &builder->dpb[idxa];
-	b = &builder->dpb[idxb];
-
-	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
-	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
-		/* Short term pics firt. */
-		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
-			return -1;
-		else
-			return 1;
-	}
-
-	/* Long term pics in ascending pic num order. */
-	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-		return HANTRO_CMP(a->pic_num, b->pic_num);
-
-	poca = builder->pocs[idxa];
-	pocb = builder->pocs[idxb];
-
-	/*
-	 * Short term pics with POC < cur POC first in POC descending order
-	 * followed by short term pics with POC > cur POC in POC ascending
-	 * order.
-	 */
-	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
-		return HANTRO_CMP(poca, pocb);
-	else if (poca < builder->curpoc)
-		return HANTRO_CMP(pocb, poca);
-
-	return HANTRO_CMP(poca, pocb);
-}
-
-static int b1_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
-{
-	const struct hantro_h264_reflist_builder *builder = data;
-	const struct v4l2_h264_dpb_entry *a, *b;
-	s32 poca, pocb;
-	u8 idxa, idxb;
-
-	idxa = *((u8 *)ptra);
-	idxb = *((u8 *)ptrb);
-	a = &builder->dpb[idxa];
-	b = &builder->dpb[idxb];
-
-	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
-	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
-		/* Short term pics firt. */
-		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
-			return -1;
-		else
-			return 1;
-	}
-
-	/* Long term pics in ascending pic num order. */
-	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-		return HANTRO_CMP(a->pic_num, b->pic_num);
-
-	poca = builder->pocs[idxa];
-	pocb = builder->pocs[idxb];
-
-	/*
-	 * Short term pics with POC > cur POC first in POC ascending order
-	 * followed by short term pics with POC < cur POC in POC descending
-	 * order.
-	 */
-	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
-		return HANTRO_CMP(pocb, poca);
-	else if (poca < builder->curpoc)
-		return HANTRO_CMP(pocb, poca);
-
-	return HANTRO_CMP(poca, pocb);
-}
-
-static void
-build_p_ref_list(const struct hantro_h264_reflist_builder *builder,
-		 u8 *reflist)
-{
-	memcpy(reflist, builder->unordered_reflist,
-	       sizeof(builder->unordered_reflist));
-	sort_r(reflist, builder->num_valid, sizeof(*reflist),
-	       p_ref_list_cmp, NULL, builder);
-}
-
-static void
-build_b_ref_lists(const struct hantro_h264_reflist_builder *builder,
-		  u8 *b0_reflist, u8 *b1_reflist)
-{
-	memcpy(b0_reflist, builder->unordered_reflist,
-	       sizeof(builder->unordered_reflist));
-	sort_r(b0_reflist, builder->num_valid, sizeof(*b0_reflist),
-	       b0_ref_list_cmp, NULL, builder);
-
-	memcpy(b1_reflist, builder->unordered_reflist,
-	       sizeof(builder->unordered_reflist));
-	sort_r(b1_reflist, builder->num_valid, sizeof(*b1_reflist),
-	       b1_ref_list_cmp, NULL, builder);
-
-	if (builder->num_valid > 1 &&
-	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
-		swap(b1_reflist[0], b1_reflist[1]);
-}
-
 static bool dpb_entry_match(const struct v4l2_h264_dpb_entry *a,
 			    const struct v4l2_h264_dpb_entry *b)
 {
@@ -560,7 +337,7 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 {
 	struct hantro_h264_dec_hw_ctx *h264_ctx = &ctx->h264_dec;
 	struct hantro_h264_dec_ctrls *ctrls = &h264_ctx->ctrls;
-	struct hantro_h264_reflist_builder reflist_builder;
+	struct v4l2_h264_reflist_builder reflist_builder;
 
 	hantro_prepare_run(ctx);
 
@@ -596,10 +373,12 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 	prepare_table(ctx);
 
 	/* Build the P/B{0,1} ref lists. */
-	init_reflist_builder(ctx, &reflist_builder);
-	build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
-	build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
-			  h264_ctx->reflists.b1);
+	v4l2_h264_init_reflist_builder(&reflist_builder, ctrls->decode,
+				       &ctrls->slices[0], ctrls->sps,
+				       ctx->h264_dec.dpb);
+	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
+	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
+				    h264_ctx->reflists.b1);
 	return 0;
 }
 
-- 
2.23.0

