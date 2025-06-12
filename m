Return-Path: <linux-media+bounces-34648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8483AD798C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 20:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDE9E1895ED4
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 18:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EA92D29CD;
	Thu, 12 Jun 2025 18:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RRc5ZkrP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AebrKmrj"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741202D193B;
	Thu, 12 Jun 2025 18:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749751352; cv=none; b=kKE5khbDMJtLDcFOGmUAFrpwXEmNhK9E7aNJXB3FsHzIL1HdDsAjEL/quvchnKHqT+3mmXD+WAHBMUH5lyPahZMPPOqVErb/4yzy4GWME5RMDVKLyGbOwFJVRAuK9mgFckFqEd0tlX1fQBEq4uIsRyksU0OiJMiQAdgwzKR99/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749751352; c=relaxed/simple;
	bh=Ehj2bRl+YPJ6wraP8rqqlUbBkMrQmPJc/w52H7yj6u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iOqAeOlMGPvMmJroVVIkEdtNMpflPSxe/L65FHHlA5WjbGjmq03FqDjySJqz9tXns97W90IpNSRtNMCxKtTSK4NVpflLUpdtziBcLv3Rmi4hTLzDjCYfTKncleNgH45RBY2vW+Cf4idWH8CUF5FfmwhtVke2NX0jIFefPcI0fcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RRc5ZkrP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AebrKmrj; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DAEDC11401A6;
	Thu, 12 Jun 2025 14:02:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 12 Jun 2025 14:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749751349;
	 x=1749837749; bh=TZLM7m/EPWX/8yjxzBM5RTftEVmmUEDFg8aB+NUV0Og=; b=
	RRc5ZkrPA7HykTzcaqyh28E6+nDSCt0yObrzjWuzAS4QnVR/alZClkRpwFIIdsSV
	oKgQ6ABtPjSV8OIMdwKSMyxIbhBIqG6n65vQ/jSFc6n+uJfvP2HPkMl6lmeQiiiF
	cBOs1KmNVtWXjrvwjsnb1JxQO0T+6ffCZo79xlMNiU9A8T7xUVHvLvEq4Q2AGh1P
	Ci/9kgfoLLJ7Sy50AQqZbgm2NWKD+fwsL9T4jRlxEfDIMt4v0VyHxu/QgbeB7NQZ
	QJJ+JaZp0hhqx4zdthuvdb4GcdvbKHzdcaQyqMK41lfH1FKRT+yPJ+pgssLY4P+U
	ug64BKQdkz7KoqDMkLwllw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749751349; x=
	1749837749; bh=TZLM7m/EPWX/8yjxzBM5RTftEVmmUEDFg8aB+NUV0Og=; b=A
	ebrKmrjF6ar1xKX7xkSL75OUwK6pzfJKgEOs+GVPZEfbxMuK1W+eZ06P61JosTwI
	8YlQZ9QaB5YIVNogET/Vhzofr1FNw1ZoXV9gOSCmiSoJg92coBYVZZXB/Rdo2k7b
	2WGaE9Hf3cqpxnOI46VjbQL8Qawmpe7zDhevT/eyqugy06+MWgzW55tcUdYmAQP3
	6RedDTIGWyeEN1RGN86Pq6tt+qHZ4/LrTuu723ADwnqruZCIhtfWgmSpyBSsiU5X
	Axvq3Jso768qemD4sWswyFzhpIwm1kkbMoR8UPbQ7Ys7ufxzIryF75E68Ege0jls
	vo15+tJyvFrW9Av/r29bw==
X-ME-Sender: <xms:NRZLaDQbPunlXUjVqX-CFba7lV2d1M1KssLnTtJhGhR1Rh1I_yFwSQ>
    <xme:NRZLaExpyI-iYiAxEyM__amzbsrC9pS1K9S-DgeFp4sYRV1dKcFSdk5tT1szujJvE
    LdUTbzKdQiQenH5ABo>
X-ME-Received: <xmr:NRZLaI11XzhOnT5kksjGlO9oNtRCS9HsfUbPQa_EWxZw_5UAcDyjPeTE8K4-iKpIbOUfkH2QrxCWnkycx0pX573E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheejfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:NRZLaDAnIa0sv8BB3eXclG3CkdLnyZcfqXJ7sB9dkE6HEMx_ha7WcQ>
    <xmx:NRZLaMiT1nx9eG3t9aYnfUApFp1MF9g5QDC-t_rhLr5t92A5xq4Yhw>
    <xmx:NRZLaHo4aR3ld3Q3b5XWwiLm6xdhqe4gcudBUDDJl9V4bXAkAwwmlw>
    <xmx:NRZLaHg5oF1plWSUBpVpRaWiDhzoMeSA57RqCxh20xVYa71ZD9LUtA>
    <xmx:NRZLaAoyjSWHHEjNIqyIeeOTKM9uxDiNOqeDeA87zMMEu1NjNUHKPy5m>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 14:02:28 -0400 (EDT)
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
Subject: [PATCH v4 3/4] media: rcar-csi2: Update start procedure for V4H
Date: Thu, 12 Jun 2025 19:59:03 +0200
Message-ID: <20250612175904.1126717-4-niklas.soderlund+renesas@ragnatech.se>
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

Prepare for adding D-PHY support to the driver by first updating the
generic startup procedure that covers both C-PHY and D-PHY operations.
The starting procedure where updated in later versions of the datasheet.

Most of the configuration is only documented as tables of magic values
in the documentation. Each step is however marked with a T<n> marker,
inject these markers in the comments to make it easier to map driver to
documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


