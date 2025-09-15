Return-Path: <linux-media+bounces-42573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A695B58307
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7ECA2033A2
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C822DEA83;
	Mon, 15 Sep 2025 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="g7F7yn7j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hyTdSzgV"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B892C08BD;
	Mon, 15 Sep 2025 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956244; cv=none; b=qSTdcR0o55WIbl5UyTtCI6IeXeLjW+fB37xW8znFiiMHJd/pJK23BuOxHXfS3D0CQpBRxkJh6elNto6S+ofR8OnvLQtg30Gr4G1uVJgnmM+ekID2u26USDhFWTyAnkSoj0cGYsaQvkm2OQM0NTA/IHq6Kc22AG8oJVwfyqU1fKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956244; c=relaxed/simple;
	bh=mPOPgNID57f+GH1HOa0O4vfR2JBuImkSJRSRhRk48Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cc2f2dn626TpZK+uliGdKsHcc+4Av7BNDN0F6+XxgNWqARp7KeSyBA0rSGB/QyQhqVuJwZOACPYhQIBtTP6EOj4XcvADVAUlzLmW4hQGS9yAOAlfQ4ObZmEq5D4eXXOI9+HvIkuL6Qh3qtzKgQ/RyDGWSwquaF4kCqWGcBH9SA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=g7F7yn7j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hyTdSzgV; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CAD5D7A016C;
	Mon, 15 Sep 2025 13:10:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 15 Sep 2025 13:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956241;
	 x=1758042641; bh=mAJtIlDWRgExlwUw4LeBdysX++mXrqNhzg2vRb4wAn0=; b=
	g7F7yn7jaEvFVqT0jf8xX6O2BxwARqgX0wkfur3Lxq9bAUNerpBVUTtzzfoKiYOc
	prkcuw+pR2RYqsWDoPVZbbiFGV+SDBLzvMaRZ2Cmym9jMlWSb3br4zJH18Dakryg
	UyjRV80oBO2sG4JpRdQBSZltB0I7lTfy9/vpTORC0ivhI9eG5t5mMk6Qd6zqdkdM
	YFj8qkFpswqoJZBfjt6qDov94Xsy51ZcC5ELgcDXpOLjC8ENNuh1yXFf1k68sNd0
	zG0PLfpxOg/c8R2qNVvW6ygfq0zPkVxFUutXsKdZl3RAwiHqaq7volD+arCYpGtF
	UvDz8TELrxWCwdPX+iL51g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956241; x=
	1758042641; bh=mAJtIlDWRgExlwUw4LeBdysX++mXrqNhzg2vRb4wAn0=; b=h
	yTdSzgVyo1svpOF241L7VxQHvd6BIvQYy2Nj+Eyd3oWR3Lk2o8jg0jUYV14JAbLN
	piPh2e5M/GdHaVtB8BThHTNb0G9Kamns6bqdoRq3kmz/7TxD2yFOP1SNA5TVIRTc
	yzr1K/V2mOGM4gbcRcLG9nmgtN9A9PoyVMl4qRqnpS+h4NhhnwvS9lZykF5XcRvd
	5EcvkARvKEJO48NQCW10BZcdun65SRgY35PsBFb+KezhP9lzj09T2Lb7rusSRkg1
	6YOnLyMFdj0JUDChk/d7nOkdZ4JedwiS2ySlgF0iQHug1OrcX1zh4WD/JGy9BzxC
	UdFXXSVPAQJ6jGrtSqd8g==
X-ME-Sender: <xms:kUjIaD7VczU8KqN_aMCYcPDRtT7_N4OCNsvaK0WuD0w-gZ8pmzKjBA>
    <xme:kUjIaAjb6aD384BLArg8BKEMRDJf7858zjArm0FQnVE2qNHv4ulLgJzclHgWrnm-P
    kPYROIREOAvvWoW4cU>
X-ME-Received: <xmr:kUjIaIFtJAhRb-rmd0_9eZdprJIz58RiWl_kFCe_JEZCdMW6wG7Ae8pCA9S7oKDz_wfhxkidl7lmShb6bL9gbQnBUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepkeehteffudektdek
    ieejveeiheelgfefkedvjeeuleehkeefudetvdduteeffeeinecuffhomhgrihhnpehfih
    igvggupghvrghlrdhgrhdpfhhigigvuggpvhgrlhdrghgsnecuvehluhhsthgvrhfuihii
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
X-ME-Proxy: <xmx:kUjIaORDXZbAViKqHUYhb7CX9OVS7Zx6i8x9cFPxArdBhNcaW6AbZg>
    <xmx:kUjIaNzdzZPqfePVIZh-IWT0rq-qW35Gdcl464mSGHwYQzuPdO8lLw>
    <xmx:kUjIaCetCVuHLdj63hQTn8K4aEfXB9WrFTW_Fx6MQBheCa9QDXqbQQ>
    <xmx:kUjIaIPBW8eLSPJC6UsmQsLnU27lpvToXObGmJeh0F91gWGjYdxoOw>
    <xmx:kUjIaOdxw6zQWLFPc7sgV5uecOAn_E48HLxAQeg9OkSeHgUqXDF2kw0e>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:41 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 07/12] media: rppx1: Add support for Black Level Subtraction
Date: Mon, 15 Sep 2025 19:07:38 +0200
Message-ID: <20250915170743.106249-8-niklas.soderlund+renesas@ragnatech.se>
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
index 15e476d2fa1c..afc80a480d42 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -24,6 +24,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS:
+			module = &rpp->pre1.bls;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
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
2.51.0


