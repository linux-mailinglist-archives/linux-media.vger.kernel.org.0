Return-Path: <linux-media+bounces-46158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D78C298CF
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 23:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E7684347248
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 22:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E897125485F;
	Sun,  2 Nov 2025 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="elzZj9Sm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sYdxRxYL"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2824CEE8;
	Sun,  2 Nov 2025 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124236; cv=none; b=owLtzhM4WRzRUwgLT3FkR5ZK7E4QCkhMxzptv6TlsaZ9f9olNmT0LISDUtfZoNtRm4i3qUBpXBjr3JDQztf0rmfG570P2sItple7h1kDv1OP60+lUhJqK+dIX67Cs+RwriwDSQPnofKhYDSnui/WdUIQuLPMyHan+xcHYvRD9uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124236; c=relaxed/simple;
	bh=0MlasTOMcR8xXTcJx5WK+tCYqZ32QFe2MvhN4StNwlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PS+MAmkSe0sPzvV/1av2pRevQQXMopvy7ikRMCWXgRuHJHfQoVsXS36XBWM470F1yxiPsmpGrGIWg9pU50kFnoaJGJ0pNPrpEmzGqlRFMOvl07C+1K788u7ZfU0rfdGhj+a+7U+bkpwuuQAXR99LnN0j/pJGTWRFyZPIn4AQHmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=elzZj9Sm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sYdxRxYL; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 3C5CFEC01D0;
	Sun,  2 Nov 2025 17:57:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 02 Nov 2025 17:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762124231;
	 x=1762210631; bh=nRJhWD3kC4Y93l/io+o/aQP+zUJoGa3VOgCuzcePycQ=; b=
	elzZj9Smd3+fSW4l5DsthMVSltaO5gCL+UpanfXMjT8oYQSN5Z05MRCi7X1pTrjI
	URkjEK3E8ggU+/VceB6aHF0ojfJHxwyNrO4tEuMzBc7j28VijQkiAREr0EkJ9Oq+
	4TEmEW4Jj8PoV2DH63gwQ+r4odqNtMgjn5fUqZb1vIiRkg7oHcV1IsxY2mZJzTaQ
	YHkB7kfC6o0B9mCV8/FjixHvq6bLSRyKeJgf9Kaf/vsXLHhciBJ8vQkFLPAeetLQ
	7lU2oM4ce40zUrAZX2dcw+r9JyScqaVsHnTr1jMjea7j7ZhrrkK9hvtb8fIg1QOq
	hOZxfvf2zVTSp9sKsSgmpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762124231; x=
	1762210631; bh=nRJhWD3kC4Y93l/io+o/aQP+zUJoGa3VOgCuzcePycQ=; b=s
	YdxRxYLU/Yn/0v5YLePE2YRw+qritFCB9FYU4wXEv1MONiwJZw1rOqLaqlb3xT7K
	5icnOIqAPon96cNdh79vdJXRzhr4FZWYfKXqxnGgOPdyXNshxGsdSWCOpWxBfnAG
	KSQgAHf8Za2URnCzNZsAHwbikhW/R2zJ3hEn7X7oBg6L2ukhCNV8i3U7zN8OLxS/
	cxKdyIU+K8EaiY6zYRBES/pi1r/7du2pdvcA21kJQ1Ny/bZ3CiYp+QaPlBxnWK5Q
	BaMxB7zXuncL4LqEZtH1gsnWTiNLYV5FaIHBvQxAXSx6PDw+fUbEGnMeH2x76A8P
	bG+x2dtXaELegusU80uFw==
X-ME-Sender: <xms:xuEHafSQzenWBZTi-XyqdKDihJo0Wz3aOreB3rY0pOptbCBSD8riYw>
    <xme:xuEHaa1P_8edxCBpBTGDjADrZzvXQ339wvnqEuA6KyUtJHfLRZ0cTZAMQuajZemZW
    be3SOCbwola9IcViKtggs3q1TyaFGCpZREUxA3MnWuybKI51NHHO9ru>
X-ME-Received: <xmr:xuEHaUu2oHYx7LO679CBu56w_BLZluR4gtTL2ntgUl4zGbFPQgrcVqd4v9kmoTpJjwNTZHEazpQXhw6jOFfBvKh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:xuEHaQj7wYt48OYH9g9zs9VP3pV938i1tXafNVORkM7g-gy5XmagyA>
    <xmx:xuEHaV_QDbi4Aw4KRlyMmeDId5-9lqQElKuqO9M880IgSPV1gsRGcA>
    <xmx:xuEHaTswlLVmCyJ4HxoO3KY4eLvITSh51CbyPLK1rAV1gq4Z3-RGYQ>
    <xmx:xuEHaZoZEDxW8su8-9c7LfxbsegS4iXNAMcaPUh-QbNIZ1KlvpaBQg>
    <xmx:x-EHaWN4LmRUirGBY_qwC2SBekfea9-pP2780ULBgXvlKFezufn-Qerk>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:10 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 03/12] media: rppx1: Add support for AWB measurement parameters and statistics
Date: Sun,  2 Nov 2025 23:56:33 +0100
Message-ID: <20251102225642.3125325-4-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to parse parameter blocks configuring for the
auto white balance measurement window and parameters. As well as
producing the measurements as part of a statistics buffer.

This is the first ISP algorithm added to the RPPX1 driver and exercises
both the parameter and statistics API provided by the base driver. It
shows how the RkISP1 parameter and statistics buffer data can be scaled
and adopted to fit the RPPX1 hardware.

It also uses the parameter writing interface which allows the framework
user to specify how (and when) the configuration are applied to the
RPPX1.

As the RkISP1 parameters and statics buffers have lower precision then
the RPPX1 hardware the values needs to be scaled.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   4 +
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 127 ++++++++++++++++++
 3 files changed, 134 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 0bed0ee9d6f8..eb57f52ed676 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -24,6 +24,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
+			module = &rpp->post.wbmeas;
+			break;
 		default:
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index a5daa28e09cf..a6abb85f0df1 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -11,5 +11,9 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 	struct rkisp1_stat_buffer *stats = buf;
 
 	stats->meas_type = 0;
+
+	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS)
+		if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))
+			stats->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
index 3d197d914d07..126972cfd57a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
@@ -56,6 +56,133 @@ static int rppx1_wbmeas_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_wbmeas_param_rkisp1(struct rpp_module *mod,
+			  const union rppx1_params_rkisp1_config *block,
+			  rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_awb_meas_config *cfg = &block->awbm;
+	/*
+	 * The RkISP params are 8-bit while the RPP can be 8, 20 or 24 bit.
+	 * Figure out how much we need to adjust the input parameters.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 8;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_MEAS_PROP_REG, 0);
+		return 0;
+	}
+
+	/* Program measurement window. */
+	write(priv, mod->base + AWB_MEAS_H_OFFS_REG,
+	      cfg->config.awb_wnd.h_offs);
+	write(priv, mod->base + AWB_MEAS_V_OFFS_REG,
+	      cfg->config.awb_wnd.v_offs);
+	write(priv, mod->base + AWB_MEAS_H_SIZE_REG,
+	      cfg->config.awb_wnd.h_size);
+	write(priv, mod->base + AWB_MEAS_V_SIZE_REG,
+	      cfg->config.awb_wnd.v_size);
+
+	/* Set number of frames to sample. */
+	write(priv, mod->base + AWB_MEAS_FRAMES_REG, cfg->config.frames);
+
+	if (cfg->config.awb_mode == RKISP1_CIF_ISP_AWB_MODE_YCBCR) {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->config.awb_ref_cb << shift);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->config.awb_ref_cr << shift);
+		write(priv, mod->base + AWB_MEAS_MAX_Y_REG,
+		      cfg->config.max_y << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->config.min_y << shift);
+		write(priv, mod->base + AWB_MEAS_MAX_CSUM_REG,
+		      cfg->config.max_csum << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_C_REG,
+		      cfg->config.min_c << shift);
+
+		/*
+		 * Match RkISP1 conversion, documented as
+		 *  Y = 16 + 0.2500 R + 0.5000 G + 0.1094 B
+		 *  Cb = 128 - 0.1406 R - 0.2969 G + 0.4375 B
+		 *  Cr = 128 + 0.4375 R - 0.3750 G - 0.0625 B
+		 *
+		 * Note map Y to G. Matrix is GBR, not RGB documented for RPPX1.
+		 */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x0800);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x01c0);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0400);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0xfb40);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x0700);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0xfdc0);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0xfa00);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0xff00);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x0700);
+
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00100000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00800000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00800000);
+
+		write(priv, mod->base + AWB_MEAS_PROP_REG,
+		      cfg->config.enable_ymax_cmp ? AWB_MEAS_PROP_YMAX : 0 |
+		      AWB_MEAS_PROP_AWB_MODE_ON);
+	} else {
+		/* The RkISP params are oddly named, but do map to RGB. */
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->config.awb_ref_cb << shift);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->config.awb_ref_cr << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->config.min_y << shift);
+
+		/* Values from datasheet to map G to Y, B to Cb and R to Cr. */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x1000);
+
+		/* Values from datasheet. */
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00000000);
+
+		write(priv, mod->base + AWB_MEAS_PROP_REG,
+		      AWB_MEAS_PROP_MEAS_MODE_RGB |
+		      AWB_MEAS_PROP_AWB_MODE_ON);
+	}
+
+	return 0;
+}
+
+static int rppx1_wbmeas_stats_rkisp1(struct rpp_module *mod,
+				     struct rkisp1_cif_isp_stat *stats)
+{
+	struct rkisp1_cif_isp_awb_meas *meas = &stats->awb.awb_mean[0];
+	/*
+	 * The RkISP YCbCr/RGB mean stats are 8-bit while the RPP can be 8, 20
+	 * or 24 bit. Figure out how much we need to adjust the output
+	 * statistics.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 8;
+
+	meas->cnt = rpp_module_read(mod, AWB_MEAS_WHITE_CNT_REG);
+	meas->mean_y_or_g =
+		rpp_module_read(mod, AWB_MEAS_MEAN_Y_G_REG) >> shift;
+	meas->mean_cb_or_b =
+		rpp_module_read(mod, AWB_MEAS_MEAN_CB_B_REG) >> shift;
+	meas->mean_cr_or_r =
+		rpp_module_read(mod, AWB_MEAS_MEAN_CR_R_REG) >> shift;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_wbmeas_ops = {
 	.probe = rppx1_wbmeas_probe,
+	.param_rkisp1 = rppx1_wbmeas_param_rkisp1,
+	.stats_rkisp1 = rppx1_wbmeas_stats_rkisp1
 };
-- 
2.51.1


