Return-Path: <linux-media+bounces-36339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78021AEE74A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273D31882BFE
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D0D2ED85E;
	Mon, 30 Jun 2025 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHpn+uC8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E92EBDF8;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310422; cv=none; b=m0L5qYcIMd5CqCg65kI4G1h4xQFnpyFBCG9oDaQQZQnqk8VuuYmUsaN5b/NRI+YvuMJ04iJjzAjhhyvtA7t8cras1RAcbxGMcDbgEUBZoLt+wdeVnJRSbwjGD3ly0Uilh0//S6NPRhSGKMyRYtuzDETGUk5HhyASxYVZ1cwESLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310422; c=relaxed/simple;
	bh=DCqftJPX1RV1wSFgujYAjvPs7dBQkHAukdEBsj3VPU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ac6sTt7WsIQWOJbSudd12pX9HK2dZRqRR69RIvPZr+EToDViB8JpLyExebn845v/9Vd0843IgNmJ3ZPPJIxrogxXg4zrKVmUiO2I6TlYJk9x1dektWCo7pGpQ9vDMpjt7wXt9dko6Jd4438aZZGh0GHtH2tmREOfR38WrWkgmXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHpn+uC8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8898BC4AF0B;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751310421;
	bh=DCqftJPX1RV1wSFgujYAjvPs7dBQkHAukdEBsj3VPU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jHpn+uC8k/tRadfUb8og0qlp090wFJy50jhov9wqifbcf5OVJf9Ar4KnwRTpoyiK6
	 tvh+h4Jqxp55CCjXDImtWk5umfZYvAvrUroU2PRF9znYEFHh5CabxTZ9YqefZVuvWz
	 xA9btESS6aDfTrTzesxrGSTL7bGljXLm8T9IHLvXiBvgDDSvd2y8DSnM4T46Xzcpd+
	 RXsHSBpzgdbPeOxY0Slr3rpVh7Om2ARzuyREU6h91RueFkMs52/JP9e8yzdowbVrct
	 NYri/+fvTU6IawI1fe3nnuSAM/br/DVUsFmNCAPZQFfiVKPYcn2SGzdu/IZWaQiUIo
	 gJc3G/jBi9Hmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EA2C83038;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 30 Jun 2025 21:05:23 +0200
Subject: [PATCH v2 3/5] media: i2c: imx214: Use __free(fwnode_handle)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250630-imx214_fixes-v2-3-cd1a76c412c0@apitzsch.eu>
References: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
In-Reply-To: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751310420; l=1454;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=tZsctISDnJnONVzhuovrPsRYlzaU3GibT4KV2gK2N3U=;
 b=sOBUZlCZNxB8y8lgX1Eu43HcTcTRBwONrDdF5xbtn591NECKv0Mo3v1NQNY3dCEbS51EmR9cb
 Fs60WG8VdZ+B4Mul/ZoXA9ygNZC3UskjjfjIwkTwz2omhTy4AvUIq4F
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Use the __free(fwnode_handle) hook to free the endpoint when the
function exits to simplify the error path.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index d9193bafa3cbb8fec2679200c38d30077d1b11bd..b84197ee5177d609b1395e14e1404ffa5b9a6dbf 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1326,8 +1326,8 @@ static int imx214_identify_module(struct imx214 *imx214)
 
 static int imx214_parse_fwnode(struct imx214 *imx214)
 {
+	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
 	struct v4l2_fwnode_endpoint *bus_cfg = &imx214->bus_cfg;
-	struct fwnode_handle *endpoint;
 	struct device *dev = imx214->dev;
 	unsigned int i;
 	int ret;
@@ -1338,11 +1338,8 @@ static int imx214_parse_fwnode(struct imx214 *imx214)
 
 	bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
-	fwnode_handle_put(endpoint);
-	if (ret) {
-		dev_err_probe(dev, ret, "parsing endpoint node failed\n");
-		goto error;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "parsing endpoint node failed\n");
 
 	/* Check the number of MIPI CSI2 data lanes */
 	if (bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {

-- 
2.50.0



