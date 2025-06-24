Return-Path: <linux-media+bounces-35771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE3AE64F9
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A4341886616
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B3B2989A7;
	Tue, 24 Jun 2025 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qctFoLm4"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5329825B;
	Tue, 24 Jun 2025 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768186; cv=none; b=Znl3DVrjg5QkccFB2Xqwc5Fa2EPKmeKoH9dHVNFJZKqOV7a8l2Lkt/4l/0E0sroxe0XqvwNCkVjCoyxYkBXS/bmbvIkrVolQU5gyPrUdbWzPYDnuuFec7b+T/lzQtqs+TCpLdH1TrOtPezaCCzDzm907hGH+ZrKuibk1GPwi200=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768186; c=relaxed/simple;
	bh=8WAPJMaT3RPf5H8MPe+6Y+/A6cCV8GHnSu9zGp/405I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4JtKFoUs+4LPfwOKnie47BnZTDM9vV3qHX5ytI0+3qJIebJAgw/bMjGvntjxW+Kxg3s/HuHgXHECL5z0wQWSuFsDRo/RALY8lP1bYEHIcuvUUjb3CVebYwJGFUCgd7VgZDsbhoaqN5dyuexDVLL9rO/H6pUn/OQ4s0ZG5dVkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qctFoLm4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750768182;
	bh=8WAPJMaT3RPf5H8MPe+6Y+/A6cCV8GHnSu9zGp/405I=;
	h=From:To:Cc:Subject:Date:From;
	b=qctFoLm4S1HCsLWt+Nk4SlF4ZMzxRq0J4jEg964rH2UaOfmjM/0VmQirKWRj4WuOA
	 huRpTjdECUX+l4o6iHyG+0OXYZdHwNFKJeAC9xD1euHK0orJ+VHKk7U9zyiNBRlyP6
	 UXzKdJq0WKtLNzcwNbqErR5o+SFtReDu6R1IJApUmYTVEX/7HR+2/8bQtBOz2tPw0n
	 qu0DDoTIg5SOKyEUIW9+BQYniSd7/4R8Xo0qfqkk0SNe0cvt2/9Hgw8tAM7tN37r/c
	 nPFyHNW2XQzDOoFPN6rFJZTy8Cs4pmbkWcl3L79XmsL0tUCiGxoK669wiYhG1P3kiI
	 aJiy31f9T0lmw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ed49:23ab:f92:d8a4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B6F517E0FDB;
	Tue, 24 Jun 2025 14:29:42 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: Export only needed pixels formats.
Date: Tue, 24 Jun 2025 14:29:38 +0200
Message-ID: <20250624122938.62004-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When enumerating the pixels formats check if the context
request to only export post-processed pixels formats.
The exception is when V4L2_FMTDESC_FLAG_ENUM_ALL is set, we
need to export all pixels formats.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: bcd4f091cf1e ("media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag")
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 7c3515cf7d64..7869faf921f4 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -222,6 +222,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	unsigned int num_fmts, i, j = 0;
 	bool skip_mode_none, enum_all_formats;
 	u32 index = f->index & ~V4L2_FMTDESC_FLAG_ENUM_ALL;
+	bool need_postproc = ctx->need_postproc;
 
 	/*
 	 * If the V4L2_FMTDESC_FLAG_ENUM_ALL flag is set, we want to enumerate all
@@ -230,6 +231,9 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	enum_all_formats = !!(f->index & V4L2_FMTDESC_FLAG_ENUM_ALL);
 	f->index = index;
 
+	if (enum_all_formats)
+		need_postproc = HANTRO_AUTO_POSTPROC;
+
 	/*
 	 * When dealing with an encoder:
 	 *  - on the capture side we want to filter out all MODE_NONE formats.
@@ -242,7 +246,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	 */
 	skip_mode_none = capture == ctx->is_encoder;
 
-	formats = hantro_get_formats(ctx, &num_fmts, HANTRO_AUTO_POSTPROC);
+	formats = hantro_get_formats(ctx, &num_fmts, need_postproc);
 	for (i = 0; i < num_fmts; i++) {
 		bool mode_none = formats[i].codec_mode == HANTRO_MODE_NONE;
 		fmt = &formats[i];
-- 
2.43.0


