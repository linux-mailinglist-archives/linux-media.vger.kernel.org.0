Return-Path: <linux-media+bounces-55815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNuSMV/dtWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:12:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B210B28F3C5
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57CC0302E75D
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153E238D001;
	Sat, 14 Mar 2026 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OSbPcMMP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C6gp+TB4"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80BA38758E;
	Sat, 14 Mar 2026 22:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526284; cv=none; b=W2aTNY3V23oHT1yhnED/dKUrGdxtAslzutN/rZFE4hChEounlaIdxZbKfO1inrTPzfPfsZutH+rScuDQShqukDFXDNC8XGjf8+24ZPU0i6MQxYjis01NBpJpJlbIZZ3txbbNpv++ywFX6YApehy0Fv+StyZb35Yej38ZftFM++s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526284; c=relaxed/simple;
	bh=PmYBZ/NkL/BLlLjZ2nW/hHgQgcd2+sUoDeOSBrb86kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kSELf9MS/1EXMc5lbnWj2mQcn2vA4NbeWrWdqjT5fA1A5txE/hfFYF8b4WjJS3WHbDWj+6S03nAa/mtuaqp2v8Osy4Vy+v1dQ06hvMCJVDfVGfsR1K6p0boFhiHwyfyjCXlXzXqQ4IG3KFRKYKy1K2PLQGKY2OHZKi3DiJWbP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OSbPcMMP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C6gp+TB4; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B3A1BEC0AEC;
	Sat, 14 Mar 2026 18:11:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 14 Mar 2026 18:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526273;
	 x=1773612673; bh=vZrA2qkBl7rB/iErjGB10VHVnjZsqiMI4yclq8uedYs=; b=
	OSbPcMMPrXAuS5L11HMDlsSVF4Ir3gNEjQM3J2s7K8xremkka+UobELDKZIrc5iS
	uG93z1g9LNfo5nq/v4d48rcVXRzN2SZnNRV03mw+hpYmJ5u1yCERtUEMKibmkM3r
	NKmeJaGmcvsRsnerYEIF8qbxwZgsDCLu8w4TrqfvrRtJ6lsxVkEW+nFyi85zfOFQ
	KFo3tRgg9NpYLM7kVP3lDtBIyKJDkxETgqMPK448fAnnV8FqNM7YahPDECKuAljs
	4I+JuX2VMvpwcU1MJpPM8UZh/NMdjqoe1xMZHjeQ4pKHluWaod71wplA+YbvTKnL
	AJD0seBakfDs2phApSpL0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526273; x=
	1773612673; bh=vZrA2qkBl7rB/iErjGB10VHVnjZsqiMI4yclq8uedYs=; b=C
	6gp+TB4UzZttUqCPOxjmz6h1HwdvOuVRZ4m0+nMF2cJDwSX7hTnhuEE76YbYltCN
	ErOgZuedBN8uAOuvUmNRLo0j2EGpKmRohOEjbV0nPwmJaeJ5TEztbTIwndZ6okEz
	eXQWAQBLUoekBsZAb/0n66Mur8qdxxjyOJKMhLB+d7KgIwSvIbokzz7Q4UyO4HVC
	Vbr4CP7xR1yBUDiTUD/SJldO8YEY76KsxAtrw3hs36tCGfWDpg0CtkNaXwhwrMR2
	PDJ37zWOiiqtTSVTm6B8BckCbnaXnuAFGHsiG/43pXncxar8l0m4ABXcJkQtncJI
	sUuSPZmwbB6PcNZN/QAvw==
X-ME-Sender: <xms:Ad21acMspsKNdxR7v5dMpNPmSojuXxsXIKxqlLqtrDyJzF6LKmNHQg>
    <xme:Ad21aTb3XZxTA1ogbw4bbBYTjTieZBWJkqcPI0MjoX7nFVxdeL9I0SzZdKANy0Eu_
    jb5geH-A_KqSD1UXaWkhhZFKi9kGAe_0NGvBHwQIVOfQGnGdjY28xY>
X-ME-Received: <xmr:Ad21aT_C64LqeuAKVYbTcRw7VeFZMWG3uWwGouO3PNx0sCs2St9pdMIbN8Jpe9rnQgO2mr2O6vADi8egc9W19ZmH4zD9nrdpolUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefhueelvdfhvdff
    hedtieektdegjeegtefgffduffeludevteduheekvddvleefvdenucffohhmrghinhepgh
    gpfhhlthdrghgspdhgpghflhhtrdhgrhdpghgrihhnrdhnfhenucevlhhushhtvghrufhi
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
X-ME-Proxy: <xmx:Ad21acQ1xrpdquKH47r9PBMr5Gvc3pmk-BJzGafnpDjQJlqv8lcfgA>
    <xmx:Ad21aVc1CZfvUhHGA20VWBv_SkEr5XKKdDSAL_B7Gq1CX0Ob12GnHQ>
    <xmx:Ad21aWThgGNInpERHebv_6laD6t9hjnNRRL_2uqRx8__mN54vzUcZg>
    <xmx:Ad21aZKnrQQ72CkGLcnJb_6oc6u5nsuPKNAf0ZUGaffBcycRbnwT1w>
    <xmx:Ad21aczaQ-VhPgIIe2hO8h2hOeUOubyb3MdICNar0Ce5I0YNLIut0Pp4>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:11:13 -0400 (EDT)
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
Subject: [PATCH v6 12/12] media: rppx1: Add support for Bilateral Denoising
Date: Sat, 14 Mar 2026 22:59:44 +0100
Message-ID: <20260314215944.3674865-13-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55815-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,mailbox.org:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: B210B28F3C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the Bilateral Denoising
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

The parameter bit-sizes matches RkISP1 so there is no need to convert
between the two. Some bit flags are inverted however and RPP have
different registers for each color components coefficients where RkISP1
have one for covering all.

The biggest difference is that RPP have dropped the hardware bit
AWB_GAIN_COMP. Luckily it's behavior is easy to emulate in software.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   7 +
 .../media/platform/dreamchip/rppx1/rppx1_bd.c | 158 ++++++++++++++++++
 2 files changed, 165 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 77869ec7cf6a..0b68406abbb7 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -22,6 +22,8 @@ rkisp1_ext_params_blocks_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(BDM, bdm),
 	RKISP1_PARAMS_BLOCK_INFO(CTK, ctk),
 	RKISP1_PARAMS_BLOCK_INFO(GOC, goc),
+	RKISP1_PARAMS_BLOCK_INFO(DPF, dpf),
+	RKISP1_PARAMS_BLOCK_INFO(DPF_STRENGTH, dpf_strength),
 	RKISP1_PARAMS_BLOCK_INFO(LSC, lsc),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RKISP1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
@@ -77,6 +79,11 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC:
 			module = &rpp->hv.ga;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF:
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH:
+			/* Both types handled by the same block. */
+			module = &rpp->pre1.bd;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
index acbfbcd59591..3bb717d87ec5 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
@@ -47,6 +47,164 @@ static int rppx1_bd_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_bd_param_rkisp1_main(struct rpp_module *mod,
+			   const union rppx1_params_rkisp1_config *block,
+			   rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_dpf_config *cfg = &block->dpf;
+	unsigned int isp_dpf_mode, spatial_coeff;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DPF_MODE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RkISP1 have an extra hardware flag AWB_GAIN_COMP which was removed
+	 * in RPP DB module version 4 and later. If the bit is set the
+	 * programmed gains will be processed, if it's not set a default value
+	 * of 1 (0x100) will be used. From the RPP documentation for DB version
+	 * 4 changelog.
+	 *
+	 *   Removed RPP_DPF_MODE::awb_gain_comp. Always use programmed
+	 *   nf-gains for gain compensation.
+	 *
+	 * We can emulate this behavior if we keep track of when the RkISP1 do
+	 * set the flag.
+	 */
+	bool awb_gain_comp = false;
+
+	switch (cfg->config.gain.mode) {
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_NF_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_USE_NF_GAIN;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_LSC_GAINS:
+		isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_NF_LSC_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_USE_NF_GAIN | DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_AWB_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = 0;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_AWB_LSC_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_DISABLED:
+	default:
+		isp_dpf_mode = 0;
+		break;
+	}
+
+	/* NOTE: Hardware bit for scale_mode is inverted compared to RkISP1. */
+	if (cfg->config.nll.scale_mode == RKISP1_CIF_ISP_NLL_SCALE_LINEAR)
+		isp_dpf_mode |= DPF_MODE_NLL_SEGMENTATION;
+	if (cfg->config.rb_flt.fltsize == RKISP1_CIF_ISP_DPF_RB_FILTERSIZE_9x9)
+		isp_dpf_mode |= DPF_MODE_RB_FILTER_SIZE;
+	if (!cfg->config.rb_flt.r_enable)
+		isp_dpf_mode |= DPF_MODE_R_FILTER_OFF;
+	if (!cfg->config.rb_flt.b_enable)
+		isp_dpf_mode |= DPF_MODE_B_FILTER_OFF;
+	if (!cfg->config.g_flt.gb_enable)
+		isp_dpf_mode |= DPF_MODE_GB_FILTER_OFF;
+	if (!cfg->config.g_flt.gr_enable)
+		isp_dpf_mode |= DPF_MODE_GR_FILTER_OFF;
+
+	isp_dpf_mode |= DPF_MODE_DPF_ENABLE;
+
+	if (awb_gain_comp) {
+		write(priv, mod->base + DPF_NF_GAIN_B_REG, cfg->config.gain.nf_b_gain);
+		write(priv, mod->base + DPF_NF_GAIN_R_REG, cfg->config.gain.nf_r_gain);
+		write(priv, mod->base + DPF_NF_GAIN_GB_REG, cfg->config.gain.nf_gb_gain);
+		write(priv, mod->base + DPF_NF_GAIN_GR_REG, cfg->config.gain.nf_gr_gain);
+	} else {
+		write(priv, mod->base + DPF_NF_GAIN_B_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_R_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_GB_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_GR_REG, 0x100);
+	}
+
+	/* The RkISP1 hardware have a single register for all components. */
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS; i++) {
+		write(priv, mod->base + DPF_NLL_G_COEFF_REG(i), cfg->config.nll.coeff[i]);
+		write(priv, mod->base + DPF_NLL_RB_COEFF_REG(i), cfg->config.nll.coeff[i]);
+	}
+
+	spatial_coeff = cfg->config.g_flt.spatial_coeff[0] |
+			(cfg->config.g_flt.spatial_coeff[1] << 8) |
+			(cfg->config.g_flt.spatial_coeff[2] << 16) |
+			(cfg->config.g_flt.spatial_coeff[3] << 24);
+	write(priv, mod->base + DPF_S_WEIGHT_G_1_4_REG, spatial_coeff);
+
+	spatial_coeff = cfg->config.g_flt.spatial_coeff[4] |
+			(cfg->config.g_flt.spatial_coeff[5] << 8);
+	write(priv, mod->base + DPF_S_WEIGHT_G_5_6_REG, spatial_coeff);
+
+	spatial_coeff = cfg->config.rb_flt.spatial_coeff[0] |
+			(cfg->config.rb_flt.spatial_coeff[1] << 8) |
+			(cfg->config.rb_flt.spatial_coeff[2] << 16) |
+			(cfg->config.rb_flt.spatial_coeff[3] << 24);
+	write(priv, mod->base + DPF_S_WEIGHT_RB_1_4_REG, spatial_coeff);
+
+	spatial_coeff = cfg->config.rb_flt.spatial_coeff[4] |
+			(cfg->config.rb_flt.spatial_coeff[5] << 8);
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
+static int
+rppx1_bd_param_rkisp1_strength(struct rpp_module *mod,
+			       const union rppx1_params_rkisp1_config *block,
+			       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_dpf_strength_config *cfg = &block->dpfs;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DPF_MODE_REG, 0);
+		return 0;
+	}
+
+	/* Module version 5 adds shadowing for mode and spatial weights. */
+	write(priv, mod->base + DPF_STRENGTH_R_REG, cfg->config.r);
+	write(priv, mod->base + DPF_STRENGTH_G_REG, cfg->config.g);
+	write(priv, mod->base + DPF_STRENGTH_B_REG, cfg->config.b);
+
+	return 0;
+}
+
+static int
+rppx1_bd_param_rkisp1(struct rpp_module *mod,
+		      const union rppx1_params_rkisp1_config *block,
+		      rppx1_reg_write write, void *priv)
+{
+	switch (block->header.type) {
+	case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF:
+		return rppx1_bd_param_rkisp1_main(mod, block, write, priv);
+	case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH:
+		return rppx1_bd_param_rkisp1_strength(mod, block, write, priv);
+	}
+
+	return -EINVAL;
+}
+
 const struct rpp_module_ops rppx1_bd_ops = {
 	.probe = rppx1_bd_probe,
+	.param_rkisp1 = rppx1_bd_param_rkisp1,
 };
-- 
2.53.0


