Return-Path: <linux-media+bounces-17244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE046966AA8
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D28811C22075
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4DD1C173F;
	Fri, 30 Aug 2024 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fodV0kkp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W2xKvBgf"
X-Original-To: linux-media@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44801BF33D;
	Fri, 30 Aug 2024 20:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050107; cv=none; b=GEkqJLcq5Vp0+9/2B37CV4IlQFJwpvNR15nTFTlP4V83E3/Hn3RS0ihAW5TXQgIyLFrWkH7WfyM+6CYdCsMjQxuUI1v+uETKGUnn7Zmdz+C0eLJC12p+dr3YYzNyY23VbnxgsIBP1ejBmWmprX5AbAZEA9po/tWwlIvSHvfTl4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050107; c=relaxed/simple;
	bh=WUNz6y4voRiI4lcnqrqaRmOZ30otXWdyqupORu7kRh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mIMCkMPn9pFZ4nlSV3DLA35PJCMHejfOOKeQgbjLaHslw+AMd5lBRqYC+sTnfau7nn7M2dlAwt39a5zdD7M/VBZhDM0WowYV00t0FoPxEPSFrJVhIIOL+a0VKjr0yfYjcOQ2y5VATpC/0XAFsDgiWqfBLzH9QcIUiKtnQKEiBfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fodV0kkp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W2xKvBgf; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id ABDB913802B6;
	Fri, 30 Aug 2024 16:35:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 30 Aug 2024 16:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725050104;
	 x=1725136504; bh=G4r1nZQumfjbzcghcDspzxo9k7U5JAHA0SOW7OoBfxE=; b=
	fodV0kkpbftxYdILUpBagg0w9XkaciqSaw81YZnQCZwjKLMhjz8e4B+yVcOjqlME
	0I4+hSt3iXelcqI3B98A2H4Y0cxZpQDJV0gK2Z4AjY8JYCJBLoYpARviSDAuR21C
	CPdcyZQZDSE+vRbsdUZiVM/naW6QCH9tiHC/A75pb0ATBhxoHsKHKWCT01uL+oOM
	L412NydOHy5BIAJFMgM2uu3mxNP8+ZsvpidhQ/7rFtNBLVxJth/Oqi3J+7xvhgCK
	vLRVXgDqA1SAkFsCFSmCDRb6rgga6qr0lfZtBx+nVfctpNAlUBHmIRTGv0JhAsXm
	/nu1D76ZTIrEsSwMcvFsUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725050104; x=
	1725136504; bh=G4r1nZQumfjbzcghcDspzxo9k7U5JAHA0SOW7OoBfxE=; b=W
	2xKvBgfK4hqz4GKSaARr234lGxd/b/SnE722xo7nTVK4hV0znYvuI9+hSS2mW0cI
	qemgrdZ2CmjGeqMS3q48yzHAPqeDhgp+J25dHvjP1+bKJgUdjZ7blgANsMPquuVk
	ccx6BHI+mYdPf0ar4WSPlrVykIRdpoYqdtgqyQeC8EPRTV4Yo3K5/u9GRm5dE8F6
	+2sYJOxzHk28QtmNdxYvE0AccKBXbMRZiJjH1Z+t2d45AeB/93wciCGkYdnjYuQo
	GjdgjuXxL3NUFklnpMtuMO7IwvDbxuHerwOw3qozYvEF6FR+P924l5rv3zHsVMJt
	9DT6QwGhzTJ7Km5ocNczg==
X-ME-Sender: <xms:-CzSZkJ8Wn0B49VTFzYwOjsy5xxVMVl3owzG_i30SEBREmTnIPYIBg>
    <xme:-CzSZkJQ-LsM-P1wgED5VH54J1AJ3ir9UBQz9d2EYGWrWuywcPsoCCeYdX7g8CJoD
    YZEPe1-D9vanyLlpSs>
X-ME-Received: <xmr:-CzSZkvQDVFvetXIHzXWQFsrw-9rwvewFH3qyPRSX_ZjG6LjOVuaoksoojU5M29-7mV9IkCUkdI1zHrYQ9u9Nm-pSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
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
X-ME-Proxy: <xmx:-CzSZhZ-DEA_PeE7xqyKpUeCVlRfR0-piyt1MlfZQkxICUmYyv2yNw>
    <xmx:-CzSZrY3JQtw0bVHO8V9fFObq_NN9ooWJn6qbNmABU7rdIqCsy2aJw>
    <xmx:-CzSZtDYlN_8YP27_FzfUGs5NKFLTIjVQcByTnp70_2z58YJ1q2OnA>
    <xmx:-CzSZhbCiJ-bjPYh6VfWEsywto_s37Cjl_nxgTNrVt2lbNYtCgMADQ>
    <xmx:-CzSZpC_UmuxKEfiVJhPtrXi2u5tD3FmYN2si-y-MX5v8RBwg9ERKEva>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:35:04 -0400 (EDT)
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
Subject: [PATCH v2 4/8] media: rcar-csi2: Abstract PHTW and PHYPLL register offsets
Date: Fri, 30 Aug 2024 22:31:00 +0200
Message-ID: <20240830203104.3479124-5-niklas.soderlund+renesas@ragnatech.se>
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
index 5ab19f94fcde..4e85c47817a1 100644
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
 	int (*start_receiver)(struct rcar_csi2 *priv,
@@ -730,7 +736,7 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
 		hsfreq = hsfreq_prev;
 
-	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
+	rcsi2_write(priv, priv->info->regs->phypll, PHYPLL_HSFREQRANGE(hsfreq->reg));
 
 	return 0;
 }
@@ -1455,13 +1461,13 @@ static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
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
@@ -1707,7 +1713,13 @@ static int rcsi2_probe_resources(struct rcar_csi2 *priv,
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
@@ -1719,6 +1731,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_h3es2,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1730,6 +1743,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
+	.regs = &rcsi2_registers_gen3,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w,
@@ -1738,6 +1752,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
+	.regs = &rcsi2_registers_gen3,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w,
@@ -1746,6 +1761,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1757,6 +1773,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
 	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
 	.start_receiver = rcsi2_start_receiver_gen3,
@@ -1766,6 +1783,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1776,6 +1794,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
 	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
 	.start_receiver = rcsi2_start_receiver_gen3,
@@ -1785,6 +1804,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
+	.regs = &rcsi2_registers_gen3,
 	.init_phtw = rcsi2_init_phtw_v3u,
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
@@ -1796,6 +1816,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
+	.regs = &rcsi2_registers_gen3,
 	.start_receiver = rcsi2_start_receiver_v4h,
 	.use_isp = true,
 	.support_cphy = true,
-- 
2.46.0


