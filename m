Return-Path: <linux-media+bounces-42576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC4B58312
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5DFC1A24C50
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870212E9739;
	Mon, 15 Sep 2025 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YsfQ8rkY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W6buPIGS"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC802E8898;
	Mon, 15 Sep 2025 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956251; cv=none; b=MmVmcRsaMtJaylVy339Zf78PplWXlHfrSnAnjYr2XMo3Ql+ktnzCCn2CjlIVE9xb+bH++qUJ0RP47AV/Zf3qE5tWlB+/LRMgcJZYSQzbMyf4FTbOWv5eO8Jmgly9+yvmGtYg55XYegTEif5+w+RIdAskmwl5a5RfjFPk3YxmbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956251; c=relaxed/simple;
	bh=9jLfsL29twbk73qCdvUOsFap3ZSR6S454TnERf29xjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktKOzikP1A6V3XyXW5y5/Uf5ppgg8yoydVEtf68m6M3+xzS9IaZbnio/hPq/1Yq81a56WvRv7IxGKysfB/PeAU3A4RLZG0rQmcHPRJMrX+nEFHiBaDAFa73IXUW9IWtWof8O9q66rVssn+m2ndN43JFkis+GUNR5W5U3bvX1su4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YsfQ8rkY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W6buPIGS; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id B1E6E1D000DA;
	Mon, 15 Sep 2025 13:10:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 15 Sep 2025 13:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956248;
	 x=1758042648; bh=8lA0JfCOB0gy3cxcc2e66XgBZDeOEuWImdLphWXoGOY=; b=
	YsfQ8rkYD5oJ000TFmgK9Q/EeiTDneZ2qjrqa/NnSRjPDEcpjmy/iWROLr1DuIh7
	XccGrhPk1K/5tNMjEHJBoXGCV5SQR5I53nM4K1Cp5b2fBEsKizX/czoMx3N3lc3m
	rfbbSSmsTHpCaiptfthhGRQ2G3HHDjOXdh/SjVghJO/LHPuHLIE0Bo68XNXRzURL
	N2cEzucaUJFy1yB+qgEIfVmPzcgRxM9ikIZhw1PN1RaNDtLFNsDnaVhLHaYasXXy
	9AduAliUAmMJhHf3AuF5zhu1Mcmk5eMifz0dMbz+K2HLOEVf926MAcnkeSKD3Fwr
	HOUv0Ho77IfUdVD+rVv0oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956248; x=
	1758042648; bh=8lA0JfCOB0gy3cxcc2e66XgBZDeOEuWImdLphWXoGOY=; b=W
	6buPIGSRouAlUFfTAypG8ZD1gilGWpFN56L3P7Nh+DWDdd4RcPMURiRw8HpQN++3
	tCavmw/ND9Vu8ODSk+TVZsPIw0FtHOFXDH9/E2HT/gqggnwmJcRVKVKsWzOLSifn
	fZR0AwKVrZPl3LWcZRKnLJYtgHOxbZiapazLUj0SH8pUO7fyUjs1nEPciBCfnOS7
	TXGXfNj6pHnsaTrM3/pdaa0h9UG8kmt8pQr7V5vnpeJx4A48yctNX9jSdFG5q3Aq
	c1zZJ8LSvuP9RWJyxW9ZWACvpvLcl+1YXNjs+XXGzZUPaI4IxlnlK2+CWMAUZ1ic
	CuU7+DOHo19jKekcoi45Q==
X-ME-Sender: <xms:mEjIaLuLD3KOLBClojdyyvf1ZYGfJk_y8IEprWwSw4jMd6qMef52JA>
    <xme:mEjIaEHcZvaGrYR-UmmM350thWQYjVcXdhlQqbBE2TAE6ymolqj_mMsKqJgmQYYsa
    p-q5H0QtbXkxfjBbKc>
X-ME-Received: <xmr:mEjIaMYoA0yl2vOZy_jijtYathAPyId2le-7i-Tqzwx4ld8RlHy76MEcWwJISnA8qSkQxIGY5XPAgYl1KbZZJkhlzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedviecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:mEjIaEX-DhJH0Ah-DX2mNnHIidf2X-9swRaXG94z7CUCn7vFjc951A>
    <xmx:mEjIaClfWdtZwoHjkrTtHDrFuLGOx_s6hhBkWkkCk_kOReN7SWm82g>
    <xmx:mEjIaPDoliDDcvsZsCKBtcabYWykuWWQLDmCGQojU7TODLjpgPHrzA>
    <xmx:mEjIaBjMgDNXXIu8O-FkiXzraMxWDt2bFdjiN085mv6cSK22-eyTRw>
    <xmx:mEjIaJASulyEE28ptU6JTsXxwmGv71FzNQg9Ryx4EbtTn3CYUa9xfPeP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:47 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 10/12] media: rppx1: Add support for Gamma Correction
Date: Mon, 15 Sep 2025 19:07:41 +0200
Message-ID: <20250915170743.106249-11-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Gamma Correction
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and  its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters are all 10-bit while RPP can be either 12- or
24-bit, the driver corrects for this allowing the RkISP1 parameters to
be used.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 ++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 8491ce88ab90..323ee792426e 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -33,6 +33,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC:
+			module = &rpp->hv.ga;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
index d6c7f951cf29..a748190ef2dc 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
@@ -43,7 +43,41 @@ static int rppx1_ga_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ga_param_rkisp1(struct rpp_module *mod,
+		      const union rppx1_params_rkisp1_config *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_goc_config *cfg = &block->goc;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + GAMMA_OUT_ENABLE_REG, 0);
+		return 0;
+	}
+
+	write(priv, mod->base + GAMMA_OUT_MODE_REG,
+	      cfg->config.mode ? GAMMA_OUT_ENABLE_GAMMA_OUT_EN : 0);
+
+	/*
+	 * The RkISP mean values are 10-bit while the RPP can be 12 or 24 bit.
+	 * Figure out how much we need to adjust the output values.
+	 */
+	const unsigned int shift = mod->info.ga.colorbits - 10;
+
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
+		write(priv, mod->base + GAMMA_OUT_Y_REG(i),
+		      cfg->config.gamma_y[i] << shift);
+
+	/* Enable module. */
+	write(priv, mod->base + GAMMA_OUT_ENABLE_REG,
+	      GAMMA_OUT_ENABLE_GAMMA_OUT_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ga_ops = {
 	.probe = rppx1_ga_probe,
 	.start = rppx1_ga_start,
+	.param_rkisp1 = rppx1_ga_param_rkisp1,
 };
-- 
2.51.0


