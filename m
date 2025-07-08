Return-Path: <linux-media+bounces-37123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C6AFCEF6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A8871BC21DC
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D222E2EFB;
	Tue,  8 Jul 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OdhIK7Pz"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A02E1737;
	Tue,  8 Jul 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751988009; cv=none; b=bLBwXvmz0yfehYdmouunD00Uzlb0Xhb0kFZde1EPVcS3lefzXilvF/8basLVy7Y9soAKdKm9vC1hUmjyLNQvqR3ZEQP4IhPP7/ELTih5qYWyRZii5ozz3oDgzVLoIFwBeZLOYHGys7euBiYxP8dMkptDVKxl3bKZkB+mN1mGtU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751988009; c=relaxed/simple;
	bh=ze7OLjPjKlCigqfxtOMOBTAvSdypPLUcg8IPJNuCXok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJhKO9SoiHZ6onmhFkC9CVwzh5RP1BPOJ4GFvT/gNuZAr0ntaRLOU7SLB1DT8iI7sWzXA5ybEIRcCtrUmRretkJbJysPouVh8PjiHgFw9/LSarpO1KjI8gCPpkGtas/5v2FH6ul6UdbuYGluRA/yf7kzcNLF+h/9rDCx3DH0VWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OdhIK7Pz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751988003;
	bh=ze7OLjPjKlCigqfxtOMOBTAvSdypPLUcg8IPJNuCXok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OdhIK7Pz/UHZ80L44/N/Ybx16oF2OBCdV7sphvazjxz3V/q4qQZFhc2n/P2l2nU6E
	 +/TWt/8/TbgUwct/ABArVnrGHhSerIYHuiBOGK/gcTbMx/1txXf/JMD5UgM87Kviuc
	 wgDrMOS6Kn5aVLxcotNqQIg+HOwTkmUN5+/WmhJDKzv+mdlot3YnywNHyaUx2wAHfg
	 nK/e0Nat5OK/NH7GlzaCqQDq3eNVddMwolY7MKSEWbXKKaiFoL/L7daK3UQg1tbw3Z
	 UyKBAps98hYhbtzyBJXAhKp0Tx5TyxMzJfXZ8ZkLtH+82mk5EwX3Ryc3r1rhQly6Dy
	 pH00PwY+qrctw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7034A17E11ED;
	Tue,  8 Jul 2025 17:20:02 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 05/12] media: rkvdec: Add per variant configuration
Date: Tue,  8 Jul 2025 11:19:38 -0400
Message-ID: <20250708151946.374349-6-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708151946.374349-1-detlev.casanova@collabora.com>
References: <20250708151946.374349-1-detlev.casanova@collabora.com>
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
index c3f35a02d7fdb..3496216d99c18 100644
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
2.50.0


