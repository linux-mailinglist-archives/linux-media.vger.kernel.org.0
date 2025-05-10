Return-Path: <linux-media+bounces-32230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B034AB254D
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 22:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9A43A00F44
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 20:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C92288515;
	Sat, 10 May 2025 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nEqQKBB5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="liE+AQMw"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B42882CC;
	Sat, 10 May 2025 20:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746910592; cv=none; b=SQ88lKkT7o42O5CTlpox2UgXIUwAS01Qh7xWqoy4aVuSMbaz9oWz3Tv8aw2M89H4xvRTRYeP3TZDTuAJN9taWgdwLHsM8a1EWTMNoC006Eng6S2c/0oBeAi4/+A9V4BTe/fvYN/mwpw2erkPwewUyz5XErl+MCZbV2raE3RqeBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746910592; c=relaxed/simple;
	bh=lcmUmoth+lVy1eg+/yMRVW2RsHxq7GOS7fDQDE5PvHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fLoZNYbytFFHIxu3KwRAtr30j3Tk9UirrC/Y5YNS9V6XKqEhTeJQn9G3vCUutET851LKkAUO5YiXYugPfywbdr/00BYQbIsaZaaorH3RaLVyAS7hS1TZ/BRCDPFb+HhUmvX2vV2xRDSDTygt5qwcOZBTYCx7dJNyweXHXp0e3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nEqQKBB5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=liE+AQMw; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B3E6711400C2;
	Sat, 10 May 2025 16:56:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 10 May 2025 16:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746910589;
	 x=1746996989; bh=EXp8SmgYG33LkCaBNbOq3ab+opOkOt9IjNx27S1vRnE=; b=
	nEqQKBB5x6HK0l7AJk4fXYZrOFvQFKpifdaolY9nRkRuVY9uiyE0E5j6U9wUh8T4
	GsJozdEJxfgiTe1wBfox02gCWJRgXrGRBqaFa56d+RWr0btEPNDzBYMTHwW8SKxd
	ywPOYElNXLMkV8xFFrzzn+IZ2PdE+9X+1RnSBsFOWll0ImxNFChl97x67la7VLW3
	J4SxpAMBy9/cAYpbXqs7uMljPhterramis67xri3dQ4eT1hvVVV9ypf3BZPvU/Bc
	zOANbAjKq2xYQcqXj997+IUup26cm4yhdUQFWOjGDctRUcrQWjhyE8ax0NZghodQ
	MkrDOZkevdj7T1UQazth7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746910589; x=
	1746996989; bh=EXp8SmgYG33LkCaBNbOq3ab+opOkOt9IjNx27S1vRnE=; b=l
	iE+AQMwAbfTm/67YlHENf3Osopwxnn52wS8C/TYquQ2Bn9pMPw9fHoZXQgB8M14w
	yiaODGZVHP6C94ONuhZpaeSaj5b1eYXyk1NPb40xBzLVYKbnd2ZxNHRhD3H2ZzTc
	tvKfKOWcKqA27Lp8am/FWoUMKrhQjMbwrK14g1NF6ut7Dmh8fzN3caXY58Tzl91C
	QOuFIMxT5T9SD3qdVxPuYC5AZqhvPX05Lgu9tL0WjMPIVdw3h9xUQQjN/fYvx9rC
	BFCs8voil7pQALos/HMu9d906TJc9pWFmqrbhRLDKlYKS3MtKyYIucUbIefo3ytl
	Su+WjnYoxGPb+UmgdhCzA==
X-ME-Sender: <xms:fb0faJn_q2EeGW5jFqzs3gSCzgo7Etd4O72SDof_nyo9-BOJhh3Idw>
    <xme:fb0faE1m4bQ7mo8H8rJZuInOr5QLGg9pmlHvW4QGNHUktN6r_QyP1fPlDp2u5Z-AD
    CpP7Fuhkpwiumaq4_8>
X-ME-Received: <xmr:fb0faPoUPpIi16mlpGn0QhEvMbAKamHdKaCKqfw-iVqMaHbHkcYcUoWytyNNkVdn4mOw1YdDebgbE9G-Dz9Es6ao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeiheduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:fb0faJn2onL1BabF2hcXBRxwqn_thndR82etRO2mHEBZ67kcsSQvbQ>
    <xmx:fb0faH05QHgaDNj_8M14l97lLSoS68cwrWsPsZ4mwyclm_Tr-gZ_5w>
    <xmx:fb0faItkIc3Vy5Fivhh1Tg9uO5iSBRqHDYQ_JdAedCfXYZQx7VwtnQ>
    <xmx:fb0faLVCTgRyL2khnUTsaJgNFcafA5y1237ixg_vSrebwW7UNC_7wQ>
    <xmx:fb0faICzrHVYqrzMnREQFAXOylqz90IVqmt8k50C0rM17H1uQnTKslAA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 May 2025 16:56:28 -0400 (EDT)
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
Subject: [PATCH 3/4] media: rcar-csi2: Update start procedure for V4H
Date: Sat, 10 May 2025 22:55:33 +0200
Message-ID: <20250510205534.4163066-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510205534.4163066-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250510205534.4163066-1-niklas.soderlund+renesas@ragnatech.se>
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
index d7f8b10cd215..f0145f550d7f 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1200,7 +1200,8 @@ static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
 	return -ETIMEDOUT;
 }
 
-static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
+static const struct rcsi2_cphy_setting *
+rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 {
 	const struct rcsi2_cphy_setting *conf;
 	int msps;
@@ -1215,7 +1216,7 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 
 	if (!conf->msps) {
 		dev_err(priv->dev, "Unsupported PHY speed for msps setting (%u Msps)", msps);
-		return -ERANGE;
+		return NULL;
 	}
 
 	/* C-PHY specific */
@@ -1279,27 +1280,14 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
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
@@ -1319,24 +1307,35 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
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
@@ -1351,15 +1350,48 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
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


