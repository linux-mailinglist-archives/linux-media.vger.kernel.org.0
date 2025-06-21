Return-Path: <linux-media+bounces-35523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE3AE2856
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 11:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494865A2DD0
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 09:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFCC20C010;
	Sat, 21 Jun 2025 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ta0GWAdt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426EE1F3B97;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498691; cv=none; b=b0nlVQC9iqFQi1x6oDdvKo0QT82C6/dfhxZVKRy16uAd5DtMj3GjOXT0yFLDV9aoZCYB1L1pc4Wl2/Chw4cC7yEWD8bX/XpWljzGl62ZHmXN+ZmOt1PvHIli9FUByG5oQZk9WV9N/hmbZ9Ws+lnZhYsg+k4yNGRGpjgKBXtEOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498691; c=relaxed/simple;
	bh=mMp2I93d5y9Pxfnd7gceLhOyED1ngQU2FPgBSXb3zEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtSdgZ4t0uE2eRTmfVmBlgduI5OgOioNXld2uFzJDklTLugV86gFlLjcLnimfaVg73z8oYNS2VfXBikJw3jHWSzAfcrMhXC3ffT54S6KBq6KJdakXaxfPrJ7dd06CYA2D+l0NlR9+rg/4HG5Uc6ZBQgWL26gYOvM8pL5bnIhQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ta0GWAdt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5742C4CEEF;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750498690;
	bh=mMp2I93d5y9Pxfnd7gceLhOyED1ngQU2FPgBSXb3zEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ta0GWAdtYm/ep18ZcabBDsW1r9gjzdI/s8zUlgnnyW8AqO7SWE2MjLNgk1bd9oefm
	 kKAo5/hgCbzmEBW9JKCfKQFlcA0H6/8irdxPUazQIaurjH9LfUIg9dcYjm1T4idlvJ
	 LUrbUlu8Bo6lrgqZ4dksuxCi49n9uEkPRGTGF8ZooFPh2ukZuvDGIotxbOWzmCd9rN
	 zkgMsHP/6VkvOv6lE0Lik9qT3qnqu6/ERLqKkuI5XDy5Oxah/LGduD4eUsLASDrkzM
	 o5yjTQctcVhbt0ghFZBVYUlliIsFKvEKTzs7BDQnIM1SnrLJiiCcjgqzWqt6U9U1PW
	 17IxuPkHDJxzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4025C71157;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 21 Jun 2025 11:37:25 +0200
Subject: [PATCH RESEND v4 1/5] media: i2c: imx214: Reorder
 imx214_parse_fwnode call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-imx214_ccs_pll-v4-1-12178e5eb989@apitzsch.eu>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
In-Reply-To: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
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
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750498689; l=1268;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=ntHoZrzdn+wyAlRgU4WqQYfnIyIwLCluoNpZKfDKzr4=;
 b=WnIKyFErIOOENyE1vtsezAjFCgV4kcGnsmFsnzKid3TlAeD4yyo4uBZ1WV3JI9EYdN3sYNfuW
 FkZ2LRefSy/CMJDELtyq/0knO061v2IefJSVmW6vvoHPEtnev79x85L
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Reorder imx214_parse_fwnode call to reduce goto paths in upcoming
patches.

No functional change intended.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index dd7bc45523d8b5fcb3ec95728a6d32c4fddede72..0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1261,10 +1261,6 @@ static int imx214_probe(struct i2c_client *client)
 	struct imx214 *imx214;
 	int ret;
 
-	ret = imx214_parse_fwnode(dev);
-	if (ret)
-		return ret;
-
 	imx214 = devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
 	if (!imx214)
 		return -ENOMEM;
@@ -1295,6 +1291,10 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
 				     "failed to initialize CCI\n");
 
+	ret = imx214_parse_fwnode(dev);
+	if (ret)
+		return ret;
+
 	v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
 	imx214->sd.internal_ops = &imx214_internal_ops;
 

-- 
2.50.0



