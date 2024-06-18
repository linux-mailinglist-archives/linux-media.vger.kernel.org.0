Return-Path: <linux-media+bounces-13619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99E90DCDA
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 21:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C29CB1F273A8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 19:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7691741D4;
	Tue, 18 Jun 2024 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="BIuLLz8k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3296916DC11
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718740101; cv=none; b=DNFjywPPrtDfPIhqGjlUelljjYwwH2SB9BABfASFWo1y0OC5AyGlZIABJkDtdu6j3kgcbxz1d/32Xa0C7IkWngyIEjXbBsDmShe3eIwZVZJnTwSEBd32HQkJZ5L7n6WPIJlNM27DUM3pZOdNLRryfVJsIcN30EI7sCiCHFPx9cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718740101; c=relaxed/simple;
	bh=OaadSuDg3Zt5H3nbHytRHPm2vMT7VaQsyqyPaUwTe5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OG6RL0BMsGlq+0d5FRei81JLKzBqcAfSheasQWCUqDg/P+xX+0PvdjNgkujCP6b4wTwcwKzeml/jN1Fodt7GYmeWHlKDSeyC2BHw237TlXi9szNknl9W2bAMI6sIYkr7ZVuEJ7Z2nX8LOwmKHFHSNeBrCQ0+R5IGNJYle1BiZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=BIuLLz8k; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718740060; bh=vLg1vrLKWrSir1pSxtMB4wEHVQbTsj3SVKKsHL322Sc=;
 b=BIuLLz8kcmo0o6tNrR3Nm+pHYmj7fR34PKkcYECkXZzOHPU+v/zX4NVdWDiI9jWoIHkMqmchB
 XnnqsgPM8sgs3TRv+CaCvjCf76nEEpFRR8zmrslqDvTAeDiuGhKprOlFMJv0prSWmfKN3JAwcON
 0kYJJ72CZ/kYGY3/J267OrXPBIY1osUvmukA1xiyfcz4RQxERqMj4h5JETC2iHDGJBDi4ywMWlt
 1ALPuyDMqjmKYe5hpDuXTuePkV9rGqAo7mstp7BlBRvOidpijsNrJI42HFeIqIy0gjjcSUsRIkA
 qMl7iiGW8GC8tlRyNfj8Kjz3ARggGEHkck5ygZhroslA==
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Christopher Obbard
 <chris.obbard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v5 10/10] media: rkvdec: h264: Support High 10 and 4:2:2 profiles
Date: Tue, 18 Jun 2024 19:46:34 +0000
Message-ID: <20240618194647.742037-11-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618194647.742037-1-jonas@kwiboo.se>
References: <20240618194647.742037-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 6671e45a64ade33c9005a025

Add support and enable decoding of H264 High 10 and 4:2:2 profiles.

Decoded CAPTURE buffer width is aligned to 64 pixels to accommodate HW
requirement of 10-bit format buffers, fixes decoding of:

- Hi422FR13_SONY_A
- Hi422FR14_SONY_A
- Hi422FR15_SONY_A
- Hi422FR6_SONY_A
- Hi422FR7_SONY_A
- Hi422FR8_SONY_A
- Hi422FR9_SONY_A
- Hi422FREXT18_SONY_A

The get_image_fmt() ops is implemented to select an image format
required for the provided SPS control.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
v5:
- Move buffer align from rkvdec_fill_decoded_pixfmt to min/step_width
- Use correct profiles for V4L2_CID_MPEG_VIDEO_H264_PROFILE
- Collect t-b tags

v4:
- Change to use get_image_fmt() ops

v3:
- Add get_fmt_opaque ops, the expected pixelformat is used as opaque
- Add new valid_fmt ops that validate pixelformat matches opaque
- Update H264_PROFILE control max value

 drivers/staging/media/rkvdec/rkvdec-h264.c | 37 +++++++++++++++-----
 drivers/staging/media/rkvdec/rkvdec.c      | 40 ++++++++++++++++------
 drivers/staging/media/rkvdec/rkvdec.h      |  3 ++
 3 files changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 8bce8902b8dd..d14b4d173448 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -1027,24 +1027,42 @@ static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
 	return 0;
 }
 
+static enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx *ctx,
+						       struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+
+	if (ctrl->id != V4L2_CID_STATELESS_H264_SPS)
+		return RKVDEC_IMG_FMT_ANY;
+
+	if (sps->bit_depth_luma_minus8 == 0) {
+		if (sps->chroma_format_idc == 2)
+			return RKVDEC_IMG_FMT_422_8BIT;
+		else
+			return RKVDEC_IMG_FMT_420_8BIT;
+	} else if (sps->bit_depth_luma_minus8 == 2) {
+		if (sps->chroma_format_idc == 2)
+			return RKVDEC_IMG_FMT_422_10BIT;
+		else
+			return RKVDEC_IMG_FMT_420_10BIT;
+	}
+
+	return RKVDEC_IMG_FMT_ANY;
+}
+
 static int rkvdec_h264_validate_sps(struct rkvdec_ctx *ctx,
 				    const struct v4l2_ctrl_h264_sps *sps)
 {
 	unsigned int width, height;
 
-	/*
-	 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
-	 * but it's currently broken in the driver.
-	 * Reject them for now, until it's fixed.
-	 */
-	if (sps->chroma_format_idc > 1)
-		/* Only 4:0:0 and 4:2:0 are supported */
+	if (sps->chroma_format_idc > 2)
+		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
 		return -EINVAL;
 	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
 		/* Luma and chroma bit depth mismatch */
 		return -EINVAL;
-	if (sps->bit_depth_luma_minus8 != 0)
-		/* Only 8-bit is supported */
+	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
+		/* Only 8-bit and 10-bit is supported */
 		return -EINVAL;
 
 	width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
@@ -1190,4 +1208,5 @@ const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops = {
 	.stop = rkvdec_h264_stop,
 	.run = rkvdec_h264_run,
 	.try_ctrl = rkvdec_h264_try_ctrl,
+	.get_image_fmt = rkvdec_h264_get_image_fmt,
 };
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 455b9cd34b6a..f5e393d4377c 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -192,10 +192,11 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 	},
 	{
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA,
 		.cfg.menu_skip_mask =
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE),
 		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
 	},
 	{
@@ -210,11 +211,23 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
 };
 
-static const struct rkvdec_decoded_fmt_desc rkvdec_h264_vp9_decoded_fmts[] = {
+static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.image_fmt = RKVDEC_IMG_FMT_420_8BIT,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV15,
+		.image_fmt = RKVDEC_IMG_FMT_420_10BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.image_fmt = RKVDEC_IMG_FMT_422_8BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV20,
+		.image_fmt = RKVDEC_IMG_FMT_422_10BIT,
+	},
 };
 
 static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] = {
@@ -237,21 +250,28 @@ static const struct rkvdec_ctrls rkvdec_vp9_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_vp9_ctrl_descs),
 };
 
+static const struct rkvdec_decoded_fmt_desc rkvdec_vp9_decoded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.image_fmt = RKVDEC_IMG_FMT_420_8BIT,
+	},
+};
+
 static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.frmsize = {
-			.min_width = 48,
+			.min_width = 64,
 			.max_width = 4096,
-			.step_width = 16,
+			.step_width = 64,
 			.min_height = 48,
 			.max_height = 2560,
 			.step_height = 16,
 		},
 		.ctrls = &rkvdec_h264_ctrls,
 		.ops = &rkvdec_h264_fmt_ops,
-		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_vp9_decoded_fmts),
-		.decoded_fmts = rkvdec_h264_vp9_decoded_fmts,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
+		.decoded_fmts = rkvdec_h264_decoded_fmts,
 		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
 	},
 	{
@@ -266,8 +286,8 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		},
 		.ctrls = &rkvdec_vp9_ctrls,
 		.ops = &rkvdec_vp9_fmt_ops,
-		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_vp9_decoded_fmts),
-		.decoded_fmts = rkvdec_h264_vp9_decoded_fmts,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
+		.decoded_fmts = rkvdec_vp9_decoded_fmts,
 	}
 };
 
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index e466a2753ccf..9a9f4fced7a1 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -80,6 +80,9 @@ struct rkvdec_coded_fmt_ops {
 enum rkvdec_image_fmt {
 	RKVDEC_IMG_FMT_ANY = 0,
 	RKVDEC_IMG_FMT_420_8BIT,
+	RKVDEC_IMG_FMT_420_10BIT,
+	RKVDEC_IMG_FMT_422_8BIT,
+	RKVDEC_IMG_FMT_422_10BIT,
 };
 
 struct rkvdec_decoded_fmt_desc {
-- 
2.45.2


