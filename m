Return-Path: <linux-media+bounces-31740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91295AA9DC9
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69AE417F596
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A4D27466F;
	Mon,  5 May 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unlUM/5l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F871C1F05;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479181; cv=none; b=GkIS1d0cJBT0s+xuNVo+Ey1aNZU6MhLAMV1joRkeSxxvqLuoPGtU9iLHis5kTsx7TvXPwD4mtD5wBswDHpqpdrkDc/04SbHww8RQ+tTsUgawkbkohtL3F/AhkQNcdULbBQ3t056OvS2S4FTy/Kcdf+uddCSX4W0qKOUKB1IuBIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479181; c=relaxed/simple;
	bh=8a8vQY24kpOTOSPqYHfBqqeVHZ2y0yNa9wTnorDnezo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0eL7QuhTjQFMUOrcS4Cl8z/ylMuo6HheZIMgoSAKGi6WSGFX5bcJVzJmqEJJd7kh2j6rqXhQPdLFcM9ZFPWzuoWyIxjrEqTtvVpeoooOY0oD5WIRZOoM211cWlsuz6Yg9wD+Z04CPYPaD09RORJPRDvWFX1IgwCLjGKZz7P3Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unlUM/5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F38AAC4CEEE;
	Mon,  5 May 2025 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746479181;
	bh=8a8vQY24kpOTOSPqYHfBqqeVHZ2y0yNa9wTnorDnezo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=unlUM/5ltHZsBn615oUc6nrc9w/dn60B1TcBHwxLtiEEOsUmLGyBvP+8O3fxQTzEB
	 kqV8f35GEk64ZUTBCGtGOPU9+9xs61SuMTyXXgZD9mNJp1VTpSxZNqOfiwsusCg8Gk
	 5Bj9nelwEQ3Qns8tmYHdQbK1L1ltxo8sqOv6Q4j7/UGMN8qNz1eSUHeY3ZCG421LIx
	 IaLpA14mqgZkcT1SIwORILnbWCOxuIJlqVIUr+z7tmCdjdGs/oZuGp4y+pheG2V4Kr
	 gRVku9l5LgEsy4BfFTAC/PNbps4Np2EA5oUNGrS3CKqUK5wwemX/1T012gov9vYT3m
	 vbkvwtTRBzSCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E344DC3ABBF;
	Mon,  5 May 2025 21:06:20 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 05 May 2025 23:05:53 +0200
Subject: [PATCH v2 1/4] media: i2c: imx214: Reorder imx214_parse_fwnode
 call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250505-imx214_ccs_pll-v2-1-f50452061ff1@apitzsch.eu>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
In-Reply-To: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746479179; l=1201;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=JSOcAgvTpyrSY1gtujk/NN7HrGG2Tbe4hfXbnAXabfw=;
 b=A17WdpUX7bcV8mSaK6O1qISUffpXeg5wKTbZf8Tzgm8CijG16W3pkgwt40u5qH6MH2D7cU0or
 gwNaN4QORFACswGPFFRU1RDyLTGMFfstBijxE5Zvu4dWI+WQ7FH5b7P
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



