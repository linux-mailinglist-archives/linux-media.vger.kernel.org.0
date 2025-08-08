Return-Path: <linux-media+bounces-39140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0BFB1EF2E
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3180D56846B
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 20:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABA3288C21;
	Fri,  8 Aug 2025 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zq3cE/tb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C39822DF85;
	Fri,  8 Aug 2025 20:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754683441; cv=none; b=lrdSFMqHd3oyXdw2a1TAL7GS2xL/hcXlGDCjVwt931MskL60Ie/dqkfsdQk8U2NifGSziJl2mFZhZ5R4BDr34bLJeBwURqqtSeSsiV1pG8ajkM4uOqyGsa6/IajoMEjk6+f2MVq/y7CidnZt0JNeAPt8ld+Z2aW+rPOQiEsF+L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754683441; c=relaxed/simple;
	bh=UZOwAHNTJe+4Lf5Fv80dzrhgTqLUx5Y3CWAEL+Z3Gnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUT+xD+SHJzIaall6L2Lmp9DEBQuQsMktItDYtK4/7gSfBLhXmUNp9KKzMlq5M1us70+rqOGY3kCujdttRmAJxOCggsZMToeKGV4OHDxb1ovLdJiyLygom0/ikk86nXYQUFGz3eaLnMbA74pzBuAioDOObQaHbovsXwkyBL3rXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zq3cE/tb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754683435;
	bh=UZOwAHNTJe+4Lf5Fv80dzrhgTqLUx5Y3CWAEL+Z3Gnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zq3cE/tbh45sP9Ayvz0gMjYR3FpP3YJRfN4Br/hFdkUJffvJC9P3SYokD0dCk6G60
	 xHnV/BrDo8R1nWzWvrBH2bLdeqNJXJcO7d4HgWU6KLk5VmyAQcqDe933RDrN6AOZUA
	 /mI1YgeX9l+kDwlSxXfT4VWL618s68AeDugOJ9qwrdIZAxvrXmbM8uFRPNdEmcbQ8Y
	 VREUGkb4rWDGz30UvC7sNLbBU4QIfru1gMivRcg3bd/CYEgMcIZfJkVJkj3mvEOvXq
	 6S27BO+ITkgjADWcGWLFATy0gAmJh23BspPErbndgDFECK4vt6pMu/FVaTsGPWdcIL
	 /Sd0nn/GCwX0w==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9B4817E1298;
	Fri,  8 Aug 2025 22:03:53 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 05/12] media: rkvdec: Add per variant configuration
Date: Fri,  8 Aug 2025 16:03:27 -0400
Message-ID: <20250808200340.156393-6-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is to prepare for adding different variants of the decoder and
support specific formats and ops.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 50 ++++++++++++-------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  6 +++
 2 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index a71837103b71d..28585522523c7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -286,13 +286,14 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 };
 
 static const struct rkvdec_coded_fmt_desc *
-rkvdec_find_coded_fmt_desc(u32 fourcc)
+rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
 {
+	struct rkvdec_config *cfg = ctx->dev->config;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_coded_fmts[i].fourcc == fourcc)
-			return &rkvdec_coded_fmts[i];
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		if (cfg->coded_fmts[i].fourcc == fourcc)
+			return &cfg->coded_fmts[i];
 	}
 
 	return NULL;
@@ -300,9 +301,10 @@ rkvdec_find_coded_fmt_desc(u32 fourcc)
 
 static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 {
+	struct rkvdec_config *cfg = ctx->dev->config;
 	struct v4l2_format *f = &ctx->coded_fmt;
 
-	ctx->coded_fmt_desc = &rkvdec_coded_fmts[0];
+	ctx->coded_fmt_desc = &cfg->coded_fmts[0];
 	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
 
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
@@ -316,12 +318,13 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 static int rkvdec_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
 	const struct rkvdec_coded_fmt_desc *fmt;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	fmt = rkvdec_find_coded_fmt_desc(fsize->pixel_format);
+	fmt = rkvdec_find_coded_fmt_desc(ctx, fsize->pixel_format);
 	if (!fmt)
 		return -EINVAL;
 
@@ -388,12 +391,13 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_config *cfg = ctx->dev->config;
 	const struct rkvdec_coded_fmt_desc *desc;
 
-	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
+	desc = rkvdec_find_coded_fmt_desc(ctx, pix_mp->pixelformat);
 	if (!desc) {
-		pix_mp->pixelformat = rkvdec_coded_fmts[0].fourcc;
-		desc = &rkvdec_coded_fmts[0];
+		pix_mp->pixelformat = cfg->coded_fmts[0].fourcc;
+		desc = &cfg->coded_fmts[0];
 	}
 
 	v4l2_apply_frmsize_constraints(&pix_mp->width,
@@ -470,7 +474,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	desc = rkvdec_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
+	desc = rkvdec_find_coded_fmt_desc(ctx, f->fmt.pix_mp.pixelformat);
 	if (!desc)
 		return -EINVAL;
 	ctx->coded_fmt_desc = desc;
@@ -522,10 +526,13 @@ static int rkvdec_g_capture_fmt(struct file *file, void *priv,
 static int rkvdec_enum_output_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(rkvdec_coded_fmts))
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_config *cfg = ctx->dev->config;
+
+	if (f->index >= cfg->coded_fmts_num)
 		return -EINVAL;
 
-	f->pixelformat = rkvdec_coded_fmts[f->index].fourcc;
+	f->pixelformat = cfg->coded_fmts[f->index].fourcc;
 	return 0;
 }
 
@@ -895,16 +902,17 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
 
 static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 {
+	struct rkvdec_config *cfg = ctx->dev->config;
 	unsigned int i, nctrls = 0;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+	for (i = 0; i < cfg->coded_fmts_num; i++)
+		nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
 		if (ret)
 			goto err_free_handler;
 	}
@@ -1119,8 +1127,13 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+const struct rkvdec_config config_rkvdec = {
+	.coded_fmts = (struct rkvdec_coded_fmt_desc *)rkvdec_coded_fmts,
+	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
+};
+
 static const struct of_device_id of_rkvdec_match[] = {
-	{ .compatible = "rockchip,rk3399-vdec" },
+	{ .compatible = "rockchip,rk3399-vdec", .data = &config_rkvdec },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
@@ -1144,6 +1157,9 @@ static int rkvdec_probe(struct platform_device *pdev)
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
+	rkvdec->config =
+		(struct rkvdec_config *)of_device_get_match_data(rkvdec->dev);
+
 	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
 				      sizeof(*rkvdec->clocks), GFP_KERNEL);
 	if (!rkvdec->clocks)
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 3451c4bf7cb75..14717c646c665 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -100,6 +100,11 @@ struct rkvdec_coded_fmt_desc {
 	u32 subsystem_flags;
 };
 
+struct rkvdec_config {
+	struct rkvdec_coded_fmt_desc *coded_fmts;
+	size_t coded_fmts_num;
+};
+
 struct rkvdec_dev {
 	struct v4l2_device v4l2_dev;
 	struct media_device mdev;
@@ -111,6 +116,7 @@ struct rkvdec_dev {
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct iommu_domain *empty_domain;
+	struct rkvdec_config *config;
 };
 
 struct rkvdec_ctx {
-- 
2.50.1


