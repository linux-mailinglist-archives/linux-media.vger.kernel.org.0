Return-Path: <linux-media+bounces-31314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD15AA0C88
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 15:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C165A2F52
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EA72D29C8;
	Tue, 29 Apr 2025 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mWRaizAB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE22D190B;
	Tue, 29 Apr 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931557; cv=none; b=s/SPy3GKhiPYuZvbv7CHLAld0uwtddYCaRTrgGRcQybs9zoqmq7eSBSe+lug6Ek1bX0T5OOKlV6VMZC81NXpGgzf85RFdeKScQAWExdaFPSLgJschuhHIYfslc3rgtETu7LeO92PmoJELRQav3FzFETA+8orS8vWQ+9y6wPSTAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931557; c=relaxed/simple;
	bh=FNa/xvakH+OMufv25Oa47P8olVqt6It8kjPg/VhP/1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TP2ftMmIHTy5T0amQeWVDGLDs+AIYK1vjmbiogfC1M+u8EtZECBGixiN402atZ8gClt+xhdU9v6tHveKbfVjvE0WuR54p7PDni9eyKxT4tmGO1uxZ6DfgaNOnSqcNBcigIgVc2aDvxkAQnauK87urOvKcdAgjQVT7dF0uqMuCDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mWRaizAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95DD5C4AF10;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1745931556; bh=FNa/xvakH+OMufv25Oa47P8olVqt6It8kjPg/VhP/1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mWRaizABdJXVNYkZRg2M5ObkpDSs3OnIn5CzlVJoGIMQEZDfBqAtV8OPCiDgakAHi
	 prhPWnxp//CoaczxAIETGzG2ZQZvxMuKyNBZ5Jb0+DR8HS6LnhULH3ief3xQNCAJXK
	 kwQZrS7WijJWvgsh+ZKNBCEXMrZ65wrzpAr1vdYk=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD99C3ABAC;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 29 Apr 2025 14:59:11 +0200
Subject: [PATCH v3 6/9] media: i2c: ov9282: add output enable register
 definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ov9282-flash-strobe-v3-6-2105ce179952@linux.dev>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
In-Reply-To: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931554; l=2191;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=FNa/xvakH+OMufv25Oa47P8olVqt6It8kjPg/VhP/1A=;
 b=EJZIEeoSCZK9JeBVkUd48ju6+zVRAJxQytJfBl7iON3HbipIeylHQb1s6eDD/IlzcKh4E2H/W
 Hx0iiTXKp06BqqVE1FgbQPLJDcWCroCezHAyeZjoV+A3xgFqPGcIF66
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add #define's for the output enable registers (0x3004, 0x3005, 0x3006),
also known as SC_CTRL_04, SC_CTRL_05, SC_CTRL_04. Use those register
definitions instead of the raw values in the `common_regs` struct.

All values are based on the OV9281 datasheet v1.53 (january 2019).

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c882a021cf18852237bf9b9524d3de0c5b48cbcb..f42e0d439753e74d14e3a3592029e48f49234927 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -37,6 +37,29 @@
 #define OV9282_REG_ID		0x300a
 #define OV9282_ID		0x9281
 
+/* Output enable registers */
+#define OV9282_REG_OUTPUT_ENABLE4	0x3004
+#define OV9282_OUTPUT_ENABLE4_GPIO2	BIT(1)
+#define OV9282_OUTPUT_ENABLE4_D9	BIT(0)
+
+#define OV9282_REG_OUTPUT_ENABLE5	0x3005
+#define OV9282_OUTPUT_ENABLE5_D8	BIT(7)
+#define OV9282_OUTPUT_ENABLE5_D7	BIT(6)
+#define OV9282_OUTPUT_ENABLE5_D6	BIT(5)
+#define OV9282_OUTPUT_ENABLE5_D5	BIT(4)
+#define OV9282_OUTPUT_ENABLE5_D4	BIT(3)
+#define OV9282_OUTPUT_ENABLE5_D3	BIT(2)
+#define OV9282_OUTPUT_ENABLE5_D2	BIT(1)
+#define OV9282_OUTPUT_ENABLE5_D1	BIT(0)
+
+#define OV9282_REG_OUTPUT_ENABLE6	0x3006
+#define OV9282_OUTPUT_ENABLE6_D0	BIT(7)
+#define OV9282_OUTPUT_ENABLE6_PCLK	BIT(6)
+#define OV9282_OUTPUT_ENABLE6_HREF	BIT(5)
+#define OV9282_OUTPUT_ENABLE6_STROBE	BIT(3)
+#define OV9282_OUTPUT_ENABLE6_ILPWM	BIT(2)
+#define OV9282_OUTPUT_ENABLE6_VSYNC	BIT(1)
+
 /* Exposure control */
 #define OV9282_REG_EXPOSURE	0x3500
 #define OV9282_EXPOSURE_MIN	1
@@ -213,9 +236,9 @@ static const struct ov9282_reg common_regs[] = {
 	{0x0302, 0x32},
 	{0x030e, 0x02},
 	{0x3001, 0x00},
-	{0x3004, 0x00},
-	{0x3005, 0x00},
-	{0x3006, 0x04},
+	{OV9282_REG_OUTPUT_ENABLE4, 0x00},
+	{OV9282_REG_OUTPUT_ENABLE5, 0x00},
+	{OV9282_REG_OUTPUT_ENABLE6, OV9282_OUTPUT_ENABLE6_ILPWM},
 	{0x3011, 0x0a},
 	{0x3013, 0x18},
 	{0x301c, 0xf0},

-- 
2.47.2



