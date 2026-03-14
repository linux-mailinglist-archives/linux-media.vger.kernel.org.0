Return-Path: <linux-media+bounces-55812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANOENB7dtWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:11:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A428F35E
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5C4F3020A4A
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2842F38A737;
	Sat, 14 Mar 2026 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uvpH1nP1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UKqlJcfo"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F38B388379;
	Sat, 14 Mar 2026 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526274; cv=none; b=AK1uJ+1z6znzBCCyT8cAb9OqKK/mD5Ig2av6faZxZg7UuLGhiBf3EYh8AOe7KeNo1jeXqr48Xf3eLziy6PAWN5/Ll1Y8G04Ta0Ia7CS5h/V5fOl3+Y53x4Wk5HPI8BJKa+LJlAu3qozsO+sQjgkvS3uycuJXtzvmZBAS4EnBkHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526274; c=relaxed/simple;
	bh=lndl02N0V0FZVqunf2THet0NJ1b6DJEPHdLVDMBoeYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGeECPPbfhnA7bo/jSNA4Ki6ZyxwOAkkdYdny7dpIANyMwnexkEYf3k8hrJCGJQkXq0ECJS2rxtJCXS3G72FNNUBMqOjNi0k7CdDVERtZ4utRL5jJXkKelniuhQwXzUzmdB3gTg8KNXYrmz+4kAnTlt0Vcsipbe7NkwQv+BJJdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uvpH1nP1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UKqlJcfo; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id CB1B0EC0B7B;
	Sat, 14 Mar 2026 18:11:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 14 Mar 2026 18:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526271;
	 x=1773612671; bh=lOS7LHOMo9m9nmRwRsFYgmLXLp+Bwsbwnomhyk6Wnok=; b=
	uvpH1nP1bx3MfzxsS+aoA9uK7T/bwnJox5rWiKnXPQG+xyHTG9p8DY4q+HcwIQcw
	doxLio2orT5dyZHj3cgR7JSxzqPT+IVBw3v8JcKEFvGQ1akdnYEDa7KwyKnzggtp
	2yGzhdnJh96j6kzbJMSaaVr5Heo4HgfJ/1Qg/nsvmgoS6G0uClIYg8uw85+mm4yy
	o38To2zOw3frlBKXQoHenhAVDIyzZQQcyV/nLi00k5SbzOBJN1PQw3/2KoSTuwC4
	iA0f/IOKdmGxg1ZaSfa74OQPss1RJtc0rQ7xHFqmrA6l7ikHJxIcVxaC7eA5hlpH
	xuLe4g5wJ4LaGcFVXtSoIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526271; x=
	1773612671; bh=lOS7LHOMo9m9nmRwRsFYgmLXLp+Bwsbwnomhyk6Wnok=; b=U
	KqlJcfo9karN3NIx8e3q3YvbogpboK8uIbZSv/fLI64f7A7VzbJ0mwCDDtOZqXM8
	MbRisugeGFGIMf6m9af3PWC11NlG7R0+ZhQb/fslcg0exphi4BhI59NrIXF16svS
	95REfRIDD7P1QtBbVn/Q6aIkqs6m7O2MHDjEqLTD7iaBsRL4pDC+OjMUf06ECZr4
	A08wV0BsP82SOLQGYJc3Xdigk2WDSSFnV0X3csGsivRiQ1vfEDPF5IL6YdcvkNWK
	MKB5nxSZY1xDDdeqPRDXy+aqBOhkv+x+uiPd6f2skcAkUJB0ySf17nC3SE4BSHna
	ngY9Zq7kZA+NUab+9PvXg==
X-ME-Sender: <xms:_9y1acliKODD8gQh2NmU5eWjRDr9VCypUwSjcm16IVlkX6SuV5dgrQ>
    <xme:_9y1aYaMCpEwtwCclYu6xNgTfxFAaBNxRLe5_rt9eyOaKBXZV9wygLoIkCd9_SP-c
    UmEvBqy9FckUQuG4SesgEsgut6YRg0ds7xHp4Ll68ekKKsSbqdgCqw>
X-ME-Received: <xmr:_9y1afFx7G4nC94D2WgcJ5jR-xaEwWnek82_knw9qO2CqhqEQgT2uUEDQFniQSYZfOTOyUeq_su0IA12zAithwQVoYZfHPGakIM6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtg
    homhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhrtghpthhtohep
    mhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrgh
X-ME-Proxy: <xmx:_9y1afYKrOFhE6GSrLbGrMXkXLHkUUiGbKjGaGjwR4MIcyn0FFgbxw>
    <xmx:_9y1abyG_3L1pY4c_8mtYynN4xePyqlNXktFiNgWXg9pTWv2hYHzKw>
    <xmx:_9y1aZS9K6AvOz8iHC-ggFhgCo_tz1aSneK4ZaDuYoy4Ww3cM6TyCA>
    <xmx:_9y1aQIZIy94kpvE0nARO2DPzarzrGFvZPZisiQ2pbWdMHdundl6BA>
    <xmx:_9y1aTWfv4P_cBoWJvy1AMQovSVvgz2oBJE4sbSpfgR03yunXgTyhWYz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:11:11 -0400 (EDT)
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
Subject: [PATCH v6 11/12] media: rppx1: Add support for Bayer Demosaicing
Date: Sat, 14 Mar 2026 22:59:43 +0100
Message-ID: <20260314215944.3674865-12-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55812-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,mailbox.org:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 7A5A428F35E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the Bayer Demosaicing
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters are all 6- or 10-bit while RPP are either 8- or
16-bit, the driver corrects for this allowing the RkISP1 parameters to
be used.

One particularity is that the RkISP1 driver lumps all settings in the
FILT_LUM_WEIGHT register in a single value in the configuration buffer.
As the format is slightly different for RPP we need to break it out and
fix it before applying it to the RPP.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   7 ++
 .../media/platform/dreamchip/rppx1/rppx1_db.c | 112 ++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a2f6c85893e3..77869ec7cf6a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,8 @@ static const struct v4l2_isp_params_block_type_info
 rkisp1_ext_params_blocks_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(BLS, bls),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
+	RKISP1_PARAMS_BLOCK_INFO(FLT, flt),
+	RKISP1_PARAMS_BLOCK_INFO(BDM, bdm),
 	RKISP1_PARAMS_BLOCK_INFO(CTK, ctk),
 	RKISP1_PARAMS_BLOCK_INFO(GOC, goc),
 	RKISP1_PARAMS_BLOCK_INFO(LSC, lsc),
@@ -64,6 +66,11 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT:
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM:
+			/* Both types handled by the same block. */
+			module = &rpp->post.db;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
index 5e233896cfc8..4a2a3719d7ed 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
@@ -39,6 +39,118 @@ static int rppx1_db_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_db_param_rkisp1_flt(struct rpp_module *mod,
+			  const union rppx1_params_rkisp1_config *block,
+			  rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_flt_config *cfg = &block->flt;
+	u32 gain, kink, min;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + FILT_MODE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RkISP1 values are 10-bit, RPP are 18-bit. Conversion verified with
+	 * table in datasheet and libcamera pipeline for rkisp1.
+	 */
+	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->config.thresh_bl0 << 8);
+	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->config.thresh_bl1 << 8);
+	write(priv, mod->base + FILT_THRESH_SH0_REG, cfg->config.thresh_sh0 << 8);
+	write(priv, mod->base + FILT_THRESH_SH1_REG, cfg->config.thresh_sh1 << 8);
+
+	/*
+	 * RkISP1 values are 6-bit, RPP are 8-bit. Conversion verified with
+	 * table in datasheet and libcamera pipeline for rkisp1.
+	 */
+	write(priv, mod->base + FILT_FAC_BL0_REG, cfg->config.fac_bl0 << 2);
+	write(priv, mod->base + FILT_FAC_BL1_REG, cfg->config.fac_bl1 << 2);
+	write(priv, mod->base + FILT_FAC_MID_REG, cfg->config.fac_mid << 2);
+	write(priv, mod->base + FILT_FAC_SH0_REG, cfg->config.fac_sh0 << 2);
+	write(priv, mod->base + FILT_FAC_SH1_REG, cfg->config.fac_sh1 << 2);
+
+	/*
+	 * For unknown reasons the 3 fields of the FILT_LUM_WEIGHT register
+	 * have been lumped together in a single field in the configuration
+	 * data and written as is to the hardware. For RkISP1 the register
+	 * layout is,
+	 *
+	 * 31:19	unused
+	 * 18:16	lum_weight_gain
+	 * 15:8		lum_weight_kink
+	 *  7:0		lum_weight_min
+	 *
+	 * For RPP the register layout is similar but kink and gain have higher
+	 * precision.
+	 *
+	 * 31		unused
+	 * 30:28	lum_weight_gain
+	 * 27:24	unused
+	 * 23:12	lum_weight_kink
+	 * 11:0		lum_weight_min
+	 *
+	 * Break apart the RkISP1 format, scale kink and min, and map to RPP.
+	 */
+	gain = (cfg->config.lum_weight & GENMASK(18, 16)) >> 16;
+	kink = (cfg->config.lum_weight & GENMASK(15, 8)) >> 8;
+	min = cfg->config.lum_weight & GENMASK(7, 0);
+
+	write(priv, mod->base + FILT_LUM_WEIGHT_REG,
+	      (gain << 28) | ((kink << 4) << 12) | (min << 4));
+
+	write(priv, mod->base + FILT_MODE_REG,
+	      (cfg->config.chr_v_mode << 4) |
+	      (cfg->config.chr_h_mode << 6) |
+	      (cfg->config.grn_stage1 << 8) |
+	      (cfg->config.mode ? FILT_MODE_FILT_MODE : 0) |
+	      FILT_MODE_FILT_ENABLE);
+
+	return 0;
+}
+
+static int
+rppx1_db_param_rkisp1_bdm(struct rpp_module *mod,
+			  const union rppx1_params_rkisp1_config *block,
+			  rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_bdm_config *cfg = &block->bdm;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DEMOSAIC_REG, 0x400);
+		return 0;
+	}
+
+	/*
+	 * Threshold for Bayer demosaicing texture detection.
+	 *
+	 * RkISP1 threshold are 8-bit, RPP threshold are 16-bit. Map the RkISP1
+	 * value range by left shifting by 8.
+	 */
+	write(priv, mod->base + DEMOSAIC_REG, cfg->config.demosaic_th << 8);
+
+	return 0;
+}
+
+static int
+rppx1_db_param_rkisp1(struct rpp_module *mod,
+		      const union rppx1_params_rkisp1_config *block,
+		      rppx1_reg_write write, void *priv)
+{
+	switch (block->header.type) {
+	case RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT:
+		return rppx1_db_param_rkisp1_flt(mod, block, write, priv);
+	case RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM:
+		return rppx1_db_param_rkisp1_bdm(mod, block, write, priv);
+	}
+
+	return -EINVAL;
+}
+
 const struct rpp_module_ops rppx1_db_ops = {
 	.probe = rppx1_db_probe,
+	.param_rkisp1 = rppx1_db_param_rkisp1,
 };
-- 
2.53.0


