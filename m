Return-Path: <linux-media+bounces-45309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA23BFDAFE
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CA283B1B93
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F552F5A05;
	Wed, 22 Oct 2025 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pjd5UL/j"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2632EB5B4;
	Wed, 22 Oct 2025 17:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155140; cv=none; b=bszZ6o5F3fJTAJY2O+hvi3JJfctJXbHoI/cDMT4xkizeNojZNZUEi0RNOWUTQ7OGm98gDOUWJ3JMl0zQF7RwBUHmuGY1JqonpV3MM1OnUWAzlGnuZfhK3Y9Jp4pC/gvNt3q5M/8SGAkHkVXNoVyNsbcYDOd56pk7T0JaV8EvTyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155140; c=relaxed/simple;
	bh=5XepCE8oQ4CfIylcFNZHUx5cQS3sUUTvzh5DlZ/N4/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqrEZo4LKqEt++3oInsqdRjTFyYkTzH7zOtdFJdMTPeOxDe784v5NwFdcJXKLWHYz4Jik85Td0uEYimTzbjEh/60whCnn6GKVr0Gagslk2X8x4JLc0jgVHzfwnFaJ9ulAPEqpqHJUq9KIiSdP/kSvEa8kVnBsONwn8sqfYJVylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Pjd5UL/j; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761155136;
	bh=5XepCE8oQ4CfIylcFNZHUx5cQS3sUUTvzh5DlZ/N4/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pjd5UL/jE+qXULPScTa9szBWU5Nc8DH8SlpMC2ScT0jl7N+ZH+jA+IaAToecuT1Bp
	 8FIHM/9AmtelGRvu2vDW8lkjebWJsRc0/azJSGiLIy4bDZZjeMW0VnFEpkmACD5Fuf
	 xv8nq5XuIquqomSJt/LrWRFv1BjH1dhJL1JD6Fc9cEai4QThpJK4Ej9uqLAzXOvi0E
	 yQmjxV4I4gfvckbCRzxOJwsLfUe5IU5WhBoksYbFfXftpqrtEzswkEahK8jciS1BbU
	 hn1CZ0EsAnHGdz+zWDfL40/rutKbXSIArRrllu/FFqU/KEQntqU9zBFvXojrJjBypX
	 24+nODKi52Myg==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9235F17E02B0;
	Wed, 22 Oct 2025 19:45:33 +0200 (CEST)
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
Subject: [PATCH v4 08/15] media: rkvdec: Add generic configuration for variants
Date: Wed, 22 Oct 2025 13:45:00 -0400
Message-ID: <20251022174508.284929-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251022174508.284929-1-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
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


