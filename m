Return-Path: <linux-media+bounces-49546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E79CDDF7D
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8EE830010E9
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54FA27EFF7;
	Thu, 25 Dec 2025 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DlUZdMO6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LIz8Of5c"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231126ED31;
	Thu, 25 Dec 2025 17:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682700; cv=none; b=kQULLUFXGf4oddIkWUOta8PBY/KCUeqtS5nmFjBl70edsRwOEt5yUQ4CTGOQV6ag2vCvglVtLFlZkcbZjla9Bz+EUdQbAqCZLy3EI1hdGcnwFQ26gWAsLUGC8KxLHINbqeQMMGN0SilN8MtBkIqxWzqCpuXjaAXHQ+nbtgpj4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682700; c=relaxed/simple;
	bh=e/6GbPfRMHFgNp13SDcbHGWDEN6DynLyg+oHeJ3ph28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDalJJPt++zhEBPF/yXDLU0f635KoL8dgmet4l57VOV7VuxIQn7r3NJT98Dgdy9gRy3t2FBFgIdXkwlA9kjOGv3QdgYQJBrHmGyeEaZgTlIMD1zlcbrVH0qbeUZ6kSbH4cKBmgobNLOkmOQcM79gQ0Tgs//L2yl48kIj5Fm35pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DlUZdMO6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LIz8Of5c; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 95980EC006D;
	Thu, 25 Dec 2025 12:11:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 25 Dec 2025 12:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1766682696;
	 x=1766769096; bh=uOSlDPM5Q/bDskIb3cD6qAcIwgYlKOX8uWKwTge9MmE=; b=
	DlUZdMO6fGuHzUCCRXwZsO40XXfHrgmixyYccqa+Qe4IoiKJWtQ93UsgJr2UIfiY
	Tb7qdd7DLth5TXXB8zck+L+CSBK41HJxBvWW1MQiLbw8GnamQfXTLdHZkbH7iVRD
	GEbhN+sEkTta4lkoIyV+aRqEm+YJCJTqjGZwBgVJQw5lhZAb7WoNCwJi6claPUcg
	WcHHsrAO1Wm9x2NLLm0CMHajPktkNn0wgiTR5SYTdkCMrNcpuZr0ftHJuBoKnB+9
	IjF2ydNaPpOnssKDyVPY8ZzD3kVsanwIgyenCh9f5roRK4jqnbVomwuwU1CExYyd
	+6s+bm4PJwvqHf1pwYUJ1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766682696; x=
	1766769096; bh=uOSlDPM5Q/bDskIb3cD6qAcIwgYlKOX8uWKwTge9MmE=; b=L
	Iz8Of5cbvgd4R7IRlY67VgJGfMkQ5iFHbfXxs8HL+IigaSM0CEQcITgL/2UQrxrv
	s70NNt5CWlknHtmV2PDwJbkuzWWZE/0dauq+PkuEG+mJILU04Zug2ulQ9gQbErlC
	pZIl34sgNj/EfzldOHWOahIA+Kam5Sn97iz1T3m0Z1AuwHpoI9+onCWCGZQQBFVn
	LSVkniJuB+FC0Mx+o/Z1FwBJRzlzmE19+KB8pv+uPaQIHqEKcoyfYyGzlK/I0dT+
	r6AJ1yxHYyO5FTpsE66qv1koj2aQQmkwWt4FfId+PG3EiZ9/VNisMbbntzrIBUSS
	g+kghbPVG4Fl0jXbz0O3Q==
X-ME-Sender: <xms:SHBNaVzRgvCUFnFQCWJZApxyNoEDQfHEcDgsC7w8742AFFK32bLZjg>
    <xme:SHBNaVuCPcr05p708h66f5iCRX-xyeWSTI1jEd1iLbfYsdw23GTcCofzpRXQtJnib
    fdvH3g_AtCo2Dyw_iHIVvfFL25x8llrQbhIHUJ6tO1WQ6QPFy16IL6S>
X-ME-Received: <xmr:SHBNaQA_OT49rcmAGRbZKP37FOON79Qibj6fw-nOVXnrLzNRcfM7u6bGysGOaJzusuQMWTlDlcHqp6yN5h9AEYKx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
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
X-ME-Proxy: <xmx:SHBNafG5xXhzEBajPYnJ_S09A_ibkLLu479HXV54WL9D_dN7GBOcuQ>
    <xmx:SHBNaYDqEO37P4D2ZmMnNrJSq2TUFRLY58OetRYtvDVx0hzShYALFw>
    <xmx:SHBNadnZV4GAHbLx-ATHG8VUPFgl32aWAUHwHyxZzhe0zG8L_Txkaw>
    <xmx:SHBNaWOPSl6ZqT6YGvIcUZjhLuoiTNU_gFf2ElcAdGyoV83wXH5jaw>
    <xmx:SHBNaU4x4jSJiC4owIdV6TFOdcgJRJDrDS85NICPmEeWsF1NWQ2lGTBF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:36 -0500 (EST)
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
Subject: [PATCH v5 05/12] media: rppx1: Add support for Auto Exposure Measurement
Date: Thu, 25 Dec 2025 18:10:47 +0100
Message-ID: <20251225171054.1370856-6-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the EXM configuration using the
RkISP1 parameter buffer format. It uses the RPPX1 framework for
parameters and its writer abstraction to allow the user to control how
(and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  4 +
 .../platform/dreamchip/rppx1/rppx1_exm.c      | 89 +++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 443eac0d8924..9b0f24bcb65f 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -32,6 +32,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.52.0


