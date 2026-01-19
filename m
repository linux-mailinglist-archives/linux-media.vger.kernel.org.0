Return-Path: <linux-media+bounces-51080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B985D3B6AC
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 20:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B65D13111CA8
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 18:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63B7392C44;
	Mon, 19 Jan 2026 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb+NerG9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE891288CA6
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 18:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849176; cv=none; b=mPFytzgeJivWJHqBrhAYEwty9fNPVZazXPbTXA0IScn1gS8MQs/3mAvnfzMSoAP/apkaxr5xV/Pi4VuBCUKUbRqEcDhoEDl2yIvenrQH9Kj2tTmP0JqITwMKZmT9xp8zFglVDb26oB7d1YtV6CHELT4TrZ7CTwkGcgIskcdW7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849176; c=relaxed/simple;
	bh=2x/SzgSPcSlQ8BjH2oqKAW4sH8ZA2Zp4mupT14jEJhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTU05DphFV3Hri/Sxd+VPvGidPruSs7Htp8ZTO4fMcWMQzRuCJ08WoeR+c8gKbm8rLhM1wa6rJje6ZIgxSAozagaLhR4gcQh4sUvwb9xCwJiaIPAgJj+vNM+oBBN08ouCAu3L6lTT6W2EDHML86CTKRLBovnQRP6hfyhN5iKS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb+NerG9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so30091145e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768849170; x=1769453970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z89abPmhvD6CnuNAqM70W7N97JFPwBX+jJ8PFA8+gg=;
        b=Gb+NerG9MTnuGxqxBGG4EMLdLffCUR/8ncTgyCi1ll5NL7VD1JucZcxIyZbdE2yRh3
         lkQ6XN/5OmkITEC9rmlMO1i7PTpE40VJG1m/Wzo7C6LMvPN/BmwvCeXzY+V6grJdQmpl
         TR4i+TS0omevhEQ4/Sx6j8OpAsOq8+bXAh+RZVGmMaw+TpotD2XiwMmFBJHpeJCOWC+p
         XSUJWS1f1FJDYY4P6HTEr6iVk1LwxMVioGdjmsyGRkANOZG/v5SeTnThu/rAY6+f3WSD
         iC4KSG0FEMa6EHQY4gWTRMIHEr5ndFcxUwxlDzbctBEwBTnSYjX6iCyfc42APf7g1FQ2
         KGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768849170; x=1769453970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z89abPmhvD6CnuNAqM70W7N97JFPwBX+jJ8PFA8+gg=;
        b=U5ABEIM17RE4BsgEjlqdr9Dz6c5cdLpe6bUFG9ibZ/VxVrarqztjV1OdhuXJwgmeEM
         /aWI4L4Xbb1OqLx966DRu6XgmlejIFYznXCKytdZIkXTbsCTfi3sBaTJ6yXIoJm3xnl7
         9rDoNE2zPeTs5cnPMKl7uD7+/fqJeqhRuV/dTmuBd7bdg/p3hpAnmpWEvY2HXcMaRDee
         F+k87df5EyPhoWBYi6429eJbliweRYmv+TVOMlzJEL7vInsNR15X7s1fKnWgRDW9TnrD
         3W0gmA4FER3xOXtRtIo7Bm+soXUuoX2RvJN+R3Fu5spzdTlivFmWOHz2E6v4V6CgwzB4
         hI8A==
X-Forwarded-Encrypted: i=1; AJvYcCXWxHXf+Wmk0ogzsMlWu971sehADIfK4Lb/el3q9J7lw9p6Iv7PQb4ofaUDY+GyyNmpmzSNeD6+RL7yvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKg9sPY8ZNKG38UMO0b+AsYzHvrtanRWxMXD8NFjX650AaLRd
	+MjMnMtSlpUweocjOSUaXW/vA/a69MSycRHroVvI9QazkRnDaR7h49ZhZKYWjXEsOFd6
X-Gm-Gg: AY/fxX7k8gaWeyyd+r/BtuxKTZjrs9ZLSK8NUpww+Fysv0Cyegvsx/isEmZnfEfd+fA
	37nyQ7eDjUYM4Y5YULzmxrzz70/+JyW1ttqgeFbznXkf+uS8imYwE2a0+8pAvmpYiVL8Km6dEpP
	OLeFKwkJB8J/dKusxjHCcIrAn+ub71kxPlIYn+KNHQj2k7Inr4LYWVdiWCKooA0hp13gvUmrSO4
	Ahf5P3p6Zjy8SIuhb/GWYfGpogciJ9ISh/etAx2Yqsf+s6zOrRdQJVI7MjTNKObm/Q2J2hK0U74
	ky6DHUq4WOniItZlRLHXf5KYTt5nq/HVux/BhEyl+7z7vsOXdoSKVgHqPcLnVU1kh4uAdk6TDFr
	uIABlIgvUMoAFDDoYJJw/aiKbx0aJjSlQBWHzlwsNg0RTkuumr5+AmIJX9N2IccKPuGgXFW5vmp
	EzFcHzYJx4ncDcSfxfXKei9g==
X-Received: by 2002:a05:600c:6291:b0:480:3c28:838 with SMTP id 5b1f17b1804b1-4803c280b3bmr7039935e9.8.1768849169909;
        Mon, 19 Jan 2026 10:59:29 -0800 (PST)
Received: from XEEY-CACHY.1.1.1.1 ([2a00:23c6:981e:c701:855e:f5a6:761:916f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b2755absm330031215e9.15.2026.01.19.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:59:29 -0800 (PST)
From: Luciano Ciccariello <xeeynamo@gmail.com>
X-Google-Original-From: Luciano Ciccariello <xeeynamo@hotmail.com>
To: mchehab@kernel.org
Cc: Luciano Ciccariello <xeeynamo@hotmail.com>,
	linux-media@vger.kernel.org
Subject: [RFC PATCH] Add StarTech SVID2USB232 support
Date: Mon, 19 Jan 2026 18:59:20 +0000
Message-ID: <20260119185921.575666-1-xeeynamo@hotmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a work-in-progress implementation of StarTech SVID2USB232,
which uses a single EM28281 chip to capture and decode analog signal.
NOTE: this driver is NOT production ready!

Unlike other em28xx chips, EM28281 integrates its own TVP5150-like
decoder. The TVP5150 communication happens at register 0x7Axx instead
of I2C. The existing TVP5150 driver issues some commands that are
incompatible with this chip. These are either skipped or overridden
with data that the chip expects.

What works:
- Video capture with PAL via composite
- Audio capture
- Brightness, saturation, color balance, sharpness settings
- Limited or Full colour range setting

What does not work:
- Switch input to S-VIDEO
- Switch to NTSC, PAL-60 or SECAM
- HUE setting

What is untested:
- NTSC and SECAM (not sure if EM28281 supports signal auto-detection)
- S-VIDEO (I ordered a cable for testing)

The patch has a lot of compromises, with some room for better code.
Unfortunately I lack understanding how to make it better, so please
provide feedback.

Raw StarTech SVID2USB232 capture from a sane driver:

reg:0x7a00 val:0x32
reg:0x7a01 val:0x04
reg:0x7a02 val:0x4f
reg:0x7a03 val:0x09
reg:0x7a04 val:0xdc
reg:0x7a07 val:0x2f
reg:0x7a08 val:0x7a
reg:0x7a09 val:0x20
reg:0x7a0a val:0x8c
reg:0x7a0b val:0x00
reg:0x7a0c val:0x67
reg:0x7a0f val:0x1c
reg:0x7a17 val:0xc3
reg:0x7a18 val:0x28
reg:0x7a19 val:0x32
reg:0x7a1a val:0xb9
reg:0x7a1b val:0x86
reg:0x7a1c val:0x1e
reg:0x7a1d val:0x99
reg:0x7a1e val:0x99
reg:0x7a1f val:0x9a
reg:0x7a20 val:0x3d
reg:0x7a21 val:0x3e
reg:0x7a28 val:0x5e
reg:0x7a29 val:0x00
reg:0x7a2e val:0x88
reg:0x7a2f val:0x52
reg:0x7a30 val:0x2a
reg:0x7a31 val:0xc3
reg:0x7a3f val:0x00
reg:0x7a40 val:0x05
reg:0x7a51 val:0x00
reg:0x7a53 val:0xcc
reg:0x7a5d val:0x16
reg:0x7a5e val:0x50
reg:0x7a60 val:0xb4
reg:0x7a67 val:0x64
reg:0x7a80 val:0x03
reg:0x7a82 val:0x52
reg:0x7ac1 val:0x1b
reg:0x7ac8 val:0x00
Signed-off-by: Luciano Ciccariello <xeeynamo@hotmail.com>
---
This is my very first kernel patch. There are many unknowns I might not be
aware of, so please provide feedback.

My objective is to add EM28281 driver support not only for my personal use, but
for whoever wants to make use of this video capture device on Linux. I tried
adjusting the code trying to strike a balance between having a functional
device and "clean" code. I am very sure there is a much better way to submit
a cleaner patch than this, hence why I am submitting the patch in this state.

My initial approach was a dummy i2c_bus->algo_type, while I was setting up all
the 0x7AXX registers at em28xx_pre_card_setup. Then I started to slowly defer
registry writes from the TVP5150 driver in drivers/media/i2c/tvp5150.c.

I left in the commit message a dump of the raw registry writes to keep history
of how a sane driver is expected to send data.

 drivers/media/usb/em28xx/em28xx-cards.c |  35 ++++++
 drivers/media/usb/em28xx/em28xx-core.c  |   7 ++
 drivers/media/usb/em28xx/em28xx-i2c.c   | 145 +++++++++++++++++++++++-
 drivers/media/usb/em28xx/em28xx-reg.h   |   1 +
 drivers/media/usb/em28xx/em28xx.h       |   5 +
 5 files changed, 192 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index a51cbcf429e1..708ccb12c31c 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -1154,6 +1154,21 @@ const struct em28xx_board em28xx_boards[] = {
 			.amux     = EM28XX_AMUX_LINE_IN,
 		} },
 	},
+	[EM28281_BOARD_STARTECH_SVID2USB232] = {
+		.name          = "StarTech SVID2USB232",
+		.tuner_type    = TUNER_ABSENT,
+		.decoder       = EM28XX_TVP5150,
+		.xclk          = EM28XX_XCLK_FREQUENCY_12MHZ,
+		.input         = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = TVP5150_COMPOSITE0,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = TVP5150_SVIDEO,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		} },
+	},
 	[EM2861_BOARD_PLEXTOR_PX_TV100U] = {
 		.name         = "Plextor ConvertX PX-TV100U",
 		.tuner_type   = TUNER_TNF_5335MF,
@@ -2849,6 +2864,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28178_BOARD_PLEX_PX_BCUD },
 	{ USB_DEVICE(0xeb1a, 0x5051), /* Ion Video 2 PC MKII / Startech svid2usb23 / Raygo R12-41373 */
 			.driver_info = EM2860_BOARD_TVP5150_REFERENCE_DESIGN },
+	{ USB_DEVICE(0xeb1a, 0x8286), /* StarTech SVID2USB232 */
+			.driver_info = EM28281_BOARD_STARTECH_SVID2USB232 },
 	{ USB_DEVICE(0x1b80, 0xe349), /* Magix USB Videowandler-2 */
 		.driver_info = EM2861_BOARD_MAGIX_VIDEOWANDLER2 },
 	{ },
@@ -3093,6 +3110,14 @@ static void em28xx_pre_card_setup(struct em28xx *dev)
 		 */
 		em28xx_wait_until_ac97_features_equals(dev, 0x6a90);
 		break;
+
+	case EM28281_BOARD_STARTECH_SVID2USB232:
+		em28xx_write_reg(dev, EM2874_R80_GPIO_P0_CTRL, 0xff);
+		em28xx_write_reg(dev, 0x0D, 0xff);
+		msleep(70);
+		em28xx_write_reg(dev, 0x7A31, 0xc3);
+		em28xx_write_reg(dev, 0x7A3F, 0x00);
+		break;
 	}
 
 	em28xx_gpio_set(dev, dev->board.tuner_gpio);
@@ -3651,6 +3676,11 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 			dev->wait_after_write = 0;
 			dev->eeprom_addrwidth_16bit = 1;
 			break;
+		case CHIP_ID_EM28281:
+			chip_name = "em28281";
+			dev->wait_after_write = 0;
+			dev->eeprom_addrwidth_16bit = 1;
+			break;
 		case CHIP_ID_EM2883:
 			chip_name = "em2882/3";
 			dev->wait_after_write = 0;
@@ -3688,6 +3718,8 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	/* register i2c bus 0 */
 	if (dev->board.is_em2800)
 		retval = em28xx_i2c_register(dev, 0, EM28XX_I2C_ALGO_EM2800);
+	else if (dev->chip_id == CHIP_ID_EM28281)
+		retval = em28xx_i2c_register(dev, 0, EM28XX_I2C_ALGO_EM28281_INTEGRATED);
 	else
 		retval = em28xx_i2c_register(dev, 0, EM28XX_I2C_ALGO_EM28XX);
 	if (retval < 0) {
@@ -3702,6 +3734,9 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 		if (dev->is_em25xx)
 			retval = em28xx_i2c_register(dev, 1,
 						     EM28XX_I2C_ALGO_EM25XX_BUS_B);
+		else if (dev->chip_id == CHIP_ID_EM28281)
+			retval = em28xx_i2c_register(dev, 1,
+							 EM28XX_I2C_ALGO_EM28281_INTEGRATED);
 		else
 			retval = em28xx_i2c_register(dev, 1,
 						     EM28XX_I2C_ALGO_EM28XX);
diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 29a7f3f19b56..27b8d1ea74ad 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -506,6 +506,13 @@ int em28xx_audio_setup(struct em28xx *dev)
 		return 0;
 	}
 
+	if (dev->chip_id == CHIP_ID_EM28281) {
+		/* Skip standard AC97 initialization which fails on this chip */
+		dev->int_audio_type = EM28XX_INT_AUDIO_NONE;
+		dev->audio_mode.ac97 = EM28XX_NO_AC97;
+		return 0;
+	}
+
 	/* See how this device is configured */
 	cfg = em28xx_read_reg(dev, EM28XX_R00_CHIPCFG);
 	dev_info(&dev->intf->dev, "Config register raw data: 0x%02x\n", cfg);
diff --git a/drivers/media/usb/em28xx/em28xx-i2c.c b/drivers/media/usb/em28xx/em28xx-i2c.c
index a7eb11f7fb34..078fe84cc2be 100644
--- a/drivers/media/usb/em28xx/em28xx-i2c.c
+++ b/drivers/media/usb/em28xx/em28xx-i2c.c
@@ -471,6 +471,142 @@ static int em25xx_bus_B_check_for_device(struct em28xx *dev, u16 addr)
 	 */
 }
 
+/*
+ * EM28281 integrated TVP5150 decoder access functions
+ *
+ * The EM28281 has a TVP5150-compatible video decoder integrated into the chip.
+ * Unlike external TVP5150 chips which communicate via I2C, this integrated
+ * decoder is accessed through direct USB control transfers at register
+ * addresses starting at 0x7a00.
+ */
+static inline bool is_tvp5150_addr(u16 addr)
+{
+	return addr == 0xb8;
+}
+
+static int em28281_integrated_send_bytes(struct em28xx *dev, u16 addr, u8 *buf, u16 len)
+{
+	int ret;
+	u16 reg;
+
+	if (!is_tvp5150_addr(addr))
+		return -EOPNOTSUPP;
+	if (len == 1) {
+		/* setting register address for subsequent read */
+		dev->em28281_last_reg = buf[0];
+		return 1;
+	}
+	if (len != 2) {
+		dev_warn(&dev->intf->dev,
+			 "em28281: unexpected I2C write len %d (addr=0x%02x)\n",
+			 len, addr);
+		return -EINVAL;
+	}
+
+	// ignore values to avoid image corrruption
+	switch (buf[0]) {
+	// TVP5150_DATA_RATE_SEL
+	case 0x0d: return len; // image B/W
+	// TVP5150_HORIZ_SYNC_START
+	case 0x16: return len; // image B/W and weird
+	// undocumented, but initialized on WinTV USB2
+	case 0x27: return len; // image moves to right
+	// TVP5150_TELETEXT_FIL_ENA
+	case 0xbb: return len; // super bright
+	// TVP5150_INT_CONF
+	case 0xc2: return len; // green screen
+	// TVP5150_VDP_CONF_RAM_DATA
+	case 0xc3: return len; // wobbling
+	}
+
+	// override reg values to avoid image corruption
+	 // TVP5150_VD_IN_SRC_SEL_1, required otherwise gets stuck
+	if (buf[0] == 0x00)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x32);
+	 // TVP5150_LUMA_PROC_CTL_1, makes color weird
+	if (buf[0] == 0x07)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x2f);
+	 // TVP5150_LUMA_PROC_CTL_2, makes color very weird
+	if (buf[0] == 0x08)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x7a);
+	 // TVP5150_BRIGHT_CTL, four times brighter than usual
+	if (buf[0] == 0x09)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], buf[1]>>2);
+	 // TVP5150_VERT_BLANKING_START, output very corrupted
+	if (buf[0] == 0x18)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x28);
+	 // TVP5150_VERT_BLANKING_STOP, color weird
+	if (buf[0] == 0x19)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x32);
+	 // TVP5150_INT_RESET_REG_B, crashes device if different
+	if (buf[0] == 0x1c)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x1e);
+	 // TVP5150_MACROVISION_ON_CTR, b/w + shifted to right
+	if (buf[0] == 0x2e)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x88);
+	 // TVP5150_MACROVISION_OFF_CTR, output quite corrupted
+	if (buf[0] == 0x2f)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x52);
+	 // TVP5150_INT_ENABLE_REG_A, required otherwise shows green screen
+	if (buf[0] == 0xc1)
+		return em28xx_write_reg(dev, 0x7a00 | buf[0], 0x1b);
+
+	reg = 0x7a00 | buf[0];
+	ret = em28xx_write_reg(dev, reg, buf[1]);
+	if (ret < 0) {
+		dev_warn(&dev->intf->dev,
+			 "em28281 decoder write failed at reg 0x%04x (error=%i)\n",
+			 reg, ret);
+		return ret;
+	}
+
+	return len;
+}
+
+/*
+ * em28281_integrated_recv_bytes()
+ * Read bytes from the EM28281 integrated TVP5150 decoder.
+ * Translates I2C reads to direct USB register reads at 0x7a00+reg.
+ *
+ * The register address was set by a previous 1-byte write and saved
+ * in dev->em28281_last_reg.
+ */
+static int em28281_integrated_recv_bytes(struct em28xx *dev, u16 addr,
+					 u8 *buf, u16 len)
+{
+	int ret;
+	u16 reg;
+
+	if (!is_tvp5150_addr(addr))
+		return -EOPNOTSUPP;
+	if (len < 1)
+		return -EINVAL;
+
+	reg = 0x7a00 | dev->em28281_last_reg;
+	ret = em28xx_read_reg(dev, reg);
+	if (ret < 0) {
+		dev_warn(&dev->intf->dev,
+				"em28281 decoder read failed at reg 0x%04x (error=%i)\n",
+				reg, ret);
+		return ret;
+	}
+	buf[0] = ret & 0xff;
+
+	return len;
+}
+
+static int em28281_integrated_check_for_device(struct em28xx *dev, u16 addr)
+{
+	if (!is_tvp5150_addr(addr))
+		return -EOPNOTSUPP;
+	/*
+	 * The integrated decoder is always present on EM28281 chips.
+	 * We could verify by reading a known register, but for simplicity
+	 * we trust the chip ID detection.
+	 */
+	return 0;
+}
+
 static inline int i2c_check_for_device(struct em28xx_i2c_bus *i2c_bus, u16 addr)
 {
 	struct em28xx *dev = i2c_bus->dev;
@@ -482,6 +618,8 @@ static inline int i2c_check_for_device(struct em28xx_i2c_bus *i2c_bus, u16 addr)
 		rc = em2800_i2c_check_for_device(dev, addr);
 	else if (i2c_bus->algo_type == EM28XX_I2C_ALGO_EM25XX_BUS_B)
 		rc = em25xx_bus_B_check_for_device(dev, addr);
+	else if (i2c_bus->algo_type == EM28XX_I2C_ALGO_EM28281_INTEGRATED)
+		rc = em28281_integrated_check_for_device(dev, addr);
 	return rc;
 }
 
@@ -498,6 +636,8 @@ static inline int i2c_recv_bytes(struct em28xx_i2c_bus *i2c_bus,
 		rc = em2800_i2c_recv_bytes(dev, addr, msg.buf, msg.len);
 	else if (i2c_bus->algo_type == EM28XX_I2C_ALGO_EM25XX_BUS_B)
 		rc = em25xx_bus_B_recv_bytes(dev, addr, msg.buf, msg.len);
+	else if (i2c_bus->algo_type == EM28XX_I2C_ALGO_EM28281_INTEGRATED)
+		rc = em28281_integrated_recv_bytes(dev, addr, msg.buf, msg.len);
 	return rc;
 }
 
@@ -514,6 +654,8 @@ static inline int i2c_send_bytes(struct em28xx_i2c_bus *i2c_bus,
 		rc = em2800_i2c_send_bytes(dev, addr, msg.buf, msg.len);
 	else if (i2c_bus->algo_type == EM28XX_I2C_ALGO_EM25XX_BUS_B)
 		rc = em25xx_bus_B_send_bytes(dev, addr, msg.buf, msg.len);
+	else if (i2c_bus->algo_type == EM28XX_I2C_ALGO_EM28281_INTEGRATED)
+		rc = em28281_integrated_send_bytes(dev, addr, msg.buf, msg.len);
 	return rc;
 }
 
@@ -881,7 +1023,8 @@ static u32 functionality(struct i2c_adapter *i2c_adap)
 	struct em28xx_i2c_bus *i2c_bus = i2c_adap->algo_data;
 
 	if (i2c_bus->algo_type == EM28XX_I2C_ALGO_EM28XX ||
-	    i2c_bus->algo_type == EM28XX_I2C_ALGO_EM25XX_BUS_B) {
+	    i2c_bus->algo_type == EM28XX_I2C_ALGO_EM25XX_BUS_B ||
+	    i2c_bus->algo_type == EM28XX_I2C_ALGO_EM28281_INTEGRATED) {
 		return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 	} else if (i2c_bus->algo_type == EM28XX_I2C_ALGO_EM2800)  {
 		return (I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL) &
diff --git a/drivers/media/usb/em28xx/em28xx-reg.h b/drivers/media/usb/em28xx/em28xx-reg.h
index d7c60862874a..9434c757f7a6 100644
--- a/drivers/media/usb/em28xx/em28xx-reg.h
+++ b/drivers/media/usb/em28xx/em28xx-reg.h
@@ -283,6 +283,7 @@ enum em28xx_chip_id {
 	CHIP_ID_EM2884 = 68,
 	CHIP_ID_EM28174 = 113,
 	CHIP_ID_EM28178 = 114,
+	CHIP_ID_EM28281 = 145,
 };
 
 /*
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index f3449c240d21..3b0290cbc45b 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -144,6 +144,7 @@
 #define EM2860_BOARD_MYGICA_IGRABBER              105
 #define EM2874_BOARD_HAUPPAUGE_USB_QUADHD         106
 #define EM2860_BOARD_MYGICA_UTV3                  107
+#define EM28281_BOARD_STARTECH_SVID2USB232        108
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
@@ -623,6 +624,7 @@ enum em28xx_i2c_algo_type {
 	EM28XX_I2C_ALGO_EM28XX = 0,
 	EM28XX_I2C_ALGO_EM2800,
 	EM28XX_I2C_ALGO_EM25XX_BUS_B,
+	EM28XX_I2C_ALGO_EM28281_INTEGRATED,
 };
 
 struct em28xx_i2c_bus {
@@ -683,6 +685,9 @@ struct em28xx {
 	unsigned int cur_i2c_bus;	// Current I2C bus
 	struct rt_mutex i2c_bus_lock;
 
+	/* EM28281 integrated decoder state */
+	u8 em28281_last_reg;		// Last register address for I2C reads
+
 	// video for linux
 	unsigned int ctl_input;	// selected input
 	unsigned int ctl_ainput;// selected audio input
-- 
2.52.0


