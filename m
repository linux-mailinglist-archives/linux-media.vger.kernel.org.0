Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787741AE2F0
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbgDQQ7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:46114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726694AbgDQQ7B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B53DA2054F;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=UrL63n/nMfnYudN4rzsXwCxgGIz2Uc3lAckQleTKykk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lJmRgGkglVX0yEJERlgc+8Df6O0Zwe+1Jj0NmoaXHc8M1tb9BgjHh5OGbuL9URZgB
         HpNi1n0qowBQRbpL/e5DCOo1wVqMH3U3P119GjKAQt7QSGsGWnBQFqqjPTdp1bPEyJ
         n7aXo76fQ7/5rud+Km7/srPDrxF2hKXgj6dFoMj8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wMG-I1; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 15/15] media: admin-guide: add a cardlist for all other USB cards
Date:   Fri, 17 Apr 2020 18:58:56 +0200
Message-Id: <5a030e06f9a87a05dba8c28d672861f9f68a8b74.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several other USB cards. Most of them support just
one device. The only exception is the "pwc" driver. But, as
updates to it are not frequent, let's just place everything
manually into a single file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  |  2 +
 .../admin-guide/media/other-usb-cardlist.rst  | 92 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 Documentation/admin-guide/media/other-usb-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index e9fd26a55384..1a46df2a7bdb 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -95,6 +95,8 @@ settings for an specific product type.
 	dvb-usb-rtl28xxu-cardlist
 	dvb-usb-zd1301-cardlist
 
+	other-usb-cardlist
+
 PCI drivers
 ===========
 
diff --git a/Documentation/admin-guide/media/other-usb-cardlist.rst b/Documentation/admin-guide/media/other-usb-cardlist.rst
new file mode 100644
index 000000000000..bbfdb1389c18
--- /dev/null
+++ b/Documentation/admin-guide/media/other-usb-cardlist.rst
@@ -0,0 +1,92 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Other USB cards list
+====================
+
+================  ======================================  =====================
+Driver            Card name                               USB IDs
+================  ======================================  =====================
+airspy		  Airspy				  1d50:60a1
+dvb-as102	  Abilis Systems DVB-Titan		  1BA6:0001
+dvb-as102	  PCTV Systems picoStick (74e)		  2013:0246
+dvb-as102	  Elgato EyeTV DTT Deluxe		  0fd9:002c
+dvb-as102	  nBox DVB-T Dongle			  0b89:0007
+dvb-as102	  Sky IT Digital Key (green led)	  2137:0001
+b2c2-flexcop-usb  Technisat/B2C2 FlexCop II/IIb/III	  0af7:0101
+		  Digital TV
+cpia2		  Vision's CPiA2 cameras		  0553:0100, 0553:0140,
+		  such as the Digital Blue QX5		  0553:0151
+go7007		  WIS GO7007 MPEG encoder		  1943:a250, 093b:a002,
+							  093b:a004, 0eb1:6666,
+							  0eb1:6668
+hackrf		  HackRF Software Decoder Radio		  1d50:6089
+hdpvr		  Hauppauge HD PVR			  2040:4900, 2040:4901,
+							  2040:4902, 2040:4982,
+							  2040:4903
+msi2500		  Mirics MSi3101 SDR Dongle		  1df7:2500, 2040:d300
+pvrusb2		  Hauppauge WinTV-PVR USB2		  2040:2900, 2040:2950,
+							  2040:2400, 1164:0622,
+							  1164:0602, 11ba:1003,
+							  11ba:1001, 2040:7300,
+							  2040:7500, 2040:7501,
+							  0ccd:0039, 2040:7502,
+							  2040:7510
+pwc		  Creative Webcam 5			  041E:400C
+pwc		  Creative Webcam Pro Ex		  041E:4011
+pwc		  Logitech QuickCam 3000 Pro		  046D:08B0
+pwc		  Logitech QuickCam Notebook Pro	  046D:08B1
+pwc		  Logitech QuickCam 4000 Pro		  046D:08B2
+pwc		  Logitech QuickCam Zoom (old model)	  046D:08B3
+pwc		  Logitech QuickCam Zoom (new model)	  046D:08B4
+pwc		  Logitech QuickCam Orbit/Sphere	  046D:08B5
+pwc		  Logitech/Cisco VT Camera		  046D:08B6
+pwc		  Logitech ViewPort AV 100		  046D:08B7
+pwc		  Logitech QuickCam			  046D:08B8
+pwc		  Philips PCA645VC			  0471:0302
+pwc		  Philips PCA646VC			  0471:0303
+pwc		  Askey VC010 type 2			  0471:0304
+pwc		  Philips PCVC675K (Vesta)		  0471:0307
+pwc		  Philips PCVC680K (Vesta Pro)		  0471:0308
+pwc		  Philips PCVC690K (Vesta Pro Scan)	  0471:030C
+pwc		  Philips PCVC730K (ToUCam Fun),	  0471:0310
+		  PCVC830 (ToUCam II)
+pwc		  Philips PCVC740K (ToUCam Pro),	  0471:0311
+		  PCVC840 (ToUCam II)
+pwc		  Philips PCVC750K (ToUCam Pro Scan)	  0471:0312
+pwc		  Philips PCVC720K/40 (ToUCam XS)	  0471:0313
+pwc		  Philips SPC 900NC			  0471:0329
+pwc		  Philips SPC 880NC			  0471:032C
+pwc		  Sotec Afina Eye			  04CC:8116
+pwc		  Samsung MPC-C10			  055D:9000
+pwc		  Samsung MPC-C30			  055D:9001
+pwc		  Samsung SNC-35E (Ver3.0)		  055D:9002
+pwc		  Askey VC010 type 1			  069A:0001
+pwc		  AME Co. Afina Eye			  06BE:8116
+pwc		  Visionite VCS-UC300			  0d81:1900
+pwc		  Visionite VCS-UM100			  0d81:1910
+s2255drv	  Sensoray 2255				  1943:2255, 1943:2257
+stk1160		  STK1160 USB video capture dongle	  05e1:0408
+stkwebcam	  Syntek DC1125				  174f:a311, 05e1:0501
+dvb-ttusb-budget  Technotrend/Hauppauge Nova-USB devices  0b48:1003, 0b48:1004,
+							  0b48:1005
+dvb-ttusb_dec	  Technotrend/Hauppauge MPEG decoder	  0b48:1006
+		  DEC3000-s
+dvb-ttusb_dec	  Technotrend/Hauppauge MPEG decoder	  0b48:1007
+dvb-ttusb_dec	  Technotrend/Hauppauge MPEG decoder	  0b48:1008
+		  DEC2000-t
+dvb-ttusb_dec	  Technotrend/Hauppauge MPEG decoder
+		  DEC2540-t				  0b48:1009
+usbtv		  Fushicai USBTV007 Audio-Video Grabber	  1b71:3002, 1f71:3301,
+							  1f71:3306
+zr364xx		  USB ZR364XX Camera			  08ca:0109, 041e:4024,
+							  0d64:0108, 0546:3187,
+							  0d64:3108, 0595:4343,
+							  0bb0:500d, 0feb:2004,
+							  055f:b500, 08ca:2062,
+							  052b:1a18, 04c8:0729,
+							  04f2:a208, 0784:0040,
+							  06d6:0034, 0a17:0062,
+							  06d6:003b, 0a17:004e,
+							  041e:405d, 08ca:2102,
+							  06d6:003d
+================  ======================================  =====================
-- 
2.25.2

