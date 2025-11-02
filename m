Return-Path: <linux-media+bounces-46167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C2C2993D
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 00:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 281D53B0873
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 23:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3E52E36F1;
	Sun,  2 Nov 2025 22:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Dlp25m4v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gBnEU8h5"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943232DCF7C;
	Sun,  2 Nov 2025 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124251; cv=none; b=qEEptO49928eLZ7x4siPw0iEB6OtCB8kQlKj9wuvoL01xIvnY5haCy0L9E3AGTbCSUxmrIP6dHhE7DAtTj/vPPuLE1vlFiZql04vf4QEKF6y59/lfBfARi4DsWbkaUJdlHs1BWkwW95GzFg4O/jFTusfUwvulqlMpL6YDfqyw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124251; c=relaxed/simple;
	bh=FZ+k7AbG9eNAQ9D9p7iAdcDyLZCtCp9X4iUVleRf4oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpl7fGgPHxi1KUdOcf8bYeENoiSqFQnv8QFiuk9dOMWeKXxIGwRbWQiSsGkTyouzTvJ/yTBI7UQ4huRqfyaAQE3CC3t4jDjHxtBxrss9oF+XCLgeoWNajjjE+nlOFSKovBJ8er9xxa7i02B6eoGIdR4yxQGKCoHRC2dFtJJBfDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Dlp25m4v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gBnEU8h5; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 00405140025D;
	Sun,  2 Nov 2025 17:57:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 02 Nov 2025 17:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762124248;
	 x=1762210648; bh=4vvKrCC5whVNS4sbLfnWVW5mZtZKghKcKZG4JaTB9nM=; b=
	Dlp25m4vw949alywHnSvDbH46gmFIpTymV+2KyjelC60D/s4EnvNECHEv9p8GS7z
	h7F8TgDQTonVDtBLYNDMqjaikNFlMhMpvll60HqxVyv3TuWdj/arnYN0t3Yr7mjW
	A3wUnho0YL/n4HOtj3CGStZ73WxDOBKv5XrmBVXcgy7MA7hoNtf9eG2CZtbXhuJA
	G960c/n1GXzDMF0SCx2PicXi8DSZazCb2loM1v1pJnqVTg0Rc+ryGhTcDeR/FPTq
	WujW9qa1iCUOpsa/hRzokNIsXqbmQEi012KfSnNWsCWAeRB0NWA2wRPCspD55F3m
	5V6UV/LwylV5xyjCShnONA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762124248; x=
	1762210648; bh=4vvKrCC5whVNS4sbLfnWVW5mZtZKghKcKZG4JaTB9nM=; b=g
	BnEU8h5hIsvuE/SFQJTYjQ1RzkesEIKQw+P/D7N/KBAFcsdCnq7U2CbHIw1nZote
	TYinMI4QqqG5biaDHLvWtgJpOXCVucrnr9iOz0NGjSvh+6jlqdNuZuqj8I5eliqo
	y0wmWwd0LXDxzo4I1+VtGimVeO30QYjvpPW12NHpQ9+JVQEy2GKzzVdcRfU/CXW1
	PHZJzuT29cy8+DhpzaHQEX0UIYr+JkNxuoyWDLeM6inKSh5vSUVNxeGzkOc4kUFH
	u+bfSYY8NTWYMNvZDTf+kN2CqEYagWpqAP9KApWhgC5+4HzPA0COwkS6rNklNd+a
	SSbHYOtX3/934sMjWd5YQ==
X-ME-Sender: <xms:2OEHaTIgiR9SBFrNT3wVxKdK138Vgv8IJ-MBnKCx8WNWwO81UB4VUA>
    <xme:2OEHaRMBtfx1A_Xua4p8BMBgnn3nOlMAAePPgxOtjEEyRwUuJUgG3B6HFAL459oI4
    boVtmI6ilUz79hWeWT4UX81T7y2CI1PPpoIQOldmNoXcNwolfP8Bug>
X-ME-Received: <xmr:2OEHabniZiMy8sF2kAk-v8pWSVCOcfEv-j7ySz9ACLtJaJ2wYCMCBCxxMPqOhy2N4fy8lWyDNf1O3IUwv5ns5cj1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefhueelvdfhvdff
    hedtieektdegjeegtefgffduffeludevteduheekvddvleefvdenucffohhmrghinhepgh
    gpfhhlthdrghgspdhgpghflhhtrdhgrhdpghgrihhnrdhnfhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluh
    hnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhr
    tghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrug
    drtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnug
    dorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:2OEHad65dYFVymzWkg0xxWN6e2izUMiKmBjQVmvLzelND_pp_F2NiQ>
    <xmx:2OEHaX1VUlT-SOVn1nbjmMzh7EUhDTF8G27PfrOqJELq1dVo_P6B1Q>
    <xmx:2OEHaQHSAYpK6l6YWSvDhGYensr8t_ffTd7tTKtLYNvYt0sazi0nAw>
    <xmx:2OEHaejenQQ2j3vy9GbChMXFZo54LctxBlkJmlahHQljiO-BU-Kggw>
    <xmx:2OEHaWn19WtpWfPN9hZ5qAhjPhSGKnaIZe_s3bh2K2vVAFqXvFWCPCyF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:28 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 12/12] media: rppx1: Add support for Bilateral Denoising
Date: Sun,  2 Nov 2025 23:56:42 +0100
Message-ID: <20251102225642.3125325-13-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251102225642.3125325-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251102225642.3125325-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../media/platform/dreamchip/rppx1/rppx1_bd.c | 158 ++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index ff075d6b81a7..b7b8adfe9337 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -41,6 +41,11 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.51.1


