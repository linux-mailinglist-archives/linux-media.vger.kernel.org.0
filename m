Return-Path: <linux-media+bounces-16854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA595F800
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A68D81C22366
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F43199938;
	Mon, 26 Aug 2024 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hl/QsQtL";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="cmzsDtMZ"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-46.smtp-out.eu-west-1.amazonses.com (a7-46.smtp-out.eu-west-1.amazonses.com [54.240.7.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA97198E6F;
	Mon, 26 Aug 2024 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693054; cv=none; b=FlosxKXNSc5XcbnsmYf2l6Dv+iq/axw+jT4opRSvaJZwngy72He/bPYXb0vLvPzgsebrG48pJREWxFvnZYDPH+bLc5v4yMvXeuRmO3j2x4rYguF1tsCIHYYNfc/6uDXA8uC9W2FFpfFEY/jjx+ab3WBitBnaX2bcgvsrJ61oNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693054; c=relaxed/simple;
	bh=OlPnoh/kLKwB+K1SAOzWnjDTIPXs1b69NoLFMlqj2FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzEUhb9ayRMYiLApafKObxCAVd2YC32BYAohSmw4l9a6J6O0ECURHx9/Cte3iBAC09S1AglbYpKszsekNtKW0d6Y1JRbfX3bBOJNfGpFgUFzZT1ty4JeI0V+tzaj6IsVIajuPXy3BWSsNOih1wSEgT1ATZU0P1zYDcfJpZ35LK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hl/QsQtL; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=cmzsDtMZ; arc=none smtp.client-ip=54.240.7.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724693050;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OlPnoh/kLKwB+K1SAOzWnjDTIPXs1b69NoLFMlqj2FQ=;
	b=hl/QsQtLl9XABOWKyqorF5PT0yBRqhhJBzq0z+t8/W9papWRlSU1Wwj8O1Vx36g8
	4TruJJaBPVIrDdjA0FHXHOgsr+PwdGDJpkT1OQ1xR7FxxOwjYzvu9H00USopi+Ndtyh
	88xh/94EJSmzMjFag5uP28mrZ9+m5ZKVcjumlQ56K7QffIHLJA42gCGPT93PJ5pFbAG
	ruzb+6BVzlPmv5VIrvJT396CNLX7eONFbeBcVt5YbBwBqXK3Ystw80ZPjK5cuBHFQ6F
	rxyBkD/FoE0/XfS2/PmzB+ZbI+hJ5JO/UNv0j29ePrCVV9wRfM+MnY0RCr+2QcyLiAX
	hre6EWZOxQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724693050;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=OlPnoh/kLKwB+K1SAOzWnjDTIPXs1b69NoLFMlqj2FQ=;
	b=cmzsDtMZQ5a4G0qImCCM40Yl4cHxREHyzf84ECObP2fzZpgkFsSdzcLERQSWbIkq
	JtjuAe9H3gTEfsHF1kQBBIheDI5HN5+4VcaSD4ST3AX+kBKN0qSctC/x7gOK7CbYUhu
	R0/5Shg47OeKcBA9MDbXYqGv+eajmZaCaBsPfMzQ=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, 
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 3/3] media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
Date: Mon, 26 Aug 2024 17:24:10 +0000
Message-ID: <010201918fb774b9-72f298dc-dac4-41f2-a045-502b81c8dba7-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826172407.140538-1-benjamin.gaignard@collabora.com>
References: <20240826172407.140538-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.26-54.240.7.46

By adding support for the V4L2_FMTDESC_FLAG_ENUM_ALL flag into the driver
we allow userspace applications to discover all possible
pixel formats of the hardware block. This way userspace can decide
which decoder to use given the supported pixel formats.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_v4l2.c   | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index df6f2536263b..f416c5b36dd0 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -201,7 +201,15 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	struct hantro_ctx *ctx = fh_to_ctx(priv);
 	const struct hantro_fmt *fmt, *formats;
 	unsigned int num_fmts, i, j = 0;
-	bool skip_mode_none;
+	bool skip_mode_none, enum_all_formats;
+	u32 index = f->index & ~V4L2_FMTDESC_FLAG_ENUM_ALL;
+
+	/*
+	 * If the V4L2_FMTDESC_FLAG_ENUM_ALL flag is set, we want to enumerate all
+	 * hardware supported pixel formats
+	 */
+	enum_all_formats = !!(f->index & V4L2_FMTDESC_FLAG_ENUM_ALL);
+	f->index = index;
 
 	/*
 	 * When dealing with an encoder:
@@ -222,9 +230,9 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 
 		if (skip_mode_none == mode_none)
 			continue;
-		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
+		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !enum_all_formats)
 			continue;
-		if (j == f->index) {
+		if (j == index) {
 			f->pixelformat = fmt->fourcc;
 			return 0;
 		}
@@ -242,9 +250,9 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	for (i = 0; i < num_fmts; i++) {
 		fmt = &formats[i];
 
-		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
+		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !enum_all_formats)
 			continue;
-		if (j == f->index) {
+		if (j == index) {
 			f->pixelformat = fmt->fourcc;
 			return 0;
 		}
-- 
2.43.0


