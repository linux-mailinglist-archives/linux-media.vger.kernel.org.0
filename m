Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7702225103C
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 05:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgHYDyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 23:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgHYDyf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 23:54:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4C5C061574;
        Mon, 24 Aug 2020 20:54:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 20E6A298CD5
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
Subject: [PATCH v4 17/19] media: rkvdec: Use H264_SCALING_MATRIX only when required
Date:   Tue, 25 Aug 2020 00:52:43 -0300
Message-Id: <20200825035245.594982-18-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200825035245.594982-1-ezequiel@collabora.com>
References: <20200825035245.594982-1-ezequiel@collabora.com>
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
Tested-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 10 +++++++---
 drivers/staging/media/rkvdec/rkvdec.c      |  1 -
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index c45cd1617b3b..7cc3b478a5f4 100644
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
index 9f59dfb62d3f..d25c4a37e2af 100644
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

