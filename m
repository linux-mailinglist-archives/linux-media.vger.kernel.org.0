Return-Path: <linux-media+bounces-30279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C1A8AA07
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 23:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0563AFB26
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 21:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EB025F964;
	Tue, 15 Apr 2025 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="my1jscAs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617D42222C0;
	Tue, 15 Apr 2025 21:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744752166; cv=none; b=Ug4+Tth2U9ZLEnv0DqBWYmxX5BccN4gCIR/F92v8X9MJzSXqkeouLgbFj+eyxy3LfWeVeekmnxqPay5ymlhbaKXp40ZVNtoB39YdA2i4zGkdGt2Gd6eXI+ycXQNKV8asy9ymdIEo2FKJiJ7ZwQjjk4mKCWy+7iG9Z0r8MIyA2SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744752166; c=relaxed/simple;
	bh=HDBzMj/s7TpTXyZ9rZ6zAXTnsR16S93ivhMIIMVpW5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OmDZ3jNsNmSBE1eQJkteE/kTYkd5Sctu0Cs3Y+qOSFZRQ+FMCRcQ5jh4RSB9unmrKSOkFBWfe0y9BiCEbqM3odipzkb3Jh0o6bAF+vMfg/tBjlS2tzvNrb+70A1XV/DMpFAXU4LDg3xAZ17GRVFBwAxPaCtNqYn4Du5z28VQGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=my1jscAs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 929D4C4CEF1;
	Tue, 15 Apr 2025 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744752165;
	bh=HDBzMj/s7TpTXyZ9rZ6zAXTnsR16S93ivhMIIMVpW5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=my1jscAs+B4CgyJ8Pbwg1DZ7xtwjK6uWzYyFXROttZJeVDXEgowO32AhUInWp4zMu
	 Pyy1R0m+SLMY0fpER/Dim77cG2qGWAur7uuXAWiWxgfsThYcgKLJSkAvCnu4hEWcZr
	 LALa2ARi8wLmLdpZjiwUtnBPLGPXn9CUP5SfmbSl4nCq7GnOcfVFSeT/MoMdc1tkx3
	 YCcM4h9IazbexPUsF57+UCHfSeUuWuxLUkQ/58yG5bh57MVpvdq/Sj2em6BNCt4tsm
	 mEfjBaq15XFq8gyvFuqceOqdaRu/xmV28l/wQyRPmEgKhGP/a6IHTJ248zWWKDyUBU
	 RgJrtS+eLSZrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EF1C369BD;
	Tue, 15 Apr 2025 21:22:45 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 15 Apr 2025 23:22:15 +0200
Subject: [PATCH 1/4] media: i2c: imx214: Reorder imx214_parse_fwnode call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-imx214_ccs_pll-v1-1-d3d7748e5fbd@apitzsch.eu>
References: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
In-Reply-To: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744752164; l=1151;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=mYScQGSBmt7ANaONRAmtNzPKkGFk15FtLy4xohsYDec=;
 b=HIyKs/6MSur1qnrgR98oCZTFdgktBF47RxIhxaaNU+3ZURDA1oOqTRxMQHaafcKR7mIc1/s9Y
 RYjInND1TVTDCAbV/aZVQlekT+HSxAN5KR+O0Z68K0HSDoddWkYN+wh
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
2.49.0



