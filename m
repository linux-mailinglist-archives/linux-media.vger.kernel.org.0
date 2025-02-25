Return-Path: <linux-media+bounces-26923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FC8A43A17
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E239188C531
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AD5266590;
	Tue, 25 Feb 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="I5YRzBa7"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490B215772;
	Tue, 25 Feb 2025 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476535; cv=pass; b=Nu/VcWQv3134kjkrN5Y9UVQAvrcgRTATOzxv4TNK3P0a5yR8jegLeBjV9v+q/+sxKraW/IJ7XDe1K7V9HsYgX5fTQp7I6eElzJdciRIH/ECKG4Qn0kMAqblz2z6fwAX3I9J3XmXgHhDS47uk+dUKffEwWZJh3RrMpAkj68OeOOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476535; c=relaxed/simple;
	bh=N5jUNlWPDJe6pD+QHyN/c6Z3PcAOqvjWlUB8QA09lrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpQSshKe8vsc3sGDYl9/PHC86cJ5zbgX8DqQs6l3NvBNljNwzsTAvU1DNvDNRTCCHFXlvl1TuOC9O7S/9tkET/fH3aduGOLTK5faAd1TUYn9OZxVC5HjnwmCVGQ9Gzz9LemOOsVJj18U7329hLnIMHgTpRdQZA8xWJY3tBEJsZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=I5YRzBa7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476511; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DGdk2GJrDFkoqvDfsUsLvzL1IltRpKTGufxgRf1CV/yn+Z5HL9Ug59pZLXZHFe9FLvlvU8wKWeseKb9pfeCepo4Ahv02phLK3dUkhUfZAkGmhU8gLSBtpUA0ujaGBz5lA2uD9P3Pl2y4lMfHSAhDanwPM2de6d68clXYPqc67eQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476511; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f813he9CIjQ1Ioaz2tbittxRpzX26TEh6AGlGCMqNmI=; 
	b=CNCFPSGtUq4Mi0w4jeCu25aBm45YMrvRF4Mjau/PxUlwXhStzH0JYUjE0UbmtAm0HGkxoLY35YRFu5+NSJfDdB2I4vnkbCZg+v+6fdkG1/c7AmZ4mTdPFx3O3leIBKl8MF2B91pLYbO0ipB5mP1I1XlQoVXqa0iV7syrC2BUinE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476511;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=f813he9CIjQ1Ioaz2tbittxRpzX26TEh6AGlGCMqNmI=;
	b=I5YRzBa7NwjWTmk1SrKuHZby0NGCcO6Ht4j8OsxotMESFWA1b0zjFtdvPdPWcQC9
	ajybQeth5P4M9C3VmpL2DmyPDdR2J0KxQCy8MoT5pOt8Z0ty4PvsVX/kxgfqKtZwzL/
	HuXonthNdqOZOLBCP0a0VQOTh2bbctWpdeEBKMdo=
Received: by mx.zohomail.com with SMTPS id 1740476508950172.31338096378624;
	Tue, 25 Feb 2025 01:41:48 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 25 Feb 2025 10:40:28 +0100
Subject: [PATCH v7 07/12] media: rkvdec: Extract decoded format enumeration
 into helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-7-7992a68a4910@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476426; l=3784;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=RSQZQqZZVnoCe1gog6U2AiCd3QpQqZlEPDJjUoDLNn4=;
 b=yLSOBoJ0o4imr0nBKyr3dC4VXh9atoi5XaaWVL/0JiE8WIq58cpMc9E9kAydULjGFYSRZnpkppfs
 Rz5Hz9jvDlKXxgx8/4qoqdbeyKYID1YxzTdITFyRlGuysv4jnu/4
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

From: Jonas Karlman <jonas@kwiboo.se>

Add a rkvdec_is_valid_fmt() helper that check if a fourcc is a supported
CAPTURE format, and a rkvdec_enum_decoded_fmt() helper that enumerates
valid formats.

This moves current code into helper functions in preparation for adding
CAPTURE format filtering and validation in next patch.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 49 +++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 1f8f98cf91dc205f4a9da2712c81e90b726a6e57..52e64b399dcc4a0c028cac908c0b1ceb49956c5f 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -27,6 +27,32 @@
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
 
+static u32 rkvdec_enum_decoded_fmt(struct rkvdec_ctx *ctx, int index)
+{
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+
+	if (WARN_ON(!desc))
+		return 0;
+
+	if (index >= desc->num_decoded_fmts)
+		return 0;
+
+	return desc->decoded_fmts[index];
+}
+
+static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc)
+{
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	unsigned int i;
+
+	for (i = 0; i < desc->num_decoded_fmts; i++) {
+		if (desc->decoded_fmts[i] == fourcc)
+			return true;
+	}
+
+	return false;
+}
+
 static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 				       struct v4l2_pix_format_mplane *pix_mp)
 {
@@ -52,8 +78,10 @@ static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
 static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_format *f = &ctx->decoded_fmt;
+	u32 fourcc;
 
-	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
+	fourcc = rkvdec_enum_decoded_fmt(ctx, 0);
+	rkvdec_reset_fmt(ctx, f, fourcc);
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
 	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
@@ -244,7 +272,6 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
 	const struct rkvdec_coded_fmt_desc *coded_desc;
-	unsigned int i;
 
 	/*
 	 * The codec context should point to a coded format desc, if the format
@@ -255,13 +282,8 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	if (WARN_ON(!coded_desc))
 		return -EINVAL;
 
-	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
-		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
-			break;
-	}
-
-	if (i == coded_desc->num_decoded_fmts)
-		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
+	if (!rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat))
+		pix_mp->pixelformat = rkvdec_enum_decoded_fmt(ctx, 0);
 
 	/* Always apply the frmsize constraint of the coded end. */
 	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
@@ -425,14 +447,13 @@ static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	u32 fourcc;
 
-	if (WARN_ON(!ctx->coded_fmt_desc))
-		return -EINVAL;
-
-	if (f->index >= ctx->coded_fmt_desc->num_decoded_fmts)
+	fourcc = rkvdec_enum_decoded_fmt(ctx, f->index);
+	if (!fourcc)
 		return -EINVAL;
 
-	f->pixelformat = ctx->coded_fmt_desc->decoded_fmts[f->index];
+	f->pixelformat = fourcc;
 	return 0;
 }
 

-- 
2.25.1


