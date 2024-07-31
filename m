Return-Path: <linux-media+bounces-15630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8CC942AA2
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3845FB24B25
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96951AC431;
	Wed, 31 Jul 2024 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="vjkpwMyA"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9F1AAE17;
	Wed, 31 Jul 2024 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418508; cv=none; b=qxxicFmfz0UdDOsRxHeiUnyuq1hUR3H409P5fNOSvFb+4+AucgfaElOncqN3LvJrlRDc7I0+Ou34KmGCw2LpkJjDfoLBIKcODW29JnNr7JKaMawmJUXkqhOiDUCoB/y4dsi2SA2YU1XxM9B75NbfhZOHaROhD889yv5HZauESCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418508; c=relaxed/simple;
	bh=OlPnoh/kLKwB+K1SAOzWnjDTIPXs1b69NoLFMlqj2FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhFDICIGb3uIQo1sPrcwuSj648U4h21uWa5UrnBY9W+K5QKuQH8VtUo3KUTTWQlOoQHLWHILxwSRHTehnbcIFzsTQ1+yGk4S/2ZJE+ZWwRvUkPnOfT/kjsVUBS6HAt5x9JAV83zjghaZZ4pP/YDqHQQTlqS2G64Yn3yTZkyias8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=vjkpwMyA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722418505;
	bh=OlPnoh/kLKwB+K1SAOzWnjDTIPXs1b69NoLFMlqj2FQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vjkpwMyAWerMuA+xGyrZse6LIgpQH6swgmQNUHPALFK+xPfzc6N8tsJJcp1da3xyG
	 oVEfGwMJipGbEdRaD8QY2M6Moj3COKquD/CzHQ/xBjZobx/T0sQa6rC2iW06xyakvk
	 1PGi8y28QXK9KpxJe+S10ROu9mw3E1LbhPRkHPuzuKYuvBxCZ1o/f2ZD/ND6HrUXUB
	 HdmZlRR8+2QKwzyzXsDWdmawogwSB1c7QnVMn2MYu7ys30eOwdMn3+JyiUmtGhUNzg
	 DMiZ19etfYCpU8OtRkb+6YK8riIoQz98aLjWsG/5fOG40ifeOUACyXdvZhdgQVFZxa
	 unPzNa917O1lQ==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97527378215C;
	Wed, 31 Jul 2024 09:35:04 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 3/3] media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
Date: Wed, 31 Jul 2024 11:34:57 +0200
Message-ID: <20240731093457.29095-4-benjamin.gaignard@collabora.com>
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


