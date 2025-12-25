Return-Path: <linux-media+bounces-49548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148DCDDFBC
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A45303F0EE
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C8E274B30;
	Thu, 25 Dec 2025 17:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Mbz3d0qw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eSfawn7a"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE4227CCE0;
	Thu, 25 Dec 2025 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682704; cv=none; b=X0FJmzKbi8tyk3uG74DZt0kaTN0AHH0h38NX0JpQdEDYswiWut8aTLkaf8ranUCcC6DK8y7GKIF9i8rUpS8QM6ahS86otTQEbHVnnySdN5ZYKw0nK8l9q2YCqtNUZ//mVXkf5EJWfQ+77Pun4EnF1UrPA3D8IuAJ5iEmUDExEQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682704; c=relaxed/simple;
	bh=Y4kg8eg3kz+3Y6ElaUeHgk72pHWUFJpolr41bS3cp5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBOInigp+c7c/9FMiR9YP7E7+3zcljJwor63JBtYHFXWHyEtckWyueQWyoSIohnWYRhDCzqLvmnt3f9cQcmuDtciBGtOfAnF/xwKSPjwc6/qZVxdGCVFwZf+TM9uZ2ERWGTYbL2HsHX1X2ya3G5x2c/9JPn2tkSR5vs1mDRUQo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Mbz3d0qw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eSfawn7a; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6D7541400032;
	Thu, 25 Dec 2025 12:11:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 25 Dec 2025 12:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1766682700;
	 x=1766769100; bh=MhJYilXSkpYRNFBqRXhbZaKFxMgNp2yiWw8sKAbJHqI=; b=
	Mbz3d0qwqNu56EnSTt8CdM7Fr/1MFFrWdLShW55VfnAIpQxO2XmkU55cahHyijmT
	m7eiEfVWrIwwOp3zqjmLgKNFjbJlA6wCAlnlIHPlTWDZJdpgz2Gx30pbNUt6VSYE
	9KwLynyPo/ltmLhef1f4ggprFiqIc9b2HaCxiWfqgjLuuEt8M0g4V3B+HBHrmsCq
	6ykeM+0X4deVZpG1AYQZ3YTaD0Lc1HRnU32QDVOpg7DagSGDVkIsKYJLsN8c0XZu
	F2qpx40iaub7PO7KNUV+feG7WIKQYjJeSdQsRDy0H+9o0+UsfrvFZTxvM0t5wSj6
	EiXXbt7RM/1CEHyvE0pqqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766682700; x=
	1766769100; bh=MhJYilXSkpYRNFBqRXhbZaKFxMgNp2yiWw8sKAbJHqI=; b=e
	Sfawn7at/tHppnnLF6UkvVLJFdrFsMR3KvpyPVtqQCRiniJKPzcxL55epnq/GUQ9
	bSHubiEBwKi31ZgQdTJTO2PcINN3idjkDPuStM1VNnUGgnv9tXwCxvZClYTAMIKf
	XNpj4hQimvWAVuVzIVKomU6RiVIxh2HtHI2CPjbx8GaKjIoc4/YwfJsX29+reSbN
	n3sjTmUa2Qmy2IHItQemcd3I2ZE2mjOXQ8vZPbp+xvGoMZmnEyp/Iy1jN4v+ZZ0A
	EC8QBMFEtuVOMz1gL6A4qzT5m/Q7OfJU2MZCeYnnxGPXNrs17MXthxzSI/1WlGnK
	39eBFOA/r30Yvr3BGa25Q==
X-ME-Sender: <xms:THBNaVb1crgNbqyxuoIDmBRG0fJszufd3a744KF8AvUrWbrTw9E1hg>
    <xme:THBNad-1rFlxJh3una7KyV4KeI9eIrq7oTVNip3EVIloh4_IA1RgX8YmBvNTI2ePL
    DMbs1OMyF0xdzEn7ip9QeVDqC6yrLyKvplwrTCfIiuscQcAcsnMP0Ij>
X-ME-Received: <xmr:THBNaeSwT90JVAYVBiftuq_N_uFusyeZUXXI6FfUNbk2OsoaSwB2ml_Vi_oV74WRJTIi1CaU2sFufVCPyzOXGPio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepkeehteffudektdek
    ieejveeiheelgfefkedvjeeuleehkeefudetvdduteeffeeinecuffhomhgrihhnpehfih
    igvggupghvrghlrdhgrhdpfhhigigvuggpvhgrlhdrghgsnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunh
    gusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtohhm
    pdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtg
    homhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgs
    ohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdprhgtphhtthhopehmrg
    hrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdhorhhg
X-ME-Proxy: <xmx:THBNafdhsRFeopP9xa2XyLoiWiu1MaZsaBuC_7GH0XTzC1MY9wZBzg>
    <xmx:THBNaYShs5i3PKcvbeU0mUJPtC7MoYYgKVb9qLBU0bPYQZXctMRemA>
    <xmx:THBNaTI1ZiFHhRa6-w7-K8JY8zr5asowCUlS3zFLfCVApx3KOnz5Vg>
    <xmx:THBNadIJaksNBknA-dCinscYQyDrWoifVE_SJ9ZMerUMx77PUhv_EQ>
    <xmx:THBNaa16WBUUruT9U1v_RbUMfdiWQZ9fTVMb6KP_ZIY5uwC7kmSIMpWH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:39 -0500 (EST)
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
Subject: [PATCH v5 07/12] media: rppx1: Add support for Black Level Subtraction
Date: Thu, 25 Dec 2025 18:10:49 +0100
Message-ID: <20251225171054.1370856-8-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Black Level Subtraction
(BLS) configuration using the RkISP1 parameter buffer format. It uses
the RPPX1 framework for parameters and  its writer abstraction to allow
the user to control how (and when) configuration is applied to the
RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   5 +-
 .../platform/dreamchip/rppx1/rppx1_bls.c      | 116 ++++++++++++++++++
 3 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 4d712b97b31d..a1f225b6609f 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -26,6 +26,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.52.0


