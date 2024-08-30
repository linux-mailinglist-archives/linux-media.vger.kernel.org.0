Return-Path: <linux-media+bounces-17248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC2966AB4
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78ECC284C3E
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275ED1BE256;
	Fri, 30 Aug 2024 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LPfpuaSI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uE/nIs6+"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673D61C1756;
	Fri, 30 Aug 2024 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050115; cv=none; b=hP4/gBbqrzgIQQlXLQeFTODUUBYNC/tgpq+BGBcDbpi4jALZp1FgMY5HAlll1qLzgCczQuiRw9r7N4W3gCCAwkMmefe/ccGeGV/WYgJSnlZPHHb+0URv7SA+zxaJS1wzZsbeI270z5/ESWbgGJb4q/rB7FcaMZfSU6MI403Be/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050115; c=relaxed/simple;
	bh=ZObgsg5vid+wlOQoORQuIZ0GNpMv9U7NCEFFmgPgOaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRVbvLa5jhAOTajmMBYX2D1z6u9p2ae89WHn8ptNScWMUqNG5wcyeD+/+w1LH11RYto7jkTWb0E/zbOsbP/JALb1ZTASindYYiI+clp5X4OVMfWFTnfxjhXjHCC7faHV2hh5KtG6x0QqapuZNXTyfhZQR0e/bNKxdUMyRdQrzRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LPfpuaSI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uE/nIs6+; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 84A3D1140122;
	Fri, 30 Aug 2024 16:35:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 30 Aug 2024 16:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725050112;
	 x=1725136512; bh=UNOtOhMF9lyj1v4QkNpTkB/0jd1e0xbdsmGxpvNVlGo=; b=
	LPfpuaSIbWVdSp0aX5OJB06nab/wYEvYpFtxU+6/N7yBzCFVR10wMLngdFsSoW2h
	wAF/jzyiGUDCe15+biROt7M5UA8Nb1mnfT1mbdWWi1jNoZoLn7Ssx/IMUEmVp/tC
	UnHSF5BxbV8B3at4WSIk05lyqliNZM4SKj2gXuzASyXkihBATk82uqVtHNd1OgNu
	r0lOfhVjbq2FhHNe7NUeOfWlG9SPgNVoclAOQxZhm5hpCF+m5YGWDJJuo9m6M9cM
	l9lWa1cKCBbsfq3aT3uJgqkWLyYjinIyOL76ReNakH/L7IfgnLcX2B+EzjYrcWFw
	MyyciezfQVIeUbMwVVc4Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725050112; x=
	1725136512; bh=UNOtOhMF9lyj1v4QkNpTkB/0jd1e0xbdsmGxpvNVlGo=; b=u
	E/nIs6+U+RPaVgVS2WroBgGjvcA0PU4vpEPLFfrfN1SF0bdwsMplYyqrbvEBowHp
	eqq71fs4y4pqZXgpOhHeOIIJE5dRKQKh95gt6At/YUAz0y0iIjpSRXX64Y+/G0fj
	yZcj5Z0+XzFFepb0YQzrfnGkyoXOdNa3kKl1FuXvle/ta79/GKNzueHJyCQJK/Q3
	gCRxvRXO/79qxBCkaux/dfdv+rCsnk1XT56njhOC03eEv09xl9qvUnjUcdtxau6+
	DgJRW/sHOLshzWyAr1gdvL5e+SuXmIebn6FI4PWGFBXSGnqGYRw8iolr/Pfx+6Kh
	EwgPNNHZOtMvszwViLDNg==
X-ME-Sender: <xms:AC3SZofcozY4Q7vCg-GjkpZBhtujSgYGYnZ12z5AfS5NShNVMbHirQ>
    <xme:AC3SZqNLUCKBn44adPYeU0k_Vnz4LnNhB4RRDWI9smZB-xLO0xWc_QvE_gxZP7ugz
    J8Dc3qUYlq1j6qPOks>
X-ME-Received: <xmr:AC3SZpj-yMuig5P9kZOWJgVXxJ9vmDzjNIiMyo9d8bGTvqw93mXREe4XhUqakkyyGnXi_6dwBunlLzsAK_lAO6tAuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhiodgu
    theslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:AC3SZt9iVCJqDzkoE7sI0iWE3E7ALwDAWMfz6Tvv61g9pMwpmxFJew>
    <xmx:AC3SZks3mjJ1g1kuPyxLUZr2vcYFBoVowz4KiwnrrUKZpBxZPys8gg>
    <xmx:AC3SZkGJYZ3EKKQTO7KDwNjaDkStx7GaU6XnWcCOgcSPILHBpOB_XQ>
    <xmx:AC3SZjNoYfyVOh1nuOklMmW2gFdnwiVlh_tjr09NmAi2H2D-v3fjKA>
    <xmx:AC3SZkFu4Ih3kLGISNihx30_tXJHL3kSotRHjpz12EKTR_b37nyezVuY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:35:11 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 8/8] media: rcar-csi2: Add support for R-Car V4M
Date: Fri, 30 Aug 2024 22:31:04 +0200
Message-ID: <20240830203104.3479124-9-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The V4M is the second Gen4 device that is enabled in the rcar-csi2
driver. There is much overlap with the already supported V4H device. The
registers that where new on Gen4 and where added with the V4H prefix are
retained and only new registers unique to the V4M are added with the new
V4M prefix. This follows the style for when V4H was added which had an
overlap with Gen3 registers.

The V4M CSI-2 receiver supports D-PHY mode only, either in 1-, 2- or
4-lane configuration. The datasheets do not document lane swapping and
is left out for now.

While the V4M only supports D-PHY the configuration for it is added in
such a way that it can be reused for V4H which supports both C-PHY and
D-PHY. No known SoC exists to test the D-PHY configuration on V4H so
it's not wired-up.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Update to use subdevice active state as this have changed upstream.
---
 drivers/media/platform/renesas/rcar-csi2.c | 294 +++++++++++++++++++++
 1 file changed, 294 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 386037a13786..472e62306832 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -247,6 +247,25 @@ static const struct rcsi2_cphy_setting cphy_setting_table_r8a779g0[] = {
 	{ /* sentinel */ },
 };
 
+/* V4M registers */
+#define V4M_OVR1_REG					0x0848
+#define V4M_OVR1_FORCERXMODE_3				BIT(12)
+#define V4M_OVR1_FORCERXMODE_2				BIT(11)
+#define V4M_OVR1_FORCERXMODE_1				BIT(10)
+#define V4M_OVR1_FORCERXMODE_0				BIT(9)
+
+#define V4M_FRXM_REG					0x2004
+#define V4M_FRXM_FORCERXMODE_3				BIT(3)
+#define V4M_FRXM_FORCERXMODE_2				BIT(2)
+#define V4M_FRXM_FORCERXMODE_1				BIT(1)
+#define V4M_FRXM_FORCERXMODE_0				BIT(0)
+
+#define V4M_PHYPLL_REG					0x02050
+#define V4M_CSI0CLKFCPR_REG				0x02054
+#define V4M_PHTW_REG					0x02060
+#define V4M_PHTR_REG					0x02064
+#define V4M_PHTC_REG					0x02068
+
 struct phtw_value {
 	u8 data;
 	u8 code;
@@ -255,6 +274,7 @@ struct phtw_value {
 struct rcsi2_mbps_info {
 	u16 mbps;
 	u8 reg;
+	u16 osc_freq; /* V4M */
 };
 
 static const struct rcsi2_mbps_info phtw_mbps_v3u[] = {
@@ -506,6 +526,73 @@ static const struct rcsi2_mbps_info hsfreqrange_m3w[] = {
 	{ /* sentinel */ },
 };
 
+static const struct rcsi2_mbps_info hsfreqrange_v4m[] = {
+	{ .mbps =   80, .reg = 0x00, .osc_freq = 0x01a9 },
+	{ .mbps =   90, .reg = 0x10, .osc_freq = 0x01a9 },
+	{ .mbps =  100, .reg = 0x20, .osc_freq = 0x01a9 },
+	{ .mbps =  110, .reg = 0x30, .osc_freq = 0x01a9 },
+	{ .mbps =  120, .reg = 0x01, .osc_freq = 0x01a9 },
+	{ .mbps =  130, .reg = 0x11, .osc_freq = 0x01a9 },
+	{ .mbps =  140, .reg = 0x21, .osc_freq = 0x01a9 },
+	{ .mbps =  150, .reg = 0x31, .osc_freq = 0x01a9 },
+	{ .mbps =  160, .reg = 0x02, .osc_freq = 0x01a9 },
+	{ .mbps =  170, .reg = 0x12, .osc_freq = 0x01a9 },
+	{ .mbps =  180, .reg = 0x22, .osc_freq = 0x01a9 },
+	{ .mbps =  190, .reg = 0x32, .osc_freq = 0x01a9 },
+	{ .mbps =  205, .reg = 0x03, .osc_freq = 0x01a9 },
+	{ .mbps =  220, .reg = 0x13, .osc_freq = 0x01a9 },
+	{ .mbps =  235, .reg = 0x23, .osc_freq = 0x01a9 },
+	{ .mbps =  250, .reg = 0x33, .osc_freq = 0x01a9 },
+	{ .mbps =  275, .reg = 0x04, .osc_freq = 0x01a9 },
+	{ .mbps =  300, .reg = 0x14, .osc_freq = 0x01a9 },
+	{ .mbps =  325, .reg = 0x25, .osc_freq = 0x01a9 },
+	{ .mbps =  350, .reg = 0x35, .osc_freq = 0x01a9 },
+	{ .mbps =  400, .reg = 0x05, .osc_freq = 0x01a9 },
+	{ .mbps =  450, .reg = 0x16, .osc_freq = 0x01a9 },
+	{ .mbps =  500, .reg = 0x26, .osc_freq = 0x01a9 },
+	{ .mbps =  550, .reg = 0x37, .osc_freq = 0x01a9 },
+	{ .mbps =  600, .reg = 0x07, .osc_freq = 0x01a9 },
+	{ .mbps =  650, .reg = 0x18, .osc_freq = 0x01a9 },
+	{ .mbps =  700, .reg = 0x28, .osc_freq = 0x01a9 },
+	{ .mbps =  750, .reg = 0x39, .osc_freq = 0x01a9 },
+	{ .mbps =  800, .reg = 0x09, .osc_freq = 0x01a9 },
+	{ .mbps =  850, .reg = 0x19, .osc_freq = 0x01a9 },
+	{ .mbps =  900, .reg = 0x29, .osc_freq = 0x01a9 },
+	{ .mbps =  950, .reg = 0x3a, .osc_freq = 0x01a9 },
+	{ .mbps = 1000, .reg = 0x0a, .osc_freq = 0x01a9 },
+	{ .mbps = 1050, .reg = 0x1a, .osc_freq = 0x01a9 },
+	{ .mbps = 1100, .reg = 0x2a, .osc_freq = 0x01a9 },
+	{ .mbps = 1150, .reg = 0x3b, .osc_freq = 0x01a9 },
+	{ .mbps = 1200, .reg = 0x0b, .osc_freq = 0x01a9 },
+	{ .mbps = 1250, .reg = 0x1b, .osc_freq = 0x01a9 },
+	{ .mbps = 1300, .reg = 0x2b, .osc_freq = 0x01a9 },
+	{ .mbps = 1350, .reg = 0x3c, .osc_freq = 0x01a9 },
+	{ .mbps = 1400, .reg = 0x0c, .osc_freq = 0x01a9 },
+	{ .mbps = 1450, .reg = 0x1c, .osc_freq = 0x01a9 },
+	{ .mbps = 1500, .reg = 0x2c, .osc_freq = 0x01a9 },
+	{ .mbps = 1550, .reg = 0x3d, .osc_freq = 0x0108 },
+	{ .mbps = 1600, .reg = 0x0d, .osc_freq = 0x0110 },
+	{ .mbps = 1650, .reg = 0x1d, .osc_freq = 0x0119 },
+	{ .mbps = 1700, .reg = 0x2e, .osc_freq = 0x0121 },
+	{ .mbps = 1750, .reg = 0x3e, .osc_freq = 0x012a },
+	{ .mbps = 1800, .reg = 0x0e, .osc_freq = 0x0132 },
+	{ .mbps = 1850, .reg = 0x1e, .osc_freq = 0x013b },
+	{ .mbps = 1900, .reg = 0x2f, .osc_freq = 0x0143 },
+	{ .mbps = 1950, .reg = 0x3f, .osc_freq = 0x014c },
+	{ .mbps = 2000, .reg = 0x0f, .osc_freq = 0x0154 },
+	{ .mbps = 2050, .reg = 0x40, .osc_freq = 0x015d },
+	{ .mbps = 2100, .reg = 0x41, .osc_freq = 0x0165 },
+	{ .mbps = 2150, .reg = 0x42, .osc_freq = 0x016e },
+	{ .mbps = 2200, .reg = 0x43, .osc_freq = 0x0176 },
+	{ .mbps = 2250, .reg = 0x44, .osc_freq = 0x017f },
+	{ .mbps = 2300, .reg = 0x45, .osc_freq = 0x0187 },
+	{ .mbps = 2350, .reg = 0x46, .osc_freq = 0x0190 },
+	{ .mbps = 2400, .reg = 0x47, .osc_freq = 0x0198 },
+	{ .mbps = 2450, .reg = 0x48, .osc_freq = 0x01a1 },
+	{ .mbps = 2500, .reg = 0x49, .osc_freq = 0x01a9 },
+	{ /* sentinel */ },
+};
+
 /* PHY ESC Error Monitor */
 #define PHEERM_REG			0x74
 
@@ -1195,6 +1282,195 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	return 0;
 }
 
+static int rcsi2_d_phy_setting_v4m(struct rcar_csi2 *priv, int data_rate)
+{
+	unsigned int timeout;
+	int ret;
+
+	static const struct phtw_value step1[] = {
+		{ .data = 0x00, .code = 0x00 },
+		{ .data = 0x00, .code = 0x1e },
+	};
+
+	/* Shutdown and reset PHY. */
+	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
+	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
+
+	/* Start internal calibration (POR). */
+	ret = rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
+	if (ret)
+		return ret;
+
+	/* Wait for POR to complete. */
+	for (timeout = 10; timeout > 0; timeout--) {
+		if ((rcsi2_read(priv, V4M_PHTR_REG) & 0xf0000) == 0x70000)
+			break;
+		usleep_range(1000, 2000);
+	}
+
+	if (!timeout) {
+		dev_err(priv->dev, "D-PHY calibration failed\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int rcsi2_set_osc_freq(struct rcar_csi2 *priv, unsigned int mbps)
+{
+	const struct rcsi2_mbps_info *info;
+	struct phtw_value steps[] = {
+		{ .data = 0x00, .code = 0x00 },
+		{ .code = 0xe2 }, /* Data filled in below. */
+		{ .code = 0xe3 }, /* Data filled in below. */
+		{ .data = 0x01, .code = 0xe4 },
+	};
+
+	info = rcsi2_mbps_to_info(priv, priv->info->hsfreqrange, mbps);
+	if (!info)
+		return -ERANGE;
+
+	/* Fill in data for command. */
+	steps[1].data = (info->osc_freq & 0x00ff) >> 0;
+	steps[2].data = (info->osc_freq & 0x0f00) >> 8;
+
+	return rcsi2_phtw_write_array(priv, steps, ARRAY_SIZE(steps));
+}
+
+static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
+{
+	int ret;
+
+	static const struct phtw_value step1[] = {
+		{ .data = 0x00, .code = 0x00 },
+		{ .data = 0x3c, .code = 0x08 },
+	};
+
+	static const struct phtw_value step2[] = {
+		{ .data = 0x00, .code = 0x00 },
+		{ .data = 0x80, .code = 0xe0 },
+		{ .data = 0x01, .code = 0xe1 },
+		{ .data = 0x06, .code = 0x00 },
+		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x08, .code = 0x00 },
+		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x0a, .code = 0x00 },
+		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x0c, .code = 0x00 },
+		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x01, .code = 0x00 },
+		{ .data = 0x31, .code = 0xaa },
+		{ .data = 0x05, .code = 0x00 },
+		{ .data = 0x05, .code = 0x09 },
+		{ .data = 0x07, .code = 0x00 },
+		{ .data = 0x05, .code = 0x09 },
+		{ .data = 0x09, .code = 0x00 },
+		{ .data = 0x05, .code = 0x09 },
+		{ .data = 0x0b, .code = 0x00 },
+		{ .data = 0x05, .code = 0x09 },
+	};
+
+	if (priv->info->hsfreqrange) {
+		ret = rcsi2_set_phypll(priv, mbps);
+		if (ret)
+			return ret;
+
+		ret = rcsi2_set_osc_freq(priv, mbps);
+		if (ret)
+			return ret;
+	}
+
+	if (mbps <= 1500) {
+		ret = rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
+		if (ret)
+			return ret;
+	}
+
+	if (priv->info->csi0clkfreqrange)
+		rcsi2_write(priv, V4M_CSI0CLKFCPR_REG,
+			    CSI0CLKFREQRANGE(priv->info->csi0clkfreqrange));
+
+	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK |
+		    V4H_PHY_EN_ENABLE_0 | V4H_PHY_EN_ENABLE_1 |
+		    V4H_PHY_EN_ENABLE_2 | V4H_PHY_EN_ENABLE_3);
+
+	if (mbps > 1500) {
+		ret = rcsi2_phtw_write_array(priv, step2, ARRAY_SIZE(step2));
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int rcsi2_start_receiver_v4m(struct rcar_csi2 *priv,
+				    struct v4l2_subdev_state *state)
+{
+	const struct rcar_csi2_format *format;
+	const struct v4l2_mbus_framefmt *fmt;
+	unsigned int lanes;
+	int mbps;
+	int ret;
+
+	/* Calculate parameters */
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+	format = rcsi2_code_to_fmt(fmt->code);
+	if (!format)
+		return -EINVAL;
+
+	ret = rcsi2_get_active_lanes(priv, &lanes);
+	if (ret)
+		return ret;
+
+	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	if (mbps < 0)
+		return mbps;
+
+	/* Reset LINK and PHY */
+	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
+	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, 0);
+	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, 0);
+	rcsi2_write(priv, V4M_PHTC_REG, PHTC_TESTCLR);
+
+	/* PHY static setting */
+	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK);
+	rcsi2_write(priv, V4H_FLDC_REG, 0);
+	rcsi2_write(priv, V4H_FLDD_REG, 0);
+	rcsi2_write(priv, V4H_IDIC_REG, 0);
+	rcsi2_write(priv, V4H_PHY_MODE_REG, V4H_PHY_MODE_DPHY);
+	rcsi2_write(priv, V4H_N_LANES_REG, lanes - 1);
+
+	rcsi2_write(priv, V4M_FRXM_REG,
+		    V4M_FRXM_FORCERXMODE_0 | V4M_FRXM_FORCERXMODE_1 |
+		    V4M_FRXM_FORCERXMODE_2 | V4M_FRXM_FORCERXMODE_3);
+	rcsi2_write(priv, V4M_OVR1_REG,
+		    V4M_OVR1_FORCERXMODE_0 | V4M_OVR1_FORCERXMODE_1 |
+		    V4M_OVR1_FORCERXMODE_2 | V4M_OVR1_FORCERXMODE_3);
+
+	/* Reset CSI2 */
+	rcsi2_write(priv, V4M_PHTC_REG, 0);
+	rcsi2_write(priv, V4H_CSI2_RESETN_REG, BIT(0));
+
+	/* Common settings */
+	ret = rcsi2_init_common_v4m(priv, mbps);
+	if (ret)
+		return ret;
+
+	/* D-PHY settings */
+	ret = rcsi2_d_phy_setting_v4m(priv, mbps);
+	if (ret)
+		return ret;
+
+	rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_STOPSTATE_0 |
+				 V4H_ST_PHYST_ST_STOPSTATE_1 |
+				 V4H_ST_PHYST_ST_STOPSTATE_2 |
+				 V4H_ST_PHYST_ST_STOPSTATE_3);
+
+	rcsi2_write(priv, V4M_FRXM_REG, 0);
+
+	return 0;
+}
+
 static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
 {
 	int ret;
@@ -1832,6 +2108,20 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
 	.support_cphy = true,
 };
 
+static const struct rcsi2_register_layout rcsi2_registers_v4m = {
+	.phtw = V4M_PHTW_REG,
+	.phypll = V4M_PHYPLL_REG,
+};
+
+static const struct rcar_csi2_info rcar_csi2_info_r8a779h0 = {
+	.regs = &rcsi2_registers_v4m,
+	.start_receiver = rcsi2_start_receiver_v4m,
+	.hsfreqrange = hsfreqrange_v4m,
+	.csi0clkfreqrange = 0x0c,
+	.use_isp = true,
+	.support_dphy = true,
+};
+
 static const struct of_device_id rcar_csi2_of_table[] = {
 	{
 		.compatible = "renesas,r8a774a1-csi2",
@@ -1885,6 +2175,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.compatible = "renesas,r8a779g0-csi2",
 		.data = &rcar_csi2_info_r8a779g0,
 	},
+	{
+		.compatible = "renesas,r8a779h0-csi2",
+		.data = &rcar_csi2_info_r8a779h0,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);
-- 
2.46.0


