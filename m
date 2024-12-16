Return-Path: <linux-media+bounces-23500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE1A9F3C60
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1AD11890E58
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F3B1F03E9;
	Mon, 16 Dec 2024 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gktYK7m0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CCC1EBFE1;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382892; cv=none; b=tyoiumCtVR5KIWZwhSKIr+gLrWP9MQihSBSYkVKJOTwgjqVXRgNhKf50GTmPGFHw16CzB3GE2xA7S4ta4XIgPPTEfJjIgCn8O0grwNylc+zYulckeIgN+fMnfegLpjEKlII/jILJKStzBJUorlySLn78ZPFye2DRfk8Wl/dB6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382892; c=relaxed/simple;
	bh=SgmHB1iRnKwt+G5Hn7k0F/iXM0TJ6IFqGpIa9pN+csI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtpKJotY7FS5d7/oIF6oj9BSG4Ts02/lKQ75VR8d02Il7MYhxEnI4+qSUADti3ZsR/TQgnumWCFyoW1shnmRTJaPrEPIcqg8PxTu4g9Es41Uz4/hHIRoMNhQJdGZyrCZjUcyGWDVAb5dRSi2FZOQjM/3hcH6sHnTafOH1wlI6+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gktYK7m0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99F30C4CEF2;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734382892;
	bh=SgmHB1iRnKwt+G5Hn7k0F/iXM0TJ6IFqGpIa9pN+csI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gktYK7m0xagKP6r/ol7EPq/5FtsnRjU15AmjkEtXtMUzT+3e/pWSdIloqJaa7r5V1
	 SiyuUX/PUVYaNYVqVYJKyfPBWXgBPB7sM4yPx0qYFqXiZXPnGMnaQ7kcp7kBM6vXNj
	 ync3KYRr59idA2XvrJjbaV7aANz9XUuxacivb0Bt+BsxxfP8Ro35Q5uFVC12S8X+el
	 rrQyHZSrL4dYb0g95KnzghbmuGlo/6QzMQYAAUTcHjMwNUfItoJR1DiG+01LS1skAT
	 bYTu924w5Mdtfkw+4pAzL2aWMBmIWqOkrAv9u0UyOp3QKWmaAs5L5JtGas5h8CO/WR
	 L5KVEdS5AvXHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C9DE77186;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 16 Dec 2024 22:00:58 +0100
Subject: [PATCH v4 12/13] media: i2c: imx214: Fix clock handling on probe
 error or remove
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-imx214-v4-12-8cbda160fbce@apitzsch.eu>
References: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
In-Reply-To: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734382889; l=1153;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=ClL94X4s2eV905yGjnxIxBW7JXrrqHRlT04Ut/i9afE=;
 b=n2aw+dUZqV/HRpAw2CK/KHXkfeYT038EHThcHbYPkHIAQYGFyAhEKWL0JS9WLYSIsL+87molz
 EjVk5ws56iPB463adylOXVoTkAg6PZczhuSwaR/rqJqZvRVCF95CbmY
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
index d15422873e7ba0588914d78d3d26374d2769541c..0e587f0a44d941bd7d9230b56df18c08250e679e 100644
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



