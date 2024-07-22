Return-Path: <linux-media+bounces-15259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1DA939153
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE9D3B21886
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B6316DEC3;
	Mon, 22 Jul 2024 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="sqb5TElE"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2950116D9D9;
	Mon, 22 Jul 2024 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660733; cv=none; b=SzgAmxClPFAuIkvruzYi4Z5tvkJVSosIbrfYiBT3hA9DTE/xydATCni19uJEfCgcOKBlOur8XU6hT98KHQbU8qcq/6tzApzCgakBiPiWYOTG9mLdcJCWbF4me55VxEYe+aKVptt9LM8puJbz1bYRYnFLomjoJdpoyMsCUbDkFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660733; c=relaxed/simple;
	bh=OBlqu3+85gEfIvQ1Nesc8JuesnXxw3aI//SRrubWmfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFqGPEU1D2yhrZnGk/1rpKE14+wlaYe35fRCGpSGTmTeb6jNfxhyjI3BXcXsurivm3+cJJupJBAxBT3Y6HxLUkldJZL6xX8xXVBtGbUJCOAgkhaNjh7NALGHhZT9ICk2Fo6oOfvuwbv7rGh5PEaX+uPqHe+72CTbIoNrD19X5Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=sqb5TElE; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721660730;
	bh=OBlqu3+85gEfIvQ1Nesc8JuesnXxw3aI//SRrubWmfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqb5TElEzxHGPk8CVRMF+yaC+ffdEL0WEn3AOtFCh2+9badendM5HkLjx9aawgyPS
	 0db/kACiRWJtWFP8YYy10m3GVCf2NrY8XNgL+EjhfdhCcHX+b7LM4E1+1d1X25wuRo
	 dwSURXqUENc9lNQ1+ekhBHu8SGAiDWWwT2mQPS/aBn9A+2UaQNRxjxpbmMnxNXTfeC
	 5v67wj2vbApQOuORwXTQ1BiMsCET5bHkVhNVKHneZ16DF0CPVhXK79vSooKvSheHUt
	 nYZiPMsobvbFrc201QTj3P/yc8ePUg32T89Q7JidlNeDdCVnwKYrVNIIY1QnhMs/z1
	 AEf5raMIyUG4w==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0D22537809D0;
	Mon, 22 Jul 2024 15:05:30 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 2/3] media: test-drivers: Use V4L2_FMT_FLAG_ENUM_ALL flag
Date: Mon, 22 Jul 2024 17:05:22 +0200
Message-ID: <20240722150523.149667-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since V4L2_FMT_FLAG_ENUM_ALL flag mostly targeting stateless
decoder pixel formats enumeration, update vicodec visl test
drivers to use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c |  7 ++++---
 drivers/media/test-drivers/visl/visl-video.c      | 11 +++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 3e011fe62ae1..1b4cd8ddd7c2 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -706,6 +706,7 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
 		    bool is_out)
 {
 	bool is_uncomp = (ctx->is_enc && is_out) || (!ctx->is_enc && !is_out);
+	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
 
 	if (V4L2_TYPE_IS_MULTIPLANAR(f->type) && !multiplanar)
 		return -EINVAL;
@@ -718,18 +719,18 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
 
 		if (ctx->is_enc ||
 		    !vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q))
-			info = v4l2_fwht_get_pixfmt(f->index);
+			info = v4l2_fwht_get_pixfmt(index);
 		else
 			info = v4l2_fwht_find_nth_fmt(info->width_div,
 						     info->height_div,
 						     info->components_num,
 						     info->pixenc,
-						     f->index);
+						     index);
 		if (!info)
 			return -EINVAL;
 		f->pixelformat = info->id;
 	} else {
-		if (f->index)
+		if (index)
 			return -EINVAL;
 		f->pixelformat = ctx->is_stateless ?
 			V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
index f8d970319764..c5f3e13b4198 100644
--- a/drivers/media/test-drivers/visl/visl-video.c
+++ b/drivers/media/test-drivers/visl/visl-video.c
@@ -341,21 +341,24 @@ static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
 				 struct v4l2_fmtdesc *f)
 {
 	struct visl_ctx *ctx = visl_file_to_ctx(file);
+	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
 
-	if (f->index >= ctx->coded_format_desc->num_decoded_fmts)
+	if (index >= ctx->coded_format_desc->num_decoded_fmts)
 		return -EINVAL;
 
-	f->pixelformat = ctx->coded_format_desc->decoded_fmts[f->index];
+	f->pixelformat = ctx->coded_format_desc->decoded_fmts[index];
 	return 0;
 }
 
 static int visl_enum_fmt_vid_out(struct file *file, void *priv,
 				 struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(visl_coded_fmts))
+	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
+
+	if (index >= ARRAY_SIZE(visl_coded_fmts))
 		return -EINVAL;
 
-	f->pixelformat = visl_coded_fmts[f->index].pixelformat;
+	f->pixelformat = visl_coded_fmts[index].pixelformat;
 	return 0;
 }
 
-- 
2.43.0


