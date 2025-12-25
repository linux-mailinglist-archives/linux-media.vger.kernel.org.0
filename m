Return-Path: <linux-media+bounces-49551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1E0CDDFA8
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98D4A30291ED
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C60277013;
	Thu, 25 Dec 2025 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BPQbvpUO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o4h6AL5d"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E1C284689;
	Thu, 25 Dec 2025 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682709; cv=none; b=WCR2HwesEMEPwbcyK6j9la1CF7CZNPIfV7C8jgTFRaIM+6FM8XaUdIK2n8lpoNLc4yiDzyCfYn7+Vox8B7C/wqt3DZEQ9Z4HKQCwrtZVlaBhSoEuK5X6DCP6sDzAzddWZcOoLqc6x9U2fEf6LCvOIzwE26EF3LoBWwD+HOqFTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682709; c=relaxed/simple;
	bh=GFI6msbdqzoulcfFn2iRUm6pW/Vi+vFHGPfGa7SU6cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJthj/SW+OLLyBB8nLGfS3C+LeAP6DXDOysEAW0vKxZsPXT0ivXFIVPG+1ldFYvoS5ay7Z2Pjmngop5iDtKi1IGBOGBbm8vS0M4hoyB0dcb3QSgKUPeqq5kmmoNENpTLg9MYxCTO91+QpKHU+fEvwSR6rimSH1jT4y74RfjxrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BPQbvpUO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o4h6AL5d; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CB2A21400041;
	Thu, 25 Dec 2025 12:11:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 25 Dec 2025 12:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1766682705;
	 x=1766769105; bh=I8Ig1ymnIFDQVOF7UxEWmgp8RA8lUgtwMFOJmz7CKWc=; b=
	BPQbvpUOna4AwQGjg5q25bSiRfU3eKqLe2NlozLR2Ub9amBvQIwd6QoHjipsWCAi
	HQSBD1/HLa15EwDb+pbo/Ggzd/qWJV0qKBTfLlRhhjP/p+Pcks86cJATugUK1Tid
	BRa8ZFzQPXv3QsPFKhSqRfEFOKyvjELvF/FXlwhA3lNhHVYIu2kbNyt81v8hSAe2
	cL46wtutw6d7yHeqVA3oImF1gSmznBaUfl9AuHpeZ9DErQGeXRyLjrRmhzREMNeU
	71nB3mHe44Gtubtm7qgBmSSQeHe814p8LDE8AXDpm94weWOxwtDXciIrdW2GjPLb
	+TR9+bNqq3nau57pzRcH3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766682705; x=
	1766769105; bh=I8Ig1ymnIFDQVOF7UxEWmgp8RA8lUgtwMFOJmz7CKWc=; b=o
	4h6AL5d7MymYxfK5ljuz0FBwoy7fTFqSjE7JzRLdvhvibKbja2Y+HLKJdHm7BaYw
	k6kFVJjO10GdUXbpfNabwrCkUZPCG5LjESbA6uXZpeW6R31AzJadPCSs3XMM01+R
	1RAFGZf26QrTzcYLsqk+yULNuO+KFGjLqXXcwElFJqvQp2AbCmCMg95eHEys93nD
	CfmU83RO/lOBjJCYGe2H1I+8f8pcw5npH0LxwuvZriOM+e1EmAscrgUPzcicNMwi
	6DQUXYP36eQTGkxKmtTOsQIVWeFqSMSpCall2kP+ouRyoA9aQH+LEYR6XH+5HVNV
	f8pIVogQ0A3pWn/otvDOQ==
X-ME-Sender: <xms:UXBNaX7-Zowf4J_ZPwy4Bt4TtB1s0nxgCjnL_L9aUsQcYnvtkUdKlQ>
    <xme:UXBNadVFSUJjEoNvDB9BJCazJMbe5d-rDeGnhfG73GoZRfwqyRzPEMFAHWgfqv4CV
    Z2tc-33E5-dAMC0fpKEtH0jM_AJK7UrZCkBGWIMsXLeduRBNZoroOs>
X-ME-Received: <xmr:UXBNafIVU-0P8KXRkPXds_tIU1aE1ExtbA-9IEHITEevAdH47QQcagToLWNM_9gJh4oei625_LfpHuT1-COIPWx6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
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
X-ME-Proxy: <xmx:UXBNafuq-0CHwrcQCqZZMKBh7xK01H-Rg8iyKSRc2sru0MDN7r203A>
    <xmx:UXBNacKHz4PEDbvgUf4ZmTuRhU1YXV5uOOLf42pf6JwPvoFI6qt8Vw>
    <xmx:UXBNafMaoibZT6QLMu6415sHlMYOIU2doftJ6XgK8RMalAGW_KM7rQ>
    <xmx:UXBNaXWjXQXfYtCNaeUTzy_uTiXnut0P10HI3PwXslIIDNygSEYe4g>
    <xmx:UXBNaeublg-P-XSHKBiDePdt_UFlkkyA-SEw_b77U2mi5CWYnRwvOv-5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:45 -0500 (EST)
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
Subject: [PATCH v5 10/12] media: rppx1: Add support for Gamma Correction
Date: Thu, 25 Dec 2025 18:10:52 +0100
Message-ID: <20251225171054.1370856-11-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Gamma Correction
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and  its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters are all 10-bit while RPP can be either 12- or
24-bit, the driver corrects for this allowing the RkISP1 parameters to
be used.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 ++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 0519ad77d5c9..b5a4194ecab7 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -35,6 +35,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.52.0


