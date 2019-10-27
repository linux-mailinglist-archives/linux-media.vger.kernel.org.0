Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3710E6490
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2019 18:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfJ0Rj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Oct 2019 13:39:29 -0400
Received: from mout.gmx.net ([212.227.15.18]:50723 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726930AbfJ0Rj3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Oct 2019 13:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1572197967;
        bh=SWv80OehDTakwBad9WDVcMLfXvrw1gasPz0xIR+HS4g=;
        h=X-UI-Sender-Class:Date:From:Reply-To:To:Subject;
        b=Ok0hbmvoN9orcHybvlQgG1Lmwcpewx6v8XedekHEkWQIosNNzD/6ULexWw1h42AkH
         B5oStEt24Uja/ea8sRrMI2Rwja9THXc8hY6e7Uj6oaPEW7K6PnQTXiU0YBoksr8+y7
         QnXCCqZqh2iSkZTsBWSgZYXFq/86yibEC/rZcgGY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.23] ([188.103.232.62]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxUnz-1i4Uhr3rCr-00xrVg for
 <linux-media@vger.kernel.org>; Sun, 27 Oct 2019 18:39:27 +0100
Message-ID: <5DB5D649.7060709@gmx.de>
Date:   Sun, 27 Oct 2019 18:39:21 +0100
From:   Thomas Pantzer <Thomas.Pantzer@gmx.de>
Reply-To:  Thomas.Pantzer@gmx.de
User-Agent: Mozilla Thunderbird 1.0.2 (X11/20060804)
X-Accept-Language: de-DE, de, en-us, en
MIME-Version: 1.0
To:     linux-media@vger.kernel.org
Subject: Support for Terratech Grabster MX150/250 and ADStech XPress USBAV-192
Content-Type: multipart/mixed;
 boundary="------------060908090502060800090705"
X-Provags-ID: V03:K1:s+6XjFO8Hz5S3nu96DQA7Msot3LmSBcm8n4Rx2M+JGhboM7P4M2
 rAF2VEwt937rjRVSY8ezduBn6selm8QYituGptcu/yEjuCrbMm2WPToy6wFgcHkbjNOXz57
 YJWeCCbP1MXpRIb3v/eq8iPpbTyjWZ9wahb2ybFE2Yc38D+Np334DtIxQX1Zd5JdS70xzR7
 uCyoZBBCpRLMWe0gj7FrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FvhLmPGeSr0=:BOPTSLmhNu5KpNCcj1LSt5
 hOH4ZSxRtvmEquzFyt7dGXKUPxgCYoNk2fI7UGrAc2ov3yzvUJy4Wm5Typ3wv6dUWBCRCnKj3
 FSCLcHrWstjfZ+Ap/ML8Di8c7XEjb1k8aSBrTag40oCEtjAt4eiY4BhY+pftSBYxtw61VG5PI
 t2gL2J2WN5ldjHAn0Z/GCK19zna6paJjTc5reuzDJFpiDSbhGVaveSHYAu0dxDXoRwAbRmGyG
 ppIVRaD/VAf4lWONJYwB7smyGe2z3HeAL/JqI0mFIPw56xRRg2hVdTe9Mia1fdvXXKhYrYF1+
 Bv6U+F73U+4WAgyRuVg1VO+W/UDYOmFwmQj7DVkTCeuNEQEndegGpOpGXlgCNkppbCijMKL65
 S7M8/vHI9rhpm3gza5nFUmBsNr8sohx42XMS1VG2LDTTvpNOjIuT11eLyTRA9UUsnRY4oml5V
 08udCXydQ9XYqAmxfMUsUsH5SkHmb6R3dofW+ztqq4u5SpJXEjsQDKdbhrv+mNY029IvO4bHX
 NKHRP/wz245BvUaarOpAr5EYE4AAH/jR5FI7MdqXKbXGPPhlzKWprq9CocUtEX8YjCx6rSfyl
 hU9y8CyrGu/24FFpsnihTcl5fmqAdK7sVpZn426Tg661WttGQdG3b2KE5hsmkveRCWdHgNvd7
 r6SFV7Rx9M9n9WNBuIjOz+avxq4Ag9PzJmgbYLw7i8ADZNwrYzoiljKPqaJURfdSKt1E++NM2
 BuE7/KIIT14O7OXyos4Q4+5qAu6bxCykz/IpStun5AwVGSqn57109M3HMJO5B5gY6XT4qLjX3
 i21hr0zRz8hNDsn8a2ZJiOOwGAfIfKEJ/yBrRJbpMuSNUPDSQBFH/h/V+LqiAr9XNCg3hkeOA
 G9NFlS/C4LnybGqtDjb1RGZaMpWevHNsAB6P8Ugxjr1YL6KRTBAU0HkSNiIzohCGW56gEeszd
 XDDFRIo2+AtWXrbud3ZO8zj2jfDX8RSBAgMp+4Gvt7u+Om6NMitLI3RsWEhi7vd6XRxs5bciv
 Q+ja5aAUTIH2EPxGc6ebbf5AtavFlmgB2zztf4p+6+t7QAZrmoLOybGBDT5CMeHOhfGQa2vl5
 Wex6h6dCDASMjDS5MxR2TpFAKUMwepSc0itnQNv1nwURIExZMhu07CKGV4KQQ5BGeal36F2qs
 ZzPdU/nS8UbbLZ74TBbnh/GdKSNgoN2lpH/BYNnrKQx8OhLW77QKAGAHxqOBxRncN+usPcR2C
 t4zsyQEcReuLLtw35zpmqDm0gj65X9GbZ334AtlJR0tRF3crklfqu6pQ9CFA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------060908090502060800090705
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit


--------------060908090502060800090705
Content-Type: text/plain;
 name="tm5600-patch.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="tm5600-patch.diff"

=2D-- linux-3.18.16/drivers/media/usb/tm6000/tm6000-cards.c-orig	2015-06-1=
9 18:42:40.000000000 +0200
+++ linux/drivers/media/usb/tm6000/tm6000-cards.c	2019-10-22 18:23:21.0000=
00000 +0200
@@ -52,13 +52,16 @@
 #define TM6010_BOARD_BEHOLD_WANDER_LITE		14
 #define TM6010_BOARD_BEHOLD_VOYAGER_LITE	15
 #define TM5600_BOARD_TERRATEC_GRABSTER		16
+#define TM5600_BOARD_ADSTECH_XPRESS_USBAV_192   17
+

 #define is_generic(model) ((model =3D=3D TM6000_BOARD_UNKNOWN) || \
 			   (model =3D=3D TM5600_BOARD_GENERIC) || \
 			   (model =3D=3D TM6000_BOARD_GENERIC) || \
 			   (model =3D=3D TM6010_BOARD_GENERIC))

-#define TM6000_MAXBOARDS        16
+#define TM6000_MAXBOARDS        18
+
 static unsigned int card[]     =3D {[0 ... (TM6000_MAXBOARDS - 1)] =3D UN=
SET };

 module_param_array(card,  int, NULL, 0444);
@@ -500,25 +503,6 @@
 			.amux =3D TM6000_AMUX_SIF1,
 		},
 	},
-	[TM5600_BOARD_TERRATEC_GRABSTER] =3D {
-		.name         =3D "Terratec Grabster AV 150/250 MX",
-		.type         =3D TM5600,
-		.tuner_type   =3D TUNER_ABSENT,
-		.vinput =3D { {
-			.type	=3D TM6000_INPUT_TV,
-			.vmux	=3D TM6000_VMUX_VIDEO_B,
-			.amux	=3D TM6000_AMUX_ADC1,
-			}, {
-			.type	=3D TM6000_INPUT_COMPOSITE1,
-			.vmux	=3D TM6000_VMUX_VIDEO_A,
-			.amux	=3D TM6000_AMUX_ADC2,
-			}, {
-			.type	=3D TM6000_INPUT_SVIDEO,
-			.vmux	=3D TM6000_VMUX_VIDEO_AB,
-			.amux	=3D TM6000_AMUX_ADC2,
-			},
-		},
-	},
 	[TM6010_BOARD_TWINHAN_TU501] =3D {
 		.name         =3D "Twinhan TU501(704D1)",
 		.tuner_type   =3D TUNER_XC2028, /* has a XC3028 */
@@ -614,6 +598,50 @@
 			.amux	=3D TM6000_AMUX_ADC1,
 		},
 	},
+	[TM5600_BOARD_TERRATEC_GRABSTER] =3D {
+		.name         =3D "Terratec Grabster AV 150/250 MX",
+		.type         =3D TM5600,
+		.tuner_type   =3D TUNER_ABSENT,
+		.gpio =3D {
+			.tuner_reset    =3D TM6000_GPIO_1,	/* this GPIO is a fake, there is no=
 tuner but we have to have a reset configuration */
+		},
+		.caps =3D {
+			.has_tuner =3D 0,
+			.has_eeprom =3D 0,
+		},
+		.vinput =3D { {
+			.type   =3D TM6000_INPUT_SVIDEO,
+			.vmux   =3D TM6000_VMUX_VIDEO_A,
+			.amux   =3D TM6000_AMUX_ADC1,
+			},{
+			.type   =3D TM6000_INPUT_COMPOSITE1,
+			.vmux   =3D TM6000_VMUX_VIDEO_B,
+			.amux   =3D TM6000_AMUX_ADC2,
+			},
+		},
+	},
+	[TM5600_BOARD_ADSTECH_XPRESS_USBAV_192] =3D {
+		.name         =3D "ADStech XPress USBAV-192",
+		.type         =3D TM5600,
+		.tuner_type   =3D TUNER_ABSENT,
+		.caps =3D {
+			.has_eeprom	=3D 1,
+			.has_tuner	=3D 0,
+		},
+		.gpio =3D {
+			.tuner_reset	=3D TM6000_GPIO_1,	/* fake, we dont know what this gpio a=
ctually does, but we need a handle for the tuner reset stub */
+		},
+		.vinput =3D { {
+			.type	=3D TM6000_INPUT_SVIDEO,
+			.vmux	=3D TM6000_VMUX_VIDEO_A,
+			.amux	=3D TM6000_AMUX_ADC1,
+			}, {
+			.type	=3D TM6000_INPUT_COMPOSITE1,
+			.vmux	=3D TM6000_VMUX_VIDEO_B,
+			.amux	=3D TM6000_AMUX_ADC2,
+			},
+		},
+	},
 };

 /* table of devices that work with this driver */
@@ -631,13 +659,14 @@
 	{ USB_DEVICE(0x6000, 0xdec1), .driver_info =3D TM6010_BOARD_BEHOLD_VOYAG=
ER },
 	{ USB_DEVICE(0x0ccd, 0x0086), .driver_info =3D TM6010_BOARD_TERRATEC_CIN=
ERGY_HYBRID_XE },
 	{ USB_DEVICE(0x0ccd, 0x00A5), .driver_info =3D TM6010_BOARD_TERRATEC_CIN=
ERGY_HYBRID_XE },
-	{ USB_DEVICE(0x0ccd, 0x0079), .driver_info =3D TM5600_BOARD_TERRATEC_GRA=
BSTER },
 	{ USB_DEVICE(0x13d3, 0x3240), .driver_info =3D TM6010_BOARD_TWINHAN_TU50=
1 },
 	{ USB_DEVICE(0x13d3, 0x3241), .driver_info =3D TM6010_BOARD_TWINHAN_TU50=
1 },
 	{ USB_DEVICE(0x13d3, 0x3243), .driver_info =3D TM6010_BOARD_TWINHAN_TU50=
1 },
 	{ USB_DEVICE(0x13d3, 0x3264), .driver_info =3D TM6010_BOARD_TWINHAN_TU50=
1 },
 	{ USB_DEVICE(0x6000, 0xdec2), .driver_info =3D TM6010_BOARD_BEHOLD_WANDE=
R_LITE },
 	{ USB_DEVICE(0x6000, 0xdec3), .driver_info =3D TM6010_BOARD_BEHOLD_VOYAG=
ER_LITE },
+	{ USB_DEVICE(0x0ccd, 0x0079), .driver_info =3D TM5600_BOARD_TERRATEC_GRA=
BSTER },
+	{ USB_DEVICE(0x06e1, 0xa192), .driver_info =3D TM5600_BOARD_ADSTECH_XPRE=
SS_USBAV_192 },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, tm6000_id_table);

--------------060908090502060800090705--
