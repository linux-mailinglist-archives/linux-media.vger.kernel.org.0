Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 409E6154761
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 16:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgBFPLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 10:11:52 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37544 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbgBFPLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 10:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=GtwkLmmzfM76VxBMXlHIbbgbtZN35Zt+G8w8FKWpUbY=; b=gtmaFmBzc7TUFZpa1WBBmsWNZG
        bnRSg5bQ7Zxp5SxXh4e7PMjaCDGr53jQs0aUUJa3nbxXUX9drKZkcBO/zbWpWF7V3D/c1Uk6LafcP
        0LyloVeX1aYk0OZJkD5xcY4AxCx8ssey3+qj11HH47PVc5L6ZQsTj+JUq9J1TiuTPe5lAsyd6bEzk
        ogeYDjYUefW1uf3RU1IBNPfuzjUlCRcnM+zN5z49SAGZS2S5G95xLvyUeSKWHCsSrfkrYq+yvjV6i
        Y8NH50o1NrKePx4Uj9m0nLM9NJ6mRznchrvA7FeCMWpLkXlHfmmtEh6DuGJXDTxIHf9a3ErNfTzhm
        yZEqLpJQ==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1izioc-000436-DR; Thu, 06 Feb 2020 15:11:42 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1izioV-002oNL-Vd; Thu, 06 Feb 2020 16:11:31 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 08/11] docs: misc-devices/pci-endpoint-test.txt: convert to ReST
Date:   Thu,  6 Feb 2020 16:11:27 +0100
Message-Id: <9766bd8385fc1605aa131acc7fb4fdc3614a6f89.1581001737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581001737.git.mchehab+huawei@kernel.org>
References: <cover.1581001737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Use titles markups;
- Adjust identation;
- use literal markup;
- Use the proper notation for footnotes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/misc-devices/index.rst          |  1 +
 .../misc-devices/pci-endpoint-test.rst        | 56 +++++++++++++++++++
 .../misc-devices/pci-endpoint-test.txt        | 41 --------------
 3 files changed, 57 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/misc-devices/pci-endpoint-test.rst
 delete mode 100644 Documentation/misc-devices/pci-endpoint-test.txt

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 005547c1ad5d..04f5dab2384c 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -21,5 +21,6 @@ fit into other categories.
    isl29003
    lis3lv02d
    max6875
+   pci-endpoint-test
    spear-pcie-gadget
    xilinx_sdfec
diff --git a/Documentation/misc-devices/pci-endpoint-test.rst b/Documentation/misc-devices/pci-endpoint-test.rst
new file mode 100644
index 000000000000..26e5d9ba146b
--- /dev/null
+++ b/Documentation/misc-devices/pci-endpoint-test.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Driver for PCI Endpoint Test Function
+=====================================
+
+This driver should be used as a host side driver if the root complex is
+connected to a configurable PCI endpoint running ``pci_epf_test`` function
+driver configured according to [1]_.
+
+The "pci_endpoint_test" driver can be used to perform the following tests.
+
+The PCI driver for the test device performs the following tests:
+
+	#) verifying addresses programmed in BAR
+	#) raise legacy IRQ
+	#) raise MSI IRQ
+	#) raise MSI-X IRQ
+	#) read data
+	#) write data
+	#) copy data
+
+This misc driver creates /dev/pci-endpoint-test.<num> for every
+``pci_epf_test`` function connected to the root complex and "ioctls"
+should be used to perform the above tests.
+
+ioctl
+-----
+
+ PCITEST_BAR:
+	      Tests the BAR. The number of the BAR to be tested
+	      should be passed as argument.
+ PCITEST_LEGACY_IRQ:
+	      Tests legacy IRQ
+ PCITEST_MSI:
+	      Tests message signalled interrupts. The MSI number
+	      to be tested should be passed as argument.
+ PCITEST_MSIX:
+	      Tests message signalled interrupts. The MSI-X number
+	      to be tested should be passed as argument.
+ PCITEST_SET_IRQTYPE:
+	      Changes driver IRQ type configuration. The IRQ type
+	      should be passed as argument (0: Legacy, 1:MSI, 2:MSI-X).
+ PCITEST_GET_IRQTYPE:
+	      Gets driver IRQ type configuration.
+ PCITEST_WRITE:
+	      Perform write tests. The size of the buffer should be passed
+	      as argument.
+ PCITEST_READ:
+	      Perform read tests. The size of the buffer should be passed
+	      as argument.
+ PCITEST_COPY:
+	      Perform read tests. The size of the buffer should be passed
+	      as argument.
+
+.. [1] Documentation/PCI/endpoint/function/binding/pci-test.txt
diff --git a/Documentation/misc-devices/pci-endpoint-test.txt b/Documentation/misc-devices/pci-endpoint-test.txt
deleted file mode 100644
index 58ccca4416b1..000000000000
--- a/Documentation/misc-devices/pci-endpoint-test.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Driver for PCI Endpoint Test Function
-
-This driver should be used as a host side driver if the root complex is
-connected to a configurable PCI endpoint running *pci_epf_test* function
-driver configured according to [1].
-
-The "pci_endpoint_test" driver can be used to perform the following tests.
-
-The PCI driver for the test device performs the following tests
-	*) verifying addresses programmed in BAR
-	*) raise legacy IRQ
-	*) raise MSI IRQ
-	*) raise MSI-X IRQ
-	*) read data
-	*) write data
-	*) copy data
-
-This misc driver creates /dev/pci-endpoint-test.<num> for every
-*pci_epf_test* function connected to the root complex and "ioctls"
-should be used to perform the above tests.
-
-ioctl
------
- PCITEST_BAR: Tests the BAR. The number of the BAR to be tested
-	      should be passed as argument.
- PCITEST_LEGACY_IRQ: Tests legacy IRQ
- PCITEST_MSI: Tests message signalled interrupts. The MSI number
-	      to be tested should be passed as argument.
- PCITEST_MSIX: Tests message signalled interrupts. The MSI-X number
-	      to be tested should be passed as argument.
- PCITEST_SET_IRQTYPE: Changes driver IRQ type configuration. The IRQ type
-	      should be passed as argument (0: Legacy, 1:MSI, 2:MSI-X).
- PCITEST_GET_IRQTYPE: Gets driver IRQ type configuration.
- PCITEST_WRITE: Perform write tests. The size of the buffer should be passed
-		as argument.
- PCITEST_READ: Perform read tests. The size of the buffer should be passed
-	       as argument.
- PCITEST_COPY: Perform read tests. The size of the buffer should be passed
-	       as argument.
-
-[1] -> Documentation/PCI/endpoint/function/binding/pci-test.txt
-- 
2.24.1

