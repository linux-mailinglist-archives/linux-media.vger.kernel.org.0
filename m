Return-Path: <linux-media+bounces-42571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D7B582FF
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B334C3455
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A8C2C2341;
	Mon, 15 Sep 2025 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="llvArw2V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aOBWhdI8"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799102BDC2A;
	Mon, 15 Sep 2025 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956240; cv=none; b=l3xTnIy5ECEUjEYGCW/S3ryfJAKFuvCovDOCYn+9XUDp0/L0zV0JR1R9/SH/8tJm/Dbv8ky411Fq06uN2ptJt8R3/ZdePjHNHDwno6TGDLGi3o4ALgVDA4BieP9n7+FkiwnywJwdvdm/Bw2xvBHmJTisg9GUEe+oZXkXEUXYtNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956240; c=relaxed/simple;
	bh=W23WvG6i/eXMgyq45Wiam5ZNV3mhM9OYpsBzb1xe04U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qz5CUjMvy+oJGrJpGoeiuJsnu2OpLdWiDQa26SMjcagEEKXTrrqQEPxzRnuUYcgi5S/omaIW2ljRhTXL9JblDwSBzwt2AVaUgsaEBNClnafxxZaHzSRw0XQ7gz3pW/Gk3fAmqbfkNP/XbyhHUB2xsvVxsE7hd/PQocnwXUuaViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=llvArw2V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aOBWhdI8; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 567437A016C;
	Mon, 15 Sep 2025 13:10:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 15 Sep 2025 13:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956237;
	 x=1758042637; bh=xuDFp1RtM2AFEnQwJl6rEVVX3JlEN/BoW+rZvEASSyY=; b=
	llvArw2VrN1DGSTrQFB+sVIhUxGQT4XX2zOGEX0lyxJHQkeLRbGS3a48OFjyg+bT
	ohDuN0gCxJ+57E+dwjMC8SJ/CVsPNo3FTvJijLW/19cPBSsX9OGYeUo7dP661Dt2
	mM/bClFA1H+++MeGD3k3Ms4dEIAtrEpx1spi/FxJnf67bq2BebaspVds+FUG1rRl
	i2HABv6kWhNcuG/xXm7zZtA1PGxn/3zjkuHks9UbPMNwa9afT6a3wtnupd9fyFYk
	o3VrGiv82Vyr+1CrHBYM3hOMDNOU4BWl1EHC9QbE/5nYTzuIovCS4PSu3JXAfMk/
	OOTGvmZD/MLbbho8hGT7MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956237; x=
	1758042637; bh=xuDFp1RtM2AFEnQwJl6rEVVX3JlEN/BoW+rZvEASSyY=; b=a
	OBWhdI8eQZ8vEmOdU+g2+Tx3HBgbp43IU7KE97zYA9NO9SeBPaJRBoGWFHdEuXke
	ZjeOSXgcHLTrH4N8Fw9prUcu17H+WlfWO+zvryNUouFUcA0zHH6G1gfRDi0HsJ48
	+cYB+JEvZ4XPIUzydpdspaAZrnYKBVXwTX+MQXt3hS+6nn9ThN3FSUDokG4HICMO
	QFlQk6nqynVDCuDbjSMlw/ZcuzA1wNORkjjHCFxqQMTs1PgPiZVO2Drs1p+rh79f
	Uum/HrifQN1Kdh+TgkCE09zyuGyvrNL8tqLUOnBGquZoGJnd2BpE1pIrLmPXL/JR
	zzcm9NohqC8FREX2PmiHw==
X-ME-Sender: <xms:jEjIaOHBzCWf7_08CWAHmbKuCiwdSFu1At4eJp0ghM4VXeoSP9gvmg>
    <xme:jEjIaG8OpVsa1ovAUC0K-mrUwj1mvxgRdkLlVJYwJFs2pvXvMEp5CbIziFkgZh-zm
    fsBnNI1Cuevaai4vlQ>
X-ME-Received: <xmr:jEjIaFza-27pqpPDHSFvET_pClYRVJ6olvP2AowQjz4TS9U2CuPuDAuvNpAzjWyNydVBI-evyTYuvqv-HMomu_Bm0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhgu
    odhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:jUjIaCNfxy9L1QbapMomDYvCfVy4cfkGwsDaj0vKZXc9lusgCWBFlg>
    <xmx:jUjIaK8RivpluLq7_v_7jcHrvu0VIp6qdAOsHU4XY_Sh1iA7kN2OyQ>
    <xmx:jUjIaP5PP_AU4SyLseW6ZRzJGHcmRleZHaoldKdFALlrKSQJAtHRng>
    <xmx:jUjIaA5Bsw_2fxo5khZeKlqoeS4JNdLAYXDqptUtlkJ0ZQ0QrtOelw>
    <xmx:jUjIaN6brNM0hHWFJla83d5-mWMJ2AKJzNiRUdaws3Cwt5VEe0DpvwFj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:36 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 05/12] media: rppx1: Add support for Auto Exposure Measurement
Date: Mon, 15 Sep 2025 19:07:36 +0200
Message-ID: <20250915170743.106249-6-niklas.soderlund+renesas@ragnatech.se>
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
index a561c01bda9a..bff525970478 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -30,6 +30,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
index 0c40300e13ad..c9478ea5f851 100644
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
+	write(priv, mod->base + EXM_CHANNEL_SEL_REG, 6);
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
2.51.0


