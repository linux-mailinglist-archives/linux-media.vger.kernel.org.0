Return-Path: <linux-media+bounces-51975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOkiF2FzgGnU8QIAu9opvQ
	(envelope-from <linux-media+bounces-51975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 10:50:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1517CA4AF
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 10:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BE66301B72B
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 09:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DCA2E2DF3;
	Mon,  2 Feb 2026 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaYKlSvk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1914A2DC337;
	Mon,  2 Feb 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025692; cv=none; b=jw0hfNJAHDtKhQC3r2igRKxy5KiVXZAOtjuvGpCIC3PAGIJZQL12LVhf3JELmbbtKEA0JOocuLhAFmbCjWErZRRE3uqwNzw6VUTM3W9bdV13aO/lIXNLGHV/P9qgjvzuEeviYJSWqFSMBNlBVfsfXR7mI1an6jMLWWGaxdfD/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025692; c=relaxed/simple;
	bh=5K6vbILKfAvsEfbhV3qaRciVW+JYPHJcTO2mdlMYeV8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MLJzyA7L5yIuWVcpqiiaGkVIexKAUwjcFtMlW4wGOxGTk6+yPX0fpjbVrkGqbQ+3gtMAf+YjZu4PnpMz6jZ5OeB+OXH91BXtwwJikfPfRYN/mg3G2qSL1Ww73raYt+GwUQ8TQfOpJ6+/i+j/pFJDhVtLCeeSXOAh+9wvMDU2wAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaYKlSvk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7A2C116C6;
	Mon,  2 Feb 2026 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770025691;
	bh=5K6vbILKfAvsEfbhV3qaRciVW+JYPHJcTO2mdlMYeV8=;
	h=From:To:Cc:Subject:Date:From;
	b=JaYKlSvkBgwpyt18cqC58hmzMQAtKrYA0gMA4zs39L6yQ34SAB+08BawaTPzvBAVx
	 XEYAYeVC+AmTN7NogCCwmxQHOsaou4TjfApzF5KWPZUs7oItfujKkVWE+mzB9k0qsV
	 Vk7Sx9gRp6bkmfsShGLXPgpoU0je6hNLZG6B8OyZvkopl76b5GyaGnn48Nbh2kvgpt
	 GIv9w6WHg6LbYXhPTjHerHxmNCRVqgLZClyz9hXkdKgWuBzWvY8s++EncVYSpqPW+5
	 rpWaXcSHhusqtX7o71o8y/vylqjlDnCoMLQE65R+75lH5+ohyV5LRN2qreuBt28zbr
	 F6pI8LR2ywRuA==
From: Arnd Bergmann <arnd@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in assemble_hw_pps()
Date: Mon,  2 Feb 2026 10:47:50 +0100
Message-Id: <20260202094804.1231706-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-51975-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1517CA4AF
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

The rkvdec_pps had a large set of bitfields, all of which
as misaligned. This causes clang-21 and likely other versions to
produce absolutely awful object code and a warning about very
large stack usage, on targets without unaligned access:

drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: stack frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-Wframe-larger-than]

Part of the problem here is how all the bitfield accesses are
inlined into a function that already has large structures on
the stack.

Mark set_field_order_cnt() as noinline_for_stack, and split out
the following accesses in assemble_hw_pps() into another noinline
function, both of which now using around 800 bytes of stack in the
same configuration.

There is clearly still something wrong with clang here, but
splitting it into multiple functions reduces the risk of stack
overflow.

Fixes: fde24907570d ("media: rkvdec: Add H264 support for the VDPU383 variant")
Link: https://godbolt.org/z/acP1eKeq9
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     | 50 ++++++++++---------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index 6ab3167addc8..ef69f2a36478 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -130,7 +130,7 @@ struct rkvdec_h264_ctx {
 	struct vdpu383_regs_h26x regs;
 };
 
-static void set_field_order_cnt(struct rkvdec_pps *pps, const struct v4l2_h264_dpb_entry *dpb)
+static noinline_for_stack void set_field_order_cnt(struct rkvdec_pps *pps, const struct v4l2_h264_dpb_entry *dpb)
 {
 	pps->top_field_order_cnt0 = dpb[0].top_field_order_cnt;
 	pps->bot_field_order_cnt0 = dpb[0].bottom_field_order_cnt;
@@ -166,6 +166,31 @@ static void set_field_order_cnt(struct rkvdec_pps *pps, const struct v4l2_h264_d
 	pps->bot_field_order_cnt15 = dpb[15].bottom_field_order_cnt;
 }
 
+static noinline_for_stack void set_dec_params(struct rkvdec_pps *pps, const struct v4l2_ctrl_h264_decode_params *dec_params)
+{
+	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
+
+	for (int i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+			pps->is_longterm |= (1 << i);
+		pps->ref_field_flags |=
+		 (!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)) << i;
+		pps->ref_colmv_use_flag |=
+		 (!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) << i;
+		pps->ref_topfield_used |=
+		 (!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF)) << i;
+		pps->ref_botfield_used |=
+			(!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)) << i;
+	}
+	pps->pic_field_flag =
+		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC);
+	pps->pic_associated_flag =
+		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD);
+
+	pps->cur_top_field = dec_params->top_field_order_cnt;
+	pps->cur_bot_field = dec_params->bottom_field_order_cnt;
+}
+
 static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_h264_run *run)
 {
@@ -177,7 +202,6 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
 	struct rkvdec_sps_pps *hw_ps;
 	u32 pic_width, pic_height;
-	u32 i;
 
 	/*
 	 * HW read the SPS/PPS information from PPS packet index by PPS id.
@@ -261,28 +285,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
 
 	set_field_order_cnt(&hw_ps->pps, dpb);
+	set_dec_params(&hw_ps->pps, dec_params);
 
-	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			hw_ps->pps.is_longterm |= (1 << i);
-
-		hw_ps->pps.ref_field_flags |=
-			(!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)) << i;
-		hw_ps->pps.ref_colmv_use_flag |=
-			(!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) << i;
-		hw_ps->pps.ref_topfield_used |=
-			(!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF)) << i;
-		hw_ps->pps.ref_botfield_used |=
-			(!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)) << i;
-	}
-
-	hw_ps->pps.pic_field_flag =
-		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC);
-	hw_ps->pps.pic_associated_flag =
-		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD);
-
-	hw_ps->pps.cur_top_field = dec_params->top_field_order_cnt;
-	hw_ps->pps.cur_bot_field = dec_params->bottom_field_order_cnt;
 }
 
 static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
-- 
2.39.5


