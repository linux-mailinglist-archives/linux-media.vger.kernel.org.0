Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9849B17FF23
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgCJNnT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:37668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbgCJNnT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C51724697;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=haisXx7Fkzh8TLhrGRECQWNhHUxca5nMU7XrwHj6PW0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ICPNSTIeCkHDIldBa3n2osVmMKjH5bg6XMYsBmK2xpbgtKA0xlD0EMXEhO9TDbn0g
         y82k/9hT7Npalsq1NvHgr5wo2Ezhbqv8xkmeXbDGkynE2dTcoOJgUcCbsbfxm3oZ0K
         QZfBb361OiPPkGpQPXTQzhvFKxFCgqgTGkdNk7Fo=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005wB-CI; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 13/22] media: docs: split uAPI info from saa7134-devel.rst
Date:   Tue, 10 Mar 2020 14:43:04 +0100
Message-Id: <b29aa35ac3639d2f75344cdd2b32bb4a834fae11.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file contains both driver develompent documentation and
userspace API.

Split on two, as they're usually read by different audiences.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/media/v4l-drivers/index.rst     |  1 +
 .../media/v4l-drivers/saa7134-devel.rst       | 67 +++++++++++++++++++
 Documentation/media/v4l-drivers/saa7134.rst   | 54 ---------------
 3 files changed, 68 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/saa7134-devel.rst

diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index adf72937b119..6fdfd9a41913 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -71,6 +71,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	cx88-devel
 	davinci-vpbe-devel
 	fimc-devel
+	saa7134-devel
 	vimc-devel
 
 	cx2341x-uapi
diff --git a/Documentation/media/v4l-drivers/saa7134-devel.rst b/Documentation/media/v4l-drivers/saa7134-devel.rst
new file mode 100644
index 000000000000..167fd729bc8c
--- /dev/null
+++ b/Documentation/media/v4l-drivers/saa7134-devel.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The saa7134 driver
+==================
+
+Author Gerd Hoffmann
+
+
+Card Variations:
+----------------
+
+Cards can use either of these two crystals (xtal):
+
+- 32.11 MHz -> .audio_clock=0x187de7
+- 24.576MHz -> .audio_clock=0x200000 (xtal * .audio_clock = 51539600)
+
+Some details about 30/34/35:
+
+- saa7130 - low-price chip, doesn't have mute, that is why all those
+  cards should have .mute field defined in their tuner structure.
+
+- saa7134 - usual chip
+
+- saa7133/35 - saa7135 is probably a marketing decision, since all those
+  chips identifies itself as 33 on pci.
+
+LifeView GPIOs
+--------------
+
+This section was authored by: Peter Missel <peter.missel@onlinehome.de>
+
+- LifeView FlyTV Platinum FM (LR214WF)
+
+    - GP27    MDT2005 PB4 pin 10
+    - GP26    MDT2005 PB3 pin 9
+    - GP25    MDT2005 PB2 pin 8
+    - GP23    MDT2005 PB1 pin 7
+    - GP22    MDT2005 PB0 pin 6
+    - GP21    MDT2005 PB5 pin 11
+    - GP20    MDT2005 PB6 pin 12
+    - GP19    MDT2005 PB7 pin 13
+    - nc      MDT2005 PA3 pin 2
+    - Remote  MDT2005 PA2 pin 1
+    - GP18    MDT2005 PA1 pin 18
+    - nc      MDT2005 PA0 pin 17 strap low
+    - GP17    Strap "GP7"=High
+    - GP16    Strap "GP6"=High
+
+	- 0=Radio 1=TV
+	- Drives SA630D ENCH1 and HEF4052 A1 pinsto do FM radio through
+	  SIF input
+
+    - GP15    nc
+    - GP14    nc
+    - GP13    nc
+    - GP12    Strap "GP5" = High
+    - GP11    Strap "GP4" = High
+    - GP10    Strap "GP3" = High
+    - GP09    Strap "GP2" = Low
+    - GP08    Strap "GP1" = Low
+    - GP07.00 nc
+
+Credits
+-------
+
+andrew.stevens@philips.com + werner.leeb@philips.com for providing
+saa7134 hardware specs and sample board.
diff --git a/Documentation/media/v4l-drivers/saa7134.rst b/Documentation/media/v4l-drivers/saa7134.rst
index 15d06facdbc1..c84246dd81c0 100644
--- a/Documentation/media/v4l-drivers/saa7134.rst
+++ b/Documentation/media/v4l-drivers/saa7134.rst
@@ -54,60 +54,6 @@ Known Problems
   default might not work for you depending on which version you have.
   There is a tuner= insmod option to override the driver's default.
 
-Card Variations:
-----------------
-
-Cards can use either of these two crystals (xtal):
-
-- 32.11 MHz -> .audio_clock=0x187de7
-- 24.576MHz -> .audio_clock=0x200000 (xtal * .audio_clock = 51539600)
-
-Some details about 30/34/35:
-
-- saa7130 - low-price chip, doesn't have mute, that is why all those
-  cards should have .mute field defined in their tuner structure.
-
-- saa7134 - usual chip
-
-- saa7133/35 - saa7135 is probably a marketing decision, since all those
-  chips identifies itself as 33 on pci.
-
-LifeView GPIOs
---------------
-
-This section was authored by: Peter Missel <peter.missel@onlinehome.de>
-
-- LifeView FlyTV Platinum FM (LR214WF)
-
-    - GP27    MDT2005 PB4 pin 10
-    - GP26    MDT2005 PB3 pin 9
-    - GP25    MDT2005 PB2 pin 8
-    - GP23    MDT2005 PB1 pin 7
-    - GP22    MDT2005 PB0 pin 6
-    - GP21    MDT2005 PB5 pin 11
-    - GP20    MDT2005 PB6 pin 12
-    - GP19    MDT2005 PB7 pin 13
-    - nc      MDT2005 PA3 pin 2
-    - Remote  MDT2005 PA2 pin 1
-    - GP18    MDT2005 PA1 pin 18
-    - nc      MDT2005 PA0 pin 17 strap low
-    - GP17    Strap "GP7"=High
-    - GP16    Strap "GP6"=High
-
-	- 0=Radio 1=TV
-	- Drives SA630D ENCH1 and HEF4052 A1 pinsto do FM radio through
-	  SIF input
-
-    - GP15    nc
-    - GP14    nc
-    - GP13    nc
-    - GP12    Strap "GP5" = High
-    - GP11    Strap "GP4" = High
-    - GP10    Strap "GP3" = High
-    - GP09    Strap "GP2" = Low
-    - GP08    Strap "GP1" = Low
-    - GP07.00 nc
-
 Credits
 -------
 
-- 
2.24.1

