Return-Path: <linux-media+bounces-35056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3EBADC872
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68A6E7A739A
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 10:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395512DBF4C;
	Tue, 17 Jun 2025 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="B/WwZhe4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wbfnqg+u"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05D2DF3D2;
	Tue, 17 Jun 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156425; cv=none; b=spnXUTRNnijEZhSl1BCLxrpaVRYxHpTcXN/prqtEctRKp+QnwozNH8XqunuQCPcJJMSsu+TaWxf2BZ2DQSyz/iLPcPjIY2ToOabH3xGhoNGI2TVOcSQq/unIuYmk801Zd1k+xhcu7LpLKThIstwVJ7b7muNnb95PA29BvfAk4YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156425; c=relaxed/simple;
	bh=ejxzrsdItkeT90ZDY4LNwFUW85vFQaIiAyfx07UNR8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k24aqu5z8hyJqS3tKihVBEI0jgeZXkvMdS37E0CyJ7XvMv/By1iipE9hUY1iQhhcKyTrFHeaP+hrf09VTf66UCoEtBmpMlFR2FAuborqKunqjCo8lrY7G0NPU321lRIASOcRIVQl3e/hBxJSRFcEDXzBu0C6wkzo136qj+G+kvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=B/WwZhe4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wbfnqg+u; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 4EDB5114014B;
	Tue, 17 Jun 2025 06:33:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 17 Jun 2025 06:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750156422;
	 x=1750242822; bh=4AtIpTijIj7adp6J5pw1qaohHPRlNP0puIBvVuymZhM=; b=
	B/WwZhe4y55x7Quh1bzffE1qNErEByGTe6WpXb4ZXFYiouVa/6pGEqrjNSkjHfEe
	Hmx9yzCtQ4orDFDkcNEpYh1csIgv5kZnOz/8clEBQQm7Brilu8uTjXfS2cwJpCBX
	6sHsgQ5dszfMpRcEgAvmIOeeaWGQQA/eRQ0beFDMnbEWa2xx8PozB2XpkTjRhFmD
	jG2DKmBJRwMfYofQVSiUxHaXtCVCm9MtxkaiKcL8SZaq5aJR3h5hU6BoyrzAsd4W
	G5JeOJW0iP5le3FQjLNZAKgXysmpmULhMOh1nGb1LvCwjUN2xM3SyLFxhZwV3SNR
	8XhRAqthf1AFOEcMPD4VHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750156422; x=
	1750242822; bh=4AtIpTijIj7adp6J5pw1qaohHPRlNP0puIBvVuymZhM=; b=W
	bfnqg+uuWWKmOSfeTllOnm9id9te0xeBDWpsBfbpwAlGFBEcBTs+p+Y5wJ9/8hvE
	jCvfqRRA+0mDLI015X4Y0aqO8Qlr9ndsaeqty5htvrxcY8uOr6jZSrzz138dKK+S
	VPk2d86i6HdSkn6365OPQLkzgKCRSItXe3eISfHY+Z/2W8+jEx0yZ59wxWl6TCbT
	XuActa7+pmEb00pA7pIZ+mJEKdgiv1+kS+MOWNI3UyMt7OacVeHT+zf6LNArRNkw
	S9ni0zEaUSY95INv2q2bK7yIlAfTnLak8gsXZmciW5P4MLSylPZCsZ2LtFsq8gbl
	d0BECXxaJljq1Dc1ihnJg==
X-ME-Sender: <xms:hURRaBZYmKpB_PGspcsgmV6rLVwIvShqieRzqC5jCoRneus54eebHQ>
    <xme:hURRaIZhPxK2DSMdTx0VW8j6v3-XbN5K60Yo964ooJtznfCz-Dlm7St90AwElkItL
    Erw8VC9dZjvSONBDQk>
X-ME-Received: <xmr:hURRaD9Cg8kLouFKRdkXm-jMObbk7x0W1LgOjGNt_9ERU-3US_SC_0ZlMRTnnav-zBOLKJ7ZMaf2a-pWjSz4PQklnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvledtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepkeehteffudektdekieejveeiheelgfefkedvjeeuleehkeefudetvddute
    effeeinecuffhomhgrihhnpehfihigvggupghvrghlrdhgrhdpfhhigigvuggpvhgrlhdr
    ghgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnh
    hikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghp
    thhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghs
    ohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughi
    rgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvg
    hsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikh
    hlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:hURRaPo6X7PbqoSdke23W57weGbdum_6ry2a2h-uFoFmaUms1wORSw>
    <xmx:hURRaMp8RFU7OR35kBRXK1dPo_l9zK8UOrIgzkK9Ca0GWRYWg9aU6A>
    <xmx:hURRaFQ6ZY2RUtdpSGuuGsqoEyLSvy--2SV56ZdFlOBlgW-MngmTqg>
    <xmx:hURRaErfjjYt-0WVrTwibodSaZJDNCHU3rsSbjuhrVJ-ABwuCE1k5w>
    <xmx:hkRRaFXh28akDB0FifkUD7wmyy89eFro4SazIGkeRE3xfTYsyuesn5WF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 06:33:41 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 6/7] media: rppx1: Add support for Black Level Subtraction
Date: Tue, 17 Jun 2025 12:32:00 +0200
Message-ID: <20250617103201.1594152-7-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Black Level Subtraction
(BLS) configuration using the RkISP1 parameter buffer format. It uses
the RPPX1 framework for parameters and  its writer abstraction to allow
the user to control how (and when) configuration is applied to the
RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   5 +-
 .../platform/dreamchip/rppx1/rppx1_bls.c      | 116 ++++++++++++++++++
 3 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 5ab2e2a6bcbd..8c81f371f75e 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -23,6 +23,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS:
+			module = &rpp->pre1.bls;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->post.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index 059bd76ecf64..1bffa6dd35f8 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -20,8 +20,11 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 		if (!rpp_module_call(&rpp->post.hist, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
 
-	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
+	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
 		if (!rpp_module_call(&rpp->pre1.exm, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
+
+		rpp_module_call(&rpp->pre1.bls, stats_rkisp1, &stats->params);
+	}
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
index de7008befd8e..164bc4a63c23 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -5,6 +5,7 @@
  */
 
 #include "rpp_module.h"
+#include "rppx1.h"
 
 #define BLS_VERSION_REG				0x0000
 
@@ -54,6 +55,121 @@ static int rppx1_bls_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static void
+rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
+{
+	static const unsigned int swap[4][4] = {
+		[RPP_RGGB] = { 0, 1, 2, 3 },
+		[RPP_GRBG] = { 1, 0, 3, 2 },
+		[RPP_GBRG] = { 2, 3, 0, 1 },
+		[RPP_BGGR] = { 3, 2, 1, 0 },
+	};
+
+	/* Swap to pattern used in our path, PRE1 or PRE2. */
+	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
+		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
+	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
+
+	for (unsigned int i = 0; i < 4; ++i)
+		output[i] = input[swap[pattern][i]];
+}
+
+static int
+rppx1_bls_param_rkisp1(struct rpp_module *mod,
+		       const union rppx1_params_rkisp1_config *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_bls_config *cfg = &block->bls;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + BLS_CTRL_REG, 0);
+		return 0;
+	}
+
+	u32 ctrl = BLS_CTRL_BLS_EN;
+
+	if (!cfg->config.enable_auto) {
+		static const u32 regs[] = {
+			BLS_A_FIXED_REG,
+			BLS_B_FIXED_REG,
+			BLS_C_FIXED_REG,
+			BLS_D_FIXED_REG,
+		};
+		u32 swapped[4];
+
+		rppx1_bls_swap_regs(mod, regs, swapped);
+
+		/*
+		 * The RkISP params are 12-bit + 1 signed bit, while the RPP can
+		 * be 12, 20 or 24 bit + 1 signed bit. Figure out how much we
+		 * need to adjust the input parameters.
+		 */
+		const unsigned int shift = mod->info.bls.colorbits - 12;
+
+		write(priv, mod->base + swapped[0], cfg->config.fixed_val.r << shift);
+		write(priv, mod->base + swapped[1], cfg->config.fixed_val.gr << shift);
+		write(priv, mod->base + swapped[2], cfg->config.fixed_val.gb << shift);
+		write(priv, mod->base + swapped[3], cfg->config.fixed_val.b << shift);
+	} else {
+		write(priv, mod->base + BLS_SAMPLES_REG, cfg->config.bls_samples);
+
+		if (cfg->config.en_windows & BIT(0)) {
+			write(priv, mod->base + BLS_H1_START_REG, cfg->config.bls_window1.h_offs);
+			write(priv, mod->base + BLS_H1_STOP_REG, cfg->config.bls_window1.h_size);
+			write(priv, mod->base + BLS_V1_START_REG, cfg->config.bls_window1.v_offs);
+			write(priv, mod->base + BLS_V1_STOP_REG, cfg->config.bls_window1.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN1;
+		}
+
+		if (cfg->config.en_windows & BIT(1)) {
+			write(priv, mod->base + BLS_H2_START_REG, cfg->config.bls_window2.h_offs);
+			write(priv, mod->base + BLS_H2_STOP_REG, cfg->config.bls_window2.h_size);
+			write(priv, mod->base + BLS_V2_START_REG, cfg->config.bls_window2.v_offs);
+			write(priv, mod->base + BLS_V2_STOP_REG, cfg->config.bls_window2.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN2;
+		}
+
+		ctrl |= BLS_CTRL_BLS_MODE_MEASURED;
+	}
+
+	write(priv, mod->base + BLS_CTRL_REG, ctrl);
+
+	return 0;
+}
+
+static int rppx1_bls_stats_rkisp1(struct rpp_module *mod,
+				  struct rkisp1_cif_isp_stat *stats)
+{
+	struct rkisp1_cif_isp_bls_meas_val *bls = &stats->ae.bls_val;
+
+	static const u32 regs[] = {
+		BLS_A_MEASURED_REG,
+		BLS_B_MEASURED_REG,
+		BLS_C_MEASURED_REG,
+		BLS_D_MEASURED_REG,
+	};
+	u32 swapped[4];
+
+	rppx1_bls_swap_regs(mod, regs, swapped);
+
+	/*
+	 * The RkISP BLS stats are 12-bit while the RPP can be 8, 20
+	 * or 24 bit. Figure out how much we need to adjust the output
+	 * statistics.
+	 */
+	const unsigned int shift = mod->info.bls.colorbits - 12;
+
+	bls->meas_r = rpp_module_read(mod, swapped[0]) >> shift;
+	bls->meas_gr = rpp_module_read(mod, swapped[1]) >> shift;
+	bls->meas_gb = rpp_module_read(mod, swapped[2]) >> shift;
+	bls->meas_b = rpp_module_read(mod, swapped[3]) >> shift;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_bls_ops = {
 	.probe = rppx1_bls_probe,
+	.param_rkisp1 = rppx1_bls_param_rkisp1,
+	.stats_rkisp1 = rppx1_bls_stats_rkisp1
 };
-- 
2.49.0


