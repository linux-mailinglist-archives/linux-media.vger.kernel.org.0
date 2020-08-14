Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C7F244A96
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgHNNhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:37:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43246 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgHNNhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:37:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4736329A807
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 06/19] media: uapi: h264: Clean DPB entry interface
Date:   Fri, 14 Aug 2020 10:36:21 -0300
Message-Id: <20200814133634.95665-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814133634.95665-1-ezequiel@collabora.com>
References: <20200814133634.95665-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As discussed recently, the current interface for the
Decoded Picture Buffer is not enough to properly
support field coding.

This commit introduces enough semantics to support
frame and field coding, and to signal how DPB entries
are "used for reference".

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v3:
* Port to renamed types.
v2:
* Fix rkvdec usage of fields flags as noted by Jonas.
---
 .../media/v4l/ext-ctrls-codec.rst             | 24 ++++++-------------
 drivers/media/v4l2-core/v4l2-h264.c           |  4 ++--
 drivers/staging/media/rkvdec/rkvdec-h264.c    | 17 ++++++-------
 include/media/h264-ctrls.h                    |  2 +-
 4 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 714a8d9ae6a0..d14da8325382 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2063,6 +2063,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __s32
       - ``bottom_field_order_cnt``
       -
+    * - enum :c:type:`v4l2_h264_field_reference`
+      - ``reference``
+      - Specifies how the DPB entry is referenced.
     * - __u32
       - ``flags``
       - See :ref:`DPB Entry Flags <h264_dpb_flags>`
@@ -2080,29 +2083,16 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
     * - ``V4L2_H264_DPB_ENTRY_FLAG_VALID``
       - 0x00000001
-      - The DPB entry is valid and should be considered
+      - The DPB entry is valid (non-empty) and should be considered.
     * - ``V4L2_H264_DPB_ENTRY_FLAG_ACTIVE``
       - 0x00000002
-      - The DPB entry is currently being used as a reference frame
+      - The DPB entry is used for reference.
     * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
       - 0x00000004
-      - The DPB entry is a long term reference frame
+      - The DPB entry is used for long-term reference.
     * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD``
       - 0x00000008
-      - The DPB entry is a field reference, which means only one of the field
-        will be used when decoding the new frame/field. When not set the DPB
-        entry is a frame reference (both fields will be used). Note that this
-        flag does not say anything about the number of fields contained in the
-        reference frame, it just describes the one used to decode the new
-        field/frame
-    * - ``V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD``
-      - 0x00000010
-      - The DPB entry is a bottom field reference (only the bottom field of the
-        reference frame is needed to decode the new frame/field). Only valid if
-        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set. When
-        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set but
-        V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD is not, that means the
-        DPB entry is a top field reference
+      - The DPB entry is a single field or a complementary field pair.
 
 ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
     Specifies the decoding mode to use. Currently exposes slice-based and
diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
index edf6225f0522..12b751c09016 100644
--- a/drivers/media/v4l2-core/v4l2-h264.c
+++ b/drivers/media/v4l2-core/v4l2-h264.c
@@ -66,10 +66,10 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 		else
 			b->refs[i].frame_num = dpb[i].frame_num;
 
-		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
+		if (dpb[i].reference == V4L2_H264_FRAME_REF)
 			pic_order_count = min(dpb[i].top_field_order_cnt,
 					      dpb[i].bottom_field_order_cnt);
-		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
+		else if (dpb[i].reference & V4L2_H264_BOTTOM_FIELD_REF)
 			pic_order_count = dpb[i].bottom_field_order_cnt;
 		else
 			pic_order_count = dpb[i].top_field_order_cnt;
diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 7b66e2743a4f..07a80e9a9df2 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -949,16 +949,17 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
 		struct vb2_buffer *vb_buf = get_ref_buf(ctx, run, i);
 
-		refer_addr = vb2_dma_contig_plane_dma_addr(vb_buf, 0) |
-			     RKVDEC_COLMV_USED_FLAG_REF;
+		refer_addr = vb2_dma_contig_plane_dma_addr(vb_buf, 0);
 
-		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
-			refer_addr |= RKVDEC_TOPFIELD_USED_REF |
-				      RKVDEC_BOTFIELD_USED_REF;
-		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
-			refer_addr |= RKVDEC_BOTFIELD_USED_REF;
-		else
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
+			refer_addr |= RKVDEC_COLMV_USED_FLAG_REF;
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)
+			refer_addr |= RKVDEC_FIELD_REF;
+
+		if (dpb[i].reference & V4L2_H264_TOP_FIELD_REF)
 			refer_addr |= RKVDEC_TOPFIELD_USED_REF;
+		if (dpb[i].reference & V4L2_H264_BOTTOM_FIELD_REF)
+			refer_addr |= RKVDEC_BOTFIELD_USED_REF;
 
 		writel_relaxed(dpb[i].top_field_order_cnt,
 			       rkvdec->regs +  poc_reg_tbl_top_field[i]);
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 9ff085fdc9ab..4447697e9465 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -212,7 +212,6 @@ struct v4l2_ctrl_h264_slice_params {
 #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
 #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
 #define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
-#define V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD	0x10
 
 struct v4l2_h264_dpb_entry {
 	__u64 reference_ts;
@@ -221,6 +220,7 @@ struct v4l2_h264_dpb_entry {
 	/* Note that field is indicated by v4l2_buffer.field */
 	__s32 top_field_order_cnt;
 	__s32 bottom_field_order_cnt;
+	enum v4l2_h264_field_reference reference;
 	__u32 flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
 };
 
-- 
2.27.0

