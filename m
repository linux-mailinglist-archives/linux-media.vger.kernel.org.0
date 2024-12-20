Return-Path: <linux-media+bounces-23910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 419309F9339
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516C616CEF1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027AD218847;
	Fri, 20 Dec 2024 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUGEjQ8U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA26216E1C;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701194; cv=none; b=LmE/p2P+8M7V5qNlqaR1o89AvKEfTYNqMrrY7jAEQ1ZDp2/Yz3TFylcd6rCkOgLfLU/RaEXyV+KpaZYBZ22/ZTBIeu4GJH/QUQvg0bLm15AvxEgSsePdhyMF1F3e+DQwerDrRLdOJo1oJ3pT03/X65GLVwDnREdAQ1wxY++5hMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701194; c=relaxed/simple;
	bh=gX/rEIkoiaEARw2m98kpMiq2yldiKp0ZkYwK34cB0oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AnKRJr/HQfTBR+SJPoMBGaPcsdr0WkMG0GNRpZPoW/bok5WrPgiZoCFAArezSbvJmy2GlIjeXOnDtjqc6L/j/cb+Yq62h3jpFx+gI5qjcBDc0jp0fY4Sf9MHsSj2oehbLIdVEJN1s9dYoDEb3Evgl4LgmIPsgPvb+etxeLci0F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUGEjQ8U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C7D8C4CEE1;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734701194;
	bh=gX/rEIkoiaEARw2m98kpMiq2yldiKp0ZkYwK34cB0oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QUGEjQ8ULygIFciMXoBZaiYmQubDxFK3h3Jq5kez8zyL2Km2e/HMumMxhbwmLja36
	 +/At8x6DACY9Ukou8FozmBSJwu+nFwjIdHiN6UOpzf0FKFeRYRaD8y2lPTiYmi4yG6
	 9Z3kB2lAoZLfRAGVxmhxEJMDPvNjsHMvSd0EubjSofJn49yV0wZYNtd/2eZHAyPbHF
	 R9u3t0U7o7K9+SzrrTitOie9pb5izhLSke1ZslugdDxvnPj91mFpHIOGcdKL6M1xFM
	 JJ/iHAmas9gwAI7T2x/cfzEs7BoNSBrCV+ZOh9pVHL+RMHeymWteiVyVBbsIr+tCht
	 DMasYSipuJylQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFBDE7718B;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 20 Dec 2024 14:26:11 +0100
Subject: [PATCH v6 12/13] media: i2c: imx214: Fix clock handling on probe
 error or remove
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-imx214-v6-12-d90a185d82e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734701191; l=1203;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=wg/kVWIy8z0SwAVAKD4eylbXnNdYiGpy/kaCuNMxk/s=;
 b=57e8xkaKGY30oNKoSvlZhr3jZsAE1peA48HeMr0dN7DEXawLR97hutA2R868eIC7ZbQsvf+LE
 sKFP3waSwkwAmmp10f8GZuvQdW/e3W7EG/wsGJSN80cxv+Z0Rm1fUZR
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The driver should disable or unprepare the clock on probe error and on
removing the module.

Remove regulator_bulk_disable(), because it is called by
imx214_power_off().

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 96d05acfeb66480770bb6291027dd023fdccb649..e8d35f8b0f8b57d64f03ff6f5ed9eac51a671e8e 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1340,7 +1340,7 @@ static int imx214_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&imx214->ctrls);
 error_power_off:
 	pm_runtime_disable(imx214->dev);
-	regulator_bulk_disable(IMX214_NUM_SUPPLIES, imx214->supplies);
+	imx214_power_off(dev);
 
 	return ret;
 }
@@ -1356,6 +1356,8 @@ static void imx214_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&imx214->ctrls);
 
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		imx214_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 }
 

-- 
2.47.1



