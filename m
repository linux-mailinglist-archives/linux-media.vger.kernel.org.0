Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F36A1AE2E9
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgDQQ7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727883AbgDQQ7D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:03 -0400
Received: from mail.kernel.org (unknown [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A780A22243;
        Fri, 17 Apr 2020 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142742;
        bh=q1aFH2yg8yQ4lHb6FzuWc8HFOPMBqWp95odWD9p2Oo4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ra2kjrc9GrerjZt8YBGL8AHHlwPJihLL3FFrjmjWd7aDWT6RnSiFwAdUfaAQ1Ay/B
         6HYO8wDppkP7VjHlNHxMltpJlZlFL4Ur9O9Eb+acrKaxMvuITecm3aUHhCkFc5p8hf
         bWsKConBYVBLTSy72WGg3ePMautGZfBmTyzkJyX4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wLr-Aq; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 10/15] media: admin-guide: add dvb-usb-v2 card lists
Date:   Fri, 17 Apr 2020 18:58:51 +0200
Message-Id: <69fd5b1f1ce7969c1c0640a2639d07fd200441d8.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Include cardlist documentation for the sub-drivers supported by
dvb-usb-v2 core.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  | 15 ++++
 .../media/dvb-usb-af9015-cardlist.rst         | 80 +++++++++++++++++++
 .../media/dvb-usb-af9035-cardlist.rst         | 74 +++++++++++++++++
 .../media/dvb-usb-anysee-cardlist.rst         | 16 ++++
 .../media/dvb-usb-au6610-cardlist.rst         | 16 ++++
 .../media/dvb-usb-az6007-cardlist.rst         | 20 +++++
 .../media/dvb-usb-ce6230-cardlist.rst         | 18 +++++
 .../media/dvb-usb-dvbsky-cardlist.rst         | 42 ++++++++++
 .../media/dvb-usb-ec168-cardlist.rst          | 16 ++++
 .../media/dvb-usb-gl861-cardlist.rst          | 20 +++++
 .../media/dvb-usb-lmedm04-cardlist.rst        | 20 +++++
 .../media/dvb-usb-mxl111sf-cardlist.rst       | 36 +++++++++
 .../media/dvb-usb-rtl28xxu-cardlist.rst       | 80 +++++++++++++++++++
 .../media/dvb-usb-zd1301-cardlist.rst         | 16 ++++
 14 files changed, 469 insertions(+)
 create mode 100644 Documentation/admin-guide/media/dvb-usb-af9015-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-af9035-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-anysee-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-au6610-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-az6007-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-ce6230-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-ec168-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-gl861-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-lmedm04-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-mxl111sf-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-rtl28xxu-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-zd1301-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index f469bd759bea..9317c033bc82 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -55,6 +55,21 @@ settings for an specific product type.
 	usbvision-cardlist
 	gspca-cardlist
 
+	dvb-usb-af9015-cardlist
+	dvb-usb-af9035-cardlist
+	dvb-usb-anysee-cardlist
+	dvb-usb-au6610-cardlist
+	dvb-usb-az6007-cardlist
+	dvb-usb-ce6230-cardlist
+	dvb-usb-dib0700-cardlist
+	dvb-usb-dvbsky-cardlist
+	dvb-usb-ec168-cardlist
+	dvb-usb-gl861-cardlist
+	dvb-usb-lmedm04-cardlist
+	dvb-usb-mxl111sf-cardlist
+	dvb-usb-rtl28xxu-cardlist
+	dvb-usb-zd1301-cardlist
+
 PCI drivers
 ===========
 
diff --git a/Documentation/admin-guide/media/dvb-usb-af9015-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-af9015-cardlist.rst
new file mode 100644
index 000000000000..c557994f796a
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-af9015-cardlist.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-af9015 cards list
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
+   * - AVerMedia A309
+     - 07ca:a309
+   * - AVerMedia AVerTV DVB-T Volar X
+     - 07ca:a815
+   * - Afatech AF9015 reference design
+     - 15a4:9015, 15a4:9016
+   * - AverMedia AVerTV Red HD+ (A850T)
+     - 07ca:850b
+   * - AverMedia AVerTV Volar Black HD (A850)
+     - 07ca:850a
+   * - AverMedia AVerTV Volar GPS 805 (A805)
+     - 07ca:a805
+   * - AverMedia AVerTV Volar M (A815Mac)
+     - 07ca:815a
+   * - Conceptronic USB2.0 DVB-T CTVDIGRCU V3.0
+     - 1b80:e397
+   * - DigitalNow TinyTwin
+     - 13d3:3226
+   * - DigitalNow TinyTwin v2
+     - 1b80:e402
+   * - DigitalNow TinyTwin v3
+     - 1f4d:9016
+   * - Fujitsu-Siemens Slim Mobile USB DVB-T
+     - 07ca:8150
+   * - Genius TVGo DVB-T03
+     - 0458:4012
+   * - KWorld Digital MC-810
+     - 1b80:c810
+   * - KWorld PlusTV DVB-T PCI Pro Card (DVB-T PC160-T)
+     - 1b80:c161
+   * - KWorld PlusTV Dual DVB-T PCI (DVB-T PC160-2T)
+     - 1b80:c160
+   * - KWorld PlusTV Dual DVB-T Stick (DVB-T 399U)
+     - 1b80:e399, 1b80:e400
+   * - KWorld USB DVB-T Stick Mobile (UB383-T)
+     - 1b80:e383
+   * - KWorld USB DVB-T TV Stick II (VS-DVB-T 395U)
+     - 1b80:e396, 1b80:e39b, 1b80:e395, 1b80:e39a
+   * - Leadtek WinFast DTV Dongle Gold
+     - 0413:6029
+   * - Leadtek WinFast DTV2000DS
+     - 0413:6a04
+   * - MSI DIGIVOX Duo
+     - 1462:8801
+   * - MSI Digi VOX mini III
+     - 1462:8807
+   * - Pinnacle PCTV 71e
+     - 2304:022b
+   * - Sveon STV20 Tuner USB DVB-T HDTV
+     - 1b80:e39d
+   * - Sveon STV22 Dual USB DVB-T Tuner HDTV
+     - 1b80:e401
+   * - Telestar Starstick 2
+     - 10b9:8000
+   * - TerraTec Cinergy T Stick Dual RC
+     - 0ccd:0099
+   * - TerraTec Cinergy T Stick RC
+     - 0ccd:0097
+   * - TerraTec Cinergy T USB XE
+     - 0ccd:0069
+   * - TrekStor DVB-T USB Stick
+     - 15a4:901b
+   * - TwinHan AzureWave AD-TU700(704J)
+     - 13d3:3237
+   * - Xtensions XD-380
+     - 1ae7:0381
diff --git a/Documentation/admin-guide/media/dvb-usb-af9035-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-af9035-cardlist.rst
new file mode 100644
index 000000000000..63e4170777c4
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-af9035-cardlist.rst
@@ -0,0 +1,74 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-af9035 cards list
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
+   * - AVerMedia AVerTV Volar HD/PRO (A835)
+     - 07ca:a835, 07ca:b835
+   * - AVerMedia HD Volar (A867)
+     - 07ca:1867, 07ca:a867, 07ca:0337
+   * - AVerMedia TD310 DVB-T2
+     - 07ca:1871
+   * - AVerMedia Twinstar (A825)
+     - 07ca:0825
+   * - Afatech AF9035 reference design
+     - 15a4:9035, 15a4:1000, 15a4:1001, 15a4:1002, 15a4:1003
+   * - Asus U3100Mini Plus
+     - 0b05:1779
+   * - Avermedia A835B(1835)
+     - 07ca:1835
+   * - Avermedia A835B(2835)
+     - 07ca:2835
+   * - Avermedia A835B(3835)
+     - 07ca:3835
+   * - Avermedia A835B(4835)
+     - 07ca:4835
+   * - Avermedia AverTV Volar HD 2 (TD110)
+     - 07ca:a110
+   * - Avermedia H335
+     - 07ca:0335
+   * - Digital Dual TV Receiver CTVDIGDUAL_V2
+     - 1b80:e410
+   * - EVOLVEO XtraTV stick
+     - 1f4d:a115
+   * - Hauppauge WinTV-MiniStick 2
+     - 2040:f900
+   * - ITE 9135 Generic
+     - 048d:9135
+   * - ITE 9135(9005) Generic
+     - 048d:9005
+   * - ITE 9135(9006) Generic
+     - 048d:9006
+   * - ITE 9303 Generic
+     - 048d:9306
+   * - Kworld UB499-2T T09
+     - 1b80:e409
+   * - Leadtek WinFast DTV Dongle Dual
+     - 0413:6a05
+   * - Logilink VG0022A
+     - 1d19:0100
+   * - PCTV AndroiDTV (78e)
+     - 2013:025a
+   * - PCTV microStick (79e)
+     - 2013:0262
+   * - Sveon STV22 Dual DVB-T HDTV
+     - 1b80:e411
+   * - TerraTec Cinergy T Stick
+     - 0ccd:0093
+   * - TerraTec Cinergy T Stick (rev. 2)
+     - 0ccd:00aa
+   * - TerraTec Cinergy T Stick Dual RC (rev. 2)
+     - 0ccd:0099
+   * - TerraTec Cinergy TC2 Stick
+     - 0ccd:10b2
+   * - TerraTec T1
+     - 0ccd:10ae
diff --git a/Documentation/admin-guide/media/dvb-usb-anysee-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-anysee-cardlist.rst
new file mode 100644
index 000000000000..1fb5d22a00dc
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-anysee-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-anysee cards list
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
+   * - Anysee
+     - 04b4:861f, 1c73:861f
diff --git a/Documentation/admin-guide/media/dvb-usb-au6610-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-au6610-cardlist.rst
new file mode 100644
index 000000000000..02b2b742710b
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-au6610-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-au6610 cards list
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
+   * - Sigmatek DVB-110
+     - 058f:6610
diff --git a/Documentation/admin-guide/media/dvb-usb-az6007-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-az6007-cardlist.rst
new file mode 100644
index 000000000000..db27eb47cc8f
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-az6007-cardlist.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-az6007 cards list
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
+   * - Azurewave 6007
+     - 13d3:0ccd
+   * - Technisat CableStar Combo HD CI
+     - 14f7:0003
+   * - Terratec H7
+     - 0ccd:10b4, 0ccd:10a3
diff --git a/Documentation/admin-guide/media/dvb-usb-ce6230-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-ce6230-cardlist.rst
new file mode 100644
index 000000000000..09750e8ac139
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-ce6230-cardlist.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-ce6230 cards list
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
+   * - AVerMedia A310 USB 2.0 DVB-T tuner
+     - 07ca:a310
+   * - Intel CE9500 reference design
+     - 8086:9500
diff --git a/Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst
new file mode 100644
index 000000000000..4fb4ce56df7c
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-dvbsky cards list
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
+   * - DVBSky S960/S860
+     - 0572:6831
+   * - DVBSky S960CI
+     - 0572:960c
+   * - DVBSky T330
+     - 0572:0320
+   * - DVBSky T680CI
+     - 0572:680c
+   * - MyGica Mini DVB-T2 USB Stick T230
+     - 0572:c688
+   * - MyGica Mini DVB-T2 USB Stick T230C
+     - 0572:c689
+   * - MyGica Mini DVB-T2 USB Stick T230C Lite
+     - 0572:c699
+   * - MyGica Mini DVB-T2 USB Stick T230C v2
+     - 0572:c68a
+   * - TechnoTrend TT-connect CT2-4650 CI
+     - 0b48:3012
+   * - TechnoTrend TT-connect CT2-4650 CI v1.1
+     - 0b48:3015
+   * - TechnoTrend TT-connect S2-4650 CI
+     - 0b48:3017
+   * - TechnoTrend TVStick CT2-4400
+     - 0b48:3014
+   * - Terratec Cinergy S2 Rev.4
+     - 0ccd:0105
+   * - Terratec H7 Rev.4
+     - 0ccd:10a5
diff --git a/Documentation/admin-guide/media/dvb-usb-ec168-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-ec168-cardlist.rst
new file mode 100644
index 000000000000..a3660dfa5dcc
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-ec168-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-ec168 cards list
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
+   * - E3C EC168 reference design
+     - 18b4:1689, 18b4:fffa, 18b4:fffb, 18b4:1001, 18b4:1002
diff --git a/Documentation/admin-guide/media/dvb-usb-gl861-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-gl861-cardlist.rst
new file mode 100644
index 000000000000..5ec62fe03d64
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-gl861-cardlist.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-gl861 cards list
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
+   * - 774 Friio White ISDB-T USB2.0
+     - 7a69:0001
+   * - A-LINK DTU DVB-T USB2.0
+     - 05e3:f170
+   * - MSI Mega Sky 55801 DVB-T USB2.0
+     - 0db0:5581
diff --git a/Documentation/admin-guide/media/dvb-usb-lmedm04-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-lmedm04-cardlist.rst
new file mode 100644
index 000000000000..2050fbf03d4a
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-lmedm04-cardlist.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-lmedm04 cards list
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
+   * - DM04_LME2510C_DVB-S
+     - 3344:1120
+   * - DM04_LME2510C_DVB-S RS2000
+     - 3344:22f0
+   * - DM04_LME2510_DVB-S
+     - 3344:1122
diff --git a/Documentation/admin-guide/media/dvb-usb-mxl111sf-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-mxl111sf-cardlist.rst
new file mode 100644
index 000000000000..6974801c43b6
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-mxl111sf-cardlist.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-mxl111sf cards list
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
+   * - HCW 117xxx
+     - 2040:b702
+   * - HCW 126xxx
+     - 2040:c602, 2040:c60a
+   * - Hauppauge 117xxx ATSC+
+     - 2040:b700, 2040:b703, 2040:b753, 2040:b763, 2040:b757, 2040:b767
+   * - Hauppauge 117xxx DVBT
+     - 2040:b704, 2040:b764
+   * - Hauppauge 126xxx
+     - 2040:c612, 2040:c61a
+   * - Hauppauge 126xxx ATSC
+     - 2040:c601, 2040:c609, 2040:b701
+   * - Hauppauge 126xxx ATSC+
+     - 2040:c600, 2040:c603, 2040:c60b, 2040:c653, 2040:c65b
+   * - Hauppauge 126xxx DVBT
+     - 2040:c604, 2040:c60c
+   * - Hauppauge 138xxx DVBT
+     - 2040:d854, 2040:d864, 2040:d8d4, 2040:d8e4
+   * - Hauppauge Mercury
+     - 2040:d853, 2040:d863, 2040:d8d3, 2040:d8e3, 2040:d8ff
+   * - Hauppauge WinTV-Aero-M
+     - 2040:c613, 2040:c61b
diff --git a/Documentation/admin-guide/media/dvb-usb-rtl28xxu-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-rtl28xxu-cardlist.rst
new file mode 100644
index 000000000000..9f4295331a15
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-rtl28xxu-cardlist.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-rtl28xxu cards list
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
+   * - ASUS My Cinema-U3100Mini Plus V2
+     - 1b80:d3a8
+   * - Astrometa DVB-T2
+     - 15f4:0131
+   * - Compro VideoMate U620F
+     - 185b:0620
+   * - Compro VideoMate U650F
+     - 185b:0650
+   * - Crypto ReDi PC 50 A
+     - 1f4d:a803
+   * - Dexatek DK DVB-T Dongle
+     - 1d19:1101
+   * - Dexatek DK mini DVB-T Dongle
+     - 1d19:1102
+   * - DigitalNow Quad DVB-T Receiver
+     - 0413:6680
+   * - Freecom USB2.0 DVB-T
+     - 14aa:0160, 14aa:0161
+   * - G-Tek Electronics Group Lifeview LV5TDLX DVB-T
+     - 1f4d:b803
+   * - GIGABYTE U7300
+     - 1b80:d393
+   * - Genius TVGo DVB-T03
+     - 0458:707f
+   * - GoTView MasterHD 3
+     - 5654:ca42
+   * - Leadtek WinFast DTV Dongle mini
+     - 0413:6a03
+   * - Leadtek WinFast DTV2000DS Plus
+     - 0413:6f12
+   * - Leadtek Winfast DTV Dongle Mini D
+     - 0413:6f0f
+   * - MSI DIGIVOX Micro HD
+     - 1d19:1104
+   * - MaxMedia HU394-T
+     - 1b80:d394
+   * - PROlectrix DV107669
+     - 1f4d:d803
+   * - Peak DVB-T USB
+     - 1b80:d395
+   * - Realtek RTL2831U reference design
+     - 0bda:2831
+   * - Realtek RTL2832U reference design
+     - 0bda:2832, 0bda:2838
+   * - Sveon STV20
+     - 1b80:d39d
+   * - Sveon STV21
+     - 1b80:d3b0
+   * - Sveon STV27
+     - 1b80:d3af
+   * - TURBO-X Pure TV Tuner DTT-2000
+     - 1b80:d3a4
+   * - TerraTec Cinergy T Stick Black
+     - 0ccd:00a9
+   * - TerraTec Cinergy T Stick RC (Rev. 3)
+     - 0ccd:00d3
+   * - TerraTec Cinergy T Stick+
+     - 0ccd:00d7
+   * - TerraTec NOXON DAB Stick
+     - 0ccd:00b3
+   * - TerraTec NOXON DAB Stick (rev 2)
+     - 0ccd:00e0
+   * - TerraTec NOXON DAB Stick (rev 3)
+     - 0ccd:00b4
+   * - Trekstor DVB-T Stick Terres 2.0
+     - 1f4d:C803
diff --git a/Documentation/admin-guide/media/dvb-usb-zd1301-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-zd1301-cardlist.rst
new file mode 100644
index 000000000000..9ca446184753
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-zd1301-cardlist.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-zd1301 cards list
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
+   * - ZyDAS ZD1301 reference design
+     - 0ace:13a1
-- 
2.25.2

