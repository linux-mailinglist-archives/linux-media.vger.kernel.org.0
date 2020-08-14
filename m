Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E83244AA1
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgHNNhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbgHNNhk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:37:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF812C061384;
        Fri, 14 Aug 2020 06:37:39 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D5C9129A807
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
Subject: [PATCH v3 12/19] media: hantro: Don't require unneeded H264_SLICE_PARAMS
Date:   Fri, 14 Aug 2020 10:36:27 -0300
Message-Id: <20200814133634.95665-13-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814133634.95665-1-ezequiel@collabora.com>
References: <20200814133634.95665-1-ezequiel@collabora.com>
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
 drivers/staging/media/hantro/hantro_drv.c  | 5 -----
 drivers/staging/media/hantro/hantro_h264.c | 5 -----
 drivers/staging/media/hantro/hantro_hw.h   | 2 --
 3 files changed, 12 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 34797507f214..3cd00cc0a364 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -306,11 +306,6 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
 		},
-	}, {
-		.codec = HANTRO_H264_DECODER,
-		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
-		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 0cbe514dc79a..6887318ed4d8 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -349,11 +349,6 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 	if (WARN_ON(!ctrls->decode))
 		return -EINVAL;
 
-	ctrls->slices =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
-	if (WARN_ON(!ctrls->slices))
-		return -EINVAL;
-
 	ctrls->sps =
 		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_SPS);
 	if (WARN_ON(!ctrls->sps))
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index f066de6b592d..219283a06f52 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -56,14 +56,12 @@ struct hantro_jpeg_enc_hw_ctx {
  * struct hantro_h264_dec_ctrls
  * @decode:	Decode params
  * @scaling:	Scaling info
- * @slice:	Slice params
  * @sps:	SPS info
  * @pps:	PPS info
  */
 struct hantro_h264_dec_ctrls {
 	const struct v4l2_ctrl_h264_decode_params *decode;
 	const struct v4l2_ctrl_h264_scaling_matrix *scaling;
-	const struct v4l2_ctrl_h264_slice_params *slices;
 	const struct v4l2_ctrl_h264_sps *sps;
 	const struct v4l2_ctrl_h264_pps *pps;
 };
-- 
2.27.0

