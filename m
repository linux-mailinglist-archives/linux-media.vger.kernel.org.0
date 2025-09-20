Return-Path: <linux-media+bounces-42826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC79CB8C78B
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 14:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 960D77C6076
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 12:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27534303A1D;
	Sat, 20 Sep 2025 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZlXaiDb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D214E2FFF83;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758369835; cv=none; b=LTKCYQ0zFKD7fCZjCL4hY3MqNez/gxKvVCZv1cdYsP5O1gi4sC4V5UqFB1/pMN3MnAl8UBZs8Etn9WQvS7/vsCSR2jcgzif5gB25xK1H9ePcfvazYbArB5k5xilGrTbhpvAkfSwBCyI6vUKu9Vmd6SEQD42qDCW3hwPH7reNfdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758369835; c=relaxed/simple;
	bh=6BTUfjD+QMxV2SawM2MgDcbd8aOdOkOPCop/RLrVvp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKt7ZJjw6SSVook3OWUSA/d4a7w9TO3si5R5WnCgRm23KVvBrlRj/qOJ4MhGQNJui79txlvGGYFuKPu54sF07ylnCNi5q+aWzaG0HT6/C+GV+purdambd8UX5JShvRc/4j3ZkNwI7sVqxb8YbuOmdeP48WWrNMzMLhDYlg2AS/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZlXaiDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D894C19421;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758369835;
	bh=6BTUfjD+QMxV2SawM2MgDcbd8aOdOkOPCop/RLrVvp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nZlXaiDbqhyPsCQj4gygJ9rGtmzqVvggJ764I+xQ4BfiERlGMVEfJNkslA7dI9r8e
	 jdrJBw26MiQvK3+YSJxgrE8jAoME5/slZX/XMvuyhZM5Qu+jb1So6JDHTTAi/czYrn
	 r2YAaqroaSNacXGm/2WwKvty1WeUJ7zo+IrPnrQI5WpXtA1H4xrRKMxBMOhTdO7aXs
	 LpDPhuynWAKhCo8vSVY2pYocgeLLFOgUBWS4Y7Tc0EchycvgFo+9YJqdx84a9zykzF
	 yxwPqt7eQsHGFGpPz3KaFB4QGDlkaK3MXoqoEqMt454AaThbb0X8tS8qWOnqTVFFa3
	 IahIRxsSsA25A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB04CAC5A7;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 20 Sep 2025 14:03:44 +0200
Subject: [PATCH v2 5/8] media: i2c: dw9719: Add driver_data matching
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250920-dw9719-v2-5-028cdaa156e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758369833; l=1295;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=F4erGTuK3ncXkg+7Bo7QvNLiSQlxWsoxB54j160jl6g=;
 b=G6hjfMlrgllyNAUfxPWtZX+8UmxlFVQ8fAUrduk0zlkU6VEGsKLRlUf63GVX2+sTPGguctB2N
 piXQUsHv5kdAwVAf24lPrVC+L+bWh8+7EYIRM3+MkxQcBqVOsq1rYJr
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
index d2af2c6fcd670288084e3be2e0fb21bc9bc1ae92..5dc4126909b779aa0ce95015808b625fb21b67bb 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -282,6 +282,8 @@ static int dw9719_probe(struct i2c_client *client)
 	if (!dw9719)
 		return -ENOMEM;
 
+	dw9719->model = (enum dw9719_model)(uintptr_t)i2c_get_match_data(client);
+
 	dw9719->regmap = devm_cci_regmap_init_i2c(client, 8);
 	if (IS_ERR(dw9719->regmap))
 		return PTR_ERR(dw9719->regmap);
@@ -361,8 +363,8 @@ static void dw9719_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id dw9719_of_table[] = {
-	{ .compatible = "dongwoon,dw9719" },
-	{ .compatible = "dongwoon,dw9761" },
+	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
+	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dw9719_of_table);

-- 
2.51.0



