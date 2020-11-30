Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4C72C8D5E
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 19:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387915AbgK3Sx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 13:53:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729791AbgK3Sx5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 13:53:57 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2E4C061A04;
        Mon, 30 Nov 2020 10:53:17 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3739E1F40F0A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 2/3] media: uapi: mpeg2: Remove unused slice size and offset
Date:   Mon, 30 Nov 2020 15:52:58 -0300
Message-Id: <20201130185259.111817-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130185259.111817-1-ezequiel@collabora.com>
References: <20201130185259.111817-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MPEG2_SLICE_PARAMS control is designed to refer to a
single slice. Conversely, in each request the OUTPUT buffer
is expected to hold a single slice, so the offset
and size fields are not needed.

The start of the slice is aligned to the start of the buffer,
and the buffer's plane payload size is the slice size.

To reduce the API surface and avoid confusion drop these
fields from control.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ------
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c        | 4 ++--
 drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c    | 4 ++--
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c         | 7 +++----
 include/media/mpeg2-ctrls.h                               | 2 --
 5 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 29da24d01aba..9a804f3037d8 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1526,12 +1526,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - __u32
-      - ``bit_size``
-      - Size (in bits) of the current slice data.
-    * - __u32
-      - ``data_bit_offset``
-      - Offset (in bits) to the video data in the current slice data.
     * - struct :c:type:`v4l2_mpeg2_sequence`
       - ``sequence``
       - Structure with MPEG-2 sequence metadata, merging relevant fields from
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 9fe442244eb9..b6086474d31f 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -206,7 +206,7 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      G1_REG_TOPFIELDFIRST_E(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(4));
 
-	reg = G1_REG_STRM_START_BIT(slice_params->data_bit_offset) |
+	reg = G1_REG_STRM_START_BIT(0) |
 	      G1_REG_QSCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE) |
 	      G1_REG_CON_MV_E(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV) |
 	      G1_REG_INTRA_DC_PREC(pic->intra_dc_precision) |
@@ -215,7 +215,7 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(5));
 
 	reg = G1_REG_INIT_QP(1) |
-	      G1_REG_STREAM_LEN(slice_params->bit_size >> 3);
+	      G1_REG_STREAM_LEN(vb2_get_plane_payload(&src_buf->vb2_buf, 0));
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(6));
 
 	reg = G1_REG_ALT_SCAN_FLAG_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index 9fdbf942cb99..28eb77b0569b 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -179,7 +179,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(50));
 
 	reg = VDPU_REG_INIT_QP(1) |
-	      VDPU_REG_STREAM_LEN(slice_params->bit_size >> 3);
+	      VDPU_REG_STREAM_LEN(vb2_get_plane_payload(&src_buf->vb2_buf, 0));
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(51));
 
 	reg = VDPU_REG_APF_THRESHOLD(8) |
@@ -222,7 +222,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      VDPU_REG_TOPFIELDFIRST_E(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(120));
 
-	reg = VDPU_REG_STRM_START_BIT(slice_params->data_bit_offset) |
+	reg = VDPU_REG_STRM_START_BIT(0) |
 	      VDPU_REG_QSCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE) |
 	      VDPU_REG_CON_MV_E(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV) |
 	      VDPU_REG_INTRA_DC_PREC(pic->intra_dc_precision) |
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 855536702bc1..6a99893cdc77 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -186,10 +186,9 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Source offset and length in bits. */
 
-	cedrus_write(dev, VE_DEC_MPEG_VLD_OFFSET,
-		     slice_params->data_bit_offset);
+	cedrus_write(dev, VE_DEC_MPEG_VLD_OFFSET, 0);
 
-	reg = slice_params->bit_size - slice_params->data_bit_offset;
+	reg = vb2_get_plane_payload(&run->src->vb2_buf, 0) * 8;
 	cedrus_write(dev, VE_DEC_MPEG_VLD_LEN, reg);
 
 	/* Source beginning and end addresses. */
@@ -203,7 +202,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_VLD_ADDR, reg);
 
-	reg = src_buf_addr + DIV_ROUND_UP(slice_params->bit_size, 8);
+	reg = src_buf_addr + vb2_get_plane_payload(&run->src->vb2_buf, 0);
 	cedrus_write(dev, VE_DEC_MPEG_VLD_END_ADDR, reg);
 
 	/* Macroblock address: start at the beginning. */
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 4bc85cd99b15..038206c7e6f5 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -68,8 +68,6 @@ struct v4l2_mpeg2_picture {
 };
 
 struct v4l2_ctrl_mpeg2_slice_params {
-	__u32	bit_size;
-	__u32	data_bit_offset;
 	__u64	backward_ref_ts;
 	__u64	forward_ref_ts;
 
-- 
2.27.0

