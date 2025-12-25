Return-Path: <linux-media+bounces-49549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0BACDDFC2
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4D56304D481
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35346284881;
	Thu, 25 Dec 2025 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mjB0N2+q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WYRnKuZx"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1D1DE8BE;
	Thu, 25 Dec 2025 17:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682705; cv=none; b=HkLzrvrPNgH72Tcnyn6RgBJKfVCYcFErpJs8AaJmOGC8gGjAXTvpQxtrN2igcexmQ+vyBhOiiuujyoKyb6mqqENtWpfGHkKJvy0ycbSOwPCXZIHn4LRV7lYERiq9kOzHMZyrLiOvxSGHDNoXYZS827e6RjBCDaWWchIS3VbN5GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682705; c=relaxed/simple;
	bh=/V1f4xi+A281yJoWYXZ2igWf+30GFFov8BAjKYZYxpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6E2o7HE8bnwkSf5F8GKuntkeqtBGsQ6JWer2FxyGpmGE8Mov9XKUpprTSj+OYFVVTElvbk+LmDM9/9sasVEVd4BjDMJi9Uho8FsWgNyl9vDhEnXEQbuBNDdMBpg3CTqdMxy1/n9JSzTxk+WqXYdwV7UoYHNIxmv9Fc1Fnis+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mjB0N2+q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WYRnKuZx; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 38D9F140003F;
	Thu, 25 Dec 2025 12:11:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 25 Dec 2025 12:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1766682702;
	 x=1766769102; bh=sMvtdPCLB4DLw+h7gx+NZgFfTa6zADGAcWjdB9koQnA=; b=
	mjB0N2+qbAUt1BxIO76mMTgxFYBe57BbSnZbew8vcdhwOUFAItSRGtQBVIxaebzf
	PGBnxcv14kAGxdZ9c+nAsBNkerJOnJ2Ksswj2UgdihdU1XwgMBX9XE/sBn5oplBS
	g/K7AXweBBaak4rQv9LIlgw1RO2lPipAv26MpJvBe7M/kFVE3iwMy0iywvB2r5hy
	GXCEwNFnWbdHQd3oZ4xW9JrUMAkxO9o3r45nFXYLqumDjthq+DeOeTWGi0h9VfsV
	f/b+crwW8V/4EYukvBx1UH5pcq//F9WmwY3xJjAk83/JcuYzhXncR/bTiV3v4qLc
	tvokgQdIXYDEQD7FgYIPpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766682702; x=
	1766769102; bh=sMvtdPCLB4DLw+h7gx+NZgFfTa6zADGAcWjdB9koQnA=; b=W
	YRnKuZxQo5qnUYOtDw5ccnAEvGg77w88jhfvl4tZiaFVFhOE26+7VOrLgxbLJqid
	qCg8L0XGujAPqZWXxqvtCIkZvYKiJced3BmckGc8+/sysf18VxOzd7Du9NUNuiM7
	YUpqzZjmImTJp7sEMSiz31BhvTxcQNd1yGLCEyCQUQP6SGUNT06SHp2NwiG23QB9
	7JDkGfbAoaVeQRbuTeqUpdHJK0N6G0EbHGgKJ4W6fb1fj41f6KK9+/FvYAZ7/+vl
	fDABO1Eb4uHlbTr5dCWfbE81qrmSDTBOFXSrRIdAScMfZApjHJ8vQJKmTPCZ+Q8v
	wVzYRfB8xvey8VxpHD50g==
X-ME-Sender: <xms:TnBNadAd--nQ1wnoRHZZ_mbuRiJoSllF-vvYkaagaSMeWwO66kCn9Q>
    <xme:TnBNab9HFirv-VGNaybKxIzKPnxzoVk7Nb__3hhYHYGoN0jk06g7s_nOwLl_Vssuw
    2T6o7SE_xEYqR76UJRI062hmKMdu21wUNd-VhZMYd8SlyDfazCa374>
X-ME-Received: <xmr:TnBNaZQiDX85D6JwnLYFWyl6XTAz1gD9W5axDkhSbRKkOTH9Tu6k-eUb1hZMBM_119fEFc-5cYO-b9-0sM-3kvzR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
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
X-ME-Proxy: <xmx:TnBNafWX5JXtWtnpizjdKjPFMdbFCH6-pIAYhC1EXmqStNP9nhxV_g>
    <xmx:TnBNaTQKXTKayEru-NjkpY6ph9-BZQGmGOSAUGQ3eF6dNRZ0F4UvKg>
    <xmx:TnBNaX0RLbk37lAHAjn7XdEq0tZ4ACn18FTjzwp-OkA_-9dyJK8YKw>
    <xmx:TnBNaTeYQDea0ZcfPXrYBI5Vj_9bz0VaRrhBlTVxg-gWLLlaNefBdg>
    <xmx:TnBNadXUplqMqzLUBFnT5WTC60zS2iUYwiP3KjJFJr5_CyOTSHwScMk->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:41 -0500 (EST)
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
Subject: [PATCH v5 08/12] media: rppx1: Add support for Color Correction Matrix
Date: Thu, 25 Dec 2025 18:10:50 +0100
Message-ID: <20251225171054.1370856-9-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Color Correction Matrix
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
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 74 +++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a1f225b6609f..f7b9e14e2b5b 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -32,6 +32,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
+			module = &rpp->post.ccor;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
index 4754b0bbce0a..0ccaed8ce55d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -68,9 +68,83 @@ static int rppx1_ccor_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ccor_param_rkisp1(struct rpp_module *mod,
+			const union rppx1_params_rkisp1_config *block,
+			rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_ctk_config *cfg = &block->ctk;
+
+	/* If the modules is disabled, configure in bypass mode. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(2), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(5), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(8), 0x1000);
+
+		write(priv, mod->base + CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_B_REG, 0x00000000);
+
+		return 0;
+	}
+
+	/*
+	 * Coefficient n for color correction matrix.
+	 *
+	 * RkISP1 coefficients are 11-bit signed fixed-point numbers with 4 bit
+	 * integer and 7 bit fractional part, ranging from -8 (0x400) to +7.992
+	 * (0x3FF). 0 is represented by 0x000 and a coefficient value of 1 as
+	 * 0x080.
+	 *
+	 * RPP gains are 16-bit signed fixed-point numbers with 4 bit integer
+	 * and 12 bit fractional part ranging from -8 (0x8000) to +7.9996
+	 * (0x7FFF). 0 is represented by 0x0000 and a coefficient value of 1 as
+	 * 0x1000.
+	 *
+	 * Map the RkISP1 value range by left shifting by 5.
+	 */
+	write(priv, mod->base + CCOR_COEFF_REG(0), cfg->config.coeff[0][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(1), cfg->config.coeff[0][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(2), cfg->config.coeff[0][2] << 5);
+
+	write(priv, mod->base + CCOR_COEFF_REG(3), cfg->config.coeff[1][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(4), cfg->config.coeff[1][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(5), cfg->config.coeff[1][2] << 5);
+
+	write(priv, mod->base + CCOR_COEFF_REG(6), cfg->config.coeff[2][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(7), cfg->config.coeff[2][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(8), cfg->config.coeff[2][2] << 5);
+
+	/*
+	 * Offset for color components correction matrix.
+	 *
+	 * Values are a two's complement integer with one sign bit.
+	 *
+	 * The RkISP params are 11-bit while the RPP can be 12, 20 or 24 bit,
+	 * all values are excluding the sign bit. Figure out how much we need
+	 * to adjust the input parameters.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 12 + 1;
+
+	write(priv, mod->base + CCOR_OFFSET_R_REG, cfg->config.ct_offset[0] << shift);
+	write(priv, mod->base + CCOR_OFFSET_G_REG, cfg->config.ct_offset[1] << shift);
+	write(priv, mod->base + CCOR_OFFSET_B_REG, cfg->config.ct_offset[2] << shift);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ccor_ops = {
 	.probe = rppx1_ccor_probe,
 	.start = rppx1_ccor_start,
+	.param_rkisp1 = rppx1_ccor_param_rkisp1,
 };
 
 static int rppx1_ccor_csm_start(struct rpp_module *mod,
-- 
2.52.0


