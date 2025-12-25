Return-Path: <linux-media+bounces-49543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C8CDDF74
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 549A730010E0
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1718279324;
	Thu, 25 Dec 2025 17:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="f4YEzXSj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A6kisWAF"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FA1239E81;
	Thu, 25 Dec 2025 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682695; cv=none; b=pb64mWUSPkNb+PAzz+vV+hh5kwtgHPfsklPDMdhLc8RkOl+VMRR/mTgevjQnBjdfw5g9heRu3IhTtYzBsOiYmeM3mvniytgXyFnen2pNX+6Xst3Y5aiGfM+MHlkUyBF7JpgxaRpA0gN9tHDqDfh2JYasGLa6iZ6PwC7eRjDuktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682695; c=relaxed/simple;
	bh=zvXpol08nvdRMRKww5uA3EGyd1PZOE9FwFDI8a4fKlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGQMhR8rq4fEbrvcDsTLNurXjJHLZ4vXRKdJ1D0z9L78jCxkUMEaUChZudmMu8xGFdyvA0NEWfV4npbBY0as2BuPMmCcloz0SC7lOjN8HJMhC/V09WWWbWk3InuoXaz8S7Ku80+dp65zEp2j/oGB29psZBujai6pK4FJ2BmlS0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=f4YEzXSj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A6kisWAF; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E69D31400041;
	Thu, 25 Dec 2025 12:11:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 25 Dec 2025 12:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1766682692;
	 x=1766769092; bh=tNveRsrSYmKZi9g9HCuY5qnLQf/lkZHwjJQ68/pMNDA=; b=
	f4YEzXSjBHacnNk4Zktu1wIr5dZ8Vyu3nxSjhAHHeHiymH3ufrn4B4UG2+CTyz/e
	ZWcmRoo1neIIdoSjqXBD+g9JMBuay1nia/61Qp2+E01+OhuH1X84wcEyyKndTwYt
	xVuHsBgWOUn/LCIPg0rlbWGCWQsxNeMLAnKsVj1wcvl+qjOVxVEODGz3TOq9pwAE
	2KBREtARjwfKmpw2z2XIQ9nnIyGdBYLLzicfuX4E070uHRybkn9soAF7nQffzp5N
	uXVI0VsORTCcMW/RCKQJM2WA0c8lwcUdjQllmXRH1ujsJgOPzDKhUUVB1bNExLdW
	46rensx/4u2VRwFebORSJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766682692; x=
	1766769092; bh=tNveRsrSYmKZi9g9HCuY5qnLQf/lkZHwjJQ68/pMNDA=; b=A
	6kisWAFt/9VKaJu+vbXibGVAuYfVz+pj7g2AgJ70QAv11xP8RygHJOuFt6eehIor
	VEVK7iDrUfBVvuR3ux4ijFmMSd+7hjSG/vs6rrMDRHaVdggrWT9eqyI09aVdx8gj
	A7ww4AG1iiSuy/VyiH22WKoG4wKNh8t4O6YdSns+D29eDtgMuWwK2p00r+z+qsEe
	z7ZjdqgrN8ZPmS7/YSrhwXSPKJx9P90VfNqoVIoDEdqQONwO6XQ3c9UVBD1+Dowq
	Mgiw/TtUCFNxVAAnnVoqLlj+qpjqQvn/0yP9RGld64sDtfunv2pNfAMZgopECJbq
	g+FivK6IWSHcf/V/zS/hw==
X-ME-Sender: <xms:RHBNaWx2L-pxGg-itNvwoV0iEiv2ZRiS7jzUTi-3d5kxy94Vs_5YqA>
    <xme:RHBNaSsqzD8GuOpyrCaLFnl-aaTd6UsTUze01dFospqnj1HaVjy9uUkG70eahOl5z
    8le0ic1JIrotmmLwp5-E7Qwon7FmhZwBvPFC1gPG9DjnCARD2_jKRg>
X-ME-Received: <xmr:RHBNaZCSe4oj9a_QF2sJhTsyLFk_0l0X-vrf_whVRQouFE3cEgLIOpF7SW48SnnIRcf8q-16r18FL3B8GQRMQ6SJ>
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
X-ME-Proxy: <xmx:RHBNaUGu1nDVCmdZf5pE9o8GKTNeSxdFcwyNIg0B_fQi4tRwzFrQWw>
    <xmx:RHBNaZDQiGFm2-LBZ2ix_dXEQg0TLhU126Ok9h06uZmcGzNR3VkcdQ>
    <xmx:RHBNaaku18cRF7K-gEmQs-N82x0IhmonJRkyccD_X10Wm21D5GjYeQ>
    <xmx:RHBNafOLdFgtAiTZJzaBD8C24kfbY1faBYgGW-_hbYmYITdIOe_EIQ>
    <xmx:RHBNaUGpFs9sNL5M0AOu1OWTPzlAc9VVxYW9bia3w6oVL2xmT1OUQ_9->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:32 -0500 (EST)
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
Subject: [PATCH v5 03/12] media: rppx1: Add support for AWB measurement parameters and statistics
Date: Thu, 25 Dec 2025 18:10:45 +0100
Message-ID: <20251225171054.1370856-4-niklas.soderlund+renesas@ragnatech.se>
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
Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   4 +
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 127 ++++++++++++++++++
 3 files changed, 134 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a17a6ce82928..6e49f0e90c41 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -26,6 +26,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.52.0


