Return-Path: <linux-media+bounces-26921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BFA43A0D
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A73083B7893
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD0A2676C3;
	Tue, 25 Feb 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="HdCkfLMP"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13E265CBE;
	Tue, 25 Feb 2025 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476515; cv=pass; b=ikj7WY3rpNpsOHeflC/tSAjse2NNhdDHfleU0hGCzBFp1zCHBXrOlm4UVlQwwkwMj/tpXr/lb5tJhDgEv+HsYSs+z4GFBqa1MeJ3jk61JWZ0Un1cm+mXOcb87CK+fCUoe+wgsyr9yWCgY3G63s5WonCnWRG6vlSXcXNTgM3qlgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476515; c=relaxed/simple;
	bh=kAferTJjlOsMKikcDc7px611q51eaR5rbJpvRFKjTvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqTaFMvqmEWy+pzbifAT71jGWhrmMXh1j7Kmyhpyy1Urcb4WLKzQ7CG6c1VejwcuZu2AkqZBPv545pk00lsh2f1MfDio5zr/gLBhw4Tno5OLBznQCsjJh/kczty3s/3vX9Xdb+HKyrHhgutwYDkzueJvTYuHN2hjnIqDzR65GWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=HdCkfLMP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476490; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JhLOqeuFXnKZMj2rD9nXOmFkznlC5b19ET3bqj2g/LuQN1XksBtYT4w3a96ePCOkCwwpHbj5LxlYe7GUzxc3baLJ8/GquyQUsWwdwZLyAbwNVX5AI9aJh5tyyIInXwfAIDWvyrTFysB2FSha/0OylIO77tvNm9g1C5OBptWprbg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476490; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PyXzFAnSQaYFyXOwZuHcTzIPanIxLt2OaFJApPYWtf0=; 
	b=WNevAdJm1/W0x7hWwvZxLfD6IVpHApb1klWbmZDQeQPSyi1615M/keo6hjeFL2wArZYXzPU+eWn7PbiVN7HXlPUDvsdPBS5yhqSd7r3NqJANE0oDnqRCKwAKD5jhdn/vWx/Q0F7LyFD4t5fPB1l53rSzJgVKmas8sC618ysacTw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476490;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PyXzFAnSQaYFyXOwZuHcTzIPanIxLt2OaFJApPYWtf0=;
	b=HdCkfLMPSUzZM6YFRpWJ3IEAEalPzzz7DP5NjyyyI/0Td1fPU00RCuLlkKJwDAr2
	SQKhiHYYAUoBHPMK6sjf3HgfWne8JszLUVtWk06HGjaU6AlcKxCR3mfd2shCcXAqV6y
	8ofrUTiiANxHEnj975m8IyAngAP4Gy8rvhE5xyMk=
Received: by mx.zohomail.com with SMTPS id 1740476488070578.0276658322202;
	Tue, 25 Feb 2025 01:41:28 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 25 Feb 2025 10:40:26 +0100
Subject: [PATCH v7 05/12] media: rkvdec: Extract rkvdec_fill_decoded_pixfmt
 into helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-5-7992a68a4910@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476426; l=2573;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=gOBDVDAsV9VKnb0HLH+du/+hR99gKUsl0D8BUoTDXz4=;
 b=9C8Iecm1IxnOeOqZwUDfahA/UDWeue/VkjdEQ3Y63UPo6LOEq4pTlUHkb1MVPx2NDKtaezxTGdX0
 Yqft9IORC5MXRD7Z+IbEVrQtXSaFZgecW1dFJU9O1BkLZu5AX83m
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

From: Jonas Karlman <jonas@kwiboo.se>

Extract call to v4l2_fill_pixfmt_mp() and ajusting of sizeimage into a
helper. Replace current code with a call to the new helper.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index f9bef5173bf25c0cd6b09d2b253d36aa78d7b0c4..e354360f4acc1fe9b7c4b90745f0a818fa2b7cab 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -27,6 +27,16 @@
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
 
+static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
+				       struct v4l2_pix_format_mplane *pix_mp)
+{
+	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
+			    pix_mp->width, pix_mp->height);
+	pix_mp->plane_fmt[0].sizeimage += 128 *
+		DIV_ROUND_UP(pix_mp->width, 16) *
+		DIV_ROUND_UP(pix_mp->height, 16);
+}
+
 static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
@@ -192,13 +202,9 @@ static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
 
 	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp,
-			    ctx->coded_fmt_desc->decoded_fmts[0],
-			    ctx->coded_fmt.fmt.pix_mp.width,
-			    ctx->coded_fmt.fmt.pix_mp.height);
-	f->fmt.pix_mp.plane_fmt[0].sizeimage += 128 *
-		DIV_ROUND_UP(f->fmt.pix_mp.width, 16) *
-		DIV_ROUND_UP(f->fmt.pix_mp.height, 16);
+	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
+	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
+	rkvdec_fill_decoded_pixfmt(ctx, &f->fmt.pix_mp);
 }
 
 static int rkvdec_enum_framesizes(struct file *file, void *priv,
@@ -264,12 +270,7 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 				       &pix_mp->height,
 				       &coded_desc->frmsize);
 
-	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
-			    pix_mp->width, pix_mp->height);
-	pix_mp->plane_fmt[0].sizeimage +=
-		128 *
-		DIV_ROUND_UP(pix_mp->width, 16) *
-		DIV_ROUND_UP(pix_mp->height, 16);
+	rkvdec_fill_decoded_pixfmt(ctx, pix_mp);
 	pix_mp->field = V4L2_FIELD_NONE;
 
 	return 0;

-- 
2.25.1


