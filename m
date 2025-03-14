Return-Path: <linux-media+bounces-28189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B92CBA60C29
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CE6B189B1A2
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218171EB180;
	Fri, 14 Mar 2025 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UxyQG2Kt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18261D6DB4;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942205; cv=none; b=RclqzHSGtuoBhQjRMOOoWoiHhPkpUIFkm4D3cegXFVPEyVcvtAD3JSdNUYIWq8iiWt40oqtrE77aeVcdgDwz7REqPfq3x+B4+Y920unw1T86mz/YJF/yd5AlVNhXA+nGCKulvu7ZnZt3+4XhRbJ+yfCXwuuOglGUJGfrQf/DXac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942205; c=relaxed/simple;
	bh=FNa/xvakH+OMufv25Oa47P8olVqt6It8kjPg/VhP/1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WiTvPvW+/2NPvDlppv3xPNN1CmZEEO5m2cEdiLxCFGU5nYPNvibTW0cCiczqLL3HxOPZFN7xXtelE1yrlv6l10kfzL2GsnQaZQ9d7u/s9goFfw+Za6AuQXZw+ZlsjdMtpV9iIr3ucitCvZHzBR+wM+zvX509TpJdMAFuWe5+7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UxyQG2Kt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CE85C4CEF6;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741942205; bh=FNa/xvakH+OMufv25Oa47P8olVqt6It8kjPg/VhP/1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UxyQG2KtkEKofoTxC10jsYpQrDNLRiiOuJzMYFwwlsz8VR7f6v2J6zbEaF54Vl5wS
	 LLJw9G/cLW8ne7jpg5cwRiA3mzsh7dFaTqPHXBUqS5OPRJ8+ss5UW8fiR3ENQ1Debh
	 dzUA0xlfFO4/hNk8Wscgx8c/TYNTyMUyqvpLSyH4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55580C282EC;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Fri, 14 Mar 2025 09:49:59 +0100
Subject: [PATCH v2 5/8] media: i2c: ov9282: add output enable register
 definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-ov9282-flash-strobe-v2-5-14d7a281342d@linux.dev>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
In-Reply-To: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741942203; l=2191;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=FNa/xvakH+OMufv25Oa47P8olVqt6It8kjPg/VhP/1A=;
 b=AB/IxOU5F+ww4uQk2mmxHclTCRXFyPOKPmjoisGe9pyf3IcCCMLMoT6mgqVc/1y9uPnWC8Xxs
 OtTidj6ZF6KC1Cn5W+QIydyymG22QHHpX7gs9nL1TBhyN6gvGAvMIB3
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



