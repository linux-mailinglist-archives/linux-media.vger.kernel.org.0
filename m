Return-Path: <linux-media+bounces-34520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0035AD5B0D
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 17:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49085188F00B
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 15:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AED41F5846;
	Wed, 11 Jun 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="K/DpFBb+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y0hGSyjd"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57F31E9915;
	Wed, 11 Jun 2025 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656721; cv=none; b=mNYUe+sADi5N/3vJ+JFEmyN2jCpoGJSMRqnm4dY6jUiR5m5aZpIjtnJRjmSuL+ElW/qnI6SQHkwUNVCiCYxSKaWEjLkovusYTL2l0ONDtHb6JBlBkAXImHZsdL6XVF4E2qnY43iE2PTNYouAn7+P7zTblLf6/0LWxiVQCCQrxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656721; c=relaxed/simple;
	bh=qcH4u2dK8NZcb9BSXPnwsMRusSCLYvoGG3rEI4enl7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dW8YY9N0s87BdHh37dTrq1lkIx51PnbduyQ7fL3CHQmLMUC+NPZAacNaTe9/WY3qKj3fH788MqeN+5+kxkWujtJkwa+GWdrkLk4a/vodDYsIt14ltKNCqhW0fP97+I8Q3AhSrMeXtijMppPkJuHB4zMsYfrIxfi/JvbSYO8xqUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=K/DpFBb+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y0hGSyjd; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id CC35A13804E2;
	Wed, 11 Jun 2025 11:45:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 11 Jun 2025 11:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749656718;
	 x=1749743118; bh=ESc39m4SqE/KumECm594NnUAI8wChNaLLgysfdqI7ao=; b=
	K/DpFBb+PiKZFOCyJy5u3J/Qvfi+xBvYhqwfiHBN9p+NBB7HkLwsYWJfU0dZtgav
	rToDAS+OU4diLOz3jAZII7zvRtp6vPVS976BTT0vlHk78BLzhSM010IZvL6pwdef
	y3ngxpi3OO3LxMM9hv6ejCTU9c8sXXVdF8VbrwB6rNG8lr6CoY3sCdXtZUnxCAw2
	MZKs60aku+aHZDO0yNRE73ZGF0oVsVnyAXiR7Lmzljx+IlD6YqwskfQOVsVnAbk4
	L01l3jNuXqkz1UBLhoGwT1ALmTSi4tx3TJ0xPNl/WaoRgKcnb0YDnVXDKY0EGmaJ
	UaB7CdCYtlsi6D61s+L09g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749656718; x=
	1749743118; bh=ESc39m4SqE/KumECm594NnUAI8wChNaLLgysfdqI7ao=; b=Y
	0hGSyjdtO72Yj2a0TqjTyTrq6Zuo7hggTez5b9QLKOF0CcH2UlahTqd1bs8ui+ql
	Sn30ZEW6JraT6XFBfq7JBt0gTmvW2A2r6XVPy3cDTB8pVzF3YkfE7SvdxWX9gYwj
	T5JiqwXVp4D6aIPs6d8xblOQII+OPelSbxEXyCRS9mumQWzGRdATTcog+MrwI+ky
	H7t3+0Pe/eZD9q9rbmJj3bWlBbBPcOz/3e5zS0kjZAiSE8+mkcIsuSktwUseNEhv
	C/j4YLUvaOZ6pvw4NYcVrKuyFgCahzIaa+asjs7rSS7TfjGfa27BI3ymOh1J7ujw
	32O221UiUV6g/1xvfCShw==
X-ME-Sender: <xms:jqRJaD4frwcHCT1lzYYPkHkNcddkYZfid24s9SLG5-qWgs1BGmqRdg>
    <xme:jqRJaI4dwHSC-TODdLVcetQdN9DT5QGTNwhinkczgDiy1o5Lr3Ro_pdQSZtvsw_g_
    0YrNuhqLjalnKVpQeM>
X-ME-Received: <xmr:jqRJaKeBoqqAPwkQMF2XrJcpaOuOx7SCaHJ_vdGh0iy1IWvNYczPmybRwTQ-XGPxn5GLevLawOAJCLHo7QbsJxCQ>
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
X-ME-Proxy: <xmx:jqRJaEKqhET-1frf82IJpYKUNPIRa6m5Dv7t77FHZoiHUJsx9N84Rg>
    <xmx:jqRJaHKOj8r18U7oj1qo00bqbwM6dwM68Tz6O03lH0gDc3YXTa4iyQ>
    <xmx:jqRJaNyuGOcSuC5uM6J-qLYIC2h4NfNYOEau9MUyoqMz1PySAwSGvQ>
    <xmx:jqRJaDKtCQB3e7lEGtdXv3p9iGV4_oUz0azRuP-DsUUmsXTqZK7pLg>
    <xmx:jqRJaIeNBpyEwfolxr1XTMocanFe5L3PWG4q-01s26iq-kX-iWXNI8gp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 11:45:18 -0400 (EDT)
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
Subject: [PATCH v3 2/4] media: rcar-csi2: Rework macros to access AFE lanes
Date: Wed, 11 Jun 2025 17:44:43 +0200
Message-ID: <20250611154445.123412-3-niklas.soderlund+renesas@ragnatech.se>
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

Each AFE lane has a set of control and offset registers. The registers
themself are undocumented but later datasheets program more of them with
magic values. Before exploding the driver with more defines to name them
all rework the AFE ones to be able to address all controls and offsets.

Also move a stray define that is out of sequence.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v2
- Improve spelling in commit message.

* Changes since v1
- Adjust line length.
---
 drivers/media/platform/renesas/rcar-csi2.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 358e7470befc..cdd358b4a973 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -177,15 +177,14 @@ struct rcar_csi2;
 #define V4H_PPI_RW_OFFSETCAL_CFG_0_REG			0x21ca0
 
 /* V4H CORE registers */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(n)	(0x22040 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(n)	(0x22440 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(n)	(0x22840 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(n)	(0x22c40 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(n)	(0x23040 + ((n) * 2)) /* n = 0 - 15 */
+
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, n) (0x22040 + ((l) * 0x400) + ((n) * 2))
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_3_REG(l, n) (0x22060 + ((l) * 0x400) + ((n) * 2))
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_4_REG(l, n) (0x22080 + ((l) * 0x400) + ((n) * 2))
+
 #define V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(n)	(0x23840 + ((n) * 2)) /* n = 0 - 11 */
 #define V4H_CORE_DIG_RW_COMMON_REG(n)			(0x23880 + ((n) * 2)) /* n = 0 - 15 */
 #define V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(n)	(0x239e0 + ((n) * 2)) /* n = 0 - 3 */
-#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
 
 /* V4H C-PHY */
 #define V4H_CORE_DIG_RW_TRIO0_REG(n)			(0x22100 + ((n) * 2)) /* n = 0 - 3 */
@@ -197,6 +196,7 @@ struct rcar_csi2;
 #define V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG		0x2a400
 #define V4H_CORE_DIG_CLANE_1_RW_LP_0_REG		0x2a480
 #define V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(n)		(0x2a500 + ((n) * 2)) /* n = 0 - 6 */
+#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
 #define V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG		0x2a800
 #define V4H_CORE_DIG_CLANE_2_RW_LP_0_REG		0x2a880
 #define V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(n)		(0x2a900 + ((n) * 2)) /* n = 0 - 6 */
@@ -1246,11 +1246,11 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(2), conf->rx2);
 	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(2), conf->rx2);
 
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(2), 0x0001);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(2), 0);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(2), 0x0001);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(2), 0x0001);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(2), 0);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(1, 2), 0);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(3, 2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(4, 2), 0);
 
 	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(0), conf->trio0);
 	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(0), conf->trio0);
@@ -1267,13 +1267,13 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 	/* Configure data line order. */
 	rsci2_set_line_order(priv, priv->line_orders[0],
 			     V4H_CORE_DIG_CLANE_0_RW_CFG_0_REG,
-			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9));
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 9));
 	rsci2_set_line_order(priv, priv->line_orders[1],
 			     V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG,
-			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(9));
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(1, 9));
 	rsci2_set_line_order(priv, priv->line_orders[2],
 			     V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG,
-			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(9));
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 9));
 
 	/* TODO: This registers is not documented. */
 	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
@@ -1289,8 +1289,8 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 	}
 
 	/* C-PHY setting - analog programing*/
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9), conf->lane29);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(7), conf->lane27);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 9), conf->lane29);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 7), conf->lane27);
 
 	return 0;
 }
-- 
2.49.0


