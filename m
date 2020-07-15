Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DA1221622
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 22:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgGOUXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 16:23:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37228 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgGOUXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 16:23:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A95412A5175
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
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 10/10] media: rkvdec: Don't require unneeded H264_SLICE_PARAMS
Date:   Wed, 15 Jul 2020 17:22:33 -0300
Message-Id: <20200715202233.185680-11-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715202233.185680-1-ezequiel@collabora.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that slice invariant parameters have been moved,
the driver no longer needs this control, so drop it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 4 ----
 drivers/staging/media/rkvdec/rkvdec.c      | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 57c084910b3b..f6e1fa19d625 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -109,7 +109,6 @@ struct rkvdec_h264_reflists {
 struct rkvdec_h264_run {
 	struct rkvdec_run base;
 	const struct v4l2_ctrl_h264_decode_params *decode_params;
-	const struct v4l2_ctrl_h264_slice_params *slices_params;
 	const struct v4l2_ctrl_h264_sps *sps;
 	const struct v4l2_ctrl_h264_pps *pps;
 	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
@@ -1067,9 +1066,6 @@ static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
 	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 			      V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
-	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_MPEG_VIDEO_H264_SPS);
 	run->sps = ctrl ? ctrl->p_cur.p : NULL;
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 			      V4L2_CID_MPEG_VIDEO_H264_PPS);
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index accb4a902fdd..8ebc9dfc83be 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -59,11 +59,6 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 		.mandatory = true,
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
 	},
-	{
-		.per_request = true,
-		.mandatory = true,
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
-	},
 	{
 		.per_request = true,
 		.mandatory = true,
-- 
2.27.0

