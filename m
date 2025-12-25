Return-Path: <linux-media+bounces-49552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58ECDDFD9
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E08A30728A5
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F10F2882BB;
	Thu, 25 Dec 2025 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MVU99Zoy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AejpYuNO"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAB27F010;
	Thu, 25 Dec 2025 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682712; cv=none; b=dNa+yj5ivpbqCiStTkwEWbdND/HQXqpYBsrtoMMfAgvyTt+ltMVlRnDH2zm2xlDuhUkCPF1C0+K1bO+P/xmCu0tOBO5HIZ64DuCTW6VJuhyJ2HDEPnpcfAoKRkn1tcBjkeKQOAuFzDtKCW1gWNfeJsRE/Q7M/yb+eOMxD7h7Vwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682712; c=relaxed/simple;
	bh=owqT/9+TX7ZFprpOOSMeYSuoGT8R1ubBnVA2gdzBmZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=seqnj8RCLBiow2/sFxLNDGQiOqQrw8ZaARHlH5u40sYGSTpNzllhOmPtFTEGLhLsYvgxvDopi3Ht9uRpi4/iKV6VUdVmtUDsDUSlUDkThXsbCHLtGey6SNqe8J1nYjikfMOpcROMPTbSJ0cFkBQ7ZJ0af3hbuUTaLT6jc9axO6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MVU99Zoy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AejpYuNO; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id A4522EC0072;
	Thu, 25 Dec 2025 12:11:47 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 25 Dec 2025 12:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1766682707;
	 x=1766769107; bh=2k7D2cJC0uJuVjBwUvuWnnDv4G+BhqjmWKUAGeVkUWw=; b=
	MVU99ZoylX0FAMJUXAtwb8Yv26cn98wHUXVF1U1gsGcvG+CUzCaiW/ZcWrBkaH+P
	1tMVZBBGIA7LbK4DJpJrfRvTzRVqP65CWgxJPBobzuFh6Y3QWXYKDwAaLAD7HhND
	pmdkroc14RHR6UTS3kKgj6KuPlE3vwnahy78/bqj0PkLDCxadm7BDJ5uzo8oKMjJ
	ApfZxP4LLX/iQotIDz0PfSgcZlAeIJ03TxmiqC+/EMmwxK5H7gc2KoBeu8xwSiYm
	sw2pWRzBmYJdjOIxkqO9Ce/sx+Grj/5pu1Q6/q5neecXuznOgUN/SHEScvyghrWy
	DKynABI5ikeR0EJLijVO+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766682707; x=
	1766769107; bh=2k7D2cJC0uJuVjBwUvuWnnDv4G+BhqjmWKUAGeVkUWw=; b=A
	ejpYuNOa/ox6AZD4d4g//pkFGQa54pdrg/Z9zRJtvjRheOCPzHxFlIr67MGNr4OQ
	DX1E8ImjZzdfznDYpUtvGkC+xOhrzMqoUP/Rhl5Wrm3h/6jD82xnum/7WyLCBF2/
	QmUxJR3kcM9ETzEGMH4av83YFR8AJFqGrcUBmqSu2PRF9HXMgCmN/f+LO1orlGrY
	ZOV+d0GkX6i5id4tcEUfQdFvK1yJ6j9RvaXc3UynBlsWqzv27iur24tJUkidrXVC
	SogdbeifWs22oTuCm4cB4zJynnPXb0QtWPCASaWqqmMvBsiTiT0ubFiznAdwjUii
	Ue72zsYInSU0QjivBPebQ==
X-ME-Sender: <xms:U3BNaUqWR9mtG3WTYZxMfc4ro0_uouXuaOOmOKQqp1gl5rKD8-liGA>
    <xme:U3BNabEvW54WvX3KDgBScrolACbMDVnsU1VNEodrk2lUZOLTjPIUnUN12skgR5KFu
    qLO9IT2CET7pP5btBqj4FQqDRG26A_2aOsNeXqoszuG-esbSbN9_DI>
X-ME-Received: <xmr:U3BNaZ5Q35f3SZCWtT-p7t3ByV1__Zn8viG6qz3nynBveFZ_Tlq9Y5ulc0iYNYu7WiGI2igfkLW33EnkH1IR1bMh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtoh
    hmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonh
    gsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdprhgtphhtthhopehm
    rghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdhorhhg
X-ME-Proxy: <xmx:U3BNaTcu9xnniwmDsc-hiXSRBkBnnP9Rgd7bfRE_RWvh7iIW3ywODQ>
    <xmx:U3BNaU5QHuL5AeqeBVb8ID8_KLTl-M0qx2mIIXEi9L6vdbu8i_wwKQ>
    <xmx:U3BNaY9Ga19Rlbm62pISSOBXK50MNMfEzb3fNw5V3-B70mOYXkd56A>
    <xmx:U3BNaeFcA2wzgNdkl5tNl2RdgniK_k3VBc1QoNKfQfQo-i5NNL5XjA>
    <xmx:U3BNacffD900t2uYfWR3mxM79AYXH5sYr_VOj3yyUg2t3qPnBHgS7_ug>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:47 -0500 (EST)
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
Subject: [PATCH v5 11/12] media: rppx1: Add support for Bayer Demosaicing
Date: Thu, 25 Dec 2025 18:10:53 +0100
Message-ID: <20251225171054.1370856-12-niklas.soderlund+renesas@ragnatech.se>
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
Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../media/platform/dreamchip/rppx1/rppx1_db.c | 112 ++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index b5a4194ecab7..ddabb84e8df4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -32,6 +32,11 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.52.0


