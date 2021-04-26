Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E9636AB26
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 05:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhDZDhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 23:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbhDZDhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 23:37:18 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC51C061574;
        Sun, 25 Apr 2021 20:36:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 399881F41FAA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v6 05/10] media: uapi: mpeg2: Move reference buffer fields
Date:   Mon, 26 Apr 2021 00:35:17 -0300
Message-Id: <20210426033522.69395-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210426033522.69395-1-ezequiel@collabora.com>
References: <20210426033522.69395-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The forward and backwards references are specified per-picture
and not per-slice. Move it to V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 28 +++++++++----------
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  6 ++--
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  6 ++--
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  4 +--
 include/media/mpeg2-ctrls.h                   | 16 +++++------
 5 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 84a8d45b7cc9..6628ead96b8b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1636,20 +1636,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u32
       - ``data_bit_offset``
       - Offset (in bits) to the video data in the current slice data.
-    * - __u64
-      - ``backward_ref_ts``
-      - Timestamp of the V4L2 capture buffer to use as backward reference, used
-        with B-coded and P-coded frames. The timestamp refers to the
-	``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
-	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
-	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
-    * - __u64
-      - ``forward_ref_ts``
-      - Timestamp for the V4L2 capture buffer to use as forward reference, used
-        with B-coded frames. The timestamp refers to the ``timestamp`` field in
-	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
-	function to convert the struct :c:type:`timeval` in struct
-	:c:type:`v4l2_buffer` to a __u64.
     * - __u32
       - ``quantiser_scale_code``
       - Code used to determine the quantization scale to use for the IDCT.
@@ -1742,6 +1728,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :stub-columns: 0
     :widths:       1 1 2
 
+    * - __u64
+      - ``backward_ref_ts``
+      - Timestamp of the V4L2 capture buffer to use as backward reference, used
+        with B-coded and P-coded frames. The timestamp refers to the
+	``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
+	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
+	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
+    * - __u64
+      - ``forward_ref_ts``
+      - Timestamp for the V4L2 capture buffer to use as forward reference, used
+        with B-coded frames. The timestamp refers to the ``timestamp`` field in
+	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
+	function to convert the struct :c:type:`timeval` in struct
+	:c:type:`v4l2_buffer` to a __u64.
     * - __u32
       - ``flags``
       - See :ref:`MPEG-2 Picture Flags <mpeg2_picture_flags>`.
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index f3494a70aa12..d35071e88116 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -101,12 +101,10 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 
 	switch (pic->picture_coding_type) {
 	case V4L2_MPEG2_PIC_CODING_TYPE_B:
-		backward_addr = hantro_get_ref(ctx,
-					       slice_params->backward_ref_ts);
+		backward_addr = hantro_get_ref(ctx, pic->backward_ref_ts);
 		fallthrough;
 	case V4L2_MPEG2_PIC_CODING_TYPE_P:
-		forward_addr = hantro_get_ref(ctx,
-					      slice_params->forward_ref_ts);
+		forward_addr = hantro_get_ref(ctx, pic->forward_ref_ts);
 	}
 
 	/* Source bitstream buffer */
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index 5b383906af59..18bd14704ebf 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -104,12 +104,10 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 
 	switch (pic->picture_coding_type) {
 	case V4L2_MPEG2_PIC_CODING_TYPE_B:
-		backward_addr = hantro_get_ref(ctx,
-					       slice_params->backward_ref_ts);
+		backward_addr = hantro_get_ref(ctx, pic->backward_ref_ts);
 		fallthrough;
 	case V4L2_MPEG2_PIC_CODING_TYPE_P:
-		forward_addr = hantro_get_ref(ctx,
-					      slice_params->forward_ref_ts);
+		forward_addr = hantro_get_ref(ctx, pic->forward_ref_ts);
 	}
 
 	/* Source bitstream buffer */
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 65a175c6a5c2..16e99792cf42 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -128,14 +128,14 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	forward_idx = vb2_find_timestamp(vq, slice_params->forward_ref_ts, 0);
+	forward_idx = vb2_find_timestamp(vq, pic->forward_ref_ts, 0);
 	fwd_luma_addr = cedrus_dst_buf_addr(ctx, forward_idx, 0);
 	fwd_chroma_addr = cedrus_dst_buf_addr(ctx, forward_idx, 1);
 
 	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR, fwd_luma_addr);
 	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR, fwd_chroma_addr);
 
-	backward_idx = vb2_find_timestamp(vq, slice_params->backward_ref_ts, 0);
+	backward_idx = vb2_find_timestamp(vq, pic->backward_ref_ts, 0);
 	bwd_luma_addr = cedrus_dst_buf_addr(ctx, backward_idx, 0);
 	bwd_chroma_addr = cedrus_dst_buf_addr(ctx, backward_idx, 1);
 
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index e3a741a7130e..13178022e30a 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -77,6 +77,12 @@ struct v4l2_ctrl_mpeg2_sequence {
  * All the members on this structure match the picture header and picture
  * coding extension syntaxes as specified by the MPEG-2 specification.
  *
+ * @backward_ref_ts: timestamp of the V4L2 capture buffer to use as
+ * reference for backward prediction.
+ * @forward_ref_ts: timestamp of the V4L2 capture buffer to use as
+ * reference for forward prediction. These timestamp refers to the
+ * timestamp field in struct v4l2_buffer. Use v4l2_timeval_to_ns()
+ * to convert the struct timeval to a __u64.
  * @flags: see V4L2_MPEG2_PIC_FLAG_{}.
  * @f_code[2][2]: see MPEG-2 specification.
  * @picture_coding_type: see MPEG-2 specification.
@@ -85,6 +91,8 @@ struct v4l2_ctrl_mpeg2_sequence {
  * @reserved: padding field. Should be zeroed by applications.
  */
 struct v4l2_ctrl_mpeg2_picture {
+	__u64	backward_ref_ts;
+	__u64	forward_ref_ts;
 	__u32	flags;
 	__u8	f_code[2][2];
 	__u8	picture_coding_type;
@@ -96,12 +104,6 @@ struct v4l2_ctrl_mpeg2_picture {
 /**
  * struct v4l2_ctrl_mpeg2_slice_params - MPEG-2 slice header
  *
- * @backward_ref_ts: timestamp of the V4L2 capture buffer to use as
- * reference for backward prediction.
- * @forward_ref_ts: timestamp of the V4L2 capture buffer to use as
- * reference for forward prediction. These timestamp refers to the
- * timestamp field in struct v4l2_buffer. Use v4l2_timeval_to_ns()
- * to convert the struct timeval to a __u64.
  * @quantiser_scale_code: quantiser scale integer matching an
  * homonymous syntax element.
  * @reserved: padding field. Should be zeroed by applications.
@@ -109,8 +111,6 @@ struct v4l2_ctrl_mpeg2_picture {
 struct v4l2_ctrl_mpeg2_slice_params {
 	__u32	bit_size;
 	__u32	data_bit_offset;
-	__u64	backward_ref_ts;
-	__u64	forward_ref_ts;
 	__u32	quantiser_scale_code;
 	__u32	reserved;
 };
-- 
2.30.0

