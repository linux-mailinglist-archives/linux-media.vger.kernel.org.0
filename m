Return-Path: <linux-media+bounces-42821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D1B8C77F
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 14:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 216AF7B3FB3
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 12:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F649301709;
	Sat, 20 Sep 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKXPC3vy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92653277CBC;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758369835; cv=none; b=FgUV5tBbIltGG5BspPs89bsE412P9r0qiMgPCQCZDlyTMIM4Oc17qAuEXVhb/ib1BVp+B33spiHF/nUgQNgUEii5aemrvvQ1MIGftqhb9hyGNHzB8HumWOBR2SUKBwwIc8nRYzi6cybjrBomZlQ9qsnMVksTOkT0+qMQTPf+R6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758369835; c=relaxed/simple;
	bh=puly70ickx/CJRoQqmK/c1OTqdtd5uGWc56u2FLtq3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbNLDBRDusHUcR8uWlKVh0LspoFVvl5JaK/le1Te+0FPJe+ORTIBQJbre+ucELV8fcjXFk7AYj/uvv8KRdyfMnIiGkoIB6+psZ166HTgGYcoVU0vwHay/IHisjYYnx+n6rr8p9Ke6TGgi4afMu+gZATgJFJpPmB3NWLQeCq0bx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKXPC3vy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C00AC4AF09;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758369835;
	bh=puly70ickx/CJRoQqmK/c1OTqdtd5uGWc56u2FLtq3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mKXPC3vyf4qGQqWxNS1gPVOJRaLN9EyDnRhSzOUpMBXgTs2obS3ENyRUM9LrHVBLF
	 lXVqHMGeX/k96MupVVyKvUgDpu+lH3kmPmUlHRG5GM5LTouuaBqpl1JYMRqhg1R4fq
	 RV+8snUnCThpP615JT/4v5Y7AeJz9pj1QqGFuEvHE4VT4DBdzTS/ZATGytkJ9WGDYf
	 4fEkuDBwkJyX3nLT/WthNl9T4TNlrTdRcTQw8svaseZ+WoPIhHfGaaZoJ1zIcpa4Ap
	 /iOFjg5rk822f0zca3dWc2nocq70JFUYOI1P3AZ2y0Lbf/0sWhMTkvIn/vwnur9Exp
	 9kaGZb0hjIxVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CC2CAC597;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 20 Sep 2025 14:03:42 +0200
Subject: [PATCH v2 3/8] media: i2c: dw9719: Remove unused i2c device id
 table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250920-dw9719-v2-3-028cdaa156e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758369833; l=1027;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=mUZrDSJoYo2aj0olxKZRSTyHXKgynAJkOjdM9pfxGf4=;
 b=Yz8roYjQv9VoTv5p5CUVXxBWr5bvH5xPSAv3GxDTUwWmlZWQFujcMtDTNcchUuaoVdmIEBxS8
 XutCP8Dh55dC0ZGY3fc4+ttaKn56oPuJ4Tvk1jhU9drzCQDLyeUPgww
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Nothing depends on the I²C device ID table, so remove it.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 5ed0042fce18acd9e6ce9f6cf6c6982e36fed275..8d83e6fb478124d83d65f80d33a50c0aff438a6d 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -360,13 +360,6 @@ static void dw9719_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
-static const struct i2c_device_id dw9719_id_table[] = {
-	{ "dw9719" },
-	{ "dw9761" },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
-
 static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops, dw9719_suspend, dw9719_resume,
 				 NULL);
 
@@ -377,7 +370,6 @@ static struct i2c_driver dw9719_i2c_driver = {
 	},
 	.probe = dw9719_probe,
 	.remove = dw9719_remove,
-	.id_table = dw9719_id_table,
 };
 module_i2c_driver(dw9719_i2c_driver);
 

-- 
2.51.0



