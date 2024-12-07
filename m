Return-Path: <linux-media+bounces-22832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6306D9E820F
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 21:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A20F018846C7
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 20:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A64198A01;
	Sat,  7 Dec 2024 20:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNIpIJg0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A39158DAC;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733604507; cv=none; b=AVObLc72HL2/ZyjhNkASHlD1skrt1vcsrb0gi3PS/RERGMxfJozVCkAHmwZ5sYQV60hjtzKnXxMR3GNAsUsGPCQ2IBMrx7Kl1kcnkgJahbwzHBDOB0bIY8EvdRObaHZDe/vCRuUJRcvswq7Fgtws8YYpHUxwBTzAkfPbTwbUF+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733604507; c=relaxed/simple;
	bh=/L6FqkPT4TbCAkP5rtydFM0QCWKtDaB7KH3igAI/mxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3p9vdCllAwv5x8BT8WSX3ZPKftVDrNTPNnaL2Rje7hWH5V/WbjKuBcHG1WFhEkTDIETL7g2odF024TFRX6kY9UEyHuadqZJayR73pGlySCClqsEMUrpF5P++1u8b3wbvFSuELKm38z3mFv+n5vTp7CGotmi8MC9HSom2UvhU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNIpIJg0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6801AC4CEE6;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733604506;
	bh=/L6FqkPT4TbCAkP5rtydFM0QCWKtDaB7KH3igAI/mxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pNIpIJg0qM5YGcBACCEdYQ2+pzKgaeS8s3VTRHeiOsKhJQ7RYqNJktI8JtLr7cqnI
	 /gOqMbasZdI0LsPCdlUFrfV4HuujaeubxcvJvaBfAZ70dVS4K2yCz1lpR704eFH0rw
	 PQ/ZEDQqABli4j0ZQ8bHpWMd34HLScOeTVzhs/M8LZhOpAj72gn2Ppe03juZiqzkgI
	 8oXdlaBssYWKI6T6sSzv30qQtWUck1/MLH4Ag4T5KDSIPtuZ6z3lVA5WMoj1c7z0dY
	 6n62ZKveBStCsxm8SmoSjhkJr2pPWPAeVdU39Qk71d6vAzFvd2UDGgEGFoqybJwPVU
	 B1nWGmC8irUJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8CAE7717F;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 07 Dec 2024 21:47:54 +0100
Subject: [PATCH v3 05/12] media: i2c: imx214: Drop IMX214_REG_EXPOSURE from
 mode reg arrays
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241207-imx214-v3-5-ab60af7ee915@apitzsch.eu>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
In-Reply-To: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733604504; l=1197;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=jP43uGcqxrfzHUqyboI1KtgTlpmbQuI2Drzp5GJyDuU=;
 b=5WdOPxENZlLd5DjaUPE9SIqxWsA10r6Xzeg64Ds0l92QPgePJ0L12V0kX2UYsLdRqv2sHkyuY
 BFhNtb02+BlBPfrGyKYDBzHnmZnPfGQGY8D/meblLdWD4+ApzEnFedJ
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
index 41b2a098957a8a0636b95b7985be96dc508e01f9..07926f7257877155548f7bcf0e7ee80037b4ce6c 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -254,7 +254,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ CCI_REG8(0x3011), 0x00 },
 	{ IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
 
-	{ IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
 	{ IMX214_REG_ANALOG_GAIN, 0 },
@@ -328,7 +327,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ CCI_REG8(0x3011), 0x00 },
 	{ IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
 
-	{ IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
 	{ IMX214_REG_ANALOG_GAIN, 0 },

-- 
2.47.1



