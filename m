Return-Path: <linux-media+bounces-33277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0D5AC26A9
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1629CA46440
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418E8296143;
	Fri, 23 May 2025 15:45:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D6296FB5;
	Fri, 23 May 2025 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748015109; cv=none; b=VX6MFrN0+j/fPEcGaW9/Nx8c/sAzXzKHOOASdN/kEKIwlWKVArcGEn4y1si2muijC92jQG2fs1Iivevzla4ZrDTM6r6KlI10NuK8nagzekTFL0Fc8ZR3cdbMbxOxJaCG8T8dxhe+NZL2dtsqHjhNBCdQaCQl2IVNV1eJziAIocc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748015109; c=relaxed/simple;
	bh=7dQrUsrdfwQqtppMZ9nZPjLQxrBRNZnSqBS7RSpZIlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMWywcN+gOjSlL2Kt3lSIN5vI7X0wHEULUhqdzOic2JYTZY0lszSm9/VWXRfLCSPCCGDTb3dgBsyDvb8zL+aysjGAehucmF0XIurQ3W8G/xw94+N3DNK4Sn2VLLmlrgXHP5a9c3FUzny7vu29fkDDpsA11HuvdYSjbrjXplZgwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id CB6D41F00036;
	Fri, 23 May 2025 15:45:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 37C4CAC2EA9; Fri, 23 May 2025 15:45:03 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id CD313AC2EA9;
	Fri, 23 May 2025 15:44:18 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH] media: cedrus: Add support for additional output formats
Date: Fri, 23 May 2025 17:43:59 +0200
Message-ID: <20250523154359.2454180-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@siol.net>

If VPU supports untiled output, it actually supports several different
YUV 4:2:0 layouts, namely NV12, NV21, YUV420 and YVU420.

Add support for all of them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
---

Looks like this patch never made it, sorry about that.
I've rebased it atop media/next and added my Reviewed-by tag.
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 18 +++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c  | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 32af0e96e762..168d89c5a16d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -86,9 +86,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 
 	switch (fmt->pixelformat) {
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
 		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
 
-		reg = VE_PRIMARY_OUT_FMT_NV12;
+		switch (fmt->pixelformat) {
+		case V4L2_PIX_FMT_NV12:
+			reg = VE_PRIMARY_OUT_FMT_NV12;
+			break;
+		case V4L2_PIX_FMT_NV21:
+			reg = VE_PRIMARY_OUT_FMT_NV21;
+			break;
+		case V4L2_PIX_FMT_YUV420:
+			reg = VE_PRIMARY_OUT_FMT_YU12;
+			break;
+		case V4L2_PIX_FMT_YVU420:
+			reg = VE_PRIMARY_OUT_FMT_YV12;
+			break;
+		}
 		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
 
 		reg = chroma_size / 2;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 77f78266f406..9fae2c7493d0 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -64,6 +64,21 @@ static struct cedrus_format cedrus_formats[] = {
 		.pixelformat	= V4L2_PIX_FMT_NV12_32L32,
 		.directions	= CEDRUS_DECODE_DST,
 	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_NV21,
+		.directions	= CEDRUS_DECODE_DST,
+		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_YUV420,
+		.directions	= CEDRUS_DECODE_DST,
+		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_YVU420,
+		.directions	= CEDRUS_DECODE_DST,
+		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
+	},
 };
 
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
@@ -140,6 +155,9 @@ void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 		break;
 
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
 		/* 16-aligned stride. */
 		bytesperline = ALIGN(width, 16);
 
-- 
2.49.0


