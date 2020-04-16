Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453A61ABF85
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506433AbgDPLhK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:37:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:38606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506442AbgDPLhC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:37:02 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 903E4221EB;
        Thu, 16 Apr 2020 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587037017;
        bh=jgEdbK8DASFi1sv+19D91lmZPgew0tzIufTfc/IJwEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yXKL/8X15UyAc0yIeqCDmtNk4MZ429zK/6rhPyZe1qK6Hpu/8Dd/jV9kuegmGTvHr
         S2kX1M65LvaNhRBYRJYPdaPYKb2+HKfYt+ns7RnLzLGB7fVSQ6E6CgKCYvrkc2PGdY
         gcZDK6xNDJaPsFLXfzk4Qb8exd3sOr76Z/FRgnu4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jP2pD-007SZB-1j; Thu, 16 Apr 2020 13:36:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 1/4] media: admin-guide: add a card list for cx231xx boards
Date:   Thu, 16 Apr 2020 13:36:50 +0200
Message-Id: <dc1e9d8055a910394428de23086c80dbb5cc3316.1587036920.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587036920.git.mchehab+huawei@kernel.org>
References: <cover.1587036920.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is interesting to have a card list also for cx231xx
driver, as it currently supports 27 different boards.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  |  1 +
 .../admin-guide/media/cx231xx-cardlist.rst    | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 Documentation/admin-guide/media/cx231xx-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 5c9c3c97bcb2..527188ee9697 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -9,6 +9,7 @@ Cards List
 	au0828-cardlist
 	bttv-cardlist
 	cx18-cardlist
+	cx231xx-cardlist
 	cx23885-cardlist
 	cx88-cardlist
 	em28xx-cardlist
diff --git a/Documentation/admin-guide/media/cx231xx-cardlist.rst b/Documentation/admin-guide/media/cx231xx-cardlist.rst
new file mode 100644
index 000000000000..d374101be047
--- /dev/null
+++ b/Documentation/admin-guide/media/cx231xx-cardlist.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+cx231xx cards list
+==================
+
+.. tabularcolumns:: |p{1.4cm}|p{10.0cm}|p{6.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 2 12 19
+   :stub-columns: 0
+
+   * - Card number
+     - Card name
+     - USB IDs
+   * - 0
+     - Unknown CX231xx video grabber
+     - 0572:5A3C
+   * - 1
+     - Conexant Hybrid TV - CARRAERA
+     - 0572:58A2
+   * - 2
+     - Conexant Hybrid TV - SHELBY
+     - 0572:58A1
+   * - 3
+     - Conexant Hybrid TV - RDE253S
+     - 0572:58A4
+   * - 4
+     - Conexant Hybrid TV - RDU253S
+     - 0572:58A5
+   * - 5
+     - Conexant VIDEO GRABBER
+     - 0572:58A6, 07ca:c039
+   * - 6
+     - Conexant Hybrid TV - rde 250
+     - 0572:589E
+   * - 7
+     - Conexant Hybrid TV - RDU 250
+     - 0572:58A0
+   * - 8
+     - Hauppauge EXETER
+     - 2040:b120, 2040:b140
+   * - 9
+     - Hauppauge USB Live 2
+     - 2040:c200
+   * - 10
+     - Pixelview PlayTV USB Hybrid
+     - 4000:4001
+   * - 11
+     - Pixelview Xcapture USB
+     - 1D19:6109, 4000:4001
+   * - 12
+     - Kworld UB430 USB Hybrid
+     - 1b80:e424
+   * - 13
+     - Iconbit Analog Stick U100 FM
+     - 1f4d:0237
+   * - 14
+     - Hauppauge WinTV USB2 FM (PAL)
+     - 2040:b110
+   * - 15
+     - Hauppauge WinTV USB2 FM (NTSC)
+     - 2040:b111
+   * - 16
+     - Elgato Video Capture V2
+     - 0fd9:0037
+   * - 17
+     - Geniatech OTG102
+     - 1f4d:0102
+   * - 18
+     - Kworld UB445 USB Hybrid
+     - 1b80:e421
+   * - 19
+     - Hauppauge WinTV 930C-HD (1113xx) / HVR-900H (111xxx) / PCTV QuatroStick 521e
+     - 2040:b130, 2040:b138, 2013:0259
+   * - 20
+     - Hauppauge WinTV 930C-HD (1114xx) / HVR-901H (1114xx) / PCTV QuatroStick 522e
+     - 2040:b131, 2040:b139, 2013:025e
+   * - 21
+     - Hauppauge WinTV-HVR-955Q (111401)
+     - 2040:b123, 2040:b124
+   * - 22
+     - Terratec Grabby
+     - 1f4d:0102
+   * - 23
+     - Evromedia USB Full Hybrid Full HD
+     - 1b80:d3b2
+   * - 24
+     - Astrometa T2hybrid
+     - 15f4:0135
+   * - 25
+     - The Imaging Source DFG/USB2pro
+     - 199e:8002
+   * - 26
+     - Hauppauge WinTV-HVR-935C
+     - 2040:b151
+   * - 27
+     - Hauppauge WinTV-HVR-975
+     - 2040:b150
-- 
2.25.2

