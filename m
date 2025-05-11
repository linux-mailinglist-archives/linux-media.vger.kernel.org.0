Return-Path: <linux-media+bounces-32243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1ADAB2A20
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 19:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB663B94F0
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 17:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CA825D91E;
	Sun, 11 May 2025 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uuDsI7Wv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LQLFnbb8"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596D325CC73;
	Sun, 11 May 2025 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985666; cv=none; b=Z77FP3+BZoTGe4gSjlZhm13Q/YPe6cCdTyv4lmpmr6tBFaY/NWdzKWKj4oLzfSvFGN1lt794rgRNPwemcjhUX+B6fv+YhWhmFwPu6dRR730Yk4ro3y6SryEBsjF8xujLxVMJyP/BeYVRw2RBTKBVtNVeXSQcZXk46RJ2XZ07ICk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985666; c=relaxed/simple;
	bh=NIqvWUkxF8hcSH8Ng9yVuM571vM5nrgyNE4JxLvtpBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlyPI7FtpXVFPXVCpayZhFtXVUk2kZEdi3ffz+cx2a4Do1Ioegtco8rmycqPQP6Icg7pdG8p3X/qgmFvW3AeWZAm5BPjXM6yK4Ml8wpLkM1WBPqbiI8fu4Rf+jWL4SK8vNFL8vQYCbMa1pye/4HFPUhdWWkqR1M8asOh9HxPMW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uuDsI7Wv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LQLFnbb8; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 40C5D11400EC;
	Sun, 11 May 2025 13:47:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 11 May 2025 13:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746985663;
	 x=1747072063; bh=J+3aHYaS3TcT6tca+D3HRbxJ5y+jsUB7v+TASTnH+1Y=; b=
	uuDsI7WvzQ7aMbtMfitAt4ERcPm4ji2lrZ3HynEK7cDT3tv76992YSPfo7HfTq+P
	1s6M2eGQUGxYT0LNDaskVl/fXvZCcr+tFGVCAhFxsceDyu7++PvN8YVBEjAmTeFS
	IUcqR9qt6YjCFGIvYrKNBWn2N51qaZFVt4IUO56wIc3HgFl4Xc2oGgY+xd2Laxm+
	Gqkbl99ivLyaZn5JTyXG0oLXVs2lFrradId6QnCFWNst9OxYa7ufKQNmuI37qzzU
	9xnc6bQ9Xn4eiPqFp7gNEsGWt8QDpL1zXg2OVWdwioEVtoWiL87p+RzcOhP/dYs4
	Be41uynkFcQ/W+Y59TXBAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746985663; x=
	1747072063; bh=J+3aHYaS3TcT6tca+D3HRbxJ5y+jsUB7v+TASTnH+1Y=; b=L
	QLFnbb8QlENEEUNMcY+QDl0vraGzNWOlJxX0Ijw+jnITHNlU5W8GfKb4keXZlzQC
	J5LIQ8J1kt8mHVuFDzU12lOolbUORtAVOBwhalcbQ7uHkY/wxl9Cq+Z8nJ7FPVAl
	Ms5/P2iEZJJTDbjo7oyl1ky7URs4jp90HtYM5W48i1N2HLyQpAat20bVKDkOj42i
	bVS7dktViN2kATfkBagLDLZY0EuFCOxIU0OlOsElr82tzELhjkh+LC+LBhYkInBc
	eXnLn+iW5Iei4SrlftcASD33qYo56k1Qthj2VH9heu/Fkq3cVhMdGMKdPU5EXL8K
	XNdVcrFf3DQhV8FykN5pQ==
X-ME-Sender: <xms:v-IgaEZNpxPyJEqfqVZOpO_C2B-X6LD8yJMtxXSt3wocbY4eoM5KUw>
    <xme:v-IgaPbmJua8DHXxfVnHT9rASllzosiLqAzDuecglq8Jk4i9zMbTGyxP9GAVA0KuZ
    Z-qmvBGY7Q2NzgQGRs>
X-ME-Received: <xmr:v-IgaO-yOSjP5eQRkk_DODc0m3Oce_aG2zeC_7SW3OHOHVN4kn1Y4plVlkKbuCvU0SPbeCYg7FKZpUPZO46AmSQf>
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
X-ME-Proxy: <xmx:v-IgaOpVi3IH0EIDonyqrYBD2dCcxjXC0-zSRpsdiYdYu7fdjk8rmg>
    <xmx:v-IgaPqUf1BBW5uxEWrh4paNu8Jgp-MfpqVM1GIihPKlpeUtoVFqdw>
    <xmx:v-IgaMSmiYk2lCywqZdHriyLZyIywJqJaDrCqSEZl4tNuHaHAKQOYQ>
    <xmx:v-IgaPqqvWL-4xpPg4jp8iIhFgQKnlf8sTlpRjh6UBtF-dPuD7oDhQ>
    <xmx:v-IgaPmWTzZZohHgW1NEZZHIsxDMkIOAJqg5u2RPALUz-6TvtY4FdiBZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 13:47:42 -0400 (EDT)
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
Subject: [PATCH v2 1/4] media: rcar-csi2: Clarify usage of mbps and msps
Date: Sun, 11 May 2025 19:47:27 +0200
Message-ID: <20250511174730.944524-2-niklas.soderlund+renesas@ragnatech.se>
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

The helper function to deal with calculating the link speed is designed
in such a way that it returns the correct type bps (bits per second) for
D-PHY and sps (symbols per second) for C-PHY. And for historical reasons
the function kept the name mbps.

This is confusing, fix it by having the function only deal with bps
values as this is the most common use-case and convert bps to sps in the
only function where it is needed to configure the C-PHY.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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


