Return-Path: <linux-media+bounces-13982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7639139A3
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 12:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 827C11F21F44
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B637F12E1DE;
	Sun, 23 Jun 2024 10:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="QcYFpGge"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF079CC;
	Sun, 23 Jun 2024 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719139638; cv=none; b=UPRWw/v8HdY6DxDv8jiNZ730A3G/73o7cT2X4SU69BUZkv2+Vuz+Nw6/Ln6CaFDRoniOHKNCCH7avWh676oTq7o8cEuJZFZojYuH+n/q2gW+85zALB+bFK8L8PfvnK955JuY+SvOhu040Zemlz72woz+ujn5aw4ywGtTL3suhAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719139638; c=relaxed/simple;
	bh=HGyuuV9ntz0AxV20noMkMe/DC6lHyV1SWFBowTKEcZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OAD1c6w0Untln06vB+ckS/Krh9FrDy7+IXOS0GWdo7qCbBdwScF8yFWNdg95mC23uYifzQ7wL4C3ffktktCEnj1kiIX0EBaFL1a4d8sSsb+vBqQBwwXw1TFmFhktZdSp+WVZ3TQX4TwSCV27ZJ6tDdcst+ztoivFtNr63i5Qbj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=QcYFpGge; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719139629; x=1719744429; i=nils.rothaug@gmx.de;
	bh=Zz4/6dF2PIuq2tfa4J4lNVfzxJyq7RoDwzhPr0Meri8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QcYFpGge/rpURjbV5L1xbC5gFSJCp5jRijx4jOYOlLblJrideB3/0J2IQxxg9CK1
	 CGNRosYHPe2h55k0LsbtY9SRES6tGKAharSQEr9cx0eLcenYwQ4yFcW5CLuMt6G9C
	 63+jwomC9oyQyeMdZJGUWLVbLg4AYqvyBtOTFuMJBfITHoaEAj4Y4A8LFQoT+vSW0
	 Tcz9TgDSd2WoaVtDWNrexZQhZyt7sz19pyEtiJt306T0m0etEFrFfM5cnPMjBQUGo
	 uuLvZMhCsBrLDncLKVNffWVZqlvZXZunwvx0ROU3X0BMhnbGqGN11AVbOiUo3ALZ5
	 txW0TX6/7gy3Dn18LA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MA7Ka-1sE8wB2a6s-004PRp; Sun, 23
 Jun 2024 12:47:09 +0200
From: Nils Rothaug <nils.rothaug@gmx.de>
To: hverkuil@xs4all.nl
Cc: sean@mess.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	mchehab@kernel.org,
	nils.rothaug@gmx.de
Subject: [PATCH v2 2/5] media: rc: add keymap for MyGica UTV3 remote
Date: Sun, 23 Jun 2024 12:46:44 +0200
Message-Id: <20240623104647.7697-3-nils.rothaug@gmx.de>
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
X-Provags-ID: V03:K1:oSwQKwB1YpKGmJJaHOMRarkqZoJRbiE8/tKWoEE2O/5FBjSP3QP
 6F9DaKdg7uaFnisw9ju8jvB/25QafbAQbRUWgGQf9LBtCzswtAKFUxCPTmY3L7yE6dIZSma
 3UcMdMJIcCi7D/TcphV6PZ0PvvZ77igQTmcwjRCpdhtyMcsnN5Ec7CVX0mBe1cTw2/MgQrT
 msH5kJ5sohVVYrzO9/47A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H0VMOIGnpn8=;9lqGjD1IpQ83pjmp8uZha/ZTeD6
 RCjqA8xWabJ7Ha1C1G8dchRVgA8vSu5E9HV6cPPlCJhCrHzXr2I2L0wGOXfAzvt9mreQQ9Pfh
 nVEb7GPHff9warnV3TLqj7NoBH8umuCt41ELmfMSWlnTs7KHsMXBCCSjYRxhg0j9A9besQMwM
 OeaJ+2U5Lu2vRAEaLNyjccBFP0S0WBeVy/hGkwBSA8UPSIzpgB5w8Ho81GpzzDay0evqGVxT1
 x/DcyemxhaVGA7sO01uB4cYspMX+qV8Fu4/jw8ghMfvbPb5SLuprQJ1xG3GZGvGrs0z+soipN
 pxGPRF8iMzLqaW+Yeu9NZ2qKxRAarn5BS6JvIuI9OoIWX5banlRigpdJ9KvokKBLIl1vQQG+L
 fforGIvT+becAHd+y7arlrHZqO4Ah5yTiMK9HU2iwQyb0xB96gb5TmLNW4ZDaikgOsA/uoaUy
 BJSpZihI4ImpvjOwTN/2R0u5M1rdmUhotPlwuC7sCtNL7XmMt2Fov4BD9/CeRjyulfwsabQgy
 jj0HLZHRsSdZxyOQ7/74lgcMPOEdWxzxDnQ1b21Ij/LNzg3UOUVsAbleB8nC/QmX53K0vdBXq
 ROrg37CnUX0Kpc7RtSv5twJFG0qoY7q57nh1xRkytv3eQUkN197yJ3Ifu9+KALJDvqhn/5vgs
 1indM3nGym7T11Llsbd9Qz6yXohEDTp1CstVD0z70aWjRQWBphFCLwzl7o2gMm2TdqhPNjJcD
 pB5XKMDSPzO8RsIk45wtESz/ZbxXhpan+vzt/4mHmmZYdV6NCpR8OoMXaeOf58ndY6Vpw5A7I
 kxgn236vgDr8SarBOgqiZw8oHNt0WODHCWTkzrZ+lz7sQ=

Add keymap for the simple IR (RC-5) remote that comes with the
MyGica UTV3 Analog USB2.0 TV Box video capture card.

Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
=2D--
 drivers/media/rc/keymaps/Makefile         |  1 +
 drivers/media/rc/keymaps/rc-mygica-utv3.c | 69 +++++++++++++++++++++++
 include/media/rc-map.h                    |  1 +
 3 files changed, 71 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-mygica-utv3.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/=
Makefile
index f19558fdab0c..7fdf0d9edbfd 100644
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
index 000000000000..f32b8281459b
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
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 4676545ffd8f..4867eb2f931e 100644
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


