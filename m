Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB19636AB28
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 05:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhDZDhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 23:37:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38278 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbhDZDhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 23:37:23 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 86EC01F41F86
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
Subject: [PATCH v6 06/10] media: hantro/cedrus: Remove unneeded slice size and slice offset
Date:   Mon, 26 Apr 2021 00:35:18 -0300
Message-Id: <20210426033522.69395-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210426033522.69395-1-ezequiel@collabora.com>
References: <20210426033522.69395-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MPEG2_SLICE_PARAMS control is designed to refer to a
single slice. However, the Hantro and Cedrus drivers operate
in per-frame mode, and so does the current Ffmpeg and GStreamer
implementations that are tested with these two drivers.

In other words, the drivers are expecting all the slices in a picture
(with either frame or field structure) to be contained in
the OUTPUT buffer, which means the slice size and offset shouldn't be used.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c     | 4 ++--
 drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c | 4 ++--
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c      | 7 +++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index d35071e88116..c4040fba7c80 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -203,7 +203,7 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      G1_REG_TOPFIELDFIRST_E(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(4));
 
-	reg = G1_REG_STRM_START_BIT(slice_params->data_bit_offset) |
+	reg = G1_REG_STRM_START_BIT(0) |
 	      G1_REG_QSCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE) |
 	      G1_REG_CON_MV_E(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV) |
 	      G1_REG_INTRA_DC_PREC(pic->intra_dc_precision) |
@@ -212,7 +212,7 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(5));
 
 	reg = G1_REG_INIT_QP(1) |
-	      G1_REG_STREAM_LEN(slice_params->bit_size >> 3);
+	      G1_REG_STREAM_LEN(vb2_get_plane_payload(&src_buf->vb2_buf, 0));
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(6));
 
 	reg = G1_REG_ALT_SCAN_FLAG_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index 18bd14704ebf..314269811244 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -177,7 +177,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(50));
 
 	reg = VDPU_REG_INIT_QP(1) |
-	      VDPU_REG_STREAM_LEN(slice_params->bit_size >> 3);
+	      VDPU_REG_STREAM_LEN(vb2_get_plane_payload(&src_buf->vb2_buf, 0));
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(51));
 
 	reg = VDPU_REG_APF_THRESHOLD(8) |
@@ -220,7 +220,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      VDPU_REG_TOPFIELDFIRST_E(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(120));
 
-	reg = VDPU_REG_STRM_START_BIT(slice_params->data_bit_offset) |
+	reg = VDPU_REG_STRM_START_BIT(0) |
 	      VDPU_REG_QSCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE) |
 	      VDPU_REG_CON_MV_E(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV) |
 	      VDPU_REG_INTRA_DC_PREC(pic->intra_dc_precision) |
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 16e99792cf42..fd71cb175318 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -152,10 +152,9 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Source offset and length in bits. */
 
-	cedrus_write(dev, VE_DEC_MPEG_VLD_OFFSET,
-		     slice_params->data_bit_offset);
+	cedrus_write(dev, VE_DEC_MPEG_VLD_OFFSET, 0);
 
-	reg = slice_params->bit_size - slice_params->data_bit_offset;
+	reg = vb2_get_plane_payload(&run->src->vb2_buf, 0) * 8;
 	cedrus_write(dev, VE_DEC_MPEG_VLD_LEN, reg);
 
 	/* Source beginning and end addresses. */
@@ -169,7 +168,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_VLD_ADDR, reg);
 
-	reg = src_buf_addr + DIV_ROUND_UP(slice_params->bit_size, 8);
+	reg = src_buf_addr + vb2_get_plane_payload(&run->src->vb2_buf, 0);
 	cedrus_write(dev, VE_DEC_MPEG_VLD_END_ADDR, reg);
 
 	/* Macroblock address: start at the beginning. */
-- 
2.30.0

