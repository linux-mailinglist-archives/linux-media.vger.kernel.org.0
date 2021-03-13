Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC0A339EA3
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhCMOnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:51 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58243 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234039AbhCMOnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UIlV5f5; Sat, 13 Mar 2021 15:43:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646611; bh=aOE4vYXLIcxLMsfBLOcJF9b/i7NyWXm53oDkhNM/Fa0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=P+BOudshLA6Eam5JqoFZuRnaG6ng/o8w9jLA11XIRckRevbWimKEEVejM060J9xKg
         PKeQDMO4weAXeuDKEIp1JMQdmey8+iQrXsaLsWBwHNgeOwgQS7QYYkm41kzpCfBECW
         I2VWzd8fteTuEHD7yq+lyumaEpN0joh30awGmHLgahsrCZMkXNS3HcmEFHKv995z+w
         k6A2u7Lb80RG4a38KJckzFDWvALo0T+9hKMqa//a8AI7Ugfjb8Mo8izQSl3oUnNz8M
         v9U4dGLG63p8ZZh2LGJ7bHxuy1CaGSoog77y/u76m5vZN1mTLBULHF0Y/IQSIYVP4l
         AQzTKr1a1vCNQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 11/15] staging/media: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:19 +0100
Message-Id: <20210313144323.143600-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGjXQlB6dPm00Q5+tRzwB3aFZ8OPWH98sQ8KnCSmkllNXyOGRQ451yEBhBRoSYMx/70Ei/1lTHb4u1Yw6H0ALeY4fngk6nnf7VxwMjVJZ/QCpkLpMsRG
 0cbnbgZrMioPgn2hCI1grQsUPJS4MPV7NF0UM8f3Qt46iZkw1yyvlU5ZteXZXVD7CVPHuWYjWWnA7sAzN4+F8MCOgsnyOHL8eOqVNGSWDDRgqL0ulujm5oSG
 weKk9dhW0UbALkS0GbKq4Ua7DNlgTvhiDCO8eUKkv+J+RlHCMgI1ZUYQVYYllrLhoOtQ7bGTxoQ5ns0gcRVG3SUfLe21/fiJSZ6KWQ+tbog6fM3CObuQ2YzZ
 CclsM0VNtE3ny/g1X0fBANEUoLwNfQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/hantro/hantro_drv.c     | 16 ++++-----
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  4 +--
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |  2 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  4 +--
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |  2 +-
 drivers/staging/media/rkvdec/rkvdec.c         | 16 ++++-----
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 34 +++++++++----------
 .../staging/media/sunxi/cedrus/cedrus_dec.c   | 12 +++----
 8 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index e5f200e64993..3ff83550a193 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -289,17 +289,17 @@ static const struct hantro_ctrl controls[] = {
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
+			.id = V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS,
 		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
+			.id = V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION,
 		},
 	}, {
 		.codec = HANTRO_VP8_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER,
+			.id = V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
@@ -341,12 +341,12 @@ static const struct hantro_ctrl controls[] = {
 	}, {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-			.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			.id = V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+			.min = V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE,
+			.max = V4L2_CODEC_VIDEO_H264_PROFILE_HIGH,
 			.menu_skip_mask =
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
-			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
+			BIT(V4L2_CODEC_VIDEO_H264_PROFILE_EXTENDED),
+			.def = V4L2_CODEC_VIDEO_H264_PROFILE_MAIN,
 		}
 	}, {
 	},
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 6386a3989bfe..3feaef6115de 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -88,7 +88,7 @@ hantro_g1_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
 	struct v4l2_ctrl_mpeg2_quantization *quantization;
 
 	quantization = hantro_get_ctrl(ctx,
-				       V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+				       V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION);
 	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
 				     quantization);
 	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
@@ -171,7 +171,7 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	hantro_start_prepare_run(ctx);
 
 	slice_params = hantro_get_ctrl(ctx,
-				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
+				       V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS);
 	sequence = &slice_params->sequence;
 	picture = &slice_params->picture;
 
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index a5cdf150cd16..a29bb9ea07d5 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -437,7 +437,7 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 
 	hantro_start_prepare_run(ctx);
 
-	hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
+	hdr = hantro_get_ctrl(ctx, V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER);
 	if (WARN_ON(!hdr))
 		return;
 
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index f610fa5b4335..bc9272c58379 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -90,7 +90,7 @@ rk3399_vpu_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
 	struct v4l2_ctrl_mpeg2_quantization *quantization;
 
 	quantization = hantro_get_ctrl(ctx,
-				       V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+				       V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION);
 	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu, quantization);
 	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
 			   VDPU_REG_QTABLE_BASE);
@@ -172,7 +172,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	hantro_start_prepare_run(ctx);
 
 	slice_params = hantro_get_ctrl(ctx,
-				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
+				       V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS);
 	sequence = &slice_params->sequence;
 	picture = &slice_params->picture;
 
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
index a4a792f00b11..3f66139a3d6a 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
@@ -515,7 +515,7 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 
 	hantro_start_prepare_run(ctx);
 
-	hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
+	hdr = hantro_get_ctrl(ctx, V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER);
 	if (WARN_ON(!hdr))
 		return;
 
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d3eb81ee8dc2..254f6b6f4428 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -83,17 +83,17 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 		.cfg.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
 	},
 	{
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.cfg.id = V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+		.cfg.min = V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE,
+		.cfg.max = V4L2_CODEC_VIDEO_H264_PROFILE_HIGH,
 		.cfg.menu_skip_mask =
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
-		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
+			BIT(V4L2_CODEC_VIDEO_H264_PROFILE_EXTENDED),
+		.cfg.def = V4L2_CODEC_VIDEO_H264_PROFILE_MAIN,
 	},
 	{
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-		.cfg.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
-		.cfg.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+		.cfg.id = V4L2_CID_CODEC_VIDEO_H264_LEVEL,
+		.cfg.min = V4L2_CODEC_VIDEO_H264_LEVEL_1_0,
+		.cfg.max = V4L2_CODEC_VIDEO_H264_LEVEL_5_1,
 	},
 };
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 7bd9291c8d5f..7e9ee46ec2b6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -31,13 +31,13 @@
 static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
+			.id	= V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS,
 		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
+			.id	= V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION,
 		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 	},
@@ -102,52 +102,52 @@ static const struct cedrus_control cedrus_controls[] = {
 	 */
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-			.min	= V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-			.def	= V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
-			.max	= V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			.id	= V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+			.min	= V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE,
+			.def	= V4L2_CODEC_VIDEO_H264_PROFILE_MAIN,
+			.max	= V4L2_CODEC_VIDEO_H264_PROFILE_HIGH,
 			.menu_skip_mask =
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+				BIT(V4L2_CODEC_VIDEO_H264_PROFILE_EXTENDED),
 		},
 		.codec		= CEDRUS_CODEC_H264,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SPS,
+			.id	= V4L2_CID_CODEC_VIDEO_HEVC_SPS,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_PPS,
+			.id	= V4L2_CID_CODEC_VIDEO_HEVC_PPS,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS,
+			.id	= V4L2_CID_CODEC_VIDEO_HEVC_SLICE_PARAMS,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
-			.max	= V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
-			.def	= V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
+			.id	= V4L2_CID_CODEC_VIDEO_HEVC_DECODE_MODE,
+			.max	= V4L2_CODEC_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
+			.def	= V4L2_CODEC_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_START_CODE,
-			.max	= V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
-			.def	= V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
+			.id	= V4L2_CID_CODEC_VIDEO_HEVC_START_CODE,
+			.max	= V4L2_CODEC_VIDEO_HEVC_START_CODE_NONE,
+			.def	= V4L2_CODEC_VIDEO_HEVC_START_CODE_NONE,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id		= V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER,
+			.id		= V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER,
 		},
 		.codec		= CEDRUS_CODEC_VP8,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index a9090daf626a..a951819b85d4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -41,9 +41,9 @@ void cedrus_device_run(void *priv)
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_MPEG2_SLICE:
 		run.mpeg2.slice_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
+			V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS);
 		run.mpeg2.quantization = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+			V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION);
 		break;
 
 	case V4L2_PIX_FMT_H264_SLICE:
@@ -63,16 +63,16 @@ void cedrus_device_run(void *priv)
 
 	case V4L2_PIX_FMT_HEVC_SLICE:
 		run.h265.sps = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_HEVC_SPS);
+			V4L2_CID_CODEC_VIDEO_HEVC_SPS);
 		run.h265.pps = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
+			V4L2_CID_CODEC_VIDEO_HEVC_PPS);
 		run.h265.slice_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
+			V4L2_CID_CODEC_VIDEO_HEVC_SLICE_PARAMS);
 		break;
 
 	case V4L2_PIX_FMT_VP8_FRAME:
 		run.vp8.frame_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
+			V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER);
 		break;
 
 	default:
-- 
2.30.1

