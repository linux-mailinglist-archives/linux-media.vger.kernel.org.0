Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D9A1C552F
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 14:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgEEMMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 08:12:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:37704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728865AbgEEMMx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 08:12:53 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D85520746;
        Tue,  5 May 2020 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588680772;
        bh=/+W2tyKJ/APKafex1fob08kYmvvz8n5SSE3zq5DdWzA=;
        h=From:To:Cc:Subject:Date:From;
        b=RC/zWLIDy70v6+QzIzys7NUOhabufGdc0fHJrasPaaketPNcNXbNAW2g9/imKR+Ut
         xWgK2lqxgRN9Dry9i48ZBDQbpu9eQBw9eAsrDHHkZX7Jo2vcSeD8EGIY7/orgskDXG
         3r26s3Z+5SePUgmeYNZd4Rqea2sS0Jw7igcp6BDw=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jVwRN-001TnM-Ly; Tue, 05 May 2020 14:12:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH 1/2] media: admin-guide: make clear about PCI subsystem IDs
Date:   Tue,  5 May 2020 14:12:47 +0200
Message-Id: <d9a5a8b5651c25971840d27b8453b53ae6c0990f.1588676424.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On several parts of the document, it mentions "PCI ID", when
it is actually referring to the subsystem's part of the PCI
ID.

Change the language to let it be clear.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/bt8xx.rst     |  2 +-
 .../admin-guide/media/bttv-cardlist.rst       |  2 +-
 Documentation/admin-guide/media/cardlist.rst  | 29 ++++++++++++-------
 .../admin-guide/media/cx23885-cardlist.rst    |  2 +-
 .../admin-guide/media/cx88-cardlist.rst       |  2 +-
 .../admin-guide/media/ivtv-cardlist.rst       |  2 +-
 .../admin-guide/media/saa7134-cardlist.rst    |  2 +-
 .../admin-guide/media/saa7164-cardlist.rst    |  2 +-
 8 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/media/bt8xx.rst b/Documentation/admin-guide/media/bt8xx.rst
index d6cf81d83d61..1382ada1e38e 100644
--- a/Documentation/admin-guide/media/bt8xx.rst
+++ b/Documentation/admin-guide/media/bt8xx.rst
@@ -70,7 +70,7 @@ frontend and backend modules will be loaded automatically.
 
 Exceptions are:
 
-- Old TV cards without EEPROMs, sharing a common PCI ID;
+- Old TV cards without EEPROMs, sharing a common PCI subsystem ID;
 - Old TwinHan DST cards or clones with or without CA slot and not
   containing an Eeprom.
 
diff --git a/Documentation/admin-guide/media/bttv-cardlist.rst b/Documentation/admin-guide/media/bttv-cardlist.rst
index f5806856b5a1..8671d4f7ba7b 100644
--- a/Documentation/admin-guide/media/bttv-cardlist.rst
+++ b/Documentation/admin-guide/media/bttv-cardlist.rst
@@ -12,7 +12,7 @@ BTTV cards list
 
    * - Card number
      - Card name
-     - PCI IDs
+     - PCI subsystem IDs
 
    * - 0
      -  *** UNKNOWN/GENERIC ***
diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 8cdb9d4ca7d6..678765f6e9f1 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -183,13 +183,16 @@ is actually composed by two parts:
 	- Vendor ID and device ID;
 	- Subsystem ID and Subsystem device ID;
 
-The ``lspci -nn`` command allows identifying the vendor/device PCI IDs::
+The ``lspci -nn`` command allows identifying the vendor/device PCI IDs:
+
+.. code-block:: none
+   :emphasize-lines: 4
 
     $ lspci -nn
     ...
+    00:0a.0 Multimedia controller [0480]: Philips Semiconductors SAA7131/SAA7133/SAA7135 Video Broadcast Decoder [1131:7133] (rev d1)
     00:0b.0 Multimedia controller [0480]: Brooktree Corporation Bt878 Audio Capture [109e:0878] (rev 11)
     01:00.0 Multimedia video controller [0400]: Conexant Systems, Inc. CX23887/8 PCIe Broadcast Audio and Video Decoder with 3D Comb [14f1:8880] (rev 0f)
-    01:01.0 Multimedia controller [0480]: Philips Semiconductors SAA7131/SAA7133/SAA7135 Video Broadcast Decoder [1131:7133] (rev d1)
     02:01.0 Multimedia video controller [0400]: Internext Compression Inc iTVC15 (CX23415) Video Decoder [4444:0803] (rev 01)
     02:02.0 Multimedia video controller [0400]: Conexant Systems, Inc. CX23418 Single-Chip MPEG-2 Encoder with Integrated Analog Video/Broadcast Audio Decoder [14f1:5b7a]
     02:03.0 Multimedia video controller [0400]: Brooktree Corporation Bt878 Video Capture [109e:036e] (rev 11)
@@ -202,17 +205,21 @@ The subsystem IDs can be obtained using ``lspci -vn``
 
     $ lspci -vn
     ...
-	01:01.0 0480: 1131:7133 (rev d1)
-	        Subsystem: 1461:f01d
-	        Flags: bus master, medium devsel, latency 32, IRQ 209
-	        Memory at e2002000 (32-bit, non-prefetchable) [size=2K]
-	        Capabilities: [40] Power Management version 2
+	00:0a.0 0480: 1131:7133 (rev d1)
+		Subsystem: 1461:f01d
+		Flags: bus master, medium devsel, latency 32, IRQ 209
+		Memory at e2002000 (32-bit, non-prefetchable) [size=2K]
+		Capabilities: [40] Power Management version 2
     ...
 
-Unfortunately, sometimes the same PCI ID is used by different products.
-So, several media drivers allow passing a ``card=`` parameter, in order
-to setup a card number that would match the correct settings for an
-specific board.
+At the above example, the first card uses the ``saa7134`` driver, and
+has a vendor/device PCI ID equal to ``1131:7133`` and a PCI subsystem
+ID equal to ``1461:f01d``.
+
+Unfortunately, sometimes the same PCI subsystem ID is used by different
+products. So, several media drivers allow passing a ``card=`` parameter,
+in order to setup a card number that would match the correct settings for
+an specific board.
 
 The current supported PCI/PCIe cards (not including staging drivers) are
 listed below\ [#]_.
diff --git a/Documentation/admin-guide/media/cx23885-cardlist.rst b/Documentation/admin-guide/media/cx23885-cardlist.rst
index 0415b8e0be6f..c47514fead33 100644
--- a/Documentation/admin-guide/media/cx23885-cardlist.rst
+++ b/Documentation/admin-guide/media/cx23885-cardlist.rst
@@ -12,7 +12,7 @@ cx23885 cards list
 
    * - Card number
      - Card name
-     - PCI IDs
+     - PCI subsystem IDs
 
    * - 0
      - UNKNOWN/GENERIC
diff --git a/Documentation/admin-guide/media/cx88-cardlist.rst b/Documentation/admin-guide/media/cx88-cardlist.rst
index 4524dfb13d18..76dc9a14cf91 100644
--- a/Documentation/admin-guide/media/cx88-cardlist.rst
+++ b/Documentation/admin-guide/media/cx88-cardlist.rst
@@ -12,7 +12,7 @@ CX88 cards list
 
    * - Card number
      - Card name
-     - PCI IDs
+     - PCI subsystem IDs
 
    * - 0
      - UNKNOWN/GENERIC
diff --git a/Documentation/admin-guide/media/ivtv-cardlist.rst b/Documentation/admin-guide/media/ivtv-cardlist.rst
index c34a9ebc9ac2..0ffc3b71ae60 100644
--- a/Documentation/admin-guide/media/ivtv-cardlist.rst
+++ b/Documentation/admin-guide/media/ivtv-cardlist.rst
@@ -12,7 +12,7 @@ IVTV cards list
 
    * - Card number
      - Card name
-     - PCI IDs
+     - PCI subsystem IDs
 
    * - 0
      - Hauppauge WinTV PVR-250
diff --git a/Documentation/admin-guide/media/saa7134-cardlist.rst b/Documentation/admin-guide/media/saa7134-cardlist.rst
index afb0e2fb52b0..3ef8fab6bcad 100644
--- a/Documentation/admin-guide/media/saa7134-cardlist.rst
+++ b/Documentation/admin-guide/media/saa7134-cardlist.rst
@@ -12,7 +12,7 @@ SAA7134 cards list
 
    * - Card number
      - Card name
-     - PCI IDs
+     - PCI subsystem IDs
 
    * - 0
      - UNKNOWN/GENERIC
diff --git a/Documentation/admin-guide/media/saa7164-cardlist.rst b/Documentation/admin-guide/media/saa7164-cardlist.rst
index e8f36e084537..7949c09aa900 100644
--- a/Documentation/admin-guide/media/saa7164-cardlist.rst
+++ b/Documentation/admin-guide/media/saa7164-cardlist.rst
@@ -12,7 +12,7 @@ SAA7164 cards list
 
    * - Card number
      - Card name
-     - PCI IDs
+     - PCI subsystem IDs
 
    * - 0
      - Unknown
-- 
2.25.4

