Return-Path: <linux-media+bounces-55810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI3KLPDdtWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:15:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41F28F408
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1321308ED50
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273D0388E6F;
	Sat, 14 Mar 2026 22:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Rf+N2n8o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YpiDih24"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0433D388E66;
	Sat, 14 Mar 2026 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526268; cv=none; b=Ok1LYzt7FnplLrox182OVANCx0wrhSgvy/ajRUvp0+jsWvz4ZBsBtFW2ZbmTf0rP7hK3AJT++GCLq7lyRb+c7YE+hxLXIIDTwj3YreKFwDDw+ybz+Wu3bbHXpLjP7HHnD8iTV0g8Fr6lZg3z0WCiCbXajJp21HsWmqeK81DYS7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526268; c=relaxed/simple;
	bh=bXaomthrrsc6/xK1mFb7y8IgrWLSDgKi9DVIcE3yizc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MF4w7/H3KvCCyt2S7szEMXaEeT16TGRuApJxSRZpQ/ZHkmGyiACaSBC9F3zlYGGFgvFK44C3onPoZbVWOsHI6vcHpwS2onNL4kvOGndscT2O/jDj515xgrA1HUkXzlbCBUwzQVtyU9MoSnnUec8gFuiIvGOU0HYlTGGMNcgSjhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Rf+N2n8o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YpiDih24; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 40A2DEC0B7A;
	Sat, 14 Mar 2026 18:11:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sat, 14 Mar 2026 18:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526264;
	 x=1773612664; bh=F7JSW+j/LkWt4whOeEkJ/DH35z9TIw1fR68SJHykOys=; b=
	Rf+N2n8ocy/ghAeAyhc4uDaolVZCzOQ6zY7dXsy6exwfKEE42orqa3i6kNmDZ+b1
	ql49jzq5wCewGK3MGt4r35D//qEQY/hjWvfIln2OnLoO3CGKVGWTwJgmmqNxaa39
	H/otU21vUKRuzip7kKtnQ/VJJukyqI7fItuY0T75EKVpiBeMGOgd/4bNE9fS3XhN
	9+fBT+2+IKL326ovM7AkgXp+wfda4WFIHfJlcDwtjOLmfOP8OnbrqPJeKRi/oXWa
	YRdnU1gr9E+E8XZZP2+lLxP24lvQkQCnQYG/H1ciZAeA2StmZrjQDozsxJuvIBoY
	NnKM94oasKaIIFmqpUpxRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526264; x=
	1773612664; bh=F7JSW+j/LkWt4whOeEkJ/DH35z9TIw1fR68SJHykOys=; b=Y
	piDih24baujmqKP4zMs8k8PG/8jogF3UYxml7Ls1FTNRBan9SrLvCmPyyaRxIyhz
	/A8QA1S15DWp/rrD27gwamJxem6m1YDIlVKBbDd7Hrttoaw4ZkMXFADNaRC2lBFQ
	Vt/zrA8v+SRwnukoMmT89aqUqJsKq/mmEOUk2EbQ8A0+MYVhpb4HLMf10K22nxHR
	iDGCvnShIkda7r9xQxVhjnWGC4u8PeUSCqnBwX7dGf7ztJQz1lbsS6cgjUxp3ZH5
	kuYgaiEfr2tta6jkvnrnCI4qSh2gC3KhKSW7h3P4yDb4FxrT5n1iXULpjqyw3xhT
	b6u3FfqAt2+oY+jSynzbQ==
X-ME-Sender: <xms:-Ny1aT4SweXrjVEyM8LQlPYIeiCTHuCMu0Euzhm9Xf9EVswNMh4gqg>
    <xme:-Ny1aZUuYvD6kThONA5K53yqQMSJxqj5evGeFLl661zpF3IgGhFLyl2uLNsxtOlS1
    H6k_2747aKoKRcueKMelr76_YAHZq9o6FBzgVgOGBrhXU6GiN8azlo>
X-ME-Received: <xmr:-Ny1abKvCoDf5Pxkl-i9DnhBiky0FJ8vUmIRYVoRk-kdnDC5BZx0e3J-qCB3FuvoGajP6Y5qdfwIiD0FtkeMWR1zuzKLM-9ttR1p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeekheetffdukedt
    keeijeevieehlefgfeekvdejueelheekfedutedvudetfeefieenucffohhmrghinhepfh
    higigvuggpvhgrlhdrghhrpdhfihigvggupghvrghlrdhgsgenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluh
    hnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtgho
    mhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhrtghpthhtohepmh
    grrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrgh
X-ME-Proxy: <xmx:-Ny1abuhSurMqkUILZohjgS-XIIWLEe86GvfNz1N-tpT2lLabH4y8Q>
    <xmx:-Ny1aYIXH4X2KxozEdqgq2eiC4CUDG_UKo2i7YLUZs1IPkxY33WFsw>
    <xmx:-Ny1abPPqDURLu7d6rIRKlMsD7La3qLRZccxPlu5djymIM2LFzMovA>
    <xmx:-Ny1aTUZnZIpN_WyJpTxeiGQswxLqRLbc4_wPgLSLCI2UVS-fXTPOw>
    <xmx:-Ny1aaukaX7ngD5ayF36foHEsLU5b1nvIh1yhmUpAE4hV5EmIuT_qgO_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:11:03 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v6 07/12] media: rppx1: Add support for Black Level Subtraction
Date: Sat, 14 Mar 2026 22:59:39 +0100
Message-ID: <20260314215944.3674865-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55810-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,messagingengine.com:dkim,mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F41F28F408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the Black Level Subtraction
(BLS) configuration using the RkISP1 parameter buffer format. It uses
the RPPX1 framework for parameters and  its writer abstraction to allow
the user to control how (and when) configuration is applied to the
RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   4 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   5 +-
 .../platform/dreamchip/rppx1/rppx1_bls.c      | 116 ++++++++++++++++++
 3 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index d8dd783110c6..c1917585e19b 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -16,6 +16,7 @@
 
 static const struct v4l2_isp_params_block_type_info
 rkisp1_ext_params_blocks_info[] = {
+	RKISP1_PARAMS_BLOCK_INFO(BLS, bls),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RKISP1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
@@ -54,6 +55,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS:
+			module = &rpp->pre1.bls;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index 059bd76ecf64..1bffa6dd35f8 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -20,8 +20,11 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 		if (!rpp_module_call(&rpp->post.hist, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
 
-	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
+	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
 		if (!rpp_module_call(&rpp->pre1.exm, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
+
+		rpp_module_call(&rpp->pre1.bls, stats_rkisp1, &stats->params);
+	}
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
index de7008befd8e..164bc4a63c23 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -5,6 +5,7 @@
  */
 
 #include "rpp_module.h"
+#include "rppx1.h"
 
 #define BLS_VERSION_REG				0x0000
 
@@ -54,6 +55,121 @@ static int rppx1_bls_probe(struct rpp_module *mod)
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
+rppx1_bls_param_rkisp1(struct rpp_module *mod,
+		       const union rppx1_params_rkisp1_config *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_bls_config *cfg = &block->bls;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + BLS_CTRL_REG, 0);
+		return 0;
+	}
+
+	u32 ctrl = BLS_CTRL_BLS_EN;
+
+	if (!cfg->config.enable_auto) {
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
+		 * The RkISP params are 12-bit + 1 signed bit, while the RPP can
+		 * be 12, 20 or 24 bit + 1 signed bit. Figure out how much we
+		 * need to adjust the input parameters.
+		 */
+		const unsigned int shift = mod->info.bls.colorbits - 12;
+
+		write(priv, mod->base + swapped[0], cfg->config.fixed_val.r << shift);
+		write(priv, mod->base + swapped[1], cfg->config.fixed_val.gr << shift);
+		write(priv, mod->base + swapped[2], cfg->config.fixed_val.gb << shift);
+		write(priv, mod->base + swapped[3], cfg->config.fixed_val.b << shift);
+	} else {
+		write(priv, mod->base + BLS_SAMPLES_REG, cfg->config.bls_samples);
+
+		if (cfg->config.en_windows & BIT(0)) {
+			write(priv, mod->base + BLS_H1_START_REG, cfg->config.bls_window1.h_offs);
+			write(priv, mod->base + BLS_H1_STOP_REG, cfg->config.bls_window1.h_size);
+			write(priv, mod->base + BLS_V1_START_REG, cfg->config.bls_window1.v_offs);
+			write(priv, mod->base + BLS_V1_STOP_REG, cfg->config.bls_window1.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN1;
+		}
+
+		if (cfg->config.en_windows & BIT(1)) {
+			write(priv, mod->base + BLS_H2_START_REG, cfg->config.bls_window2.h_offs);
+			write(priv, mod->base + BLS_H2_STOP_REG, cfg->config.bls_window2.h_size);
+			write(priv, mod->base + BLS_V2_START_REG, cfg->config.bls_window2.v_offs);
+			write(priv, mod->base + BLS_V2_STOP_REG, cfg->config.bls_window2.v_size);
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
+static int rppx1_bls_stats_rkisp1(struct rpp_module *mod,
+				  struct rkisp1_cif_isp_stat *stats)
+{
+	struct rkisp1_cif_isp_bls_meas_val *bls = &stats->ae.bls_val;
+
+	static const u32 regs[] = {
+		BLS_A_MEASURED_REG,
+		BLS_B_MEASURED_REG,
+		BLS_C_MEASURED_REG,
+		BLS_D_MEASURED_REG,
+	};
+	u32 swapped[4];
+
+	rppx1_bls_swap_regs(mod, regs, swapped);
+
+	/*
+	 * The RkISP BLS stats are 12-bit while the RPP can be 8, 20
+	 * or 24 bit. Figure out how much we need to adjust the output
+	 * statistics.
+	 */
+	const unsigned int shift = mod->info.bls.colorbits - 12;
+
+	bls->meas_r = rpp_module_read(mod, swapped[0]) >> shift;
+	bls->meas_gr = rpp_module_read(mod, swapped[1]) >> shift;
+	bls->meas_gb = rpp_module_read(mod, swapped[2]) >> shift;
+	bls->meas_b = rpp_module_read(mod, swapped[3]) >> shift;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_bls_ops = {
 	.probe = rppx1_bls_probe,
+	.param_rkisp1 = rppx1_bls_param_rkisp1,
+	.stats_rkisp1 = rppx1_bls_stats_rkisp1
 };
-- 
2.53.0


