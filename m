Return-Path: <linux-media+bounces-11944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15138D01B1
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30924B2AE7A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B576915FA6A;
	Mon, 27 May 2024 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="zPX/zzq0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JgDto3Vu"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CE15F419;
	Mon, 27 May 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816765; cv=none; b=s9x/PFRxqhhXuM3tHcY9k34pxRAOqzD4i2sYZ5z/oHafNCFPQhxd4dVL8k2ulsrQDgg08sdVXVirywLDG071TKHFYcnpHUgbXw5kUfua/kXHLxP1lao23o4Ns/wZ3ClwCQBapJiLFkDk5hY72wWm6qv6cp99dMrG+T7FBBZGMa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816765; c=relaxed/simple;
	bh=aSQXjaCkBnxFsJbLdr9c5m2rcDj892pT/tYVqUsAybU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLhU26ehJEfeSFjit3PXvBLnlZl8YDibJ3UYdhkC1xqRCpG9aNubm/EXqBIIqohvqRXudffmDTy+oFa2SRt+8/LdVOyZ9kKRX0pNUAty8SNkRVRdxRoiOKRA1bAAsIvEOchDfK0d2MyjdO8JZotO3IuQGYnGAZ4CUkC415itSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=zPX/zzq0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JgDto3Vu; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 8724618000AB;
	Mon, 27 May 2024 09:32:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 27 May 2024 09:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716816762;
	 x=1716903162; bh=eMNbJcdHnTVt6VJPvM/NtDBHD3xTkHXQR3BwqkSKnGA=; b=
	zPX/zzq0bFVpLRsaGiI2g3r3SIlg/94/W6MkS14HAapQ4yGITkfR0GQRChyLV4w7
	fppAHnvqHbqGlBHG4pdAcmiGJUp/mSz4EwRXG0BQmQ25dQnDGrCsrcR9r4U9oPgs
	SCrR2pDpGKhJ7VmERtO8K9wpw+prdFjWE6sP1W5cBpgXo2TdnZoRr+0Y6RrLQYxK
	tas8R5UfegZ6+plpThXLtGChoIBiTxwSVG3rfsATbU4npPxdJEOOuEOwGm854mhf
	wLR3lChSx/ckUxbqtXEiKPfkIhNxCA5GiIIODvX7GyFM5blx8XGmhb1gmu5oMejF
	LaOCmk9r+xuA3kzMJu5Guw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716816762; x=
	1716903162; bh=eMNbJcdHnTVt6VJPvM/NtDBHD3xTkHXQR3BwqkSKnGA=; b=J
	gDto3VuDQSutcz1CitqTQA3oAuQ1otvzFTR5OAE9TfAtYkCb1NaDlbENxRozETFX
	Lk74PCbalB8HrHfuPoxASaBOMHErW1YADBAtArJorUOOtPRtsDa6Xg9WWZzU9G9O
	7AtpPD4cVVVlc8t581yp3nvIZmPni6RnWDc2zRKjb0c2pEEVvs8Jcps7vnsfLTU3
	wzvcIKSuTkGQKTAbpOSThsICStNqjh8uGYLN7xmChqABqD1/iZ3LGX9aRKrTLV75
	o3Gvt2SoXcBo5J0gSHTMffyxhJDfMZSIRBNqyoyYXci4ssDHxL6hf5cWfOs9R+DY
	hgxqsOdqZz411RY8uc/fQ==
X-ME-Sender: <xms:eYtUZqrtf_-OCW4CaOcNSE6v1_8qeY4ZjxzIthZamc7cnkuRbpE89A>
    <xme:eYtUZooJrYUGIt-CaVpWZyLKq59TWLL_QZGH3B9n3rNqF0A679_gN5Ku_ftcuqF94
    24uZrZsyJZjkSljY4Q>
X-ME-Received: <xmr:eYtUZvNj18_lsHGvmE71uTGpcuU-dKCyYV2ayKsNpmEYYgrKn6467MlV2JQm-OPi_JnySe2ZOEOPgDigK62-f5hH06WSPnnCQyn5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:eotUZp5MaSWXjetYbAhBtYAu33RgWfiFqotnChIiJWP-BLA7prHeXA>
    <xmx:eotUZp5Xl2qXUFaTZtFE4-ht1GTkO1n1hUpV-SRbhLaOXyGxy3OxhQ>
    <xmx:eotUZpjetqVdu_pB_M8ejYd3U2hcW-lPAgW5RK9bq1Yu5S4uLL8XgQ>
    <xmx:eotUZj7ollF9QBYwymJlGinfaeZn7dNCSznaf77S3uUYgn54CJCCvw>
    <xmx:eotUZnR7jwMQYYVwFaptrJXsBaez0r3fqyPIn-8Ix-EaGuynSJJj7ctM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:32:41 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/7] media: rcar-csi2: Abstract PHTW and PHYPLL register offsets
Date: Mon, 27 May 2024 15:32:17 +0200
Message-ID: <20240527133221.1688830-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of the registers used on the R-Car V4M CSI-2 IP are shared with the
devices already supported by the rcar-csi2 driver. Two registers which
function and layout are the same are however found on different offsets.

Prepare for adding support for R-Car V4M by storing the offset to these
two registers offsets in the device information structured. This way the
code, which is shared between the devices, can be reused when V4M
support is added.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 27 +++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index c02e1ec6600d..8b584b10284a 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -584,7 +584,13 @@ enum rcar_csi2_pads {
 	NR_OF_RCAR_CSI2_PAD,
 };
 
+struct rcsi2_register_layout {
+	unsigned int phtw;
+	unsigned int phypll;
+};
+
 struct rcar_csi2_info {
+	const struct rcsi2_register_layout *regs;
 	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
 	int (*phy_post_init)(struct rcar_csi2 *priv);
 	int (*start_receiver)(struct rcar_csi2 *priv);
@@ -721,7 +727,7 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
 		hsfreq = hsfreq_prev;
 
-	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
+	rcsi2_write(priv, priv->info->regs->phypll, PHYPLL_HSFREQRANGE(hsfreq->reg));
 
 	return 0;
 }
@@ -1429,13 +1435,13 @@ static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
 {
 	unsigned int timeout;
 
-	rcsi2_write(priv, PHTW_REG,
+	rcsi2_write(priv, priv->info->regs->phtw,
 		    PHTW_DWEN | PHTW_TESTDIN_DATA(data) |
 		    PHTW_CWEN | PHTW_TESTDIN_CODE(code));
 
 	/* Wait for DWEN and CWEN to be cleared by hardware. */
 	for (timeout = 0; timeout <= 20; timeout++) {
-		if (!(rcsi2_read(priv, PHTW_REG) & (PHTW_DWEN | PHTW_CWEN)))
+		if (!(rcsi2_read(priv, priv->info->regs->phtw) & (PHTW_DWEN | PHTW_CWEN)))
 			return 0;
 
 		usleep_range(1000, 2000);
@@ -1681,7 +1687,13 @@ static int rcsi2_probe_resources(struct rcar_csi2 *priv,
 	return PTR_ERR_OR_ZERO(priv->rstc);
 }
 
+static const struct rcsi2_register_layout rcsi2_registers_gen3 = {
+	.phtw = PHTW_REG,
+	.phypll = PHYPLL_REG,
+};
+
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1693,6 +1705,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_h3es2,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1704,6 +1717,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
+	.regs = &rcsi2_registers_gen3,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w,
@@ -1712,6 +1726,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
+	.regs = &rcsi2_registers_gen3,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w,
@@ -1720,6 +1735,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1731,6 +1747,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
 	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
 	.start_receiver = rcsi2_start_receiver_gen3,
@@ -1740,6 +1757,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1750,6 +1768,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
 	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
 	.start_receiver = rcsi2_start_receiver_gen3,
@@ -1759,6 +1778,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_v3u,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1770,6 +1790,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
+	.regs = &rcsi2_registers_gen3,
 	.start_receiver = rcsi2_start_receiver_v4h,
 	.use_isp = true,
 	.support_cphy = true,
-- 
2.45.1


