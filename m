Return-Path: <linux-media+bounces-26951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 140BFA4404C
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 427331896B27
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604E626981F;
	Tue, 25 Feb 2025 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cyCMC6uO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C119268FD9;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488959; cv=none; b=skv52FIRdVCnqYfxc6K4Jay1O01x15++0eDjP+wX1Q+/PbrJDnAfGlJ+I8fMLQbp0ETa+3AYIhU6WaAiQEk7q39P5kgkocJswz3FcFqGbjQda6lQt70kpnswnLMJtn+Jsy3LuIlIxojObsauFuaKn59uE9Vwsciy2S1valMvV6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488959; c=relaxed/simple;
	bh=KF5ZO6ejS0ACndO4NFjdXXOOXXaUCY9pfvk3vfNCGDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLB6nbagsgtKIB0CgGFXSInCO1CJCLid01+hxK+z8/wVIJfiGCBEDxgZjQhL2ml+uQz+J4gDfRC/9mmj87GRvjdt/M4lcfPLeDcajohtSEsrf4IJKc4sS1T5ozphZs1nsDHjfoxhgZ/VAv3waLiDQ2wnl4Zsw3m4v+MUZXjoP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cyCMC6uO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35B6DC4CEEB;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1740488959; bh=KF5ZO6ejS0ACndO4NFjdXXOOXXaUCY9pfvk3vfNCGDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cyCMC6uOVL6ENJBMx1lXJrPO0uR1bu1jjC30djlZQ78iRHEqdynObv6jUjVwBrc0N
	 9evlK/yYrORjOHTwJESmj3GBeHBQiX3HOhUvHFHPbm4VRDr9eS2oNVjZt5zX3gfIz9
	 O2trTR2gDcjzZTIVRdIohh4aJ4XlWRrAb40HXu6A=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2330FC021BB;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 25 Feb 2025 14:08:42 +0100
Subject: [PATCH 3/3] media: i2c: ov9282: fix analogue gain maximum
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev>
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
In-Reply-To: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740488957; l=2508;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=KF5ZO6ejS0ACndO4NFjdXXOOXXaUCY9pfvk3vfNCGDc=;
 b=Wy3qIvcFnUZxA6mDs+WE167dDcqWuS83NVPC7MitfLarLKKapbyUYFnFzapJIgVl6JQsg2/Hf
 /irWAutIOKQCLac2qmTmi2mz9uo/8jG2Nwvy1oR3Vk8J40E43apvdXe
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

The sensors analogue gain is stored within two "LONG GAIN" registers
(0x3508 and 0x3509) where the first one holds the upper 5 bits of the
value. The second register (0x3509) holds the lower 4 bits of the gain
value in its upper 4 bits. The lower 4 register bits are fraction bits.

This patch changes the gain control to adhere to the datasheet and
make the "upper gain register" (0x3508) accessible via the gain control,
resulting in a new maximum of 0x1fff instead of 0xff.

As the "upper gain register" is now written during exposure/gain update
remove the hard-coded 0x00 write to it from common_regs.

We cover only the "real gain format" use-case. The "sensor gain
format" one is ignored as based on the hard-coded "AEC MANUAL" register
configuration it is disabled.

All values are based on the OV9281 datasheet v1.01 (09.18.2015).

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c882a021cf18852237bf9b9524d3de0c5b48cbcb..e6effb2b42d4d5d0ca3d924df59c60512f9ce65d 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -54,11 +54,11 @@
 #define OV9282_AEC_MANUAL_DEFAULT	0x00
 
 /* Analog gain control */
-#define OV9282_REG_AGAIN	0x3509
-#define OV9282_AGAIN_MIN	0x10
-#define OV9282_AGAIN_MAX	0xff
-#define OV9282_AGAIN_STEP	1
-#define OV9282_AGAIN_DEFAULT	0x10
+#define OV9282_REG_AGAIN	0x3508
+#define OV9282_AGAIN_MIN	0x0010
+#define OV9282_AGAIN_MAX	0x1fff
+#define OV9282_AGAIN_STEP	0x0001
+#define OV9282_AGAIN_DEFAULT	0x0010
 
 /* Group hold register */
 #define OV9282_REG_HOLD		0x3308
@@ -226,7 +226,6 @@ static const struct ov9282_reg common_regs[] = {
 	{OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
 	{0x3505, 0x8c},
 	{0x3507, 0x03},
-	{0x3508, 0x00},
 	{0x3610, 0x80},
 	{0x3611, 0xa0},
 	{0x3620, 0x6e},
@@ -605,7 +604,11 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 	if (ret)
 		goto error_release_group_hold;
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
+	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, (gain >> 8) & 0x1f);
+	if (ret)
+		goto error_release_group_hold;
+
+	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN + 1, 1, gain & 0xff);
 
 error_release_group_hold:
 	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);

-- 
2.47.2



