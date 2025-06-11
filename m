Return-Path: <linux-media+bounces-34519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AED45AD5B0B
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 17:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B69D3188598E
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 15:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F791EB5FE;
	Wed, 11 Jun 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Brweanwd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nAiTFMba"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655591DED4C;
	Wed, 11 Jun 2025 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656719; cv=none; b=DtMgmtQudLwW5EGlqofByNCfmGHvVZMp40Nb7SKlID3AvGyipSQAsSw0yF3QvlXRTeR0B4vRiLjacg3fnG2gf7f7GtS4S7qJW8C5d8YecNZi3p4Z7v5liIyNPxDufR7XAx/xF5zcJUQePxrzXIpwE3b6fhastjbjbKjTBo9WLR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656719; c=relaxed/simple;
	bh=nwDlxAtOlhjJM4Xjlbp8JBM5haGjiLchTZGr9hYo6FU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uwohC3hoe0LQWaszAv/nISlYoVyNyYML2gpCYf+2xbYsJ1J6CC8AVoi8BuEGQIdxy4WKWeGTvsi7gfZvxaA2nbFWbSRJBZCW/m6nNpxgvVbqsaPJFA4GgiA7F7wOUiI02A8kkD9DCFjhhzwkbs0v5uudaeKpjt3gaNeM/WPuZ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Brweanwd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nAiTFMba; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 8DEE113804E9;
	Wed, 11 Jun 2025 11:45:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 11 Jun 2025 11:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749656716;
	 x=1749743116; bh=nu/VJyqRnWA9dsju7J1r88CEiiMfhfLFYNdLZK3KY6w=; b=
	BrweanwdnHjuvCPsYx/mJFew6UT/+fiAjZZTkrRDnJXje8MAnQE1sMSqE89gPM9h
	x4NoKiAV276QaQR3kylUQZWjlGAEG8ar1etZlpLuzT9M4ZLp0EFtz/ekhs5tHu5V
	XlcVDqiW41agcdSUwhtcgEA6NoaeTRD/WMpP6LvbSjr8XCHShOHdB12H0VmQoxKd
	TThd+IzaoQQ0BVt7LGD6jiN+kwp+rJMD45r3TDb8+F79INw1G2WMxaJ7X8r/m5T0
	Egm++Oq5sfvpR4H519oFinzQEDi5SZ0CJuLJ+ueWkE0PqDlaEpQFXibNEtH0Vlmo
	fT0cr9VfuYWsYv7X09zxmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749656716; x=
	1749743116; bh=nu/VJyqRnWA9dsju7J1r88CEiiMfhfLFYNdLZK3KY6w=; b=n
	AiTFMbaHSN8HXXHQhlHT3IMX/BcUY6RnInGHnt7IOayS09ytCsz6y2In4jRLfnKH
	kgMMaP4jdIVeNWbLpRvXIj8xLUk2+Hv9ZGjSdm381I30aNw0Ic9rePnN1swLll9T
	izeTrgnM1w/1ndW97aYiDUTDldRY/u6VD0vQJ6XZTXX++4LyLFDjED1NKVB9BV63
	mOM7qKXyQ6SMunJP1dBrESM7AFtUs6s2lyfOLUIs8pygsHGY0OK2sieEJOdF2REI
	MaEf6Us+bldZDrNx+i1jhxcADC4YFPK1/+tKc7gE0R5bz/0uBFpEJ1QJFXreqrdz
	w/KniJfEJSNvnhI9qcqxg==
X-ME-Sender: <xms:jKRJaAPqTelDR53noQj83GH0bZPcggZWoHaX5TMFGoxLwPBq6FtnzA>
    <xme:jKRJaG9xJfMWtbHi-UBSYIsV1m5ILgndkkwzj06WtJUgMu_tqpSXeDT3W0e3JY2NR
    gEWEeeKljnZUR-TbCY>
X-ME-Received: <xmr:jKRJaHRej_bXTynPuf0VlGGoD1LW34vMe6_PyjKIDKy57FUgjPkC_QmMGQkRCDU1Xmzp6nOxBvpS_BNqqBQMvmLy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
    hiuggvrhdrsggvpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhi
    nhhtvghlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvg
    hsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhht
    rdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplh
    hinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvg
X-ME-Proxy: <xmx:jKRJaIvburkTl_S6Xvya0rHMb2OKicE_fW6I8JTeYodsjdsTDcDfLA>
    <xmx:jKRJaIcgNiAjfLOOP635V_HwWr6FPDwpwa9CQ2LK3dBjUv2c0WNs4g>
    <xmx:jKRJaM2_n-fb21G6pVJUuivpYBgjyFLmWhXpqVIIpGadaOvC-7sDJQ>
    <xmx:jKRJaM9p8C6rIzI48ajf-Sypexr8wq5qi33VVW1wzA2faBcB0GPwhw>
    <xmx:jKRJaH2sacwn0LKFzEdSrYHjdrw3CuyR8JtuwpdmleQFWPPebGt_Fmy2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 11:45:15 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 1/4] media: rcar-csi2: Clarify usage of mbps and msps
Date: Wed, 11 Jun 2025 17:44:42 +0200
Message-ID: <20250611154445.123412-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611154445.123412-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250611154445.123412-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The helper function to deal with calculating the link speed is designed
in such a way that it returns the correct type bps (bits per second) for
D-PHY and sps (symbols per second) for C-PHY. And for historical reasons
the function kept the name mbps.

This is confusing, fix it by having the function only deal with bps
values as this is the most common use-case and convert bps to sps in the
only function where it is needed to configure the C-PHY.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 9979de4f6ef1..358e7470befc 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -975,10 +975,6 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 
 	mbps = div_u64(freq * 2, MEGA);
 
-	/* Adjust for C-PHY, divide by 2.8. */
-	if (priv->cphy)
-		mbps = div_u64(mbps * 5, 14);
-
 	return mbps;
 }
 
@@ -1203,9 +1199,13 @@ static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
 	return -ETIMEDOUT;
 }
 
-static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
+static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 {
 	const struct rcsi2_cphy_setting *conf;
+	int msps;
+
+	/* Adjust for C-PHY symbols, divide by 2.8. */
+	msps = div_u64(mbps * 5, 14);
 
 	for (conf = cphy_setting_table_r8a779g0; conf->msps != 0; conf++) {
 		if (conf->msps > msps)
@@ -1301,7 +1301,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	const struct rcar_csi2_format *format;
 	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
-	int msps;
+	int mbps;
 	int ret;
 
 	/* Use the format on the sink pad to compute the receiver config. */
@@ -1314,9 +1314,9 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	if (ret)
 		return ret;
 
-	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
-	if (msps < 0)
-		return msps;
+	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	if (mbps < 0)
+		return mbps;
 
 	/* Reset LINK and PHY*/
 	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
@@ -1352,7 +1352,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
 
 	/* C-PHY settings */
-	ret = rcsi2_c_phy_setting_v4h(priv, msps);
+	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
 	if (ret)
 		return ret;
 
@@ -1363,7 +1363,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	return 0;
 }
 
-static int rcsi2_d_phy_setting_v4m(struct rcar_csi2 *priv, int data_rate)
+static int rcsi2_d_phy_setting_v4m(struct rcar_csi2 *priv, int mbps)
 {
 	unsigned int timeout;
 	int ret;
-- 
2.49.0


