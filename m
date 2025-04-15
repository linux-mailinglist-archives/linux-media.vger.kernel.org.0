Return-Path: <linux-media+bounces-30283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C006A8AA0B
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 23:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A5C3B9141
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 21:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BEF2741A6;
	Tue, 15 Apr 2025 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJNlWykG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ECA257AC2;
	Tue, 15 Apr 2025 21:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744752166; cv=none; b=tmxiyOlHWVeBXsZUE1BXPA/7a+kmjZ8Zpwn6qmbayibrDbYIM0YboJJZ6cpkgeqnGYcNzfeVpnq9DcaSh4GHEsEQW/2FmfXkP7BUGIV9HM7fe9zsg4DhIHPxjojIX5QJqJkMShEpf1GH7edI7+Av+wEJChIwBoFeu5cOiNVYKyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744752166; c=relaxed/simple;
	bh=9ceFInsAIiTtrHOXTl+jwDg4XN1U65DdpuEC6bRsLBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjBVQDwctmH7F/Mwjn5YkMxtrC0PMcrQj/FUsrj8uGgHeVeEIn9XedXajpBE1hLFSL9RR5xyp6/RjOi4vrGG2yNjfUqu/6TM3zBFnZL2+qjNuyQg/6PKAR0OASjZOT3ZW46skS3vStCi2ANk0rkPE1fyYhTATGfD38w/RbcVpWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJNlWykG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9182C4CEF4;
	Tue, 15 Apr 2025 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744752166;
	bh=9ceFInsAIiTtrHOXTl+jwDg4XN1U65DdpuEC6bRsLBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gJNlWykG9vEO3EfBKK8UKMx9x2t1qhHeb7tMTusjxVluoIaCHyGafmeyfCU9nvbH+
	 JRkW9EqcUgBYFMCi5FdX7yTc+5ae4f3Kd1VloTglzgD/oRzEucJFTJHOTN4FrgpxX5
	 Ulop4rV7J2MoK9Vg9rMzJ6Q+XTUm259aLm9Y3iZ6z4IyzYUzEzvYlK7PnvV9XP7u+w
	 OYIyqxoyIW0aphmvQ1W7efyx9ShYlqESnEm0sDvPJj927lRg0KdLiUYPbmy4/HbC16
	 /e1vaYBfLp8/Trw0qy+zciSl+MpJGeXIRrhtAzmY3q6UM/BMtuGRNF+9ZzVwxYGr4C
	 nshBHrsIatT7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC93C369C7;
	Tue, 15 Apr 2025 21:22:45 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 15 Apr 2025 23:22:18 +0200
Subject: [PATCH 4/4] media: i2c: imx214: Read clock frequency from device
 tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-imx214_ccs_pll-v1-4-d3d7748e5fbd@apitzsch.eu>
References: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
In-Reply-To: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744752164; l=1324;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=W4XT5Lp9JWmAz4BFUvUl0L/Hk6LPKxssT64tgrm1IVY=;
 b=GICm5MM8ywi46qLCUp5JA6cgoyQUX3Pu9McqjhMq3TcdkoyyVgkBVnbue9lgEO9gf46KBHe22
 F8EoLxh9UZ6DU4PGEpYVJ4Uvo45CyYXH7RPFHpGg3TC29Fdw+dEj/+Z
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Replace the hard coded external clock frequency by the one read from
device tree.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 5589228d2b44417c0dbf15a6a17fd8f954f1a2bc..6d7f05073aa9ffb054d454771ce22e3141af60e8 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1388,6 +1388,7 @@ static int imx214_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct imx214 *imx214;
+	u32 xclk_freq;
 	int ret;
 
 	imx214 = devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
@@ -1401,7 +1402,14 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
 				     "failed to get xclk\n");
 
-	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
+	ret = device_property_read_u32(dev, "clock-frequency", &xclk_freq);
+	if (ret) {
+		dev_warn(dev,
+			 "clock-frequency not set, please review your DT. Fallback to default\n");
+		xclk_freq = IMX214_DEFAULT_CLK_FREQ;
+	}
+
+	ret = clk_set_rate(imx214->xclk, xclk_freq);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "failed to set xclk frequency\n");

-- 
2.49.0



