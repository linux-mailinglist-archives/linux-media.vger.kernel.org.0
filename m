Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B1D244AB3
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbgHNNiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbgHNNiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:38:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10A6C061384;
        Fri, 14 Aug 2020 06:38:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E680329A829
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
Subject: [PATCH v3 19/19] media: cedrus: Use H264_SCALING_MATRIX only when required
Date:   Fri, 14 Aug 2020 10:36:34 -0300
Message-Id: <20200814133634.95665-20-ezequiel@collabora.com>
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

Implement this on cedrus, which has hardware support for this
case.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c      | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 826324faad7e..6ebb39e0c0ce 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -76,7 +76,7 @@ static const struct cedrus_control cedrus_controls[] = {
 			.id	= V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
 		},
 		.codec		= CEDRUS_CODEC_H264,
-		.required	= true,
+		.required	= false,
 	},
 	{
 		.cfg = {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index fe041b444385..28319351e909 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -238,8 +238,12 @@ static void cedrus_write_scaling_lists(struct cedrus_ctx *ctx,
 {
 	const struct v4l2_ctrl_h264_scaling_matrix *scaling =
 		run->h264.scaling_matrix;
+	const struct v4l2_ctrl_h264_pps *pps = run->h264.pps;
 	struct cedrus_dev *dev = ctx->dev;
 
+	if (!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
+		return;
+
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_SCALING_LIST_8x8_0,
 			       scaling->scaling_list_8x8[0],
 			       sizeof(scaling->scaling_list_8x8[0]));
@@ -442,6 +446,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	reg |= (pps->second_chroma_qp_index_offset & 0x3f) << 16;
 	reg |= (pps->chroma_qp_index_offset & 0x3f) << 8;
 	reg |= (pps->pic_init_qp_minus26 + 26 + slice->slice_qp_delta) & 0x3f;
+	if (pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT)
+		reg |= VE_H264_SHS_QP_SCALING_MATRIX_DEFAULT;
 	cedrus_write(dev, VE_H264_SHS_QP, reg);
 
 	// clear status flags
-- 
2.27.0

