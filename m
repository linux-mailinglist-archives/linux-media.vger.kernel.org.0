Return-Path: <linux-media+bounces-30506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61DBA92CE8
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 23:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A20144A3ECE
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 21:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2D2215186;
	Thu, 17 Apr 2025 21:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W9p+por9"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7961D215063;
	Thu, 17 Apr 2025 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927105; cv=none; b=LXLEL6iwH0D+2XMUTZ83Eem5hE7eQsfhdhM2eGNAPJf4rxpXyy5uS4MiLJKf5cQgQtCxT4iZCV6kSWUuvblDXJictIhxgZD3l+M+fHt/aHdQ/4gj6Uv9xviTA1pajNlM04VTD8j39Y6V5KkiS6zotYi8qzsGEK9MAJbjOtxcl5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927105; c=relaxed/simple;
	bh=bYeuAgZ86wBD1ei3lQM5xfSpuEibv4vRhDGU/zzY5XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vq06tzeHPOT7k8AQDYlD/b2eXpiCpR6hA338H90zxJmOprUce3X+3CUtMJ03WZY6jSvozUp0RyjAuQ1SxcYIEDkYgXAHiB2oBcO74uSYNDTmPadmfHGzk1nkQzHlZehDqkZGe1aGV2jGW5BZ2lMFymCeVDob7QKrg2W2xPH6lPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W9p+por9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744927101;
	bh=bYeuAgZ86wBD1ei3lQM5xfSpuEibv4vRhDGU/zzY5XM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W9p+por95qgpqE83Xz59vfAfoq8S6/nhTkzuroUkLvafTxD/gv6ec9aTXZmKX049q
	 Duo1u4G86L6BF6A63jsdvh5oQI2jqXp+Y8g5MWpZiRGaU/q+50mUsLjuxPYoWTPEmO
	 5JRV/kMQF2RgSM3tig7e99i6aRowL9LnsTAgG0qqFEq79owzB7rFEYy4QCbUWA7tdH
	 CyjK9HW1wKF0jJ5TG4+VrlCV+8qzg5vkFkhArcFTwXhV5TNyygZK86h6JsH/QiHty4
	 Hpk79oQ9NUd8pJEuCUxwIqOs8iqNngAzc7aGRXnJWF4acRGJnen4FzcFeHyVHApId9
	 Ta+a3CezN6yUQ==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:15:9913::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA94217E3689;
	Thu, 17 Apr 2025 23:58:20 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 17 Apr 2025 17:58:01 -0400
Subject: [PATCH v9 4/4] media: rkvdec: h264: Support High 10 and 4:2:2
 profiles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-rkvdec_h264_high10_and_422_support-v9-4-0e8738ccb46b@collabora.com>
References: <20250417-b4-rkvdec_h264_high10_and_422_support-v9-0-0e8738ccb46b@collabora.com>
In-Reply-To: <20250417-b4-rkvdec_h264_high10_and_422_support-v9-0-0e8738ccb46b@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2

From: Jonas Karlman <jonas@kwiboo.se>

Add support and enable decoding of H264 High 10 and 4:2:2 profiles.

Decoded CAPTURE buffer width is aligned to 64 pixels to accommodate HW
requirement of 10-bit format buffers, fixes decoding of all the 4:2:2
and 10bit 4:2:2 flusters tests except two stream that present some
visual artifacts.

- Hi422FREXT17_SONY_A
- Hi422FREXT19_SONY_A

The get_image_fmt() ops is implemented to select an image format
required for the provided SPS control, and returns RKVDEC_IMG_FMT_ANY
for other controls.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 37 ++++++++++++++++++++++-------
 drivers/staging/media/rkvdec/rkvdec.c      | 38 +++++++++++++++++++++++-------
 drivers/staging/media/rkvdec/rkvdec.h      |  3 +++
 3 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 8bce8902b8dda39bb2058c8504bd52ccae6b4204..d14b4d173448dbcce4ab978a83806064b100ca24 100644
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
index 6c6fe411f48772419e1810d869ab40d168848e65..26f8b8cfcf64f872de73b49b9da9df22ce22d98b 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -186,9 +186,10 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
 		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE,
-		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA,
 		.cfg.menu_skip_mask =
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE),
 		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
 	},
 	{
@@ -203,11 +204,23 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
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
@@ -230,21 +243,28 @@ static const struct rkvdec_ctrls rkvdec_vp9_ctrls = {
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
@@ -259,8 +279,8 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
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
index e466a2753ccfc13738e0a672bc578e521af2c3f2..9a9f4fced7a184b952d341d75c7faedaa75163d6 100644
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
2.49.0


