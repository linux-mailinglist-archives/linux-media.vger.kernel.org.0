Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC381AE2EE
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgDQQ7H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727806AbgDQQ7B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B81C520771;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=LW0YChFmsMYi3A/jBnNiN8a7wkyl819k9zKt5G4Hj2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B7D6Oe6BLyqXb8+Mxr8AuGEhZYOd3bPjp5gWCjaEL0D51Dh6rBSZUr/FkGBgcgjX4
         OemzXkyQqZAHrqnPesRIiP6qpxxhzRyBFUxw4B3PAiMolqKpGPOkwJ/5rMO5xQ+JnM
         ZHZ0aT9BL7tZN85v1tJW1iTPstIPLpFcMfG8CfWQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wLm-9Y; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 09/15] media: admin-guide: improve cardlist.rst documentation
Date:   Fri, 17 Apr 2020 18:58:50 +0200
Message-Id: <824bb8013d308e4bce9da454ca564883806e4fb5.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst | 93 ++++++++++++++++++--
 1 file changed, 88 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 527188ee9697..f469bd759bea 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -1,22 +1,105 @@
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
+The PCI boards are identified by an identification called PCI ID.
+
+The ``lspci`` command allows identifying the PCI IDs::
+
+    $ lspci -nn
+    ...
+    00:0b.0 Multimedia video controller: Brooktree Corporation Bt878 Video Capture [1822:0026] (rev 11)
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

