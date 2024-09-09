Return-Path: <linux-media+bounces-18029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9900B972297
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 21:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D53691C217AB
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 19:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CD718C326;
	Mon,  9 Sep 2024 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="l0U5yh4r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5741B18C035
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909979; cv=none; b=dH9fbXpgBlkkD6S7B5HqZmxUkiyQ1lLhJ35MZu7UOwK7JGl125exkdMvwMfYUAdUfVczJX1HApNDG0lYHumafAiORw5+A+6AIwIwZ5w3yowkCn0kzMrY0zPZ6ROQ/kjKFaugK+3HMX9oRIMjK01exp9W7bCdrdni4OojiBrSXJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909979; c=relaxed/simple;
	bh=gw0brWJahZLykFo0RO8z3y1/9FpECaCXPM+l3JszsuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VINCAvwDNQSu/KJwFLZXDmwvKT02GecjO2xtQP8fRYDDDvRY6gNn+38g6sab2Wka3/zbvV9iJzsnX3sj4XDCabVg5njX6tiCPmX+e0azONxArfcyig3UBeMxrChkjbNoAd6YvKYcrMWp9TL8AftOkn6VjNrojeVk/NYdMqTkvhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=l0U5yh4r; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725909973; bh=swR1AJEuZ87sGHxtc8yhQwZrTbWgXwgW+7Td6xgxK5Q=;
 b=l0U5yh4rj9V46im2Lq4tI5JIOP2Z/FoIuTkzm8BRZiKVNVstkJROCNeO9vYSkNh3ScBStzG6j
 hVA25L0wwDnPDdpIb6sn1WlVRirrM3g9OlFE7W3cOw0QBpH24Szm3yhMW9Zp6kZZfapScQ+0Fj+
 mAE4qebMOSiffVL22JW9lyz4MlvV5XH9r5+C5i46EcrsHDoy3GjZIsfwTJbq6sb4CjdU+1AQYw8
 BWXRgsq6dUZMkls517wRMcXYtkXvDGSH2M+rOdk8pCAXRyMmuPyj3EixX/ADukQnDJ/3eGlZ7Ct
 5HeapiSDLpem98bxXmqO7dlkmek7QXZwu1PQASI5d6vw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v6 07/11] media: rkvdec: Extract decoded format enumeration into helper
Date: Mon,  9 Sep 2024 19:25:05 +0000
Message-ID: <20240909192522.1076704-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909192522.1076704-1-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66df4bd2c680cb8b7d2dc20a

Add a rkvdec_is_valid_fmt() helper that check if a fourcc is a supported
CAPTURE format, and a rkvdec_enum_decoded_fmt() helper that enumerates
valid formats.

This moves current code into helper functions in preparation for adding
CAPTURE format filtering and validation in next patch.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
v6:
- No change

v5:
- Update commit message
- Collect r-b and t-b tags

v4:
- Rename rkvdec_decoded_fmts() to rkvdec_enum_decoded_fmt()
- Rename rkvdec_valid_fmt() to rkvdec_is_valid_fmt()

v3:
- New patch
---
 drivers/staging/media/rkvdec/rkvdec.c | 49 +++++++++++++++++++--------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 7e59db3fc24d..efbf9aa578ae 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -27,6 +27,32 @@
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
 
+static u32 rkvdec_enum_decoded_fmt(struct rkvdec_ctx *ctx, int index)
+{
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+
+	if (WARN_ON(!desc))
+		return 0;
+
+	if (index >= desc->num_decoded_fmts)
+		return 0;
+
+	return desc->decoded_fmts[index];
+}
+
+static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc)
+{
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	unsigned int i;
+
+	for (i = 0; i < desc->num_decoded_fmts; i++) {
+		if (desc->decoded_fmts[i] == fourcc)
+			return true;
+	}
+
+	return false;
+}
+
 static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 				       struct v4l2_pix_format_mplane *pix_mp)
 {
@@ -52,8 +78,10 @@ static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
 static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_format *f = &ctx->decoded_fmt;
+	u32 fourcc;
 
-	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
+	fourcc = rkvdec_enum_decoded_fmt(ctx, 0);
+	rkvdec_reset_fmt(ctx, f, fourcc);
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
 	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
@@ -244,7 +272,6 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
 	const struct rkvdec_coded_fmt_desc *coded_desc;
-	unsigned int i;
 
 	/*
 	 * The codec context should point to a coded format desc, if the format
@@ -255,13 +282,8 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	if (WARN_ON(!coded_desc))
 		return -EINVAL;
 
-	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
-		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
-			break;
-	}
-
-	if (i == coded_desc->num_decoded_fmts)
-		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
+	if (!rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat))
+		pix_mp->pixelformat = rkvdec_enum_decoded_fmt(ctx, 0);
 
 	/* Always apply the frmsize constraint of the coded end. */
 	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
@@ -425,14 +447,13 @@ static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	u32 fourcc;
 
-	if (WARN_ON(!ctx->coded_fmt_desc))
-		return -EINVAL;
-
-	if (f->index >= ctx->coded_fmt_desc->num_decoded_fmts)
+	fourcc = rkvdec_enum_decoded_fmt(ctx, f->index);
+	if (!fourcc)
 		return -EINVAL;
 
-	f->pixelformat = ctx->coded_fmt_desc->decoded_fmts[f->index];
+	f->pixelformat = fourcc;
 	return 0;
 }
 
-- 
2.46.0


