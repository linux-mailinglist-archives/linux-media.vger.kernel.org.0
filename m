Return-Path: <linux-media+bounces-42577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC3B58314
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33AC77AEB7A
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE3D2FFDC7;
	Mon, 15 Sep 2025 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dUtag4jD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ps7a37jN"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0C2E8E11;
	Mon, 15 Sep 2025 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956254; cv=none; b=XsqPrDGU0zPP+3RwGaNRQAXCTkMovT2JwlBZ11qNtqa4yhe9Fx6ZBm4ybCN6eEVe/YRTEOSb6C07STMReokK01Kb7Fe5+cEOWKoJ3LjozR8E0FcbSNLF64SQp7nzf7lZlWUeOz+9aWuTU99XQ2RxRqKmm4W0ftU+zuxlNqnDiDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956254; c=relaxed/simple;
	bh=JdKksoleHwDfypyqI1C2y1PS/6OG2Bc8sLaAhqgSsR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rRYENYJmZ9TtR6SB458kYvyUvFiWeN0jDMtJv9m3IXxx1eme5Xh/H8D7maZtJDEhgVVZWYkiaZZY8z5ZGqpjv6KuNgEz2pBqsspabA/x5tzahEv1XwaF1OBtPhIV/uFUTBBF9HjjwSC2W9KwzG50DMUTEuAcgR16BYuT5pVzp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dUtag4jD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ps7a37jN; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E4CD51D0019E;
	Mon, 15 Sep 2025 13:10:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 15 Sep 2025 13:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956250;
	 x=1758042650; bh=k1c6FF/0ffYhghyfOZg2sbeFixAoZwRJZ/7I6n8Zyys=; b=
	dUtag4jDFhm8SLp7ewcTYtTE52Yk8LhLNPs+kmyx8ItSogrqe+syPVGRXXgcLzEo
	jOrTj0VpH8MJGKPcG8qq2aOa4lbGfseUX/gBRm+UasZ0xLfo6CDTlZJfnyNpArTI
	V1psuBNQoP5Pbz/RosaFOZK5m+s8q26jvm+k1oIe56RZukfbCQZoYN/DNpk3m5Gs
	QIUOMqOGWzV2nm3Cp2/VVqXMucukXT95fpHrseUPF8khai/cgpIkJD9/GZAS7yPy
	FnhAT08InpVim6XEs40WsBXWeIEWFdyW0DKlsloYgtVu8kX5+PKclbRphQtMc+Vy
	hKp88fnyXQ6zTm2xAEO+Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956250; x=
	1758042650; bh=k1c6FF/0ffYhghyfOZg2sbeFixAoZwRJZ/7I6n8Zyys=; b=P
	s7a37jNl6f/769ye1erG3iqu3cd86b6bG9R7Gq7THguEukCvQcGDcFYeWhkVMYxg
	85xX8ZgKFXNO37Lzq5AygYgGDazEB00sfbyQ5qg3D5CLvwz69jy45Gal+01o1Jin
	VNJvqHVUd5a+5y2dERzvYTLGCigKXQShx7hpLQavVN/NhUE3Qj960+xzbgMPT+Uv
	IzELybrkRFnhIGnkJDdge8TrsTKpUvSSBT+ENFfNhcOejFg9RVz86w5A8Vj3QSgP
	xT5a/Od2MDFW5LT3z7NHrZn9skOUCUm+wKGd3RpuIVP9bz+esoiKRlxaLrj9pofe
	k5OlzV1Q0s4Dl0gFW/CbQ==
X-ME-Sender: <xms:mkjIaKpPUc1dEus8paf5RKaAFJ3sXpnksAp3354uOwOGdM_0xn6eyg>
    <xme:mkjIaAQDxMlFOWB5sIm_RmDk4iHypLfMexEbzkaXpJYQMP4WqGjw8DRhkIoKFKDqq
    MpAtd8xk9VTNZxBHHI>
X-ME-Received: <xmr:mkjIaM3bQ9EBrUXDF-Jpf5p7xhZpANlPTak0If06_1y0FFT6DSEajf-DPBmcVsRR5vBFyIT1-Se_tLlnx-pcugXDRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhgu
    odhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:mkjIaECC5wvgWWW-UUe90SN5wff-ICH87nfbXR02iAYb6m2mo2E0zg>
    <xmx:mkjIaAgTgRjS5QXfqRjg3Nyw23DasukzD8Oly1pB9pfx2u2SBRrNag>
    <xmx:mkjIaOPYrAnEq5WhlJ94kQZgyiSfk_Wu63ecGJc6QR6ahzzGlesrrg>
    <xmx:mkjIaI9IcBXPqQNccryxY4ifMWWTWbsVKqRmJERLUlCMYjnx9DK7GQ>
    <xmx:mkjIaCPuOWA5yl1Mq_7HiR_6DFBJxQINHnck2VolaC2niBlBV5qTfDpK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:50 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 11/12] media: rppx1: Add support for Bayer Demosaicing
Date: Mon, 15 Sep 2025 19:07:42 +0200
Message-ID: <20250915170743.106249-12-niklas.soderlund+renesas@ragnatech.se>
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
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../media/platform/dreamchip/rppx1/rppx1_db.c | 112 ++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 323ee792426e..ff075d6b81a7 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -30,6 +30,11 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.51.0


