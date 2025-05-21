Return-Path: <linux-media+bounces-33061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4758ABFD70
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 21:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85669E7300
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D442900B2;
	Wed, 21 May 2025 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXjUXzLm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660D28FFC5;
	Wed, 21 May 2025 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747856152; cv=none; b=psO7WjQ+0doVgdFzI93R00+KW8omOWFFCewuzCiKFdBf1hPzNAVcFvce/Ex87kXw5eIYtF25Roa38lPaHrYbcAo7cO0XwX1sp5JkpzzzrX1+WX+PnOyuX/AUKDcL/NxRihaOHG0MH58JVrMMES9J3pbdXUjeTJ8kHg2Z0fPoMVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747856152; c=relaxed/simple;
	bh=rl9GZqdLGBfjBJ296zN0oZFwK2zvx5a8miUiRaAwWLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGYnDCcqI5h5Y7dJ0n7pIO2iMNKvDivTxpM5NeDbFWP4BuhkQ5Qa/Uftqu36+jUaqqJkqurGNOdIux/stpoQOK1krQTqlqYA3TtiVY3DnL77aXUGEhq4CISeRU4imn/me3V5lOfX1i/y/H2xeCb66k1xnxa2G0R+dynkYelGnN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXjUXzLm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42BD1C4CEFA;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747856151;
	bh=rl9GZqdLGBfjBJ296zN0oZFwK2zvx5a8miUiRaAwWLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HXjUXzLmPZK8JxZv2rMAiyQMypnvz30SOWaF5Le6MSIj0SaMX1eXUlAwi6XVMMbDr
	 /9o7RnnsdygXgNbIrerqIWF1oXtn+9OaMhes8HqGbzKGCRyBlPPP1nDBqLkmEF62+o
	 AI+o5suaagx4IDgxqYXEqzpVDMQp2gAAN6wEP+IDuhTdM7IoUT1NftMlQBUMyWnH1S
	 tfa4W/5+n+X7zGt9wMTcL9eD2sNmUJUud6aHRgFx019iGspx67lrR0y/ybu3+28oDJ
	 2DJcqVoY5+Cw/lu4eUvpTYpw6aBEsQzjHnGFW62Huf8OJdB/ilu8EV6eFlrvw+EC7H
	 zsi+hsvUAkHHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37109C54F2E;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Wed, 21 May 2025 21:34:28 +0200
Subject: [PATCH v3 5/5] media: i2c: imx214: Remove hard-coded external
 clock frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250521-imx214_ccs_pll-v3-5-bfb4a2b53d14@apitzsch.eu>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
In-Reply-To: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747856148; l=1194;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=81a5knJurFPeQFihfZmv0dfoKheJNZM//Pf1vhwjDog=;
 b=u047Jl0beOhUD9XDWfSja6SNCQ6YB0IeZ8wgFG7Akslb+UIKriMBQ9i130y9Wed440+cMBspz
 QG7lRqWCUyCDV3miprXvcQ6wRM8n0Z/7cCMw+Mji4SqHPK7t5ohzqKG
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Instead rely on the rate set on the clock (using assigned-clock-rates
etc.)

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 19b494c08ece9894de67a4ee34c6f8e6e2708e41..264e897ec6e8e3d2fcd9d58db82090c7dd85d526 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -32,7 +32,6 @@
 
 #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
 
-#define IMX214_DEFAULT_CLK_FREQ	24000000
 #define IMX214_DEFAULT_LINK_FREQ	600000000
 /* Keep wrong link frequency for backward compatibility */
 #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
@@ -1402,11 +1401,6 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
 				     "failed to get xclk\n");
 
-	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to set xclk frequency\n");
-
 	ret = imx214_get_regulators(dev, imx214);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");

-- 
2.49.0



