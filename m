Return-Path: <linux-media+bounces-23903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE79F9346
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 485AC1890B75
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B015218599;
	Fri, 20 Dec 2024 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTImi34t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC792163A1;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701194; cv=none; b=i+UqiKyH0nzyCApck1pRouCj7f+CVfMuuuOf0RReGNbe5TA2oWO0K/XvkEp6JiOffZYlwKAfHvR33jDdmhaL9WjGXOrG3DpaqPJkO0bw35IA75llrYYP+u/j1+HLQbICVewhrhqEC601dwoffA0SOyKqI7DS+UZF9LRsWhAz4MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701194; c=relaxed/simple;
	bh=g18RPaeqHc7WCL7LO4MEZKXFn9sFkhIKOlaP207TmTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdjHjqlo/QDxmGx535iBAX9/hb4/6BMhLGBLVpQqdTRbiFM4IoMHrpZHAUPHw8pjXcb/v3RkSen0iZR0SGXD/+bC3gN6zUCicuoMD7BxiqeMPDNv9we/A1ybjdzJVazbMnIYUfxX57YqiQ/ZnpAWxhLigoz1qGB/d6N5RTdRmQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTImi34t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00B38C4CEE3;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734701194;
	bh=g18RPaeqHc7WCL7LO4MEZKXFn9sFkhIKOlaP207TmTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hTImi34tsNTMU9J7+Kp5Uo8t3uZVhjppEqA/tVL33vKnzodHDsOqxsi6BGEJFdc2O
	 JyrBzHl8ZqGTLdx0wkNQHnfo7hn2uR9Vx/pAnwIUHYxx8W9I2Dk5+REpTsGQL162f/
	 ZDFUUKcNR48FN5AS8KPpCohadHHyFu349b6qLwLqFuYWBAfEAUiYUV04uh4hZBbzr/
	 PiU9mJOfO8K3oTLqL+F9VCNbCZXATqvASz5zJEePZQ1hpyM08I72zaA6j20wkLOx5x
	 VjP7sfUeMzwYKCCmzi9SZ+IazejOuYdQdi2zBcmDMNHcztKYwn4pWVAAe1RJI3CezM
	 mC0H0OLjB8LMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B3E7718A;
	Fri, 20 Dec 2024 13:26:33 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 20 Dec 2024 14:26:04 +0100
Subject: [PATCH v6 05/13] media: i2c: imx214: Drop IMX214_REG_EXPOSURE from
 mode reg arrays
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-imx214-v6-5-d90a185d82e5@apitzsch.eu>
References: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
In-Reply-To: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734701191; l=1197;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=xnGMMDNqIaP7nP/gicDjO9ZlDo7V8r+Yz/cn6oUDZ/k=;
 b=E84wLKihP+E0NgoalO9mxoOdxezqd0x9MFPPeku4QZoZFuqIdfAymjRNtIXr1VmH1nRrcXZ+q
 2hgOS7tNKpqAg6lHnO1mCAFIiyajYCJYhkd7aLEYmJG0jf6u1O6fDbL
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The IMX214_REG_EXPOSURE is configured twice, once with a hardcoded value
in the mode_<res> registers arrays, and once via v4l2_ctrl_ops. The
latter is enough, drop the former.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index d40373aa7ac496b78bfdb90f1cc6e68b0e21faaa..4e9a8e0e2c5f2ac3fd72be06906979dcd3aaa2a4 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -252,7 +252,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ CCI_REG8(0x3011), 0x00 },
 	{ IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
 
-	{ IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
 	{ IMX214_REG_ANALOG_GAIN, 0 },
@@ -326,7 +325,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ CCI_REG8(0x3011), 0x00 },
 	{ IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
 
-	{ IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
 	{ IMX214_REG_ANALOG_GAIN, 0 },

-- 
2.47.1



