Return-Path: <linux-media+bounces-45439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6EC0395A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 23:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95BEE4F1B7E
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 21:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A902DEA7A;
	Thu, 23 Oct 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QkyJMZDp"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3352DAFA8;
	Thu, 23 Oct 2025 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761255800; cv=none; b=t+twASxgAUVJcO55QteNxnrH5kkjWOyeBrIQi0w4dnd3frj6GtPxLXXVtAaOn2UKV/CSZQtOujrUW31OM3N+1zTnV42GhA30LKIyExlaHoWC8OjDkEHYBa5VQ8YBlMl3uwFIELBkqBR7jS2he7jCPoK1191l6GBpeoBgu/Ecus4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761255800; c=relaxed/simple;
	bh=MyQnU+ziVxmDWlQNW8S0Z6G/yC/3e+Tz4JHVK6BWaos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Da2DfD5yya74uXZtF3tSWM7Gc5rMCYpPtLaUnhLB2enQWsaHxSSui1uYJy8fiVZx258JxTvdsYbg53fkDY0Icamga4Pj/w145qxuJSiia+tS77Xlschh30vVl/NUf0NNsXIn9o+S0JJv7H/a+BDy51Q4ZDN505lkvWw+d39+A/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QkyJMZDp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761255796;
	bh=MyQnU+ziVxmDWlQNW8S0Z6G/yC/3e+Tz4JHVK6BWaos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkyJMZDpRXcgKsyRSX72SAJi0spMkbrQQmU1xgjrsl0v/1lhl94UG4trBuTzKh0Fi
	 s4tjQ2llOAMju/6QWd5lTnNAETHQVZjQaSh9qLG86c2Kaa4E5G+3W9v19g5P5cm6d2
	 DFSWAC48Ij3RDVgMatUR6SMCGB2lXNEvg7o1vBEeS4vXOHttkSKJsV1MAmmDpX2uDH
	 m0ResIzxscu4N9NqEtLkdITdpIwus+29J24y6xmLu4WdwpW2P3Y8e3qsG0QcLjW2Lw
	 ZD+ulY8dE31zRLaBkmLRPa4/2c84ReXqmCpprtoghcp11tJWqgGfIpijGCpqem0Z2I
	 xa345c0EBx9Ww==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D96817E13DE;
	Thu, 23 Oct 2025 23:43:14 +0200 (CEST)
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
Subject: [PATCH v5 08/15] media: rkvdec: Add variant specific coded formats list
Date: Thu, 23 Oct 2025 17:42:39 -0400
Message-ID: <20251023214247.459931-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251023214247.459931-1-detlev.casanova@collabora.com>
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for adding new variants of the decoder and support specific
formats and format ops per variant.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 35 ++++++++++++-------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  2 ++
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 776149f871b0..968982f6e62c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 {
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	int fmt_idx = -1;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
+	for (i = 0; i < variant->num_coded_fmts; i++) {
+		if (!rkvdec_is_capable(ctx, variant->coded_fmts[i].capability))
 			continue;
 		fmt_idx++;
 		if (index == fmt_idx)
-			return &rkvdec_coded_fmts[i];
+			return &variant->coded_fmts[i];
 	}
 
 	return NULL;
@@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
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
+		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability) &&
+		    variant->coded_fmts[i].fourcc == fourcc)
+			return &variant->coded_fmts[i];
 	}
 
 	return NULL;
@@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
 
 static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 {
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	unsigned int i, nctrls = 0;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
-			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+	for (i = 0; i < variant->num_coded_fmts; i++)
+		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability))
+			nctrls += variant->coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
-			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
+	for (i = 0; i < variant->num_coded_fmts; i++) {
+		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability)) {
+			ret = rkvdec_add_ctrls(ctx, variant->coded_fmts[i].ctrls);
 			if (ret)
 				goto err_free_handler;
 		}
@@ -1242,11 +1245,15 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.num_regs = 68,
+	.coded_fmts = rkvdec_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
 	.capabilities = RKVDEC_CAPABILITY_HEVC,
 };
 
 static const struct rkvdec_variant rk3328_rkvdec_variant = {
 	.num_regs = 109,
+	.coded_fmts = rkvdec_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
 			RKVDEC_CAPABILITY_VP9,
@@ -1255,6 +1262,8 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
 
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
+	.coded_fmts = rkvdec_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
 			RKVDEC_CAPABILITY_VP9,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index f35f6e80ea2e..aac6cba4c623 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -71,6 +71,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 
 struct rkvdec_variant {
 	unsigned int num_regs;
+	const struct rkvdec_coded_fmt_desc *coded_fmts;
+	size_t num_coded_fmts;
 	unsigned int capabilities;
 	unsigned int quirks;
 };
-- 
2.51.1.dirty


