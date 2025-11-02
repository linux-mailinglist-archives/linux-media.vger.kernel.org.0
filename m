Return-Path: <linux-media+bounces-46166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 520C1C2993A
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 00:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28492188E7A8
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 23:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482802E11A6;
	Sun,  2 Nov 2025 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Ls0c3+NR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oc39YfeB"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDF2C2375;
	Sun,  2 Nov 2025 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124249; cv=none; b=OXf62jujaaFoYMONdlupdYVt/NBD5/yeDPl1f3NQC7HAA+Pk+mf3MEQT+sLvXqAncsS+CiKTSpN5vRh6AUwgQtzcLNLqr7kGppdYB8B1h2Zox/7gPqZHIR11aC1kUjG7z/Rp3QtHPS4APQVNK+WdQmnNtoc+LmsRUq0+TcCQ8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124249; c=relaxed/simple;
	bh=UiEbXzrCDThx3Vct5o8eS8CP0WQCFl6sQ/eAENpSuaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kezB1wTj2I/6FdI74fReAgVbY7VMo6FNyQscmY4vkvFUr2xsDeYv2Q3oHgptA7uM1sxIPsIzWjqApxRKSVc8oqrCAFdluodYISQMEfBy5id9Yj6Z+8FlgKZF5QWUmS0Y5VebEfREulXD2KNlP1E3yCAQwaXY72HGhKlnIy2Oups=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Ls0c3+NR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oc39YfeB; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D8FBF1400267;
	Sun,  2 Nov 2025 17:57:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 02 Nov 2025 17:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762124246;
	 x=1762210646; bh=kSufCyUgZpNrTmuuA7CfVdRQ1wFGBfQTHf3LwH2hcXw=; b=
	Ls0c3+NRRWmG74bmFvbip6pOBRHO7BD4N8JigM5BJN3MDcHKofWivV0BIq/1fTVj
	rFymIF36sCjyOSKd0s+OHHyao9i7N9qEc29KjDFYyym6QXtTSUm8Zv0s6bsQ2GpK
	ta/vSMx0SSpEEMAhp1VPAxSf8qiXPKMaeMtIBjMBeeMNo/YVkswEFsGq72fDX1L+
	+0cYn1GPiY1L3uRePPohgDH/s3y19QvHbbAedJzeWYjJYZAt9MbnSJ22Agt2nGcC
	9q8YOFvxowakGKsdGqWV4NfcpprGyWT35sKmyauRSP4M93G19j5AxWz1xHseNu8j
	aU4Au5SBNPw5kHd7NQMRSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762124246; x=
	1762210646; bh=kSufCyUgZpNrTmuuA7CfVdRQ1wFGBfQTHf3LwH2hcXw=; b=o
	c39YfeBDUmHre9HbQLJXY3yncnwxrfZatomRw9+CtM46OXAeoQnrJ42Fl1nYwCUc
	+jtkF17E6pYSnxjwlKHZGR0oJ5WEVADWqnU4r+RdQ7Xzzv/OeSp5z/vThVtcbuHS
	3oWTCZMtVLwQpjpZTAmH3QlWep/boyG29TnmZOLNG+cy94Shx4dDcJfzZzL+PYcE
	ugd+a4YfOQY3mNOp4CfkssRFR/kGtRhDukuWMg1XLzqrFG5P3vNG9re3o2Y1AOQj
	EsRGiYEIxyc3ZtyF0XXHvV6fee1WbDoA+vFsv9s8t62lsb7Jde22jTpqUS4aLDkY
	bAEZqEmKNnR1QIZ/tSfxA==
X-ME-Sender: <xms:1uEHaYhu2ohdO17KGi2Gu9rsNkzIgNMvDeWof66EA_exeG-OTXPW8A>
    <xme:1uEHabGf_KvNxTDKi8Zu1Q9uWm0855AiFTEtGFtEgrSlDA8r52xke2FxsW2GOCPpc
    PwlNL5QNd0ErJseb-AswK7ZIFn8gPEAuwdMNffkAe1HOZ24upOEmtE>
X-ME-Received: <xmr:1uEHaf9fD1svGEatqw-8TUhpS-FjL1Pj_FP_PLtnixkCOP8GAVUwBFEdqNiduzEJqRhQVtkz5wLKeVKe8vhD2kkx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:1uEHaaz0R8U9qTDb1uHEg8Y1ySbr8T5gEE-DZV8F11l-bm2pa1Zneg>
    <xmx:1uEHaTNzku-4gtpv34wTvuNpk-6FadSGCtSCNaa1vxgHPZeDnYM1cg>
    <xmx:1uEHaX_8x3asT6GbzRKVavAjHwykdfXhfguPxnEyCX1gUpoU_NNLRw>
    <xmx:1uEHaY4qU08w6Ar54aYjk1Gu54O0ecDhBokzeeErBj8INyWg5TAyjQ>
    <xmx:1uEHaSf0PyAnVQk_h6T-JzDn7vWhI8YKHO5XQ7TFRFnmVt5lDjAT3Ipq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:26 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 11/12] media: rppx1: Add support for Bayer Demosaicing
Date: Sun,  2 Nov 2025 23:56:41 +0100
Message-ID: <20251102225642.3125325-12-niklas.soderlund+renesas@ragnatech.se>
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
2.51.1


