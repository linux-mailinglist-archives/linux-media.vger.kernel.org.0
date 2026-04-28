Return-Path: <linux-media+bounces-59803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB1KFkGB8Gn6UAEAu9opvQ
	(envelope-from <linux-media+bounces-59803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:43:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8F481BAE
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37D14344CE55
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB3D3EF0B3;
	Tue, 28 Apr 2026 09:01:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E283E4C99
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366871; cv=none; b=gR/ps1hfumzmmL4RN2pVvNHQpCi6nPdCHgL22nnrQeusnP0b0NnlxPWb7rzT4TQ1rYvKw+QHMjd3RXAOey0BxA/7boc7AS7JJZwSO2wv7+poEiSMCnW90oNPo2c03VIXbXniMY3EM10q0K0wySulXJwzmmFUh3rd0wSw6U9vP5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366871; c=relaxed/simple;
	bh=Ik7wVtrOHKYzimsGwxz4CxrPgF8JxX/MMCTmwdWfxvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPt6y8bXyfsfCLqOe12ykpHb2rY6uKrFDsoHHxLzj+pqwyAbOtw51yquwMrMESNtmYAA8j8wXr6rrkwuSU4IR7GcECCmB/UhSjLkFFPizYrPH3EZuopIwN3q1Mr7+WtsJgeeM0TPqqQwgLwIqjH23YoGXDqQxGxGtmdGuBlayhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJG-0004Lz-9x; Tue, 28 Apr 2026 11:00:50 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:51 +0200
Subject: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate into
 separate function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
In-Reply-To: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: E6C8F481BAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59803-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Split the flip and rotate command configuration into a separate
function in preparation of filling the command stream at streamon.
As the userspace can change the flipping and rotation controls while
streaming, we have to update them with each new frame to prevent the
user being unable to change them while streaming.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 57 +++++++++++++++++-----------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index dac3cb6aa17d3..6c1956b04f6ba 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -156,7 +156,38 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 	dest[reg >> 2] |= 0x7 << 8;
 }
 
-static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
+static void rga_cmd_set_flip_rotate_info(struct rga_ctx *ctx)
+{
+	u32 *dest = ctx->cmdbuf_virt;
+	union rga_src_info src_info;
+
+	src_info.val = dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
+
+	if (ctx->vflip)
+		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
+
+	if (ctx->hflip)
+		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
+
+	switch (ctx->rotate) {
+	case 90:
+		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
+		break;
+	case 180:
+		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
+		break;
+	case 270:
+		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
+		break;
+	default:
+		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
+		break;
+	}
+
+	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] = src_info.val;
+}
+
+static void rga_cmd_set_format_scale_info(struct rga_ctx *ctx)
 {
 	struct rockchip_rga *rga = ctx->rga;
 	u32 *dest = ctx->cmdbuf_virt;
@@ -219,27 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 		}
 	}
 
-	if (ctx->vflip)
-		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
-
-	if (ctx->hflip)
-		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
-
-	switch (ctx->rotate) {
-	case 90:
-		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
-		break;
-	case 180:
-		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
-		break;
-	case 270:
-		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
-		break;
-	default:
-		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
-		break;
-	}
-
 	/*
 	 * Calculate the up/down scaling mode/factor.
 	 *
@@ -431,7 +441,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 
 	rga_cmd_set_src_info(ctx, &src->offset);
 	rga_cmd_set_dst_info(ctx, &dst->offset);
-	rga_cmd_set_trans_info(ctx);
+	rga_cmd_set_format_scale_info(ctx);
+	rga_cmd_set_flip_rotate_info(ctx);
 
 	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
 

-- 
2.54.0


