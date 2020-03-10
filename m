Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1B317FF2F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgCJNon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:44:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:37588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726998AbgCJNnT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11E772468C;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=//FvkYJTvYKf9u3X9i55i0Czwblru6XHdyLbwPOvSyQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zcybpOb9GNIYdyAkHJKkFp9Z0Mck9tXZD77of8AB18CP3ggyoBf13pnuK0j/DyMcY
         YgdDOBwzlxI4ZwsGmtMuSyY0SfLjGgB7cHahKyJmnTmVdzcjJcFOTFGHETKjiX4Mnu
         PbCUYwOHE+N2aVpm21c9AnCVHJMoDhUD1umsofv8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005vn-6e; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 08/22] media: docs: split development info from cx88.rst
Date:   Tue, 10 Mar 2020 14:42:59 +0100
Message-Id: <597a62027b5b9e65990fdcde83f6a4f7cf309f93.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file contains both	admin and development stuff. Split on
two, as	they're	usually	read by	different audiences.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l-drivers/cx88-devel.rst          | 113 ++++++++++++++++++
 Documentation/media/v4l-drivers/cx88.rst      | 107 -----------------
 Documentation/media/v4l-drivers/index.rst     |   1 +
 3 files changed, 114 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/cx88-devel.rst

diff --git a/Documentation/media/v4l-drivers/cx88-devel.rst b/Documentation/media/v4l-drivers/cx88-devel.rst
new file mode 100644
index 000000000000..cfe7c03f4930
--- /dev/null
+++ b/Documentation/media/v4l-drivers/cx88-devel.rst
@@ -0,0 +1,113 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The cx88 driver
+===============
+
+Author:  Gerd Hoffmann
+
+Documentation missing at the cx88 datasheet
+-------------------------------------------
+
+MO_OUTPUT_FORMAT (0x310164)
+
+.. code-block:: none
+
+  Previous default from DScaler: 0x1c1f0008
+  Digit 8: 31-28
+  28: PREVREMOD = 1
+
+  Digit 7: 27-24 (0xc = 12 = b1100 )
+  27: COMBALT = 1
+  26: PAL_INV_PHASE
+    (DScaler apparently set this to 1, resulted in sucky picture)
+
+  Digits 6,5: 23-16
+  25-16: COMB_RANGE = 0x1f [default] (9 bits -> max 512)
+
+  Digit 4: 15-12
+  15: DISIFX = 0
+  14: INVCBF = 0
+  13: DISADAPT = 0
+  12: NARROWADAPT = 0
+
+  Digit 3: 11-8
+  11: FORCE2H
+  10: FORCEREMD
+  9: NCHROMAEN
+  8: NREMODEN
+
+  Digit 2: 7-4
+  7-6: YCORE
+  5-4: CCORE
+
+  Digit 1: 3-0
+  3: RANGE = 1
+  2: HACTEXT
+  1: HSFMT
+
+0x47 is the sync byte for MPEG-2 transport stream packets.
+Datasheet incorrectly states to use 47 decimal. 188 is the length.
+All DVB compliant frontends output packets with this start code.
+
+Hauppauge WinTV cx88 IR information
+-----------------------------------
+
+The controls for the mux are GPIO [0,1] for source, and GPIO 2 for muting.
+
+====== ======== =================================================
+GPIO0  GPIO1
+====== ======== =================================================
+  0        0    TV Audio
+  1        0    FM radio
+  0        1    Line-In
+  1        1    Mono tuner bypass or CD passthru (tuner specific)
+====== ======== =================================================
+
+GPIO 16(I believe) is tied to the IR port (if present).
+
+
+From the data sheet:
+
+- Register 24'h20004  PCI Interrupt Status
+
+ - bit [18]  IR_SMP_INT Set when 32 input samples have been collected over
+ - gpio[16] pin into GP_SAMPLE register.
+
+What's missing from the data sheet:
+
+- Setup 4KHz sampling rate (roughly 2x oversampled; good enough for our RC5
+  compat remote)
+- set register 0x35C050 to  0xa80a80
+- enable sampling
+- set register 0x35C054 to 0x5
+- enable the IRQ bit 18 in the interrupt mask register (and
+  provide for a handler)
+
+GP_SAMPLE register is at 0x35C058
+
+Bits are then right shifted into the GP_SAMPLE register at the specified
+rate; you get an interrupt when a full DWORD is received.
+You need to recover the actual RC5 bits out of the (oversampled) IR sensor
+bits. (Hint: look for the 0/1and 1/0 crossings of the RC5 bi-phase data)  An
+actual raw RC5 code will span 2-3 DWORDS, depending on the actual alignment.
+
+I'm pretty sure when no IR signal is present the receiver is always in a
+marking state(1); but stray light, etc can cause intermittent noise values
+as well.  Remember, this is a free running sample of the IR receiver state
+over time, so don't assume any sample starts at any particular place.
+
+Additional info
+~~~~~~~~~~~~~~~
+
+This data sheet (google search) seems to have a lovely description of the
+RC5 basics:
+http://www.atmel.com/dyn/resources/prod_documents/doc2817.pdf
+
+This document has more data:
+http://www.nenya.be/beor/electronics/rc5.htm
+
+This document has a  how to decode a bi-phase data stream:
+http://www.ee.washington.edu/circuit_archive/text/ir_decode.txt
+
+This document has still more info:
+http://www.xs4all.nl/~sbp/knowledge/ir/rc5.htm
diff --git a/Documentation/media/v4l-drivers/cx88.rst b/Documentation/media/v4l-drivers/cx88.rst
index 698c73ea2e36..e4badb18199d 100644
--- a/Documentation/media/v4l-drivers/cx88.rst
+++ b/Documentation/media/v4l-drivers/cx88.rst
@@ -56,110 +56,3 @@ the driver.  What to do then?
        trial-and-error using the tuner=<n> insmod option.  If you
        know which one the card has you can also have a look at the
        list in CARDLIST.tuner
-
-Documentation missing at the cx88 datasheet
--------------------------------------------
-
-MO_OUTPUT_FORMAT (0x310164)
-
-.. code-block:: none
-
-  Previous default from DScaler: 0x1c1f0008
-  Digit 8: 31-28
-  28: PREVREMOD = 1
-
-  Digit 7: 27-24 (0xc = 12 = b1100 )
-  27: COMBALT = 1
-  26: PAL_INV_PHASE
-    (DScaler apparently set this to 1, resulted in sucky picture)
-
-  Digits 6,5: 23-16
-  25-16: COMB_RANGE = 0x1f [default] (9 bits -> max 512)
-
-  Digit 4: 15-12
-  15: DISIFX = 0
-  14: INVCBF = 0
-  13: DISADAPT = 0
-  12: NARROWADAPT = 0
-
-  Digit 3: 11-8
-  11: FORCE2H
-  10: FORCEREMD
-  9: NCHROMAEN
-  8: NREMODEN
-
-  Digit 2: 7-4
-  7-6: YCORE
-  5-4: CCORE
-
-  Digit 1: 3-0
-  3: RANGE = 1
-  2: HACTEXT
-  1: HSFMT
-
-0x47 is the sync byte for MPEG-2 transport stream packets.
-Datasheet incorrectly states to use 47 decimal. 188 is the length.
-All DVB compliant frontends output packets with this start code.
-
-Hauppauge WinTV cx88 IR information
------------------------------------
-
-The controls for the mux are GPIO [0,1] for source, and GPIO 2 for muting.
-
-====== ======== =================================================
-GPIO0  GPIO1
-====== ======== =================================================
-  0        0    TV Audio
-  1        0    FM radio
-  0        1    Line-In
-  1        1    Mono tuner bypass or CD passthru (tuner specific)
-====== ======== =================================================
-
-GPIO 16(I believe) is tied to the IR port (if present).
-
-
-From the data sheet:
-
-- Register 24'h20004  PCI Interrupt Status
-
- - bit [18]  IR_SMP_INT Set when 32 input samples have been collected over
- - gpio[16] pin into GP_SAMPLE register.
-
-What's missing from the data sheet:
-
-- Setup 4KHz sampling rate (roughly 2x oversampled; good enough for our RC5
-  compat remote)
-- set register 0x35C050 to  0xa80a80
-- enable sampling
-- set register 0x35C054 to 0x5
-- enable the IRQ bit 18 in the interrupt mask register (and
-  provide for a handler)
-
-GP_SAMPLE register is at 0x35C058
-
-Bits are then right shifted into the GP_SAMPLE register at the specified
-rate; you get an interrupt when a full DWORD is received.
-You need to recover the actual RC5 bits out of the (oversampled) IR sensor
-bits. (Hint: look for the 0/1and 1/0 crossings of the RC5 bi-phase data)  An
-actual raw RC5 code will span 2-3 DWORDS, depending on the actual alignment.
-
-I'm pretty sure when no IR signal is present the receiver is always in a
-marking state(1); but stray light, etc can cause intermittent noise values
-as well.  Remember, this is a free running sample of the IR receiver state
-over time, so don't assume any sample starts at any particular place.
-
-Additional info
-~~~~~~~~~~~~~~~
-
-This data sheet (google search) seems to have a lovely description of the
-RC5 basics:
-http://www.atmel.com/dyn/resources/prod_documents/doc2817.pdf
-
-This document has more data:
-http://www.nenya.be/beor/electronics/rc5.htm
-
-This document has a  how to decode a bi-phase data stream:
-http://www.ee.washington.edu/circuit_archive/text/ir_decode.txt
-
-This document has still more info:
-http://www.xs4all.nl/~sbp/knowledge/ir/rc5.htm
diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index 52d7c8d14ee7..dfc878c050da 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -68,6 +68,7 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	bttv-devel
 	cpia2_devel
+	cx88-devel
 	vimc-devel
 
 	meye-uapi
-- 
2.24.1

