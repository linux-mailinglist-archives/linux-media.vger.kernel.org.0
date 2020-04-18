Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A790B1AEB73
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDRJof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:44:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:57332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgDRJoe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:44:34 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBED322244;
        Sat, 18 Apr 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587203073;
        bh=eX7GsJvyxJLUoJX7kgfhpCZAho6qf1lvR+oMLzB8xb0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dmiTXXnAW4d5UrEYLt3ryB2eEpndFLpS6qnk31gk/jO95iNog6+PB3gxtZxU/D5kO
         vKglCmIt47MArQS+8bwzmisLXDNPAE7xmvCaw9axLFti6ExqFJcj8KzGj8XgsaQxFw
         O+MJKwSDAqAloYi8ZDMImsx1KV2TMvcXoOZLo3Ls=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPk1W-0081Nq-3X; Sat, 18 Apr 2020 11:44:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/9] media: admin-guide: split DVB cards.rst
Date:   Sat, 18 Apr 2020 11:44:21 +0200
Message-Id: <492537a57693cbaa51f3788bb9a343add3f4c618.1587202259.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587202259.git.mchehab+huawei@kernel.org>
References: <cover.1587202259.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DVB cards.rst file is old and outdated. It also contains
data that are contained on other cardlists. Remove the
duplicated information and split frontends and PCI cards on
separate files.

As all USB cards already have their own card lists, just drop
the old USB data there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  |   7 +-
 Documentation/admin-guide/media/cards.rst     | 146 ------------------
 .../admin-guide/media/frontend-cardlist.rst   |  48 ++++++
 Documentation/admin-guide/media/index.rst     |   1 -
 .../admin-guide/media/other-pci-cardlist.rst  |  25 +++
 5 files changed, 79 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/cards.rst
 create mode 100644 Documentation/admin-guide/media/frontend-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/other-pci-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 1a46df2a7bdb..01d3290d7f77 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -16,7 +16,9 @@ and may be added/removed by the user.
 
 This section contains a list of supported PCI and USB boards.
 
-Please notice that this list is not exaustive.
+Please notice that this list is not exhaustive. You may also take a
+look at https://linuxtv.org/wiki/index.php/Hardware_Device_Information
+for more details about supported cards.
 
 USB drivers
 ===========
@@ -125,6 +127,8 @@ specific board.
 	saa7134-cardlist
 	saa7164-cardlist
 
+	other-pci-cardlist
+
 I²C drivers
 ===========
 
@@ -145,3 +149,4 @@ different tuner number in order to address such issue.
 	:maxdepth: 1
 
 	tuner-cardlist
+	frontend-cardlist
diff --git a/Documentation/admin-guide/media/cards.rst b/Documentation/admin-guide/media/cards.rst
deleted file mode 100644
index e2e30a56b450..000000000000
--- a/Documentation/admin-guide/media/cards.rst
+++ /dev/null
@@ -1,146 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-Hardware supported by the linuxtv.org DVB drivers
-=================================================
-
-.. note::
-
-   This documentation is outdated. Please check at the DVB wiki
-   at https://linuxtv.org/wiki for more updated info.
-
-   Please look at
-   https://linuxtv.org/wiki/index.php/Hardware_Device_Information
-   for an updated list of supported cards.
-
-Generally, the DVB hardware manufacturers frequently change the
-frontends (i.e. tuner / demodulator units) used, usually without
-changing the product name, revision number or specs. Some cards
-are also available in versions with different frontends for
-DVB-S/DVB-C/DVB-T. Thus the frontend drivers are listed separately.
-
-.. note::
-
-  #) There is no guarantee that every frontend driver works
-     out of the box with every card, because of different wiring.
-
-  #) The demodulator chips can be used with a variety of
-     tuner/PLL chips, and not all combinations are supported. Often
-     the demodulator and tuner/PLL chip are inside a metal box for
-     shielding, and the whole metal box has its own part number.
-
-
-- Frontends drivers:
-
-  - dvb_dummy_fe: for testing...
-
-  DVB-S:
-   - ves1x93		: Alps BSRV2 (ves1893 demodulator) and dbox2 (ves1993)
-   - cx24110		: Conexant HM1221/HM1811 (cx24110 or cx24106 demod, cx24108 PLL)
-   - grundig_29504-491	: Grundig 29504-491 (Philips TDA8083 demodulator), tsa5522 PLL
-   - mt312		: Zarlink mt312 or Mitel vp310 demodulator, sl1935 or tsa5059 PLLi, Technisat Sky2Pc with bios Rev. 2.3
-   - stv0299		: Alps BSRU6 (tsa5059 PLL), LG TDQB-S00x (tsa5059 PLL),
-			  LG TDQF-S001F (sl1935 PLL), Philips SU1278 (tua6100 PLL),
-			  Philips SU1278SH (tsa5059 PLL), Samsung TBMU24112IMB, Technisat Sky2Pc with bios Rev. 2.6
-
-  DVB-C:
-   - ves1820		: various (ves1820 demodulator, sp5659c or spXXXX PLL)
-   - at76c651		: Atmel AT76c651(B) with DAT7021 PLL
-
-  DVB-T:
-   - alps_tdlb7		: Alps TDLB7 (sp8870 demodulator, sp5659 PLL)
-   - alps_tdmb7		: Alps TDMB7 (cx22700 demodulator)
-   - grundig_29504-401	: Grundig 29504-401 (LSI L64781 demodulator), tsa5060 PLL
-   - tda1004x		: Philips tda10045h (td1344 or tdm1316l PLL)
-   - nxt6000 		: Alps TDME7 (MITEL SP5659 PLL), Alps TDED4 (TI ALP510 PLL), Comtech DVBT-6k07 (SP5730 PLL), (NxtWave Communications NXT6000 demodulator)
-   - sp887x		: Microtune 7202D
-   - dib3000mb	: DiBcom 3000-MB demodulator
-
-  DVB-S/C/T:
-   - dst		: TwinHan DST Frontend
-
-  ATSC:
-   - nxt200x		: Nxtwave NXT2002 & NXT2004
-   - or51211		: or51211 based (pcHDTV HD2000 card)
-   - or51132		: or51132 based (pcHDTV HD3000 card)
-   - bcm3510		: Broadcom BCM3510
-   - lgdt330x		: LG Electronics DT3302 & DT3303
-
-
-- Cards based on the Phillips saa7146 multimedia PCI bridge chip:
-
-  - TI AV7110 based cards (i.e. with hardware MPEG decoder):
-    - Siemens/Technotrend/Hauppauge PCI DVB card revision 1.1, 1.3, 1.5, 1.6, 2.1 (aka Hauppauge Nexus)
-  - "budget" cards (i.e. without hardware MPEG decoder):
-    - Technotrend Budget / Hauppauge WinTV-Nova PCI Cards
-    - SATELCO Multimedia PCI
-    - KNC1 DVB-S, Typhoon DVB-S, Terratec Cinergy 1200 DVB-S (no CI support)
-    - Typhoon DVB-S budget
-    - Fujitsu-Siemens Activy DVB-S budget card
-
-- Cards based on the B2C2 Inc. FlexCopII/IIb/III:
-
-  - Technisat SkyStar2 PCI DVB card revision 2.3, 2.6B, 2.6C
-
-- Cards based on the Conexant Bt8xx PCI bridge:
-
-  - Pinnacle PCTV Sat DVB
-  - Nebula Electronics DigiTV
-  - TwinHan DST
-  - Avermedia DVB-T
-  - ChainTech digitop DST-1000 DVB-S
-  - pcHDTV HD-2000 TV
-  - DViCO FusionHDTV DVB-T Lite
-  - DViCO FusionHDTV5 Lite
-
-- Technotrend / Hauppauge DVB USB devices:
-
-  - Nova USB
-  - DEC 2000-T, 3000-S, 2540-T
-
-- DiBcom DVB-T USB based devices:
-
-  - Twinhan VisionPlus VisionDTV USB-Ter DVB-T Device
-  - HAMA DVB-T USB device
-  - CTS Portable (Chinese Television System)
-  - KWorld V-Stream XPERT DTV DVB-T USB
-  - JetWay DTV DVB-T USB
-  - ADSTech Instant TV DVB-T USB
-  - Ultima Electronic/Artec T1 USB TVBOX (AN2135 and AN2235)
-  - Compro Videomate DVB-U2000 - DVB-T USB
-  - Grandtec USB DVB-T
-  - Avermedia AverTV DVBT USB
-  - DiBcom USB DVB-T reference device (non-public)
-  - Yakumo DVB-T mobile USB2.0
-  - DiBcom USB2.0 DVB-T reference device (non-public)
-
-- Experimental support for the analog module of the Siemens DVB-C PCI card
-
-- Cards based on the Conexant cx2388x PCI bridge:
-
-  - ADS Tech Instant TV DVB-T PCI
-  - ATI HDTV Wonder
-  - digitalnow DNTV Live! DVB-T
-  - DViCO FusionHDTV DVB-T1
-  - DViCO FusionHDTV DVB-T Plus
-  - DViCO FusionHDTV3 Gold-Q
-  - DViCO FusionHDTV3 Gold-T
-  - DViCO FusionHDTV5 Gold
-  - Hauppauge Nova-T DVB-T
-  - KWorld/VStream XPert DVB-T
-  - pcHDTV HD3000 HDTV
-  - TerraTec Cinergy 1400 DVB-T
-  - WinFast DTV1000-T
-
-- Cards based on the Phillips saa7134 PCI bridge:
-
-  - Medion 7134
-  - Pinnacle PCTV 300i DVB-T + PAL
-  - LifeView FlyDVB-T DUO
-  - Typhoon DVB-T Duo Digital/Analog Cardbus
-  - Philips TOUGH DVB-T reference design
-  - Philips EUROPA V3 reference design
-  - Compro Videomate DVB-T300
-  - Compro Videomate DVB-T200
-  - AVerMedia AVerTVHD MCE A180
-  - KWorld PC150-U ATSC Hybrid
-
diff --git a/Documentation/admin-guide/media/frontend-cardlist.rst b/Documentation/admin-guide/media/frontend-cardlist.rst
new file mode 100644
index 000000000000..670272982429
--- /dev/null
+++ b/Documentation/admin-guide/media/frontend-cardlist.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Frontend drivers
+================
+
+.. note::
+
+  #) There is no guarantee that every frontend driver works
+     out of the box with every card, because of different wiring.
+
+  #) The demodulator chips can be used with a variety of
+     tuner/PLL chips, and not all combinations are supported. Often
+     the demodulator and tuner/PLL chip are inside a metal box for
+     shielding, and the whole metal box has its own part number.
+
+  - dvb_dummy_fe: for testing...
+
+  DVB-S:
+   - ves1x93		: Alps BSRV2 (ves1893 demodulator) and dbox2 (ves1993)
+   - cx24110		: Conexant HM1221/HM1811 (cx24110 or cx24106 demod, cx24108 PLL)
+   - grundig_29504-491	: Grundig 29504-491 (Philips TDA8083 demodulator), tsa5522 PLL
+   - mt312		: Zarlink mt312 or Mitel vp310 demodulator, sl1935 or tsa5059 PLLi, Technisat Sky2Pc with bios Rev. 2.3
+   - stv0299		: Alps BSRU6 (tsa5059 PLL), LG TDQB-S00x (tsa5059 PLL),
+			  LG TDQF-S001F (sl1935 PLL), Philips SU1278 (tua6100 PLL),
+			  Philips SU1278SH (tsa5059 PLL), Samsung TBMU24112IMB, Technisat Sky2Pc with bios Rev. 2.6
+
+  DVB-C:
+   - ves1820		: various (ves1820 demodulator, sp5659c or spXXXX PLL)
+   - at76c651		: Atmel AT76c651(B) with DAT7021 PLL
+
+  DVB-T:
+   - alps_tdlb7		: Alps TDLB7 (sp8870 demodulator, sp5659 PLL)
+   - alps_tdmb7		: Alps TDMB7 (cx22700 demodulator)
+   - grundig_29504-401	: Grundig 29504-401 (LSI L64781 demodulator), tsa5060 PLL
+   - tda1004x		: Philips tda10045h (td1344 or tdm1316l PLL)
+   - nxt6000 		: Alps TDME7 (MITEL SP5659 PLL), Alps TDED4 (TI ALP510 PLL), Comtech DVBT-6k07 (SP5730 PLL), (NxtWave Communications NXT6000 demodulator)
+   - sp887x		: Microtune 7202D
+   - dib3000mb	: DiBcom 3000-MB demodulator
+
+  DVB-S/C/T:
+   - dst		: TwinHan DST Frontend
+
+  ATSC:
+   - nxt200x		: Nxtwave NXT2002 & NXT2004
+   - or51211		: or51211 based (pcHDTV HD2000 card)
+   - or51132		: or51132 based (pcHDTV HD3000 card)
+   - bcm3510		: Broadcom BCM3510
+   - lgdt330x		: LG Electronics DT3302 & DT3303
diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index ecaf28effa6a..dbe36e427e6b 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -83,7 +83,6 @@ Linux Digital TV driver-specific documentation
 	faq
 	dvb_references
 
-	cards
 	avermedia
 	bt8xx
 	lmedm04
diff --git a/Documentation/admin-guide/media/other-pci-cardlist.rst b/Documentation/admin-guide/media/other-pci-cardlist.rst
new file mode 100644
index 000000000000..5ae65547add0
--- /dev/null
+++ b/Documentation/admin-guide/media/other-pci-cardlist.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Other PCI Hardware supported by media subsystem
+===============================================
+
+Generally, media hardware manufacturers frequently change the ancillary
+drivers, like tuners and demodulator units used, usually without
+changing the product name, revision number or specs.
+
+- Cards based on the Phillips saa7146 multimedia PCI bridge chip:
+
+  - TI AV7110 based cards (i.e. with hardware MPEG decoder):
+    - Siemens/Technotrend/Hauppauge PCI DVB card revision 1.1, 1.3, 1.5, 1.6, 2.1 (aka Hauppauge Nexus)
+  - "budget" cards (i.e. without hardware MPEG decoder):
+    - Technotrend Budget / Hauppauge WinTV-Nova PCI Cards
+    - SATELCO Multimedia PCI
+    - KNC1 DVB-S, Typhoon DVB-S, Terratec Cinergy 1200 DVB-S (no CI support)
+    - Typhoon DVB-S budget
+    - Fujitsu-Siemens Activy DVB-S budget card
+
+- Cards based on the B2C2 Inc. FlexCopII/IIb/III:
+
+  - Technisat SkyStar2 PCI DVB card revision 2.3, 2.6B, 2.6C
+
+- Experimental support for the analog module of the Siemens DVB-C PCI card
-- 
2.25.2

