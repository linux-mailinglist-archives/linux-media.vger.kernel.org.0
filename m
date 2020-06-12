Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCBE1F7D03
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 20:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgFLSj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 14:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgFLSj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 14:39:56 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489C5C08C5C2
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:39:56 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id v13so8110894otp.4
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nk5Dx/0KATg0GdIpF3QH+wEOX8U2cdSx8epIwilvjLY=;
        b=bAIfSHlJ6bGU+/1oNqYIqqRlpqHFzD1h/+txeufqixeZgPUSa7mE0rvsWNPrePg1CV
         QSd6g1yWeQn4qLcvqHXH9NSAmjQ3sMzLEw5fMrnQussFdkLp3MZm9zFlptEpleMtgy/X
         iX18DaedqchMe75bxF5EzOrVv1RyQOH7A67HT3avMzj44ojiMzXlw9ttsMYQwQpzGP6C
         QTKZqgolimLtDRParBXKoJktmGpq72eWzHJ551UoLfCMQVYfl7Ww6yA2bDERIIgz9h7C
         5re68Km5MqhWUq8BYHeV3b4L6mTQWhIPNmMaFP/MBVsXkg7EbSb06oozswE+fzE/kAIN
         wOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nk5Dx/0KATg0GdIpF3QH+wEOX8U2cdSx8epIwilvjLY=;
        b=PmkAbmT0t6+o3s1pviaPF12MXMKmeEnZqjDi4NvG+J/NQCKswP7NrsgSRVwFiWdirY
         NBWmIDg9bFeYlC95pxZlZo1rjT8yON5z+yWvJa10MI6lF2duUm8VcQg+yLBqpOb7qwqA
         2lA9R9pkzwf185A/Demk6NMaE4vUdEs+Gbjr5BdQH/6qVFIJLsqOCrfQGMpuBMm0jDFp
         yu00idVjlliDIkOIXxM+ZWSoXIOQMZYLgd1JC7NANYHrotXnmLgZ+ZTGdcpJkDGBmKYr
         0Y/YgWyQlbjMGlLJ4NgXxj1TEGuL/8WPvVl7/+LzYU8UQjYZfMBp6NhY4yvY4LpC2URU
         qWjw==
X-Gm-Message-State: AOAM532YGmSmLgWuzn3KUCHPkAkJLBgbGcZdPWL3ONud42cItqIYTcLU
        bqvEc8XBDXSAatM/HJIfi83VIeGF4z3n7w==
X-Google-Smtp-Source: ABdhPJzOFnM77DSjlukiJv2vKbZKq5oNrL2irJk9MW3urYJP/kE9dQOWOlN/8zeWzlPDGTlH5lbxzA==
X-Received: by 2002:a05:6830:12c1:: with SMTP id a1mr11697510otq.123.1591987195298;
        Fri, 12 Jun 2020 11:39:55 -0700 (PDT)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id t11sm1508633otr.65.2020.06.12.11.39.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:39:54 -0700 (PDT)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 3/3] em28xx: Add support for Hauppauge USB QuadHD
Date:   Fri, 12 Jun 2020 13:39:37 -0500
Message-Id: <20200612183937.10952-4-3126054018@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200612183937.10952-1-3126054018@nextdimension.cc>
References: <20200612183937.10952-1-3126054018@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hauppauge USB QuadHD contains two two-tuner em28xx devices behind a usb hub.
Each of the four dvb adapters contains a MaxLinear 692 combo ATSC demod/tuner.

Bus 003 Device 006: ID 2040:846d Hauppauge
Bus 003 Device 005: ID 2040:846d Hauppauge


Signed-off-by: Brad Love <brad@nextdimension.cc>
---
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
index a8c321d11827..d9d53056cfd9 100644
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
@@ -2519,6 +2550,19 @@ const struct em28xx_board em28xx_boards[] = {
 			.amux     = EM28XX_AMUX_LINE_IN,
 		} },
 	},
+	/* 2040:846d Hauppauge USB QuadHD
+	 * Empia 28274, Max Linear 692 ATSC combo demod/tuner
+	 */
+	[EM2874S_BOARD_HAUPPAUGE_USB_QUADHD] = {
+		.name        = "Hauppauge USB QuadHD ATSC",
+		.def_i2c_bus = 1,
+		.has_dual_ts = 1,
+		.has_dvb     = 1,
+		.i2c_speed   = EM28XX_I2C_CLK_WAIT_ENABLE | EM28XX_I2C_FREQ_100_KHZ,
+		.tuner_type  = TUNER_ABSENT,
+		.tuner_gpio  = hauppauge_usb_quadhd_atsc_reg_seq,
+		.leds        = hauppauge_usb_quadhd_leds,
+	},
 };
 EXPORT_SYMBOL_GPL(em28xx_boards);
 
@@ -2652,6 +2696,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
 	{ USB_DEVICE(0x2040, 0x826d),
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x846d),
+			.driver_info = EM2874S_BOARD_HAUPPAUGE_USB_QUADHD },
 	{ USB_DEVICE(0x0438, 0xb002),
 			.driver_info = EM2880_BOARD_AMD_ATI_TV_WONDER_HD_600 },
 	{ USB_DEVICE(0x2001, 0xf112),
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index fb9cbfa81a84..3b6aaf810466 100644
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
 
+static int em2874S_dvb_init_hauppauge_usb_quadhd(struct em28xx *dev)
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
+	case EM2874S_BOARD_HAUPPAUGE_USB_QUADHD:
+		result = em2874S_dvb_init_hauppauge_usb_quadhd(dev);
+		if (result)
+			goto out_free;
+		break;
 	default:
 		dev_err(&dev->intf->dev,
 			"The frontend of your DVB/ATSC card isn't supported yet\n");
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index acbb62397314..1782bfaf0093 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -151,6 +151,7 @@
 #define EM2882_BOARD_ZOLID_HYBRID_TV_STICK		102
 #define EM2861_BOARD_MAGIX_VIDEOWANDLER2          103
 #define EM28178_BOARD_PCTV_461E_V2                104
+#define EM2874S_BOARD_HAUPPAUGE_USB_QUADHD        105
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
-- 
2.23.0

