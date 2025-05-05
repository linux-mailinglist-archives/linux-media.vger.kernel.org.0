Return-Path: <linux-media+bounces-31741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B26AA9DCC
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1921717F4EA
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEAC274677;
	Mon,  5 May 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHwJ1GVL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15325D527;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479181; cv=none; b=PNxWmWvbKdfiiYtr7MxwxvB6OqIG6eI0oOeZc6K2hI4NWm6e9T0xL3/j3W7/Qz0sWuDZdtEGjZHZQdctF+NB98c3szBfe0GccWm87AQdwxaO40wLSHHWMSLWZK36ksHe7X3tkiLgKCizKQPVxnDFRQvEGIAI/5acKtQLsKmHoLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479181; c=relaxed/simple;
	bh=bqiG3EisNRx2Bf+d4Wnt3HiRFsYTE9AsHxoBgJ7to2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOWAMC/V8VhuLeKhRgctRBDKQBJjzJqVc8lTAY2hEH+C1UaM9KjsT5HFqmF/WhRKRF+dcaf3lnZzWF79wX62Tat22x5+/nY0hSlIkEQKGrUqrIkwY75qkxdGxSUcAQHG5PNycxI/A0giBkkn0R5fLCrf8/UFpRIFeyoc6Wp9SEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHwJ1GVL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DB7BC4CEF4;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746479181;
	bh=bqiG3EisNRx2Bf+d4Wnt3HiRFsYTE9AsHxoBgJ7to2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sHwJ1GVLRypcfNkR/X7+8/XerWV73HMLMIAMNnQEqzoVj/Cb5a2nIr65I86Uytvpv
	 sxwYJHBn4m2QKUu0wp5y5stR11DbAYDDBv+ym8xkHYda0/uDwMeY2t9JIhalOZXNM1
	 QYla+DLnq0iwlYPm57s9ChjSpXH5P4K7pWaWy2nkRfUMIv6u0XrhqFkiTd1S+pjoM4
	 CCAzEihX6vwVZhCgq3QQw89swM/Ivt1PwTzQGuC4hlA6ijdZntAFzM4DSwcaI+0vlf
	 6QYI7a6+pjxa4lOaKZORdsW2cY+ZBKyxKvKvPhWKKkRSukjBBApnHYMZimkWVThpUl
	 K434nDedyGbEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F24C3ABC1;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 05 May 2025 23:05:56 +0200
Subject: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
In-Reply-To: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746479179; l=1194;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=wQtNz8rcdaU2sbMuHsPX3jQboaaqyQe4OYWiqe9auLc=;
 b=Z8zfbIjKoHgzrhBmnrIIHhsuegaa7I80/bXxyb0n0ObfxuMRZTdiFP2uEi3M4eSfelKLUI7gY
 1F/CUK3FpJ3BZRTTFlfVo8awUN37QqAwCiEbEUZbuuI0aIjveSQuiYk
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
index 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb18c608254f1e0d14dc064423 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -32,7 +32,6 @@
 
 #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
 
-#define IMX214_DEFAULT_CLK_FREQ	24000000
 #define IMX214_DEFAULT_LINK_FREQ	600000000
 /* Keep wrong link frequency for backward compatibility */
 #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
@@ -1405,11 +1404,6 @@ static int imx214_probe(struct i2c_client *client)
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



