Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A916E251034
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 05:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728788AbgHYDyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 23:54:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53080 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728577AbgHYDyM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 23:54:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 04892298D7E
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
Subject: [PATCH v4 13/19] media: rkvdec: Don't require unneeded H264_SLICE_PARAMS
Date:   Tue, 25 Aug 2020 00:52:39 -0300
Message-Id: <20200825035245.594982-14-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200825035245.594982-1-ezequiel@collabora.com>
References: <20200825035245.594982-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that slice invariant parameters have been moved,
the driver no longer needs this control, so drop it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Jonas Karlman <jonas@kwiboo.se>
---
v2:
* Fix wrongly removed SPS.
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 4 ----
 drivers/staging/media/rkvdec/rkvdec.c      | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 90f211839be2..c45cd1617b3b 100644
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
@@ -1066,9 +1065,6 @@ static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 			      V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
 	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
-	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 			      V4L2_CID_MPEG_VIDEO_H264_SPS);
 	run->sps = ctrl ? ctrl->p_cur.p : NULL;
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index c8151328fb70..7c5129593921 100644
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

