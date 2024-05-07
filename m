Return-Path: <linux-media+bounces-10953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C18BD89D
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2421F247A4
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C1923A0;
	Tue,  7 May 2024 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="WYKbPOnF"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645328BE8
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041536; cv=none; b=oZbjvRfT1pHXGNL7qwQMoemkruwn08JPOANkN2i716NiY8oP2B0n8T3AXlBXNNpQ4+dP8GWfxR8vVvLdBf/Emnyldxg3WaMpgshaa7YINIwCIpOx/Zglg6Fg3Q/wXxksGuGdvainbRLuhMnE+6rBbxSypr2K91f8RqENjZ7SMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041536; c=relaxed/simple;
	bh=ZOOCalL79QkapZgj9hh17mZ9cLA7D/mYc1DBzl/qel4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=On8r8FEE4jZH+KAH8N/yNEKQixCP74hA0UYLp5KxxGwUUmreYS2Ugi/c5o6UCJYieWDfvMTwoGyiQu/UQTramXAoG9nzHhjMbPMDlcXmXFl0Na3sdnMUHD+4EXacqygcH+xbqFUtJqMrgwU4aqqQgs6tq8hpC9R1tOwEFcgKyk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=WYKbPOnF; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041528; x=1715646328; i=herdler@nurfuerspam.de;
	bh=v+/E3QZqnpGZAXwWhZ3bSwkLV+GSI8f/B/7CmB6coPw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WYKbPOnF68rmdNkvbgdQZb010tDqkcGSTAIUbXYutbZRItVsgKDXIOvYm3u1977z
	 1Bahz4KvLjJwYItFdDEgXrmxIvCwLfRiACbEjf6TaYok2FOgipzXOyfKksHxApzNb
	 Aw4W2XVmkXTLny6loEopcb9zI05LrFlOEnM+J1pZVvUUHP5ckhnuiZEYW77qLM5s2
	 DRj++SMZQAjhPxkQT02l4yx0BG+4BU2WfkakHkvG83rmF6+fbdQfl9q9KfsumFQhd
	 iI2e9FKIMFDNO34kjxkzR+6/uxtyk6f+WRHU0Ue+4w2TdsmeuQgWyfqtL1PSZPAfK
	 xNo0BJWNlm6bI1ebeg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1rwg7b0jA7-00An68; Tue, 07
 May 2024 02:25:28 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 12/21] media: av7110: coding style fixes: comments
Date: Tue,  7 May 2024 02:24:51 +0200
Message-Id: <20240507002500.81867-13-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RfJsmYupeloi4rTJHzg/tiL7WUPnk2UB9ObRLSFDX/EyXA72t+a
 DkwthUHmF2h1SFbSbFZiXIsahYmIuFkkF3GIs6X20/8sJw/1Sehqz32BZ4KvDYov/+akgqx
 N/4PfFRL9w/v10kpIJPH2fIF6OUaFkr6ywt6bNZpCEAuWczYzjU4j+0AcR/LSNoHJXDgA1/
 bDtDahqwDfyMOSzWixt8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fvJQ2IcNV8Y=;xYfzVyFMc5yZ6J/RW8cadw+W30T
 TMVMEOiWxOASIUsq1gCeeUgNbE++Av1o7/zH5UDF3Kz0kUSdL6EFDU4cZgx6+kLoDdTNRVOpt
 G8fUVml10JVWIiGKJRLJtxeRAA23cvwkATTlwYwLajCLREMV4LunF8e6ftObcs0VeS2yRGwfi
 EupAHA6QLFDe+wURu2tP7RhllLVMxpQ71K5Y2NppnWFq3j5Q0JRH6l5Ha/GCUEVelx09lCTvi
 VSPulVs4SH9X1mts7ewQQ1Or8Q/4NhnPP+ANk+x6qqcG09sg+L2XIW9WiicdJWn+hTKH2mnQS
 /Et25N72Fl4cfKPKdBi60LhpSFsOjqPlbKbo0rip98uG/d3s9QgG0myWSb4jq7nCIyqcqNjmS
 hkU62PL09/qAeJML2gQ891QxP/wCJCQ79RHVvM64ayMsT0khFk/BnLwjdomsNbD/QgTuZbBVh
 V00krgUveDX1F5MSg6P6Ijm9/4/xf0FsA/NvRLwfpF3ra65vB7C1H2RKfySmD2wNGdVhvstGV
 77KRdrEWkvv99nxreRKU9Annt5hvbuFSBJdBn4jAJqHIOEnDSTE94gXg2U6eOboL7rU1mYFjq
 ohJ04SGOLer8WUsxjsoCVpV+zz4yaPgw/FlyB+fAiFT3U1KCADM+Da0AjcKPiJFtVPq85YaJS
 bCEdfH7SjmFqZ2hfwtTNbOHmb3QpBVQJo9gZgYLwfWfM0NNHhtQLb4GKcmSoTru1fFUZUALXT
 Stq11XCwqycT3oDs1KjumHaSIRsietJBqavQoLlUUhYImjkWVqeEXpS+Ei2Y5FOch4HWA3h1e
 53xXJ40VWzXzEDOxkBbb96uFzGlgq6u3LJAVrY3NpsQ0I=

This patch fixes the following checkpatch warnings:

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separat=
e line
WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag=
 in line 1
WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename =
in the file

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c     | 14 ++++++++------
 drivers/staging/media/av7110/av7110_av.c  |  6 ++++--
 drivers/staging/media/av7110/av7110_ca.c  |  3 ++-
 drivers/staging/media/av7110/av7110_hw.c  |  9 ++++++---
 drivers/staging/media/av7110/av7110_hw.h  |  6 ++++--
 drivers/staging/media/av7110/av7110_v4l.c | 14 +++++++++-----
 drivers/staging/media/av7110/dvb_filter.h | 12 ++++++------
 7 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index 27019e3f3..49735cbb2 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * driver for the SAA7146 based AV110 cards (like the Fujitsu-Siemens DVB=
)
- * av7110.c: initialization and demux stuff
+ * - initialization and demux stuff
  *
  * Copyright (C) 1999-2002 Ralph  Metzler
  *                       & Marcus Metzler for convergence integrated medi=
a GmbH
@@ -2444,7 +2444,8 @@ static int av7110_attach(struct saa7146_dev *dev,
 		goto err_put_firmware_1;

 	/* the Siemens DVB needs this if you want to have the i2c chips
-	   get recognized before the main driver is fully loaded */
+	 * get recognized before the main driver is fully loaded
+	 */
 	saa7146_write(dev, GPIO_CTRL, 0x500000);

 	strscpy(av7110->i2c_adap.name, pci_ext->ext_priv,
@@ -2671,8 +2672,9 @@ static int av7110_attach(struct saa7146_dev *dev,
 	init_av7110_av(av7110);

 	/* special case DVB-C: these cards have an analog tuner
-	   plus need some special handling, so we have separate
-	   saa7146_ext_vv data for these... */
+	 * plus need some special handling, so we have separate
+	 * saa7146_ext_vv data for these...
+	 */
 	ret =3D av7110_init_v4l(av7110);
 	if (ret < 0)
 		goto err_av7110_unregister_11;
@@ -2853,8 +2855,8 @@ static const struct pci_device_id pci_tbl[] =3D {
 	MAKE_EXTENSION_PCI(tts_2_3,     0x13c2, 0x000e),
 	MAKE_EXTENSION_PCI(tts_1_3se,   0x13c2, 0x1002),

-/*	MAKE_EXTENSION_PCI(???, 0x13c2, 0x0005), UNDEFINED CARD */ // Technisa=
t SkyStar1
-/*	MAKE_EXTENSION_PCI(???, 0x13c2, 0x0009), UNDEFINED CARD */ // TT/Haupp=
auge WinTV Nexus-CA v????
+//	MAKE_EXTENSION_PCI(???, 0x13c2, 0x0005), UNDEFINED CARD  // Technisat =
SkyStar1
+//	MAKE_EXTENSION_PCI(???, 0x13c2, 0x0009), UNDEFINED CARD  // TT/Hauppau=
ge WinTV Nexus-CA v???

 	{
 		.vendor    =3D 0,
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index e031d6028..f5200aa3d 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * av7110_av.c: audio and video MPEG decoder stuff
+ * driver for the SAA7146 based AV110 cards
+ * - audio and video MPEG decoder stuff
  *
  * Copyright (C) 1999-2002 Ralph  Metzler
  *                       & Marcus Metzler for convergence integrated medi=
a GmbH
@@ -1060,7 +1061,8 @@ static int play_iframe(struct av7110 *av7110, char _=
_user *buf, unsigned int len
 	}

 	/* setting n always > 1, fixes problems when playing stillframes
-	   consisting of I- and P-Frames */
+	 * consisting of I- and P-Frames
+	 */
 	n =3D MIN_IFRAME / len + 1;

 	/* FIXME: nonblock? */
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/me=
dia/av7110/av7110_ca.c
index 682204a6f..c28e41d42 100644
=2D-- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * av7110_ca.c: CA and CI stuff
+ * driver for the SAA7146 based AV110 cards
+ * - CA and CI stuff
  *
  * Copyright (C) 1999-2002 Ralph  Metzler
  *                       & Marcus Metzler for convergence integrated medi=
a GmbH
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index ef4090fb1..c7ea72128 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * av7110_hw.c: av7110 low level hardware access and firmware interface
+ * driver for the SAA7146 based AV110 cards
+ * - av7110 low level hardware access and firmware interface
  *
  * Copyright (C) 1999-2002 Ralph  Metzler
  *                       & Marcus Metzler for convergence integrated medi=
a GmbH
@@ -38,7 +39,8 @@
  ************************************************************************=
****/

 /* This DEBI code is based on the Stradis driver
-   by Nathan Laredo <laredo@gnu.org> */
+ * by Nathan Laredo <laredo@gnu.org>
+ */

 int av7110_debiwrite(struct av7110 *av7110, u32 config,
 		     int addr, u32 val, unsigned int count)
@@ -187,7 +189,8 @@ static int load_dram(struct av7110 *av7110, u32 *data,=
 int len)
 }

 /* we cannot write av7110 DRAM directly, so load a bootloader into
- * the DPRAM which implements a simple boot protocol */
+ * the DPRAM which implements a simple boot protocol
+ */
 int av7110_bootarm(struct av7110 *av7110)
 {
 	const struct firmware *fw;
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/me=
dia/av7110/av7110_hw.h
index 3d0afae7f..c13b8c479 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -250,7 +250,8 @@ enum av7110_command_type {
 #define DATA_TS_PLAY		 0x13

 /* ancient CI command codes, only two are actually still used
- * by the link level CI firmware */
+ * by the link level CI firmware
+ */
 #define CI_CMD_ERROR		 0x00
 #define CI_CMD_ACK		 0x01
 #define CI_CMD_SYSTEM_READY	 0x02
@@ -286,7 +287,8 @@ enum av7110_command_type {

 /* base address of the dual ported RAM which serves as communication
  * area between PCI bus and av7110,
- * as seen by the DEBI bus of the saa7146 */
+ * as seen by the DEBI bus of the saa7146
+ */
 #define	DPRAM_BASE 0x4000

 /* boot protocol area */
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index 3090efb00..633dbb697 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * av7110_v4l.c: av7110 video4linux interface for DVB and Siemens DVB-C a=
nalog module
+ * driver for the SAA7146 based AV110 cards
+ * - video4linux interface for DVB and Siemens DVB-C analog module
  *
  * Copyright (C) 1999-2002 Ralph  Metzler
  *                       & Marcus Metzler for convergence integrated medi=
a GmbH
@@ -153,7 +154,8 @@ static int ves1820_set_tv_freq(struct saa7146_dev *dev=
, u32 freq)
 	dprintk(4, "freq: 0x%08x\n", freq);

 	/* magic number: 614. tuning with the frequency given by v4l2
-	   is always off by 614*62.5 =3D 38375 kHz...*/
+	 * is always off by 614*62.5 =3D 38375 kHz...
+	 */
 	div =3D freq + 614;

 	buf[0] =3D (div >> 8) & 0x7f;
@@ -801,8 +803,9 @@ int av7110_init_v4l(struct av7110 *av7110)
 	int ret;

 	/* special case DVB-C: these cards have an analog tuner
-	   plus need some special handling, so we have separate
-	   saa7146_ext_vv data for these... */
+	 * plus need some special handling, so we have separate
+	 * saa7146_ext_vv data for these...
+	 */
 	if (av7110->analog_tuner_flags)
 		vv_data =3D &av7110_vv_data_c;
 	else
@@ -865,7 +868,8 @@ int av7110_exit_v4l(struct av7110 *av7110)
 }

 /* FIXME: these values are experimental values that look better than the
-   values from the latest "official" driver -- at least for me... (MiHu) =
*/
+ * values from the latest "official" driver -- at least for me... (MiHu)
+ */
 static struct saa7146_standard standard[] =3D {
 	{
 		.name	=3D "PAL",	.id		=3D V4L2_STD_PAL_BG,
diff --git a/drivers/staging/media/av7110/dvb_filter.h b/drivers/staging/m=
edia/av7110/dvb_filter.h
index 471b53058..38b483508 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.h
+++ b/drivers/staging/media/av7110/dvb_filter.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * dvb_filter.h
- *
  * Copyright (C) 2003 Convergence GmbH
  *
  * This program is free software; you can redistribute it and/or
@@ -184,10 +183,11 @@ struct mpg_picture {
 	s8        matrix_change_flag;

 	u8        picture_header_parameter;
-  /* bit 0 - 2: bwd f code
-     bit 3    : fpb vector
-     bit 4 - 6: fwd f code
-     bit 7    : fpf vector */
+	/* bit 0 - 2: bwd f code
+	 * bit 3    : fpb vector
+	 * bit 4 - 6: fwd f code
+	 * bit 7    : fpf vector
+	 */

 	int       mpeg1_flag;
 	int       progressive_sequence;
=2D-
2.34.0


