Return-Path: <linux-media+bounces-42822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6EB8C782
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 14:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CCA97C6E31
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 12:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1B330214D;
	Sat, 20 Sep 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnWeukMp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD72F2820BA;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758369835; cv=none; b=FPuuCPU5srL/c8//BzBSlAEjsnzr4Rk4stDa60rk8jgGH/CKxJnNv+OJ/sinpdwsSWKpSNeCq+1/7ut6kK41mQuauRdLJR8HUi1tcDhMOm87pjpAe6rqDJgYPAC+e3WqqrLsly0N5v91hLiD1lrS4Ic2U+mzcQbfKBytplarB5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758369835; c=relaxed/simple;
	bh=HS7XyElftAvl2ll54BkDgrL2R2rTQhTdmrzcX5KlrDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ax6GnH6PprRbBtS0bjgmL1qBMAHetXQYA93JCKF6U3AomPwIH1ZbRxXhNUiO7WXfoxUdoZlvA6NSA7igoQgT8/zRm+0ev2bwsKzP/bKXmem2bVE8x9G7DdRi1jVGdPzz534xg27T3vyLRcrZLnUudeyqSe3J4gFe93ANdqKCmg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnWeukMp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E374C113D0;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758369835;
	bh=HS7XyElftAvl2ll54BkDgrL2R2rTQhTdmrzcX5KlrDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EnWeukMpmXncY/g7AqrVSoHFeX/tOY4HLn0syf+kYuatI46hPQSgRbjQzwdohKFzV
	 FURr0s8D6QTPBPFaElFOr8JiIJghCaihlp71CNBzc2JNCaff9PjxDXGMaXokCyxxtA
	 mK0lqZSU5JlNKRhU3WJI4Nw40sf50ANSlj7QkS4jV6hb8jO8j7lEmahkkB8t5QsgYK
	 HJks6O8cigfEax/Ni1nNUPKCbn/XyR23HpWB4ABMc3PtrnCeKE1miEma+QmFT+/vI3
	 zBaQTEZMCP+GJdIILsUHRgWMidj+aQBIzbewko1iqt6R808jN20h139xuVSxjD0+aO
	 ibggeesOm/N0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E658CAC5AC;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 20 Sep 2025 14:03:43 +0200
Subject: [PATCH v2 4/8] media: i2c: dw9719: Add an of_match_table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250920-dw9719-v2-4-028cdaa156e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758369833; l=1144;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=/9gQhNfUD10W3AaOsw0Ek4CP3GePWbksU9S80RaFESo=;
 b=d0vECZrY46DMQ3RaA5INTJ2E15xMI7rfJAn58BbR9wnlpoSGPW02TiW2sajrr8kTMi7hvb7XQ
 /Tvl74uTugkAdz5WO0gOZ8lOMviii/LcdmMGnprLUV770TJDwG9qZ47
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
 drivers/media/i2c/dw9719.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 8d83e6fb478124d83d65f80d33a50c0aff438a6d..d2af2c6fcd670288084e3be2e0fb21bc9bc1ae92 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -360,6 +360,13 @@ static void dw9719_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct of_device_id dw9719_of_table[] = {
+	{ .compatible = "dongwoon,dw9719" },
+	{ .compatible = "dongwoon,dw9761" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dw9719_of_table);
+
 static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops, dw9719_suspend, dw9719_resume,
 				 NULL);
 
@@ -367,6 +374,7 @@ static struct i2c_driver dw9719_i2c_driver = {
 	.driver = {
 		.name = "dw9719",
 		.pm = pm_sleep_ptr(&dw9719_pm_ops),
+		.of_match_table = dw9719_of_table,
 	},
 	.probe = dw9719_probe,
 	.remove = dw9719_remove,

-- 
2.51.0



