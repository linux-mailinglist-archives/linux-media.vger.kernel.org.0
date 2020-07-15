Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85A122160E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 22:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgGOUW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 16:22:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37100 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgGOUW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 16:22:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8B7842A5182
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
Subject: [PATCH 01/10] media: uapi: h264: Update reference lists
Date:   Wed, 15 Jul 2020 17:22:24 -0300
Message-Id: <20200715202233.185680-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715202233.185680-1-ezequiel@collabora.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

When dealing with with interlaced frames, reference lists must tell if
each particular reference is meant for top or bottom field. This info
is currently not provided at all in the H264 related controls.

Make reference lists hold a structure which will also hold flags along
index into DPB array. Flags will tell if reference is meant for top or
bottom field.

Currently the only user of these lists is Cedrus which is just compile
fixed here. Actual usage of newly introduced flags will come in
following commit.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
[Ezequiel: Use a macro for the reference picture list length]
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 40 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
 include/media/h264-ctrls.h                    | 20 +++++++---
 3 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a444b1..c2e17c02f77e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1843,10 +1843,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u32
       - ``slice_group_change_cycle``
       -
-    * - __u8
+    * - struct :c:type:`v4l2_h264_reference`
       - ``ref_pic_list0[32]``
       - Reference picture list after applying the per-slice modifications
-    * - __u8
+    * - struct :c:type:`v4l2_h264_reference`
       - ``ref_pic_list1[32]``
       - Reference picture list after applying the per-slice modifications
     * - __u32
@@ -1926,6 +1926,42 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``chroma_offset[32][2]``
       -
 
+``Picture Reference``
+
+.. c:type:: v4l2_h264_reference
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_h264_reference
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``flags``
+      - See :ref:`Picture Reference Flags <h264_reference_flags>`
+    * - __u8
+      - ``index``
+      - Index into the :c:type:`v4l2_ctrl_h264_decode_params`.dpb array.
+
+.. _h264_reference_flags:
+
+``Picture Reference Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_H264_REFERENCE_FLAG_TOP_FIELD``
+      - 0x00000001
+      -
+    * - ``V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD``
+      - 0x00000002
+      -
+
 ``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
     Specifies the decode parameters (as extracted from the bitstream)
     for the associated H264 slice data. This includes the necessary
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 54ee2aa423e2..cce527bbdf86 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -166,8 +166,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
 
 static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
 				   struct cedrus_run *run,
-				   const u8 *ref_list, u8 num_ref,
-				   enum cedrus_h264_sram_off sram)
+				   const struct v4l2_h264_reference *ref_list,
+				   u8 num_ref, enum cedrus_h264_sram_off sram)
 {
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	struct vb2_queue *cap_q;
@@ -188,7 +188,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
 		int buf_idx;
 		u8 dpb_idx;
 
-		dpb_idx = ref_list[i];
+		dpb_idx = ref_list[i].index;
 		dpb = &decode->dpb[dpb_idx];
 
 		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 080fd1293c42..bca4a9887e7e 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -19,6 +19,8 @@
  */
 #define V4L2_H264_NUM_DPB_ENTRIES 16
 
+#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
+
 /* Our pixel format isn't stable at the moment */
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 
@@ -140,6 +142,16 @@ struct v4l2_h264_pred_weight_table {
 #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
 #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
 
+#define V4L2_H264_REFERENCE_FLAG_TOP_FIELD		0x01
+#define V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD		0x02
+
+struct v4l2_h264_reference {
+	__u8 flags;
+
+	/* Index into v4l2_ctrl_h264_decode_params.dpb[] */
+	__u8 index;
+};
+
 struct v4l2_ctrl_h264_slice_params {
 	/* Size in bytes, including header */
 	__u32 size;
@@ -178,12 +190,8 @@ struct v4l2_ctrl_h264_slice_params {
 	__u8 num_ref_idx_l1_active_minus1;
 	__u32 slice_group_change_cycle;
 
-	/*
-	 * Entries on each list are indices into
-	 * v4l2_ctrl_h264_decode_params.dpb[].
-	 */
-	__u8 ref_pic_list0[32];
-	__u8 ref_pic_list1[32];
+	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN];
 
 	__u32 flags;
 };
-- 
2.27.0

