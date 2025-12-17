Return-Path: <linux-media+bounces-49012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACDCC91F9
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 18:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0802B305A148
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 17:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F183346A1A;
	Wed, 17 Dec 2025 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VNlzjmoT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3A533C189;
	Wed, 17 Dec 2025 17:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765993338; cv=none; b=HKFiSH/h/rq8VArLgPBmVjM8jtoJ8rfpufWpcpey38bZt3qUslP/8j5VMf1P7+zUp6ToN4HfClg7SMTDwrVfr1w1R8AjqtZgxgxhQhnREX3nqVDA0BQVaeELHolt6tupvc8KdRje/7Q4y7asuNGY7UwkR6/VpqsAKnxCPPRR5uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765993338; c=relaxed/simple;
	bh=CUi6S4rcvat8nGVoMBsnETZJbMB78OeBPrn9bjQZcPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dp2yVEQrZMk4FATcxvGHLoEpbCzr7/u21yrrGnnE3sfuA3yjATdD6Qh/wQD92Lf3ahQeA6vz0eI8naUY36FAE0GS2l7vcildEN/aFMDJeGDBoZE9DsRcDek70ZtuXpxKK++pvMCf1v1yLmo/4JvM3sE44WUhLf4tqCaMJyyOyBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VNlzjmoT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765993331;
	bh=CUi6S4rcvat8nGVoMBsnETZJbMB78OeBPrn9bjQZcPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VNlzjmoTEbklSj56fqfme8pxyY7iE4lymH0TbwiNgXVZwoInuES/jzH2lkC83ShlZ
	 efSqTlcFOZWQ1Tumw89zgwYjcuTdkT0mMOwj4g5cUfeT7x7JlKV8JGAPb7WpUAx4ed
	 1qfs4un6I5Ss/KFONoV3fhifOgDpuhrHtJZkBOSsyTGzuxafe5YUur56+1gjIcvZOE
	 pCRopwwgg+JwWRBfC6g3BhtcHJpmcRndq88xpQVmcr2jKe9q5z+Z+q2H0f818WZGNo
	 cQ2fVlNABlo1IgWRu/ydFfK6gkd4Lp4i/XmWDrWDdB8VicwYxSh3wrICiFFTKQF7TZ
	 llHQCiE2J1ulg==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55F6817E150D;
	Wed, 17 Dec 2025 18:42:08 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v6 09/17] media: rkvdec: Add variant specific coded formats list
Date: Wed, 17 Dec 2025 12:40:46 -0500
Message-ID: <20251217174059.1341784-10-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217174059.1341784-1-detlev.casanova@collabora.com>
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
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
2.52.0


