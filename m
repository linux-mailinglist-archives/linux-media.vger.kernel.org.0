Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 980F5E6A31
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 00:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfJ0XTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Oct 2019 19:19:39 -0400
Received: from mout.gmx.net ([212.227.15.15]:43013 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727148AbfJ0XTi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Oct 2019 19:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1572218376;
        bh=sgLT8b+BYaDDru+nsoIBSVVF13rGtJZYnpDQ87IFAj4=;
        h=X-UI-Sender-Class:Date:From:Reply-To:To:Subject;
        b=datgfr42q7ldCx7wTi9khdo4fpIhSX34JXf32NEO7UmgCPh2JveddBwZofoqzHSnX
         F5BadQA10fxcvvZrgMU4mOP3HCVQH29U5pt5NEAMpI+hNVSDHbMKmi1ERGem1RlIdd
         XVbkSVoB2vuXXhHnDkuiwHIsjUOmrl1DsJK+yiW0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.23] ([188.103.232.62]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Kr-1iKCzb0igt-005IKy for
 <linux-media@vger.kernel.org>; Mon, 28 Oct 2019 00:19:36 +0100
Message-ID: <5DB62609.3050404@gmx.de>
Date:   Mon, 28 Oct 2019 00:19:37 +0100
From:   Thomas Pantzer <Thomas.Pantzer@gmx.de>
Reply-To:  Thomas.Pantzer@gmx.de
User-Agent: Mozilla Thunderbird 1.0.2 (X11/20060804)
X-Accept-Language: de-DE, de, en-us, en
MIME-Version: 1.0
To:     linux-media@vger.kernel.org
Subject: Support for Terratech Grabster MX150/250 and ADStech XPress USBAV-192
Content-Type: multipart/mixed;
 boundary="------------020004080002060708070809"
X-Provags-ID: V03:K1:ronBenxVIA0P67lP4wrI7RaecJYcwQErUW3Q1hfHEJ9Lf4trgOF
 6mNCD2RZKjh/D6epgM1sJprpxFPM3weQfH1khs9kLj1pqizz58vaZ+Ubafp+4tUoI07d2hK
 +xJWkHGAxmgihpNYydG7tdKo1XWS8/UCoXWdpXGRnEbvs0J9r3z/i8TdKfQ1/7OjO1J3z0i
 yxCxs1p67D3XmZunVShYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vFPaKwRbAtQ=:MkX2LGN161PhhM9lSwtkP8
 Q1YiWsfIxV3Bq/IBW7Qa2inc9Uy0XeI4F8dlYnT4Dk+5vA9NE4RVYYL2jKzhY+CuG2hd1ZVS7
 1/dP/Y143D0fDCBvz5i/d2OYXFIiZsavx5NN4EZRTDr/ry9VHWLUCmtUWaKxtIMdwM7oH8Ul/
 CCeAGvC8HChSsbNpp037otT1S4b8p3pyzdFR/+HJ8NKbd68ZE/TzQyoKy8KEQLXxAWRXGfHxn
 eYDZpJh87j88/kQ8VSZThwBmm2GyI9yP1LnptCwNZtttj5lwUpOLqNxX3z2LFdqWUwulLLMM3
 noHL/by0jVaKqQtYuQgDZxg5AvcdMQXHEI3tNG9rmhzC3TgXD4oYvfVSfidd9CQdIH4K86Kbz
 c3vfpIcaWoopB4kw1NWVw51bdWyNsI471w1v0pwCh0TBLA136RjdFeH2D0xUssx2WkWTAJp+3
 +tk146YcfhmPb62icdz8cz1A/D5eD2pr7RJKjIBZVIKXA/hp+X6f1faq3udxifKLMmpd5Zjrm
 jj+y9tJyt6kvgMa3PMQ2mzqJovPjst57m1yAqFPE1/2B6L0LoiZQp0AId0YTSKysMxpe2ew7W
 cIaSl9uKPZkcCm24u4sz4nLpCf2vd6a/xJ/+FmxULGLUZJnp/N2S0xwc7friCM1vVTwllwlvm
 kdmXdnictgXJ2YaT+h0jmamKf99C78p+5dwaa0HlMQ/T7jIVeH7t4LUByyGRUJ7d2Ai8w0xtY
 DRRKreOij0BV5AHb1lRNSHAuL8Vv+yCsqR3NInYV82HWK5eybDwXjC/zROCa2zz7dV7T/jM6K
 NlPFPvxNWaXrufiG+LGN3WXIy+72zQ0YcxlPdYxSdu+jVufL7D634m5BPDIPb6oOPPuOgV72O
 n3w2WTRuh/x/UwqXC9+JVGCFdT4yFrohw6wTYUo7ty+wPP4/euRhCDJx3wbgq7IU8EU+PFvX0
 f4BoJ0lMBVEH68BDm6M4vG7ZkcVEcmdtTfSnIbX6W3c6dwwxZ9Ox3daOaTX3+FjMLJKq4Fg8J
 8693u4nxpLVyXMxR4MN6wK8iBu0NchMuVJ2BnW9WCx/tWMNaICh0N/RbfZ/VL29pGUTzzd+fj
 V1RSBO8vCPTX/vXaM62HV2quoFrKKp26qCV1Q1hIb1Srwv0Y1ainLitRaUXQdR1SxuuSPNX8S
 b/oZyqxl7SaAvGjgS6jAIDfJKse0kyOmjhjHMUw22hwLCPZ8vz8t0bbEkwzUHf9+6M0jDJP/n
 FjM6GGwPrxXCojaHjb06fQKPSsY6UWcFklqaOgk5ZyUFCM6EVbBskWuq5hIM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------020004080002060708070809
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

- Adds support for USB analog video/audio capture devices
    - Terratec Grabster AV 150/250 MX 	USB-ID (0ccd:0079)
    - ADS Tech Instant Video XPress USBAV-192  USB-ID (06e1:a192)

- Bugfix: constant TM6000_MAXBOARDS off by one,
	 Grabster was never enumerated

Signed-off-by: Thomas Pantzer <kernel-org@pantzer.net>
---
 drivers/media/usb/tm6000/tm6000-cards.c | 79
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 21 deletions(-)

--------------020004080002060708070809
Content-Type: text/plain;
 name="tm6000-cards.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tm6000-cards.diff"

diff -bBduwp linux-3.18.16/drivers/media/usb/tm6000/tm6000-cards.c-vanilla linux/drivers/media/usb/tm6000/tm6000-cards.c
--- linux-3.18.16/drivers/media/usb/tm6000/tm6000-cards.c-vanilla	2015-06-19 18:42:40.000000000 +0200
+++ linux/drivers/media/usb/tm6000/tm6000-cards.c	2019-10-28 00:01:45.000000000 +0100
@@ -52,13 +52,16 @@
 #define TM6010_BOARD_BEHOLD_WANDER_LITE		14
 #define TM6010_BOARD_BEHOLD_VOYAGER_LITE	15
 #define TM5600_BOARD_TERRATEC_GRABSTER		16
+#define TM5600_BOARD_ADSTECH_XPRESS_USBAV_192   17
+

 #define is_generic(model) ((model == TM6000_BOARD_UNKNOWN) || \
 			   (model == TM5600_BOARD_GENERIC) || \
 			   (model == TM6000_BOARD_GENERIC) || \
 			   (model == TM6010_BOARD_GENERIC))

-#define TM6000_MAXBOARDS        16
+#define TM6000_MAXBOARDS        18
+
 static unsigned int card[]     = {[0 ... (TM6000_MAXBOARDS - 1)] = UNSET };

 module_param_array(card,  int, NULL, 0444);
@@ -500,25 +503,6 @@ static struct tm6000_board tm6000_boards
 			.amux = TM6000_AMUX_SIF1,
 		},
 	},
-	[TM5600_BOARD_TERRATEC_GRABSTER] = {
-		.name         = "Terratec Grabster AV 150/250 MX",
-		.type         = TM5600,
-		.tuner_type   = TUNER_ABSENT,
-		.vinput = { {
-			.type	= TM6000_INPUT_TV,
-			.vmux	= TM6000_VMUX_VIDEO_B,
-			.amux	= TM6000_AMUX_ADC1,
-			}, {
-			.type	= TM6000_INPUT_COMPOSITE1,
-			.vmux	= TM6000_VMUX_VIDEO_A,
-			.amux	= TM6000_AMUX_ADC2,
-			}, {
-			.type	= TM6000_INPUT_SVIDEO,
-			.vmux	= TM6000_VMUX_VIDEO_AB,
-			.amux	= TM6000_AMUX_ADC2,
-			},
-		},
-	},
 	[TM6010_BOARD_TWINHAN_TU501] = {
 		.name         = "Twinhan TU501(704D1)",
 		.tuner_type   = TUNER_XC2028, /* has a XC3028 */
@@ -614,6 +598,58 @@ static struct tm6000_board tm6000_boards
 			.amux	= TM6000_AMUX_ADC1,
 		},
 	},
+	[TM5600_BOARD_TERRATEC_GRABSTER] = {
+		.name         = "Terratec Grabster AV 150/250 MX",
+		.type         = TM5600,
+		.tuner_type   = TUNER_ABSENT,
+		.gpio = {
+			.tuner_reset    = TM6000_GPIO_1,
+			/* this GPIO configuration needs to be here due to a
+			bug elsewhere, if it is missing the driver fails to
+			load, if TUNER_ABSENT or has_tuner==0 is stated, the
+			tuner-reset configuration should be ignored */
+		},
+		.caps = {
+			.has_tuner = 0,
+			.has_eeprom = 0,
+		},
+		.vinput = { {
+			.type   = TM6000_INPUT_SVIDEO,
+			.vmux   = TM6000_VMUX_VIDEO_A,
+			.amux   = TM6000_AMUX_ADC1,
+			}, {
+			.type   = TM6000_INPUT_COMPOSITE1,
+			.vmux   = TM6000_VMUX_VIDEO_B,
+			.amux   = TM6000_AMUX_ADC2,
+			},
+		},
+	},
+	[TM5600_BOARD_ADSTECH_XPRESS_USBAV_192] = {
+		.name         = "ADStech XPress USBAV-192",
+		.type         = TM5600,
+		.tuner_type   = TUNER_ABSENT,
+		.caps = {
+			.has_eeprom	= 1,
+			.has_tuner	= 0,
+		},
+		.gpio = {
+			.tuner_reset	= TM6000_GPIO_1,
+			/* this GPIO configuration needs to be here due to a
+			bug elsewhere, if it is missing the driver fails to
+			load, if TUNER_ABSENT or has_tuner==0 is stated, the
+			tuner-reset configuration should be ignored */
+		},
+		.vinput = { {
+			.type	= TM6000_INPUT_SVIDEO,
+			.vmux	= TM6000_VMUX_VIDEO_A,
+			.amux	= TM6000_AMUX_ADC1,
+			}, {
+			.type	= TM6000_INPUT_COMPOSITE1,
+			.vmux	= TM6000_VMUX_VIDEO_B,
+			.amux	= TM6000_AMUX_ADC2,
+			},
+		},
+	},
 };

 /* table of devices that work with this driver */
@@ -631,13 +667,14 @@ static struct usb_device_id tm6000_id_ta
 	{ USB_DEVICE(0x6000, 0xdec1), .driver_info = TM6010_BOARD_BEHOLD_VOYAGER },
 	{ USB_DEVICE(0x0ccd, 0x0086), .driver_info = TM6010_BOARD_TERRATEC_CINERGY_HYBRID_XE },
 	{ USB_DEVICE(0x0ccd, 0x00A5), .driver_info = TM6010_BOARD_TERRATEC_CINERGY_HYBRID_XE },
-	{ USB_DEVICE(0x0ccd, 0x0079), .driver_info = TM5600_BOARD_TERRATEC_GRABSTER },
 	{ USB_DEVICE(0x13d3, 0x3240), .driver_info = TM6010_BOARD_TWINHAN_TU501 },
 	{ USB_DEVICE(0x13d3, 0x3241), .driver_info = TM6010_BOARD_TWINHAN_TU501 },
 	{ USB_DEVICE(0x13d3, 0x3243), .driver_info = TM6010_BOARD_TWINHAN_TU501 },
 	{ USB_DEVICE(0x13d3, 0x3264), .driver_info = TM6010_BOARD_TWINHAN_TU501 },
 	{ USB_DEVICE(0x6000, 0xdec2), .driver_info = TM6010_BOARD_BEHOLD_WANDER_LITE },
 	{ USB_DEVICE(0x6000, 0xdec3), .driver_info = TM6010_BOARD_BEHOLD_VOYAGER_LITE },
+	{ USB_DEVICE(0x0ccd, 0x0079), .driver_info = TM5600_BOARD_TERRATEC_GRABSTER },
+	{ USB_DEVICE(0x06e1, 0xa192), .driver_info = TM5600_BOARD_ADSTECH_XPRESS_USBAV_192 },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, tm6000_id_table);

--------------020004080002060708070809--
