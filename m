Return-Path: <linux-media+bounces-40051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A4B2946A
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 19:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65A5C4E75C4
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 17:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F32304BC2;
	Sun, 17 Aug 2025 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQRSrQGU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E03009E1;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450585; cv=none; b=D7DR/MljCCJoZSCYVaK3yefT9/kG3VYEOrPO6fSSGX/29CoJiWKOBOci+ahMREuXSJ3J+dYOU8T1bNZZcUOculu6yUmWVLjYDCWb9YXUirjXnoFe8RmaapWcnkdejkOBufQLWNdA23XpDiccKRCITbQVPU95L0qoZ3L0DDWHjnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450585; c=relaxed/simple;
	bh=8s9BTCsGGEvCiyFs4WB8+1SGfYvgDBSpMS/g3/FlHvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CD6estvS46QeA7LUrrHiDzRhVry/xv1V1IYDkr7TzTOluV55xt0lvly8LRdlq1nLxZXGp0FURLmwklpDCXPsSLSWHMn1rB42TCZQ0xWG32QfchVC0rSCIRoktRVy0h5n+bOwygazO4Q7DyeNzs5qENbmymQ4uCNLbDDHLVD56OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQRSrQGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6952BC19423;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755450584;
	bh=8s9BTCsGGEvCiyFs4WB8+1SGfYvgDBSpMS/g3/FlHvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IQRSrQGUC2FD1lJJzr8qh46wjaoBTNZTPv6Jg/AICzMKxXhpfNU24gJ05AQvApu0m
	 zJrwLqUNHVdPNX2vBCYyNvofMg6ryRIfHybd0BxpFlimPgqS4e0c/WwJG/UZmy9lLN
	 c2vT0pNPnM44D2279sacROWGzJTtaA7DK8ohHPCMgywV8at6qjorJII3Vk7StJmajO
	 RKFINeeJ6ned/z1FHySjLTuzmQxdVRgxHW1QyaqKVvPeBlAh6MQThzKGnubi1SbBHk
	 IgD9Q0t66iV3z35uTcgSIU+ST/sGhzg14DHvJ9YyjM0C+FFYWAhAdZr53+xLNoAVol
	 z7rEqkjaZ5vjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDD4CA0EF1;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 17 Aug 2025 19:09:24 +0200
Subject: [PATCH 5/7] media: i2c: dw9719: Update PM last busy time upon
 close
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250817-dw9719-v1-5-426f46c69a5a@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755450582; l=819;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=q/vBSjo9Qq/woAcBDvdCyCNYGx0lB2/sChYnvyiSRpE=;
 b=ShTf9qRg6/Sm4Xrcbbqdp2eN1v94VVjWsY5fBe13VbUi4gs32pfRF8Q6BROFE5g5WAEGVeiUs
 gJ4iRy4n+AXDuFpk7PSJIRxdb6B/gNIEjdN1Iv65coyBc/4L1JYvm9L
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Val Packett <val@packett.cool>

Update the close callback to match other similar drivers like dw9768.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 61758a9450aee20c9226e879a15eccfced9a3e96..2952d8064899e4ac29f3b1af02692fe8043ccfac 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -284,7 +284,8 @@ static int dw9719_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static int dw9719_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	pm_runtime_put(sd->dev);
+	pm_runtime_mark_last_busy(sd->dev);
+	pm_runtime_put_autosuspend(sd->dev);
 
 	return 0;
 }

-- 
2.50.1



