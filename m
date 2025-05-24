Return-Path: <linux-media+bounces-33312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B67AC2E6A
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDD2E9E7342
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 09:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CFB1A3163;
	Sat, 24 May 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5w5otD/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD63F18BC3B;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078083; cv=none; b=pN0TuIA+rYWStuvU3TjdEtgjvcFjR+NbUeU54AlLBB3CxpmJ/KXEmbKtU5wLvTNwRf1GU4+Kswv7UGX113s6htTVQNZcLJ9sCzlQ/Fik8oGhaq7NDDRq0ba9wpMGlbtZeP+1iJW8KWwfjfEOhYSKAgaUl2D18zZgNivYFJSRmOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078083; c=relaxed/simple;
	bh=QmJJzXeg74/tDMm21ZE8ew95kEfbtH/qiljqYhp4/+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0jDyqfspKOPuveJFwDSO5V5+qDOFXjrGhFettD044GlQrCp0JApmVD5dlxzMNx+99HzHa9gK6lPC8pkmyJ2UPLNr/ouko24RHJf37Ou1as/9zT73b1Fwo5d4P0PlyaLl5O7ex9ASeFZuOl5iHLfnfsyDJRwNeG/x/Sf7TYx8XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5w5otD/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EF20C4CEFC;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078083;
	bh=QmJJzXeg74/tDMm21ZE8ew95kEfbtH/qiljqYhp4/+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V5w5otD/CRTFSQT6LRbqQUyYXhWIrYu8GOpFp+H3QRDL53u/r+j+qTNdgqX41IcCH
	 5pXFsdrZa4I0lN0aeP/qw3MUDWQBZMqLUGKhRqPVD/jJO1mEEYmDBTWiAn5pIaMgX9
	 m82zAL3yVYYEz9hFhhgCI4W3hIIkUrCt7woODA20+wfDrgHu0JuzKCES7EtXOuVT7/
	 EtsoODSUPWXlCuMd8CVGtys+b4l7yze3NYpmLnFqkvMrqUj9scMy6bNp/AtxUUlive
	 8UZRpHcF7LHsSRbR/nfVym2Dzn3mJkc9/lZr03FFpZfD9kPtDJVY9tHDnBtCle336u
	 XZLPbRLF1A4yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F2FC54F30;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 24 May 2025 11:14:40 +0200
Subject: [PATCH v4 5/5] media: i2c: imx214: Remove hard-coded external
 clock frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-imx214_ccs_pll-v4-5-f7dc22e5255b@apitzsch.eu>
References: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
In-Reply-To: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078081; l=1261;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=roC/yqnwu/rypBv0AK9sWLYwwI91i9Cg/QD5HFxyhEk=;
 b=oS74+YSuz1SReKw3CMPcyGgH0e39XipgsbpyBEb7LbIsCW4gVPPvUkf++YOdCF/KRixS3ghIm
 a69VX8DNsnlDw2IRx/LvZUf5NkbElBqrVMM54PUja1q8jDL+6CoClTd
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Instead rely on the rate set on the clock (using assigned-clock-rates
etc.)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index fd03650a5b2bbdbbc677d5797380285f1832baa5..a0cef9e61b41be8ea76a6d6e4b8c9fc4060cfa0f 100644
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



