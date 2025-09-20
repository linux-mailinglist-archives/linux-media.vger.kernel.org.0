Return-Path: <linux-media+bounces-42820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C8B8C770
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 14:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 468B71BC5BB1
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 12:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F098301708;
	Sat, 20 Sep 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJiJQzO+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E725783F;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758369835; cv=none; b=UITOoQxeZJ8IxBKCBG7TQs9sdKp590XsNxzuCCKNjDMFZ7VIakPOBAwCPOZBq9c5DglNwqhFwcrs/wfrntIIZAk3tNva6888WMWZeB+pHYbWbZJnRBgCQoWCjExCg6j9g3DPHxfxFF7neVVTVuSiGaTmLgytbPH/oHm2DP9B33c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758369835; c=relaxed/simple;
	bh=VFqTSAErN+zt14ci1/07W73qXEQkUe/doU0Hs/VVX2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXBqnVMNdYnBCc1+Mlep2zI5sk8RfuvXF1uhqai7RQjOD31R27NT7HjpeWNXH8klmAiB+TNjXw7p1cu2krLwtR9jYnUZdjo//oUuWq5JiG+qq2z5+iAm7yH3q1aTYIHuI9SFqAqrf2X2acX9PnkMOpD1p+iy8o3aMQ02+6WWpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJiJQzO+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 253BEC4CEF7;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758369835;
	bh=VFqTSAErN+zt14ci1/07W73qXEQkUe/doU0Hs/VVX2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JJiJQzO+cd5cnK0jJr521YieS/WnTdafTdvkBkByoLLw0b6/AN0rggLfOuwPvm26a
	 TVjdrXV3FzU1VJ5pGDFDcUtcQUgQNLf94THxQWoahajwPENUI9N+0mYveEyIGXayjV
	 zGSfnovsSzFapPHMsjzvN7XAig5ppNVLvh9DSCy0SjMrKWkn9LR5wv1G6KRadkSMkO
	 65s/apWGvuRrIglzp7FP/7/Fs4EcIdEBgwbmXGffOUG7A5ON3lkkx+42FxYYRtOH1x
	 vZXeZM/owV2fTZxthXU8DNoOCqNjpWS5PwabSxEB43/8kbzRwH5j/Xt/tkS3YfFG2x
	 ADk7ga/7tNPcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B86CAC5A8;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 20 Sep 2025 14:03:41 +0200
Subject: [PATCH v2 2/8] media: i2c: dw9719: Deprecate dongwoon,vcm-freq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250920-dw9719-v2-2-028cdaa156e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758369833; l=1393;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=IAzlkl9/y7ZEPjP9FcEzM1T6TtpgJTz8PkPbMDCgBe8=;
 b=gjEM7rLw/wEH6ScrAvo6wFfzvqisjK8oB1sN23asixFFyLUrJS4O72PxhPtWGP8TFoPyf2WEu
 vmdVKYSGDWEDQNwztzi3axDLOfYAshNjVibLIkTEGdg84QMv7ycfBwB
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The name of property "dongwoon,vcm-freq" doesn't match its purpose.
Change the name of the property to "dongwoon,vcm-prescale" to better
describe its purpose and deprecate the old one.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 032fbcb981f20f4e93202415e62f67379897a048..5ed0042fce18acd9e6ce9f6cf6c6982e36fed275 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -82,6 +82,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 {
 	u64 val;
 	int ret;
+	int err;
 
 	ret = regulator_enable(dw9719->regulator);
 	if (ret)
@@ -123,7 +124,13 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 					 &dw9719->sac_mode);
 
 		/* Optional indication of VCM frequency */
-		device_property_read_u32(dw9719->dev, "dongwoon,vcm-freq",
+		err = device_property_read_u32(dw9719->dev, "dongwoon,vcm-freq",
+					       &dw9719->vcm_freq);
+		if (err == 0)
+			dev_warn(dw9719->dev, "dongwoon,vcm-freq property is deprecated, please use dongwoon,vcm-prescale\n");
+
+		/* Optional indication of VCM prescale */
+		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
 					 &dw9719->vcm_freq);
 	}
 

-- 
2.51.0



