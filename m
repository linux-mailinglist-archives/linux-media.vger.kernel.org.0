Return-Path: <linux-media+bounces-35054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A26ADC86A
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66762178E0F
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 10:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167E12DBF7B;
	Tue, 17 Jun 2025 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ev9wu7Uu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j+VeN7Ui"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E62DBF4C;
	Tue, 17 Jun 2025 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156420; cv=none; b=Hm70klS2czykimnSny/6GRkZ8KR+mdoBlfyCqdBfRr1mUx5eCtpNVnc7y3Y1uOOXX2h47xFJNND3Mc7tBj2zf3l1lTm7/8qcsAZdFCaYSCZU1wBI9l6IAKxsZwheC/v/2uHXVXQFhsY5K8HoyxMa1ztamBswsP9bWrhOKuGpa4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156420; c=relaxed/simple;
	bh=Bya3uqBkbCW85TEObzehML1DhaJQZDtmU99knDLG4Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvqcPZtDMioAcED03IlRB0wPHNMatJtqimU7MS1xTIx2iORNe/dRzm6Z6zrlZl9rcqF/eG9GOBP6/hC9bxHLMslw5cedu1KO4zlWknf63xRv38V4ctsMK0C6qe4GZvZFwrp7RwqXjj1lFNrXRc1dIAY3zbKGsu4AYvQgM6bTUU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ev9wu7Uu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j+VeN7Ui; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 81E6B11401AA;
	Tue, 17 Jun 2025 06:33:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 17 Jun 2025 06:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750156417;
	 x=1750242817; bh=Lgn27V+pMYq+QNkDzwxGj5SrO8SoMjjzqvXGMCFMTJA=; b=
	ev9wu7Uu64IXe9tEt8T2OunTNzEZPgSelWS6N0Z4KBBGjiAnokDuLCDpRcZ67PXM
	2wPwKSBCv1Dz+tVz+7Bibmmk9nYSTK8WqmIbaB/JLDlK06MlBeO/P+J7kuIu4viM
	xziqjCNh9TV5yIHtMW2fQOCkiicUK+dgmHCSY8ErguKnJ+A7iDRKd9mHg7TJ/QhJ
	g7Stvj/x8lTXYQo2MFfsr69hb9jRZhUOTfSieXdStNvibJGwHs7zV9X4OuAnJ12a
	Y4kljoN3rdPoQS/Ix8g4UN0ScoY6L4ChqVn8E461WeVHpAvuyThmtDaUABb1P99e
	S3eaZMnibvSHkrQAW1wWLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750156417; x=
	1750242817; bh=Lgn27V+pMYq+QNkDzwxGj5SrO8SoMjjzqvXGMCFMTJA=; b=j
	+VeN7UiNLUjQZ1DYc99zxc66jR32zcVTJ3yuWwIMRuKGeE3ebAAbEcfqGfFvWrgS
	VARVSAfdtpN9T6WSdXdhV+azK4RKuBpWnwBQ6+szI4y0PVP3nlX8+yDGl9majHuq
	Bv5W6ssJERdbVBXtXs/MiuqRFnPT/4VREzGiQVKFGrxXYzuvvm7B0N109Vi78X0n
	MPkRDyopqvT1br2YH4E5rERzod/Pc/2Nv351M83QIBoos7F8wDDErUkd81MApihq
	SV0aBJAPjrx8pcQpeDKZiJ/fe93mUYxCV0n6lpt7OeODPsRtfc/RZ11+x9YAvrPH
	ZeJN9Gdq+bQWVxilgb7mA==
X-ME-Sender: <xms:gURRaPCVUg_qs01679CAWGfmEO6kDOO7p_35_7KKYWWWh6FmQxD1fQ>
    <xme:gURRaFiTFVqsL0YQEd29SKXHTm8LO1JYUOczIjsn6nfXihPxqzpiNNf4Q6KQQ8RCB
    -LsGywkJVGo-F7Mq-0>
X-ME-Received: <xmr:gURRaKkkEdo3eTHw8DyxdnaqJwna5alB6iaLgHVGHOHXYhBrzXunpBBjBTbj-bUJnxVBBKUY-0LWVWBSgqMUuvM14A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvledtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrg
    hsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghr
    thesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvug
    hirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghn
    vghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhi
    khhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:gURRaBze697grFrWw_wyKkvdM8dbz36EB5pC-IoamBqZr9kld4n5Qw>
    <xmx:gURRaER-DhohhLk-JF-c8YWKR7HMHPhha40WqFwucbGIsTOmu1eBEw>
    <xmx:gURRaEZ3M_2q_hkyEM_9J4zjJOwyCQeMs8bWVomP_mg5zj5mzlGh8g>
    <xmx:gURRaFQ-OCcSvGvAV4K4RmH9c5dt_74jlUyMnzBxge0QCPWrMf5ENQ>
    <xmx:gURRaAd8A90Jg-P-nYg9s_r1P-1ZNTwRqk1m0acaIa8ktT7VbRzGvXOK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 06:33:36 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/7] media: rppx1: Add support for Auto Exposure Measurement
Date: Tue, 17 Jun 2025 12:31:58 +0200
Message-ID: <20250617103201.1594152-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617103201.1594152-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250617103201.1594152-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the RPPX1 driver to allow setting the EXM configuration using the
RkISP1 parameter buffer format. It uses the RPPX1 framework for
parameters and its writer abstraction to allow the user to control how
(and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  4 +
 .../platform/dreamchip/rppx1/rppx1_exm.c      | 89 +++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 61eee8f35013..deb88ff8b78b 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -29,6 +29,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS:
+			module = &rpp->pre1.exm;
+			break;
 		default:
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index a6abb85f0df1..d62b26e24cb0 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -15,5 +15,9 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS)
 		if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
+
+	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
+		if (!rpp_module_call(&rpp->pre1.exm, stats_rkisp1, &stats->params))
+			stats->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
index 0c40300e13ad..cc61112da7a0 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
@@ -10,6 +10,7 @@
 #define EXM_START_REG			0x0004
 
 #define EXM_CTRL_REG			0x0008
+#define EXM_CTRL_EXM_AUTOSTOP		BIT(1) /* HW doc says not supported. */
 #define EXM_CTRL_EXM_UPDATE_ENABLE	BIT(0)
 
 #define EXM_MODE_REG			0x000c
@@ -46,6 +47,94 @@ static int rppx1_exm_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_exm_param_rkisp1(struct rpp_module *mod,
+		       const union rppx1_params_rkisp1_config *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_aec_config *cfg = &block->aec;
+	const struct rkisp1_cif_isp_aec_config *arg = &cfg->config;
+	u32 h_offs, v_offs, h_size, v_size;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + EXM_MODE_REG, 0);
+		return 0;
+	}
+
+	/* RGB bayer exposure measurement */
+	write(priv, mod->base + EXM_MODE_REG, 2);
+
+	write(priv, mod->base + EXM_CTRL_REG, EXM_CTRL_EXM_UPDATE_ENABLE |
+	      arg->autostop ? EXM_CTRL_EXM_AUTOSTOP : 0);
+
+	/*
+	 * Select where to sample.
+	 * 0 - after input acquisition
+	 * 1 - after black level subtraction
+	 * 2 - after input linearization
+	 * 3 - after lens shade correction
+	 * 4 - after white balance gain stage
+	 * 5 - after defect pixel correction
+	 * 6 - after denoising
+	 */
+	write(priv, mod->base + EXM_CHANNEL_SEL_REG, 0);
+
+	if (arg->mode == RKISP1_CIF_ISP_EXP_MEASURING_MODE_0) {
+		/* Coefficients for a BT.601 BAYER (from datasheet). */
+		write(priv, mod->base + EXM_COEFF_R_REG, 38);
+		write(priv, mod->base + EXM_COEFF_G_GR_REG, 75);
+		write(priv, mod->base + EXM_COEFF_B_REG, 15);
+		write(priv, mod->base + EXM_COEFF_GB_REG, 75);
+	} else {
+		/* Y = (R + Gr + B + Gb) / 4*/
+		write(priv, mod->base + EXM_COEFF_R_REG, 128);
+		write(priv, mod->base + EXM_COEFF_G_GR_REG, 128);
+		write(priv, mod->base + EXM_COEFF_B_REG, 128);
+		write(priv, mod->base + EXM_COEFF_GB_REG, 128);
+	}
+
+	/*
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be divisible by 10.
+	 */
+	h_offs = arg->meas_window.h_offs & 0x1ffe;
+	v_offs = arg->meas_window.v_offs & 0x1ffe;
+	h_size = (arg->meas_window.h_size - 1) - ((arg->meas_window.h_size - 1) % 10);
+	v_size = (arg->meas_window.v_size - 1) - ((arg->meas_window.v_size - 1) % 10);
+
+	write(priv, mod->base + EXM_H_OFFS_REG, h_offs);
+	write(priv, mod->base + EXM_V_OFFS_REG, v_offs);
+	write(priv, mod->base + EXM_H_SIZE_REG, h_size / 5);
+	write(priv, mod->base + EXM_V_SIZE_REG, v_size / 5);
+
+	/* Set last measurement line for ready interrupt. */
+	write(priv, mod->base + EXM_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
+
+	write(priv, mod->base + EXM_START_REG, 1);
+
+	return 0;
+}
+
+static int rppx1_exm_stats_rkisp1(struct rpp_module *mod,
+				  struct rkisp1_cif_isp_stat *stats)
+{
+	u8 *meas = &stats->ae.exp_mean[0];
+	/*
+	 * The RkISP mean stats are 8-bit while the RPP can be 8 or 20 bit.
+	 * Figure out how much we need to adjust the output parameters.
+	 */
+	const unsigned int shift = mod->info.exm.resultbits - 8;
+
+	for (unsigned int i = 0; i < EXM_MEAN_REG_NUM; i++)
+		meas[i] = rpp_module_read(mod, EXM_MEAN_REG(i)) >> shift;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_exm_ops = {
 	.probe = rppx1_exm_probe,
+	.param_rkisp1 = rppx1_exm_param_rkisp1,
+	.stats_rkisp1 = rppx1_exm_stats_rkisp1,
 };
-- 
2.49.0


