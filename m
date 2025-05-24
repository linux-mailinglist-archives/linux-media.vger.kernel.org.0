Return-Path: <linux-media+bounces-33308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD17AC2E61
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E98D1BA2158
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 09:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226B3199FAB;
	Sat, 24 May 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUxkzM9n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E33A158535;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078083; cv=none; b=BKgrJizvDxhDprSmHErRJ5c42xi9ZpEj7D33aJ8JMOc4qlFeztC6LsImKGYr75TUJ4FRyUFB0VoBfhxKf728glIFfeUXoJtsPrt0bja2a4N5S4fGXUxDXLdDxxd3hN9L/LQmh8I3wtyKAFP6VLa779vCsBvp8kbqIMQYsZqEJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078083; c=relaxed/simple;
	bh=cjlpAvK2D/evWZrNVoSJSSs2Yj0EmEPUJrm7XWmZpOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TH4cDDRiy5PIzF7PehjNDPTtAYefqWk4nMNx7RZjMkrZn/DD7F86fjf47UWjCaJxJHUXARtTTFCP2vMKvkwW8B0ZdkaiykyTyVHsQElo+TFJQy4Dn8SvPmkp39pH/06zFVg7kzThLsmMAyHz0Bh9eNrKaudbeTK8c9mLJt8De60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUxkzM9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5F22C4CEEA;
	Sat, 24 May 2025 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078082;
	bh=cjlpAvK2D/evWZrNVoSJSSs2Yj0EmEPUJrm7XWmZpOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AUxkzM9nO07/U6LlXdNWRXcyuhAJqUivj/N8TZttVbOXYoKkWlAamtWTAn2vwOHA7
	 Q9frDo8NrhwcCOoA4byStKb81HXr0y1jGJ+I3KvUADYgu9/ndz6Yg6CWCkP/akf5J9
	 oZVF1EWN7eEb5kbcg81NmopWQ1TcNUvQkQ9zB0uKo5zyCFzqKZ1SEyNBvEryiYFi3K
	 tX8o2mGKIf3RizOVWqVQ6hvTBPzkTaDAZaicWLORYCjZZW+3fkYC9uu5fsjH7aicQJ
	 4IDnMytCCt7/n2sp5x05eNMNLlECduOOIgaFGRAUxSsOSZwB+2l/eyurjVtoUghz1K
	 Yu1nR4nCka2yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD68C54E71;
	Sat, 24 May 2025 09:14:42 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 24 May 2025 11:14:36 +0200
Subject: [PATCH v4 1/5] media: i2c: imx214: Reorder imx214_parse_fwnode
 call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-imx214_ccs_pll-v4-1-f7dc22e5255b@apitzsch.eu>
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
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078081; l=1268;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=75ElzgjAcPhkZmWR4bGwvMi9n8FDD5pHtp9QDNKGMck=;
 b=jYVZzwVgKN7KIEpkHSdsj/Gnm8CF3uEDjKWpT99zKlW/OFQGFDJCioQLjPyHrFU3MRhFbm3CJ
 iTWP76dLmNnBHXgGPDdMRIPkh1Ef0QWU1h4kO2lYQIzPjuMRIr9rcYn
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
2.49.0



