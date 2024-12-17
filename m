Return-Path: <linux-media+bounces-23664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1655C9F58E2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D9E27A437E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CF71FBCB3;
	Tue, 17 Dec 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXRQMkWW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592F51FA844;
	Tue, 17 Dec 2024 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471564; cv=none; b=I6agbqwmKPfu9ojkyP3EQ837HmIIh6xNyxEFOUnl24wzTN2p8lCafiWaNwpPamjZQZrc7BuUyNKG152L8N1sJYfuc4QFLTgNeivbW4wMckUbHJy4jx1obTHZ97Vx9aRQW9xQM6Fz3NKTQ+OwCFKFyHYBcRCzxx15OtHkPXH8aMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471564; c=relaxed/simple;
	bh=gZL89HPtU3yiaxKZfPXs+B8zyK6TaYvyXpyXt5qyL/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NK44tfBKlt/S9Qs9IflosEuhgMO88m/uTPyuBH1/eiPOyw8NA4NQyNpz6qsH8O0DnAIISBYdCSouaIo47hij4m2PtOAnsLPLX2rrMXdtUu30XTrD8GXWNQLaA5SsHsXPirq9KvwDmeYtMz2JOcB5NPNJEgwa9//lMi4Qfe3qXwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXRQMkWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0428C4CEF5;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734471563;
	bh=gZL89HPtU3yiaxKZfPXs+B8zyK6TaYvyXpyXt5qyL/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gXRQMkWWBtnpKHTKs0fiCyk1hdylTtbSEIaOmX7UAMeQUHtCjyxKPUYZgyn13C87k
	 SvYNGlTxLItPF0OYyDY0Hg+Rc68FdEhpbq9gl8bHFXw17k0hkQbhaW7KuYu9uMdPnl
	 pr9EloC+bqS8wZWfSM9atbDe27nw4AT8xp7MI19cvPxJsHxCuWqfExR0ibmx5zcPcC
	 oACD9Je4qgyMaN2PlWwi6VYMqwgcRMxMkcB+EYr//gwNUWBdU+7nZ03WrT2oeP2X50
	 Zoq07r8lO2XGzXAhVEUO44KzBNsHI33rDjJzvVyXZa1R7SBt/2GuDn2PcCEPFqpeqP
	 gRkNkMtJNrthg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39E2E77188;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 17 Dec 2024 22:39:24 +0100
Subject: [PATCH v5 12/13] media: i2c: imx214: Fix clock handling on probe
 error or remove
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241217-imx214-v5-12-387f52adef4d@apitzsch.eu>
References: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
In-Reply-To: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734471561; l=1153;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=bYmYbnNYMd1Ygg42XXpBTqqAKdKjV0T0XBXy4t5yHyw=;
 b=Jw0eXjd06hvXwE3Pis8kr3vun2GNiWXO2Z85OpBxhza9htN8Cavq8dq400Y1e1/nmpXzi0+lD
 RRwMxc/yQomC8GztsJhZk/Xhds4SEwXdPudaWywfqUYXmnPQUpZz9xj
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



