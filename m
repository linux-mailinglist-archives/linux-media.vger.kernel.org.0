Return-Path: <linux-media+bounces-40050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8AEB2946B
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 19:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427CC2A39C1
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 17:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1871B304BC4;
	Sun, 17 Aug 2025 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTtoD0Na"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B53009E3;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450585; cv=none; b=p0MPBqHBhJuknq3ERXP99J9rBetIy/S29+lF3aQyFgLAXnEiQTa0NeIpwmAQ5+z8DYckHdRVM0ICeBWwD7hzpNlJ2UubJXFRy+fNbxzqGfTERrboqGjvOPpeKHUv8QoX+Xy2scCzHMj3WA+E8tTKeHY/zX/R6ZL5slugHm9r7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450585; c=relaxed/simple;
	bh=ihLZoFKEWHm8zbszslbomfdYpAxFXtTMVcRphVusQvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTrBpgc6IktAd0nsVNJhv9awDGj3jNgNU2fxMvtA7lk/8O9Vm/2op0EfZHSFT8B+euU7BrCLJKrtdld+WgIecEnTZ/vMrL55SeetpgqcphZByXOuQq0XGLle18SmzEw30aUXBLl95uD/eZoVTzwghGBJWZewam2u6fTZC/aoQ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTtoD0Na; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74D7AC4AF0F;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755450584;
	bh=ihLZoFKEWHm8zbszslbomfdYpAxFXtTMVcRphVusQvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jTtoD0NaFAS30XwGZlkMyXjGay8tffqhOx3HGz4DHVUclZmyvFIdSzYEOXBVroX65
	 7oDS4O9aGFgChRBGyizxJbgImJD6cyXXE6N1q0KZLlCTA6riQYHG0Agfgs8OxPOH85
	 4PmvsvDaVr5GyNJHdEg5DJH4YBXj+enP4PP4J+DKhLw9C0gN3UYLI6m2laJ6C65ttk
	 4Ob+ipPeBo3jik8HMfkrjb8MqUN0wn2ydnw1rkMeYgnE/IeOp54/3Tv3BQS1VUXEnO
	 CnPAE4GHqV3izWwqK7jtBKRXYICTgmDe4xPhC567Ia7RewNetuW6B5KmzJYPMa43Zm
	 VZnkMv9g5y0JA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC8ECA0EE9;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 17 Aug 2025 19:09:25 +0200
Subject: [PATCH 6/7] media: i2c: dw9719: Add an of_match_table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250817-dw9719-v1-6-426f46c69a5a@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755450582; l=1283;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=AM7Z9vkbnJudtfa3G+0qxABOY9vGE5baE+qTSnLT+Z8=;
 b=Ev3iti+ynUBlBW3HpTug9XQTFEc2s+o/aUidJ5fnCuGNFFCKRRHDsHVUjfTFQrtcPHm+HXdJ8
 EzAPLWOxrY5DRZdNbOKnuXSQ+59OMHDVaHGqr2me0VjTTZHceNg3TdG
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Val Packett <val@packett.cool>

Allow the dw9719 driver to be attached via FDT.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 2952d8064899e4ac29f3b1af02692fe8043ccfac..63c7fd4ab70a0e02518252b23b89c45df4ba273d 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -419,6 +419,14 @@ static const struct i2c_device_id dw9719_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
 
+static const struct of_device_id dw9719_of_table[] = {
+	{ .compatible = "dongwoon,dw9718s", .data = (const void *)DW9718S },
+	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
+	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dw9719_of_table);
+
 static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops, dw9719_suspend, dw9719_resume,
 				 NULL);
 
@@ -426,6 +434,7 @@ static struct i2c_driver dw9719_i2c_driver = {
 	.driver = {
 		.name = "dw9719",
 		.pm = pm_sleep_ptr(&dw9719_pm_ops),
+		.of_match_table = dw9719_of_table,
 	},
 	.probe = dw9719_probe,
 	.remove = dw9719_remove,

-- 
2.50.1



