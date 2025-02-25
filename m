Return-Path: <linux-media+bounces-26953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC3A4404B
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4A591896891
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601D626981E;
	Tue, 25 Feb 2025 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="2QI8sZTz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0A2268FCD;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488959; cv=none; b=JoHIwU0UWY/XTIgNqIWrf/g4ku5Oiin9v9hKowoBkJZ05OqGM8WzNXjXhefI60yNIAxw9/43yFoFN1eV0X6RXEpdzpcGr4EAqoFS1f60aZYrUv3LddyRYVvyXkp9mRUigZvdXqr2kQq3P3aHh7QLspulF49DP9Wy+VBUvuVNanw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488959; c=relaxed/simple;
	bh=0V1L6sP8vB21+gdfkiLRWy2BgxHEUONyy6cQBO3kICc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6GydqoE4jqwlkMQzYy94woB1Yk6WpibhCXAVPJcej/TWZ6Mo1FhYaq1HcHN448XmNUbHwcOS8xBwJMO1CyGLic/4s7zPbXQM3LCXl+W1IEXSMWwCxpDIA+OfT387Vq6wjC42oDtHOzqa+QL7rbsOeiRQduPaHhNRFd9lELcA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=2QI8sZTz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2829AC4CEEA;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1740488959; bh=0V1L6sP8vB21+gdfkiLRWy2BgxHEUONyy6cQBO3kICc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=2QI8sZTzUnFZ7dr4Q2L2c50ohreg8iFWnE4lqxxjQZpJR/avUg1mGLQKWbHPiD/W+
	 AHYIYJI96AMGRtt6fr8R57vFwVfzsm6Nz2j33Y/m2+Z3FfUMgCfuZhzTIHOGVsiR41
	 P6UUPU7HL3PXMVQkjk9Rw4D1gRlhQ3LZDjhaZ6zg=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D86C021BC;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 25 Feb 2025 14:08:41 +0100
Subject: [PATCH 2/3] media: i2c: ov9282: add AEC Manual register definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b4-ov9282-gain-v1-2-a24af2820dde@linux.dev>
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
In-Reply-To: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740488957; l=1395;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=0V1L6sP8vB21+gdfkiLRWy2BgxHEUONyy6cQBO3kICc=;
 b=yj6uHHm+94J4ghnUEWM6JwZOohXI11I/NXqPMuxTt7FGq2sELE3AbEu8DvcPO4ZjRaauCzc//
 ZDim+VzxNYKC2iHZPhLixbeb28F9ZaiLNQM0+SnKbTApIwyDmVZcqpf
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add #define's for the "AEC MANUAL" (0x3503) register and its
values/flags. Use those in the registers single usage within the
`common_regs` struct.

All values are based on the OV9281 datasheet v1.01 (09.18.2015).

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c926842257893c4da3319b847fab9908b5bdaec6..c882a021cf18852237bf9b9524d3de0c5b48cbcb 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -44,6 +44,15 @@
 #define OV9282_EXPOSURE_STEP	1
 #define OV9282_EXPOSURE_DEFAULT	0x0282
 
+/* AEC/AGC manual */
+#define OV9282_REG_AEC_MANUAL		0x3503
+#define OV9282_DIGFRAC_GAIN_DELAY	BIT(6)
+#define OV9282_GAIN_CHANGE_DELAY	BIT(5)
+#define OV9282_GAIN_DELAY		BIT(4)
+#define OV9282_GAIN_PREC16_EN		BIT(3)
+#define OV9282_GAIN_MANUAL_AS_SENSGAIN	BIT(2)
+#define OV9282_AEC_MANUAL_DEFAULT	0x00
+
 /* Analog gain control */
 #define OV9282_REG_AGAIN	0x3509
 #define OV9282_AGAIN_MIN	0x10
@@ -214,7 +223,7 @@ static const struct ov9282_reg common_regs[] = {
 	{0x3030, 0x10},
 	{0x3039, 0x32},
 	{0x303a, 0x00},
-	{0x3503, 0x08},
+	{OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
 	{0x3505, 0x8c},
 	{0x3507, 0x03},
 	{0x3508, 0x00},

-- 
2.47.2



