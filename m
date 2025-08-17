Return-Path: <linux-media+bounces-40052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC2B2946C
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 19:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A31F84E77C7
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 17:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53685304BD8;
	Sun, 17 Aug 2025 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmU5lAC7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EDF3019B6;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450585; cv=none; b=JOVYkD72g3erurr5LQ039/JV3DeUsoOn3U+Yv2lySlU25kXKnnVSfa7sgPW7uqOurOXYmOmujsHlWVlop5ZtqKloilrbpiUg3BT1avGZAsvJclEzvbi5DR3odhB9pFPQH/wMxdCCPGfOKEbdv8Uskt41bYVHzJG1ln2T38XmhY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450585; c=relaxed/simple;
	bh=oPsbg1tP3AApN1JK/GZ+8hwHkKQr260jQSdxD+x2O9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g+PFVYpgvo7cxaORdBcWJAseOsj8a948n1KuA+qLtiJhfPyOMzDULdDvim9KE6Iyf+P0emQwQr02ghypDnDlYIzEdrYrbEbMruXU2okxJLKmHhK1wufnHF/e1yZc49EPlbrXCax3+SMlUt6QFGQ98DxCTHKU8YKtVgjAsksQ38Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmU5lAC7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8700AC2BCB8;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755450584;
	bh=oPsbg1tP3AApN1JK/GZ+8hwHkKQr260jQSdxD+x2O9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DmU5lAC77VNl0gTntGzmMwNejE4HBN4OwwvN0RHxvPvj2mboq15U8s4CQPEQwU82z
	 2daJ47sUuoHhpaGh8k5yIXuK8vJ+EIrRT/Y5dkFeawgK3qIedYCXDZpQOeYwK1Jsmk
	 tVfxR94JJQcN2h0IWmBs7Q6ommrHcXsy79nin/HcCXU9MkqTx5RDH8WWEeMbUkU3qf
	 pWj0SvWkqMiYqwHDCFvaP2cYIyB4zs9y0dxSLm0oCDgIv8p/Sd3yWZ8dp49xnuweDI
	 4ZvqDJkK4dz1a0DcMTaHPQae8T2paZ0YHmASJncmr/NSlSJ5Qk+jwdsk5P7WVqocdE
	 DGGJw5vSauMWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAEDCA0EDC;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 17 Aug 2025 19:09:26 +0200
Subject: [PATCH 7/7] media: i2c: dw9719: Fix power on/off sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250817-dw9719-v1-7-426f46c69a5a@apitzsch.eu>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
In-Reply-To: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755450582; l=2482;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=WHp/XEAFOtAOYg6kNIcSWN2unJmOfneuc2Td8tZ6uiA=;
 b=NJpVHJJszElHrcLxB/I+5PDwFas8+W1oFx/BrnqHoTG0l2JCXVt9E+ZVwigf9wxE3C+BFnwvZ
 Zfmn26gH1EMDwjWpYBJ1sP5M72RPg2CtSw2YF8yWb+DQu8GSP9bEYEl
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Val Packett <val@packett.cool>

The "jiggle" code was not actually expecting failure, which it should
because that's what actually happens when the device wasn't already woken
up by the regulator power-on (i.e. in the case of a shared regulator).

Also, do actually enter the internal suspend mode on shutdown, to save
power in the case of a shared regulator.

Also, wait a bit longer (2x tOPR) on waking up, 1x is not enough at least
on the DW9718S as found on the motorola-nora smartphone.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 63c7fd4ab70a0e02518252b23b89c45df4ba273d..dd28a0223d6ac980084b1f661bd029ea6b0be503 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -95,12 +95,19 @@ struct dw9719_device {
 
 static int dw9719_power_down(struct dw9719_device *dw9719)
 {
+	u32 reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD : DW9719_CONTROL;
+
+	/*
+	 * Worth engaging the internal SHUTDOWN mode especially due to the
+	 * regulator being potentially shared with other devices.
+	 */
+	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, NULL);
 	return regulator_disable(dw9719->regulator);
 }
 
 static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 {
-	u32 reg_pwr;
+	u32 reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD : DW9719_CONTROL;
 	u64 val;
 	int ret;
 	int err;
@@ -109,13 +116,15 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 	if (ret)
 		return ret;
 
-	/* Jiggle SCL pin to wake up device */
-	reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD : DW9719_CONTROL;
-	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, &ret);
-	fsleep(100);
+	/*
+	 * Need 100us to transition from SHUTDOWN to STANDBY.
+	 * Jiggle the SCL pin to wake up the device (even when the regulator
+	 * is shared) and wait double the time to be sure, then retry the write.
+	 */
+	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
+	ret = 0; /* the jiggle is expected to fail, don't even log that as error */
+	fsleep(200);
 	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
-	/* Need 100us to transit from SHUTDOWN to STANDBY */
-	fsleep(100);
 
 	if (detect) {
 		/* This model does not have an INFO register */

-- 
2.50.1



