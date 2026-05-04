Return-Path: <linux-media+bounces-60228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCPbHjbz92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:15:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D70014B7EE5
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5F873058085
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B190321257E;
	Mon,  4 May 2026 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SKnBN4cC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qo0EcE+H"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FAC1C84CB;
	Mon,  4 May 2026 01:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856970; cv=none; b=qe9gprXa9Ut4aw7IargRGskZl7aCwAKTk8/nOLPVJe3T2Al8xcCNv5A0yNGuiIpKPcDsdq094KzGUyqvH/MiCtO99e6pCmxZXmOU4+IxzUBfc3gqn2VEbBQbvcVBpNRoXaRSWez25dXRMjR20ShUd3l+eZkHSkECJJEvuMc3Smw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856970; c=relaxed/simple;
	bh=8LpN/LTVegctm2dg0EX+wOqjuxMbVFyYF71Yo4jrcf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PF+rIb45BH4JQm7ah1WXpSj4xv7sNbkFOjGWi98gc8Sdmo7KfzidA9ej83Q9Y4yywmX8/RcM+E618kZ9A50uKdd6ifkQ38xHlpAEwABPsbluPj7SJvgYADO9ZZSQrDT7BKmoQFNqwFFcGFd1Gzd7FGYXNKZbuBu5p24lRaq9zo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SKnBN4cC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qo0EcE+H; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 31F641D000A1;
	Sun,  3 May 2026 21:09:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 03 May 2026 21:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777856964;
	 x=1777943364; bh=ml9IWa3W1zLifz8HPYdHvhsOylHzyNCbsPf8Tk3UM4Q=; b=
	SKnBN4cC0jYA5Sa+ZpyH4ZejXKIWC66X743kKGj7h/Rpc6Lyu1QSf5Kl1mmqMuj2
	studpVXHevBa5Wg5zcif8Oyanc58epn9BwxfCywB9MaZlJV+m7FTXlS3P7ZiqV91
	+5vg5xDuqo8BXnePt2ZFtNvQcuVeyjDZbUAXxhAO3lQ0ykky1h3vdfHfiAmQ6ALb
	4iWED4wqIcroU0MpF7exA4SQ8qUllkFzj7Sg0SMC6KitHb5QUD1bdHWJ4VpNvsAR
	CCagOA9muCVT+5Rj5h40Yzc8Cl00WCeT4sprLlFpRnGzKsRkmWqhM0g8tXjJ0VNI
	ctkw8FU+1qHJMND9UG4FWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777856964; x=
	1777943364; bh=ml9IWa3W1zLifz8HPYdHvhsOylHzyNCbsPf8Tk3UM4Q=; b=q
	o0EcE+HjY0Iu3BKpovyLDDva28NTYvj7co3kJzTG+xNR/S7V9ZcmvrNYM16ofsxN
	FonhxPDv+jsbiJOlEIL7CR6riSsp0iG92Jt6wuyCZZGx2qqj+lRvXPSkoJJg327n
	ozZMqZ3PymO46KAQ7jvGwr0lEpuXCRp87zwTGQc+5qKJIXY8QMFYmYnKVUjg1TMC
	rzIHuoZhFM4mBzaHzBGTS53mM+M3WixBkiRvpOoBcOvnxxjlym96PjoKepp0w3wz
	v4HReZYysDRmkkbODJ656opjBF9g6mdK1g4IPRLLk5W3/d4Yf1U/MnbGSeOOVYYE
	g0c5czZGseelnktBA+NTQ==
X-ME-Sender: <xms:w_H3aZzK4CCRmRYdkjn-na6gBJLltIczEr3_geIAl6hCPnWXO5V6kQ>
    <xme:w_H3aa1olc5Q5YVNwyda_0k2t50jngezhdYLbVPpn1RtzBPERbHh3_FMNXwWYShHR
    LmS4Ce3NMYwBMZ7ipeDVMvz8a5deYcYsKlBXptkLaIie0ocbAD_Kg4>
X-ME-Received: <xmr:w_H3aZrm8C6zbhyCznqkWqKEO5RZC4ScyCO7cjdLqSHLt4wiKDahRR0wIOlM_P0qQiL5kiC9H2TWZoJgjrS4maIs1JHOXp5jicHT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrodhrvghnvghsrghssehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrsh
    honhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhk
    lhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:w_H3aXXEXgFiJcZpkNSQ_7fChHv6rv2wjQlZdLO6yzA3nnOTyz42Ow>
    <xmx:w_H3aSrFK3wt4OeqSuN_7vA5xaaKB-j7yF3jVdXa-YPE1xPNIKy0JA>
    <xmx:w_H3aeCGnLzkrJ42WvCe37n3joBF1RluVqyNnHv7Dk1_uoKs3L1-gA>
    <xmx:w_H3aegkVV8IsjgkZL7aMX2DtWikpnA7rm44V0yG5eUYpgAAiUjdhA>
    <xmx:xPH3aQOmYVpT4telMUnv-sTZjlw3m1AAYDPOgRtNKBUGVqDE-tC-pbo->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:09:22 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [v8 13/14] media: rppx1: bd: Add support for bilateral denoising
Date: Mon,  4 May 2026 03:05:55 +0200
Message-ID: <20260504010556.2796398-14-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D70014B7EE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60228-lists,linux-media=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim]

Extend the RPPX1 driver to allow setting the bilateral denoising
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../media/platform/dreamchip/rppx1/rppx1_bd.c | 119 +++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 141 +++++++++++++++++-
 4 files changed, 265 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 064da13082fe..136ec4d48054 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -88,6 +88,7 @@ union rppx1_params_block {
 	struct rppx1_bls_params bls;
 	struct rppx1_lsc_params lsc;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_bd_params bd;
 	struct rppx1_db_demosaic_params db_demosaic;
 	struct rppx1_db_filter_params db_filter;
 	struct rppx1_ccor_params ccor;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 3320ca3998bd..edea25293d64 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -22,6 +22,8 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(BD_PRE1, bd),
+	RPPX1_PARAMS_BLOCK_INFO(BD_PRE2, bd),
 	RPPX1_PARAMS_BLOCK_INFO(DB_DEMOSAIC_POST, db_demosaic),
 	RPPX1_PARAMS_BLOCK_INFO(DB_FILTER_POST, db_filter),
 	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
@@ -76,6 +78,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1:
+			module = &rpp->pre1.bd;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST:
 		case RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST:
 			/* Both types handled by the same block. */
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
index acbfbcd59591..08f9eca80b4d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
@@ -47,6 +47,125 @@ static int rppx1_bd_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_bd_fill_params(struct rpp_module *mod,
+		     const union rppx1_params_block *block,
+		     rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_bd_params *cfg = &block->bd;
+	unsigned int isp_dpf_mode, spatial_coeff;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DPF_MODE_REG, 0);
+		return 0;
+	}
+
+	/* Module version 5 adds shadowing for mode and spatial weights. */
+	write(priv, mod->base + DPF_STRENGTH_R_REG, cfg->strength.r);
+	write(priv, mod->base + DPF_STRENGTH_G_REG, cfg->strength.g);
+	write(priv, mod->base + DPF_STRENGTH_B_REG, cfg->strength.b);
+
+	/*
+	 * RPP DB module version 4 and later removed the AWB_GAIN_COMP bit.
+	 * Always use programmed nf-gains for gain compensation. Emulate the
+	 * old behavior by programming default gains when gain compensation
+	 * is not requested.
+	 */
+	bool awb_gain_comp = false;
+
+	switch (cfg->gain.mode) {
+	case RPPX1_BD_GAIN_USAGE_NF_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_USE_NF_GAIN;
+		break;
+	case RPPX1_BD_GAIN_USAGE_LSC_GAINS:
+		isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RPPX1_BD_GAIN_USAGE_NF_LSC_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_USE_NF_GAIN | DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RPPX1_BD_GAIN_USAGE_AWB_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = 0;
+		break;
+	case RPPX1_BD_GAIN_USAGE_AWB_LSC_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RPPX1_BD_GAIN_USAGE_DISABLED:
+	default:
+		isp_dpf_mode = 0;
+		break;
+	}
+
+	/* NOTE: Hardware bit for scale_mode is inverted compared to RkISP1. */
+	if (cfg->nll.scale_mode == RPPX1_BD_SCALE_LINEAR)
+		isp_dpf_mode |= DPF_MODE_NLL_SEGMENTATION;
+	if (cfg->rb_flt.fltsize == RPPX1_BD_FILTERSIZE_9x9)
+		isp_dpf_mode |= DPF_MODE_RB_FILTER_SIZE;
+	if (!cfg->rb_flt.r_enable)
+		isp_dpf_mode |= DPF_MODE_R_FILTER_OFF;
+	if (!cfg->rb_flt.b_enable)
+		isp_dpf_mode |= DPF_MODE_B_FILTER_OFF;
+	if (!cfg->g_flt.gb_enable)
+		isp_dpf_mode |= DPF_MODE_GB_FILTER_OFF;
+	if (!cfg->g_flt.gr_enable)
+		isp_dpf_mode |= DPF_MODE_GR_FILTER_OFF;
+
+	isp_dpf_mode |= DPF_MODE_DPF_ENABLE;
+
+	if (awb_gain_comp) {
+		write(priv, mod->base + DPF_NF_GAIN_B_REG, cfg->gain.nf_b_gain);
+		write(priv, mod->base + DPF_NF_GAIN_R_REG, cfg->gain.nf_r_gain);
+		write(priv, mod->base + DPF_NF_GAIN_GB_REG, cfg->gain.nf_gb_gain);
+		write(priv, mod->base + DPF_NF_GAIN_GR_REG, cfg->gain.nf_gr_gain);
+	} else {
+		write(priv, mod->base + DPF_NF_GAIN_B_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_R_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_GB_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_GR_REG, 0x100);
+	}
+
+	for (unsigned int i = 0; i < RPPX1_BD_NLF_COEFFS_MAX; i++) {
+		write(priv, mod->base + DPF_NLL_G_COEFF_REG(i), cfg->nll.coeff[i]);
+		write(priv, mod->base + DPF_NLL_RB_COEFF_REG(i), cfg->nll.coeff[i]);
+	}
+
+	spatial_coeff = cfg->g_flt.spatial_coeff[0] |
+			(cfg->g_flt.spatial_coeff[1] << 8) |
+			(cfg->g_flt.spatial_coeff[2] << 16) |
+			(cfg->g_flt.spatial_coeff[3] << 24);
+	write(priv, mod->base + DPF_S_WEIGHT_G_1_4_REG, spatial_coeff);
+
+	spatial_coeff = cfg->g_flt.spatial_coeff[4] |
+			(cfg->g_flt.spatial_coeff[5] << 8);
+	write(priv, mod->base + DPF_S_WEIGHT_G_5_6_REG, spatial_coeff);
+
+	spatial_coeff = cfg->rb_flt.spatial_coeff[0] |
+			(cfg->rb_flt.spatial_coeff[1] << 8) |
+			(cfg->rb_flt.spatial_coeff[2] << 16) |
+			(cfg->rb_flt.spatial_coeff[3] << 24);
+	write(priv, mod->base + DPF_S_WEIGHT_RB_1_4_REG, spatial_coeff);
+
+	spatial_coeff = cfg->rb_flt.spatial_coeff[4] |
+			(cfg->rb_flt.spatial_coeff[5] << 8);
+	write(priv, mod->base + DPF_S_WEIGHT_RB_5_6_REG, spatial_coeff);
+
+	/*
+	 * Bilateral Denoising does not react on RPP_HDR_UPD::regs_gen_cfg_upd
+	 * (see Table 25). A change in configuration needs write of 1 to
+	 * RPP_HDR_UPD::regs_cfg_upd.
+	 */
+	write(priv, 4, 1);
+
+	write(priv, mod->base + DPF_MODE_REG, isp_dpf_mode);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_bd_ops = {
 	.probe = rppx1_bd_probe,
+	.fill_params = rppx1_bd_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 378b18dbc48d..0246e9af1d1d 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -93,6 +93,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST: Debayer demosaicing
  * @RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST: Debayer filtering
+ * @RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1: PRE1 pipe De-noise Pre-Filter
+ * @RPPX1_PARAMS_BLOCK_TYPE_BD_PRE2: PRE2 pipe De-noise Pre-Filter
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -113,6 +115,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
 	RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_BD_PRE2,
 };
 
 /**
@@ -598,6 +602,139 @@ struct rppx1_db_filter_params {
 	__u32 fac_bl1;
 };
 
+/**
+ * struct rppx1_bd_strength - Bilateral filter strength configuration
+ *
+ * @r: filter strength for RED
+ * @g: filter strength for GREEN
+ * @b: filter strength for BLUE
+ */
+struct rppx1_bd_strength {
+	__u8 r;
+	__u8 g;
+	__u8 b;
+};
+
+/**
+ * enum rppx1_bd_gain_mode - Bilateral filter noise function gain usage mode
+ *
+ * @RPPX1_BD_GAIN_USAGE_DISABLED: gain not used
+ * @RPPX1_BD_GAIN_USAGE_NF_GAINS: use noise function gains
+ * @RPPX1_BD_GAIN_USAGE_LSC_GAINS: use LSC gains
+ * @RPPX1_BD_GAIN_USAGE_NF_LSC_GAINS: use noise function and LSC gains
+ * @RPPX1_BD_GAIN_USAGE_AWB_GAINS: use AWB gains
+ * @RPPX1_BD_GAIN_USAGE_AWB_LSC_GAINS: use AWB and LSC gains
+ */
+enum rppx1_bd_gain_mode {
+	RPPX1_BD_GAIN_USAGE_DISABLED,
+	RPPX1_BD_GAIN_USAGE_NF_GAINS,
+	RPPX1_BD_GAIN_USAGE_LSC_GAINS,
+	RPPX1_BD_GAIN_USAGE_NF_LSC_GAINS,
+	RPPX1_BD_GAIN_USAGE_AWB_GAINS,
+	RPPX1_BD_GAIN_USAGE_AWB_LSC_GAINS,
+};
+
+/**
+ * struct rppx1_bd_gain - Bilateral filter noise function gain configuration
+ *
+ * @mode: gain usage mode (from enum rppx1_bd_gain_mode)
+ * @nf_r_gain: noise function gain replacing AWB gain for red
+ * @nf_b_gain: noise function gain replacing AWB gain for blue
+ * @nf_gr_gain: noise function gain replacing AWB gain for green-in-red
+ * @nf_gb_gain: noise function gain replacing AWB gain for green-in-blue
+ */
+struct rppx1_bd_gain {
+	__u32 mode;
+	__u16 nf_r_gain;
+	__u16 nf_b_gain;
+	__u16 nf_gr_gain;
+	__u16 nf_gb_gain;
+};
+
+#define RPPX1_DB_SPATIAL_COEFFS_MAX 6
+
+/**
+ * struct rppx1_bd_g_flt - Bilateral filter green filter configuration
+ *
+ * @spatial_coeff: spatial weight coefficients
+ * @gr_enable: enable filter for green-in-red pixels
+ * @gb_enable: enable filter for green-in-blue pixels
+ */
+struct rppx1_bd_g_flt {
+	__u8 spatial_coeff[RPPX1_DB_SPATIAL_COEFFS_MAX];
+	__u8 gr_enable;
+	__u8 gb_enable;
+};
+
+/**
+ * enum rppx1_bd_filtersize - Bilateral filter red/blue filter kernel size
+ *
+ * @RPPX1_BD_FILTERSIZE_13x9: 13x9 filter size
+ * @RPPX1_BD_FILTERSIZE_9x9: 9x9 filter size
+ */
+enum rppx1_bd_filtersize {
+	RPPX1_BD_FILTERSIZE_13x9,
+	RPPX1_BD_FILTERSIZE_9x9,
+};
+
+/**
+ * struct rppx1_bd_rb_flt - Bilateral filter red/blue filter configuration
+ *
+ * @fltsize: filter kernel size (from enum rppx1_bd_filtersize)
+ * @spatial_coeff: spatial weight coefficients
+ * @r_enable: enable filter for red pixels
+ * @b_enable: enable filter for blue pixels
+ */
+struct rppx1_bd_rb_flt {
+	__u32 fltsize;
+	__u8 spatial_coeff[RPPX1_DB_SPATIAL_COEFFS_MAX];
+	__u8 r_enable;
+	__u8 b_enable;
+};
+
+#define RPPX1_BD_NLF_COEFFS_MAX 17
+
+/**
+ * enum rppx1_bd_scale_mode - Bilateral filter noise level lookup scale mode
+ *
+ * @RPPX1_BD_SCALE_LINEAR: linear scaling
+ * @RPPX1_BD_SCALE_LOGARITHMIC: logarithmic scaling
+ */
+enum rppx1_bd_scale_mode {
+	RPPX1_BD_SCALE_LINEAR,
+	RPPX1_BD_SCALE_LOGARITHMIC,
+};
+
+/**
+ * struct rppx1_bd_nll - Bilateral filter noise level lookup
+ *
+ * @coeff: noise level lookup coefficients
+ * @scale_mode: noise level lookup scale mode (from enum rppx1_bd_scale_mode)
+ */
+struct rppx1_bd_nll {
+	__u16 coeff[RPPX1_BD_NLF_COEFFS_MAX];
+	__u32 scale_mode;
+};
+
+/**
+ * struct rppx1_bd_params - De-noising Pre-Filter configuration
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_BD)
+ * @strength: colour filter strength
+ * @gain: noise function gain
+ * @g_flt: green filter configuration
+ * @rb_flt: red/blue filter configuration
+ * @nll: noise level lookup
+ */
+struct rppx1_bd_params {
+	struct v4l2_isp_params_block_header header;
+	struct rppx1_bd_strength strength;
+	struct rppx1_bd_gain gain;
+	struct rppx1_bd_g_flt g_flt;
+	struct rppx1_bd_rb_flt rb_flt;
+	struct rppx1_bd_nll nll;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -622,7 +759,9 @@ struct rppx1_db_filter_params {
 	sizeof(struct rppx1_ga_params)				+	\
 	sizeof(struct rppx1_ga_params)				+	\
 	sizeof(struct rppx1_db_demosaic_params)			+	\
-	sizeof(struct rppx1_db_filter_params))
+	sizeof(struct rppx1_db_filter_params)			+	\
+	sizeof(struct rppx1_bd_params)				+	\
+	sizeof(struct rppx1_bd_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


