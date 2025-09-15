Return-Path: <linux-media+bounces-42578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4209B5831B
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D48F2A3B73
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E61298987;
	Mon, 15 Sep 2025 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="aRp16Vvp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gkxzzFP7"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AEE2FB099;
	Mon, 15 Sep 2025 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956256; cv=none; b=EYDB77cnmO80XHnqkZXz5HqjdkwFtkvQgdTJYicnQC/Q+q6/vco3r1FUG+VVagUBc3TIpbuZG0xUTbvmw8rwaAnJjmSzdMoA22QXVXTQW1/LdrAewYSCspQocHR9XMrf6CrlJJ8yKFT5kPv5xlj6NcmFycVAfuN9YiEsTWIxCBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956256; c=relaxed/simple;
	bh=B5XzzmfVL55ibXxzrC5j36Zc2gtZNUDaeNSlffTSryU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQCY8qoa9QKpvsdEo4XmTraViac2IK+OfUDBLL439pADIvh/L/qp2X71f9E7u7vgYKGkuaQcLEkeO7b3J2pqKtlYF5xYbFUvupKOyPMa+JWp025RUupZ4i9rwgWoW/nXRgIUiHEJiSwzPbgjWxkwQkRuBodEhjxPtV6vV4oCtR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=aRp16Vvp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gkxzzFP7; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3882E7A0185;
	Mon, 15 Sep 2025 13:10:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 15 Sep 2025 13:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956253;
	 x=1758042653; bh=WeuVSMOFTQzdVY6K+1Y+/FCR6eqbyKn4bZi7CQ8MXOg=; b=
	aRp16VvpAsWP5HieLSvVwI4HwR433o7jIh3moo1RdXMr6y1IWGpbtuhuUzQlWQEt
	kG7QJzr133qRZvyy1qUWIl2g46GRSmzxliaM+wcwMs8mRsLOumRue7jG5os1Bcqe
	O/mHMjuogt4IWmK0/UEfYSLiNTvylbWe0uX0DZNlnNQwyvooB+PPN9qhXJRSzyvc
	wQ59s2W1yEiXtvndmufUoMDcIKWKVWEi3PE9Zz8MID479E84iCOYBcBtDMh0tgZx
	Gfzr625crBjIUaS1QRKOfljeBs2Y4a/5Aby07zLLc32DzE7JYJKNiPAv6J5v+HcC
	o5hJT5AM5o25OHcqofSohQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956253; x=
	1758042653; bh=WeuVSMOFTQzdVY6K+1Y+/FCR6eqbyKn4bZi7CQ8MXOg=; b=g
	kxzzFP7uC4k6BUGKtFWVVsa7feIlrf/DdpDGkq4Im8WLlD7grOa/4hbxfAtoHcSw
	SO0cv8929+NMaTibLb4tIVk4Yg6SZFHEuGSwjeoHXMX89nWKwFe1IPN+SYN9P8KH
	LVoGiUdyUyjcljyKZE2b01fUyQNnLmIRJDkU/zlhBk8b16qEXwj7m71jCg4WBfnj
	RyvLyaLduNK9R6cwvK6hLzZkbqU72ylpRXrDejd13XQbvPD8IL0agDmQXTARHt7Y
	XIC1oiIYsCGNfm7sXWSwGe4ZFZFd53VfxpstQZgJ7+sY8pemk31OcFjJnRXD2TeC
	UfMpeMPgrjEpOQLBkKplA==
X-ME-Sender: <xms:nEjIaCWpXTKoQh3LUy38u2b0HjLti4Qz58QQbFwM5Gmv5yuA9a6RQQ>
    <xme:nEjIaGOezg8ewyjzigpt0HLuGVbvRNHLDYKd8UKtMvVWioQzi4CTO-kNEFjwWUQkv
    Dne0RNBIUiZ8ZjFZxg>
X-ME-Received: <xmr:nEjIaEBd88g4QLzzYKU8Yngk45NAnA0J1sB6qXQ2VZ3Q1-Ji64oQIl4NoHmjhy_WpGfXLF_d4y4vXek4GKM6fLizNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhephfeuledvhfdvffeh
    tdeikedtgeejgeetgfffudffleduveetudehkedvvdelfedvnecuffhomhgrihhnpehgpg
    hflhhtrdhgsgdpghgpfhhlthdrghhrpdhgrghinhdrnhhfnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunh
    gusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgt
    phhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:nEjIaDfy8j-z_69MZv8mParCXxJgsFh9axxzRaXNRGMKhw1o0O_CHQ>
    <xmx:nEjIaDOpq_HVFtMn-vQ6_AjQxGSoYeMIPG_mX6qlUEr67mKemUP4cg>
    <xmx:nEjIaDJrXX3RD4FNh4ZDc94dIu0CngsN8SvikiUklykZUadgEOMJyg>
    <xmx:nEjIaDKO5V2p8GUUPqZ1S20ecI4ypcIyOZuj6qhi6DgIp8iZ22yM-Q>
    <xmx:nUjIaJKoAc6N9yoDxOd3rBFu0ingKsDmlU3qvgB_9awK2_L-i5fsK8F9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:52 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 12/12] media: rppx1: Add support for Bilateral Denoising
Date: Mon, 15 Sep 2025 19:07:43 +0200
Message-ID: <20250915170743.106249-13-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
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
2.51.0


