Return-Path: <linux-media+bounces-54658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO6fFmKjqWl5BQEAu9opvQ
	(envelope-from <linux-media+bounces-54658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 16:38:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D73214A76
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 16:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BF9F3002B4E
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 15:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92A93ACA50;
	Thu,  5 Mar 2026 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lk41FGwK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E38217B418;
	Thu,  5 Mar 2026 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772724412; cv=none; b=Vz77qnkhwzzgMMV9AEwsWWjthwvOJAYDXMQV86Eg8+C6GJGGgrqhLDQigcfl+7IV8Qixj90NxBdZLBtQJ9eHd+SyG+kmbxFwoP8+FZGogYPf3jMA1ryOowMLCfKx4v3iUq9IBGDQmAkWPAgCbQpRZRRK9FHFt+lLNKUQDGTFYvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772724412; c=relaxed/simple;
	bh=4Ph21YNHCyEvjo/bKXsJPUwpBDx3Z0UNvaVUS93jta4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WU+a0W/r7r5+ycwjTAVofiKuwLTWyKnDzcU+AF3LFBRJRVPz8HzdEUxvJmNGI3EfTJhgulLhTcMvjMJkgmc+9EPvXvQDoZdeAH98V+EnQ1RbJurUPyhaFMoYzQLAhnvcgQKV4J5HAPBqwMZW8omao23JZ87T18uZuPFpgB9w7rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lk41FGwK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A04C19423;
	Thu,  5 Mar 2026 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772724411;
	bh=4Ph21YNHCyEvjo/bKXsJPUwpBDx3Z0UNvaVUS93jta4=;
	h=From:To:Cc:Subject:Date:From;
	b=Lk41FGwK+FS+12m6ve1kB+572nNh9e3n0pHZe3KCtpj8K13JaGUU1r10n3KoWImzB
	 GRbs/hhlO3fxTSSP7+FMqBXsv0Uz12FNZnIWBUtogJLKvSN34j981H4kjlVGDjC783
	 8D0A5rKf3nw/utRvuZ16dvWGAZ7cwA8Xy8lR3vIpin0/vk7v4x2IpZh+4VsA/pJfxK
	 QQWzEcGfa8SleV/azMcKC/jF3GUTBSY7BfIp/hNTpEUEw5ZCD3Pa+STYcv6B8RAYoz
	 fPC5oY1IwSi5wfiZsnaPWBVeJcGNlxcxES40ztC+5lUqMEtrD40Z9HoKgQqg+afifj
	 tURebJhKNOf8g==
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
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/2] [RESEND] media: rkvdec: reduce excessive stack usage in assemble_hw_pps()
Date: Thu,  5 Mar 2026 16:26:16 +0100
Message-Id: <20260305152644.791897-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 60D73214A76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,google.com,kernel.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-54658-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,godbolt.org:url,collabora.com:email,arndb.de:email]
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
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Resending this along with the other patch mainly to point out that
this one is still pending as well.
---
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     | 50 ++++++++++---------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index 97f1efde2e47..fb4f849d7366 100644
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


