Return-Path: <linux-media+bounces-35524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A8AE285B
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 11:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AB34176242
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 09:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB30121325A;
	Sat, 21 Jun 2025 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVNIkf1J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B77D1F4CA1;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498691; cv=none; b=rFpC+wYiilVC2X10pW7Uy+nfHsnfMjCKBIyCFcl4n/8cmXlE91EHFDL7Aq0R1xE1ktqZOr5Cey/NHdNRggM8+gjBiFJcqYp5eqOyUKFgM1eXxOwOdVJ3RkpxqbXfbY53Gn/6XLBTenkVd7pVhqTCijbGNIMumJ4KkjDEilQo3zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498691; c=relaxed/simple;
	bh=Da1Gb2dZps+KwFdbPpKRqU3r4uC8hFgsfk35YLvidZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sRmGeQQIyvhcZITf0wxFx2k1ovoalHo5EGKR1ezIENv3EjLjbb9QTFPs8Nsi40LLZFm7okKyCSjMqR/uqvkikl9AHuC4QzW/q2yIo0szE9MdLhBHp6HyTAzQt8GwcNnHbFdNARPvE49cf9ALnz49AvvTOy0ACbCJpyesE4gz4as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVNIkf1J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7A9FC4CEF9;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750498691;
	bh=Da1Gb2dZps+KwFdbPpKRqU3r4uC8hFgsfk35YLvidZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VVNIkf1Jg5OqdDEj2DepOGBdrmh3CdEq8mzKT04K66f5wXKta9wM4OgIC5oUQKttp
	 9M6kK2YDuPfSlRhXBP/XbPc6hr/AhgKXpuG4TLxVWsJn3vVPqVNmLOrHt9nkpJfhC0
	 Na0oNSQ1pTPXw1eqwl6tjbDriG3u6vaoDxBmI+/tTIBPT+/66ejOFI0bs+/rfSXLr8
	 hDtAgbXU9IMQhosZDNxJ50P3MO+tV56Fm9iNDLyjs39WFoyKw1ihZ00uEMTF71JA0B
	 yHxWUcOXyysxvShFi678sqMbz1LHkodKZ1s166SSQHBqXDPLJmRdEQ8ppY/Bi+jLXi
	 zoz5V6SREVmrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB17CC71157;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 21 Jun 2025 11:37:29 +0200
Subject: [PATCH RESEND v4 5/5] media: i2c: imx214: Remove hard-coded
 external clock frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-imx214_ccs_pll-v4-5-12178e5eb989@apitzsch.eu>
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
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750498689; l=1261;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=ZCk329jfG7imBAJxPQK2Y7DPdg0WFnmIjBabbY8xuwc=;
 b=7u9/iEoHxGIF46EnZNgbPzTOeQMipucoawzdnk0Uu4+ERMs4QK/gbqXh6Ux3QTPvvLPnWHk0n
 nUmvF7eV3MnAbUxpZe/RbDaXAbU31N/8oTZemUb3gdaFHgw8psuYmCI
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
2.50.0



