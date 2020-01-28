Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B59D14BBF0
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 15:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgA1N6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 08:58:46 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58502 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgA1N6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 08:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cLewyjoNlj0NAqOJ/2/JgEHHKOKhNDS+TNzq9GjVM+s=; b=nTrKyZyOKvC9033xyphppKHFro
        6XoM91ErVnMiyDNqsEV3YbJfSnI0s9lMV9yu7W9YXMRnfBpMJ0HpjuZ92qEcoxTH4BhmLe9akbhTb
        9fJVqos2+peiG9R/dN67fqEBlGpzkpVwj/PlwqXLuW63ecbFt+7P71Y62UJbxR3v3GMIbUFfKMbDl
        FI8dI2zz4Q740SNHIQhtx1HVlYCTLDR3HoSTdgP5QJsJ3L+KoxVxw2COra8fffNXNPzR9YNlL6ufE
        sVnpgxaYYiP1yAtq0OrlMADnEyn1YcgfUrS2fIKBay5JOVP7p35XlDo9gG4pNDwlOVsirEy3r/PkM
        K0kgXBUQ==;
Received: from [177.41.103.99] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwRO7-0006I6-U6; Tue, 28 Jan 2020 13:58:44 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwRNq-001BJd-Af; Tue, 28 Jan 2020 14:58:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 07/27] docs: kvm: devices/arm-vgic-its.txt to ReST format
Date:   Tue, 28 Jan 2020 14:58:03 +0100
Message-Id: <5681dbc80e10388917107f3d0b33eb90e2e4b5a3.1580219586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1580219586.git.mchehab+huawei@kernel.org>
References: <cover.1580219586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Fix document title to match ReST format
- Convert the table to be properly recognized
- use proper markups for literal blocks
- Some indentation fixes to match ReST

While here, add an index for kvm devices.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{arm-vgic-its.txt => arm-vgic-its.rst}    | 104 +++++++++++-------
 Documentation/virt/kvm/devices/index.rst      |  10 ++
 Documentation/virt/kvm/index.rst              |   1 +
 3 files changed, 76 insertions(+), 39 deletions(-)
 rename Documentation/virt/kvm/devices/{arm-vgic-its.txt => arm-vgic-its.rst} (71%)
 create mode 100644 Documentation/virt/kvm/devices/index.rst

diff --git a/Documentation/virt/kvm/devices/arm-vgic-its.txt b/Documentation/virt/kvm/devices/arm-vgic-its.rst
similarity index 71%
rename from Documentation/virt/kvm/devices/arm-vgic-its.txt
rename to Documentation/virt/kvm/devices/arm-vgic-its.rst
index eeaa95b893a8..4197d9d6a870 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-its.txt
+++ b/Documentation/virt/kvm/devices/arm-vgic-its.rst
@@ -1,3 +1,4 @@
+===============================================
 ARM Virtual Interrupt Translation Service (ITS)
 ===============================================
 
@@ -12,22 +13,32 @@ There can be multiple ITS controllers per guest, each of them has to have
 a separate, non-overlapping MMIO region.
 
 
-Groups:
-  KVM_DEV_ARM_VGIC_GRP_ADDR
+Groups
+======
+
+KVM_DEV_ARM_VGIC_GRP_ADDR
+-------------------------
+
   Attributes:
     KVM_VGIC_ITS_ADDR_TYPE (rw, 64-bit)
       Base address in the guest physical address space of the GICv3 ITS
       control register frame.
       This address needs to be 64K aligned and the region covers 128K.
+
   Errors:
-    -E2BIG:  Address outside of addressable IPA range
-    -EINVAL: Incorrectly aligned address
-    -EEXIST: Address already configured
-    -EFAULT: Invalid user pointer for attr->addr.
-    -ENODEV: Incorrect attribute or the ITS is not supported.
 
+    =======  =================================================
+    -E2BIG   Address outside of addressable IPA range
+    -EINVAL  Incorrectly aligned address
+    -EEXIST  Address already configured
+    -EFAULT  Invalid user pointer for attr->addr.
+    -ENODEV  Incorrect attribute or the ITS is not supported.
+    =======  =================================================
+
+
+KVM_DEV_ARM_VGIC_GRP_CTRL
+-------------------------
 
-  KVM_DEV_ARM_VGIC_GRP_CTRL
   Attributes:
     KVM_DEV_ARM_VGIC_CTRL_INIT
       request the initialization of the ITS, no additional parameter in
@@ -58,16 +69,21 @@ Groups:
       "ITS Restore Sequence".
 
   Errors:
-    -ENXIO:  ITS not properly configured as required prior to setting
+
+    =======  ==========================================================
+     -ENXIO  ITS not properly configured as required prior to setting
              this attribute
-    -ENOMEM: Memory shortage when allocating ITS internal data
-    -EINVAL: Inconsistent restored data
-    -EFAULT: Invalid guest ram access
-    -EBUSY:  One or more VCPUS are running
-    -EACCES: The virtual ITS is backed by a physical GICv4 ITS, and the
+    -ENOMEM  Memory shortage when allocating ITS internal data
+    -EINVAL  Inconsistent restored data
+    -EFAULT  Invalid guest ram access
+    -EBUSY   One or more VCPUS are running
+    -EACCES  The virtual ITS is backed by a physical GICv4 ITS, and the
 	     state is not available
+    =======  ==========================================================
+
+KVM_DEV_ARM_VGIC_GRP_ITS_REGS
+-----------------------------
 
-  KVM_DEV_ARM_VGIC_GRP_ITS_REGS
   Attributes:
       The attr field of kvm_device_attr encodes the offset of the
       ITS register, relative to the ITS control frame base address
@@ -78,6 +94,7 @@ Groups:
       be accessed with full length.
 
       Writes to read-only registers are ignored by the kernel except for:
+
       - GITS_CREADR. It must be restored otherwise commands in the queue
         will be re-executed after restoring CWRITER. GITS_CREADR must be
         restored before restoring the GITS_CTLR which is likely to enable the
@@ -91,30 +108,36 @@ Groups:
 
       For other registers, getting or setting a register has the same
       effect as reading/writing the register on real hardware.
+
   Errors:
-    -ENXIO: Offset does not correspond to any supported register
-    -EFAULT: Invalid user pointer for attr->addr
-    -EINVAL: Offset is not 64-bit aligned
-    -EBUSY: one or more VCPUS are running
 
- ITS Restore Sequence:
- -------------------------
+    =======  ====================================================
+    -ENXIO   Offset does not correspond to any supported register
+    -EFAULT  Invalid user pointer for attr->addr
+    -EINVAL  Offset is not 64-bit aligned
+    -EBUSY   one or more VCPUS are running
+    =======  ====================================================
+
+ITS Restore Sequence:
+---------------------
 
 The following ordering must be followed when restoring the GIC and the ITS:
+
 a) restore all guest memory and create vcpus
 b) restore all redistributors
 c) provide the ITS base address
    (KVM_DEV_ARM_VGIC_GRP_ADDR)
 d) restore the ITS in the following order:
-   1. Restore GITS_CBASER
-   2. Restore all other GITS_ registers, except GITS_CTLR!
-   3. Load the ITS table data (KVM_DEV_ARM_ITS_RESTORE_TABLES)
-   4. Restore GITS_CTLR
+
+     1. Restore GITS_CBASER
+     2. Restore all other ``GITS_`` registers, except GITS_CTLR!
+     3. Load the ITS table data (KVM_DEV_ARM_ITS_RESTORE_TABLES)
+     4. Restore GITS_CTLR
 
 Then vcpus can be started.
 
- ITS Table ABI REV0:
- -------------------
+ITS Table ABI REV0:
+-------------------
 
  Revision 0 of the ABI only supports the features of a virtual GICv3, and does
  not support a virtual GICv4 with support for direct injection of virtual
@@ -125,12 +148,13 @@ Then vcpus can be started.
  entries in the collection are listed in no particular order.
  All entries are 8 bytes.
 
- Device Table Entry (DTE):
+ Device Table Entry (DTE)::
 
- bits:     | 63| 62 ... 49 | 48 ... 5 | 4 ... 0 |
- values:   | V |   next    | ITT_addr |  Size   |
+   bits:     | 63| 62 ... 49 | 48 ... 5 | 4 ... 0 |
+   values:   | V |   next    | ITT_addr |  Size   |
+
+ where:
 
- where;
  - V indicates whether the entry is valid. If not, other fields
    are not meaningful.
  - next: equals to 0 if this entry is the last one; otherwise it
@@ -140,32 +164,34 @@ Then vcpus can be started.
  - Size specifies the supported number of bits for the EventID,
    minus one
 
- Collection Table Entry (CTE):
+ Collection Table Entry (CTE)::
 
- bits:     | 63| 62 ..  52  | 51 ... 16 | 15  ...   0 |
- values:   | V |    RES0    |  RDBase   |    ICID     |
+   bits:     | 63| 62 ..  52  | 51 ... 16 | 15  ...   0 |
+   values:   | V |    RES0    |  RDBase   |    ICID     |
 
  where:
+
  - V indicates whether the entry is valid. If not, other fields are
    not meaningful.
  - RES0: reserved field with Should-Be-Zero-or-Preserved behavior.
  - RDBase is the PE number (GICR_TYPER.Processor_Number semantic),
  - ICID is the collection ID
 
- Interrupt Translation Entry (ITE):
+ Interrupt Translation Entry (ITE)::
 
- bits:     | 63 ... 48 | 47 ... 16 | 15 ... 0 |
- values:   |    next   |   pINTID  |  ICID    |
+   bits:     | 63 ... 48 | 47 ... 16 | 15 ... 0 |
+   values:   |    next   |   pINTID  |  ICID    |
 
  where:
+
  - next: equals to 0 if this entry is the last one; otherwise it corresponds
    to the EventID offset to the next ITE capped by 2^16 -1.
  - pINTID is the physical LPI ID; if zero, it means the entry is not valid
    and other fields are not meaningful.
  - ICID is the collection ID
 
- ITS Reset State:
- ----------------
+ITS Reset State:
+----------------
 
 RESET returns the ITS to the same state that it was when first created and
 initialized. When the RESET command returns, the following things are
diff --git a/Documentation/virt/kvm/devices/index.rst b/Documentation/virt/kvm/devices/index.rst
new file mode 100644
index 000000000000..2aad8d426097
--- /dev/null
+++ b/Documentation/virt/kvm/devices/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======
+Devices
+=======
+
+.. toctree::
+   :maxdepth: 2
+
+   arm-vgic-its
diff --git a/Documentation/virt/kvm/index.rst b/Documentation/virt/kvm/index.rst
index cc6dde47b267..24d1076ec680 100644
--- a/Documentation/virt/kvm/index.rst
+++ b/Documentation/virt/kvm/index.rst
@@ -14,3 +14,4 @@ KVM
    vcpu-requests
 
    arm/index
+   devices/index
-- 
2.24.1

