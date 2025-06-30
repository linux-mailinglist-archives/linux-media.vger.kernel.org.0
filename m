Return-Path: <linux-media+bounces-36335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C81AEE743
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02BF21884B7D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F532ECEA8;
	Mon, 30 Jun 2025 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luyHbFhr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033A20AF98;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310421; cv=none; b=nE47C0bAcLNk/Vx4QD5xPRjEk/bc6gTuStiZxjbpmrZXiTeATErL8zBVNZcefNMsYaM38076Tp1YiarQQraH6OXPNq6t69IvmO/eRwDU2bkj0gj8m1sgYoFHarhVfAZqiq7fDD2N22yrllZWJgVCRxOtYkIQDJM9Hl/e66+UY0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310421; c=relaxed/simple;
	bh=NsEEdeaScrNvRlWgHTamA27d9Qr5O3nCYMeIbvgGo+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfjKlXYBiOgFYR/eaODazPii0abpR65SVVhz/1Tb1IZQoxoEnAyRR/jOMgOc5XBg5jtMRnnj9QPEKGJEOmvlhIaVw4vvYmtrZPB9QEfI2XEB28Z5io1DQ6wJz+p0sjocCG5odPJsuPWTya77BeV1pUCIRrj96u5EbVQ0W0aZyOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luyHbFhr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C686C4CEEF;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751310421;
	bh=NsEEdeaScrNvRlWgHTamA27d9Qr5O3nCYMeIbvgGo+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=luyHbFhrQTI2BbNS6Yx5cEal34x42vYxQlUB8lwNoFvayrso/kvieRt6Hmq4B3hym
	 P1BQxvFWYW06hHaWRWxzp/o1vmB2rTzndQLEcVyaSenbAVTDO+6gg6pbaXj1QbgVHN
	 ANez+Tsac7B/D7qINGeVNN1kSkOr2nTtihs36zR1ZRVLJxDwiXmRRG/Pft4bCEJId1
	 NesFWo7hVxmVu22HcYgUUqkMbbR9uSBJx5ecHZ3txpwgrz62GIvMgnt1dHyWq3kgFt
	 bHXMgCgZyiDEP4Vt/qHvVecxMxpmeO+1lXKgfMJJc+yeduebSQdmeaQewCjs8pB+WN
	 1JyfwmSU8SaVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CA9C83029;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 30 Jun 2025 21:05:21 +0200
Subject: [PATCH v2 1/5] media: i2c: imx214: Remove unneeded parentheses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250630-imx214_fixes-v2-1-cd1a76c412c0@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751310420; l=950;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=e5+tRksV+Fgl0BxWMBz64V6Vf1Cb5OmGU/GImJC7m7A=;
 b=8tixpZey59d010cuk2qUfM6JIln2FMlXURuGTGQANKhAnO3Kx+0wtuCINSlZn1eCDTxJsMsa1
 FY2l+SxzSTxDcQlwMrxqCtdWjOyIemQ9rIFmFJom0R4PhbJa45ptRZ4
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The parentheses are not needed to calculate bit_rate_mbps.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index a0cef9e61b41be8ea76a6d6e4b8c9fc4060cfa0f..8e9b5c9c93b0888f3d6be857168711edaf050db3 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1029,8 +1029,8 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
-	bit_rate_mbps = (imx214->pll.pixel_rate_csi / 1000000)
-			* imx214->pll.bits_per_pixel;
+	bit_rate_mbps = imx214->pll.pixel_rate_csi / 1000000
+		      * imx214->pll.bits_per_pixel;
 	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
 			IMX214_LINK_BIT_RATE_MBPS(bit_rate_mbps), NULL);
 	if (ret) {

-- 
2.50.0



