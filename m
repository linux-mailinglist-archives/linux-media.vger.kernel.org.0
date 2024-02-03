Return-Path: <linux-media+bounces-4638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F385484864D
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 13:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 234491C20A96
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 12:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09864F5EB;
	Sat,  3 Feb 2024 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="K7CjxCmC"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25C17C77
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964531; cv=none; b=cZvvLWpgmwLpBlBgVFhrFuBKEAE4xp9D6eVusOlEZgqdPmvsR0jEicBLTmqT10vyXbCt1RZ4m3SZJzVIWGJnTsOwagUc6Xcpb4S6xWn1PDW6VNWp7nj4VjVi0nnASFvVYZskn+1bMAd199W6eItMsg8ok4PKh3iWoSWbHkDv5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964531; c=relaxed/simple;
	bh=gslTGFzhJiHvAV79gQ0nGIwPRX8ueRIUM6pb7lmqNxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BdqdYeWu4bDNrnhcjkAfQGY+I12bseN7OgPilsNk6Vg1/cpOEJB49Ag7tJPpo9d3q0PejPfRTM11pQ5BOn/staVMvbUMC1UUcjitV7mcXRKBrklVrRvdogD4BFNBx/8ZP+21cMSST/jOqe0aoCsMzTdDTcIQLZrU6e4Dz+CzLmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=K7CjxCmC; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706964522; x=1707569322; i=nils.rothaug@gmx.de;
	bh=gslTGFzhJiHvAV79gQ0nGIwPRX8ueRIUM6pb7lmqNxc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=K7CjxCmCDdCSB813CXfQHN39UIWngZ4HvK7EjIBCCVH48OKQcZ53DWmuM1cnefjc
	 RAhIH8yJF6XMMLY/v/KxCW9+g8PFxp/GOAXgp0N3q+rmYgzILiWnTg8gxs5i/RLbG
	 UQnq0/Uj3ekHR3B67JDn8M14tI4E5luIi3iDPQkwUo8FuKEBv+qQX5XVqub758WEs
	 ao9Qrw96GFLZtGvB4rxRZHAMtzJ0KjR8A1HQO/WYwJptHjSNGxgz6LAN4TsTKr+Hk
	 jm3qqNZSMLw3rmR5pVPacctJnm/8Zf2I/t0IM4FIegg/TONPNrRn1fvrtHyGUK9OI
	 pCo7CRs4i3eJ0pl/Pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MuDXz-1rBpwt1hTZ-00ubFq; Sat, 03
 Feb 2024 13:48:42 +0100
From: Nils Rothaug <nils.rothaug@gmx.de>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Nils Rothaug <nils.rothaug@gmx.de>
Subject: [PATCH 2/4] media: em28xx: Add support for MyGica UTV3
Date: Sat,  3 Feb 2024 13:47:43 +0100
Message-Id: <20240203124745.10257-3-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240203124745.10257-1-nils.rothaug@gmx.de>
References: <20240203124745.10257-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PlJRJe3d21Qf6fLhjYQ4BRM3cGnFaz65fXZDmYQV1MG5rOvRBJ9
 5n4AK7/beBv7inc4PHRwC+La3pfLqqhCSyaqrdXxav2H49e/XFXzx2UGGiSkXzTuiThDKhj
 GyM3mgLl2BytIKcwJtwaSdrcI7LhyqbexV0omG95CRr1uDiWq/Rr13sgDLoMS4D84HA9Cxu
 Epm0LuLTKjTLLibFg4Ong==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cLbUgXKlYQY=;r7BRd6GvUSnLHqpPz0+yJqORtEJ
 SPKkHYRgD7RjFb6cDwqngl0aqlcqL6SBUcCs2vj/t4xZHWb1PNozQ8/CcFQg/Nd3dF1SM2cru
 gpnisV+UnY56b27GUBA8g/6um677hfkytZkMo2ALRLZ8/PnZT3EZcLKnDDWyfbsm+R3sFQm/e
 2FvQ+6kkazK9oTtRLgjsCUgZtMnbvka1kMFL4jbNX+KH1WLqir315/IskrkwAOn5gHl3VWCXi
 Sh0ALKIQisEjYW6QLyrgErBrsNEIO0mIIUhbrWb9J5NLqKeNR3SQ3/H8GByQN/wpLGAvgpbz1
 v3e5CQFuOYdsRbu/QjyrYokHTalR7ogK2a+6WjPKEAft9WQttLIH/SLUhS5UKQCgAdDujtGWF
 Lo7TH50QVaUybb4S2CxSOdecMWy6r8DCENQNPg0xBVfzsnh7S9rWsDP/cvCkqzAfxUavZSKtT
 uZWaQzcoPTdzXepu84H9wU7NlNXczobOsQmtIW32vY3JKrIzYKtzKWHlMjYpJk/H/PIrhi92m
 LrJqm8SFVP3Bqu2KW0m74WLqIQ5ECTJiBeUoVJ933TnSuEEoPw9ZZ5HC5OMVpknvQY6BgYtYd
 j1nQBnnzFLNCL0qQ86NBoOvhI1IETxnkyyfa8It50hwzh4Sahc0r4ngA++bWJJOTH3eTW9BPq
 sILwkk132sNcRsbY3fd04O1P/CrWmcQCLZ5NbZFbqr8JyNXB/X8ZQkJofIdjQxcyWlkG7J9lh
 v0Q8ftLCOk9fatVWHpo6kBJnyXiXa2O3oFe6DpMWexMIkzko1OYOSFEbnHbtN21Vec0KZ216t
 dvHpAre24hAmFl69LNNkoAGgDN6nXNGUgyTdqj0CONeJQ=

The MyGica UTV3 Analog USB2.0 TV Box is a USB video capture card
that has analog TV, composite video, and FM radio inputs, an IR
remote, and provides audio only as Line Out, but not over USB.
Mine is prepared for an FM tuner, but not equipped with one.
Support for FM radio is therefore missing. The device contains:
 - Empia EM2860 USB bridge
 - Philips SAA7113 video decoder
 - NXP TDA9801T demodulator
 - Tena TNF931D-DFDR1 tuner
 - ST HCF4052 demux, switches input audio to Line Out

Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
=2D--
 drivers/media/rc/keymaps/Makefile         |  1 +
 drivers/media/rc/keymaps/rc-mygica-utv3.c | 69 +++++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx-cards.c   | 52 +++++++++++++++++
 drivers/media/usb/em28xx/em28xx.h         |  1 +
 include/media/rc-map.h                    |  1 +
 5 files changed, 124 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-mygica-utv3.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/=
Makefile
index f19558fdab0..7fdf0d9edbf 100644
=2D-- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_RC_MAP) +=3D \
 			rc-msi-digivox-ii.o \
 			rc-msi-tvanywhere.o \
 			rc-msi-tvanywhere-plus.o \
+			rc-mygica-utv3.o \
 			rc-nebula.o \
 			rc-nec-terratec-cinergy-xs.o \
 			rc-norwood.o \
diff --git a/drivers/media/rc/keymaps/rc-mygica-utv3.c b/drivers/media/rc/=
keymaps/rc-mygica-utv3.c
new file mode 100644
index 00000000000..f32b8281459
=2D-- /dev/null
+++ b/drivers/media/rc/keymaps/rc-mygica-utv3.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* rc-mygica-utv3.c - Keytable for the MyGica UTV3 Analog USB2.0 TV Box
+ *
+ * Copyright (c) 2024 by Nils Rothaug
+ */
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+static struct rc_map_table mygica_utv3[] =3D {
+	{ 0x0d, KEY_MUTE },
+	{ 0x38, KEY_VIDEO },  /* Source */
+	{ 0x14, KEY_RADIO },  /* FM Radio */
+	{ 0x0c, KEY_POWER2 },
+
+	{ 0x01, KEY_NUMERIC_1},
+	{ 0x02, KEY_NUMERIC_2},
+	{ 0x03, KEY_NUMERIC_3},
+	{ 0x04, KEY_NUMERIC_4},
+	{ 0x05, KEY_NUMERIC_5},
+	{ 0x06, KEY_NUMERIC_6},
+	{ 0x07, KEY_NUMERIC_7},
+	{ 0x08, KEY_NUMERIC_8},
+	{ 0x09, KEY_NUMERIC_9},
+	{ 0x00, KEY_NUMERIC_0},
+
+	{ 0x0a, KEY_DIGITS }, /* Single/double/triple digit */
+	{ 0x0e, KEY_CAMERA }, /* Snapshot */
+	{ 0x0f, KEY_ZOOM },   /* Full Screen */
+	{ 0x29, KEY_LAST },   /* Recall (return to previous channel) */
+
+	{ 0x17, KEY_PLAY },
+	{ 0x1f, KEY_RECORD },
+	{ 0x0b, KEY_STOP },
+	{ 0x16, KEY_PAUSE },
+
+	{ 0x20, KEY_CHANNELUP },
+	{ 0x21, KEY_CHANNELDOWN },
+	{ 0x10, KEY_VOLUMEUP },
+	{ 0x11, KEY_VOLUMEDOWN },
+	{ 0x26, KEY_REWIND },
+	{ 0x27, KEY_FASTFORWARD },
+};
+
+static struct rc_map_list mygica_utv3_map =3D {
+	.map =3D {
+		.scan     =3D mygica_utv3,
+		.size     =3D ARRAY_SIZE(mygica_utv3),
+		.rc_proto =3D RC_PROTO_RC5,
+		.name     =3D RC_MAP_MYGICA_UTV3,
+	}
+};
+
+static int __init init_rc_map_mygica_utv3(void)
+{
+	return rc_map_register(&mygica_utv3_map);
+}
+
+static void __exit exit_rc_map_mygica_utv3(void)
+{
+	rc_map_unregister(&mygica_utv3_map);
+}
+
+module_init(init_rc_map_mygica_utv3)
+module_exit(exit_rc_map_mygica_utv3)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Nils Rothaug");
+MODULE_DESCRIPTION("MyGica UTV3 Analog USB2.0 TV Box remote keytable");
diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/e=
m28xx/em28xx-cards.c
index 4d037c92af7..2c53063d69c 100644
=2D-- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -554,6 +554,30 @@ static struct em28xx_reg_seq hauppauge_usb_quadhd_ats=
c_reg_seq[] =3D {
 	{-1,                           -1,   -1,       -1},
 };

+/*
+ * MyGica USB TV Box
+ * GPIO_1,0: 00=3DComposite audio
+ *           01=3DTuner audio
+ *           10=3DMute audio
+ *           11=3DFM radio? (if equipped)
+ * GPIO_2-6: Unused
+ * GPIO_7:   ??
+ */
+static const struct em28xx_reg_seq mygica_utv3_composite_audio_gpio[] =3D=
 {
+	{EM2820_R08_GPIO_CTRL, 0xfc, 0xff, 0},
+	{ -1, -1, -1, -1},
+};
+
+static const struct em28xx_reg_seq mygica_utv3_tuner_audio_gpio[] =3D {
+	{EM2820_R08_GPIO_CTRL, 0xfd, 0xff, 0},
+	{ -1, -1, -1, -1},
+};
+
+static const struct em28xx_reg_seq mygica_utv3_suspend_gpio[] =3D {
+	{EM2820_R08_GPIO_CTRL, 0xfe, 0xff, 0},
+	{ -1, -1, -1, -1},
+};
+
 /*
  *  Button definitions
  */
@@ -2578,6 +2602,32 @@ const struct em28xx_board em28xx_boards[] =3D {
 		.tuner_gpio    =3D hauppauge_usb_quadhd_atsc_reg_seq,
 		.leds          =3D hauppauge_usb_quadhd_leds,
 	},
+	/*
+	 * eb1a:2860 MyGica UTV3 Analog USB2.0 TV Box
+	 * Empia EM2860, Philips SAA7113, NXP TDA9801T demod,
+	 * Tena TNF931D-DFDR1 tuner (contains NXP TDA6509A),
+	 * ST HCF4052 demux (switches audio to line out),
+	 * no audio over USB
+	 */
+	[EM2860_BOARD_MYGICA_UTV3] =3D {
+		.name         =3D "MyGica UTV3 Analog USB2.0 TV Box",
+		.xclk		  =3D EM28XX_XCLK_IR_RC5_MODE | EM28XX_XCLK_FREQUENCY_12MHZ,
+		.tuner_type   =3D TUNER_TENA_TNF_931D_DFDR1,
+		.ir_codes     =3D RC_MAP_MYGICA_UTV3,
+		.decoder      =3D EM28XX_SAA711X,
+		.suspend_gpio =3D mygica_utv3_suspend_gpio,
+		.input        =3D { {
+			.type     =3D EM28XX_VMUX_COMPOSITE,
+			.vmux     =3D SAA7115_COMPOSITE0,
+			.amux     =3D EM28XX_AMUX_VIDEO,
+			.gpio     =3D mygica_utv3_composite_audio_gpio,
+		}, {
+			.type     =3D EM28XX_VMUX_TELEVISION,
+			.vmux     =3D SAA7115_COMPOSITE2,
+			.amux     =3D EM28XX_AMUX_VIDEO,
+			.gpio     =3D mygica_utv3_tuner_audio_gpio,
+		} },
+	},
 };
 EXPORT_SYMBOL_GPL(em28xx_boards);

@@ -2819,6 +2869,7 @@ static const struct em28xx_hash_table em28xx_eeprom_=
hash[] =3D {
 	{0x63f653bd, EM2870_BOARD_REDDO_DVB_C_USB_BOX, TUNER_ABSENT},
 	{0x4e913442, EM2882_BOARD_DIKOM_DK300, TUNER_XC2028},
 	{0x85dd871e, EM2882_BOARD_ZOLID_HYBRID_TV_STICK, TUNER_XC2028},
+	{0x8f597549, EM2860_BOARD_MYGICA_UTV3, TUNER_TENA_TNF_931D_DFDR1},
 };

 /* I2C devicelist hash table for devices with generic USB IDs */
@@ -2831,6 +2882,7 @@ static const struct em28xx_hash_table em28xx_i2c_has=
h[] =3D {
 	{0x4ba50080, EM2861_BOARD_GADMEI_UTV330PLUS, TUNER_TNF_5335MF},
 	{0x6b800080, EM2874_BOARD_LEADERSHIP_ISDBT, TUNER_ABSENT},
 	{0x27e10080, EM2882_BOARD_ZOLID_HYBRID_TV_STICK, TUNER_XC2028},
+	{0x840d0484, EM2860_BOARD_MYGICA_UTV3, TUNER_TENA_TNF_931D_DFDR1},
 };

 /* NOTE: introduce a separate hash table for devices with 16 bit eeproms =
*/
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/=
em28xx.h
index db18dd814a6..f3449c240d2 100644
=2D-- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -143,6 +143,7 @@
 #define EM28178_BOARD_PCTV_461E_V2                104
 #define EM2860_BOARD_MYGICA_IGRABBER              105
 #define EM2874_BOARD_HAUPPAUGE_USB_QUADHD         106
+#define EM2860_BOARD_MYGICA_UTV3                  107

 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 4676545ffd8..4867eb2f931 100644
=2D-- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -290,6 +290,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_MSI_DIGIVOX_III           "rc-msi-digivox-iii"
 #define RC_MAP_MSI_TVANYWHERE            "rc-msi-tvanywhere"
 #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
+#define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
 #define RC_MAP_NEBULA                    "rc-nebula"
 #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
 #define RC_MAP_NORWOOD                   "rc-norwood"
=2D-
2.34.1


