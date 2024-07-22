Return-Path: <linux-media+bounces-15261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58043939157
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6B4B1F21FFF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7DB16E870;
	Mon, 22 Jul 2024 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="e2Lhq03P"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57AD16DC34;
	Mon, 22 Jul 2024 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660734; cv=none; b=GAvxaevOzLPUMfZ8RicB4DhDBRpEHwzoPxvbNTN76uR0gKnXYqtcce3w5Bk/r4C05csPilffONFt6hT2i4wHx90WNAhg5O3S3HuAnic0sFQ7AZbOIZz/n0gsH9hJ28lJqGKd+nulJNF5T3ThaJyiGCaGwWf7S0jkpKKHKiiWO3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660734; c=relaxed/simple;
	bh=oUSaH13Jhof/IlxUcDgOPqmO1TdySsiM3gh1NyYvCjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dn8W/lKxv/Giy47KQdM0CF4Wnu0+lY+VHDkbSbJduD0XFXPQsBui1ui5OOL+9CwuC6krWAIY6IJwq/J5lMMFtwrF4GvOSQoofNhlLMXLbtfis2TIbGD5mMyNFWXRTBMKTzFkw0mI7lhPzPwIYVY+7rWOAdfyw5mFxeLP4TF85IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=e2Lhq03P; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721660731;
	bh=oUSaH13Jhof/IlxUcDgOPqmO1TdySsiM3gh1NyYvCjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e2Lhq03PaSsqEb2bjYdsIkaj7WB1iZHGn8UYGf4F+JOUFIkoqLZzj+ByxTN9n5GV2
	 GO+XZSDf/o6Ykq7CIaXa/a5ATSXF6U1Lw9kzIjNQDZHGaVIP9wneVmj40N1Z9OCj/r
	 2Rb7ZTtkoaW6g2+c6cVJHvnu7Ocyf1rbAFVjcLbB/hoSbZm8/6wevhQi99R2+UWWQZ
	 /K0UtRfE8QhJFQs1ONGpVkD52qj8Fisu5KBD4m215flla4MTTbk4T6EcANj4mxD1VF
	 yl8hhQFck2MjQkZye//CnAq6Moap02sMG5Ypv2yLqrYals7k9yY070qqbXQWpn5vH1
	 k5K6KSnqhXcaw==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9E3E73781189;
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
Subject: [PATCH v5 3/3] media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL flag
Date: Mon, 22 Jul 2024 17:05:23 +0200
Message-ID: <20240722150523.149667-4-benjamin.gaignard@collabora.com>
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

By adding support of V4L2_FMT_FLAG_ENUM_ALL flag into the driver
we allowing userspce applications to discover all possible
pixel formats of the hardware block. This way userspace can decide
of which decoder to use given the support pixel formats.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_v4l2.c    | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index df6f2536263b..77f024aaa22d 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -201,7 +201,14 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	struct hantro_ctx *ctx = fh_to_ctx(priv);
 	const struct hantro_fmt *fmt, *formats;
 	unsigned int num_fmts, i, j = 0;
-	bool skip_mode_none;
+	bool skip_mode_none, enum_all_formats;
+	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
+
+	/*
+	 * If V4L2_FMT_FLAG_ENUM_ALL flag is set, we want to enumerate all
+	 * hardware supported pixels formats
+	 */
+	enum_all_formats = !!(f->index & V4L2_FMT_FLAG_ENUM_ALL);
 
 	/*
 	 * When dealing with an encoder:
@@ -222,9 +229,9 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 
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
@@ -242,9 +249,9 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
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


