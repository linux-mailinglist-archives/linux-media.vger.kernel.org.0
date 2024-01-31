Return-Path: <linux-media+bounces-4507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB16843D40
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 11:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFECFB23701
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 10:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810596D1C3;
	Wed, 31 Jan 2024 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0GaId8Ax"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A4469E0D
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706698219; cv=none; b=FFUc23ZemGdt1MvJVPIcmWQTaxvo/h0PdJkNldDaulJ44jucl6lexuzTXl/VFvdXi09oiRypGRv4Roc6DwhIEFUEb5JglMs/trUUD6PE32dHm9piuUW3N0O2kncnKpUZfbrzPDkdBLMS1SvlCDvJar+r1o0v7rkjHqktN+Xct3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706698219; c=relaxed/simple;
	bh=m+4+w8Nro/6qVnOqVGso2S9Ki0IT4qV76zZG6m3in1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WNkIVLU+hQ75ggD5bRE9kB3sY9qbICZQOtN/0aUCiToOfzQbv/cm4sBV1vR8uxseAwKJr2/Wp4EGPpP1JJlQiGXM/2JZuuGNUbUonejjaxqHfBy2ZxvKjk3+2N2ZzO4iqqmSMDBfzXP1WqTa+h94TFWujhmS7G31FP2ZywIBR1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0GaId8Ax; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706698215;
	bh=m+4+w8Nro/6qVnOqVGso2S9Ki0IT4qV76zZG6m3in1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0GaId8Ax/q346NDJYUGLxbvfCfDrWDq7vgJabX9t684hSVr8E+1aIjMVomYcStNQ/
	 MoqtPqUsUgqqertSxAPcycscdyKOTVGAANPGEgABOtvQ9M+F9zimmdrzb1Vnu9Sksi
	 eEoHuTpQ6dp+t57wy9Bs0joVzhE52Om9IssLF9254ak2ESjCr7X+I4Q1U3HEefJgJk
	 sPqIpWaVqOWp8uiGqsInrvWyDO3D8gRL8IZfUfB3DyLFTUGWPFU358gid/lJ2IRIi2
	 /Fve7ElvyzPTS0WHu3/t4X6+aCcC/Cq4zoQctewuGz1y9zJV2g/+3X1YiItM2X8Mot
	 Yd/gT7FsDLJWw==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6DE9D378203B;
	Wed, 31 Jan 2024 10:50:15 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 2/2] media: verisilicon: Use V4L2_FMT_FLAG_ALL_FORMATS flag
Date: Wed, 31 Jan 2024 11:50:08 +0100
Message-Id: <20240131105008.109457-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240131105008.109457-1-benjamin.gaignard@collabora.com>
References: <20240131105008.109457-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If V4L2_FMT_FLAG_ALL_FORMATS flag has been set when calling
VIDIOC_ENUM_FMT ignore depth match and returns all the
hardware supported pixels formats.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 941fa23c211a..6d840911c764 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -201,7 +201,13 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	struct hantro_ctx *ctx = fh_to_ctx(priv);
 	const struct hantro_fmt *fmt, *formats;
 	unsigned int num_fmts, i, j = 0;
-	bool skip_mode_none;
+	bool skip_mode_none, ignore_depth_match;
+
+	/*
+	 * If V4L2_FMT_FLAG_ALL_FORMATS flag is set, we want to enumerate all
+	 * hardware supported pixels formats
+	 */
+	ignore_depth_match = !!(f->flags & V4L2_FMT_FLAG_ALL_FORMATS);
 
 	/*
 	 * When dealing with an encoder:
@@ -222,7 +228,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 
 		if (skip_mode_none == mode_none)
 			continue;
-		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
+		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !ignore_depth_match)
 			continue;
 		if (j == f->index) {
 			f->pixelformat = fmt->fourcc;
@@ -242,7 +248,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	for (i = 0; i < num_fmts; i++) {
 		fmt = &formats[i];
 
-		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
+		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !ignore_depth_match)
 			continue;
 		if (j == f->index) {
 			f->pixelformat = fmt->fourcc;
-- 
2.40.1


