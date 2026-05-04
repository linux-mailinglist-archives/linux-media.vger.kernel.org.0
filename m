Return-Path: <linux-media+bounces-60226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCwTAg3y92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:10:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA704B7E38
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 913333014504
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD711E832A;
	Mon,  4 May 2026 01:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="wYweQt2K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PfZeOHO5"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459B41C84BB;
	Mon,  4 May 2026 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856967; cv=none; b=RV4OMEiduhcPJP4dxl+FSp5Kmfed9ZnbDW1Q/PbT3FguZH2tqSM4sfqxtFHJQih2JE7SDSuDY8nSxB5zq0EZelXd+lW/S+ujbKm4Yq6w4ElF4SZdre97Gy/J3cFAepjcCE0fyxR0ifE0aC6mpI2SHe1Buq7lgaH7gjNWGo75wG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856967; c=relaxed/simple;
	bh=1JOx4buRaqy7ZCKbFNddsStC5O64q+nBTD/mNssUk34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oEA3OclidhkZ5DwLrQ+xBECpDcnpdLVJV2n5qYJm4wc97+mvwgi+vgYSvi6Jj11RxVSKrY61b87CQUL2cuQdNQuPOS3gubG4aRII03Xgq7fOx/qkG65kwo+pSWdVpkR0wAoX7q4bYGRVTD1h8SLLbdW7pHPTQclFadyVwAhV6DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=wYweQt2K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PfZeOHO5; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 697DF7A00AF;
	Sun,  3 May 2026 21:09:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 03 May 2026 21:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777856961;
	 x=1777943361; bh=7oZ4icoRWnKqdCHZ6th+2SLLP2ppq2IGfqgYbvI+JLQ=; b=
	wYweQt2Kh/764uCysuBU2SDRYoBMMLg5b4ZqIusQiXBAm6jenxErnOGFg77EXDMA
	iy7j9SaaV9uL564nTtfmGy2/rYqb1I1Za/gZoqUg9vuTBGjwwWp20qr1K7amtkha
	VNqat5vIufJBcyf2UePzY0Qf3ez35BC/wHYIgmQll4YzqJGXuRRlfG5Iz++tHnOr
	JPbNfWafCFaanpzvNPXSkYfmjqnET5pTm2+gSe86erxLgie/IZzN83WRtswhV//a
	99A1k912LwqUxgq5XZTJXbvg19U+Q5n21O3nfyM5fYBhQ32bvwyRU77yqRzbUpQa
	MuQHSgGyN5Ghp1fleZsAsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777856961; x=
	1777943361; bh=7oZ4icoRWnKqdCHZ6th+2SLLP2ppq2IGfqgYbvI+JLQ=; b=P
	fZeOHO5715S/7qEziJmSDCD4O0/C9orOaqPpeO2sFq+C6myxoCST5p13tFHRjDej
	kF32LB5aStd8F8J3KelrFjAnFaE+TngxzrjD5hJVSYELmqr7e3xmyq0wJqeoXlkt
	YmkvNei/LgBhakGszodG1c46Au6Dt0P3K6Kx3ZVmGu70UWfQGmBdfgFf1R1wsI5O
	oWHpzIIbm6f0eL2jSObL0AEQ0ERYwuxPUyoGaRZ6r5U2p2Sx+Isyf/5n/2D4Rs74
	XvkNceQYlc6H6eTiQFcbKvi9/vzMiA5XIlDA2sNIy/XVrHu6IylhnMPAWDPhNNG1
	KwuWO8WHpnkuE4gNiNvXw==
X-ME-Sender: <xms:wfH3aXacO4mAizGJ4pzOdi8fSMO211fII5pMLL1QWSSXdVXMa39_sg>
    <xme:wfH3aW1YXZ82QhfWU8OM5n5-46KYc0vW21fpu9DPwsIK66BC_AW0E6dBnFv3enkZX
    0HPp-CeoPSV_sXi1q7sK2O5TfLe_S-ebVAuOg69XThw3f2g5qqA8A>
X-ME-Received: <xmr:wfH3aaqQs4sbdKSQpXuX_aIpPkVavV3D9Z48BkTlo9IM7SetuQ1_sqjzA_ajKzMRJkmNMt_D6QYLt27WrPVO9Kz3eXEwSKgYeUqJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
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
X-ME-Proxy: <xmx:wfH3aVM78Q8QCf6aDG4iep6gdkkVwTb6x5NMRtiBPqOGL-eGJcWzsQ>
    <xmx:wfH3aToNLaM6v2wwWG1zvTzl3mbBv29U4sI-A-P97TdiujanpV_Jxg>
    <xmx:wfH3aQu__aFNSNI5HqPznYGwtISeJDf0TTPT4-5nDSfrqg3wcxzRsw>
    <xmx:wfH3aa0R8Pb10aS9hlcOcfsqNoEjDB4DRW1sSBLWJ6Db8-5bjPXFFQ>
    <xmx:wfH3abXN9n6vWKlRgpx_OIhoKvKWF9sf_fVw6yrpPw9rdQL60trtsJt_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:09:20 -0400 (EDT)
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
Subject: [v8 12/14] media: rppx1: db: Add support for debayering filters
Date: Mon,  4 May 2026 03:05:54 +0200
Message-ID: <20260504010556.2796398-13-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: DBA704B7E38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60226-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Extend the RPPX1 driver to allow setting the debayering filters
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  2 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  7 ++
 .../media/platform/dreamchip/rppx1/rppx1_db.c | 82 +++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 58 ++++++++++++-
 4 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 830ef0df7228..064da13082fe 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -88,6 +88,8 @@ union rppx1_params_block {
 	struct rppx1_bls_params bls;
 	struct rppx1_lsc_params lsc;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_db_demosaic_params db_demosaic;
+	struct rppx1_db_filter_params db_filter;
 	struct rppx1_ccor_params ccor;
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 317ed715f1de..3320ca3998bd 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -22,6 +22,8 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(DB_DEMOSAIC_POST, db_demosaic),
+	RPPX1_PARAMS_BLOCK_INFO(DB_FILTER_POST, db_filter),
 	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
@@ -74,6 +76,11 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST:
+		case RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST:
+			/* Both types handled by the same block. */
+			module = &rpp->post.db;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
 			module = &rpp->post.ccor;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
index 5e233896cfc8..5571b3a9562d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
@@ -39,6 +39,88 @@ static int rppx1_db_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_db_fill_params_demosaic(struct rpp_module *mod,
+			      const union rppx1_params_block *block,
+			      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_db_demosaic_params *cfg = &block->db_demosaic;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DEMOSAIC_REG, 0x400);
+		return 0;
+	}
+
+	/* Native threshold is at RPP 16-bit precision. */
+	write(priv, mod->base + DEMOSAIC_REG, cfg->demosaic_th);
+
+	return 0;
+}
+
+static int
+rppx1_db_fill_params_filter(struct rpp_module *mod,
+			    const union rppx1_params_block *block,
+			    rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_db_filter_params *cfg = &block->db_filter;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + FILT_MODE_REG, 0);
+		return 0;
+	}
+
+	/* Native values are at RPP 18-bit precision. */
+	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->thresh_bl0);
+	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->thresh_bl1);
+	write(priv, mod->base + FILT_THRESH_SH0_REG, cfg->thresh_sh0);
+	write(priv, mod->base + FILT_THRESH_SH1_REG, cfg->thresh_sh1);
+
+	/* Native values are at RPP 8-bit precision. */
+	write(priv, mod->base + FILT_FAC_BL0_REG, cfg->fac_bl0);
+	write(priv, mod->base + FILT_FAC_BL1_REG, cfg->fac_bl1);
+	write(priv, mod->base + FILT_FAC_MID_REG, cfg->fac_mid);
+	write(priv, mod->base + FILT_FAC_SH0_REG, cfg->fac_sh0);
+	write(priv, mod->base + FILT_FAC_SH1_REG, cfg->fac_sh1);
+
+	/*
+	 * The lum_weight field is provided in RPP register format:
+	 *
+	 * 31		unused
+	 * 30:28	lum_weight_gain
+	 * 27:24	unused
+	 * 23:12	lum_weight_kink
+	 * 11:0		lum_weight_min
+	 */
+	write(priv, mod->base + FILT_LUM_WEIGHT_REG, cfg->lum_weight);
+
+	write(priv, mod->base + FILT_MODE_REG,
+	      (cfg->chr_v_mode << 4) |
+	      (cfg->chr_h_mode << 6) |
+	      (cfg->grn_stage1 << 8) |
+	      (cfg->mode ? FILT_MODE_FILT_MODE : 0) |
+	      FILT_MODE_FILT_ENABLE);
+
+	return 0;
+}
+
+static int
+rppx1_db_fill_params(struct rpp_module *mod,
+		     const union rppx1_params_block *block,
+		     rppx1_reg_write write, void *priv)
+{
+	switch (block->header.type) {
+	case RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST:
+		return rppx1_db_fill_params_demosaic(mod, block, write, priv);
+	case RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST:
+		return rppx1_db_fill_params_filter(mod, block, write, priv);
+	}
+
+	return -EINVAL;
+}
+
 const struct rpp_module_ops rppx1_db_ops = {
 	.probe = rppx1_db_probe,
+	.fill_params = rppx1_db_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index d173c0c1bfc0..378b18dbc48d 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -91,6 +91,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST: Debayer demosaicing
+ * @RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST: Debayer filtering
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -109,6 +111,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
 	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
+	RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST,
 };
 
 /**
@@ -544,6 +548,56 @@ struct rppx1_ga_params {
 	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
 };
 
+/**
+ * struct rppx1_db_demosaic_params - Debayer demosaic configuration
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST)
+ * @demosaic_th: threshold for texture detection, 16-bit
+ */
+struct rppx1_db_demosaic_params {
+	struct v4l2_isp_params_block_header header;
+	__u16 demosaic_th;
+};
+
+/**
+ * struct rppx1_db_filter_params - Debayer filter (denoise) configuration
+ *
+ * RPP-X1 thresholds are 18-bit and factors are 8-bit.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST)
+ * @mode: filter mode
+ * @grn_stage1: green filter stage 1 select (range 0x0...0x8)
+ * @chr_h_mode: chroma filter horizontal mode
+ * @chr_v_mode: chroma filter vertical mode
+ * @thresh_bl0: If thresh_bl1 < sum_grad < thresh_bl0 then fac_bl0 is selected (blurring th)
+ * @thresh_bl1: If sum_grad < thresh_bl1 then fac_bl1 is selected (blurring th)
+ * @thresh_sh0: If thresh_sh0 < sum_grad < thresh_sh1 then thresh_sh0 is selected (sharpening th)
+ * @thresh_sh1: If thresh_sh1 < sum_grad then thresh_sh1 is selected (sharpening th)
+ * @lum_weight: luminance weight, min (bits 0:11), kink (bits 12:23), gain (bits 28:30)
+ * @fac_sh1: filter factor for sharp1 level
+ * @fac_sh0: filter factor for sharp0 level
+ * @fac_mid: filter factor for mid level and for static filter mode
+ * @fac_bl0: filter factor for blur0 level
+ * @fac_bl1: filter factor for blur1 level (max blur)
+ */
+struct rppx1_db_filter_params {
+	struct v4l2_isp_params_block_header header;
+	__u32 mode;
+	__u8 grn_stage1;
+	__u8 chr_h_mode;
+	__u8 chr_v_mode;
+	__u32 thresh_bl0;
+	__u32 thresh_bl1;
+	__u32 thresh_sh0;
+	__u32 thresh_sh1;
+	__u32 lum_weight;
+	__u32 fac_sh1;
+	__u32 fac_sh0;
+	__u32 fac_mid;
+	__u32 fac_bl0;
+	__u32 fac_bl1;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -566,7 +620,9 @@ struct rppx1_ga_params {
 	sizeof(struct rppx1_lsc_params)				+	\
 	sizeof(struct rppx1_lsc_params)				+	\
 	sizeof(struct rppx1_ga_params)				+	\
-	sizeof(struct rppx1_ga_params))
+	sizeof(struct rppx1_ga_params)				+	\
+	sizeof(struct rppx1_db_demosaic_params)			+	\
+	sizeof(struct rppx1_db_filter_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


