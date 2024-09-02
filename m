Return-Path: <linux-media+bounces-17404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9080C968F40
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3939B2129A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF86188018;
	Mon,  2 Sep 2024 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHaOh6bB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD481154C1D;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314031; cv=none; b=JwZJem4J2iHVymLsnLUWOc0muIVrrGxAwxABt7TDTujOSx6R1Nqh4/v3zLdo27lB4dyQbMqtF6q9elxyvmTMDmtbQmn5o5Li5NzZaJ8mYSHpdm2fM0Y9mwqleDOCLnXFA0BbD47Kq29T4Qaw8aEG4qz7c0m2KgZuj0rka3amKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314031; c=relaxed/simple;
	bh=5Ytv8wsrnEMdAIi6hl/ZWeImEmKYwIq7k56/QsdmC48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5zTYU+d0b1aubnSo8tb0ATvZJJRd8CxkSiNav6EKVqwm48P1xqxMMuwM14iUu5Lpo4d+VsvlZ1pfKmPD+pEVLuBOaClDdgBdS9zynKYiI3h0BSYOx3KA4lRvgAYQRsCxG1frXDebKovOW8FT7QqGtUNW35/K7CbQd2a10O4NF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHaOh6bB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63DE0C4CECA;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=5Ytv8wsrnEMdAIi6hl/ZWeImEmKYwIq7k56/QsdmC48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PHaOh6bBSbt31nOcftLOxqAEUErB5LlTTfZgnFQxXGSR9gxmsoB1HZvMZMz3cUvTV
	 nvQEekCtNqpPp+kyIw/a0PgYvpVhCxtofZoxgzIpN5xnlrO7t8dG+ZCQaUKMohxG1s
	 5nYQM72DHi+ueynnRlWCw63RlwlT9woLU1lyVu8+BZ3GcU0NL7k9eqHJVVXURGMmP7
	 Tb+oJ6KDuarCzeTPzgMARLcM3r2jHkkrZ7uN/osXAoozqwkN2v9kDpmVLFqKwyrLQQ
	 lRvHAF2FZ0ZmEDjAM2Ki5DIuxPJ/FRPydElwH36fniPnN9u1cykzH38imvUl3Fo5oP
	 ZrpWNRKipyQ6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B43CD3420;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:29 +0200
Subject: [PATCH 02/13] media: i2c: imx214: Remove unneeded goto
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-2-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=1448;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=+EHNoEmtv/1kZSlndhZbuM8zP4Ms4i21sRmxvjbE1m0=;
 b=ZBWn6rlG+hqBQ6iO8z8r6ViyjrgcD7I32Nv/fAYf650Jgm97RWiXVDiD8BP9SDO+CgNed82vK
 +tcfXo5dcMMBAhegkYuRBXndDvDt+1KTcMK3G3aLPLa3+PGzD9jp4w1
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Simplify the imx214_start_streaming() by removing unneeded goto
statements, and the corresponding error label.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 58f3c3f67e0d..283d4783c22e 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -776,7 +776,7 @@ static int imx214_start_streaming(struct imx214 *imx214)
 	ret = imx214_write_table(imx214, mode_table_common);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sent common table %d\n", ret);
-		goto error;
+		return ret;
 	}
 
 	mode = v4l2_find_nearest_size(imx214_modes,
@@ -785,22 +785,17 @@ static int imx214_start_streaming(struct imx214 *imx214)
 	ret = imx214_write_table(imx214, mode->reg_table);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sent mode table %d\n", ret);
-		goto error;
+		return ret;
 	}
 	ret = __v4l2_ctrl_handler_setup(&imx214->ctrls);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sync v4l2 controls\n");
-		goto error;
+		return ret;
 	}
 	ret = regmap_write(imx214->regmap, IMX214_REG_MODE_SELECT, IMX214_MODE_STREAMING);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(imx214->dev, "could not sent start table %d\n", ret);
-		goto error;
-	}
-
-	return 0;
 
-error:
 	return ret;
 }
 

-- 
2.46.0



