Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A33D9154752
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 16:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgBFPLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 10:11:44 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37520 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbgBFPLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 10:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=JpPfV3X0IbbEqpwh1J7u9/RfF9wav1C8I7pA8PCwlPs=; b=mINfWQehE+Hu+pEwDww5egi3bq
        iVsIXXjYoRfM4s5mbCftIq6WDqutHT1dQzAz2MJcsaLA0slNKQpXH1S0P21csPMNGYKlgrM7QzUBw
        RReq7Ccixw4s/nwtIY3szq92Cqk/4Qko6mboSm+EWXILb4R07BkMYoPgd0n3z25bsJqVa+DA9PqHj
        zWyu3FW3Qp9oovPmwK5d8bYrwJVyjuIT7BLlpVxEFiqc0X+PmeXnghgh1gtOOiVPXHHvYNMJh3dLX
        ORc8SSYo+3dagJlX4ztmSxoLJGqMocvrIR/fW2dvG8lSfQXh6eDdiYB9wo5gy5yE+F1Efju/ptDlf
        i/uypfGg==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iziod-00043A-Ez; Thu, 06 Feb 2020 15:11:42 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1izioV-002oNB-Tk; Thu, 06 Feb 2020 16:11:31 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 06/11] docs: misc-devices/spear-pcie-gadget.txt: convert to ReST
Date:   Thu,  6 Feb 2020 16:11:25 +0100
Message-Id: <202d70fd689b0a28e60b3438d0940b6c65142e93.1581001737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581001737.git.mchehab+huawei@kernel.org>
References: <cover.1581001737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Use title/chapter markups;
- Use table markups;
- Mark literal blocks as such;
- Adjust indentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/misc-devices/index.rst          |   1 +
 .../misc-devices/spear-pcie-gadget.rst        | 170 ++++++++++++++++++
 .../misc-devices/spear-pcie-gadget.txt        | 130 --------------
 3 files changed, 171 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/misc-devices/spear-pcie-gadget.rst
 delete mode 100644 Documentation/misc-devices/spear-pcie-gadget.txt

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index f11c5daeada5..2d454b413aef 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -20,4 +20,5 @@ fit into other categories.
    isl29003
    lis3lv02d
    max6875
+   spear-pcie-gadget
    xilinx_sdfec
diff --git a/Documentation/misc-devices/spear-pcie-gadget.rst b/Documentation/misc-devices/spear-pcie-gadget.rst
new file mode 100644
index 000000000000..09b9d6c7ac15
--- /dev/null
+++ b/Documentation/misc-devices/spear-pcie-gadget.rst
@@ -0,0 +1,170 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Spear PCIe Gadget Driver
+========================
+
+Author
+======
+Pratyush Anand (pratyush.anand@gmail.com)
+
+Location
+========
+driver/misc/spear13xx_pcie_gadget.c
+
+Supported Chip:
+===============
+SPEAr1300
+SPEAr1310
+
+Menuconfig option:
+==================
+Device Drivers
+	Misc devices
+		PCIe gadget support for SPEAr13XX platform
+
+purpose
+=======
+This driver has several nodes which can be read/written by configfs interface.
+Its main purpose is to configure selected dual mode PCIe controller as device
+and then program its various registers to configure it as a particular device
+type. This driver can be used to show spear's PCIe device capability.
+
+Description of different nodes:
+===============================
+
+read behavior of nodes:
+-----------------------
+
+=============== ==============================================================
+link 		gives ltssm status.
+int_type 	type of supported interrupt
+no_of_msi 	zero if MSI is not enabled by host. A positive value is the
+		number of MSI vector granted.
+vendor_id	returns programmed vendor id (hex)
+device_id	returns programmed device id(hex)
+bar0_size:	returns size of bar0 in hex.
+bar0_address	returns address of bar0 mapped area in hex.
+bar0_rw_offset	returns offset of bar0 for which bar0_data will return value.
+bar0_data	returns data at bar0_rw_offset.
+=============== ==============================================================
+
+write behavior of nodes:
+------------------------
+
+=============== ================================================================
+link 		write UP to enable ltsmm DOWN to disable
+int_type	write interrupt type to be configured and (int_type could be
+		INTA, MSI or NO_INT). Select MSI only when you have programmed
+		no_of_msi node.
+no_of_msi	number of MSI vector needed.
+inta		write 1 to assert INTA and 0 to de-assert.
+send_msi	write MSI vector to be sent.
+vendor_id	write vendor id(hex) to be programmed.
+device_id	write device id(hex) to be programmed.
+bar0_size	write size of bar0 in hex. default bar0 size is 1000 (hex)
+		bytes.
+bar0_address	write	address of bar0 mapped area in hex. (default mapping of
+		bar0 is SYSRAM1(E0800000). Always program bar size before bar
+		address. Kernel might modify bar size and address for alignment,
+		so read back bar size and address after writing to cross check.
+bar0_rw_offset	write offset of bar0 for which	bar0_data will write value.
+bar0_data	write data to be written at bar0_rw_offset.
+=============== ================================================================
+
+Node programming example
+========================
+
+Program all PCIe registers in such a way that when this device is connected
+to the PCIe host, then host sees this device as 1MB RAM.
+
+::
+
+    #mount -t configfs none /Config
+
+For nth PCIe Device Controller::
+
+    # cd /config/pcie_gadget.n/
+
+Now you have all the nodes in this directory.
+program vendor id as 0x104a::
+
+    # echo 104A >> vendor_id
+
+program device id as 0xCD80::
+
+    # echo CD80 >> device_id
+
+program BAR0 size as 1MB::
+
+    # echo 100000 >> bar0_size
+
+check for programmed bar0 size::
+
+    # cat bar0_size
+
+Program BAR0 Address as DDR (0x2100000). This is the physical address of
+memory, which is to be made visible to PCIe host. Similarly any other peripheral
+can also be made visible to PCIe host. E.g., if you program base address of UART
+as BAR0 address then when this device will be connected to a host, it will be
+visible as UART.
+
+::
+
+    # echo 2100000 >> bar0_address
+
+program interrupt type : INTA::
+
+    # echo INTA >> int_type
+
+go for link up now::
+
+    # echo UP >> link
+
+It will have to be insured that, once link up is done on gadget, then only host
+is initialized and start to search PCIe devices on its port.
+
+::
+
+    /*wait till link is up*/
+    # cat link
+
+Wait till it returns UP.
+
+To assert INTA::
+
+    # echo 1 >> inta
+
+To de-assert INTA::
+
+    # echo 0 >> inta
+
+if MSI is to be used as interrupt, program no of msi vector needed (say4)::
+
+    # echo 4 >> no_of_msi
+
+select MSI as interrupt type::
+
+    # echo MSI >> int_type
+
+go for link up now::
+
+    # echo UP >> link
+
+wait till link is up::
+
+    # cat link
+
+An application can repetitively read this node till link is found UP. It can
+sleep between two read.
+
+wait till msi is enabled::
+
+    # cat no_of_msi
+
+Should return 4 (number of requested MSI vector)
+
+to send msi vector 2::
+
+    # echo 2 >> send_msi
+    # cd -
diff --git a/Documentation/misc-devices/spear-pcie-gadget.txt b/Documentation/misc-devices/spear-pcie-gadget.txt
deleted file mode 100644
index 89b88dee4143..000000000000
--- a/Documentation/misc-devices/spear-pcie-gadget.txt
+++ /dev/null
@@ -1,130 +0,0 @@
-Spear PCIe Gadget Driver:
-
-Author
-=============
-Pratyush Anand (pratyush.anand@gmail.com)
-
-Location
-============
-driver/misc/spear13xx_pcie_gadget.c
-
-Supported Chip:
-===================
-SPEAr1300
-SPEAr1310
-
-Menuconfig option:
-==========================
-Device Drivers
-	Misc devices
-		PCIe gadget support for SPEAr13XX platform
-purpose
-===========
-This driver has several nodes which can be read/written by configfs interface.
-Its main purpose is to configure selected dual mode PCIe controller as device
-and then program its various registers to configure it as a particular device
-type. This driver can be used to show spear's PCIe device capability.
-
-Description of different nodes:
-=================================
-
-read behavior of nodes:
-------------------------------
-link 		:gives ltssm status.
-int_type 	:type of supported interrupt
-no_of_msi 	:zero if MSI is not enabled by host. A positive value is the
-		number of MSI vector granted.
-vendor_id	:returns programmed vendor id (hex)
-device_id	:returns programmed device id(hex)
-bar0_size:	:returns size of bar0 in hex.
-bar0_address	:returns address of bar0 mapped area in hex.
-bar0_rw_offset	:returns offset of bar0 for which bar0_data will return value.
-bar0_data	:returns data at bar0_rw_offset.
-
-write behavior of nodes:
-------------------------------
-link 		:write UP to enable ltsmm DOWN to disable
-int_type	:write interrupt type to be configured and (int_type could be
-		INTA, MSI or NO_INT). Select MSI only when you have programmed
-		no_of_msi node.
-no_of_msi	:number of MSI vector needed.
-inta		:write 1 to assert INTA and 0 to de-assert.
-send_msi	:write MSI vector to be sent.
-vendor_id	:write vendor id(hex) to be programmed.
-device_id	:write device id(hex) to be programmed.
-bar0_size	:write size of bar0 in hex. default bar0 size is 1000 (hex)
-		bytes.
-bar0_address	:write	address of bar0 mapped area in hex. (default mapping of
-		bar0 is SYSRAM1(E0800000). Always program bar size before bar
-		address. Kernel might modify bar size and address for alignment, so
-		read back bar size and address after writing to cross check.
-bar0_rw_offset	:write offset of bar0 for which	bar0_data will write value.
-bar0_data	:write data to be written at bar0_rw_offset.
-
-Node programming example
-===========================
-Program all PCIe registers in such a way that when this device is connected
-to the PCIe host, then host sees this device as 1MB RAM.
-#mount -t configfs none /Config
-For nth PCIe Device Controller
-# cd /config/pcie_gadget.n/
-Now you have all the nodes in this directory.
-program vendor id as 0x104a
-# echo 104A >> vendor_id
-
-program device id as 0xCD80
-# echo CD80 >> device_id
-
-program BAR0 size as 1MB
-# echo 100000 >> bar0_size
-
-check for programmed bar0 size
-# cat bar0_size
-
-Program BAR0 Address as DDR (0x2100000). This is the physical address of
-memory, which is to be made visible to PCIe host. Similarly any other peripheral
-can also be made visible to PCIe host. E.g., if you program base address of UART
-as BAR0 address then when this device will be connected to a host, it will be
-visible as UART.
-# echo 2100000 >> bar0_address
-
-program interrupt type : INTA
-# echo INTA >> int_type
-
-go for link up now.
-# echo UP >> link
-
-It will have to be insured that, once link up is done on gadget, then only host
-is initialized and start to search PCIe devices on its port.
-
-/*wait till link is up*/
-# cat link
-wait till it returns UP.
-
-To assert INTA
-# echo 1 >> inta
-
-To de-assert INTA
-# echo 0 >> inta
-
-if MSI is to be used as interrupt, program no of msi vector needed (say4)
-# echo 4 >> no_of_msi
-
-select MSI as interrupt type
-# echo MSI >> int_type
-
-go for link up now
-# echo UP >> link
-
-wait till link is up
-# cat link
-An application can repetitively read this node till link is found UP. It can
-sleep between two read.
-
-wait till msi is enabled
-# cat no_of_msi
-Should return 4 (number of requested MSI vector)
-
-to send msi vector 2
-# echo 2 >> send_msi
-#cd -
-- 
2.24.1

