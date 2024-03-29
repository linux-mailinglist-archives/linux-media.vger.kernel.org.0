Return-Path: <linux-media+bounces-8219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 884AA892235
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 18:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6371C20322
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 17:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5E213A86A;
	Fri, 29 Mar 2024 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Ohxy/Tpi"
X-Original-To: linux-media@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6931384A3;
	Fri, 29 Mar 2024 17:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731739; cv=none; b=q9B94XkF2KquJQ55I0mrJgkNZ4y4+G7tyS1QtjTj8ZSGQWpT+neHX7sCOkR+tb8woTi/p2LNij3qjR+1SXJRaN/+A5XGBHbNki5S+HmibJm3UvNHYjPDeH6jm+taIEuhbpoXvVQM1pLhjz+DrcbhGShISByEIFahIAbdSq1a64Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731739; c=relaxed/simple;
	bh=K0qocvwvrYWRNQvYnDS/H+UbwvsMZhO+c1XJJkrTUD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lc/Cn+90WJZIVU02U7IKnYCXdhCrA1TEn2UWGNNBGSpu0fIcwIF7NVjZIats4/i/WY+8INXC0BrryCoE0+F781k+bhRFp4WK25SqaaV6I7KUhTBb5IoBNUyRmuCIf89QU33PBHxhyWdpCmJL9JUt8pjhvZFvKCZq6RLlaEZNEig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Ohxy/Tpi; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6B14020E6F42;
	Fri, 29 Mar 2024 10:02:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B14020E6F42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731737;
	bh=1xAt8oLDivBzcFZmj4k6LuWQeVtOX6JrcyzssXeZ3pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ohxy/Tpis4rcZr+HmqqXLQ1kevTdDNaAjl+/S10lEH84ShVaJTi7yoXPaEoRlh1Ia
	 MyYKE35gS8u9NTdAgaEBLovHzzoDvWALpXM6LFWrBAzoFK88d9+Qat5qDC4ednKXPl
	 Kh6ndPQtI1OXBTVsPtSRnotMhgVWfK4FheWQeEeo=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:CX18 VIDEO4LINUX DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
	Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v0 06/14] media: cx18: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:30 +0000
Message-Id: <20240329170038.3863998-7-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

I2S specification has also updated the terms in v.3 to use "controller"
and "target" respectively. Make those changes in the relevant spaces as
well.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/media/pci/cx18/cx18-av-firmware.c | 8 ++++----
 drivers/media/pci/cx18/cx18-cards.c       | 6 +++---
 drivers/media/pci/cx18/cx18-cards.h       | 4 ++--
 drivers/media/pci/cx18/cx18-gpio.c        | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-firmware.c b/drivers/media/pci/cx18/cx18-av-firmware.c
index 61aeb8c9af7f..906e0b33cffc 100644
--- a/drivers/media/pci/cx18/cx18-av-firmware.c
+++ b/drivers/media/pci/cx18/cx18-av-firmware.c
@@ -140,22 +140,22 @@ int cx18_av_loadfw(struct cx18 *cx)
 	cx18_av_and_or4(cx, CXADEC_PIN_CTRL1, ~0, 0x78000);
 
 	/* Audio input control 1 set to Sony mode */
-	/* Audio output input 2 is 0 for slave operation input */
+	/* Audio output input 2 is 0 for target operation input */
 	/* 0xC4000914[5]: 0 = left sample on WS=0, 1 = left sample on WS=1 */
 	/* 0xC4000914[7]: 0 = Philips mode, 1 = Sony mode (1st SCK rising edge
 	   after WS transition for first bit of audio word. */
 	cx18_av_write4(cx, CXADEC_I2S_IN_CTL, 0x000000A0);
 
 	/* Audio output control 1 is set to Sony mode */
-	/* Audio output control 2 is set to 1 for master mode */
+	/* Audio output control 2 is set to 1 for controller mode */
 	/* 0xC4000918[5]: 0 = left sample on WS=0, 1 = left sample on WS=1 */
 	/* 0xC4000918[7]: 0 = Philips mode, 1 = Sony mode (1st SCK rising edge
 	   after WS transition for first bit of audio word. */
-	/* 0xC4000918[8]: 0 = slave operation, 1 = master (SCK_OUT and WS_OUT
+	/* 0xC4000918[8]: 0 = target operation, 1 = controller (SCK_OUT and WS_OUT
 	   are generated) */
 	cx18_av_write4(cx, CXADEC_I2S_OUT_CTL, 0x000001A0);
 
-	/* set alt I2s master clock to /0x16 and enable alt divider i2s
+	/* set alt I2s controller clock to /0x16 and enable alt divider i2s
 	   passthrough */
 	cx18_av_write4(cx, CXADEC_PIN_CFG3, 0x5600B687);
 
diff --git a/drivers/media/pci/cx18/cx18-cards.c b/drivers/media/pci/cx18/cx18-cards.c
index f5a30959a367..d9b859ee4b1b 100644
--- a/drivers/media/pci/cx18/cx18-cards.c
+++ b/drivers/media/pci/cx18/cx18-cards.c
@@ -82,7 +82,7 @@ static const struct cx18_card cx18_card_hvr1600_esmt = {
 	},
 	.gpio_init.initial_value = 0x3001,
 	.gpio_init.direction = 0x3001,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_client_reset = {
 		.active_lo_mask = 0x3001,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
@@ -129,7 +129,7 @@ static const struct cx18_card cx18_card_hvr1600_s5h1411 = {
 	},
 	.gpio_init.initial_value = 0x3801,
 	.gpio_init.direction = 0x3801,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_client_reset = {
 		.active_lo_mask = 0x3801,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
@@ -176,7 +176,7 @@ static const struct cx18_card cx18_card_hvr1600_samsung = {
 	},
 	.gpio_init.initial_value = 0x3001,
 	.gpio_init.direction = 0x3001,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_client_reset = {
 		.active_lo_mask = 0x3001,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
diff --git a/drivers/media/pci/cx18/cx18-cards.h b/drivers/media/pci/cx18/cx18-cards.h
index ae9cf5bfdd59..86f41ec6ca2f 100644
--- a/drivers/media/pci/cx18/cx18-cards.h
+++ b/drivers/media/pci/cx18/cx18-cards.h
@@ -69,7 +69,7 @@ struct cx18_gpio_init { /* set initial GPIO DIR and OUT values */
 	u32 initial_value;
 };
 
-struct cx18_gpio_i2c_slave_reset {
+struct cx18_gpio_i2c_client_reset {
 	u32 active_lo_mask; /* GPIO outputs that reset i2c chips when low */
 	u32 active_hi_mask; /* GPIO outputs that reset i2c chips when high */
 	int msecs_asserted; /* time period reset must remain asserted */
@@ -121,7 +121,7 @@ struct cx18_card {
 	/* GPIO card-specific settings */
 	u8 xceive_pin;		/* XCeive tuner GPIO reset pin */
 	struct cx18_gpio_init		 gpio_init;
-	struct cx18_gpio_i2c_slave_reset gpio_i2c_slave_reset;
+	struct cx18_gpio_i2c_client_reset gpio_i2c_client_reset;
 	struct cx18_gpio_audio_input    gpio_audio_input;
 
 	struct cx18_card_tuner tuners[CX18_CARD_MAX_TUNERS];
diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
index c85eb8d25837..82c9104b9e85 100644
--- a/drivers/media/pci/cx18/cx18-gpio.c
+++ b/drivers/media/pci/cx18/cx18-gpio.c
@@ -204,9 +204,9 @@ static int resetctrl_log_status(struct v4l2_subdev *sd)
 static int resetctrl_reset(struct v4l2_subdev *sd, u32 val)
 {
 	struct cx18 *cx = v4l2_get_subdevdata(sd);
-	const struct cx18_gpio_i2c_slave_reset *p;
+	const struct cx18_gpio_i2c_client_reset *p;
 
-	p = &cx->card->gpio_i2c_slave_reset;
+	p = &cx->card->gpio_i2c_client_reset;
 	switch (val) {
 	case CX18_GPIO_RESET_I2C:
 		gpio_reset_seq(cx, p->active_lo_mask, p->active_hi_mask,
@@ -309,7 +309,7 @@ void cx18_reset_ir_gpio(void *data)
 {
 	struct cx18 *cx = to_cx18(data);
 
-	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
+	if (cx->card->gpio_i2c_client_reset.ir_reset_mask == 0)
 		return;
 
 	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
-- 
2.34.1


