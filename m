Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043B4305B46
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314067AbhAZW4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388660AbhAZT1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:27:54 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA8EC06178A
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:47 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id 36so17353834otp.2
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xM89U+drJxd/I2ZNxhJKxATXYMJ6yGKuc2kvtT8xLHg=;
        b=SvfzBPJfGjyJFJGnteMzll+GCw1CgiWfovaq6XWEy7YxKmCtCoYQKGhhH/AC7Ne9HM
         EUy2NkT3otK4Dkt4u9FcGkG7sQlWN9MmDRSyQUbcxUIk7TqTea/Mmf5AqXLWgIANYEV9
         WUPr0RpTLLG/RNBTjYyKQNAF1eesR203ZQio/t7HlyfayRhpN0hNgYD12MD/cYROg36F
         /lMos96GLDdXIRmxpTBecwpAPE/N4Z0aYVviWAX6v1Ejlp/T05chwiIAqoXXgsc6HO3z
         bKF1751OMy6In3viL9whRuHzaul4nwdHMPOT7/0M7CQGy8GnZQL3+I8HJ720GSY3dX50
         blfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xM89U+drJxd/I2ZNxhJKxATXYMJ6yGKuc2kvtT8xLHg=;
        b=Lb9/Cs3OXjzQ5zG0DqauQPLz6oIgT9Jg0aQgZ9HH/cvo9y50Hg8fDGV2rOeRPjrZk2
         kFNAhesmWx44bmEGS2E++K4KzNFI3xFOucW5n0+pvs7+WnzR3On+gXA9OEeeVe7Gk7sJ
         CTxShM3tt//E9rFwYL5CvBfqt78/JanphnLKxc1+R5M4oOTGo4fVDlz3VX+rYLpL5exq
         cXFa2SA5LfAGy0fmPNuS6/0I1/KEvZ1qwPvMLx4ExIYhUoO6NpG1N5FAAxfC05zk0Cj7
         Ew17+1jUuDmHThlKuVTe8Td/av0KcHq9c81iNsinOdJq8k8R8lLHFbHXWN82whcPYV8Q
         +cdg==
X-Gm-Message-State: AOAM53199CByypnpZz/vT+c64LGlWz2k+QxFtcs/Ba5eMrTvMh+YK82E
        YmiKvW1hcHFoOxq2NmSFu7QJmJhvvUAr3cQQ
X-Google-Smtp-Source: ABdhPJzu+fKyYhsO6+m2Uowz74cy6P0UlbwzafgPVXu2glbr6wDXNU8Hvp4GoQImYFdFZd57yqum8w==
X-Received: by 2002:a9d:6393:: with SMTP id w19mr4982527otk.204.1611689206254;
        Tue, 26 Jan 2021 11:26:46 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id j8sm4315369oie.47.2021.01.26.11.26.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jan 2021 11:26:45 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 4/4] em28xx: Add support for Hauppauge USB QuadHD
Date:   Mon, 25 Jan 2021 19:54:16 -0600
Message-Id: <20210126015416.5622-5-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126015416.5622-1-brad@nextdimension.cc>
References: <20200612183937.10952-1-3126054018@nextdimension.cc>
 <20210126015416.5622-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hauppauge USB QuadHD contains two two-tuner em28xx
devices behind a usb hub. Each of the four dvb adapters
contains a MaxLinear 692 combo ATSC demod/tuner.

Bus 003 Device 006: ID 2040:846d Hauppauge
Bus 003 Device 005: ID 2040:846d Hauppauge
Bus 003 Device 004: ID 04e2:0404 Exar Corp.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v1:
- Bump board number

 drivers/media/usb/em28xx/Kconfig        |  1 +
 drivers/media/usb/em28xx/em28xx-cards.c | 46 +++++++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx-dvb.c   | 26 ++++++++++++++
 drivers/media/usb/em28xx/em28xx.h       |  1 +
 4 files changed, 74 insertions(+)

diff --git a/drivers/media/usb/em28xx/Kconfig b/drivers/media/usb/em28xx/Kconfig
index f2031a933e54..2237eb73f010 100644
--- a/drivers/media/usb/em28xx/Kconfig
+++ b/drivers/media/usb/em28xx/Kconfig
@@ -67,6 +67,7 @@ config VIDEO_EM28XX_DVB
 	select MEDIA_TUNER_XC2028 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MT2060 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_MXL692 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  This adds support for DVB cards based on the
 	  Empiatech em28xx chips.
diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 5144888ae36f..d6c8ae213914 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -549,6 +549,21 @@ static const struct em28xx_reg_seq hauppauge_dualhd_dvb[] = {
 	{-1,                             -1,   -1,     -1},
 };
 
+/* Hauppauge USB QuadHD */
+static struct em28xx_reg_seq hauppauge_usb_quadhd_atsc_reg_seq[] = {
+	{EM2874_R80_GPIO_P0_CTRL,      0xff, 0xff,      0},
+	{0x0d,                         0xff, 0xff,    200},
+	{0x50,                         0x04, 0xff,    300},
+	{EM2874_R80_GPIO_P0_CTRL,      0xb0, 0xf0,    100}, /* demod 1 reset */
+	{EM2874_R80_GPIO_P0_CTRL,      0xf0, 0xf0,    100},
+	{EM2874_R80_GPIO_P0_CTRL,      0xd0, 0xf0,    100}, /* demod 2 reset */
+	{EM2874_R80_GPIO_P0_CTRL,      0xf0, 0xf0,    100},
+	{EM2874_R5F_TS_ENABLE,         0x44, 0xff,     50},
+	{EM2874_R5D_TS1_PKT_SIZE,      0x05, 0xff,     50},
+	{EM2874_R5E_TS2_PKT_SIZE,      0x05, 0xff,     50},
+	{-1,                           -1,   -1,       -1},
+};
+
 /*
  *  Button definitions
  */
@@ -644,6 +659,22 @@ static struct em28xx_led hauppauge_dualhd_leds[] = {
 	{-1, 0, 0, 0},
 };
 
+static struct em28xx_led hauppauge_usb_quadhd_leds[] = {
+	{
+		.role      = EM28XX_LED_DIGITAL_CAPTURING,
+		.gpio_reg  = EM2874_R80_GPIO_P0_CTRL,
+		.gpio_mask = EM_GPIO_2,
+		.inverted  = 1,
+	},
+	{
+		.role      = EM28XX_LED_DIGITAL_CAPTURING_TS2,
+		.gpio_reg  = EM2874_R80_GPIO_P0_CTRL,
+		.gpio_mask = EM_GPIO_0,
+		.inverted  = 1,
+	},
+	{-1, 0, 0, 0},
+};
+
 /*
  *  Board definitions
  */
@@ -2539,6 +2570,19 @@ const struct em28xx_board em28xx_boards[] = {
 			.amux     = EM28XX_AMUX_LINE_IN,
 		} },
 	},
+	/* 2040:826d Hauppauge USB QuadHD
+	 * Empia 28274, Max Linear 692 ATSC combo demod/tuner
+	 */
+	[EM2874_BOARD_HAUPPAUGE_USB_QUADHD] = {
+		.name          = "Hauppauge USB QuadHD ATSC",
+		.def_i2c_bus   = 1,
+		.has_dual_ts   = 1,
+		.has_dvb       = 1,
+		.i2c_speed     = EM28XX_I2C_CLK_WAIT_ENABLE | EM28XX_I2C_FREQ_100_KHZ,
+		.tuner_type    = TUNER_ABSENT,
+		.tuner_gpio    = hauppauge_usb_quadhd_atsc_reg_seq,
+		.leds          = hauppauge_usb_quadhd_leds,
+	},
 };
 EXPORT_SYMBOL_GPL(em28xx_boards);
 
@@ -2672,6 +2716,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
 	{ USB_DEVICE(0x2040, 0x826d),
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x846d),
+			.driver_info = EM2874_BOARD_HAUPPAUGE_USB_QUADHD },
 	{ USB_DEVICE(0x0438, 0xb002),
 			.driver_info = EM2880_BOARD_AMD_ATI_TV_WONDER_HD_600 },
 	{ USB_DEVICE(0x2001, 0xf112),
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index fb9cbfa81a84..526424279637 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -62,6 +62,7 @@
 #include "si2157.h"
 #include "tc90522.h"
 #include "qm1d1c0042.h"
+#include "mxl692.h"
 
 MODULE_AUTHOR("Mauro Carvalho Chehab <mchehab@kernel.org>");
 MODULE_LICENSE("GPL v2");
@@ -1459,6 +1460,26 @@ static int em28174_dvb_init_hauppauge_wintv_dualhd_01595(struct em28xx *dev)
 	return 0;
 }
 
+static int em2874_dvb_init_hauppauge_usb_quadhd(struct em28xx *dev)
+{
+	struct em28xx_dvb *dvb = dev->dvb;
+	struct mxl692_config mxl692_config = {};
+	unsigned char addr;
+
+	/* attach demod/tuner combo */
+	mxl692_config.id = (dev->ts == PRIMARY_TS) ? 0 : 1;
+	mxl692_config.fe = &dvb->fe[0];
+	addr = (dev->ts == PRIMARY_TS) ? 0x60 : 0x63;
+
+	dvb->i2c_client_demod = dvb_module_probe("mxl692", NULL,
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 addr, &mxl692_config);
+	if (!dvb->i2c_client_demod)
+		return -ENODEV;
+
+	return 0;
+}
+
 static int em28xx_dvb_init(struct em28xx *dev)
 {
 	int result = 0, dvb_alt = 0;
@@ -1945,6 +1966,11 @@ static int em28xx_dvb_init(struct em28xx *dev)
 		if (result)
 			goto out_free;
 		break;
+	case EM2874_BOARD_HAUPPAUGE_USB_QUADHD:
+		result = em2874_dvb_init_hauppauge_usb_quadhd(dev);
+		if (result)
+			goto out_free;
+		break;
 	default:
 		dev_err(&dev->intf->dev,
 			"The frontend of your DVB/ATSC card isn't supported yet\n");
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 55a46faaf7b7..6648e11f1271 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -152,6 +152,7 @@
 #define EM2861_BOARD_MAGIX_VIDEOWANDLER2          103
 #define EM28178_BOARD_PCTV_461E_V2                104
 #define EM2860_BOARD_MYGICA_IGRABBER              105
+#define EM2874_BOARD_HAUPPAUGE_USB_QUADHD         106
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
-- 
2.28.0

