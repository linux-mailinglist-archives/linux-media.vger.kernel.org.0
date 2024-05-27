Return-Path: <linux-media+bounces-11945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D48D01A6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BA9E1C241C1
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1455C15FA68;
	Mon, 27 May 2024 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TXkrpXOO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IKWiq3TW"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04D715FA69;
	Mon, 27 May 2024 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816767; cv=none; b=l6QHV1gzGGai9SU2aIr3HuwYIV/m0vNAijK8qM6Z6FKaYEySUdtn5qqCD6a/1EqLnxe3IR1DIB/lTins+ssf9WN3OaQUUGTMLUFwP/UlEhZc8FofYgJbl1GQboHnEg1ZMHCiHRC6FtMHZtMIu0aFVjwGKGIBZCdzC4dlCxNJms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816767; c=relaxed/simple;
	bh=i/5y++6WEjxaEaE8HHLluagC8XqWsZ2EKSxOI+rp0kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AvntZEFXQIW/0ZVyNlKYtPtG41oPkmWV9bCknN92/ex4su9c0KIhC3DetTGoPL1veufcmbeG/MF7A0tlEd4kDGTeHPwexPMQF3CaLrPFTX1OSxwx7M87mQ8kgcG3BlC2MiuzDWARTTjJkAlt9q7DbPDV7GnvE2WVyAeo9j0ID0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TXkrpXOO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IKWiq3TW; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 9920A1C000E7;
	Mon, 27 May 2024 09:32:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 27 May 2024 09:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716816764;
	 x=1716903164; bh=OvTd5qULV9h6yF4VqV/7Nbj4G2aGtKZy8CySab7xN2o=; b=
	TXkrpXOOM/ZGYm/VTTVCwrnE/4MJjn0yur218xvbv12e7ymilyi8KywK6pvDvdF3
	fiinDrzwxbZJqqiRTqSQrH4M7p4tHk50GQqov+7nD4hTIbp+o0jKkb2mWr86XIeZ
	tjtSzmHXTW1U0fkvmcxJP64oanhqemrUXnyIYDSXkfGAXz5a47+Qc5ubQkgV3GON
	fU4pj1TcR0mOAHUO95ILnMVDQXzCDcWDe5wQEd4i9C1285v/jIOOCyNa08R4UO52
	IC5ztpFDq1tC+Lkk5d9ZvrigLaA3djFQgXIjDYa+6LvttuvCA2N9IGI0AXvMiCeH
	qWA0GQNAjYrjvAbnyVJSmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716816764; x=
	1716903164; bh=OvTd5qULV9h6yF4VqV/7Nbj4G2aGtKZy8CySab7xN2o=; b=I
	KWiq3TW0ugtSpnuB+NpvuQ7ygT2KfkXvxGQUc49iDCirKQqC7FNn/p4/HHG/umcC
	lset4A0llgS1bQOQVqKUktg2M+SZNhiFMWzOKTFLTSu1UIbXcUFarXUF79q8APDr
	iEgfxNdYzSpjtxMZfy5CvwCrFZXcB9f//B+qYqljdLpd8gikQElMT6fqAhUOU5qE
	k1h4wgnLgpEtj5YLbQeA4eJDeLTrFNK0CI6DLg4KF2Rmb5OWjU+2/q31HaxgMVQc
	J4gx3TOYu0aoJA27NwxWFoOY5emwQ44ETAkewacFWBOVHBePO5ZVeTYzckgyqla5
	XVnFN93Y0hRYV4aXQv7Rw==
X-ME-Sender: <xms:fItUZqByCcML8E0am51rbg9KdIj74BxcVDIZvRrtS5_7Y-Bk2bZisQ>
    <xme:fItUZkiqdzub0YmL8UBRG8pjC401QEGpI1_ddJIQf-UtnpMPx1SiR_Bz6LKfqEPjM
    KouFQ3Dq8WdxaGsG8Y>
X-ME-Received: <xmr:fItUZtmIsDY3cx-yTxw-HAfiKR49rYb7rpkgBsAuTidov3_xg-2n_TQhvlCFi1D-n4eX-9QFjwogUgjCStpv5sYH7qNgJ45YG9F4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:fItUZoymDH87iwu7BXoaLQn4bHscH-gjsLXUi3-ix-wpSbIs_8PL5Q>
    <xmx:fItUZvR1WKMic77gAFE3VldzfsccsZMu37beuGkgz7XSqMzpqJAiBw>
    <xmx:fItUZjYNetzhC-j8GXkP9Cs_pxfSiMUNh9xYpXgmB5cdRJE6y24PAg>
    <xmx:fItUZoS1O_w6kMPHGnqJsQOzeUSrWCggDvCuDraClocDfiM9wun8-g>
    <xmx:fItUZgIS9aCzZPuyH6z9rzS4FK8qRbaB5bc0lSH2xtF1hui6xQNkLdRh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:32:43 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/7] media: rcar-csi2: Add helper to lookup mbps settings
Date: Mon, 27 May 2024 15:32:18 +0200
Message-ID: <20240527133221.1688830-5-niklas.soderlund+renesas@ragnatech.se>
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

The structure mapping a configuration information to a particular mpbs
setting needs to be extended with more information to support future
SoCs. Before it is extended reduce code duplication by creating a helper
to lookup information from an array of mbps setting, the lookup code
has already been copied to two speared locations.

While at it rename the structure to make it clear it contains
information related to a mbps setting, not just a single register value.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 90 +++++++++++-----------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 8b584b10284a..2f9115da9a30 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -242,12 +242,12 @@ struct phtw_value {
 	u8 code;
 };
 
-struct rcsi2_mbps_reg {
+struct rcsi2_mbps_info {
 	u16 mbps;
 	u8 reg;
 };
 
-static const struct rcsi2_mbps_reg phtw_mbps_v3u[] = {
+static const struct rcsi2_mbps_info phtw_mbps_v3u[] = {
 	{ .mbps = 1500, .reg = 0xcc },
 	{ .mbps = 1550, .reg = 0x1d },
 	{ .mbps = 1600, .reg = 0x27 },
@@ -272,7 +272,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3u[] = {
 	{ /* sentinel */ },
 };
 
-static const struct rcsi2_mbps_reg phtw_mbps_h3_v3h_m3n[] = {
+static const struct rcsi2_mbps_info phtw_mbps_h3_v3h_m3n[] = {
 	{ .mbps =   80, .reg = 0x86 },
 	{ .mbps =   90, .reg = 0x86 },
 	{ .mbps =  100, .reg = 0x87 },
@@ -292,7 +292,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_h3_v3h_m3n[] = {
 	{ /* sentinel */ },
 };
 
-static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
+static const struct rcsi2_mbps_info phtw_mbps_v3m_e3[] = {
 	{ .mbps =   80, .reg = 0x00 },
 	{ .mbps =   90, .reg = 0x20 },
 	{ .mbps =  100, .reg = 0x40 },
@@ -336,7 +336,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
 #define PHYPLL_REG			0x68
 #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
 
-static const struct rcsi2_mbps_reg hsfreqrange_v3u[] = {
+static const struct rcsi2_mbps_info hsfreqrange_v3u[] = {
 	{ .mbps =   80, .reg = 0x00 },
 	{ .mbps =   90, .reg = 0x10 },
 	{ .mbps =  100, .reg = 0x20 },
@@ -402,7 +402,7 @@ static const struct rcsi2_mbps_reg hsfreqrange_v3u[] = {
 	{ /* sentinel */ },
 };
 
-static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
+static const struct rcsi2_mbps_info hsfreqrange_h3_v3h_m3n[] = {
 	{ .mbps =   80, .reg = 0x00 },
 	{ .mbps =   90, .reg = 0x10 },
 	{ .mbps =  100, .reg = 0x20 },
@@ -449,7 +449,7 @@ static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
 	{ /* sentinel */ },
 };
 
-static const struct rcsi2_mbps_reg hsfreqrange_m3w[] = {
+static const struct rcsi2_mbps_info hsfreqrange_m3w[] = {
 	{ .mbps =   80,	.reg = 0x00 },
 	{ .mbps =   90,	.reg = 0x10 },
 	{ .mbps =  100,	.reg = 0x20 },
@@ -595,7 +595,7 @@ struct rcar_csi2_info {
 	int (*phy_post_init)(struct rcar_csi2 *priv);
 	int (*start_receiver)(struct rcar_csi2 *priv);
 	void (*enter_standby)(struct rcar_csi2 *priv);
-	const struct rcsi2_mbps_reg *hsfreqrange;
+	const struct rcsi2_mbps_info *hsfreqrange;
 	unsigned int csi0clkfreqrange;
 	unsigned int num_channels;
 	bool clear_ulps;
@@ -653,6 +653,34 @@ static void rcsi2_write16(struct rcar_csi2 *priv, unsigned int reg, u16 data)
 	iowrite16(data, priv->base + reg);
 }
 
+static const struct rcsi2_mbps_info *
+rcsi2_mbps_to_info(struct rcar_csi2 *priv,
+		   const struct rcsi2_mbps_info *infotable, unsigned int mbps)
+{
+	const struct rcsi2_mbps_info *info;
+	const struct rcsi2_mbps_info *prev = NULL;
+
+	if (mbps < infotable->mbps)
+		dev_warn(priv->dev, "%u Mbps less than min PHY speed %u Mbps",
+			 mbps, infotable->mbps);
+
+	for (info = infotable; info->mbps != 0; info++) {
+		if (info->mbps >= mbps)
+			break;
+		prev = info;
+	}
+
+	if (!info->mbps) {
+		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
+		return NULL;
+	}
+
+	if (prev && ((mbps - prev->mbps) <= (info->mbps - mbps)))
+		info = prev;
+
+	return info;
+}
+
 static void rcsi2_enter_standby_gen3(struct rcar_csi2 *priv)
 {
 	rcsi2_write(priv, PHYCNT_REG, 0);
@@ -705,29 +733,13 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
 
 static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 {
-	const struct rcsi2_mbps_reg *hsfreq;
-	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
+	const struct rcsi2_mbps_info *info;
 
-	if (mbps < priv->info->hsfreqrange->mbps)
-		dev_warn(priv->dev, "%u Mbps less than min PHY speed %u Mbps",
-			 mbps, priv->info->hsfreqrange->mbps);
-
-	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
-		if (hsfreq->mbps >= mbps)
-			break;
-		hsfreq_prev = hsfreq;
-	}
-
-	if (!hsfreq->mbps) {
-		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
+	info = rcsi2_mbps_to_info(priv, priv->info->hsfreqrange, mbps);
+	if (!info)
 		return -ERANGE;
-	}
 
-	if (hsfreq_prev &&
-	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
-		hsfreq = hsfreq_prev;
-
-	rcsi2_write(priv, priv->info->regs->phypll, PHYPLL_HSFREQRANGE(hsfreq->reg));
+	rcsi2_write(priv, priv->info->regs->phypll, PHYPLL_HSFREQRANGE(info->reg));
 
 	return 0;
 }
@@ -1468,27 +1480,15 @@ static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
 }
 
 static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
-				 const struct rcsi2_mbps_reg *values, u8 code)
+				 const struct rcsi2_mbps_info *values, u8 code)
 {
-	const struct rcsi2_mbps_reg *value;
-	const struct rcsi2_mbps_reg *prev_value = NULL;
+	const struct rcsi2_mbps_info *info;
 
-	for (value = values; value->mbps; value++) {
-		if (value->mbps >= mbps)
-			break;
-		prev_value = value;
-	}
-
-	if (prev_value &&
-	    ((mbps - prev_value->mbps) <= (value->mbps - mbps)))
-		value = prev_value;
-
-	if (!value->mbps) {
-		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
+	info = rcsi2_mbps_to_info(priv, values, mbps);
+	if (!info)
 		return -ERANGE;
-	}
 
-	return rcsi2_phtw_write(priv, value->reg, code);
+	return rcsi2_phtw_write(priv, info->reg, code);
 }
 
 static int __rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv,
-- 
2.45.1


