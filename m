Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8C9244AAF
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgHNNiE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:38:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43438 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728865AbgHNNiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:38:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E6F5D29A598
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
Subject: [PATCH v3 17/19] media: rkvdec: Use H264_SCALING_MATRIX only when required
Date:   Fri, 14 Aug 2020 10:36:32 -0300
Message-Id: <20200814133634.95665-18-ezequiel@collabora.com>
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

Implement this on rkvdec, which has hardware support for this
case.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 10 +++++++---
 drivers/staging/media/rkvdec/rkvdec.c      |  1 -
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 584e0d5c493b..9233260e14c1 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -708,9 +708,9 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	WRITE_PPS(pps->second_chroma_qp_index_offset,
 		  SECOND_CHROMA_QP_INDEX_OFFSET);
 
-	/* always use the matrix sent from userspace */
-	WRITE_PPS(1, SCALING_LIST_ENABLE_FLAG);
-
+	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT),
+		  SCALING_LIST_ENABLE_FLAG);
+	/* To be on the safe side, program the scaling matrix address */
 	scaling_distance = offsetof(struct rkvdec_h264_priv_tbl, scaling_list);
 	scaling_list_address = h264_ctx->priv_tbl.dma + scaling_distance;
 	WRITE_PPS(scaling_list_address, SCALING_LIST_ADDRESS);
@@ -792,9 +792,13 @@ static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
 				     struct rkvdec_h264_run *run)
 {
 	const struct v4l2_ctrl_h264_scaling_matrix *scaling = run->scaling_matrix;
+	const struct v4l2_ctrl_h264_pps *pps = run->pps;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
 
+	if (!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
+		return;
+
 	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_4x4) !=
 		     sizeof(scaling->scaling_list_4x4));
 	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_8x8) !=
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index cd720d726d7f..16d006b554b0 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -68,7 +68,6 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
 	},
 	{
-		.mandatory = true,
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
 	},
 	{
-- 
2.27.0

