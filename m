Return-Path: <linux-media+bounces-15629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C5942A9F
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B3A028570B
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9A11AB537;
	Wed, 31 Jul 2024 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nmi/MMi0"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181911AAE00;
	Wed, 31 Jul 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418507; cv=none; b=WlIYCoKvddPHHgzRNkt4JbtxnUY+dATcwSAq/IbBqLp/FlYyhz2Z9F1mV5j+xcirJE/i/SIa834DtPy+kMrozEGuw6/oCORPRsoERI28pEbHzRPQQJZ9dg4bd4dcKHp3BDlnmhLYnqNwMh4a/JZJlSBuD+B1z7mhC+pDe0ULNco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418507; c=relaxed/simple;
	bh=pc0eQXx5R7BoUuHctaKqpcBxbPR4AZ5N6w0dlxyz0xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mg4z2btY8pvon/9ZDaXpjAp+NXIt9gI/LljqLOLhqykKBXmK9Wmb1RblCWZcHAlSGTM0xZzBLy9hEA8usaSJRKDLexABksmce1rfFzehsS5vCms+KohcWFBCL9y93esfkRyaA7RyAruwWxHOuRhETIhAiPRGzBQDcQqih6Y9ZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nmi/MMi0; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722418504;
	bh=pc0eQXx5R7BoUuHctaKqpcBxbPR4AZ5N6w0dlxyz0xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nmi/MMi0x+9oWS3l1OkaUwHlyIf3U2Bbg5Ea9M7OGNM9sdxQK0XuFJYUiqX3hkM0D
	 uUdOmEYRFswcfkppGqvRSOLXhaUeSAlU/2AJQ9SvrOxDFffzQ5iAIgVQQmtCwi7pDD
	 P83PAa2fhBr01khJFQ6qvbj8PlO+lDOOZcs+LNF7DvuQ6eD9J6ZV+E0/fyEiAP9APa
	 GMWr57D2DUp7uNxtEn7iOIw0iGo9ks+82wIT8Bv79hCsodmMPL/YNznBzA1UEQSwW+
	 4+g7CoKU9ocvVZlk87QdBseryCArRqNvMhzKCZ9Gn8f+Px4N3nNuhIcDxh4aQR148X
	 2r8GODcidRwvQ==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 05FB33782113;
	Wed, 31 Jul 2024 09:35:03 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 2/3] media: test-drivers: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
Date: Wed, 31 Jul 2024 11:34:56 +0200
Message-ID: <20240731093457.29095-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731093457.29095-1-benjamin.gaignard@collabora.com>
References: <20240731093457.29095-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the V4L2_FMTDESC_FLAG_ENUM_ALL flag mostly targets stateless
decoder pixel-format enumeration, update visl test driver to use it.
When V4L2_FMTDESC_FLAG_ENUM_ALL flag is set let the driver returns
one more pixel format.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
change in version 6:
- Improve visl driver to enumerate one more pixel format when the flag
  is used.

 drivers/media/test-drivers/visl/visl-video.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
index f8d970319764..677a8564de03 100644
--- a/drivers/media/test-drivers/visl/visl-video.c
+++ b/drivers/media/test-drivers/visl/visl-video.c
@@ -136,6 +136,12 @@ static const u32 visl_decoded_fmts[] = {
 	V4L2_PIX_FMT_YUV420,
 };
 
+static const u32 visl_extended_decoded_fmts[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_YUV420,
+	V4L2_PIX_FMT_P010,
+};
+
 const struct visl_coded_format_desc visl_coded_fmts[] = {
 	{
 		.pixelformat = V4L2_PIX_FMT_FWHT_STATELESS,
@@ -341,11 +347,21 @@ static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
 				 struct v4l2_fmtdesc *f)
 {
 	struct visl_ctx *ctx = visl_file_to_ctx(file);
+	u32 index = f->index & ~V4L2_FMTDESC_FLAG_ENUM_ALL;
+	int max_fmts = ctx->coded_format_desc->num_decoded_fmts;
+	const u32 *decoded_fmts = ctx->coded_format_desc->decoded_fmts;
+
+	if (f->index & V4L2_FMTDESC_FLAG_ENUM_ALL) {
+		max_fmts = ARRAY_SIZE(visl_extended_decoded_fmts);
+		decoded_fmts = visl_extended_decoded_fmts;
+	}
+
+	f->index = index;
 
-	if (f->index >= ctx->coded_format_desc->num_decoded_fmts)
+	if (index >= max_fmts)
 		return -EINVAL;
 
-	f->pixelformat = ctx->coded_format_desc->decoded_fmts[f->index];
+	f->pixelformat = decoded_fmts[index];
 	return 0;
 }
 
-- 
2.43.0


