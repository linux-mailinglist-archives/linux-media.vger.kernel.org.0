Return-Path: <linux-media+bounces-16853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFA95F7FE
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C85BB22175
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE441993B9;
	Mon, 26 Aug 2024 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CCe11pr6";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="IJNBUtaj"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-30.smtp-out.eu-west-1.amazonses.com (a7-30.smtp-out.eu-west-1.amazonses.com [54.240.7.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11064A;
	Mon, 26 Aug 2024 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693054; cv=none; b=og+42a5seL4W++xL/J3Fplz4KT5h+eSlzDfHmCQ27ruLhNt+4TxzN1jzcMHlfVc2Fler2yCNDOBaRIRvbRptym7ME0JUrMeZMf9osT9HDaDbX/9aKmAaerKbB3xSDwCqhd3JHckvCvw7uhsG2Ce9+DQv2l4aXq13tP2g8XHSLbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693054; c=relaxed/simple;
	bh=etTr18PVUbyD9sH0upSXvlXDIQwDCIKkQLfctpu+WIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAewdbyAfzx5Xo9xptcxSXZRUGviz2c9B9BZ33KtwpCo7kNMpTZxAI/KtYDmW2uzwbHheO78BNpBdF6F6pfDbE130NxrwTzBMKM5DO/B42ihKa3JIfFlGgjx2xUbpPwZye/vQx4cnkjBt7HHd/kCn2COvau3SsLh7JWZR2DwlSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CCe11pr6; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=IJNBUtaj; arc=none smtp.client-ip=54.240.7.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724693050;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=etTr18PVUbyD9sH0upSXvlXDIQwDCIKkQLfctpu+WIM=;
	b=CCe11pr6qOy961/sWNVUMH6KKouTy/tOjExkTfT2L+8KDU8TzEFeUAXBuf7DPHhh
	xKSmoKi7ylUV4vwdY/z/lQPB0QnSDieugfPWooL2O7lNTJsRIOWJ9PHsmJrXmZLTAzA
	8V5ClmdQQVJbqNvlVho6cciT6j8qJiL3Vu8FMXLxLU/7qlgeHa3dWVQMYtDLafn/SFa
	2c9DGBIn35M7JdGhMtZ4+LbAqV4n63cm4gMiwhEJsnjjYnEbAmYpUeDTpt5jMhO2bKs
	iIqbM2NPqzfxAMV/3O8mxI29gN91GpixK7/1tXMdyD4xCn4M5LnVwWj6dSRbDMGbyeH
	QwWac6451w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724693050;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=etTr18PVUbyD9sH0upSXvlXDIQwDCIKkQLfctpu+WIM=;
	b=IJNBUtajuE12ye6IkYE7m+mee4d0+VJDF+NehKONNLoVgKTBsikexRUoLLiGVJz/
	0lbZF/0JhtX3sIS7iEcJCxEamB5WTOw6lJqcZm6w57s2ipG0UAt6BobQ+m5LtJTh4m4
	5wPa1zr8cbvDW+/prx8x/YHw/9kbmXJACHE0JDpM=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, 
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 2/3] media: test-drivers: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
Date: Mon, 26 Aug 2024 17:24:10 +0000
Message-ID: <010201918fb772f4-51d41cc7-a573-4d49-b75c-3e6b37839901-000000@eu-west-1.amazonses.com>
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
X-SES-Outgoing: 2024.08.26-54.240.7.30

Since the V4L2_FMTDESC_FLAG_ENUM_ALL flag mostly targets stateless
decoder pixel-format enumeration, update visl test driver to use it.
When V4L2_FMTDESC_FLAG_ENUM_ALL flag is set let the driver returns
one more pixel format.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
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


