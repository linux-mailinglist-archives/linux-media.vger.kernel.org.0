Return-Path: <linux-media+bounces-13984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9EF9139A7
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 12:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1F31C2099F
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0627D12EBCE;
	Sun, 23 Jun 2024 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="MXyvc8sK"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0F679CC;
	Sun, 23 Jun 2024 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719139646; cv=none; b=n+wr/bQVw+EJTrZlGfkXIRzDUu/lw9FXPyBeojMtdzr3+coasE0KtVqgpNjOovDeLu6D4z91G/Y1xxWkLlN+8XdIJAUrDLWxOLafzowB1Re9ZcrHSmVWOzHpf1GZTaEcbNP0MeaHxOmLbydkc3c0Bo7nBrFOdbIY/eW0Az/Tr14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719139646; c=relaxed/simple;
	bh=QWgZ/RQ7xExWv0Xi3+qB57iYNW1jTKZPj8abIl100CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qibfktKrhuBPVy4S1Mh+ZjfBRE6z6JJwayAyvfwSPd7aomOqgXHEasOaaBlZxZVylxIrzLnNb4A4CwS6fbZSw443hRwrmmMdd4UevigyraEcMJ0dRQ3jxzrbJpxQ8005MJU1c/3p6gelnSRZOFh6Z9JQEtlhUXZV+F2gg2numM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=MXyvc8sK; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719139638; x=1719744438; i=nils.rothaug@gmx.de;
	bh=6m6FX2UgZOqwaWZSWZv60M6WPkiYl4P3r6jn1znIU6Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MXyvc8sKDpy3hsXtOeDBOwB5bJnSb52u21A2m5VDI9oAXMte7oMw0HIgYpHgi0TO
	 LU5OOhD76bYSZ0AXJbTe13QvZlT11QGc0ulw45Kgq9ThMv5vvgx+wDmH7VGP3cahM
	 KR404sZ/HWl7bGz2cguX9ZQul5/2Y4tM+atBqvzCPFlu5fRi0X2gzi4jFoxLkGUIK
	 /uZfKBiqzFKpqBDCdijuFFvI12C2ko2Au40QsrNsGLfjrhbJVkNSf32/sMgs57FuN
	 pb3duBZFA0H/19nTNv9ukJzHONwe4VcTfitfadEbXD8iRsOHF9pfVBtLd5uU940TS
	 jO3wK6XKQTm10YRqGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MMXQ5-1s1jph1IT1-00YU04; Sun, 23
 Jun 2024 12:47:18 +0200
From: Nils Rothaug <nils.rothaug@gmx.de>
To: hverkuil@xs4all.nl
Cc: sean@mess.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	mchehab@kernel.org,
	nils.rothaug@gmx.de
Subject: [PATCH v2 4/5] media: em28xx: Add support for MyGica UTV3
Date: Sun, 23 Jun 2024 12:46:46 +0200
Message-Id: <20240623104647.7697-5-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240623104647.7697-1-nils.rothaug@gmx.de>
References: <20240623104647.7697-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8qBoP2kfUqBSaHeChPTTwnr2ahs1LmcDBrqKkcX7bXCShDi6B7W
 o8dXbSOuvlVjibMpzxOTEkBYT6QfIbNzz81V3t4rHEghhGbyDbb6CZeEM8YYHVRrE8uf641
 evsFX5soNn2mSIxqKI01FveGwM6YnZnuT4x52Z8HVGhkc7KGuTaXQ4NdiqcYvLowBAAf1Er
 qSNEu1OhrwlkZ5aJPj3fA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w+Jnl2PIiTI=;4r3aIx+aUl3JxOH39KalF1mTapa
 IaT6dXXSjz0SEtc6U/50o5fP2hCvOY0MzsTqZ2lhwhJdAUnHBkd4lIhGjj1jkLUkzfj9pFEE7
 0UiuIA0gGd8gjANkvdlyavwA5iiBYARK3s8aEuyj6pva+YVuMmdiwVPKLGO6s0/jLrpQp3CBN
 QmXopu0Q14TEVMlO85iiNbjbmKEaWndEEQew0C2EpjC7eAy/NdxRTC9kdPQH4T6IBi/QxiWf8
 pcaOSFOw6tnPGJeTXFuUm2jC7BjhqS53fDCn/9aGxxTbUXAThnU6elqloiVyYbsEEMyAIb2QP
 2DeE/KuDE/MR5SmeLssB9VUA4P97QHa+91etXnkl4N36p1NdbabewfAYf+E8vGKHGfX5Is4cT
 qdIYnKN+1D1U7U08tzSMOm1LJpLZnVRSK/Dek9dfgN9h4P0GBJk5+5aXGf3BgVCAJQE6GgKjO
 c6PVut0lPM3v0lfxL/w51Kp9f48ZElu2K/qCaySTlbIOYcye8P8OaYObkQsSR8O+dM5LV7LZ6
 wzFAG1zfgJ2ge0FLAXCniDprcWqUGPpao5lXGZGZhLdqWlvQUBgMm6VYT0oNBNMnMRsT0ARaS
 nkSEuCRQlXNgK186tXMdvlOxIMa+I4O2znv/HuO2B8YgFzfw0PuKDl4d2GpJx0VM9ZAvCAUue
 MWy8pbktyWDgb9L02tkW1zf1KPzU+l1BrVcOn/1Suwqp92BuRx9kyCOjdiaQdnjMn1+LeztPS
 s89JEg16IkPkRi6+gzkxLZfP7o5JA4oD4Jlm2wHkJioVlBBXdmo2mG9Y9UUlIAE4TLNqbDcDe
 vaT4lyFV27BfWZP4Dw+8R/SaEZM5UP2pPTtCZ2XuJwvZE=

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
 .../admin-guide/media/em28xx-cardlist.rst     |  8 +++
 drivers/media/usb/em28xx/em28xx-cards.c       | 52 +++++++++++++++++++
 drivers/media/usb/em28xx/em28xx.h             |  1 +
 3 files changed, 61 insertions(+)

diff --git a/Documentation/admin-guide/media/em28xx-cardlist.rst b/Documen=
tation/admin-guide/media/em28xx-cardlist.rst
index ace65718ea22..7dac07986d91 100644
=2D-- a/Documentation/admin-guide/media/em28xx-cardlist.rst
+++ b/Documentation/admin-guide/media/em28xx-cardlist.rst
@@ -438,3 +438,11 @@ EM28xx cards list
      - MyGica iGrabber
      - em2860
      - 1f4d:1abe
+   * - 106
+     - Hauppauge USB QuadHD ATSC
+     - em28274
+     - 2040:846d
+   * - 107
+     - MyGica UTV3 Analog USB2.0 TV Box
+     - em2860
+     - eb1a:2860
diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/e=
m28xx/em28xx-cards.c
index 4d037c92af7c..bf98e296e0cf 100644
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
+		.xclk         =3D EM28XX_XCLK_IR_RC5_MODE | EM28XX_XCLK_FREQUENCY_12MHZ=
,
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
index db18dd814a67..f3449c240d21 100644
=2D-- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -143,6 +143,7 @@
 #define EM28178_BOARD_PCTV_461E_V2                104
 #define EM2860_BOARD_MYGICA_IGRABBER              105
 #define EM2874_BOARD_HAUPPAUGE_USB_QUADHD         106
+#define EM2860_BOARD_MYGICA_UTV3                  107

 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
=2D-
2.34.1


