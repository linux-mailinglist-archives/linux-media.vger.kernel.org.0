Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCA3F8A74B
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 21:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfHLTgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 15:36:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60124 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfHLTgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 15:36:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 34D9D2852AF
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 06/11] media: cedrus: Cleanup control initialization
Date:   Mon, 12 Aug 2019 16:35:17 -0300
Message-Id: <20190812193522.10911-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812193522.10911-1-ezequiel@collabora.com>
References: <20190812193522.10911-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to introduce other controls, the control initialization
needs to support an initial struct v4l2_ctrl_control.

While here, let's cleanup the control initialization,
removing unneeded fields.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes in v5:
* None.
Changes in v4:
* New patch.
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 45 +++++++++++----------
 drivers/staging/media/sunxi/cedrus/cedrus.h |  3 +-
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 370937edfc14..7bdc413bf727 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -29,44 +29,51 @@
 
 static const struct cedrus_control cedrus_controls[] = {
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
-		.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_slice_params),
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
+		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
-		.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_quantization),
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
+		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 		.required	= false,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_decode_params),
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
+		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_slice_params),
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
+		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_SPS,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_sps),
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_SPS,
+		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_PPS,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_pps),
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_PPS,
+		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_scaling_matrix),
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
@@ -106,12 +113,8 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
 		return -ENOMEM;
 
 	for (i = 0; i < CEDRUS_CONTROLS_COUNT; i++) {
-		struct v4l2_ctrl_config cfg = {};
-
-		cfg.elem_size = cedrus_controls[i].elem_size;
-		cfg.id = cedrus_controls[i].id;
-
-		ctrl = v4l2_ctrl_new_custom(hdl, &cfg, NULL);
+		ctrl = v4l2_ctrl_new_custom(hdl, &cedrus_controls[i].cfg,
+					    NULL);
 		if (hdl->error) {
 			v4l2_err(&dev->v4l2_dev,
 				 "Failed to create new custom control\n");
@@ -178,7 +181,7 @@ static int cedrus_request_validate(struct media_request *req)
 			continue;
 
 		ctrl_test = v4l2_ctrl_request_hdl_ctrl_find(hdl,
-							    cedrus_controls[i].id);
+							    cedrus_controls[i].cfg.id);
 		if (!ctrl_test) {
 			v4l2_info(&ctx->dev->v4l2_dev,
 				  "Missing required codec control\n");
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 3f476d0fd981..283827656872 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -49,8 +49,7 @@ enum cedrus_h264_pic_type {
 };
 
 struct cedrus_control {
-	u32			id;
-	u32			elem_size;
+	struct v4l2_ctrl_config cfg;
 	enum cedrus_codec	codec;
 	unsigned char		required:1;
 };
-- 
2.22.0

