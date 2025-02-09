Return-Path: <linux-media+bounces-25863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50BA2E0FE
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 22:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE3D3A5764
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 21:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A861241C89;
	Sun,  9 Feb 2025 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9kWHUXo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC779CF;
	Sun,  9 Feb 2025 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739137938; cv=none; b=OjrDGwNeo3KovEHl25TklT4ijqBp7fclGLq3O2nYFarNjaJWJdJyBYd4OUIitMFX8XtaJx8I7v3XZHp28LAKarMgI5p4tdi9qrsMblupyyKBhmeu6SiUtZRd3bpvnohI6/mA4mVwrOMsmtHn/Jj8hXVhl75BPhkMaTKnXEYXupM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739137938; c=relaxed/simple;
	bh=iSJ5jtMLBZnq74EPv4uYBA24MtpHvrIdYdyloL79HmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u71sYrrFWQknAU/R0NHhM+VLtLmd8zwZHcBJ6rEjrDt0Z/yP49BtDdx/y9LMxcEdgEzc0bBx4zt2gNskEZo6JbZiMzldubXclrABqpTXv1c2H2xxO0sA2a9Klt6uVXJ04CXmKyIccaZbBgVR5mcDj9awqzMdpJEBxSnYJKcohbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9kWHUXo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10978C4CEE8;
	Sun,  9 Feb 2025 21:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739137938;
	bh=iSJ5jtMLBZnq74EPv4uYBA24MtpHvrIdYdyloL79HmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G9kWHUXoYQjCFzivzfaWKClkbHpfpWhtKxAkxvfg2N6smufoztLbC2yKlEuC1y7bc
	 SdF2RqPLQIRPteh0pdj3m3N9iPpjC98wqfwK3FaKEad8Uu/MfDTcjpm3bpr5C2KK4R
	 TsGnv91SmFZT5fV5E774UPUuTJgJNhbmiZYGoAGJWZU+dTbwsQWMzLA4JqbeDRG75a
	 D3SKwr1m+wjMUDGsO9MYlhCtnI6Ip2rnAsxUDs0GlXwJnhCsQ+LuSYmaNW+rRD+Zne
	 zoQIkeIZZQRiTQ5XQ20qQ5fJMHChos5dSyZ8u2DoagDpoi63U3a9bzWbasU9M720SS
	 ttzJEtwb325XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9DCC021A2;
	Sun,  9 Feb 2025 21:52:17 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 09 Feb 2025 22:51:58 +0100
Subject: [PATCH v3 2/2] media: i2c: dw9719: Add of_match table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250209-dw9761dts-v3-2-14d3f00f0585@apitzsch.eu>
References: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
In-Reply-To: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
To: Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739137936; l=1275;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=mGgvurDestv373N8gVyPxAuJTKfXOnE3tkcTk8bJG1E=;
 b=XzW00rKO2isZu4IP2pkHVJ3PcZy+noiay7NCF3yEykQ/JGT+96Fxt4+ep/3N5XW4x+9Ld5y4j
 MnH//KJxEvJD02Wk69bbm3tEn8zaqJJ2w4fRRLw4q9qkbewDCKSktzS
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add of_match table for "dongwoon,dw9719" and "dongwoon,dw9761"
compatible string. This fixes automatic driver loading when using a
device-tree, and if built as a module like major linux distributions do.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 032fbcb981f20f4e93202415e62f67379897a048..6c76212d4c698462a9128d26ef95f0eccb243c7c 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -360,6 +360,13 @@ static const struct i2c_device_id dw9719_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
 
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
+		.of_match_table = of_match_ptr(dw9719_of_table),
 	},
 	.probe = dw9719_probe,
 	.remove = dw9719_remove,

-- 
2.48.1



