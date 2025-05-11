Return-Path: <linux-media+bounces-32246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77721AB2A28
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 19:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F48B3B6415
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 17:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D0125E479;
	Sun, 11 May 2025 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ffbxfZmZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IFN2L3D6"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3261A25C808;
	Sun, 11 May 2025 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985672; cv=none; b=MUfsISItlIr5eh5q2wWy/gep1KBAnobGuk1vatLBtSfYoUglc4lS9l4u4X/LKFbF0WF4H19K/zwzjVFfGn2BlbSAdiJHPDZGAYnvfZjXJ72K6cbnuCXo4vQuzJ26jqxyS0soBWcLIO1Eldlhtnch+bsu2F55l5DbBxajnsL2iJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985672; c=relaxed/simple;
	bh=vXdg2H6f+RdIYkrenxFu6KHD8EoPuRw3iv+Qj5nD4VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gtoP2jUQyKR1UVMbtveZ/t2PmLrR0yKwL6hXl2M+d+vEQNV8tHeYrWY3C70HQLFw+j8ZnRum7pVTFaY2mkaLxHYNiXgATqavkfsdDgEswbg3mozZ4DQ4TPW1TFZdHK8yUVe7z3n3olJ2aSVkgWy8OX5pluGs6d1xcS4e5K1N5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ffbxfZmZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IFN2L3D6; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 372D511400E1;
	Sun, 11 May 2025 13:47:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 11 May 2025 13:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746985669;
	 x=1747072069; bh=0wOyhwEq2J+/Yy/vPoeicIk9p+LcZJiQg1K2OgC4q4A=; b=
	ffbxfZmZsaUfZZijGHWrZBiCpZHrux2L9JF5p2vhc5whztGcXCkKS+S1Fq1HdAr5
	7CoHKhkNmdt3046LiYjN6Uph6xIU5TpZy7dPBGtCWkrw3I8yKYuQlPhL5PMK44oG
	88U5gGp1zYeK5mE/MXsi57hK2Pzwxg7FVKzkB1BSnZPej5awZuvyFVVYmv0i3p5Q
	u6xyyn043zMs9CqI/x/YvTWhVdAHi/26ZcEnYw13L8MuFuaFBi55Yz6vaet9Uvh7
	wWhrkklPfL6fnESY5ZU57W61nH89i1nq+kAei+uD8AfWyMVvLKcIqy/RBaohju7J
	WGroSilZHsinrA6GyKy0xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746985669; x=
	1747072069; bh=0wOyhwEq2J+/Yy/vPoeicIk9p+LcZJiQg1K2OgC4q4A=; b=I
	FN2L3D6CGmXZcudWQm/Oez4ek6bc+QBaOtWFGkS1FsmT4UtHTScbsPF/Oa+G4k3m
	i22QIZpPMmOfE6NTfFIeCQUuBpmBGeVxouDvDH/yirDW0g7LVF72I+gJcglofj+A
	z56znA+qYFuXmQLf5j/93ekk/fpkgqV1zc348QAsu2s8nEnd9WV+H1e3J5Jz9L+E
	ULqH4D1kvgeVhCzm+ZP0jPfQWfcjysxb2b5wDqR9Jfd2A0UNOE+UtmEEAxOoAwn1
	4J/+pf45UgsSEyBKo4sjfwTRTCfqoyE7AUgQqVsTc+TriOhTfU1FgWMxGCxniFDc
	fo4GbIHdBuzuhMuti39aw==
X-ME-Sender: <xms:xeIgaES8E-p-08I2StB37SuewBiXjx_pG-Rv_uMcEUIJf_mF2ZDFkw>
    <xme:xeIgaBxdMjQ-786jB0uK6r7HuJbyyjf-Qig0QArFjeqT85LrfM292XjSunoGzv3bn
    6461abV8YAZFGzAZBg>
X-ME-Received: <xmr:xeIgaB0lSY64y17GxGY5V4mWk4aWF0OC1QAc7XbQzHQ4HRHN3gzfCa9QBzjwuaaCONItYQPkQeq_7jlwzB_TRtds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeltdduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:xeIgaIBHHO4o0PbO9AHrAc94mx7WwAu0CtlCyqOjWY3rc4hCg3ZjZw>
    <xmx:xeIgaNg1i_CN_pT6AC8AL3NgFDkfZ15cZoaYDJQ1hkZUiTjFBnSdFA>
    <xmx:xeIgaEqZrPGzUBQK2naa8XFXDoHj7oZpC7B5QjZVXLwyFqsaEiZuag>
    <xmx:xeIgaAhSC-eUkhtYCJvFh56i_ROOUXuN-tvr6DZ3LAnLKdj5HE_t1g>
    <xmx:xeIgaPa1Sr4EBvm1ms1ArishlVL_13cu_KETFzVJws-XluZbvbzYhTbU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 13:47:48 -0400 (EDT)
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
Subject: [PATCH v2 4/4] media: rcar-csi2: Add D-PHY support for V4H
Date: Sun, 11 May 2025 19:47:30 +0200
Message-ID: <20250511174730.944524-5-niklas.soderlund+renesas@ragnatech.se>
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

Add D-PHY support for V4H in addition to the already support C-PHY
support. The common start-up procedure for C-PHY and D-PHY are shared,
only PHY setup differ. Extend the V4H setup with D-PHY support as
documented in the datasheet (Rev.1.21).

Most of the start-up procedure is only documented as magic values in
tables, there is little documentation to make the settings more clear.
Wherever possible formulas or lookup tables are used as they are
documented in the datasheet.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Fixes since v1
- Init cphy  variables to not trigger false -Wmaybe-uninitialized
  warning.
- Adjust line lengths.
---
 drivers/media/platform/renesas/rcar-csi2.c | 345 ++++++++++++++++++++-
 1 file changed, 335 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7ba637d8683b..ad0f63d00848 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -172,6 +172,7 @@ struct rcar_csi2;
 #define V4H_PPI_RW_LPDCOCAL_TWAIT_CONFIG_REG		0x21c0a
 #define V4H_PPI_RW_LPDCOCAL_VT_CONFIG_REG		0x21c0c
 #define V4H_PPI_RW_LPDCOCAL_COARSE_CFG_REG		0x21c10
+#define V4H_PPI_RW_DDLCAL_CFG_n_REG(n)			(0x21c40 + ((n) * 2)) /* n = 0 - 7 */
 #define V4H_PPI_RW_COMMON_CFG_REG			0x21c6c
 #define V4H_PPI_RW_TERMCAL_CFG_0_REG			0x21c80
 #define V4H_PPI_RW_OFFSETCAL_CFG_0_REG			0x21ca0
@@ -185,6 +186,13 @@ struct rcar_csi2;
 #define V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(n)	(0x23840 + ((n) * 2)) /* n = 0 - 11 */
 #define V4H_CORE_DIG_RW_COMMON_REG(n)			(0x23880 + ((n) * 2)) /* n = 0 - 15 */
 #define V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(n)	(0x239e0 + ((n) * 2)) /* n = 0 - 3 */
+#define V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG	0x23fe0
+
+#define V4H_CORE_DIG_DLANE_l_RW_CFG_n_REG(l, n)		(0x26000 + ((l) * 0x400) + ((n) * 2))
+#define V4H_CORE_DIG_DLANE_l_RW_LP_n_REG(l, n)		(0x26080 + ((l) * 0x400) + ((n) * 2))
+#define V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, n)	(0x26100 + ((l) * 0x400) + ((n) * 2))
+#define V4H_CORE_DIG_DLANE_CLK_RW_LP_n_REG(n)		V4H_CORE_DIG_DLANE_l_RW_LP_n_REG(4, (n))
+#define V4H_CORE_DIG_DLANE_CLK_RW_HS_RX_n_REG(n)	V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(4, (n))
 
 /* V4H C-PHY */
 #define V4H_CORE_DIG_RW_TRIO0_REG(n)			(0x22100 + ((n) * 2)) /* n = 0 - 3 */
@@ -1282,11 +1290,308 @@ rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 	return conf;
 }
 
+struct rcsi2_d_phy_setting_v4h_lut_value {
+	unsigned int mbps;
+	unsigned char cfg_1;
+	unsigned char cfg_5_94;
+	unsigned char cfg_5_30;
+	unsigned char lane_ctrl_2_8;
+	unsigned char rw_hs_rx_3_83;
+	unsigned char rw_hs_rx_3_20;
+	unsigned char rw_hs_rx_6;
+	unsigned char rw_hs_rx_1;
+};
+
+static const struct rcsi2_d_phy_setting_v4h_lut_value *
+rcsi2_d_phy_setting_v4h_lut_lookup(int mbps)
+{
+	static const struct rcsi2_d_phy_setting_v4h_lut_value values[] = {
+		{ 4500, 0x3f, 0x07, 0x00, 0x01, 0x02, 0x01, 0x0d, 0x10 },
+		{ 4000, 0x47, 0x08, 0x01, 0x01, 0x05, 0x01, 0x0f, 0x0d },
+		{ 3600, 0x4f, 0x09, 0x01, 0x01, 0x06, 0x01, 0x10, 0x0b },
+		{ 3230, 0x57, 0x0a, 0x01, 0x01, 0x06, 0x01, 0x12, 0x09 },
+		{ 3000, 0x47, 0x08, 0x00, 0x00, 0x03, 0x01, 0x0f, 0x0c },
+		{ 2700, 0x4f, 0x09, 0x01, 0x00, 0x06, 0x01, 0x10, 0x0b },
+		{ 2455, 0x57, 0x0a, 0x01, 0x00, 0x06, 0x01, 0x12, 0x09 },
+		{ 2250, 0x5f, 0x0b, 0x01, 0x00, 0x08, 0x01, 0x13, 0x08 },
+		{ 2077, 0x67, 0x0c, 0x01, 0x00, 0x06, 0x02, 0x15, 0x0d },
+		{ 1929, 0x6f, 0x0d, 0x02, 0x00, 0x06, 0x02, 0x17, 0x0d },
+		{ 1800, 0x77, 0x0e, 0x02, 0x00, 0x06, 0x02, 0x18, 0x0d },
+		{ 1688, 0x7f, 0x0f, 0x02, 0x00, 0x08, 0x02, 0x1a, 0x0d },
+		{ 1588, 0x87, 0x10, 0x02, 0x00, 0x08, 0x02, 0x1b, 0x0d },
+		{ 1500, 0x8f, 0x11, 0x03, 0x00, 0x08, 0x02, 0x1d, 0x0c },
+	};
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(values); i++)
+		if (values[i].mbps >= mbps)
+			return &values[i];
+
+	return NULL;
+}
+
+static int rcsi2_d_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
+{
+	const struct rcsi2_d_phy_setting_v4h_lut_value *lut =
+		rcsi2_d_phy_setting_v4h_lut_lookup(mbps);
+	u16 val;
+
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_COMMON_REG(7), 0x0000);
+	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(7), mbps > 1500 ? 0x0028 : 0x0068);
+	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(8), 0x0050);
+	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(0), 0x0063);
+	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(7), 0x1132);
+	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(1), 0x1340);
+	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(2), 0x4b13);
+	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(4), 0x000a);
+	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(6), 0x800a);
+	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(7), 0x1109);
+
+	if (mbps > 1500) {
+		val = roundup(5 * mbps / 64, 1);
+		rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(3), val);
+	}
+
+	if (lut) {
+		rcsi2_modify16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(1),
+			       lut->cfg_1, 0x00ff);
+		rcsi2_modify16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(5),
+			       lut->cfg_5_94 << 4, 0x03f0);
+		rcsi2_modify16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(5),
+			       lut->cfg_5_30 << 0, 0x000f);
+
+		for (unsigned int l = 0; l < 5; l++)
+			rcsi2_modify16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 8),
+				       lut->lane_ctrl_2_8 << 12, 0x1000);
+	}
+
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_LP_n_REG(l, 0), 0x463c);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 2), 0x0000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(1, 2), 0x0000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(3, 2), 0x0000);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(4, 2), 0x0000);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_COMMON_REG(6), 0x0009);
+
+	val = mbps > 1500 ? 0x0800 : 0x0802;
+	for (unsigned int l = 0; l < 5; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 12), val);
+
+	val = mbps > 1500 ? 0x0000 : 0x0002;
+	for (unsigned int l = 0; l < 5; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 13), val);
+
+	if (mbps >= 80) {
+		if (mbps >= 2560)
+			val = 6;
+		else if (mbps >= 1280)
+			val = 5;
+		else if (mbps >= 640)
+			val = 4;
+		else if (mbps >= 320)
+			val = 3;
+		else if (mbps >= 160)
+			val = 2;
+		else if (mbps >= 80)
+			val = 1;
+
+		rcsi2_modify16(priv,
+			       V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 9),
+			       val << 5, 0xe0);
+	}
+
+	rcsi2_write16(priv, V4H_CORE_DIG_DLANE_CLK_RW_HS_RX_n_REG(0), 0x091c);
+	rcsi2_write16(priv, V4H_CORE_DIG_DLANE_CLK_RW_HS_RX_n_REG(7), 0x3b06);
+
+	val = roundup(1200 / mbps, 1) + 12;
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 0), val << 8, 0xf0);
+
+	val = mbps > 1500 ? 0x0004 : 0x0008;
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_CFG_n_REG(l, 1), val);
+
+	val = mbps > 2500 ? 0x669a : mbps > 1500 ? 0xe69a : 0xe69b;
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 2), val);
+
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_LP_n_REG(l, 0), 0x163c);
+	rcsi2_write16(priv, V4H_CORE_DIG_DLANE_CLK_RW_LP_n_REG(0), 0x163c);
+
+	if (lut) {
+		for (unsigned int l = 0; l < 4; l++)
+			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 1),
+				       lut->rw_hs_rx_1, 0xff);
+	}
+
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 3), 0x9209);
+
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 4), 0x0096);
+
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 5), 0x0100);
+
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 6), 0x2d02);
+
+	for (unsigned int l = 0; l < 4; l++)
+		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 7), 0x1b06);
+
+	if (lut) {
+		/* Documentation LUT have two values but document writing both
+		 * values in a single write.
+		 */
+		for (unsigned int l = 0; l < 4; l++)
+			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 3),
+				       lut->rw_hs_rx_3_83 << 3 | lut->rw_hs_rx_3_20, 0x1ff);
+
+		for (unsigned int l = 0; l < 4; l++)
+			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 6),
+				       lut->rw_hs_rx_6 << 8, 0xff00);
+	}
+
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0404);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x040c);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0414);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x041c);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0423);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0429);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0430);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x043a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0445);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x044a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0450);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x045a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0465);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0469);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0472);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x047a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0485);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0489);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0490);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x049a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04a4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04ac);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04b4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04bc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04c4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04cc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04d4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04dc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04e4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04ec);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04f4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04fc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0504);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x050c);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0514);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x051c);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0523);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0529);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0530);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x053a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0545);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x054a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0550);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x055a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0565);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0569);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0572);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x057a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0585);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0589);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0590);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x059a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05a4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05ac);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05b4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05bc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05c4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05cc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05d4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05dc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05e4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05ec);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05f4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05fc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0604);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x060c);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0614);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x061c);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0623);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0629);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0632);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x063a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0645);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x064a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0650);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x065a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0665);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0669);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0672);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x067a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0685);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0689);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0690);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x069a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06a4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06ac);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06b4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06bc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06c4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06cc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06d4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06dc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06e4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06ec);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06f4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06fc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0704);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x070c);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0714);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x071c);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0723);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x072a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0730);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x073a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0745);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x074a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0750);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x075a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0765);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0769);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0772);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x077a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0785);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0789);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0790);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x079a);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07a4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07ac);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07b4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07bc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07c4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07cc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07d4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07dc);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07e4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07ec);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07f4);
+	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07fc);
+
+	return 0;
+}
+
 static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 				    struct v4l2_subdev_state *state)
 {
+	const struct rcsi2_cphy_setting *cphy = NULL;
 	const struct rcar_csi2_format *format;
-	const struct rcsi2_cphy_setting *cphy;
 	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int mbps;
@@ -1318,7 +1623,8 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	rcsi2_write(priv, V4H_FLDC_REG, 0);
 	rcsi2_write(priv, V4H_FLDD_REG, 0);
 	rcsi2_write(priv, V4H_IDIC_REG, 0);
-	rcsi2_write(priv, V4H_PHY_MODE_REG, V4H_PHY_MODE_CPHY);
+	rcsi2_write(priv, V4H_PHY_MODE_REG,
+		    priv->cphy ? V4H_PHY_MODE_CPHY : V4H_PHY_MODE_DPHY);
 	rcsi2_write(priv, V4H_N_LANES_REG, lanes - 1);
 
 	rcsi2_write(priv, V4M_FRXM_REG,
@@ -1361,9 +1667,15 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(5), 0x4000);
 
 	/* T3: PHY settings */
-	cphy = rcsi2_c_phy_setting_v4h(priv, mbps);
-	if (!cphy)
-		return -ERANGE;
+	if (priv->cphy) {
+		cphy = rcsi2_c_phy_setting_v4h(priv, mbps);
+		if (!cphy)
+			return -ERANGE;
+	} else {
+		ret = rcsi2_d_phy_setting_v4h(priv, mbps);
+		if (ret)
+			return ret;
+	}
 
 	/* T4: Leave Shutdown mode */
 	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
@@ -1376,11 +1688,23 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	}
 
 	/* T6: Analog programming */
-	for (unsigned int l = 0; l < 3; l++) {
-		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 9),
-			      cphy->lane29);
-		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 7),
-			      cphy->lane27);
+	if (priv->cphy) {
+		for (unsigned int l = 0; l < 3; l++) {
+			rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 9),
+				      cphy->lane29);
+			rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 7),
+				      cphy->lane27);
+		}
+	} else {
+		u16 val_2_9 = mbps > 2500 ? 0x14 : mbps > 1500 ? 0x04 : 0x00;
+		u16 val_2_15 = mbps > 1500 ? 0x03 : 0x00;
+
+		for (unsigned int l = 0; l < 5; l++) {
+			rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 9),
+				      val_2_9);
+			rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 15),
+				      val_2_15);
+		}
 	}
 
 	/* T7: Wait for stop state */
@@ -2245,6 +2569,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
 	.start_receiver = rcsi2_start_receiver_v4h,
 	.use_isp = true,
 	.support_cphy = true,
+	.support_dphy = true,
 };
 
 static const struct rcsi2_register_layout rcsi2_registers_v4m = {
-- 
2.49.0


