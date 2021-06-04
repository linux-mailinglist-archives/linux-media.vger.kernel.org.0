Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76DA39B979
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhFDNIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhFDNIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:08:46 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AECC06174A;
        Fri,  4 Jun 2021 06:07:00 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:389:b21e:a7e4:8cad])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1C9541F439D1;
        Fri,  4 Jun 2021 14:06:58 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 8/8] media: hantro: Add scaling lists feature
Date:   Fri,  4 Jun 2021 15:06:19 +0200
Message-Id: <20210604130619.491200-9-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
References: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the bitstream embedded scaling lists allow the driver to use
them for decode the frames.
The scaling lists are expected to be in raster scan order (i.e. not up
right diagonal scan order)
Allocate the memory needed to store lists.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro_drv.c     |  8 +--
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 52 +++++++++++++++++++
 drivers/staging/media/hantro/hantro_hevc.c    | 21 ++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  3 ++
 4 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 5e6609fa4143..324619c78ada 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -281,9 +281,6 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 		    sps->bit_depth_luma_minus8 != 2)
 			/* Only 8-bit or 10-bit is supported */
 			return -EINVAL;
-		if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED)
-			/* No scaling support */
-			return -EINVAL;
 		if (sps->bit_depth_luma_minus8 == 0 &&
 		    hantro_is_10bit_dst_format(ctx)) {
 			return -EINVAL;
@@ -469,6 +466,11 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
 		},
+	}, {
+		.codec = HANTRO_HEVC_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
+		},
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
 		.cfg = {
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 741b029aef9e..f7be8629c3cc 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -597,6 +597,56 @@ static void set_buffers(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, G2_TILE_BSD, ctx->hevc_dec.tile_bsd.dma);
 }
 
+static void prepare_scaling_list_buffer(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
+	const struct v4l2_ctrl_hevc_scaling_matrix *sc = ctrls->scaling;
+	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
+	u8 *p = ((u8 *)ctx->hevc_dec.scaling_lists.cpu);
+	unsigned int scaling_list_enabled;
+	unsigned int i, j, k;
+
+	scaling_list_enabled = !!(sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED);
+	hantro_reg_write(vpu, &g2_scaling_list_e, scaling_list_enabled);
+
+	if (!scaling_list_enabled)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(sc->scaling_list_dc_coef_16x16); i++)
+		*p++ = sc->scaling_list_dc_coef_16x16[i];
+
+	for (i = 0; i < ARRAY_SIZE(sc->scaling_list_dc_coef_32x32); i++)
+		*p++ = sc->scaling_list_dc_coef_32x32[i];
+
+	/* 128-bit boundary */
+	p += 8;
+
+	/* write scaling lists column by column */
+
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 4; j++)
+			for (k = 0; k < 4; k++)
+				*p++ = sc->scaling_list_4x4[i][4 * k + j];
+
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 8; j++)
+			for (k = 0; k < 8; k++)
+				*p++ = sc->scaling_list_8x8[i][8 * k + j];
+
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 8; j++)
+			for (k = 0; k < 8; k++)
+				*p++ = sc->scaling_list_16x16[i][8 * k + j];
+
+	for (i = 0; i < 2; i++)
+		for (j = 0; j < 8; j++)
+			for (k = 0; k < 8; k++)
+				*p++ = sc->scaling_list_32x32[i][8 * k + j];
+
+	hantro_write_addr(vpu, HEVC_SCALING_LIST, ctx->hevc_dec.scaling_lists.dma);
+}
+
 static void hantro_g2_check_idle(struct hantro_dev *vpu)
 {
 	int i;
@@ -657,6 +707,8 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 	set_buffers(ctx);
 	prepare_tile_info_buffer(ctx);
 
+	prepare_scaling_list_buffer(ctx);
+
 	hantro_end_prepare_run(ctx);
 
 	hantro_reg_write(vpu, &g2_mode, HEVC_DEC_MODE);
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index ae9827dd7086..57c1ddeaf2db 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -20,6 +20,8 @@
 /* tile border coefficients of filter */
 #define VERT_SAO_RAM_SIZE 48 /* bytes per pixel */
 
+#define SCALING_LIST_SIZE (16 * 64)
+
 #define MAX_TILE_COLS 20
 #define MAX_TILE_ROWS 22
 
@@ -287,6 +289,11 @@ int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx)
 	if (WARN_ON(!ctrls->decode_params))
 		return -EINVAL;
 
+	ctrls->scaling =
+		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
+	if (WARN_ON(!ctrls->scaling))
+		return -EINVAL;
+
 	ctrls->sps =
 		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_SPS);
 	if (WARN_ON(!ctrls->sps))
@@ -315,6 +322,12 @@ void hantro_hevc_dec_exit(struct hantro_ctx *ctx)
 				  hevc_dec->tile_sizes.dma);
 	hevc_dec->tile_sizes.cpu = NULL;
 
+	if (hevc_dec->scaling_lists.cpu)
+		dma_free_coherent(vpu->dev, hevc_dec->scaling_lists.size,
+				  hevc_dec->scaling_lists.cpu,
+				  hevc_dec->scaling_lists.dma);
+	hevc_dec->scaling_lists.cpu = NULL;
+
 	if (hevc_dec->tile_filter.cpu)
 		dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
 				  hevc_dec->tile_filter.cpu,
@@ -358,6 +371,14 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
 
 	hevc_dec->tile_sizes.size = size;
 
+	hevc_dec->scaling_lists.cpu = dma_alloc_coherent(vpu->dev, SCALING_LIST_SIZE,
+							 &hevc_dec->scaling_lists.dma,
+							 GFP_KERNEL);
+	if (!hevc_dec->scaling_lists.cpu)
+		return -ENOMEM;
+
+	hevc_dec->scaling_lists.size = SCALING_LIST_SIZE;
+
 	hantro_hevc_ref_init(ctx);
 
 	return 0;
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 2edb890f10af..88add18b1bad 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -108,6 +108,7 @@ struct hantro_h264_dec_hw_ctx {
  */
 struct hantro_hevc_dec_ctrls {
 	const struct v4l2_ctrl_hevc_decode_params *decode_params;
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling;
 	const struct v4l2_ctrl_hevc_sps *sps;
 	const struct v4l2_ctrl_hevc_pps *pps;
 	u32 hevc_hdr_skip_length;
@@ -120,6 +121,7 @@ struct hantro_hevc_dec_ctrls {
  * @tile_sao:		Tile SAO buffer
  * @tile_bsd:		Tile BSD control buffer
  * @ref_bufs:		Internal reference buffers
+ * @scaling_lists:	Scaling lists buffer
  * @ref_bufs_poc:	Internal reference buffers picture order count
  * @ref_bufs_used:	Bitfield of used reference buffers
  * @ctrls:		V4L2 controls attached to a run
@@ -131,6 +133,7 @@ struct hantro_hevc_dec_hw_ctx {
 	struct hantro_aux_buf tile_sao;
 	struct hantro_aux_buf tile_bsd;
 	struct hantro_aux_buf ref_bufs[NUM_REF_PICTURES];
+	struct hantro_aux_buf scaling_lists;
 	int ref_bufs_poc[NUM_REF_PICTURES];
 	u32 ref_bufs_used;
 	struct hantro_hevc_dec_ctrls ctrls;
-- 
2.25.1

