Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1E821A4F7
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 18:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgGIQhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 12:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGIQhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 12:37:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2D0C08C5CE;
        Thu,  9 Jul 2020 09:37:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3C0B42A607E
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 2/2] hantro: h264: Refuse to decode unsupported bitstream
Date:   Thu,  9 Jul 2020 13:36:35 -0300
Message-Id: <20200709163635.42996-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709163635.42996-1-ezequiel@collabora.com>
References: <20200709163635.42996-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The hardware only supports 4:2:0 or 4:0:0 (monochrome),
8-bit depth content.

Verify that the SPS refers to a supported bitstream, and refuse
unsupported bitstreams by failing at TRY_EXT_CTRLS time.

Given the JPEG compression level control is the only one
that needs setting, a specific ops is provided.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_drv.c | 29 ++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 0db8ad455160..8f092a560ff4 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -261,7 +261,25 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	return vb2_queue_init(dst_vq);
 }
 
-static int hantro_s_ctrl(struct v4l2_ctrl *ctrl)
+static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS) {
+		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+
+		if (sps->chroma_format_idc > 1)
+			/* Only 4:0:0 and 4:2:0 are supported */
+			return -EINVAL;
+		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
+			/* Luma and chroma bit depth mismatch */
+			return -EINVAL;
+		if (sps->bit_depth_luma_minus8 != 0)
+			/* Only 8-bit is supported */
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static int hantro_jpeg_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct hantro_ctx *ctx;
 
@@ -282,7 +300,11 @@ static int hantro_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
-	.s_ctrl = hantro_s_ctrl,
+	.try_ctrl = hantro_try_ctrl,
+};
+
+static const struct v4l2_ctrl_ops hantro_jpeg_ctrl_ops = {
+	.s_ctrl = hantro_jpeg_s_ctrl,
 };
 
 static const struct hantro_ctrl controls[] = {
@@ -294,7 +316,7 @@ static const struct hantro_ctrl controls[] = {
 			.max = 100,
 			.step = 1,
 			.def = 50,
-			.ops = &hantro_ctrl_ops,
+			.ops = &hantro_jpeg_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
@@ -325,6 +347,7 @@ static const struct hantro_ctrl controls[] = {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
 			.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
+			.ops = &hantro_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
-- 
2.27.0

