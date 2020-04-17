Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B5C1AE2ED
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgDQQ7H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727874AbgDQQ7C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:02 -0400
Received: from mail.kernel.org (unknown [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A786B22276;
        Fri, 17 Apr 2020 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142741;
        bh=kgsL+DqgOjfXsdE3QJs66+XEvILbyNRXFe1sF1Zid+8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PxrMgHlb+nrQ7XW5w6T/VKdwDRSe45rYi/XBfpBYfCe2a4Y2FP+7xzRmafgf1jOEW
         QceaWb+x9pvwjgowQ2e5dsLheRMQdAgf5qIWBY0JvIWJxv016v3pw07Xij5ca9KUuT
         X0DWc70meaF992NIqMApO/q7mFAn65jIuMm3QYIg=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wLw-Bv; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 11/15] media: admin-guide: add cardlist for dib0700 driver
Date:   Fri, 17 Apr 2020 18:58:52 +0200
Message-Id: <ed731b5edd0d1d5f21245b859fd8f5127f29cc5c.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the cards supported by dib0700 driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  |   2 +
 .../media/dvb-usb-dib0700-cardlist.rst        | 162 ++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 9317c033bc82..c1c5530331a1 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -55,6 +55,8 @@ settings for an specific product type.
 	usbvision-cardlist
 	gspca-cardlist
 
+	dvb-usb-dib0700-cardlist
+
 	dvb-usb-af9015-cardlist
 	dvb-usb-af9035-cardlist
 	dvb-usb-anysee-cardlist
diff --git a/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
new file mode 100644
index 000000000000..4b76b6f1089b
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
@@ -0,0 +1,162 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-dib0700 cards list
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
+   * - ASUS My Cinema U3000 Mini DVBT Tuner
+     - 0b05:171f
+   * - ASUS My Cinema U3100 Mini DVBT Tuner
+     - 0b05:173f
+   * - AVerMedia AVerTV DVB-T Express
+     - 07ca:b568
+   * - AVerMedia AVerTV DVB-T Volar
+     - 07ca:a807, 07ca:b808
+   * - Artec T14BR DVB-T
+     - 05d8:810f
+   * - Asus My Cinema-U3000Hybrid
+     - 0b05:1736
+   * - Compro Videomate U500
+     - 185b:1e78, 185b:1e80
+   * - DiBcom NIM7090 reference design
+     - 10b8:1bb2
+   * - DiBcom NIM8096MD reference design
+     - 10b8:1fa8
+   * - DiBcom NIM9090MD reference design
+     - 10b8:2384
+   * - DiBcom STK7070P reference design
+     - 10b8:1ebc
+   * - DiBcom STK7070PD reference design
+     - 10b8:1ebe
+   * - DiBcom STK7700D reference design
+     - 10b8:1ef0
+   * - DiBcom STK7700P reference design
+     - 10b8:1e14, 10b8:1e78
+   * - DiBcom STK7770P reference design
+     - 10b8:1e80
+   * - DiBcom STK807xP reference design
+     - 10b8:1f90
+   * - DiBcom STK807xPVR reference design
+     - 10b8:1f98
+   * - DiBcom STK8096-PVR reference design
+     - 2013:1faa, 10b8:1faa
+   * - DiBcom STK8096GP reference design
+     - 10b8:1fa0
+   * - DiBcom STK9090M reference design
+     - 10b8:2383
+   * - DiBcom TFE7090PVR reference design
+     - 10b8:1bb4
+   * - DiBcom TFE7790P reference design
+     - 10b8:1e6e
+   * - DiBcom TFE8096P reference design
+     - 10b8:1f9C
+   * - Elgato EyeTV DTT
+     - 0fd9:0021
+   * - Elgato EyeTV DTT rev. 2
+     - 0fd9:003f
+   * - Elgato EyeTV Diversity
+     - 0fd9:0011
+   * - Elgato EyeTV Dtt Dlx PD378S
+     - 0fd9:0020
+   * - EvolutePC TVWay+
+     - 1e59:0002
+   * - Gigabyte U7000
+     - 1044:7001
+   * - Gigabyte U8000-RH
+     - 1044:7002
+   * - Hama DVB=T Hybrid USB Stick
+     - 147f:2758
+   * - Hauppauge ATSC MiniCard (B200)
+     - 2040:b200
+   * - Hauppauge ATSC MiniCard (B210)
+     - 2040:b210
+   * - Hauppauge Nova-T 500 Dual DVB-T
+     - 2040:9941, 2040:9950
+   * - Hauppauge Nova-T MyTV.t
+     - 2040:7080
+   * - Hauppauge Nova-T Stick
+     - 2040:7050, 2040:7060, 2040:7070
+   * - Hauppauge Nova-TD Stick (52009)
+     - 2040:5200
+   * - Hauppauge Nova-TD Stick/Elgato Eye-TV Diversity
+     - 2040:9580
+   * - Hauppauge Nova-TD-500 (84xxx)
+     - 2040:8400
+   * - Leadtek WinFast DTV Dongle H
+     - 0413:60f6
+   * - Leadtek Winfast DTV Dongle (STK7700P based)
+     - 0413:6f00, 0413:6f01
+   * - Medion CTX1921 DVB-T USB
+     - 1660:1921
+   * - Microsoft Xbox One Digital TV Tuner
+     - 045e:02d5
+   * - PCTV 2002e
+     - 2013:025c
+   * - PCTV 2002e SE
+     - 2013:025d
+   * - Pinnacle Expresscard 320cx
+     - 2304:022e
+   * - Pinnacle PCTV 2000e
+     - 2304:022c
+   * - Pinnacle PCTV 282e
+     - 2013:0248, 2304:0248
+   * - Pinnacle PCTV 340e HD Pro USB Stick
+     - 2304:023d
+   * - Pinnacle PCTV 72e
+     - 2304:0236
+   * - Pinnacle PCTV 73A
+     - 2304:0243
+   * - Pinnacle PCTV 73e
+     - 2304:0237
+   * - Pinnacle PCTV 73e SE
+     - 2013:0245, 2304:0245
+   * - Pinnacle PCTV DVB-T Flash Stick
+     - 2304:0228
+   * - Pinnacle PCTV Dual DVB-T Diversity Stick
+     - 2304:0229
+   * - Pinnacle PCTV HD Pro USB Stick
+     - 2304:023a
+   * - Pinnacle PCTV HD USB Stick
+     - 2304:023b
+   * - Pinnacle PCTV Hybrid Stick Solo
+     - 2304:023e
+   * - Prolink Pixelview SBTVD
+     - 1554:5010
+   * - Sony PlayTV
+     - 1415:0003
+   * - TechniSat AirStar TeleStick 2
+     - 14f7:0004
+   * - Terratec Cinergy DT USB XS Diversity/ T5
+     - 0ccd:0081, 0ccd:10a1
+   * - Terratec Cinergy DT XS Diversity
+     - 0ccd:005a
+   * - Terratec Cinergy HT Express
+     - 0ccd:0060
+   * - Terratec Cinergy HT USB XE
+     - 0ccd:0058
+   * - Terratec Cinergy T Express
+     - 0ccd:0062
+   * - Terratec Cinergy T USB XXS (HD)/ T3
+     - 0ccd:0078, 0ccd:10a0, 0ccd:00ab
+   * - Uniwill STK7700P based (Hama and others)
+     - 1584:6003
+   * - YUAN High-Tech DiBcom STK7700D
+     - 1164:1e8c
+   * - YUAN High-Tech MC770
+     - 1164:0871
+   * - YUAN High-Tech STK7700D
+     - 1164:1efc
+   * - YUAN High-Tech STK7700PH
+     - 1164:1f08
+   * - Yuan EC372S
+     - 1164:1edc
+   * - Yuan PD378S
+     - 1164:2edc
-- 
2.25.2

