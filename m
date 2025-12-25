Return-Path: <linux-media+bounces-49553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 279DBCDDFE1
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B285301099A
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C765D280325;
	Thu, 25 Dec 2025 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WTyIqpWg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UmJiNaJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A198287246;
	Thu, 25 Dec 2025 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682712; cv=none; b=pRwIhY/zGbROmq95pmaf3OW32CvhkH1Kv+GBQf52/oCdacoA+/zvFznyYO4nCxlvGGXCkBp7tncYfmVwSaBMsp/WIBts+RovCET0EIrNLMP+Qj1XSqz6Xu+b9XwEh+JCkiZEb82/5bXDDlXLVTwEV481ndcbu3OWbIHDv/vkuvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682712; c=relaxed/simple;
	bh=Gxk+jM5rx6jldALMw1sI04520tYJEoxTJwgM8zsLU10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/G7JmLMhF1K8KDvQwd1FApkPE/Ffh0Xm8R450JJpye1Z0TPHHhisMMxXG+gU5dD3WUt1jN6ybvsDpNoZVrKtKDyeupQyYbAwOLXBcLUcM7AWwWELUdC5hW7tvUuo9v6em5KgsEuDx2GW50EEyaED8fwEsv07fph4HGZgX3VXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WTyIqpWg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UmJiNaJ2; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 777531400032;
	Thu, 25 Dec 2025 12:11:49 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 25 Dec 2025 12:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1766682709;
	 x=1766769109; bh=BAlEwG//Qrmdl6u0ChdopsGZqYyjReiGa5yameu19eE=; b=
	WTyIqpWgL5y7Fyt3AtPxgq0YuA5tw9eMQNO8KajcEw6s2UZpOpOHWGbwn+E9RHOR
	JoaUzlVvHIH1hPOEXl+jQlGlqIv1/T8JlQpd1eTZR92vABh3RCLZIOhwVDVsTTuP
	iYGx0C358Stmu6OkQRecz+X8ShyJkgknEL3HldWyDBvXuctAOrJ67OuKumPFWw76
	NoTaimRqOHSisNUqpKRMHoTtnvEAcy4XSXQEe6dLJG+9FEPbCCXfXXTRF5l1FvXr
	wRkzn0WnAUBy+qYazr8OuJI3MM7y1EskzGwpep3XtbPHf3IkCS7HeVlj8YwEUqaO
	9VQsBywGEsHdevBFJ/m5hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766682709; x=
	1766769109; bh=BAlEwG//Qrmdl6u0ChdopsGZqYyjReiGa5yameu19eE=; b=U
	mJiNaJ2+eqDLSNYv5NM4GSycbd5FoNQCM9DY3KMMXh4Y674+UJ1DyCxUe14lwBW3
	sOPcShRNO+t+laZ0sDizxjRysa9+NCtDOivnoJiRdeEDCA2KCHEYaTt8N2iwGMv1
	KrtEx1i9chjd0Z0r7C5IVuZpnItbsMhwy/gWyzpZhSTzm6/3GUtfdeCw9rq6ooeo
	PUN0I6fEs6uMrjw1I/vugDCgmmeZym+i9WWctflzoYsVwtdZcCLq+OCYFjp0deQW
	tJq6cw2jYMLgjA/7k5RFB5SfAVIlLvrYFuOinhw7dYF5At2QIYMS2gkaCkeE/mhh
	YNEv8m6zaInPaziKFP4eg==
X-ME-Sender: <xms:VXBNaVym2WgR1_MeqR_HZtjdBcOYAuo7v0Svgh2uXT8kDRv6MXj84Q>
    <xme:VXBNaVszlGa8-_DKux47ErsNnMqYVPUSnbDNydDKHgWD1WWFhBNgVmGCec-heCRK1
    fz3sh0FTcqedbhQguz2hgDrDWWDQz35_R7fkFAgllvDG6NjvW1erhg>
X-ME-Received: <xmr:VXBNaQCcKN6qskCnbHNTVn9evgjgIMakfWrXtOjOpGvGHIvIoR0f8f4Vqli10bj4-UDBXoASOGNwCjuMPRQfKVqi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhephfeuledvhfdvffeh
    tdeikedtgeejgeetgfffudffleduveetudehkedvvdelfedvnecuffhomhgrihhnpehgpg
    hflhhtrdhgsgdpghgpfhhlthdrghhrpdhgrghinhdrnhhfnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunh
    gusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtohhm
    pdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtg
    homhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgs
    ohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdprhgtphhtthhopehmrg
    hrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdhorhhg
X-ME-Proxy: <xmx:VXBNafFSPlvPld-OyMkhIj06B2WBgurbQxZybhVWpsz-tbZqAZaaNQ>
    <xmx:VXBNaYAP4L86vKbCnRttz9mzBV64vEgpPQawO57bh6m95N7nmfowog>
    <xmx:VXBNadmayHoJg_bLmLzHfxeg48RdFb9KfE-zUhyP3iuv3pUivggFFw>
    <xmx:VXBNaWO8ssy8OAEVO9UhbL9ahGae8BTD1CYIF5lzEYCIXW6vitxViQ>
    <xmx:VXBNaXG6h63_bnlU-a7_pw3VvtWDuahBu9sWDV0ZUVaCpW8xIUs6HxQU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:48 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Marek Vasut' <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v5 12/12] media: rppx1: Add support for Bilateral Denoising
Date: Thu, 25 Dec 2025 18:10:54 +0100
Message-ID: <20251225171054.1370856-13-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225171054.1370856-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251225171054.1370856-1-niklas.soderlund+renesas@ragnatech.se>
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
Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../media/platform/dreamchip/rppx1/rppx1_bd.c | 158 ++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index ddabb84e8df4..835b3e1d126a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -43,6 +43,11 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.52.0


