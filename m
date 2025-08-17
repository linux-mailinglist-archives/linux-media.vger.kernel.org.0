Return-Path: <linux-media+bounces-40046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B5AB29466
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 19:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FC142A356E
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 17:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E918302CB8;
	Sun, 17 Aug 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/6uSGtm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D02226CFD;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450584; cv=none; b=lNI/QZZRMQY5l00+SqwS1JkZp94vgg27scxrqNXINdjVCd0pCYRq0ue0XN6fqCTixT1SrLuke4Cb1HABkUY2/BlvQ4tX6+oC/fF52WuD2w9UAlFw9CiAIDL7rAuSIl+O6n7yD7w0VNEgOLn65sF3cr+fr/ojMyyrkSL3gPHwkWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450584; c=relaxed/simple;
	bh=4LuuhLHsRhrBJ/GnPqoKZrQZx8lQwVvdyJhdSbli8Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyUraIbxBB40GHrcpqm55kQtRoDVD4QB0gD+cB7+PjZMClTfIJ/S7fdwkgjtByP90vV5x11fqaq3avFYh/cREb3z6pBo7IG9JukOT9MMG9GbrXL1kXM2owhtfClr2NHfBsJ5egCxFXQ703fJYbC/OO4SJEoaqgqs5GFtvhtjRJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/6uSGtm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53ADDC116B1;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755450584;
	bh=4LuuhLHsRhrBJ/GnPqoKZrQZx8lQwVvdyJhdSbli8Zw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q/6uSGtmcUQT5Wc4tKli5+Qw442WSOwwwijmCwG/z5h9u6DTXb5DFjacVV0wwB1z/
	 mfpmNCGWpqDKrGWCwJgZhlHmbAKi5xkOjV99lyq3yzHnC4g1iD6EM/kDqj9CweD/TO
	 aP3rVZcUdAN0lpV3u2mTEFqqpJ1oif3283/bk2/hjGVmTAjU0rMB+KZi3CW709fzL2
	 Afi94sFwrlDttfQ2jiWMV5vJ9g1YzCCNzxN4oTuI5TF6JgmoRAvnDXbnCbkx33x+OI
	 lOQlujdus2bij7Z3IqETkdzdkAJ7bXwwyuYxeClTNzCfLHv+7GhCgRg2yITI8swCGC
	 lUEo5RznHCASA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FBECA0EE4;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 17 Aug 2025 19:09:22 +0200
Subject: [PATCH 3/7] media: i2c: dw9719: Add driver_data matching
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250817-dw9719-v1-3-426f46c69a5a@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755450582; l=1180;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=iVV78e2o0cl1oQIUHJFlr0HWutsEjrkxRyvh4oGLg+w=;
 b=Vq8uSC/Usq1sMo7iBL6uiHmbF35KllU4IuzziKWMtUwzUAJmbkJL5IUhqMXxsE8ygma6DNmjF
 6jQeRNoh3LpBPUUKQvviiwbAS7/mViR7NWE2VtMJUez0GEo16EZJw6o
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Val Packett <val@packett.cool>

In preparation for adding models with different register sets, start
assigning the model based on the i2c match data.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 5ed0042fce18acd9e6ce9f6cf6c6982e36fed275..7ce66eaede5a2a1ba9c4c30c0efc5fafcca339a0 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -282,6 +282,8 @@ static int dw9719_probe(struct i2c_client *client)
 	if (!dw9719)
 		return -ENOMEM;
 
+	dw9719->model = (enum dw9719_model)i2c_get_match_data(client);
+
 	dw9719->regmap = devm_cci_regmap_init_i2c(client, 8);
 	if (IS_ERR(dw9719->regmap))
 		return PTR_ERR(dw9719->regmap);
@@ -361,8 +363,8 @@ static void dw9719_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dw9719_id_table[] = {
-	{ "dw9719" },
-	{ "dw9761" },
+	{ "dw9719", .driver_data = DW9719 },
+	{ "dw9761", .driver_data = DW9761 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dw9719_id_table);

-- 
2.50.1



