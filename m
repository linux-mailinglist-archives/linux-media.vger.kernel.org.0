Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7384632BB21
	for <lists+linux-media@lfdr.de>; Wed,  3 Mar 2021 22:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443488AbhCCMOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 07:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbhCCLmu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 06:42:50 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1333C06178B;
        Wed,  3 Mar 2021 03:40:22 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:2035:1dcd:21c7:b3af])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 85C751F45C2C;
        Wed,  3 Mar 2021 11:40:20 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 04/11] media: hantro: Define HEVC codec profiles and supported features
Date:   Wed,  3 Mar 2021 12:39:45 +0100
Message-Id: <20210303113952.178519-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303113952.178519-1-benjamin.gaignard@collabora.com>
References: <20210303113952.178519-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define which HEVC profiles (up to level 5.1) and features
(no scaling, no 10 bits) are supported by the driver.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro.h     |  3 ++
 drivers/staging/media/hantro/hantro_drv.c | 58 +++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 65f9f7ea7dcf..a76a0d79db9f 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -34,6 +34,7 @@ struct hantro_codec_ops;
 #define HANTRO_MPEG2_DECODER	BIT(16)
 #define HANTRO_VP8_DECODER	BIT(17)
 #define HANTRO_H264_DECODER	BIT(18)
+#define HANTRO_HEVC_DECODER	BIT(19)
 #define HANTRO_DECODERS		0xffff0000
 
 /**
@@ -99,6 +100,7 @@ struct hantro_variant {
  * @HANTRO_MODE_H264_DEC: H264 decoder.
  * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
  * @HANTRO_MODE_VP8_DEC: VP8 decoder.
+ * @HANTRO_MODE_HEVC_DEC: HEVC decoder.
  */
 enum hantro_codec_mode {
 	HANTRO_MODE_NONE = -1,
@@ -106,6 +108,7 @@ enum hantro_codec_mode {
 	HANTRO_MODE_H264_DEC,
 	HANTRO_MODE_MPEG2_DEC,
 	HANTRO_MODE_VP8_DEC,
+	HANTRO_MODE_HEVC_DEC,
 };
 
 /*
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ac1429f00b33..f0b68e16fcc0 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -245,6 +245,18 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_MPEG_VIDEO_HEVC_SPS) {
+		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
+
+		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
+			/* Luma and chroma bit depth mismatch */
+			return -EINVAL;
+		if (sps->bit_depth_luma_minus8 != 0)
+			/* Only 8-bit is supported */
+			return -EINVAL;
+		if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED)
+			/* No scaling support */
+			return -EINVAL;
 	}
 	return 0;
 }
@@ -351,6 +363,52 @@ static const struct hantro_ctrl controls[] = {
 			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
 		}
 	}, {
+		.codec = HANTRO_HEVC_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
+			.min = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
+			.max = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
+			.def = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
+		},
+	}, {
+		.codec = HANTRO_HEVC_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_START_CODE,
+			.min = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
+			.max = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
+			.def = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
+		},
+	}, {
+		.codec = HANTRO_HEVC_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+			.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+			.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		},
+	}, {
+		.codec = HANTRO_HEVC_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+			.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+			.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
+		},
+	}, {
+		.codec = HANTRO_HEVC_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_SPS,
+			.ops = &hantro_ctrl_ops,
+		},
+	}, {
+		.codec = HANTRO_HEVC_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_PPS,
+		},
+	}, {
+		.codec = HANTRO_HEVC_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
+		},
 	},
 };
 
-- 
2.25.1

