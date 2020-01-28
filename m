Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D22EF14BC1C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 15:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgA1OvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 09:51:05 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58476 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbgA1N6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 08:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RXe1JKO96FijdOP7zXpZboFzdx1W+5+6NP6MZ/BiAps=; b=SKyRfa3/Xa/31PJ5JhDJx/Izne
        57hdUUFxjfpyAi/K2326Gw2T3dOyR6hU4jkxQP2LAUNae10Ejr4k3iRE8NcjEjVYpGjcd/a464AP2
        tYLMnQJ3apTWRkOUHYmjgstWTlB5o6MyDG9CDfycLDT7WCT7eHlCi47YcKSj3T003lJ6Ahw11L/is
        qp0QSbX4LZt78YtpJ+uv+IXcIfhVR76avtvJUAoLXvCKL31dVXXBbQjwaNh4ZPJi9QHBXRh6ArTe3
        zohP9rIk4+3gam0ZwTocYKAC5y2JmZ51Lp5voKz3GjzcPIWQC+/aAaYSHs9fecmC8VMywtq6V/FIZ
        1URwuV8A==;
Received: from [177.41.103.99] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwRO7-0006KP-U5; Tue, 28 Jan 2020 13:58:43 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwRNq-001BJt-FE; Tue, 28 Jan 2020 14:58:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 11/27] docs: kvm: convert devices/s390_flic.txt to ReST
Date:   Tue, 28 Jan 2020 14:58:07 +0100
Message-Id: <12634be89f4a8b662bf4bc0a0c7baef42675548f.1580219586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1580219586.git.mchehab+huawei@kernel.org>
References: <cover.1580219586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Use standard markup for document title;
- Adjust indentation and add blank lines as needed;
- use the notes markup;
- mark code blocks as such.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/kvm/devices/index.rst      |  1 +
 .../devices/{s390_flic.txt => s390_flic.rst}  | 68 +++++++++++--------
 2 files changed, 39 insertions(+), 30 deletions(-)
 rename Documentation/virt/kvm/devices/{s390_flic.txt => s390_flic.rst} (88%)

diff --git a/Documentation/virt/kvm/devices/index.rst b/Documentation/virt/kvm/devices/index.rst
index 9e5586e371de..e6caccc36623 100644
--- a/Documentation/virt/kvm/devices/index.rst
+++ b/Documentation/virt/kvm/devices/index.rst
@@ -11,3 +11,4 @@ Devices
    arm-vgic
    arm-vgic-v3
    mpic
+   s390_flic
diff --git a/Documentation/virt/kvm/devices/s390_flic.txt b/Documentation/virt/kvm/devices/s390_flic.rst
similarity index 88%
rename from Documentation/virt/kvm/devices/s390_flic.txt
rename to Documentation/virt/kvm/devices/s390_flic.rst
index a4e20a090174..860fa0dec9b7 100644
--- a/Documentation/virt/kvm/devices/s390_flic.txt
+++ b/Documentation/virt/kvm/devices/s390_flic.rst
@@ -1,3 +1,4 @@
+====================================
 FLIC (floating interrupt controller)
 ====================================
 
@@ -31,8 +32,10 @@ Groups:
     Copies all floating interrupts into a buffer provided by userspace.
     When the buffer is too small it returns -ENOMEM, which is the indication
     for userspace to try again with a bigger buffer.
+
     -ENOBUFS is returned when the allocation of a kernelspace buffer has
     failed.
+
     -EFAULT is returned when copying data to userspace failed.
     All interrupts remain pending, i.e. are not deleted from the list of
     currently pending interrupts.
@@ -60,38 +63,41 @@ Groups:
 
   KVM_DEV_FLIC_ADAPTER_REGISTER
     Register an I/O adapter interrupt source. Takes a kvm_s390_io_adapter
-    describing the adapter to register:
+    describing the adapter to register::
 
-struct kvm_s390_io_adapter {
-	__u32 id;
-	__u8 isc;
-	__u8 maskable;
-	__u8 swap;
-	__u8 flags;
-};
+	struct kvm_s390_io_adapter {
+		__u32 id;
+		__u8 isc;
+		__u8 maskable;
+		__u8 swap;
+		__u8 flags;
+	};
 
    id contains the unique id for the adapter, isc the I/O interruption subclass
    to use, maskable whether this adapter may be masked (interrupts turned off),
    swap whether the indicators need to be byte swapped, and flags contains
    further characteristics of the adapter.
+
    Currently defined values for 'flags' are:
+
    - KVM_S390_ADAPTER_SUPPRESSIBLE: adapter is subject to AIS
      (adapter-interrupt-suppression) facility. This flag only has an effect if
      the AIS capability is enabled.
+
    Unknown flag values are ignored.
 
 
   KVM_DEV_FLIC_ADAPTER_MODIFY
     Modifies attributes of an existing I/O adapter interrupt source. Takes
-    a kvm_s390_io_adapter_req specifying the adapter and the operation:
+    a kvm_s390_io_adapter_req specifying the adapter and the operation::
 
-struct kvm_s390_io_adapter_req {
-	__u32 id;
-	__u8 type;
-	__u8 mask;
-	__u16 pad0;
-	__u64 addr;
-};
+	struct kvm_s390_io_adapter_req {
+		__u32 id;
+		__u8 type;
+		__u8 mask;
+		__u16 pad0;
+		__u64 addr;
+	};
 
     id specifies the adapter and type the operation. The supported operations
     are:
@@ -103,8 +109,9 @@ struct kvm_s390_io_adapter_req {
       perform a gmap translation for the guest address provided in addr,
       pin a userspace page for the translated address and add it to the
       list of mappings
-      Note: A new mapping will be created unconditionally; therefore,
-            the calling code should avoid making duplicate mappings.
+
+      .. note:: A new mapping will be created unconditionally; therefore,
+	        the calling code should avoid making duplicate mappings.
 
     KVM_S390_IO_ADAPTER_UNMAP
       release a userspace page for the translated address specified in addr
@@ -112,16 +119,17 @@ struct kvm_s390_io_adapter_req {
 
   KVM_DEV_FLIC_AISM
     modify the adapter-interruption-suppression mode for a given isc if the
-    AIS capability is enabled. Takes a kvm_s390_ais_req describing:
+    AIS capability is enabled. Takes a kvm_s390_ais_req describing::
 
-struct kvm_s390_ais_req {
-	__u8 isc;
-	__u16 mode;
-};
+	struct kvm_s390_ais_req {
+		__u8 isc;
+		__u16 mode;
+	};
 
     isc contains the target I/O interruption subclass, mode the target
     adapter-interruption-suppression mode. The following modes are
     currently supported:
+
     - KVM_S390_AIS_MODE_ALL: ALL-Interruptions Mode, i.e. airq injection
       is always allowed;
     - KVM_S390_AIS_MODE_SINGLE: SINGLE-Interruption Mode, i.e. airq
@@ -139,12 +147,12 @@ struct kvm_s390_ais_req {
 
   KVM_DEV_FLIC_AISM_ALL
     Gets or sets the adapter-interruption-suppression mode for all ISCs. Takes
-    a kvm_s390_ais_all describing:
+    a kvm_s390_ais_all describing::
 
-struct kvm_s390_ais_all {
-       __u8 simm; /* Single-Interruption-Mode mask */
-       __u8 nimm; /* No-Interruption-Mode mask *
-};
+	struct kvm_s390_ais_all {
+	       __u8 simm; /* Single-Interruption-Mode mask */
+	       __u8 nimm; /* No-Interruption-Mode mask *
+	};
 
     simm contains Single-Interruption-Mode mask for all ISCs, nimm contains
     No-Interruption-Mode mask for all ISCs. Each bit in simm and nimm corresponds
@@ -159,5 +167,5 @@ ENXIO, as specified in the API documentation). It is not possible to conclude
 that a FLIC operation is unavailable based on the error code resulting from a
 usage attempt.
 
-Note: The KVM_DEV_FLIC_CLEAR_IO_IRQ ioctl will return EINVAL in case a zero
-schid is specified.
+.. note:: The KVM_DEV_FLIC_CLEAR_IO_IRQ ioctl will return EINVAL in case a
+	  zero schid is specified.
-- 
2.24.1

