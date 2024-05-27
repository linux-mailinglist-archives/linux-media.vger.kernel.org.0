Return-Path: <linux-media+bounces-11947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 650468D01AA
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D3F290D41
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A0015FA84;
	Mon, 27 May 2024 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="o14aN7vU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I52iVMtQ"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A926215FA76;
	Mon, 27 May 2024 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816771; cv=none; b=UCCKjCnd1UK0IJ2fQIjahUBiqrz+woqTw5ZwMrQ3VKb46B1w7jCNOcUCmbRCcg9S4kUzpe8yWde6WYnHAwz7B0h2deTTc8iIgHqLAUoh7LY9u4dGKqbcJT+MYJuZP9h/hd2dggBz5Z6USZMZ8aPfsK2ECBiQInEn63N1GkpdIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816771; c=relaxed/simple;
	bh=3aN6mtowDUj+Onx2UeU5VRbdX7SskypbtrBUf7cKSps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOjseSuFHk1vxq98l7OZGqourVoM6CS4jkLDhaLDzSTiTshYmhr3lb4y5YuGBdkX8KRhS9Glerm0dofhO07SQlVbdHsULnPECWkM/WTwrwVfBK6bqVlgX6mwYM+VR6rBhlAhyvv+CgxWTAcoD/eea/Jwms6nwKZ8CyidnjkZJUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=o14aN7vU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I52iVMtQ; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id AEF8418000AB;
	Mon, 27 May 2024 09:32:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 27 May 2024 09:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716816768;
	 x=1716903168; bh=WgsZi6tVrvwXTiPDL8TRatxIeHo8w3URcniVzvhyqCs=; b=
	o14aN7vUfMGqSKuf88SqUS8RAfp2l0YOYGCtiHQmNW48Bl9Cf/+iH87SzmI0Uf5K
	tCiGGcCqn1fe1jRYdt58LcX5PZJUkQZmmHXOZrw97iI5Eb9TZCW1+mRjIce6s8N6
	IvLqDhZ5p4oSDt/9v5I99rFGMIfkZ8oKqZH9+T2WKhrFrmFo5oNCZObVUXPAP8BR
	4EC0uky1BUB+c4YJ9PQRqj+UFa3jDiPb1y2UcGlFgCI8OqKewV5xobh3OU5RTMg+
	caBy5hDE3h5aIJr8JpG5mabTAZ8KibM6rY4BSyUJC5wSDm369Q30kj+lCSMLQiMA
	lTcpbHSDP+32/ydwjGYMHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716816768; x=
	1716903168; bh=WgsZi6tVrvwXTiPDL8TRatxIeHo8w3URcniVzvhyqCs=; b=I
	52iVMtQnN1mOmBFAjM6427AbQdDAEMGfxVwwrKbRrP2L3hGzG9bwH+HGJtfyEnd1
	u5FiLCVOY8nAstLNJZIDvF5AcWhvLJEd1kpcJ/kvqDTgQ4leN7z8YyAjHwrfC/4V
	kp2ICessiZSVkbwV3Y6v+/Itfe+NU1cgqi++Z5H/eHC29qcFN396hZ6GM01WTwEn
	LAO5lLZYlZpu4CaRje1NYYxFXKNIkNV95Kiykw9wG0zBg9fDgvveexWI4lTtHysM
	L850+7xPpSHnlypBmVJI2RtpZAP8H8EIC76A/7v4nTjsP2tFTTxnYxaeKzChlTf4
	lQfaP44rnOsGHkS4XcLUg==
X-ME-Sender: <xms:gItUZhJVHNCni21lAhiFC-kwGOs22jrWES4mMX0bzgEY8QQ41IKyAg>
    <xme:gItUZtKADGHCMxR_zW9iCIuCZ60RCOPO-cL_OboxBlPFL9573z-fRmGE9KO7gNL8T
    io0c_f_QRACL6qLePI>
X-ME-Received: <xmr:gItUZpvdB2PPXuldHUpmI5WIOru5zsPonq_HLf_8h2qL73tC4WxFBsLf7kcUOEiam_TOI3kVJCK3apHEEOCnbp_107R-TPeLu3wM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:gItUZiYJOjXSRxbjRYnPUGQtiWR5JoqfFAHfr1rAymvBi_UXYv7oMg>
    <xmx:gItUZobNOW29Jrgl0PnYcJ0m7nv2cnX5EBq7Cfll9JMxkldOVklEJw>
    <xmx:gItUZmCCsZwPfWpbhVZpvhV57qnJ3vurBZryFUuCd2iALjQbBh0kaQ>
    <xmx:gItUZmZU1BXYtRXKhfTKhRPQ8WHZZwC6RyLyE_kDclapH-B-DwtNkw>
    <xmx:gItUZnwRcqGBQocEFkHsvZP_BXQjA5RnGCUSOFF2fpH7VedAamS8UShx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:32:47 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 6/7] media: rcar-csi2: Add documentation for PHY_EN and PHY_MODE registers
Date: Mon, 27 May 2024 15:32:20 +0200
Message-ID: <20240527133221.1688830-7-niklas.soderlund+renesas@ragnatech.se>
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

Later datasheets add documentation for two magic value used for V4H
support. The same registers will also be used for V4M support, document
them.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index e02df1520ad1..46c4f20cce88 100644
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
@@ -1129,11 +1139,11 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
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
2.45.1


