Return-Path: <linux-media+bounces-34646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C6AD7987
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 20:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D751895D50
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 18:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A7F2C3774;
	Thu, 12 Jun 2025 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="U48uJFBh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nAUx7S5k"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68DB2BEC30;
	Thu, 12 Jun 2025 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749751346; cv=none; b=mWZRTn5ZwJ3TrX0Q17m9NBkARwa2EIstnL3GtkFqh4Fq+WiIcmK++KFHdluiJYH0NgbkWaqS6v7op+uwpDP2/eis7HQIZ2y3INDm1RPjtwboX1bAgKlGyYnu6nmGyOMu9NAxkHCjEtaNdjuDY5NGIJGg+/IocT/mqlf6ziqzpC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749751346; c=relaxed/simple;
	bh=nwDlxAtOlhjJM4Xjlbp8JBM5haGjiLchTZGr9hYo6FU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qK1arIpWZ5oY3r7acT5Xi6D5MvcLBcxC0g4fmRaLez9t1khz6pP6VgNlgp3A468jfu9yYUm/ayvUkrm0Ahki8C1DRAzNUifNHAv1bUes4VGdWPb4mpcsENL9jL2e8HNHFxROFh6yoW1WDhhJVrT8w9OdafsqNo38HV87N47W0p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=U48uJFBh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nAUx7S5k; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E4067114015F;
	Thu, 12 Jun 2025 14:02:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 12 Jun 2025 14:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749751343;
	 x=1749837743; bh=nu/VJyqRnWA9dsju7J1r88CEiiMfhfLFYNdLZK3KY6w=; b=
	U48uJFBhn9lh9rYs1fyg/OL6bwTFXM8jAFn/VzUoRk4Ef6nbiUQx2D6cDc5us182
	RAEZYFq+M9lMBsGjaLWYzEj8L8Xbq/KBOqlYdBGzmtay5TTKxqcRwnvSJWC9b5KG
	4yvdlSkOgvSMRJK5LYnSnf/dvYR5grMuNIGS5z/j7PFEvowqYRSf2BQx+I2+wClK
	zNDWyuGjUSCGdHMQ+/fIdiM0srYcuW8bCRyQToY3ka72Y5TCJ+UZ3GcRIpvqIc8H
	6Uz9Y/oNEDsax8Z0eYY4XGbDMv7FWUdu9SLNHVbX3FbJppfSYMPH3tVD3J8WoIuT
	7bv5xcssH8UtiyarszI4Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749751343; x=
	1749837743; bh=nu/VJyqRnWA9dsju7J1r88CEiiMfhfLFYNdLZK3KY6w=; b=n
	AUx7S5kNT1fc4iEZXJCfvklV7k5FOgFv5PpYMOX98FPI9uddDTricUSvF+pU22wE
	4prW4mjVQxdF245Y8q58oLNMVf4IN7mFg+F/mVOHX4aJoBvKa3bbgUz4nA7PAR1I
	RXCoo1R4W58c0Qk9W80+Bb/7ol9pupZi2kuOcpv6ctner+BBiyWWD3uUvbnPB+/1
	+As3mUtWkJbc9sstI2WyYFHkQUj/ONE8AK+QPpu7qVPRkfcMv7f1sqpEnLoszdHg
	wPa9qFQzW35C7U1BpfFdq+NVG5KtAS+Kk3ifayCy0OmX9UejUAtbrhWaVi68NdeR
	rcJTjVZK7nyr2SOBoPbEw==
X-ME-Sender: <xms:LxZLaNQXsmpKEZ8BIXebPfLEtWGlEnq9EU1sspI5vKVY8K12rzTp7g>
    <xme:LxZLaGy5ooZ6UE7npqtEM_23SW61l3lDFOdmmjjc0IrvvDAXd9Zia8f57xxWTyBfc
    D5sWdjZibBiol4awfs>
X-ME-Received: <xmr:LxZLaC1T0BSuIblO11GeJqf502v5Brnj4OFcGdAfuydicN3CiXl4XBk2TPraW98W_Gka46-jVeZN7hSdIRQ1JKty>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheejgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:LxZLaFBEzf9V4loLaJu3p8DcBSnAILR94iwqH20hbTrnxpCHQG7_bQ>
    <xmx:LxZLaGi6yet2wBW3qRMQkTrmbtlkRqashb-keSG14PoMAbNn0LOCmA>
    <xmx:LxZLaJpqJCvnUcAKV_T7sWKffyJiCtSOl-1XzSeyb_LTLNZ81lKMCA>
    <xmx:LxZLaBhR3Vrf26N5ENxXPMIuRQYoi5RWK0s_hQLtj8N1Ou4xRTgHAA>
    <xmx:LxZLaAYp3OMMU_dpXX4CIv7qe7ytXC5rVPuDAt7GM9gGIJW7WzBv-ijz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 14:02:23 -0400 (EDT)
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
Subject: [PATCH v4 1/4] media: rcar-csi2: Clarify usage of mbps and msps
Date: Thu, 12 Jun 2025 19:59:01 +0200
Message-ID: <20250612175904.1126717-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612175904.1126717-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250612175904.1126717-1-niklas.soderlund+renesas@ragnatech.se>
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


