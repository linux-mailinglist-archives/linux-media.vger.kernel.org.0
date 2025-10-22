Return-Path: <linux-media+bounces-45286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE5BFD557
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 18:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D20815632DF
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BD8357726;
	Wed, 22 Oct 2025 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P0t+K76h"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27A3570D4;
	Wed, 22 Oct 2025 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150356; cv=none; b=RCkG/NKxmaU2peLz7Lwt3aipiIWIs8XoShwEQUOsVLLPiFO5SEXK6i9/GSxAOk8IHotT130McYMO++Km0USf161YG31ic+40uwuygR84e5l1nKWjInh0x+GmGaMTYYzPeoFcN2JYZHQN/arOMgIkPfxTEzzsedBQSqSf3gtoWyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150356; c=relaxed/simple;
	bh=5XepCE8oQ4CfIylcFNZHUx5cQS3sUUTvzh5DlZ/N4/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pS2cjvLfAUlzbzs3zr4o1Gfr76R75dLpRrIzMevsqUdjitlIg0U3yzRtfJmvai+rKRAjfCQ6psXUkQSLzVEvopuuo0OeLyE8rno7OvCd7tiViQixh19+KSWdVpLo++EF5US4scvhJPDcDF6zletQxpEMr3jye36dpgNVK1xe7HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P0t+K76h; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761150352;
	bh=5XepCE8oQ4CfIylcFNZHUx5cQS3sUUTvzh5DlZ/N4/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0t+K76hJcGBebSmfvjK9UEbNi++7UBmpAvQW/+8AF78GkTIhMMq6StOEC7V/evEZ
	 xw/KvtT/owMWWVqWo6zwoBZgd9Dc27m2niz1y5H6AIZPayww+e5zFjiAZZPGlBWgMN
	 Xb1JyLyvPKqFiIaT3FLAmI5JMhMO1F0lJ432D3OGxUriIUZ6k8+qi2O+Zk8gyP9EGr
	 AhDXukGy1Ara2VyuZK9ExXGjLC83Bp2k/w8kpNouLnqI0Ioc+o+O0rVR8aGQ4wKsgG
	 2gEUg3h1C+Sx8qNzhqo82DXpCRsYP28f/jY95xnIgYv07m14tzDF0X1LBIOK7hKzj2
	 BMJVcJMxrW+MQ==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B90E17E108C;
	Wed, 22 Oct 2025 18:25:50 +0200 (CEST)
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
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v3 08/15] media: rkvdec: Add generic configuration for variants
Date: Wed, 22 Oct 2025 12:22:07 -0400
Message-ID: <20251022162459.271603-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251022162459.271603-1-detlev.casanova@collabora.com>
References: <20251022162459.271603-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is to prepare for adding new versions of the decoder and
support specific formats and ops per version.

Different rkvdec_variant instances will be able to share generic
decoder configs.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 37 ++++++++++++-------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  6 +++
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 776149f871b0..a7af1e3fdebd 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 {
+	const struct rkvdec_config *cfg = ctx->dev->variant->config;
 	int fmt_idx = -1;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		if (!rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
 			continue;
 		fmt_idx++;
 		if (index == fmt_idx)
-			return &rkvdec_coded_fmts[i];
+			return &cfg->coded_fmts[i];
 	}
 
 	return NULL;
@@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
 {
+	const struct rkvdec_config *cfg = ctx->dev->variant->config;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
-		    rkvdec_coded_fmts[i].fourcc == fourcc)
-			return &rkvdec_coded_fmts[i];
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability) &&
+		    cfg->coded_fmts[i].fourcc == fourcc)
+			return &cfg->coded_fmts[i];
 	}
 
 	return NULL;
@@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
 
 static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 {
+	const struct rkvdec_config *cfg = ctx->dev->variant->config;
 	unsigned int i, nctrls = 0;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
-			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+	for (i = 0; i < cfg->coded_fmts_num; i++)
+		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
+			nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
-			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability)) {
+			ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
 			if (ret)
 				goto err_free_handler;
 		}
@@ -1240,13 +1243,20 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_config config_rkvdec = {
+	.coded_fmts = rkvdec_coded_fmts,
+	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
+};
+
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.num_regs = 68,
+	.config = &config_rkvdec,
 	.capabilities = RKVDEC_CAPABILITY_HEVC,
 };
 
 static const struct rkvdec_variant rk3328_rkvdec_variant = {
 	.num_regs = 109,
+	.config = &config_rkvdec,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
 			RKVDEC_CAPABILITY_VP9,
@@ -1255,6 +1265,7 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
 
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
+	.config = &config_rkvdec,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
 			RKVDEC_CAPABILITY_VP9,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index f35f6e80ea2e..3b1cc511412e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -71,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 
 struct rkvdec_variant {
 	unsigned int num_regs;
+	const struct rkvdec_config *config;
 	unsigned int capabilities;
 	unsigned int quirks;
 };
@@ -113,6 +114,11 @@ struct rkvdec_coded_fmt_desc {
 	unsigned int capability;
 };
 
+struct rkvdec_config {
+	const struct rkvdec_coded_fmt_desc *coded_fmts;
+	size_t coded_fmts_num;
+};
+
 struct rkvdec_dev {
 	struct v4l2_device v4l2_dev;
 	struct media_device mdev;
-- 
2.51.1.dirty


