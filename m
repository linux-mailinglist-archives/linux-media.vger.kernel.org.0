Return-Path: <linux-media+bounces-15084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9401933D74
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 15:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5850F1F235E5
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E61A180A91;
	Wed, 17 Jul 2024 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KprwIjDA"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B591802A3;
	Wed, 17 Jul 2024 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222080; cv=none; b=GcXAx93xgrPQZ1Yd3Kr96jGq1Sj4mezmilMEzv9obywrK4Xz8GRmU02MBQuj3rfnrsy3RaDu/vu2VZ81sgbxEdbbcxyatCgl4oxzdA1n2vT6BWFaNBgE+ho67LsMDEqADAQr2pqcHcYgmhWv9lo5HqXzmx1RTCi+Go8dUTPC2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222080; c=relaxed/simple;
	bh=kzYMEzDjxTpW5eugXBBcAXl8xSootQ7RO2p3jTHcEPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBWYhKr/1m/jQV9U9K8+gyNBgJEnnz/ELjgCD/4MdgGYiHgTE5ZKZmgCWPHjUh2CeOE94q2m76g5Mb/DlF6z5/SpFMl53wm9eBPXcLIYcytvcBjdHlo3fa8MLvRtb6zdmIMgLlQwsNotjK4E4ffOuKa4vXGqfvvyql0Jtex8Rng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KprwIjDA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721222077;
	bh=kzYMEzDjxTpW5eugXBBcAXl8xSootQ7RO2p3jTHcEPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KprwIjDAbCnWZr1IXmzM3UqQ9WkQESnjzRG7FJR5PktXGypvOjhq7X8o0wo75cIPB
	 aK9JiGlvcOtdkKzZypIIvup9GMb7pRUKIq6/EaBwRjdY1DO5JIFteWi2Zq9S/xMNnS
	 foL3U0BqE7dI56Bj/NIHVwyVlZS5SmNmVD3dD/hXXP5SlWluDx9l4Ldpxxh6FHFQeH
	 gdpZEE60Fya5g3aBEpT43tuGBK2K0qfkPPOu1HWx+i7uo5ujdgrA6VdMvVFXz1HOO8
	 /RwRtzi0GCbDkAEJS9aKTQriWI2+R501UPO3mksX2edBd/l/23WVdaipnZuV/+Jgl4
	 tHS0CS+Msolkw==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A2803781167;
	Wed, 17 Jul 2024 13:14:37 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 2/2] media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag
Date: Wed, 17 Jul 2024 15:14:30 +0200
Message-ID: <20240717131430.159727-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
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


