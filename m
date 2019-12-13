Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4031011E794
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbfLMQEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:04:53 -0500
Received: from mailoutvs11.siol.net ([185.57.226.202]:56631 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728215AbfLMQEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:04:52 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id CD37B524565;
        Fri, 13 Dec 2019 17:04:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ATbi4QIs82Ql; Fri, 13 Dec 2019 17:04:47 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 6BEDE524543;
        Fri, 13 Dec 2019 17:04:47 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 2B84E52455E;
        Fri, 13 Dec 2019 17:04:45 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] media: cedrus: hevc: Add support for multiple slices
Date:   Fri, 13 Dec 2019 17:04:28 +0100
Message-Id: <20191213160428.54303-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213160428.54303-1-jernej.skrabec@siol.net>
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that segment address is available, support for multi-slice frames
can be easily added.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 26 ++++++++++++-------
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
index 888bfd5ca224..109d3289418c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -291,6 +291,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	const struct v4l2_ctrl_hevc_pps *pps;
 	const struct v4l2_ctrl_hevc_slice_params *slice_params;
 	const struct v4l2_hevc_pred_weight_table *pred_weight_table;
+	unsigned int width_in_ctb_luma, ctb_size_luma;
+	unsigned int log2_max_luma_coding_block_size;
 	dma_addr_t src_buf_addr;
 	dma_addr_t src_buf_end_addr;
 	u32 chroma_log2_weight_denom;
@@ -303,15 +305,17 @@ static void cedrus_h265_setup(struct cedrus_ctx *ct=
x,
 	slice_params =3D run->h265.slice_params;
 	pred_weight_table =3D &slice_params->pred_weight_table;
=20
+	log2_max_luma_coding_block_size =3D
+		sps->log2_min_luma_coding_block_size_minus3 + 3 +
+		sps->log2_diff_max_min_luma_coding_block_size;
+	ctb_size_luma =3D 1UL << log2_max_luma_coding_block_size;
+	width_in_ctb_luma =3D
+		DIV_ROUND_UP(sps->pic_width_in_luma_samples, ctb_size_luma);
+
 	/* MV column buffer size and allocation. */
 	if (!ctx->codec.h265.mv_col_buf_size) {
 		unsigned int num_buffers =3D
 			run->dst->vb2_buf.vb2_queue->num_buffers;
-		unsigned int log2_max_luma_coding_block_size =3D
-			sps->log2_min_luma_coding_block_size_minus3 + 3 +
-			sps->log2_diff_max_min_luma_coding_block_size;
-		unsigned int ctb_size_luma =3D
-			1UL << log2_max_luma_coding_block_size;
=20
 		/*
 		 * Each CTB requires a MV col buffer with a specific unit size.
@@ -366,15 +370,17 @@ static void cedrus_h265_setup(struct cedrus_ctx *ct=
x,
 	reg =3D VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_end_addr);
 	cedrus_write(dev, VE_DEC_H265_BITS_END_ADDR, reg);
=20
-	/* Coding tree block address: start at the beginning. */
-	reg =3D VE_DEC_H265_DEC_CTB_ADDR_X(0) | VE_DEC_H265_DEC_CTB_ADDR_Y(0);
+	/* Coding tree block address */
+	reg =3D VE_DEC_H265_DEC_CTB_ADDR_X(slice_params->slice_segment_addr % w=
idth_in_ctb_luma);
+	reg |=3D VE_DEC_H265_DEC_CTB_ADDR_Y(slice_params->slice_segment_addr / =
width_in_ctb_luma);
 	cedrus_write(dev, VE_DEC_H265_DEC_CTB_ADDR, reg);
=20
 	cedrus_write(dev, VE_DEC_H265_TILE_START_CTB, 0);
 	cedrus_write(dev, VE_DEC_H265_TILE_END_CTB, 0);
=20
 	/* Clear the number of correctly-decoded coding tree blocks. */
-	cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
+	if (ctx->fh.m2m_ctx->new_frame)
+		cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
=20
 	/* Initialize bitstream access. */
 	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_INIT_SWDEC);
@@ -523,8 +529,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 				V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT,
 				pps->flags);
=20
-	/* FIXME: For multi-slice support. */
-	reg |=3D VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PI=
C;
+	if (ctx->fh.m2m_ctx->new_frame)
+		reg |=3D VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_P=
IC;
=20
 	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO0, reg);
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
index 15cf1f10221b..497b1199d3fe 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -311,6 +311,7 @@ static int cedrus_s_fmt_vid_out(struct file *file, vo=
id *priv,
=20
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_H264_SLICE:
+	case V4L2_PIX_FMT_HEVC_SLICE:
 		vq->subsystem_flags |=3D
 			VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 		break;
--=20
2.24.0

