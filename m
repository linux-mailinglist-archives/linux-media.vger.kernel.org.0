Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82252244AB1
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgHNNiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:38:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43456 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbgHNNiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:38:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 643A529A825
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
Subject: [PATCH v3 18/19] media: hantro: Use H264_SCALING_MATRIX only when required
Date:   Fri, 14 Aug 2020 10:36:33 -0300
Message-Id: <20200814133634.95665-19-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814133634.95665-1-ezequiel@collabora.com>
References: <20200814133634.95665-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Baseline, Main and Extended profiles are specified to
not support a scaling matrix. Also, High profiles
can optionally specify a scaling matrix, using
SPS and PPS NAL units.

To meet this expectation, applications are required to
set the V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX control
and set the V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT
flag only when a scaling matrix is specified for a picture.

Implement this on hantro, which has hardware support for this
case.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 5 ++---
 drivers/staging/media/hantro/hantro_h264.c        | 4 ++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index f9839e9c6da5..845bef73d218 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -59,9 +59,8 @@ static void set_params(struct hantro_ctx *ctx)
 	reg = G1_REG_DEC_CTRL2_CH_QP_OFFSET(pps->chroma_qp_index_offset) |
 	      G1_REG_DEC_CTRL2_CH_QP_OFFSET2(pps->second_chroma_qp_index_offset);
 
-	/* always use the matrix sent from userspace */
-	reg |= G1_REG_DEC_CTRL2_TYPE1_QUANT_E;
-
+	if (pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT)
+		reg |= G1_REG_DEC_CTRL2_TYPE1_QUANT_E;
 	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
 		reg |= G1_REG_DEC_CTRL2_FIELDPIC_FLAG_E;
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL2);
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 6887318ed4d8..8af399c8d20e 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -197,6 +197,7 @@ assemble_scaling_list(struct hantro_ctx *ctx)
 {
 	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
 	const struct v4l2_ctrl_h264_scaling_matrix *scaling = ctrls->scaling;
+	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
 	const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
 	const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
 	const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
@@ -205,6 +206,9 @@ assemble_scaling_list(struct hantro_ctx *ctx)
 	const u32 *src;
 	int i, j;
 
+	if (!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
+		return;
+
 	for (i = 0; i < num_list_4x4; i++) {
 		src = (u32 *)&scaling->scaling_list_4x4[i];
 		for (j = 0; j < list_len_4x4 / 4; j++)
-- 
2.27.0

