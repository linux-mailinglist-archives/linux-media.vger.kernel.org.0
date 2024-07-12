Return-Path: <linux-media+bounces-14956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93D92F8FF
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 12:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BFB92860C2
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 10:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6075B16A949;
	Fri, 12 Jul 2024 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oxXgO+e7"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9115CD41;
	Fri, 12 Jul 2024 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720780211; cv=none; b=ibj0Wu8no64sVtXwAdYCtkj4mRCLPq0bS87yp27K+TTJ8SFQ3kATl0a0OkppqSZ4eq2aS0LMOEuIjesB+9UKvV3y+t020V8VtXW6VVGQ5jW7RlB4cgeZ7THV5jF0XBqh1S2kFsef5mx+vgSRTpBEHV3fmb2hsuy6yB53jmhUfgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720780211; c=relaxed/simple;
	bh=bELZrED6sIOc9BpYrGeP+56C/27OSrzikkUngJU8pDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nish8wzHCzYUaX8v4tHZhtnE66xh+DKejUV9cwMdm7OigMJDv1UryfQ8vQK77wurhAMPSYd63o5/Nxt0A7wWEgmiR26YMXsTcvahuP65DDhT6UUQJr1TtxJ7fR9U1+t5irJaLxjVmV/x104AIWExdGUh/iLFblxxBtxJ6I/lhCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oxXgO+e7; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720780207;
	bh=bELZrED6sIOc9BpYrGeP+56C/27OSrzikkUngJU8pDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oxXgO+e7FmckzoixskpxSN5/Z9J0D0hGcVERZ1gi52+XRCypdyw9GQxfxWk5VLFXf
	 LTt57aarZV6I01SN3iyOKSWeKMUrXwpJp7OX3+1aF3THxuJU3IWVJEU1N+UkhpzKm9
	 rUGTBB3UUSfeRmNZNIeEQ550cBmVZ9pyd/0TP4nXStTUcpd8VpQH5OzLMZ7WEhiOZf
	 M8u1aF50KuPvgZOWe/HfvZcvQ9BMvJUdW2V1dxv3BuOSm1Qo91QhQkkwgt7Q43lp6Q
	 S/KsEQDVdRkk+B/Ft+kdhCsOjm/htlkKWuOXX9eYPp1V04VPSnHRKv+JA79TIrejcq
	 1qp29A3m9+NTQ==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2DA023782212;
	Fri, 12 Jul 2024 10:30:07 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 2/2] media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag
Date: Fri, 12 Jul 2024 12:30:00 +0200
Message-ID: <20240712103000.16655-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712103000.16655-1-benjamin.gaignard@collabora.com>
References: <20240712103000.16655-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag has been set when calling
VIDIOC_ENUM_FMT ignore depth match and returns all the
hardware supported pixels formats. In this case all set
V4L2_FMT_FLAG_ALL_FORMATS when returning the pixels formats.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 3:
- Set V4L2_FMT_FLAG_ALL_FORMATS flag when needed.

 drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index df6f2536263b..b995ad31cddc 100644
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
+	ignore_depth_match = !!(f->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS);
 
 	/*
 	 * When dealing with an encoder:
@@ -222,10 +228,12 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 
 		if (skip_mode_none == mode_none)
 			continue;
-		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
+		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !ignore_depth_match)
 			continue;
 		if (j == f->index) {
 			f->pixelformat = fmt->fourcc;
+			if (ignore_depth_match)
+				f->flags |= V4L2_FMT_FLAG_ALL_FORMATS;
 			return 0;
 		}
 		++j;
@@ -242,10 +250,12 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	for (i = 0; i < num_fmts; i++) {
 		fmt = &formats[i];
 
-		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
+		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !ignore_depth_match)
 			continue;
 		if (j == f->index) {
 			f->pixelformat = fmt->fourcc;
+			if (ignore_depth_match)
+				f->flags |= V4L2_FMT_FLAG_ALL_FORMATS;
 			return 0;
 		}
 		++j;
-- 
2.43.0


