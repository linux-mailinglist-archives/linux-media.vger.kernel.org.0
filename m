Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFE11AE2EA
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgDQQ7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727812AbgDQQ7C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:02 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE89A22247;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=ST0LVXj/FqCYOMYXD2ZyVBJskWgVwm1zBI/EJkjiIw8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B3pAqQ+D7rNUKSIscXnhvLeDjOCxToCuPfCFwG7hIjW9t+Qm12zQVciIET6xCoIJM
         ZKfpQFxf3Uosgdt1O7/D5vNOoEDoQj5NcsgKtvl6Guor6CcED2omkYYxqkwYEmKwis
         xB9Y4IhHasKD+aUzdPReQZc7RICwTIW/sBGDCXyw=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wM6-Eu; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 13/15] media: admin-guide: add support for the remaining dvb-usb boards
Date:   Fri, 17 Apr 2020 18:58:54 +0200
Message-Id: <d5b64c88ef014539977795e9043000ac72402273.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the remaining dvb-usb boards.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  | 21 +++++++-
 .../media/dvb-usb-a800-cardlist.rst           | 16 ++++++
 .../media/dvb-usb-af9005-cardlist.rst         | 20 +++++++
 .../media/dvb-usb-az6027-cardlist.rst         | 24 +++++++++
 .../media/dvb-usb-cinergyT2-cardlist.rst      | 16 ++++++
 .../media/dvb-usb-cxusb-cardlist.rst          | 40 ++++++++++++++
 .../media/dvb-usb-digitv-cardlist.rst         | 16 ++++++
 .../media/dvb-usb-dtt200u-cardlist.rst        | 22 ++++++++
 .../media/dvb-usb-dtv5100-cardlist.rst        | 16 ++++++
 .../media/dvb-usb-dw2102-cardlist.rst         | 52 +++++++++++++++++++
 .../media/dvb-usb-gp8psk-cardlist.rst         | 22 ++++++++
 .../media/dvb-usb-m920x-cardlist.rst          | 26 ++++++++++
 .../media/dvb-usb-nova-t-usb2-cardlist.rst    | 16 ++++++
 .../media/dvb-usb-opera1-cardlist.rst         | 16 ++++++
 .../media/dvb-usb-pctv452e-cardlist.rst       | 20 +++++++
 .../media/dvb-usb-technisat-usb2-cardlist.rst | 16 ++++++
 .../media/dvb-usb-ttusb2-cardlist.rst         | 24 +++++++++
 .../media/dvb-usb-umt-010-cardlist.rst        | 16 ++++++
 .../media/dvb-usb-vp702x-cardlist.rst         | 16 ++++++
 .../media/dvb-usb-vp7045-cardlist.rst         | 18 +++++++
 20 files changed, 432 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/media/dvb-usb-a800-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-af9005-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-az6027-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-cinergyT2-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-cxusb-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-digitv-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dtt200u-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dtv5100-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-gp8psk-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-m920x-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-nova-t-usb2-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-opera1-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-pctv452e-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-technisat-usb2-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-ttusb2-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-umt-010-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-vp702x-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-vp7045-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 2b8b158b889f..860a254d96c8 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -59,13 +59,32 @@ settings for an specific product type.
 	dvb-usb-dibusb-mb-cardlist
 	dvb-usb-dibusb-mc-cardlist
 
+	dvb-usb-a800-cardlist
+	dvb-usb-af9005-cardlist
+	dvb-usb-az6027-cardlist
+	dvb-usb-cinergyT2-cardlist
+	dvb-usb-cxusb-cardlist
+	dvb-usb-digitv-cardlist
+	dvb-usb-dtt200u-cardlist
+	dvb-usb-dtv5100-cardlist
+	dvb-usb-dw2102-cardlist
+	dvb-usb-gp8psk-cardlist
+	dvb-usb-m920x-cardlist
+	dvb-usb-nova-t-usb2-cardlist
+	dvb-usb-opera1-cardlist
+	dvb-usb-pctv452e-cardlist
+	dvb-usb-technisat-usb2-cardlist
+	dvb-usb-ttusb2-cardlist
+	dvb-usb-umt-010-cardlist
+	dvb-usb-vp702x-cardlist
+	dvb-usb-vp7045-cardlist
+
 	dvb-usb-af9015-cardlist
 	dvb-usb-af9035-cardlist
 	dvb-usb-anysee-cardlist
 	dvb-usb-au6610-cardlist
 	dvb-usb-az6007-cardlist
 	dvb-usb-ce6230-cardlist
-	dvb-usb-dib0700-cardlist
 	dvb-usb-dvbsky-cardlist
 	dvb-usb-ec168-cardlist
 	dvb-usb-gl861-cardlist
diff --git a/Documentation/admin-guide/media/dvb-usb-a800-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-a800-cardlist.rst
new file mode 100644
index 000000000000..2ec8bb8230ff
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-a800-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-a800 cards list
+=======================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - AVerMedia AverTV DVB-T USB 2.0 (A800)
+     - 07ca:a800, 07ca:a801
diff --git a/Documentation/admin-guide/media/dvb-usb-af9005-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-af9005-cardlist.rst
new file mode 100644
index 000000000000..285160ee82e8
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-af9005-cardlist.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-af9005 cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Afatech DVB-T USB1.1 stick
+     - 15a4:9020
+   * - Ansonic DVB-T USB1.1 stick
+     - 10b9:6000
+   * - TerraTec Cinergy T USB XE
+     - 0ccd:0055
diff --git a/Documentation/admin-guide/media/dvb-usb-az6027-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-az6027-cardlist.rst
new file mode 100644
index 000000000000..6d8575e9d90c
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-az6027-cardlist.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-az6027 cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - AZUREWAVE DVB-S/S2 USB2.0 (AZ6027)
+     - 13d3:3275
+   * - Elgato EyeTV Sat
+     - 0fd9:002a, 0fd9:0025, 0fd9:0036
+   * - TERRATEC S7
+     - 0ccd:10a4
+   * - TERRATEC S7 MKII
+     - 0ccd:10ac
+   * - Technisat SkyStar USB 2 HD CI
+     - 14f7:0001, 14f7:0002
diff --git a/Documentation/admin-guide/media/dvb-usb-cinergyT2-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-cinergyT2-cardlist.rst
new file mode 100644
index 000000000000..0ee753929eca
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-cinergyT2-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-cinergyT2 cards list
+============================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - TerraTec/qanu USB2.0 Highspeed DVB-T Receiver
+     - 0ccd:0x0038
diff --git a/Documentation/admin-guide/media/dvb-usb-cxusb-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-cxusb-cardlist.rst
new file mode 100644
index 000000000000..a73f15d1acf5
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-cxusb-cardlist.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-cxusb cards list
+========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - AVerMedia AVerTVHD Volar (A868R)
+     -
+   * - Conexant DMB-TH Stick
+     -
+   * - DViCO FusionHDTV DVB-T Dual Digital 2
+     -
+   * - DViCO FusionHDTV DVB-T Dual Digital 4
+     -
+   * - DViCO FusionHDTV DVB-T Dual Digital 4 (rev 2)
+     -
+   * - DViCO FusionHDTV DVB-T Dual USB
+     -
+   * - DViCO FusionHDTV DVB-T NANO2
+     -
+   * - DViCO FusionHDTV DVB-T USB (LGZ201)
+     -
+   * - DViCO FusionHDTV DVB-T USB (TH7579)
+     -
+   * - DViCO FusionHDTV5 USB Gold
+     -
+   * - DigitalNow DVB-T Dual USB
+     -
+   * - Medion MD95700 (MDUSBTV-HYBRID)
+     -
+   * - Mygica D689 DMB-TH
+     -
diff --git a/Documentation/admin-guide/media/dvb-usb-digitv-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-digitv-cardlist.rst
new file mode 100644
index 000000000000..2b4d8325e8e9
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-digitv-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-digitv cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Nebula Electronics uDigiTV DVB-T USB2.0)
+     - 0547:0201
diff --git a/Documentation/admin-guide/media/dvb-usb-dtt200u-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dtt200u-cardlist.rst
new file mode 100644
index 000000000000..b4150a7bf31f
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-dtt200u-cardlist.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-dtt200u cards list
+==========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - WideView WT-220U PenType Receiver (Miglia)
+     - 18f3:0220
+   * - WideView WT-220U PenType Receiver (Typhoon/Freecom)
+     - 14aa:0222, 14aa:0220, 14aa:0221, 14aa:0225, 14aa:0226
+   * - WideView WT-220U PenType Receiver (based on ZL353)
+     - 14aa:022a, 14aa:022b
+   * - WideView/Yuan/Yakumo/Hama/Typhoon DVB-T USB2.0 (WT-200U)
+     - 14aa:0201, 14aa:0301
diff --git a/Documentation/admin-guide/media/dvb-usb-dtv5100-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dtv5100-cardlist.rst
new file mode 100644
index 000000000000..91d6e35e6f9d
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-dtv5100-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-dtv5100 cards list
+==========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - AME DTV-5100 USB2.0 DVB-T
+     - 0x06be:0xa232
diff --git a/Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst
new file mode 100644
index 000000000000..f01f9df1e249
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-dw2102 cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - DVBWorld DVB-C 3101 USB2.0
+     - 04b4:3101
+   * - DVBWorld DVB-S 2101 USB2.0
+     - 04b4:0x2101
+   * - DVBWorld DVB-S 2102 USB2.0
+     - 04b4:2102
+   * - DVBWorld DW2104 USB2.0
+     - 04b4:2104
+   * - GOTVIEW Satellite HD
+     - 0x1FE1:5456
+   * - Geniatech T220 DVB-T/T2 USB2.0
+     - 0x1f4d:0xD220
+   * - SU3000HD DVB-S USB2.0
+     - 0x1f4d:0x3000
+   * - TeVii S482 (tuner 1)
+     - 0x9022:0xd483
+   * - TeVii S482 (tuner 2)
+     - 0x9022:0xd484
+   * - TeVii S630 USB
+     - 0x9022:d630
+   * - TeVii S650 USB2.0
+     - 0x9022:d650
+   * - TeVii S662
+     - 0x9022:d662
+   * - TechnoTrend TT-connect S2-4600
+     - 0b48:3011
+   * - TerraTec Cinergy S USB
+     - 0ccd:0064
+   * - Terratec Cinergy S2 USB BOX
+     - 0ccd:0x0105
+   * - Terratec Cinergy S2 USB HD
+     - 0ccd:00a8
+   * - Terratec Cinergy S2 USB HD Rev.2
+     - 0ccd:00b0
+   * - Terratec Cinergy S2 USB HD Rev.3
+     - 0ccd:0102
+   * - X3M TV SPC1400HD PCI
+     - 0x1f4d:0x3100
diff --git a/Documentation/admin-guide/media/dvb-usb-gp8psk-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-gp8psk-cardlist.rst
new file mode 100644
index 000000000000..150fa9f7810a
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-gp8psk-cardlist.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-gp8psk cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Genpix 8PSK-to-USB2 Rev.1 DVB-S receiver
+     - 09c0:0200, 09c0:0201
+   * - Genpix 8PSK-to-USB2 Rev.2 DVB-S receiver
+     - 09c0:0202
+   * - Genpix SkyWalker-1 DVB-S receiver
+     - 09c0:0203
+   * - Genpix SkyWalker-2 DVB-S receiver
+     - 09c0:0206
diff --git a/Documentation/admin-guide/media/dvb-usb-m920x-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-m920x-cardlist.rst
new file mode 100644
index 000000000000..73145940b5c5
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-m920x-cardlist.rst
@@ -0,0 +1,26 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-m920x cards list
+========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - DTV-DVB UDTT7049
+     - 13d3:3219
+   * - Dposh DVB-T USB2.0
+     - 1498:9206, 1498:a090
+   * - LifeView TV Walker Twin DVB-T USB2.0
+     - 10fd:0514, 10fd:0513
+   * - MSI DIGI VOX mini II DVB-T USB2.0
+     - 10fd:1513
+   * - MSI Mega Sky 580 DVB-T USB2.0
+     - 0db0:5580
+   * - Pinnacle PCTV 310e
+     - 13d3:3211
diff --git a/Documentation/admin-guide/media/dvb-usb-nova-t-usb2-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-nova-t-usb2-cardlist.rst
new file mode 100644
index 000000000000..e295f912a585
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-nova-t-usb2-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-nova-t-usb2 cards list
+==============================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Hauppauge WinTV-NOVA-T usb2
+     - 2040:9300, 2040:9301
diff --git a/Documentation/admin-guide/media/dvb-usb-opera1-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-opera1-cardlist.rst
new file mode 100644
index 000000000000..362245f5a46a
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-opera1-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-opera1 cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Opera1 DVB-S USB2.0
+     - 04b4:2830, 695c:3829
diff --git a/Documentation/admin-guide/media/dvb-usb-pctv452e-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-pctv452e-cardlist.rst
new file mode 100644
index 000000000000..886d8cc18acb
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-pctv452e-cardlist.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-pctv452e cards list
+===========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - PCTV HDTV USB
+     - 2304:021f
+   * - Technotrend TT Connect S2-3600
+     - 0b48:3007
+   * - Technotrend TT Connect S2-3650-CI
+     - 0b48:300a
diff --git a/Documentation/admin-guide/media/dvb-usb-technisat-usb2-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-technisat-usb2-cardlist.rst
new file mode 100644
index 000000000000..30ee92ada134
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-technisat-usb2-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-technisat-usb2 cards list
+=================================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Technisat SkyStar USB HD (DVB-S/S2)
+     - 14f7:0500
diff --git a/Documentation/admin-guide/media/dvb-usb-ttusb2-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-ttusb2-cardlist.rst
new file mode 100644
index 000000000000..faa78e5f3f5d
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-ttusb2-cardlist.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-ttusb2 cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Pinnacle 400e DVB-S USB2.0
+     - 2304:020f
+   * - Pinnacle 450e DVB-S USB2.0
+     - 2304:0222
+   * - Technotrend TT-connect CT-3650
+     - 0b48:300d
+   * - Technotrend TT-connect S-2400
+     - 0b48:3006
+   * - Technotrend TT-connect S-2400 (8kB EEPROM)
+     - 0b48:3009
diff --git a/Documentation/admin-guide/media/dvb-usb-umt-010-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-umt-010-cardlist.rst
new file mode 100644
index 000000000000..ce7ce901b5ac
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-umt-010-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-umt-010 cards list
+==========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Hanftek UMT-010 DVB-T USB2.0
+     - 15f4:0001, 15f4:0015
diff --git a/Documentation/admin-guide/media/dvb-usb-vp702x-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-vp702x-cardlist.rst
new file mode 100644
index 000000000000..101442434268
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-vp702x-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-vp702x cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - TwinhanDTV StarBox DVB-S USB2.0 (VP7021)
+     - 13d3:3207
diff --git a/Documentation/admin-guide/media/dvb-usb-vp7045-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-vp7045-cardlist.rst
new file mode 100644
index 000000000000..2fc8fc4ecc32
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-vp7045-cardlist.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-vp7045 cards list
+=========================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - DigitalNow TinyUSB 2 DVB-t Receiver
+     - 13d3:3223, 13d3:3224
+   * - Twinhan USB2.0 DVB-T receiver (TwinhanDTV Alpha/MagicBox II)
+     - 13d3:3205, 13d3:3206
-- 
2.25.2

