Return-Path: <linux-media+bounces-32245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5660AB2A23
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 19:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B505178339
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 17:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F6D25DD1B;
	Sun, 11 May 2025 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="blps3hId";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bz4dkhaM"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CC025DAFB;
	Sun, 11 May 2025 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985670; cv=none; b=UhRZIU7SQCqdXDb8YgIiODyv+kjvXo15aV7PzvUOjjVE/NDe4kvJkvm4IyQllXN3MDpccM5Dp2T0yiR2YjpbAi5bGZuHg39CWbL55uaRxe+Dgs9wZw7ehSbCDjSiG2D7sivO66Y8GCO9/x0x76O4aSRukzkozkaFwVBRce3uHBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985670; c=relaxed/simple;
	bh=k3Gmb9FGLYqj2/UHyCyMxg167WApCcovw55tCqjlz+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZKd2K/jrEVdkou4009Go7AU0RngiW+3BFXBcp87EVBgg8yCTNrfF6TCfSpv+En2ebp+sW/A0M9fHSVL+Tibkh8P2TGi/iWni2wHthFVbW7n7i6dL2NDQjxmT+EmzYVkGE46NVkFZAZ7syylR4Sj42xGPxTEdf7eKbHXx28l1SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=blps3hId; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bz4dkhaM; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4CA4A11400DE;
	Sun, 11 May 2025 13:47:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 11 May 2025 13:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746985667;
	 x=1747072067; bh=5JIo8HWrCToF+YmnTCKZCbVbV6TkVcmARLtQZlL99II=; b=
	blps3hIdxCs8Hgprvs47E/jPKZFRYh6Mt3jgL+7nG/lGlW+7Aedb0vdRDG04N0O7
	bFTHEqbZmQKEgNh7qTcPnPTUevovSSXw/ShkpP4ez4Eju7fV+tujxVLdmaTPhLRp
	k/kqRSzDIdCbwZGKnvjAYqQDvVRDb4PinUeqjqs44cqckRrtXfZuEFgHzuwhv7Iw
	yVsIvo9rNjkAgY46ceRnDias7QeC4EEByV0qlyBunx3GKVB39+abiYErVnGb4bdY
	s5A8cyxNtUgWc7BDv9WqSjJxcR057vySvYP8s3C1/Nyke194D6eqxTM1DrvY6/Pw
	Mpvz60AHPQG922MNjKnk7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746985667; x=
	1747072067; bh=5JIo8HWrCToF+YmnTCKZCbVbV6TkVcmARLtQZlL99II=; b=B
	z4dkhaMw077yFX48399XzQ7NYXzmQpNvMamr6mQkYuLYWmML6eQWOvZFXgGDHB96
	g1UwszGMK5+J6vrHU3ZczasbFE2fMosXOntnqQI6E++2Ru8xz3G56rBZBtSc+4Y1
	cw0WF1FxoYLQaOnD1HLcKX5tuNM/mJfzx5nOhegm1B+8Gepy1GZxBeN8yMDC1udc
	xgCiRdIaCsE8bDl3TdloxcGhM3hgkXw7LQCps60a/3VWYCEXuNt9YIa9MTi0iaZl
	wKdhtvDpTwZSCyBtxCFrO8FlgnmYdPJWaAhHSz0OnebcJDjXPTZIfa8+5r1XTBFH
	oecfP+LZNIE6Zy01Ohxow==
X-ME-Sender: <xms:w-IgaK3jAfu7LSDUU9pUyxnUT5J4ixoQXUGq4HpXEj06_COetnUgsw>
    <xme:w-IgaNF6zcNGvW4N05ZffWTzDWqgibMAqbLUXTgK3ssum0Vu52i6pYq3FtUpSt4Ik
    WVOLUvuFiNPxkwTYoU>
X-ME-Received: <xmr:w-IgaC5p4WhoINHPKrGBeoXUbu1BwXxM-1wX303Do9JPkHXFDslfZ7SrH1G036GMNr0iNMmXzLkuL3STGM1Yb6mh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeltddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
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
X-ME-Proxy: <xmx:w-IgaL2IxEs5mP33bg5H1mxKkTYzPpcAvyLIvqKdiyFQPBEPAmLDRA>
    <xmx:w-IgaNHKBwa1YVTZl9c_EJZH_9cgPTE5ynTKEbQQ_vCv9cTs_w9Arw>
    <xmx:w-IgaE-9G0mI_Vfy8Os7D90q28k6YR-ycctRowDYYniFTskgZ9M1kA>
    <xmx:w-IgaCkmVob-A7cJUkJDX5XtsXAXIaLlY4K7oxzyz5cSgoCFmjvauw>
    <xmx:w-IgaFedGk0J9WPVmXUhD9uI3ulGslsTl_HPS2PtWFuiQQ80L7RZpc6K>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 13:47:46 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/4] media: rcar-csi2: Update start procedure for V4H
Date: Sun, 11 May 2025 19:47:29 +0200
Message-ID: <20250511174730.944524-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for adding D-PHY support to the driver by first updating the
generic startup procedure that covers both C-PHY and D-PHY operations.
The starting procedure where updated in later versions of the datasheet.

Most of the configuration is only documented as tables of magic values
in the documentation. Each step is however marked with a T<n> marker,
inject these markers in the comments to make it easier to map driver to
documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 84 +++++++++++++++-------
 1 file changed, 58 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index cdd358b4a973..7ba637d8683b 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1199,7 +1199,8 @@ static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
 	return -ETIMEDOUT;
 }
 
-static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
+static const struct rcsi2_cphy_setting *
+rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 {
 	const struct rcsi2_cphy_setting *conf;
 	int msps;
@@ -1214,7 +1215,7 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 
 	if (!conf->msps) {
 		dev_err(priv->dev, "Unsupported PHY speed for msps setting (%u Msps)", msps);
-		return -ERANGE;
+		return NULL;
 	}
 
 	/* C-PHY specific */
@@ -1278,27 +1279,14 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 	/* TODO: This registers is not documented. */
 	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
 
-	/* Leave Shutdown mode */
-	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
-	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
-
-	/* Wait for calibration */
-	if (rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_PHY_READY)) {
-		dev_err(priv->dev, "PHY calibration failed\n");
-		return -ETIMEDOUT;
-	}
-
-	/* C-PHY setting - analog programing*/
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 9), conf->lane29);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 7), conf->lane27);
-
-	return 0;
+	return conf;
 }
 
 static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 				    struct v4l2_subdev_state *state)
 {
 	const struct rcar_csi2_format *format;
+	const struct rcsi2_cphy_setting *cphy;
 	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int mbps;
@@ -1318,24 +1306,35 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	if (mbps < 0)
 		return mbps;
 
-	/* Reset LINK and PHY*/
+	/* T0: Reset LINK and PHY*/
 	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
 	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, 0);
 	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, 0);
 
-	/* PHY static setting */
-	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK);
+	/* T1: PHY static setting */
+	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK |
+		    V4H_PHY_EN_ENABLE_0 | V4H_PHY_EN_ENABLE_1 |
+		    V4H_PHY_EN_ENABLE_2 | V4H_PHY_EN_ENABLE_3);
 	rcsi2_write(priv, V4H_FLDC_REG, 0);
 	rcsi2_write(priv, V4H_FLDD_REG, 0);
 	rcsi2_write(priv, V4H_IDIC_REG, 0);
 	rcsi2_write(priv, V4H_PHY_MODE_REG, V4H_PHY_MODE_CPHY);
 	rcsi2_write(priv, V4H_N_LANES_REG, lanes - 1);
 
-	/* Reset CSI2 */
+	rcsi2_write(priv, V4M_FRXM_REG,
+		    V4M_FRXM_FORCERXMODE_0 | V4M_FRXM_FORCERXMODE_1 |
+		    V4M_FRXM_FORCERXMODE_2 | V4M_FRXM_FORCERXMODE_3);
+	rcsi2_write(priv, V4M_OVR1_REG,
+		    V4M_OVR1_FORCERXMODE_0 | V4M_OVR1_FORCERXMODE_1 |
+		    V4M_OVR1_FORCERXMODE_2 | V4M_OVR1_FORCERXMODE_3);
+
+	/* T2: Reset CSI2 */
 	rcsi2_write(priv, V4H_CSI2_RESETN_REG, BIT(0));
 
 	/* Registers static setting through APB */
 	/* Common setting */
+	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(10), 0x0030);
+	rcsi2_write16(priv, V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(2), 0x1444);
 	rcsi2_write16(priv, V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(0), 0x1bfd);
 	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_STARTUP_1_1_REG, 0x0233);
 	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(6), 0x0027);
@@ -1350,15 +1349,48 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	rcsi2_write16(priv, V4H_PPI_RW_LPDCOCAL_COARSE_CFG_REG, 0x0105);
 	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(6), 0x1000);
 	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(0), 0x0000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(1), 0x0400);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(3), 0x41f6);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(0), 0x0000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(3), 0x43f6);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(6), 0x3000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(7), 0x0000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(6), 0x7000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(7), 0x0000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(5), 0x4000);
 
-	/* C-PHY settings */
-	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
-	if (ret)
-		return ret;
+	/* T3: PHY settings */
+	cphy = rcsi2_c_phy_setting_v4h(priv, mbps);
+	if (!cphy)
+		return -ERANGE;
 
+	/* T4: Leave Shutdown mode */
+	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
+	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
+
+	/* T5: Wait for calibration */
+	if (rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_PHY_READY)) {
+		dev_err(priv->dev, "PHY calibration failed\n");
+		return -ETIMEDOUT;
+	}
+
+	/* T6: Analog programming */
+	for (unsigned int l = 0; l < 3; l++) {
+		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 9),
+			      cphy->lane29);
+		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 7),
+			      cphy->lane27);
+	}
+
+	/* T7: Wait for stop state */
 	rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_STOPSTATE_0 |
 				 V4H_ST_PHYST_ST_STOPSTATE_1 |
-				 V4H_ST_PHYST_ST_STOPSTATE_2);
+				 V4H_ST_PHYST_ST_STOPSTATE_2 |
+				 V4H_ST_PHYST_ST_STOPSTATE_3);
+
+	/* T8: De-assert FRXM */
+	rcsi2_write(priv, V4M_FRXM_REG, 0);
 
 	return 0;
 }
-- 
2.49.0


