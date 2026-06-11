Return-Path: <linux-media+bounces-64626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E1ZAGogfK2r82wMAu9opvQ
	(envelope-from <linux-media+bounces-64626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:50:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D16754F3
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:50:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=a6xZRSDS;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="c So2t65";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64626-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64626-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38C73303133B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056694CA28C;
	Thu, 11 Jun 2026 20:42:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D571397347;
	Thu, 11 Jun 2026 20:42:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210547; cv=none; b=gZp2Kp+T7hpaGPPeMj0kE75/BnF+5eX2jV9WkkqCti2Gg36wuuMSnIhMrlFG4EXZ9hJMatcZRDcixJx286ani9CMzjXbpWEQ4GKwcMS5KSsj7ksr3e6QmErVd+Ua136IRBDmY9HMX2tew+bHgxLRvt7tYVcUagbntNoSdi6PKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210547; c=relaxed/simple;
	bh=C/PGZZp1aXglu6OwsS4oJNbXiX2D14Th8CjXVUyhoOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJta7BfawdIpYDfhqMrup11XPpDKhf/GhbbDsZewAyShI2tHjM8K2UcnwHnhfQTWNIVIjaPR8DWtOQGdlYnnUkKrPddu7YPNTNgNKH0nOwg5brJEdRo+DyffEHM5I4KBOZBmbyozurF2WHsD02bD+j1SLkzSM0kXMqMnp7uVwnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=a6xZRSDS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cSo2t65p; arc=none smtp.client-ip=103.168.172.144
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id A8F57EC0100;
	Thu, 11 Jun 2026 16:42:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 11 Jun 2026 16:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210544;
	 x=1781296944; bh=ESovPMlN4FPN+UM7LHFzMYaWcruWKSw2Cte9icmAf1M=; b=
	a6xZRSDSeY/qu3ZLtqA/Z4MEHe4voo97fh/i2r8b+yJTVN+GnmHsSJSInrCxrkBb
	LRZuErVfiUjtmLFgqh2AqtxsVslip0IcY0e4Nc447+y8qPVZa/5iH2eB1RL5tn5j
	nUdnWxmM7AHaYy3udavNabp93NYqJUwJMf+5vDuESmxBIddGBlzp3fvyxtS8UtQc
	OYxR5zsLCI34uEWp9tRgnsJ40Gp5zDfrw35xyCXxVkbnVaZcvARBakkGUsuuIql3
	VDLNVFhhPY5XVOpKrVHtksA5r2IOEnZWL41Fz7qRqb46CSPIKahKRRJVTFTf8u9Y
	89JOixUPjlN5ryosSRZkmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210544; x=
	1781296944; bh=ESovPMlN4FPN+UM7LHFzMYaWcruWKSw2Cte9icmAf1M=; b=c
	So2t65pFrJmqJ8TmJ534BARLaRyH1t4sUDwqm/UTyNPbftC2fNZeZasmbLDRsa+u
	soV/S3n0nl+tJ/uKm3bllkEyo3Kg72G66RkHXtefog4f6pLHEaTJV0x3EPUo0Oaf
	KXHQDAXonOEEG2vMGxAogxu3tXzNmhtwjRBVMDBppp6Ocsc7hcf7tCrrtiVzmCIY
	T2ZnnMRdoRExiXthxkTLMKZRl/fTdKu/8nXsguc1lPeoRAUGMMVCn7cldlfQosia
	nUUYALj2AAfeLFYvd52106acLkiQv+Y9lovieSe7r/StJiNZTr4c7MRXkMP8IJ+h
	O7OhedfSDM3tAzn8rSIOA==
X-ME-Sender: <xms:sB0rar2fc7BkMUMc--aw77o4H-xnLPoQSjcd8tn_e1ahV2913KdqdA>
    <xme:sB0ragFJ_QPffaA9DOKO0nSf6HuKx4ekxlmDXpXe3XNPbv3pT9o8SlJGmCpfsyBE5
    pzt-TGI9qSIEixCZSgKBFcBF7aCPYcovgqpSfXVmepAgxHksTA8Ng>
X-ME-Received: <xmr:sB0ramtkGwEiflUSOcBC0UrxEYoJQE2_7nzKPwswbSTFW2rRGuAS2fbW7tknfM3bgFOrl-fjITK_bVmQmD6Tm1COGJQT>
X-ME-Proxy-Cause: dmFkZTGaouJIR5kC2J81I5sfEwZBn3ZT9RrdlVZBH2NdTyvnCs8J5l1+cS0iIw5iwCKzXs
    ifNT3VxPLcgDaNVSHOGFqwSN8mYhMHzCKHXMtRXmLS3K2fAWtCymAkJp/Wkyu1ibcEKcnm
    gcklheITNT/Pc6vQQRUWa0XBXpNjxU5nM+VLaLsK2AkB+R+spLShYqaQJ9w9JrDLh44uWA
    MgmQuSWr4OqltuDKF0LMp4YaUkQMB6oqXjZppdCtJ6HpkVjUk+zli1MFwg9Ak+kRuhNJ/e
    n2I1wmUz4K4UMMJ4VC9bDXSlbtRV+OfaQBqnQ2+JtMmX7LNrF1kZWZDhIPHG888cdmG4gp
    3fxwNQ3UWS8V2zzmIgF8aqYNqKtQJEMU4JKARpaP/IhjQBUKjS17sur1GWbAXF1QS1c7BZ
    GRKPh3EAHhHCkbOJeZSrN2QT6Ggf/NNwmSoUY8DyHhUqWEFn2xGpEtytXMG0HR/lZZFadR
    aoDhuND2MOmZsLGwFDRN34YOLqenMMKfnIycCMiwq0tJ+ctCOj95s4JdV08pMu0yNWysCH
    LvrKAdaASkDh58HpBdr0NcGaAhEpppi87g+S5nHHqjSd/ALXBUnYp1G62pHqGIXqAHUXJo
    VsV37o/GXC5X0v/6NeI/wfB7GuO2TSO1jBFSt9XYwHeOLoL6qC91b55/bcuQ
X-ME-Proxy: <xmx:sB0rajr09zOjEMASBuPfggUXVMJuYF7SzVLxwBNBuDIy7203VngnIg>
    <xmx:sB0ratXa8eA4hcKUHWjJzUMNpScT2Au219lLLQDLoxquKFzeiemo1g>
    <xmx:sB0rar0QauagXDgvgnyAsPzo5E0zyrUv0U4V0ebbzPWsVQH9ltBw-g>
    <xmx:sB0raisyvbHgsD4drdfoeSpqBdUCMgddEy5dQigfx5EnzX8k5r5MXw>
    <xmx:sB0rau5X_MO8HOP4bjkWPOdA85pZ7HGx4scqmDerZeErWRuw1ElsWdiF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:24 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v10 09/13] media: rppx1: bls: Add support for black level compensation
Date: Thu, 11 Jun 2026 22:41:44 +0200
Message-ID: <20260611204148.1423192-10-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64626-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,vger.kernel.org:from_smtp,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C24D16754F3

Extend the RPPX1 driver to allow setting the black level measurement
and gain configuration. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  97 ++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 105 +++++++++++++++++-
 4 files changed, 207 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index b134d140fe22..5e20fcdcbcc4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -47,6 +47,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_bls_params bls;
 	struct rppx1_awbg_params awbg;
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 975ce3a42fb5..831cf7ca154c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -17,6 +17,8 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
+	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
@@ -58,6 +60,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
+			module = &rpp->pre1.bls;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
index 882a9a819229..01a61db279bf 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -6,6 +6,7 @@
  */
 
 #include "rpp_module.h"
+#include "rppx1.h"
 
 #define BLS_VERSION_REG				0x0000
 
@@ -32,6 +33,8 @@
 #define BLS_B_MEASURED_REG			0x0040
 #define BLS_C_MEASURED_REG			0x0044
 #define BLS_D_MEASURED_REG			0x0048
+#define BLS_PRE1_FIXED_MASK			GENMASK(24, 0)
+#define BLS_PRE2_FIXED_MASK			GENMASK(12, 0)
 
 static int rppx1_bls_probe(struct rpp_module *mod)
 {
@@ -55,6 +58,100 @@ static int rppx1_bls_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static void
+rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
+{
+	static const unsigned int swap[4][4] = {
+		[RPP_RGGB] = { 0, 1, 2, 3 },
+		[RPP_GRBG] = { 1, 0, 3, 2 },
+		[RPP_GBRG] = { 2, 3, 0, 1 },
+		[RPP_BGGR] = { 3, 2, 1, 0 },
+	};
+
+	/* Swap to pattern used in our path, PRE1 or PRE2. */
+	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
+		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
+	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
+
+	for (unsigned int i = 0; i < 4; ++i)
+		output[i] = input[swap[pattern][i]];
+}
+
+static int
+rppx1_bls_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_bls_params *cfg = &block->bls;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + BLS_CTRL_REG, 0);
+		return 0;
+	}
+
+	u32 ctrl = BLS_CTRL_BLS_EN;
+
+	if (cfg->mode == RPPX1_BLS_MODE_FIXED) {
+		static const u32 regs[] = {
+			BLS_A_FIXED_REG,
+			BLS_B_FIXED_REG,
+			BLS_C_FIXED_REG,
+			BLS_D_FIXED_REG,
+		};
+		u32 swapped[4];
+
+		rppx1_bls_swap_regs(mod, regs, swapped);
+
+		/*
+		 * The PRE1 pipe fixed values are 24-bits + 1 sign bit, while
+		 * the PRE2 pipe values are 12-bits + 1 sign bit.
+		 */
+		u32 mask;
+
+		switch (cfg->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
+			mask = BLS_PRE1_FIXED_MASK;
+			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2:
+			mask = BLS_PRE2_FIXED_MASK;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		write(priv, mod->base + swapped[0], cfg->fixed.a & mask);
+		write(priv, mod->base + swapped[1], cfg->fixed.b & mask);
+		write(priv, mod->base + swapped[2], cfg->fixed.c & mask);
+		write(priv, mod->base + swapped[3], cfg->fixed.d & mask);
+	} else {
+		write(priv, mod->base + BLS_SAMPLES_REG, cfg->samples);
+
+		if (cfg->en_windows & RPPX1_BLS_WIN_EN_WIN1) {
+			write(priv, mod->base + BLS_H1_START_REG, cfg->window1.h_offs);
+			write(priv, mod->base + BLS_H1_STOP_REG, cfg->window1.h_size);
+			write(priv, mod->base + BLS_V1_START_REG, cfg->window1.v_offs);
+			write(priv, mod->base + BLS_V1_STOP_REG, cfg->window1.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN1;
+		}
+
+		if (cfg->en_windows & RPPX1_BLS_WIN_EN_WIN2) {
+			write(priv, mod->base + BLS_H2_START_REG, cfg->window2.h_offs);
+			write(priv, mod->base + BLS_H2_STOP_REG, cfg->window2.h_size);
+			write(priv, mod->base + BLS_V2_START_REG, cfg->window2.v_offs);
+			write(priv, mod->base + BLS_V2_STOP_REG, cfg->window2.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN2;
+		}
+
+		ctrl |= BLS_CTRL_BLS_MODE_MEASURED;
+	}
+
+	write(priv, mod->base + BLS_CTRL_REG, ctrl);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_bls_ops = {
 	.probe = rppx1_bls_probe,
+	.fill_params = rppx1_bls_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 2cb8ada233fc..7214a7b42c47 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -85,6 +85,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1: PRE1 pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2: PRE2 pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
+ * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -96,6 +98,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
 };
 
 /**
@@ -320,6 +324,103 @@ struct rppx1_hist_params {
 	__u8 sample_shift;
 };
 
+/**
+ * struct rppx1_bls_fixed - BLS fixed subtraction values
+ *
+ * Fixed black level values subtracted from sensor data per Bayer channel.
+ * Negative values result in addition.
+ *
+ * The PRE1 pipe BLS module operates on a 24-bits input data and fixed black
+ * levels are stored as a signed 2's complement representation ranging from
+ * -2^24 to 2^24-1.
+ *
+ * The PRE2 pipe BLS module operates on a 12-bits input data and fixed black
+ * levels are stored as a signed 2's complement representation ranging from
+ * -2^12 to 2^12-1.
+ *
+ * Userspace is expected to provide fixed black level values with a bit-depth
+ * matching the one of pipe in use.
+ *
+ * These subtraction values are matched with the sensor native Bayer components
+ * ordering according to the cropping configuration on the input port.
+ *
+ * @a: subtraction value for channel A
+ * @b: subtraction value for channel B
+ * @c: subtraction value for channel C
+ * @d: subtraction value for channel D
+ */
+struct rppx1_bls_fixed {
+	__u32 a;
+	__u32 b;
+	__u32 c;
+	__u32 d;
+};
+
+/**
+ * enum rppx1_bls_mode - BLS subtraction mode
+ *
+ * Select if subtracted black level come from fixed or measured values.
+ *
+ * @RPPX1_BLS_MODE_FIXED: subtract fixed values
+ * @RPPX1_BLS_MODE_MEAS: subtract measured values
+ */
+enum rppx1_bls_mode {
+	RPPX1_BLS_MODE_FIXED,
+	RPPX1_BLS_MODE_MEAS,
+};
+
+/**
+ * enum rppx1_bls_win_en: BLS measurement configuration
+ *
+ * Select the measurement window to use for measured black level values.
+ *
+ * @RPPX1_BLS_WIN_EN_OFF: disable measurement
+ * @RPPX1_BLS_WIN_EN_WIN1: Enable measurement from window 1
+ * @RPPX1_BLS_WIN_EN_WIN2: enable measurement from window 2
+ * @RPPX1_BLS_WIN_EN_WIN12: enable measurement from window 1 and window 2
+ */
+enum rppx1_bls_win_en {
+	RPPX1_BLS_WIN_EN_OFF,
+	RPPX1_BLS_WIN_EN_WIN1,
+	RPPX1_BLS_WIN_EN_WIN2,
+	RPPX1_BLS_WIN_EN_WIN12,
+};
+
+/**
+ * struct rppx1_bls_params - RPP-X1 Black Level Subtraction Module
+ *
+ * The RPP-X1 Black Level Subtraction module is available on the PRE1 and PRE2
+ * pre-fusion pipes. Userspace selects which pipe to operate by setting the
+ * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1 or
+ * RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2.
+ *
+ * The BLS module operates on fixed or measured data according to the setting of
+ * the @mode field. When RPPX1_BLS_MODE_FIXED is used userspace shall provide
+ * the per-channel black levels in @fixed. When RPPX1_BLS_MODE_MEAS is used
+ * userspace shall configure the measurement windows @window1 and optionally
+ * @window2 to select the optically black pixels region in the input frame. The
+ * @samples fields controls how many measure samples are used for averaging the
+ * measured black levels.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1 or
+ *	    type == RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2)
+ * @mode: BLS subtraction mode (see enum rppx1_bls_mode)
+ * @en_windows: BLS measurement mode (see rppx1_bls_win_en)
+ * @samples: log2 of the number of measured pixels per Bayer position
+ * @window1: BLS measurement window 1 (14 bits)
+ * @window2: BLS measurement window 2 (14 bits)
+ * @fixed: fixed subtraction values (see enum rppx1_bls_fixed)
+ */
+struct rppx1_bls_params {
+	struct v4l2_isp_params_block_header header;
+	__u8 mode;
+	__u8 en_windows;
+	__u8 samples;
+	struct rppx1_window window1;
+	struct rppx1_window window2;
+	struct rppx1_bls_fixed fixed;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -335,7 +436,9 @@ struct rppx1_hist_params {
 	sizeof(struct rppx1_exm_params)				+	\
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_hist_params)			+	\
-	sizeof(struct rppx1_hist_params))
+	sizeof(struct rppx1_hist_params)			+	\
+	sizeof(struct rppx1_bls_params)				+	\
+	sizeof(struct rppx1_bls_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


