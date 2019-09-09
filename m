Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA949AD3D7
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 09:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732352AbfIIH2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 03:28:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54472 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727285AbfIIH2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 03:28:24 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5355E28C2A8;
        Mon,  9 Sep 2019 08:28:22 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Francois Buergisser <fbuergisser@google.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 3/3] media: hantro: h264: Fix the frame_num wraparound case
Date:   Mon,  9 Sep 2019 09:28:15 +0200
Message-Id: <20190909072815.23981-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190909072815.23981-1-boris.brezillon@collabora.com>
References: <20190909072815.23981-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Step '8.2.4.1 Decoding process for picture numbers' was missing in the
reflist creation logic, leading to invalid P reflists when a
->frame_num wraparound happens.

Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
Reported-by: Francois Buergisser <fbuergisser@google.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/hantro/hantro_h264.c | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 881d73977ff6..e3f757a7de34 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -271,6 +271,7 @@ struct hantro_h264_reflist_builder {
 	const struct v4l2_h264_dpb_entry *dpb;
 	s32 pocs[HANTRO_H264_DPB_SIZE];
 	u8 unordered_reflist[HANTRO_H264_DPB_SIZE];
+	int frame_nums[HANTRO_H264_DPB_SIZE];
 	s32 curpoc;
 	u8 num_valid;
 };
@@ -294,13 +295,20 @@ static void
 init_reflist_builder(struct hantro_ctx *ctx,
 		     struct hantro_h264_reflist_builder *b)
 {
+	const struct v4l2_ctrl_h264_slice_params *slice_params;
 	const struct v4l2_ctrl_h264_decode_params *dec_param;
+	const struct v4l2_ctrl_h264_sps *sps;
 	struct vb2_v4l2_buffer *buf = hantro_get_dst_buf(ctx);
 	const struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
 	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
+	int cur_frame_num, max_frame_num;
 	unsigned int i;
 
 	dec_param = ctx->h264_dec.ctrls.decode;
+	slice_params = &ctx->h264_dec.ctrls.slices[0];
+	sps = ctx->h264_dec.ctrls.sps;
+	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
+	cur_frame_num = slice_params->frame_num;
 
 	memset(b, 0, sizeof(*b));
 	b->dpb = dpb;
@@ -318,6 +326,18 @@ init_reflist_builder(struct hantro_ctx *ctx,
 			continue;
 
 		buf = to_vb2_v4l2_buffer(vb2_get_buffer(cap_q, buf_idx));
+
+		/*
+		 * Handle frame_num wraparound as described in section
+		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
+		 * TODO: This logic will have to be adjusted when we start
+		 * supporting interlaced content.
+		 */
+		if (dpb[i].frame_num > cur_frame_num)
+			b->frame_nums[i] = (int)dpb[i].frame_num - max_frame_num;
+		else
+			b->frame_nums[i] = dpb[i].frame_num;
+
 		b->pocs[i] = get_poc(buf->field, dpb[i].top_field_order_cnt,
 				     dpb[i].bottom_field_order_cnt);
 		b->unordered_reflist[b->num_valid] = i;
@@ -353,7 +373,8 @@ static int p_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
 	 * ascending order.
 	 */
 	if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
-		return HANTRO_CMP(b->frame_num, a->frame_num);
+		return HANTRO_CMP(builder->frame_nums[idxb],
+				  builder->frame_nums[idxa]);
 
 	return HANTRO_CMP(a->pic_num, b->pic_num);
 }
-- 
2.21.0

