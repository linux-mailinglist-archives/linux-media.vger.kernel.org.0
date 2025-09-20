Return-Path: <linux-media+bounces-42824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D1B8C791
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 14:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69AF7188C8DC
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 12:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EA5303A12;
	Sat, 20 Sep 2025 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAHxp2Po"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19502FFDF2;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758369835; cv=none; b=L2V3Rgz/6GEmooSElGL6Yh3nBJ93G2e4exefvHBntzgHzccXNPY/5Ld1EBVlbS1CzSkVH6TepK0klTy124hwag6YzOJV93bsmAkfhncJRrpABKcS/XDYogC4Xe7yE+SjwW4GysJESIagt+7mKfR/cqh00VInoj685kQcYJwZ0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758369835; c=relaxed/simple;
	bh=kZm2vgE4Y4k2VcT45jEFX3XGAq8yGmdzrkQXzDzIa0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDB0SEjTmzxIPh+mk58JsSsRPGafImFVpyRPM3sM0n9XMapNTVU2WbyR1IjI2K48sfeaCUItkqUPW8IS17hvpFfYj/FpCbxmuZVsYapUOF5aGdjKEtbChYBatGeSyOSTl2e85WXsAADrGdS+3N1QezH5xSTEnIcrYZVBYkUP8oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAHxp2Po; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7223EC116C6;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758369835;
	bh=kZm2vgE4Y4k2VcT45jEFX3XGAq8yGmdzrkQXzDzIa0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dAHxp2PopZ7lXLtplyYAR3dd0V+ybqNn1O29A6AY9Jr7W9nXMT1VYFG6fCIWZqbA4
	 hnGquwI1ocRahk8cNin2RcCVxhq48N22TIHymxtvP2rdKorjD8EaQeQQMVJu4xANj8
	 gkeC/7LDfJ/BI2dDHxqJZ/ZexMDdqUYnEIrtKzYX6lq3ICrlMfqgQ/XrWlVArzv+AV
	 cSVt1Xh6SmzxZ+dTaHCJVWWmKGT0rS1Js0XhwxwaY/wc1erxkWK8G52GJkYivFzkdz
	 u7coC4pFgNbBwTP5oBzV9j5yXC/rheXEPBKH5lKLPxL3bMqKbX/AgoQvAxDEUaivj7
	 1ELVbkQ5JYhxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1B3CAC5AA;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 20 Sep 2025 14:03:47 +0200
Subject: [PATCH v2 8/8] media: i2c: dw9719: Fix power on/off sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250920-dw9719-v2-8-028cdaa156e5@apitzsch.eu>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
In-Reply-To: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758369833; l=2638;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=lWInwMIPju+2fGg21WtvyMeSsmiEJjQGEVNl36kgA5M=;
 b=20LuL86xoHl8ObMDtgsUU553lDH+HxYDd+BmsOKQ1iZH3yVfc3GnWu0FBJmSQYoN4JbcKL0IP
 ++37YmoQgnNCwOD2sf4DXCRJrDQ/6RxFjJDh+rcb/Xw06riboZv5eSC
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
 drivers/media/i2c/dw9719.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index a24594523030df7df7fb60afb5248472b4a8ea13..3627e78b8b6668933c4ecd92231465ce4105ff0c 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -95,12 +95,20 @@ struct dw9719_device {
 
 static int dw9719_power_down(struct dw9719_device *dw9719)
 {
+	u32 reg_pwr = dw9719->model == DW9718S ? DW9718S_PD : DW9719_CONTROL;
+
+	/*
+	 * Worth engaging the internal SHUTDOWN mode especially due to the
+	 * regulator being potentially shared with other devices.
+	 */
+	if (cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, NULL))
+		dev_err(dw9719->dev, "Error writing to power register\n");
 	return regulator_disable(dw9719->regulator);
 }
 
 static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 {
-	u32 reg_pwr;
+	u32 reg_pwr = dw9719->model == DW9718S ? DW9718S_PD : DW9719_CONTROL;
 	u64 val;
 	int ret;
 	int err;
@@ -109,13 +117,17 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 	if (ret)
 		return ret;
 
-	/* Jiggle SCL pin to wake up device */
-	reg_pwr = dw9719->model == DW9718S ? DW9718S_PD : DW9719_CONTROL;
-	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, &ret);
-	fsleep(100);
+	/*
+	 * Need 100us to transition from SHUTDOWN to STANDBY.
+	 * Jiggle the SCL pin to wake up the device (even when the regulator is
+	 * shared) and wait double the time to be sure, as 100us is not enough
+	 * at least on the DW9718S as found on the motorola-nora smartphone,
+	 * then retry the write.
+	 */
+	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, NULL);
+	/* the jiggle is expected to fail, don't even log that as error */
+	fsleep(200);
 	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
-	/* Need 100us to transit from SHUTDOWN to STANDBY */
-	fsleep(100);
 
 	if (detect) {
 		/* This model does not have an INFO register */

-- 
2.51.0



