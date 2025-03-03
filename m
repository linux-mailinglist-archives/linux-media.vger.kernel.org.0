Return-Path: <linux-media+bounces-27425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C29DA4CEE6
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 23:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5078A17160B
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 22:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C508E23C367;
	Mon,  3 Mar 2025 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Scfcxidq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC10239597;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042744; cv=none; b=d8WV5QowwZTySUYqGbJrG0lT7N3IVB7m+/NdUDZPRP7EfCO/4PKlZfw9qhK/j8CmvkhZ98+kvpc5uTUInyTWuV8hxDNRPgj5xxqO3egPnsaMrQDIYmNA3pTnhzTYuuU9PHmqWQohbFADbZojsZDPDbjg+Sw6Hx+GVI3ZhzJU5DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042744; c=relaxed/simple;
	bh=bij9SxWMYtvl2rre7/fyncZBihepIAhKYE49jozzAMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtGPokCIxxtixoTTfe5fOK6VGaoxj1Xt6GGzgk+XuiYFRxnevJuuSKRM0IHRScQNCXqcnD8q1OxMzsWIXQy46rjZRUZP//cs/0eYsnEEgZR2b0SnH5eelIjx0CVxBC0NclqDDAuomYKTULKvFYfk6BZeJeJKR0kte76K5PcaV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Scfcxidq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C30B1C4CEE8;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741042743; bh=bij9SxWMYtvl2rre7/fyncZBihepIAhKYE49jozzAMA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ScfcxidqLGne0o1+UFd6vVtYFBL3mv+d5lKu5ngTJ8Rm/tMpueJ8yt7FVwxatjYCS
	 An2moYkazDdh4a2YFRLfzvNOAn9xPOH7t6IXZauaOkkinq4KuWl0DTnQLZMw9o1Wrj
	 +KGmzHFvNnh2iyUpEQGBjZeuD6qm5FOz4WxSghj8=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF18CC282D2;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 03 Mar 2025 23:58:57 +0100
Subject: [PATCH 1/3] media: i2c: ov9282: add output enable register
 definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-ov9282-flash-strobe-v1-1-0fd57a1564ba@linux.dev>
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
In-Reply-To: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741042742; l=2129;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=bij9SxWMYtvl2rre7/fyncZBihepIAhKYE49jozzAMA=;
 b=+CwZzpD5YBCKhOr8OVZQ6dM1FYgX1RZ1DNqCCbodH2N+LUAcGl9o8vA+0LIbk8Bt2ToZ2+nfo
 djwHxPNhhNpDx/PeVkq0eELZw/2t0jXw6azmniOX71WxUBzxw9hF1ig
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add #define's for the output enable registers (0x3004, 0x3005, 0x3006),
also known as SC_CTRL_04, SC_CTRL_05, SC_CTRL_04. Use those register
definitions instead of the raw values in the `common_regs` struct.

All values are based on the OV9281 datasheet v1.53 (january 2019).

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



