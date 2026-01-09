Return-Path: <linux-media+bounces-50299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5707D0B310
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 17:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50A3930A5C5F
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F711364EA0;
	Fri,  9 Jan 2026 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QTn2jLVv"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D26B364024;
	Fri,  9 Jan 2026 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975374; cv=none; b=eqUsw/ZqLYFfhTtvvWPEhyorrOXbh1K1Nagpg32SdGb2srgD5RSPQM8L8s+bPATe0x42lxy1Khxf0/6aWfPxyaNvXs55tOx/AcJSPZ8gnTBX8pWMrRV9Fg8HCQ3TSrUsfIXvgj4Z5Qz/yalRyYdVwmhIJSE+bF8CSFjZrJrt1e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975374; c=relaxed/simple;
	bh=AAcKqp1ylkAC240pSTWqd8H+tnWyz3uLdrsFl0fLhxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLX7HPt8K5bTfTCVUxha9df9MqEDsrUXziGI1PxtWfGk9i6WKLyHm4tf5guTmhcopS6qhG1JR9T2F5g3N8BFR4bKyFyfX7ujQ9swAeeMeon10L48TqAnb11JAPT/lwSvEwEqFSxKYZmtAdHLJHedkGwIlviF0bn/BHMfeojYHpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QTn2jLVv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767975370;
	bh=AAcKqp1ylkAC240pSTWqd8H+tnWyz3uLdrsFl0fLhxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QTn2jLVvdF4TyKt1Y3RAApvMb3NlsI6/HVUB6XBbjK1qtB8zQcD2zkjFhyoPUs7hA
	 x06vuGUnBPdcvYtPIPOdQz073QaYV2KSv8/OHNwMuqi9OrfWULeum2a0FeOAA7cizk
	 80cPceYiVTaDiXfMwlLFWYJDd/q6YWdWiiw0tscsN/KSKytl+hKuOj1/JTG2okPPa2
	 6TyFS0tbkt+HaGny91/EEvLZsLJC8HrOTvbueSCstB07sY2riiWKOGBH1Rtf6ty/Bb
	 KTo4x+4774Vs/iiYUxttSGQ1IMXNn8LtkIdlMNLHqlvVfOrD5BHdId8hhK8+2gS3iL
	 2jcDr/3vnnCBw==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 676D517E3819;
	Fri,  9 Jan 2026 17:16:08 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v8 09/17] media: rkvdec: Add variant specific coded formats list
Date: Fri,  9 Jan 2026 11:15:25 -0500
Message-ID: <20260109161538.1294449-10-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109161538.1294449-1-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for adding new variants of the decoder and support specific
formats and format ops per variant.

This removes the need of capability flags for variants, so remove them.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 68 ++++++++++---------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  8 +--
 2 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 776149f871b0..92b1c7b62bd2 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -328,7 +328,6 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_hevc_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
 		.decoded_fmts = rkvdec_hevc_decoded_fmts,
-		.capability = RKVDEC_CAPABILITY_HEVC,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
@@ -345,7 +344,6 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
 		.decoded_fmts = rkvdec_h264_decoded_fmts,
 		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
-		.capability = RKVDEC_CAPABILITY_H264,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
@@ -361,27 +359,38 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_vp9_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
 		.decoded_fmts = rkvdec_vp9_decoded_fmts,
-		.capability = RKVDEC_CAPABILITY_VP9,
 	}
 };
 
-static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
-{
-	return (ctx->dev->variant->capabilities & capability) == capability;
-}
+static const struct rkvdec_coded_fmt_desc rk3288_coded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width = 4096,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height = 2304,
+			.step_height = 16,
+		},
+		.ctrls = &rkvdec_hevc_ctrls,
+		.ops = &rkvdec_hevc_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
+		.decoded_fmts = rkvdec_hevc_decoded_fmts,
+	}
+};
 
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 {
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	int fmt_idx = -1;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
-			continue;
+	for (i = 0; i < variant->num_coded_fmts; i++) {
 		fmt_idx++;
 		if (index == fmt_idx)
-			return &rkvdec_coded_fmts[i];
+			return &variant->coded_fmts[i];
 	}
 
 	return NULL;
@@ -390,12 +399,12 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
 {
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
-		    rkvdec_coded_fmts[i].fourcc == fourcc)
-			return &rkvdec_coded_fmts[i];
+	for (i = 0; i < variant->num_coded_fmts; i++) {
+		if (variant->coded_fmts[i].fourcc == fourcc)
+			return &variant->coded_fmts[i];
 	}
 
 	return NULL;
@@ -1014,21 +1023,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
 
 static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 {
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	unsigned int i, nctrls = 0;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
-			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+	for (i = 0; i < variant->num_coded_fmts; i++)
+		nctrls += variant->coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
-			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
-			if (ret)
-				goto err_free_handler;
-		}
+	for (i = 0; i < variant->num_coded_fmts; i++) {
+		ret = rkvdec_add_ctrls(ctx, variant->coded_fmts[i].ctrls);
+		if (ret)
+			goto err_free_handler;
 	}
 
 	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
@@ -1242,22 +1249,21 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.num_regs = 68,
-	.capabilities = RKVDEC_CAPABILITY_HEVC,
+	.coded_fmts = rk3288_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rk3288_coded_fmts),
 };
 
 static const struct rkvdec_variant rk3328_rkvdec_variant = {
 	.num_regs = 109,
-	.capabilities = RKVDEC_CAPABILITY_HEVC |
-			RKVDEC_CAPABILITY_H264 |
-			RKVDEC_CAPABILITY_VP9,
+	.coded_fmts = rkvdec_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
 	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
 };
 
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
-	.capabilities = RKVDEC_CAPABILITY_HEVC |
-			RKVDEC_CAPABILITY_H264 |
-			RKVDEC_CAPABILITY_VP9,
+	.coded_fmts = rkvdec_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
 };
 
 static const struct of_device_id of_rkvdec_match[] = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index f35f6e80ea2e..8c4f96ba5cde 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -22,10 +22,6 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
-#define RKVDEC_CAPABILITY_HEVC		BIT(0)
-#define RKVDEC_CAPABILITY_H264		BIT(1)
-#define RKVDEC_CAPABILITY_VP9		BIT(2)
-
 #define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
 
 struct rkvdec_ctx;
@@ -71,7 +67,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 
 struct rkvdec_variant {
 	unsigned int num_regs;
-	unsigned int capabilities;
+	const struct rkvdec_coded_fmt_desc *coded_fmts;
+	size_t num_coded_fmts;
 	unsigned int quirks;
 };
 
@@ -110,7 +107,6 @@ struct rkvdec_coded_fmt_desc {
 	unsigned int num_decoded_fmts;
 	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
 	u32 subsystem_flags;
-	unsigned int capability;
 };
 
 struct rkvdec_dev {
-- 
2.52.0


