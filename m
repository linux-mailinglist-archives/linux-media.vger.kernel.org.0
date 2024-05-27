Return-Path: <linux-media+bounces-11946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90D8D01A8
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89F791F25F10
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A6515FA78;
	Mon, 27 May 2024 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OXHp06HC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BShNBmVb"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB02E15FA6B;
	Mon, 27 May 2024 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816769; cv=none; b=Tt9vn0fHY66TzeaLcB8leV9iTp7LLgh2qOJSd+Unm8y8xwRGPcSLqWcNgXgVrOc/JcWecuPn36vaVi5Tj0BDSpAETUzn2JA7RqLY/uexq7LDcrktHpjKphPbN/XOA6JiibOYjFQBT5twLMwe+XAB4z2V9nMezJwqH+4MhIEz6y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816769; c=relaxed/simple;
	bh=XfM/8beRx9VS/As9v4GyW0FV4oQao2xaF4b6UbxpWN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RK0GynoGJtW1bQ6RAAw1tLJNtUMNoyL4Lao64ogDKWlmX9ImGbVPrk2Lo3Jjsx/yPa7OxjSkS5ppUx0kFtnN3lTzoOM7TsHHSC/6RKbriyVuwqJXh6AX6S5UsGz7FdAzHcI0IyizyVRkVTLJvLf4CE+uVSdwpdG7bD8O2CfkC4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OXHp06HC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BShNBmVb; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id A53BB1800109;
	Mon, 27 May 2024 09:32:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 27 May 2024 09:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716816766;
	 x=1716903166; bh=h0Sv05A8rbvqdd0na0EJa5rTqjMNWqzBeweInJ3djsA=; b=
	OXHp06HCc0EmJ6Z2HvRrWH6Lp2h2e9WW36YRWJWyHEBRLF7OD/ARL2HA5NyCDdE+
	9lGL3P5A7ndQOOpkxMsBAmWlb/jT+XY+4ZXnQ5vYVzZ3VftPNulTdYyx3NkEB8I6
	VqlYl8QSuKQ+or7FA8CwZTwXs+Lq9RSa6fefdJE9nDjZ9Nshkecva5JCGPx84tai
	v6CLPHOIjtTwI7c0EftT9yOZuMhxXDDGUd94Ativ+/nYOAp+5uA/hQ3zKR2w7/WS
	ZyrDZY5MOBCynnfFokCxorytPSzkX3COyvlrngg7MLW3PYBMQpOVe/S8AHogAp3L
	YvOA8CJqFzI9Pxke4tKIlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716816766; x=
	1716903166; bh=h0Sv05A8rbvqdd0na0EJa5rTqjMNWqzBeweInJ3djsA=; b=B
	ShNBmVbhMOKeeAjaCT+TKkISN4r73LzIxPFl5qxbsVgDLDbhmKn6hzTckXxKXx7t
	mbRA0glPGYdk6bEl97hl68dPRP0EgSfl9mUguLuxa+tc5hmN2boLzGJjWKSRuPAF
	MJTVy7a1PByxAMtiThLsyThiPCadIVEEBVArXUEkPLWUF1k6d9fPpNSkAgLbkdOo
	xT25AHE6clkfiUPBakjbb2GZ8fIt15+FHyS747ShF18YSziCG+Khos1WmrYRFeOs
	LP3+RMqfcDhfKpDjmVC/r2fgxRgaANlLrMSpJydMNRVT3EDLp17CYjRU0fY4wJ83
	wE28RiqQgXr0wozXHlEnA==
X-ME-Sender: <xms:fotUZhqKyLeKrIyk3E1alM0AKHAxhHCHkFP5suX61W7IawbR2eD_6Q>
    <xme:fotUZjpFZJAa0Of2LrfgOcqx3nmuBrPh99owrMFVFOlQANSQpg1u4BisKVG8CM2T3
    xISEWHoyH9GqaqKI48>
X-ME-Received: <xmr:fotUZuPtu6UbZe3Czc_qu57Mzbp5rSkDPJmwOkkO_DeSovIxu0XyjsR0DnzQw0RYHt5oJ3Yp61cc2F2g74AuTUgzqQDX7QtQECd_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:fotUZs6n5dRv2QxkwDpJ0z9y95ZcCyO0qQLu-39dGZKvHL00UOj4fA>
    <xmx:fotUZg5Lt4yrvnU3wbwYhFiN1IupUcgo2J6w2TqvRoOB-aBVOpqNcA>
    <xmx:fotUZkglSG3Z6Jevq1xclV_KzsMJ1O0apCw1hDeaCVP1nV2_OMcfYw>
    <xmx:fotUZi4hNJqWEh_sNpuOs5Nm2VzCf5O1UiE08W6znAR_M1mK5rj5_g>
    <xmx:fotUZqTv8xZGVK2VUqeaetsoS9OD_ktfHfGDcVUUWBqskVP_OlT75EPJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:32:45 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/7] media: rcar-csi2: Move PHTW write helpers
Date: Mon, 27 May 2024 15:32:19 +0200
Message-ID: <20240527133221.1688830-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for V4M support by moving the PHTW write helpers to the generic
write helpers. This is needed as adding V4M support will involve
interact with the PHTW register from code that are logically grouped
with similar code in such a way that forward declarations of these
helpers would otherwise be needed.

The functions are moved verbatim.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 72 +++++++++++-----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 2f9115da9a30..e02df1520ad1 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -653,6 +653,42 @@ static void rcsi2_write16(struct rcar_csi2 *priv, unsigned int reg, u16 data)
 	iowrite16(data, priv->base + reg);
 }
 
+static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
+{
+	unsigned int timeout;
+
+	rcsi2_write(priv, priv->info->regs->phtw,
+		    PHTW_DWEN | PHTW_TESTDIN_DATA(data) |
+		    PHTW_CWEN | PHTW_TESTDIN_CODE(code));
+
+	/* Wait for DWEN and CWEN to be cleared by hardware. */
+	for (timeout = 0; timeout <= 20; timeout++) {
+		if (!(rcsi2_read(priv, priv->info->regs->phtw) & (PHTW_DWEN | PHTW_CWEN)))
+			return 0;
+
+		usleep_range(1000, 2000);
+	}
+
+	dev_err(priv->dev, "Timeout waiting for PHTW_DWEN and/or PHTW_CWEN\n");
+
+	return -ETIMEDOUT;
+}
+
+static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
+				  const struct phtw_value *values,
+				  unsigned int size)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < size; i++) {
+		ret = rcsi2_phtw_write(priv, values[i].data, values[i].code);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct rcsi2_mbps_info *
 rcsi2_mbps_to_info(struct rcar_csi2 *priv,
 		   const struct rcsi2_mbps_info *infotable, unsigned int mbps)
@@ -1443,42 +1479,6 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
  * NOTE: Magic values are from the datasheet and lack documentation.
  */
 
-static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
-{
-	unsigned int timeout;
-
-	rcsi2_write(priv, priv->info->regs->phtw,
-		    PHTW_DWEN | PHTW_TESTDIN_DATA(data) |
-		    PHTW_CWEN | PHTW_TESTDIN_CODE(code));
-
-	/* Wait for DWEN and CWEN to be cleared by hardware. */
-	for (timeout = 0; timeout <= 20; timeout++) {
-		if (!(rcsi2_read(priv, priv->info->regs->phtw) & (PHTW_DWEN | PHTW_CWEN)))
-			return 0;
-
-		usleep_range(1000, 2000);
-	}
-
-	dev_err(priv->dev, "Timeout waiting for PHTW_DWEN and/or PHTW_CWEN\n");
-
-	return -ETIMEDOUT;
-}
-
-static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
-				  const struct phtw_value *values,
-				  unsigned int size)
-{
-	int ret;
-
-	for (unsigned int i = 0; i < size; i++) {
-		ret = rcsi2_phtw_write(priv, values[i].data, values[i].code);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
 				 const struct rcsi2_mbps_info *values, u8 code)
 {
-- 
2.45.1


