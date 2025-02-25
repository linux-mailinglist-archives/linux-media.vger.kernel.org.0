Return-Path: <linux-media+bounces-26926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C8A43A20
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322733A5FE2
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E720267B62;
	Tue, 25 Feb 2025 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="hNaQdtJL"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59295261571;
	Tue, 25 Feb 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476567; cv=pass; b=IUsgvGsqTbFJ9boaNtUG+kIWqAssDzfEtVnKQPYQzDFoJkCwDwd6NbXMvwPvcMzTzu9mbw26WQEYGpaYXiOwkk9L+vFGin00jG7yzCyeANzk6XxK8keEjM+IvbWLDHNqElJ4Be2McFy04x8feEiEGudKoIodOOOwtThSci4MQE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476567; c=relaxed/simple;
	bh=egGI9HWOuyH/tVUTqu6TwrO/JvAnCNtjavzqXXvMwh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8OvNlftaJ7XoDvL6dua9x+4dKc6UpWngXV7tXt8vCf1L/hVqN5YTEyL6nM7jrhlG+DzX9gKM8bCyQnMXixmO7xpe+fLh5y2eX9hsuGkmiFqxxV/6Mse3i+F9Pcgu1olMuNG5UwJU98s7AvPQbuuyqyIbc3Z2FgEXSXzsmohpXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=hNaQdtJL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RPm4bHwfB43th3aY5Z6sysfrtQvh0HxN01A4EngJLDqsZul+a7vQ9EXIML0hqIGka7JALzwzw4bIyLQ3ND1xt5v2JauZP1BJXprNJ0P4D89dn3mM/WCISti0pO8qC+h402u2m0YVkbF+U5yMDlZV7QvF+l9S8oz1XfrW7I2hWCY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476543; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=daDCeDVNN4yrlJzaT+dmMaCsQB40Og3yKIlcRSlt2wA=; 
	b=igxpvshb0EcXbOZWgioIeSejFpOsMl+OrqeGQu4ykUYO8a3KhsTAblhXmUlY4DwvZH160eIZmCgAIAA9GbQjtKO8/ElT0GMxUBTIjGQxaPe4vbmIExnDcrbx9+mEk4iw0ejzA6t6EP8bK5VaOyXs4TZ45mR0nSLgrxNKEuvjOl0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476543;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=daDCeDVNN4yrlJzaT+dmMaCsQB40Og3yKIlcRSlt2wA=;
	b=hNaQdtJL1URSaukOm/6LdpI9P4XQoT2NCyr/YiZQ8+uytAnzzhfEc2eXz/4FdrMf
	MAxmKNQxGrOETZ78zw+FF+oY4Fk2FTuNA7d6wiaomQxJop09NahV7iqZWhyNzh9HxBs
	oIJIfl8ODVSvTutETJUml95ML9kNaYYl1F9Ti9w8=
Received: by mx.zohomail.com with SMTPS id 1740476541110603.6926615012392;
	Tue, 25 Feb 2025 01:42:21 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 25 Feb 2025 10:40:31 +0100
Subject: [PATCH v7 10/12] media: rkvdec: h264: Support High 10 and 4:2:2
 profiles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-10-7992a68a4910@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476426; l=6652;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=/r1gSEsOE7qcDtD05dsVTqxMProeXY2AMaYuA//i0Ng=;
 b=Gg0Ip8FQGabAhkPuzmqFphEz3ZJyNMdhkDuQ7aI4b1ora3Jw9sGpNghJcOeJbQvryBtSz1+qtogX
 atVeryTEAA1p1Z4lOAOCV8fpcdh3HecOWeO8GN2MWFrCqP5NuIXT
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

From: Jonas Karlman <jonas@kwiboo.se>

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
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
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
index 5394079509305c619f1d0c1f542bfc409317c3b7..351444d569316cf52850a1831710fb5c1aceaa70 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -196,9 +196,10 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
 		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA,
 		.cfg.menu_skip_mask =
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE),
 		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
 	},
 	{
@@ -213,11 +214,23 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
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
@@ -240,21 +253,28 @@ static const struct rkvdec_ctrls rkvdec_vp9_ctrls = {
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
@@ -269,8 +289,8 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
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
2.25.1


