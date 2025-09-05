Return-Path: <linux-media+bounces-41858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4BB45DD5
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA6AEA60EA8
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB1F30217E;
	Fri,  5 Sep 2025 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="YUG9xX+h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C8630216D
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757089213; cv=none; b=Ze/1e+d2yscsioNuF2WHgFst9JS0179VDM/aUzFFio5uFt0UrYMoHuJKvEaAwLqMRRKEtmeOyUqrBab1cMfneFraERzzGeWFMFZCvfPBm+V7EirPURrrIZOghOv/id+Ym/eeo1/eBagypZebGoiINO9JgJ19Zl3Id7YPCVhWjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757089213; c=relaxed/simple;
	bh=Px68MF63onu3h6EYWomJSCvuIM2cOwAalnArcqoFEI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mF684u4MuBSvvfxT55kRtNUbaplEfltoiwZE/kY5YG640U+2yEHtrG04IfG9vf3fzIXQ9VnnjmkWRAWRxv17vv9f4nxj1nSLayE5K4NJ2Ll5CNCVQDXtXaXDclzehLQcWLkKojzzOiQCn/9H2LhQOLTRMD63+PCa4eY3yhiVNaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=YUG9xX+h; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1757089211; bh=jsQ9JGf1qPemLxXlWU5ctSTecIqZzqL5Gbd4uM4ZRNc=;
 b=YUG9xX+hOniFAnc/SFkkI9pL069EOLNw95dxl4yS0cFHJN9DRiMwrDUdvkSKq0J8UVJhKzXet
 dIUCLwkJpnH4F84RCTH5y+gFIcWg6+k9E9mp/BCcK2hUMt4aRiK/4JlJvG2rMgm83qamCN7x8Nx
 n1KjJN7nemyttKjATQzSX0xqrYUPBUjaoedviB9dmtvX48W4G5eIKnYc/SFF4ASuNMFLo9hSlCw
 IFmrGTLrMdXCoeeTYLDU2Va2AIYvVIsO8jChqSCKiDn+3y5QzsWaFOSZyWnZqnwrBe22CmBediO
 c+klcRR2EUp3zYn17fv2g/rdxB6ol0Bz0bFZ81YJIFwA==
X-Forward-Email-ID: 68bb0db890d039a4fd84d604
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 3/7] media: rkvdec: Implement capability filtering
Date: Fri,  5 Sep 2025 16:19:21 +0000
Message-ID: <20250905161942.3759717-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add filtering of coded formats and controls depending on a variant
capabilities.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Change to use file_to_rkvdec_ctx()
- Use capabilities from rkvdec_variant
- Collect r-b tag

Changes in v2:
- Adjust code style in rkvdec_enum_coded_fmt_desc()
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 67 ++++++++++++++-----
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index daf6d9ab2d1d..088ddfadf995 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -365,13 +365,36 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 	}
 };
 
+static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
+{
+	return (ctx->dev->variant->capabilities & capability) == capability;
+}
+
 static const struct rkvdec_coded_fmt_desc *
-rkvdec_find_coded_fmt_desc(u32 fourcc)
+rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 {
+	int fmt_idx = -1;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_coded_fmts[i].fourcc == fourcc)
+		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
+			continue;
+		fmt_idx++;
+		if (index == fmt_idx)
+			return &rkvdec_coded_fmts[i];
+	}
+
+	return NULL;
+}
+
+static const struct rkvdec_coded_fmt_desc *
+rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
+		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
+		    rkvdec_coded_fmts[i].fourcc == fourcc)
 			return &rkvdec_coded_fmts[i];
 	}
 
@@ -382,7 +405,7 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_format *f = &ctx->coded_fmt;
 
-	ctx->coded_fmt_desc = &rkvdec_coded_fmts[0];
+	ctx->coded_fmt_desc = rkvdec_enum_coded_fmt_desc(ctx, 0);
 	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
 
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
@@ -396,21 +419,22 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 static int rkvdec_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
-	const struct rkvdec_coded_fmt_desc *fmt;
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
+	const struct rkvdec_coded_fmt_desc *desc;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	fmt = rkvdec_find_coded_fmt_desc(fsize->pixel_format);
-	if (!fmt)
+	desc = rkvdec_find_coded_fmt_desc(ctx, fsize->pixel_format);
+	if (!desc)
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
 	fsize->stepwise.min_width = 1;
-	fsize->stepwise.max_width = fmt->frmsize.max_width;
+	fsize->stepwise.max_width = desc->frmsize.max_width;
 	fsize->stepwise.step_width = 1;
 	fsize->stepwise.min_height = 1;
-	fsize->stepwise.max_height = fmt->frmsize.max_height;
+	fsize->stepwise.max_height = desc->frmsize.max_height;
 	fsize->stepwise.step_height = 1;
 
 	return 0;
@@ -470,10 +494,10 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	const struct rkvdec_coded_fmt_desc *desc;
 
-	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
+	desc = rkvdec_find_coded_fmt_desc(ctx, pix_mp->pixelformat);
 	if (!desc) {
-		pix_mp->pixelformat = rkvdec_coded_fmts[0].fourcc;
-		desc = &rkvdec_coded_fmts[0];
+		desc = rkvdec_enum_coded_fmt_desc(ctx, 0);
+		pix_mp->pixelformat = desc->fourcc;
 	}
 
 	v4l2_apply_frmsize_constraints(&pix_mp->width,
@@ -550,7 +574,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	desc = rkvdec_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
+	desc = rkvdec_find_coded_fmt_desc(ctx, f->fmt.pix_mp.pixelformat);
 	if (!desc)
 		return -EINVAL;
 	ctx->coded_fmt_desc = desc;
@@ -602,10 +626,14 @@ static int rkvdec_g_capture_fmt(struct file *file, void *priv,
 static int rkvdec_enum_output_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(rkvdec_coded_fmts))
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
+	const struct rkvdec_coded_fmt_desc *desc;
+
+	desc = rkvdec_enum_coded_fmt_desc(ctx, f->index);
+	if (!desc)
 		return -EINVAL;
 
-	f->pixelformat = rkvdec_coded_fmts[f->index].fourcc;
+	f->pixelformat = desc->fourcc;
 	return 0;
 }
 
@@ -970,14 +998,17 @@ static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
+			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
 	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
-		if (ret)
-			goto err_free_handler;
+		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
+			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
+			if (ret)
+				goto err_free_handler;
+		}
 	}
 
 	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
-- 
2.51.0


