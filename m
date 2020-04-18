Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A2E1AEB75
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgDRJoh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:44:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:57328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbgDRJoe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:44:34 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFAEA22245;
        Sat, 18 Apr 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587203073;
        bh=rEYUmceJmAylorTV7wxdDIp+HgR66n4L26PJm5r6pBA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N1oY8q9nmA4GlFIgSQjIKuwbb7tg6fzI89xiXgkMRd4pMSIOJc1zWPlVG64hatUrS
         /as0ZhmgKGresJ+2Ax7c4rV/9tb2vSX1xujw/nhpCY/OBz5GIpoH/psbQL1OlVJ8U+
         cZzU8DPQTVFlIutx5HA6lCX5jzQQipnEd5CtS98Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPk1W-0081Ny-6Z; Sat, 18 Apr 2020 11:44:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 3/9] media: admin-guide: add a list of media PCI cards
Date:   Sat, 18 Apr 2020 11:44:23 +0200
Message-Id: <fa2b8942a7072a7f8a7414b548fdd68530e784a7.1587202259.git.mchehab+huawei@kernel.org>
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

Instead of listing "other" PCI card list, just add a list with
the existing drivers (not including sub-drivers).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  | 50 ++++++++++++++++++-
 .../admin-guide/media/other-pci-cardlist.rst  | 25 ----------
 2 files changed, 48 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/other-pci-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 01d3290d7f77..93c3290ae9cc 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -116,6 +116,54 @@ So, several media drivers allow passing a ``card=`` parameter, in order
 to setup a card number that would match the correct settings for an
 specific board.
 
+The current supported PCI/PCIe cards (not including staging drivers) are
+listed below\ [#]_.
+
+.. [#] some of the drivers have sub-drivers, not shown at this table
+
+================  ========================================================
+Driver            Name
+================  ========================================================
+altera-ci         Altera FPGA based CI module
+b2c2-flexcop-pci  Technisat/B2C2 Air/Sky/Cable2PC PCI
+bt878             DVB/ATSC Support for bt878 based TV cards
+bttv              BT8x8 Video For Linux
+cobalt            Cisco Cobalt
+cx18              Conexant cx23418 MPEG encoder
+cx23885           Conexant cx23885 (2388x successor)
+cx25821           Conexant cx25821
+cx88xx            Conexant 2388x (bt878 successor)
+ddbridge          Digital Devices bridge
+dm1105            SDMC DM1105 based PCI cards
+dt3155            DT3155 frame grabber
+dvb-ttpci         AV7110 cards
+earth-pt1         PT1 cards
+earth-pt3         Earthsoft PT3 cards
+hexium_gemini     Hexium Gemini frame grabber
+hexium_orion      Hexium HV-PCI6 and Orion frame grabber
+hopper            HOPPER based cards
+ipu3-cio2         Intel ipu3-cio2 driver
+ivtv              Conexant cx23416/cx23415 MPEG encoder/decoder
+ivtvfb            Conexant cx23415 framebuffer
+mantis            MANTIS based cards
+meye              Sony Vaio Picturebook Motion Eye
+mxb               Siemens-Nixdorf 'Multimedia eXtension Board'
+netup-unidvb      NetUP Universal DVB card
+ngene             Micronas nGene
+pluto2            Pluto2 cards
+saa7134           Philips SAA7134
+saa7164           NXP SAA7164
+smipcie           SMI PCIe DVBSky cards
+solo6x10          Bluecherry / Softlogic 6x10 capture cards (MPEG-4/H.264)
+sta2x11_vip       STA2X11 VIP Video For Linux
+tw5864            Techwell TW5864 video/audio grabber and encoder
+tw686x            Intersil/Techwell TW686x
+tw68              Techwell tw68x Video For Linux
+================  ========================================================
+
+Some of those drivers support multiple devices, as shown at the card
+lists below:
+
 .. toctree::
 	:maxdepth: 1
 
@@ -127,8 +175,6 @@ specific board.
 	saa7134-cardlist
 	saa7164-cardlist
 
-	other-pci-cardlist
-
 I²C drivers
 ===========
 
diff --git a/Documentation/admin-guide/media/other-pci-cardlist.rst b/Documentation/admin-guide/media/other-pci-cardlist.rst
deleted file mode 100644
index 5ae65547add0..000000000000
--- a/Documentation/admin-guide/media/other-pci-cardlist.rst
+++ /dev/null
@@ -1,25 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-Other PCI Hardware supported by media subsystem
-===============================================
-
-Generally, media hardware manufacturers frequently change the ancillary
-drivers, like tuners and demodulator units used, usually without
-changing the product name, revision number or specs.
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
-- Experimental support for the analog module of the Siemens DVB-C PCI card
-- 
2.25.2

