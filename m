Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E231B377D
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 08:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgDVGWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 02:22:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbgDVGWV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 02:22:21 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41536206CD;
        Wed, 22 Apr 2020 06:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587536540;
        bh=BgNK8YyUYXKMZOf+ZevRI6wH/LGqu8vWzst5WoLbRzU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KFzZGk+Zs7kfIO+aPhybr/PwkdLGXtOLaAiRWzFR49C/w4Vtn9bV8aVuMN3SpqxW0
         IBVTkYwJ9rCSx0puwTlJ+OtN/C4R5Rr++nksMShU61kQsG3BmvER0Jbd+q4qD3KFiM
         m1Iz0bU+CgYnEVmUl6lH9hCyK51zUhH7zPRIxCKM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jR8m2-00DCgn-04; Wed, 22 Apr 2020 08:22:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [[PATCH v2 09/15]] media: admin-guide: improve cardlist.rst documentation
Date:   Wed, 22 Apr 2020 08:22:12 +0200
Message-Id: <17ce5e6d72d5acc838e8e6218c3fadc2a7abe7da.1587536517.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <824bb8013d308e4bce9da454ca564883806e4fb5.1587142382.git.mchehab+huawei@kernel.org>
References: <824bb8013d308e4bce9da454ca564883806e4fb5.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cardlist section is important for some boards, because they
may require extra modprobe parameters.

Improve the docs to mention that.

Thanks-to: Hans Verkuil <hverkuil-cisco@xs4all.nl> # for providing me some PCI IDs
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst | 116 ++++++++++++++++++-
 1 file changed, 111 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 527188ee9697..025d251764c2 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -1,22 +1,128 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+==========
 Cards List
 ==========
 
+The media subsystem provide support for lots of PCI and USB drivers, plus
+platform-specific drivers. It also contains several ancillary I²C drivers.
+
+The platform-specific drivers are usually present on embedded systems,
+or are supported by the main board. Usually, setting them is done via
+OpenFirmware or ACPI.
+
+The PCI and USB drivers, however, are independent of the system's board,
+and may be added/removed by the user.
+
+This section contains a list of supported PCI and USB boards.
+
+Please notice that this list is not exaustive.
+
+USB drivers
+===========
+
+The USB boards are identified by an identification called USB ID.
+
+The ``lsusb`` command allows identifying the USB IDs::
+
+    $ lsusb
+    ...
+    Bus 001 Device 015: ID 046d:082d Logitech, Inc. HD Pro Webcam C920
+    Bus 001 Device 074: ID 2040:b131 Hauppauge
+    Bus 001 Device 075: ID 2013:024f PCTV Systems nanoStick T2 290e
+    ...
+
+Newer camera devices use a standard way to expose themselves as such,
+via USB Video Class. Those cameras are automatically supported by the
+``uvc-driver``.
+
+Older cameras and TV USB devices uses USB Vendor Classes: each vendor
+defines its own way to access the device. This section contains
+card lists for such vendor-class devices.
+
+While this is not as common as on PCI, sometimes the same USB ID is used
+by different products. So, several media drivers allow passing a ``card=``
+parameter, in order to setup a card number that would match the correct
+settings for an specific product type.
+
 .. toctree::
 	:maxdepth: 1
 
 	au0828-cardlist
+	cx231xx-cardlist
+	em28xx-cardlist
+	tm6000-cardlist
+	usbvision-cardlist
+	gspca-cardlist
+
+PCI drivers
+===========
+
+The PCI boards are identified by an identification called PCI ID. The PCI ID
+is actually composed by two parts:
+
+	- Vendor ID and device ID;
+	- Subsystem ID and Subsystem device ID;
+
+The ``lspci -nn`` command allows identifying the vendor/device PCI IDs::
+
+    $ lspci -nn
+    ...
+    00:0b.0 Multimedia controller [0480]: Brooktree Corporation Bt878 Audio Capture [109e:0878] (rev 11)
+    01:00.0 Multimedia video controller [0400]: Conexant Systems, Inc. CX23887/8 PCIe Broadcast Audio and Video Decoder with 3D Comb [14f1:8880] (rev 0f)
+    01:01.0 Multimedia controller [0480]: Philips Semiconductors SAA7131/SAA7133/SAA7135 Video Broadcast Decoder [1131:7133] (rev d1)
+    02:01.0 Multimedia video controller [0400]: Internext Compression Inc iTVC15 (CX23415) Video Decoder [4444:0803] (rev 01)
+    02:02.0 Multimedia video controller [0400]: Conexant Systems, Inc. CX23418 Single-Chip MPEG-2 Encoder with Integrated Analog Video/Broadcast Audio Decoder [14f1:5b7a]
+    02:03.0 Multimedia video controller [0400]: Brooktree Corporation Bt878 Video Capture [109e:036e] (rev 11)
+    ...
+
+The subsystem IDs can be obtained using ``lspci -vn``
+
+.. code-block:: none
+   :emphasize-lines: 4
+
+    $ lspci -vn
+    ...
+	01:01.0 0480: 1131:7133 (rev d1)
+	        Subsystem: 1461:f01d
+	        Flags: bus master, medium devsel, latency 32, IRQ 209
+	        Memory at e2002000 (32-bit, non-prefetchable) [size=2K]
+	        Capabilities: [40] Power Management version 2
+    ...
+
+Unfortunately, sometimes the same PCI ID is used by different products.
+So, several media drivers allow passing a ``card=`` parameter, in order
+to setup a card number that would match the correct settings for an
+specific board.
+
+.. toctree::
+	:maxdepth: 1
+
 	bttv-cardlist
 	cx18-cardlist
-	cx231xx-cardlist
 	cx23885-cardlist
 	cx88-cardlist
-	em28xx-cardlist
 	ivtv-cardlist
 	saa7134-cardlist
 	saa7164-cardlist
-	tm6000-cardlist
+
+I²C drivers
+===========
+
+The I²C (Inter-Integrated Circuit) bus is a three-wires bus used internally
+at the media cards for communication between different chips. While the bus
+is not visible to the Linux Kernel, drivers need to send and receive
+commands via the bus. The Linux Kernel driver abstraction has support to
+implement different drivers for each component inside an I²C bus, as if
+the bus were visible to the main system board.
+
+One of the problems with I²C devices is that sometimes the same device may
+work with different I²C hardware. This is common, for example, on devices
+that comes with a tuner for North America market, and another one for
+Europe. Some drivers have a ``tuner=`` modprobe parameter to allow using a
+different tuner number in order to address such issue.
+
+.. toctree::
+	:maxdepth: 1
+
 	tuner-cardlist
-	usbvision-cardlist
-	gspca-cardlist
-- 
2.25.2

