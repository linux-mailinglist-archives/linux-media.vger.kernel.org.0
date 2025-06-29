Return-Path: <linux-media+bounces-36172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE6AECE1A
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 342B27A7AB4
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFA5235064;
	Sun, 29 Jun 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxYPLt2E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845EB230264;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208574; cv=none; b=drpxs0JVg+UykNSrYHQ+2oeMfzMX5k+Nz8YwjQquy2UApRg6dBkhkb3HmogMgMvinDVGhX3pwoE3U0fDJ7A108fkBU7vwdtIdgEMWKVZWoLeZUwaQbNYzUz/r71EiDDcPQ2JdaXIJ5lvMsf/tI2LH0Ek8C54AZv3i9/GZzkxfGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208574; c=relaxed/simple;
	bh=pFGS2kiEc/N0G3vaIydPvptmrnOaCRrBrGwuipdCU68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MmnJ7wcLCfrUgqOkJvuOrpUZYD9BwprVuSp8MEyEisZ5xfJ4Whr2MwOFFpdF6nDmYLJmCAu6dhsaSz6/Neoo4OERYjjFWYZUKeYE7aARvLdzJbHQylRiBzllGUcFFQoH61pNs7ZWiL36qatvJ9P9/agoaUhfe+U7fRwZ+74IPrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxYPLt2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30D7AC4CEEB;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751208574;
	bh=pFGS2kiEc/N0G3vaIydPvptmrnOaCRrBrGwuipdCU68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mxYPLt2Ei6Xp0B8D1W89W9dLbWYGJ9JKyAxF70hCTQwyTAEM1dSO8lj4P64W3yM9k
	 ffG2XorkbF3h+cT/tcmhyk9es8y3uMp7jZq+D9teNpQjCkdqfJhpvG1bT9wVeD4h/0
	 l1UhJIPzcrY2S9K+1CsXmmmvtpKeRIR6YPLAKLfmGoHBBM8CwtX2frNsN8zK2Qkxil
	 IGiU4gMrtk1pHX6WYOxz+U4EaX80lG4TnvzovOk5NnKE0v2gP9rFbXnYpkcAmhNojR
	 e9oWF5oFwOr251ChIKq6nuOVb9XZZKSHdXe4rcuLX0YIVRhGj506v0cQTfCWGe2tWj
	 ZdEWS8MMNUJ2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A91C7EE39;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 29 Jun 2025 16:49:20 +0200
Subject: [PATCH 1/5] media: i2c: imx214: Remove unneeded parentheses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-imx214_fixes-v1-1-873eb94ad635@apitzsch.eu>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
In-Reply-To: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751208572; l=883;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=lT+DL8ngWL++0j9CuZq6CgjoGYM1N1PDlleDMdMd4Pc=;
 b=8FsSWEOjW0QZXaHxqk3NFXC0TyS1cniMckAY0BLTT6n8VUecCDGbcxHw3iEbokEdiH9KWpwiQ
 tplRy/aaouFCET/U0mWcJRmsARGqlkmzXEZEojzSOQ1nT1h1P0KCRfo
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The parentheses are not needed to calculate bit_rate_mbps.

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



