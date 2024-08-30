Return-Path: <linux-media+bounces-17247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F55E966AB1
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 008421F23643
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64EA1C1AA1;
	Fri, 30 Aug 2024 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kS0C2cve";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gZuVqEyu"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B21C173B;
	Fri, 30 Aug 2024 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050113; cv=none; b=ZEqNb6YzdBANX9yso31bOy3kINR0KIqHDIdy2bFOFV+3vcTlCaPVzQaAQ1L6lKN2c/P0Hmnt9tdkTHSAkSGzHYZGfO7Rn9iG1HJh4vixAQwlCCzMV3hGAbTwKHo5jU7Lx47aJmlG/Xj8PgYa2b+GlbDV58RulkoJX16Lvd1WqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050113; c=relaxed/simple;
	bh=pKj2UMrtgtkN9tEY1DJrp9D/pzgki41UiQF/SzH+IRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xc8KPKbTytg7udpR9zkyBUK6KmeOEiKolsWXLvAqyec4AT35/k9OseN/D53LJzZN9ytEuqfC94V7LqH0w9ecDVRjUZqnL9pzfvWYFYaFy8ViYaTYOzot9BLv1hq4oYaKZSyFKIEe37AtF+cdmVeRo/eisec+tBGh+DyRKWz3QoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kS0C2cve; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gZuVqEyu; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8C84C114017B;
	Fri, 30 Aug 2024 16:35:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 30 Aug 2024 16:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725050110;
	 x=1725136510; bh=8JvMnm/1j96KVX2x6R72zw6O7YWpn/Ne514YSPMLphw=; b=
	kS0C2cvertv3h4VDxTi7X13rw8WU3d1EOCkEV/QBiogrkkWilOHXWuB/dTavOCjZ
	O11CV3ZHlUnKIe+eoTN2uXogjGdUjEPwbai24U30k+xQnNz4VZUT49JxykFpZlHb
	9LLVWCLQLf2GBRfauS4ZHRoml7hQOum3d4fL10XJ6E60GJTaGhJ+w0z2K9bfGi8U
	Ehu1pPFImpPWy0WjjykJOzZB6IFP14YgNUfZEIJgttk/6TxtoE46ww3IKFhusxGD
	yvZQb2yMyK9Wcu9xYf8iGX2lEQ/k9NyIY5pb/kUfWpn90flCYEAmEntlv0Fr4RlH
	00At/giBTLdN3CpMJvOQFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725050110; x=
	1725136510; bh=8JvMnm/1j96KVX2x6R72zw6O7YWpn/Ne514YSPMLphw=; b=g
	ZuVqEyuRhnN1nnaT35egEw5UnkAkYMp7AbuPIJUlfb6QAiQUP7IBzt38C9wxcJti
	ioFbG+qk9Pry1rzeIwcm1OBpwzNAV8gUFWeeC81fhxjlgD/Gaexqro52/EoFPqpK
	z35TXTa3jDY/BOgTFuBRliJ5xix8CvkNdB9hqdyj1Yg+P0rKRpJjaKEnbKiM/fJT
	mCMwFDvnmOVrfUY2DqqvTV+7hInwQe4dq7HmixDQozvXmh/AJs6YF2bMtAImMTZX
	MqeNmt6de1V8FuN19zmUFGOwFnQxMKlbyDIr6ybf1LmD7qHRTiDl+g4mGEoioEJg
	YcoxI7H5j2CX6/KjUAgPg==
X-ME-Sender: <xms:_izSZr4G25UjK0mQefV9fDpZKH2AQkzicNSYMLQlKjXf8qjtBz7Tvw>
    <xme:_izSZg6vbtmHh2PrGUIxkNx3WzRdy_Z3ERVDq07VSFSI2556YywJTEsRGbdrn4c7j
    OjRG-kcwww4vM1ZukU>
X-ME-Received: <xmr:_izSZid1r4E6flGJJfUo1vex5le39iIYTRHHyXUzKIAKs7GkijNtSF_PtLwvI-ELxCwT-4uQp8B_uTc1D-sgeQ4IVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudeglecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:_izSZsJXzfGOZaXzoEffjfppNFtkPgf8YytKaB5V3IVu3bagqqfeBw>
    <xmx:_izSZvJtYtBZ4j0DSg7Hw_6u8vJdy6QS9ter9v7TS3_VzUhsTsfCNg>
    <xmx:_izSZlzYruCKNzSv1yRguHxzyVuuMfg4PoQrl754lTMTGDp7fX2fAQ>
    <xmx:_izSZrJYQnA5laa8sPEup_0tbqVd1jpu4gdA3gfJaBAVQlf8debduQ>
    <xmx:_izSZhy6WzJ8A_fOuo3XAQ_1T93Mv3O5GVO0URBrhLsGoRFBL9UWaAuc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:35:09 -0400 (EDT)
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
Subject: [PATCH v2 7/8] media: rcar-csi2: Add documentation for PHY_EN and PHY_MODE registers
Date: Fri, 30 Aug 2024 22:31:03 +0200
Message-ID: <20240830203104.3479124-8-niklas.soderlund+renesas@ragnatech.se>
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

Later datasheets add documentation for two magic value used for V4H
support. The same registers will also be used for V4M support, document
them.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 72fcb6ac840b..386037a13786 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -135,13 +135,23 @@ struct rcar_csi2;
 /* V4H BASE registers */
 #define V4H_N_LANES_REG					0x0004
 #define V4H_CSI2_RESETN_REG				0x0008
+
 #define V4H_PHY_MODE_REG				0x001c
+#define V4H_PHY_MODE_DPHY				0
+#define V4H_PHY_MODE_CPHY				1
+
 #define V4H_PHY_SHUTDOWNZ_REG				0x0040
 #define V4H_DPHY_RSTZ_REG				0x0044
 #define V4H_FLDC_REG					0x0804
 #define V4H_FLDD_REG					0x0808
 #define V4H_IDIC_REG					0x0810
+
 #define V4H_PHY_EN_REG					0x2000
+#define V4H_PHY_EN_ENABLE_3				BIT(7)
+#define V4H_PHY_EN_ENABLE_2				BIT(6)
+#define V4H_PHY_EN_ENABLE_1				BIT(5)
+#define V4H_PHY_EN_ENABLE_0				BIT(4)
+#define V4H_PHY_EN_ENABLE_CLK				BIT(0)
 
 #define V4H_ST_PHYST_REG				0x2814
 #define V4H_ST_PHYST_ST_PHY_READY			BIT(31)
@@ -1146,11 +1156,11 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, 0);
 
 	/* PHY static setting */
-	rcsi2_write(priv, V4H_PHY_EN_REG, BIT(0));
+	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK);
 	rcsi2_write(priv, V4H_FLDC_REG, 0);
 	rcsi2_write(priv, V4H_FLDD_REG, 0);
 	rcsi2_write(priv, V4H_IDIC_REG, 0);
-	rcsi2_write(priv, V4H_PHY_MODE_REG, BIT(0));
+	rcsi2_write(priv, V4H_PHY_MODE_REG, V4H_PHY_MODE_CPHY);
 	rcsi2_write(priv, V4H_N_LANES_REG, lanes - 1);
 
 	/* Reset CSI2 */
-- 
2.46.0


