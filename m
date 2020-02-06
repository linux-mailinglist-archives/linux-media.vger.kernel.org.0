Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 722831546A7
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 15:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgBFOvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 09:51:08 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55544 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbgBFOui (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 09:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Reply-To:Content-ID:Content-Description;
        bh=3UnzF7zjF64RwcwS2b9xfPl03ZdlzYowUq2l+Ymomh8=; b=X1yDGJ66fKNu74LceV8R2AM/pF
        ctNH3paKL7XRmIL41GuARTtn30s1AfIBMJ2ZkWEBHREFZp2G9YuKRSD4phXe4wDJQssZr3hO5iS77
        Oxyvn8gdWr14DcC4mPBrSI+raNXwSjy/2jug9grUtzVDzWVu5D6comLp2ehcMmv7Xwl1ulIsYXx8F
        ISde6blOBwRGi/94wWvSGnBmqtpWHlignG6qi7hz7EjfCogbk6E2nmMntLDfAew2Tyy3x6arVWK4b
        bnSJrHSOXeHUC+xha+tcykTVUBz6ka7IRhc9EFvwvmll1TQHgo3el0U+OsQeEtWysfniAiZAVWpqb
        81x+TxIA==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iziUE-0004Ib-SK; Thu, 06 Feb 2020 14:50:37 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iziU6-002nLQ-Qp; Thu, 06 Feb 2020 15:50:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 17/27] docs: kvm: Convert api.txt to ReST format
Date:   Thu,  6 Feb 2020 15:50:14 +0100
Message-Id: <dbfa0053ee201a6eaeb66511208e03acc13f4c6d.1581000481.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581000481.git.mchehab+huawei@kernel.org>
References: <cover.1581000481.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

convert api.txt document to ReST format while trying to keep
its format as close as possible with the authors intent, and
avoid adding uneeded markups.

- Use document title and chapter markups;
- Convert tables;
- Add markups for literal blocks;
- use :field: for field descriptions;
- Add blank lines and adjust indentation

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/kvm/{api.txt => api.rst} | 3348 +++++++++++--------
 Documentation/virt/kvm/index.rst            |    1 +
 2 files changed, 1963 insertions(+), 1386 deletions(-)
 rename Documentation/virt/kvm/{api.txt => api.rst} (71%)

diff --git a/Documentation/virt/kvm/api.txt b/Documentation/virt/kvm/api.rst
similarity index 71%
rename from Documentation/virt/kvm/api.txt
rename to Documentation/virt/kvm/api.rst
index c6e1ce5d40de..97a72a53fa4b 100644
--- a/Documentation/virt/kvm/api.txt
+++ b/Documentation/virt/kvm/api.rst
@@ -1,8 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================================================
 The Definitive KVM (Kernel-based Virtual Machine) API Documentation
 ===================================================================
 
 1. General description
-----------------------
+======================
 
 The kvm API is a set of ioctls that are issued to control various aspects
 of a virtual machine.  The ioctls belong to the following classes:
@@ -33,7 +36,7 @@ of a virtual machine.  The ioctls belong to the following classes:
    was used to create the VM.
 
 2. File descriptors
--------------------
+===================
 
 The kvm API is centered around file descriptors.  An initial
 open("/dev/kvm") obtains a handle to the kvm subsystem; this handle
@@ -70,7 +73,7 @@ the VM is shut down.
 
 
 3. Extensions
--------------
+=============
 
 As of Linux 2.6.22, the KVM ABI has been stabilized: no backward
 incompatible change are allowed.  However, there is an extension
@@ -84,13 +87,14 @@ set of ioctls is available for application use.
 
 
 4. API description
-------------------
+==================
 
 This section describes ioctls that can be used to control kvm guests.
 For each ioctl, the following information is provided along with a
 description:
 
-  Capability: which KVM extension provides this ioctl.  Can be 'basic',
+  Capability:
+      which KVM extension provides this ioctl.  Can be 'basic',
       which means that is will be provided by any kernel that supports
       API version 12 (see section 4.1), a KVM_CAP_xyz constant, which
       means availability needs to be checked with KVM_CHECK_EXTENSION
@@ -99,24 +103,29 @@ description:
       availability: for kernels that don't support the ioctl,
       the ioctl returns -ENOTTY.
 
-  Architectures: which instruction set architectures provide this ioctl.
+  Architectures:
+      which instruction set architectures provide this ioctl.
       x86 includes both i386 and x86_64.
 
-  Type: system, vm, or vcpu.
+  Type:
+      system, vm, or vcpu.
 
-  Parameters: what parameters are accepted by the ioctl.
+  Parameters:
+      what parameters are accepted by the ioctl.
 
-  Returns: the return value.  General error numbers (EBADF, ENOMEM, EINVAL)
+  Returns:
+      the return value.  General error numbers (EBADF, ENOMEM, EINVAL)
       are not detailed, but errors with specific meanings are.
 
 
 4.1 KVM_GET_API_VERSION
+-----------------------
 
-Capability: basic
-Architectures: all
-Type: system ioctl
-Parameters: none
-Returns: the constant KVM_API_VERSION (=12)
+:Capability: basic
+:Architectures: all
+:Type: system ioctl
+:Parameters: none
+:Returns: the constant KVM_API_VERSION (=12)
 
 This identifies the API version as the stable kvm API. It is not
 expected that this number will change.  However, Linux 2.6.20 and
@@ -127,12 +136,13 @@ described as 'basic' will be available.
 
 
 4.2 KVM_CREATE_VM
+-----------------
 
-Capability: basic
-Architectures: all
-Type: system ioctl
-Parameters: machine type identifier (KVM_VM_*)
-Returns: a VM fd that can be used to control the new virtual machine.
+:Capability: basic
+:Architectures: all
+:Type: system ioctl
+:Parameters: machine type identifier (KVM_VM_*)
+:Returns: a VM fd that can be used to control the new virtual machine.
 
 The new VM has no virtual cpus and no memory.
 You probably want to use 0 as machine type.
@@ -155,17 +165,17 @@ identifier, where IPA_Bits is the maximum width of any physical
 address used by the VM. The IPA_Bits is encoded in bits[7-0] of the
 machine type identifier.
 
-e.g, to configure a guest to use 48bit physical address size :
+e.g, to configure a guest to use 48bit physical address size::
 
     vm_fd = ioctl(dev_fd, KVM_CREATE_VM, KVM_VM_TYPE_ARM_IPA_SIZE(48));
 
-The requested size (IPA_Bits) must be :
-  0 - Implies default size, 40bits (for backward compatibility)
+The requested size (IPA_Bits) must be:
 
-  or
-
-  N - Implies N bits, where N is a positive integer such that,
+ ==   =========================================================
+  0   Implies default size, 40bits (for backward compatibility)
+  N   Implies N bits, where N is a positive integer such that,
       32 <= N <= Host_IPA_Limit
+ ==   =========================================================
 
 Host_IPA_Limit is the maximum possible value for IPA_Bits on the host and
 is dependent on the CPU capability and the kernel configuration. The limit can
@@ -179,21 +189,28 @@ host physical address translations).
 
 
 4.3 KVM_GET_MSR_INDEX_LIST, KVM_GET_MSR_FEATURE_INDEX_LIST
+----------------------------------------------------------
+
+:Capability: basic, KVM_CAP_GET_MSR_FEATURES for KVM_GET_MSR_FEATURE_INDEX_LIST
+:Architectures: x86
+:Type: system ioctl
+:Parameters: struct kvm_msr_list (in/out)
+:Returns: 0 on success; -1 on error
 
-Capability: basic, KVM_CAP_GET_MSR_FEATURES for KVM_GET_MSR_FEATURE_INDEX_LIST
-Architectures: x86
-Type: system ioctl
-Parameters: struct kvm_msr_list (in/out)
-Returns: 0 on success; -1 on error
 Errors:
-  EFAULT:    the msr index list cannot be read from or written to
-  E2BIG:     the msr index list is to be to fit in the array specified by
+
+  ======     ============================================================
+  EFAULT     the msr index list cannot be read from or written to
+  E2BIG      the msr index list is to be to fit in the array specified by
              the user.
+  ======     ============================================================
 
-struct kvm_msr_list {
+::
+
+  struct kvm_msr_list {
 	__u32 nmsrs; /* number of msrs in entries */
 	__u32 indices[0];
-};
+  };
 
 The user fills in the size of the indices array in nmsrs, and in return
 kvm adjusts nmsrs to reflect the actual number of msrs and fills in the
@@ -214,12 +231,13 @@ otherwise.
 
 
 4.4 KVM_CHECK_EXTENSION
+-----------------------
 
-Capability: basic, KVM_CAP_CHECK_EXTENSION_VM for vm ioctl
-Architectures: all
-Type: system ioctl, vm ioctl
-Parameters: extension identifier (KVM_CAP_*)
-Returns: 0 if unsupported; 1 (or some other positive integer) if supported
+:Capability: basic, KVM_CAP_CHECK_EXTENSION_VM for vm ioctl
+:Architectures: all
+:Type: system ioctl, vm ioctl
+:Parameters: extension identifier (KVM_CAP_*)
+:Returns: 0 if unsupported; 1 (or some other positive integer) if supported
 
 The API allows the application to query about extensions to the core
 kvm API.  Userspace passes an extension identifier (an integer) and
@@ -232,12 +250,13 @@ It is thus encouraged to use the vm ioctl to query for capabilities (available
 with KVM_CAP_CHECK_EXTENSION_VM on the vm fd)
 
 4.5 KVM_GET_VCPU_MMAP_SIZE
+--------------------------
 
-Capability: basic
-Architectures: all
-Type: system ioctl
-Parameters: none
-Returns: size of vcpu mmap area, in bytes
+:Capability: basic
+:Architectures: all
+:Type: system ioctl
+:Parameters: none
+:Returns: size of vcpu mmap area, in bytes
 
 The KVM_RUN ioctl (cf.) communicates with userspace via a shared
 memory region.  This ioctl returns the size of that region.  See the
@@ -245,23 +264,25 @@ KVM_RUN documentation for details.
 
 
 4.6 KVM_SET_MEMORY_REGION
+-------------------------
 
-Capability: basic
-Architectures: all
-Type: vm ioctl
-Parameters: struct kvm_memory_region (in)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: all
+:Type: vm ioctl
+:Parameters: struct kvm_memory_region (in)
+:Returns: 0 on success, -1 on error
 
 This ioctl is obsolete and has been removed.
 
 
 4.7 KVM_CREATE_VCPU
+-------------------
 
-Capability: basic
-Architectures: all
-Type: vm ioctl
-Parameters: vcpu id (apic id on x86)
-Returns: vcpu fd on success, -1 on error
+:Capability: basic
+:Architectures: all
+:Type: vm ioctl
+:Parameters: vcpu id (apic id on x86)
+:Returns: vcpu fd on success, -1 on error
 
 This API adds a vcpu to a virtual machine. No more than max_vcpus may be added.
 The vcpu id is an integer in the range [0, max_vcpu_id).
@@ -302,22 +323,25 @@ cpu's hardware control block.
 
 
 4.8 KVM_GET_DIRTY_LOG (vm ioctl)
+--------------------------------
 
-Capability: basic
-Architectures: all
-Type: vm ioctl
-Parameters: struct kvm_dirty_log (in/out)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: all
+:Type: vm ioctl
+:Parameters: struct kvm_dirty_log (in/out)
+:Returns: 0 on success, -1 on error
 
-/* for KVM_GET_DIRTY_LOG */
-struct kvm_dirty_log {
+::
+
+  /* for KVM_GET_DIRTY_LOG */
+  struct kvm_dirty_log {
 	__u32 slot;
 	__u32 padding;
 	union {
 		void __user *dirty_bitmap; /* one bit per page */
 		__u64 padding;
 	};
-};
+  };
 
 Given a memory slot, return a bitmap containing any pages dirtied
 since the last call to this ioctl.  Bit 0 is the first page in the
@@ -334,25 +358,31 @@ KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is enabled.  For more information,
 see the description of the capability.
 
 4.9 KVM_SET_MEMORY_ALIAS
+------------------------
 
-Capability: basic
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_memory_alias (in)
-Returns: 0 (success), -1 (error)
+:Capability: basic
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_memory_alias (in)
+:Returns: 0 (success), -1 (error)
 
 This ioctl is obsolete and has been removed.
 
 
 4.10 KVM_RUN
+------------
+
+:Capability: basic
+:Architectures: all
+:Type: vcpu ioctl
+:Parameters: none
+:Returns: 0 on success, -1 on error
 
-Capability: basic
-Architectures: all
-Type: vcpu ioctl
-Parameters: none
-Returns: 0 on success, -1 on error
 Errors:
-  EINTR:     an unmasked signal is pending
+
+  =====      =============================
+  EINTR      an unmasked signal is pending
+  =====      =============================
 
 This ioctl is used to run a guest virtual cpu.  While there are no
 explicit parameters, there is an implicit parameter block that can be
@@ -362,42 +392,46 @@ kvm_run' (see below).
 
 
 4.11 KVM_GET_REGS
+-----------------
 
-Capability: basic
-Architectures: all except ARM, arm64
-Type: vcpu ioctl
-Parameters: struct kvm_regs (out)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: all except ARM, arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_regs (out)
+:Returns: 0 on success, -1 on error
 
 Reads the general purpose registers from the vcpu.
 
-/* x86 */
-struct kvm_regs {
+::
+
+  /* x86 */
+  struct kvm_regs {
 	/* out (KVM_GET_REGS) / in (KVM_SET_REGS) */
 	__u64 rax, rbx, rcx, rdx;
 	__u64 rsi, rdi, rsp, rbp;
 	__u64 r8,  r9,  r10, r11;
 	__u64 r12, r13, r14, r15;
 	__u64 rip, rflags;
-};
+  };
 
-/* mips */
-struct kvm_regs {
+  /* mips */
+  struct kvm_regs {
 	/* out (KVM_GET_REGS) / in (KVM_SET_REGS) */
 	__u64 gpr[32];
 	__u64 hi;
 	__u64 lo;
 	__u64 pc;
-};
+  };
 
 
 4.12 KVM_SET_REGS
+-----------------
 
-Capability: basic
-Architectures: all except ARM, arm64
-Type: vcpu ioctl
-Parameters: struct kvm_regs (in)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: all except ARM, arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_regs (in)
+:Returns: 0 on success, -1 on error
 
 Writes the general purpose registers into the vcpu.
 
@@ -405,17 +439,20 @@ See KVM_GET_REGS for the data structure.
 
 
 4.13 KVM_GET_SREGS
+------------------
 
-Capability: basic
-Architectures: x86, ppc
-Type: vcpu ioctl
-Parameters: struct kvm_sregs (out)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: x86, ppc
+:Type: vcpu ioctl
+:Parameters: struct kvm_sregs (out)
+:Returns: 0 on success, -1 on error
 
 Reads special registers from the vcpu.
 
-/* x86 */
-struct kvm_sregs {
+::
+
+  /* x86 */
+  struct kvm_sregs {
 	struct kvm_segment cs, ds, es, fs, gs, ss;
 	struct kvm_segment tr, ldt;
 	struct kvm_dtable gdt, idt;
@@ -423,9 +460,9 @@ struct kvm_sregs {
 	__u64 efer;
 	__u64 apic_base;
 	__u64 interrupt_bitmap[(KVM_NR_INTERRUPTS + 63) / 64];
-};
+  };
 
-/* ppc -- see arch/powerpc/include/uapi/asm/kvm.h */
+  /* ppc -- see arch/powerpc/include/uapi/asm/kvm.h */
 
 interrupt_bitmap is a bitmap of pending external interrupts.  At most
 one bit may be set.  This interrupt has been acknowledged by the APIC
@@ -433,29 +470,33 @@ but not yet injected into the cpu core.
 
 
 4.14 KVM_SET_SREGS
+------------------
 
-Capability: basic
-Architectures: x86, ppc
-Type: vcpu ioctl
-Parameters: struct kvm_sregs (in)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: x86, ppc
+:Type: vcpu ioctl
+:Parameters: struct kvm_sregs (in)
+:Returns: 0 on success, -1 on error
 
 Writes special registers into the vcpu.  See KVM_GET_SREGS for the
 data structures.
 
 
 4.15 KVM_TRANSLATE
+------------------
 
-Capability: basic
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_translation (in/out)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_translation (in/out)
+:Returns: 0 on success, -1 on error
 
 Translates a virtual address according to the vcpu's current address
 translation mode.
 
-struct kvm_translation {
+::
+
+  struct kvm_translation {
 	/* in */
 	__u64 linear_address;
 
@@ -465,59 +506,68 @@ struct kvm_translation {
 	__u8  writeable;
 	__u8  usermode;
 	__u8  pad[5];
-};
+  };
 
 
 4.16 KVM_INTERRUPT
+------------------
 
-Capability: basic
-Architectures: x86, ppc, mips
-Type: vcpu ioctl
-Parameters: struct kvm_interrupt (in)
-Returns: 0 on success, negative on failure.
+:Capability: basic
+:Architectures: x86, ppc, mips
+:Type: vcpu ioctl
+:Parameters: struct kvm_interrupt (in)
+:Returns: 0 on success, negative on failure.
 
 Queues a hardware interrupt vector to be injected.
 
-/* for KVM_INTERRUPT */
-struct kvm_interrupt {
+::
+
+  /* for KVM_INTERRUPT */
+  struct kvm_interrupt {
 	/* in */
 	__u32 irq;
-};
+  };
 
 X86:
+^^^^
 
-Returns: 0 on success,
-	 -EEXIST if an interrupt is already enqueued
-	 -EINVAL the the irq number is invalid
-	 -ENXIO if the PIC is in the kernel
-	 -EFAULT if the pointer is invalid
+:Returns:
+
+	========= ===================================
+	  0       on success,
+	 -EEXIST  if an interrupt is already enqueued
+	 -EINVAL  the the irq number is invalid
+	 -ENXIO   if the PIC is in the kernel
+	 -EFAULT  if the pointer is invalid
+	========= ===================================
 
 Note 'irq' is an interrupt vector, not an interrupt pin or line. This
 ioctl is useful if the in-kernel PIC is not used.
 
 PPC:
+^^^^
 
 Queues an external interrupt to be injected. This ioctl is overleaded
 with 3 different irq values:
 
 a) KVM_INTERRUPT_SET
 
-  This injects an edge type external interrupt into the guest once it's ready
-  to receive interrupts. When injected, the interrupt is done.
+   This injects an edge type external interrupt into the guest once it's ready
+   to receive interrupts. When injected, the interrupt is done.
 
 b) KVM_INTERRUPT_UNSET
 
-  This unsets any pending interrupt.
+   This unsets any pending interrupt.
 
-  Only available with KVM_CAP_PPC_UNSET_IRQ.
+   Only available with KVM_CAP_PPC_UNSET_IRQ.
 
 c) KVM_INTERRUPT_SET_LEVEL
 
-  This injects a level type external interrupt into the guest context. The
-  interrupt stays pending until a specific ioctl with KVM_INTERRUPT_UNSET
-  is triggered.
+   This injects a level type external interrupt into the guest context. The
+   interrupt stays pending until a specific ioctl with KVM_INTERRUPT_UNSET
+   is triggered.
 
-  Only available with KVM_CAP_PPC_IRQ_LEVEL.
+   Only available with KVM_CAP_PPC_IRQ_LEVEL.
 
 Note that any value for 'irq' other than the ones stated above is invalid
 and incurs unexpected behavior.
@@ -525,6 +575,7 @@ and incurs unexpected behavior.
 This is an asynchronous vcpu ioctl and can be invoked from any thread.
 
 MIPS:
+^^^^^
 
 Queues an external interrupt to be injected into the virtual CPU. A negative
 interrupt number dequeues the interrupt.
@@ -533,24 +584,26 @@ This is an asynchronous vcpu ioctl and can be invoked from any thread.
 
 
 4.17 KVM_DEBUG_GUEST
+--------------------
 
-Capability: basic
-Architectures: none
-Type: vcpu ioctl
-Parameters: none)
-Returns: -1 on error
+:Capability: basic
+:Architectures: none
+:Type: vcpu ioctl
+:Parameters: none)
+:Returns: -1 on error
 
 Support for this has been removed.  Use KVM_SET_GUEST_DEBUG instead.
 
 
 4.18 KVM_GET_MSRS
+-----------------
 
-Capability: basic (vcpu), KVM_CAP_GET_MSR_FEATURES (system)
-Architectures: x86
-Type: system ioctl, vcpu ioctl
-Parameters: struct kvm_msrs (in/out)
-Returns: number of msrs successfully returned;
-        -1 on error
+:Capability: basic (vcpu), KVM_CAP_GET_MSR_FEATURES (system)
+:Architectures: x86
+:Type: system ioctl, vcpu ioctl
+:Parameters: struct kvm_msrs (in/out)
+:Returns: number of msrs successfully returned;
+          -1 on error
 
 When used as a system ioctl:
 Reads the values of MSR-based features that are available for the VM.  This
@@ -562,18 +615,20 @@ When used as a vcpu ioctl:
 Reads model-specific registers from the vcpu.  Supported msr indices can
 be obtained using KVM_GET_MSR_INDEX_LIST in a system ioctl.
 
-struct kvm_msrs {
+::
+
+  struct kvm_msrs {
 	__u32 nmsrs; /* number of msrs in entries */
 	__u32 pad;
 
 	struct kvm_msr_entry entries[0];
-};
+  };
 
-struct kvm_msr_entry {
+  struct kvm_msr_entry {
 	__u32 index;
 	__u32 reserved;
 	__u64 data;
-};
+  };
 
 Application code should set the 'nmsrs' member (which indicates the
 size of the entries array) and the 'index' member of each array entry.
@@ -581,12 +636,13 @@ kvm will fill in the 'data' member.
 
 
 4.19 KVM_SET_MSRS
+-----------------
 
-Capability: basic
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_msrs (in)
-Returns: number of msrs successfully set (see below), -1 on error
+:Capability: basic
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_msrs (in)
+:Returns: number of msrs successfully set (see below), -1 on error
 
 Writes model-specific registers to the vcpu.  See KVM_GET_MSRS for the
 data structures.
@@ -602,41 +658,44 @@ MSRs that have been set successfully.
 
 
 4.20 KVM_SET_CPUID
+------------------
 
-Capability: basic
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_cpuid (in)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_cpuid (in)
+:Returns: 0 on success, -1 on error
 
 Defines the vcpu responses to the cpuid instruction.  Applications
 should use the KVM_SET_CPUID2 ioctl if available.
 
+::
 
-struct kvm_cpuid_entry {
+  struct kvm_cpuid_entry {
 	__u32 function;
 	__u32 eax;
 	__u32 ebx;
 	__u32 ecx;
 	__u32 edx;
 	__u32 padding;
-};
+  };
 
-/* for KVM_SET_CPUID */
-struct kvm_cpuid {
+  /* for KVM_SET_CPUID */
+  struct kvm_cpuid {
 	__u32 nent;
 	__u32 padding;
 	struct kvm_cpuid_entry entries[0];
-};
+  };
 
 
 4.21 KVM_SET_SIGNAL_MASK
+------------------------
 
-Capability: basic
-Architectures: all
-Type: vcpu ioctl
-Parameters: struct kvm_signal_mask (in)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: all
+:Type: vcpu ioctl
+:Parameters: struct kvm_signal_mask (in)
+:Returns: 0 on success, -1 on error
 
 Defines which signals are blocked during execution of KVM_RUN.  This
 signal mask temporarily overrides the threads signal mask.  Any
@@ -646,25 +705,30 @@ their traditional behaviour) will cause KVM_RUN to return with -EINTR.
 Note the signal will only be delivered if not blocked by the original
 signal mask.
 
-/* for KVM_SET_SIGNAL_MASK */
-struct kvm_signal_mask {
+::
+
+  /* for KVM_SET_SIGNAL_MASK */
+  struct kvm_signal_mask {
 	__u32 len;
 	__u8  sigset[0];
-};
+  };
 
 
 4.22 KVM_GET_FPU
+----------------
 
-Capability: basic
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_fpu (out)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_fpu (out)
+:Returns: 0 on success, -1 on error
 
 Reads the floating point state from the vcpu.
 
-/* for KVM_GET_FPU and KVM_SET_FPU */
-struct kvm_fpu {
+::
+
+  /* for KVM_GET_FPU and KVM_SET_FPU */
+  struct kvm_fpu {
 	__u8  fpr[8][16];
 	__u16 fcw;
 	__u16 fsw;
@@ -676,21 +740,24 @@ struct kvm_fpu {
 	__u8  xmm[16][16];
 	__u32 mxcsr;
 	__u32 pad2;
-};
+  };
 
 
 4.23 KVM_SET_FPU
+----------------
 
-Capability: basic
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_fpu (in)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_fpu (in)
+:Returns: 0 on success, -1 on error
 
 Writes the floating point state to the vcpu.
 
-/* for KVM_GET_FPU and KVM_SET_FPU */
-struct kvm_fpu {
+::
+
+  /* for KVM_GET_FPU and KVM_SET_FPU */
+  struct kvm_fpu {
 	__u8  fpr[8][16];
 	__u16 fcw;
 	__u16 fsw;
@@ -702,16 +769,17 @@ struct kvm_fpu {
 	__u8  xmm[16][16];
 	__u32 mxcsr;
 	__u32 pad2;
-};
+  };
 
 
 4.24 KVM_CREATE_IRQCHIP
+-----------------------
 
-Capability: KVM_CAP_IRQCHIP, KVM_CAP_S390_IRQCHIP (s390)
-Architectures: x86, ARM, arm64, s390
-Type: vm ioctl
-Parameters: none
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_IRQCHIP, KVM_CAP_S390_IRQCHIP (s390)
+:Architectures: x86, ARM, arm64, s390
+:Type: vm ioctl
+:Parameters: none
+:Returns: 0 on success, -1 on error
 
 Creates an interrupt controller model in the kernel.
 On x86, creates a virtual ioapic, a virtual PIC (two PICs, nested), and sets up
@@ -727,12 +795,13 @@ before KVM_CREATE_IRQCHIP can be used.
 
 
 4.25 KVM_IRQ_LINE
+-----------------
 
-Capability: KVM_CAP_IRQCHIP
-Architectures: x86, arm, arm64
-Type: vm ioctl
-Parameters: struct kvm_irq_level
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_IRQCHIP
+:Architectures: x86, arm, arm64
+:Type: vm ioctl
+:Parameters: struct kvm_irq_level
+:Returns: 0 on success, -1 on error
 
 Sets the level of a GSI input to the interrupt controller model in the kernel.
 On some architectures it is required that an interrupt controller model has
@@ -756,16 +825,20 @@ of course).
 ARM/arm64 can signal an interrupt either at the CPU level, or at the
 in-kernel irqchip (GIC), and for in-kernel irqchip can tell the GIC to
 use PPIs designated for specific cpus.  The irq field is interpreted
-like this:
+like this::
 
   bits:  |  31 ... 28  | 27 ... 24 | 23  ... 16 | 15 ... 0 |
   field: | vcpu2_index | irq_type  | vcpu_index |  irq_id  |
 
 The irq_type field has the following values:
-- irq_type[0]: out-of-kernel GIC: irq_id 0 is IRQ, irq_id 1 is FIQ
-- irq_type[1]: in-kernel GIC: SPI, irq_id between 32 and 1019 (incl.)
+
+- irq_type[0]:
+	       out-of-kernel GIC: irq_id 0 is IRQ, irq_id 1 is FIQ
+- irq_type[1]:
+	       in-kernel GIC: SPI, irq_id between 32 and 1019 (incl.)
                (the vcpu_index field is ignored)
-- irq_type[2]: in-kernel GIC: PPI, irq_id between 16 and 31 (incl.)
+- irq_type[2]:
+	       in-kernel GIC: PPI, irq_id between 16 and 31 (incl.)
 
 (The irq_id field thus corresponds nicely to the IRQ ID in the ARM GIC specs)
 
@@ -779,27 +852,32 @@ Note that on arm/arm64, the KVM_CAP_IRQCHIP capability only conditions
 injection of interrupts for the in-kernel irqchip. KVM_IRQ_LINE can always
 be used for a userspace interrupt controller.
 
-struct kvm_irq_level {
+::
+
+  struct kvm_irq_level {
 	union {
 		__u32 irq;     /* GSI */
 		__s32 status;  /* not used for KVM_IRQ_LEVEL */
 	};
 	__u32 level;           /* 0 or 1 */
-};
+  };
 
 
 4.26 KVM_GET_IRQCHIP
+--------------------
 
-Capability: KVM_CAP_IRQCHIP
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_irqchip (in/out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_IRQCHIP
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_irqchip (in/out)
+:Returns: 0 on success, -1 on error
 
 Reads the state of a kernel interrupt controller created with
 KVM_CREATE_IRQCHIP into a buffer provided by the caller.
 
-struct kvm_irqchip {
+::
+
+  struct kvm_irqchip {
 	__u32 chip_id;  /* 0 = PIC1, 1 = PIC2, 2 = IOAPIC */
 	__u32 pad;
         union {
@@ -807,21 +885,24 @@ struct kvm_irqchip {
 		struct kvm_pic_state pic;
 		struct kvm_ioapic_state ioapic;
 	} chip;
-};
+  };
 
 
 4.27 KVM_SET_IRQCHIP
+--------------------
 
-Capability: KVM_CAP_IRQCHIP
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_irqchip (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_IRQCHIP
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_irqchip (in)
+:Returns: 0 on success, -1 on error
 
 Sets the state of a kernel interrupt controller created with
 KVM_CREATE_IRQCHIP from a buffer provided by the caller.
 
-struct kvm_irqchip {
+::
+
+  struct kvm_irqchip {
 	__u32 chip_id;  /* 0 = PIC1, 1 = PIC2, 2 = IOAPIC */
 	__u32 pad;
         union {
@@ -829,16 +910,17 @@ struct kvm_irqchip {
 		struct kvm_pic_state pic;
 		struct kvm_ioapic_state ioapic;
 	} chip;
-};
+  };
 
 
 4.28 KVM_XEN_HVM_CONFIG
+-----------------------
 
-Capability: KVM_CAP_XEN_HVM
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_xen_hvm_config (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_XEN_HVM
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_xen_hvm_config (in)
+:Returns: 0 on success, -1 on error
 
 Sets the MSR that the Xen HVM guest uses to initialize its hypercall
 page, and provides the starting address and size of the hypercall
@@ -846,7 +928,9 @@ blobs in userspace.  When the guest writes the MSR, kvm copies one
 page of a blob (32- or 64-bit, depending on the vcpu mode) to guest
 memory.
 
-struct kvm_xen_hvm_config {
+::
+
+  struct kvm_xen_hvm_config {
 	__u32 flags;
 	__u32 msr;
 	__u64 blob_addr_32;
@@ -854,16 +938,17 @@ struct kvm_xen_hvm_config {
 	__u8 blob_size_32;
 	__u8 blob_size_64;
 	__u8 pad2[30];
-};
+  };
 
 
 4.29 KVM_GET_CLOCK
+------------------
 
-Capability: KVM_CAP_ADJUST_CLOCK
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_clock_data (out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_ADJUST_CLOCK
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_clock_data (out)
+:Returns: 0 on success, -1 on error
 
 Gets the current timestamp of kvmclock as seen by the current guest. In
 conjunction with KVM_SET_CLOCK, it is used to ensure monotonicity on scenarios
@@ -880,47 +965,56 @@ with KVM_SET_CLOCK.  KVM will try to make all VCPUs follow this clock,
 but the exact value read by each VCPU could differ, because the host
 TSC is not stable.
 
-struct kvm_clock_data {
+::
+
+  struct kvm_clock_data {
 	__u64 clock;  /* kvmclock current value */
 	__u32 flags;
 	__u32 pad[9];
-};
+  };
 
 
 4.30 KVM_SET_CLOCK
+------------------
 
-Capability: KVM_CAP_ADJUST_CLOCK
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_clock_data (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_ADJUST_CLOCK
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_clock_data (in)
+:Returns: 0 on success, -1 on error
 
 Sets the current timestamp of kvmclock to the value specified in its parameter.
 In conjunction with KVM_GET_CLOCK, it is used to ensure monotonicity on scenarios
 such as migration.
 
-struct kvm_clock_data {
+::
+
+  struct kvm_clock_data {
 	__u64 clock;  /* kvmclock current value */
 	__u32 flags;
 	__u32 pad[9];
-};
+  };
 
 
 4.31 KVM_GET_VCPU_EVENTS
+------------------------
 
-Capability: KVM_CAP_VCPU_EVENTS
-Extended by: KVM_CAP_INTR_SHADOW
-Architectures: x86, arm, arm64
-Type: vcpu ioctl
-Parameters: struct kvm_vcpu_event (out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_VCPU_EVENTS
+:Extended by: KVM_CAP_INTR_SHADOW
+:Architectures: x86, arm, arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_vcpu_event (out)
+:Returns: 0 on success, -1 on error
 
 X86:
+^^^^
 
 Gets currently pending exceptions, interrupts, and NMIs as well as related
 states of the vcpu.
 
-struct kvm_vcpu_events {
+::
+
+  struct kvm_vcpu_events {
 	struct {
 		__u8 injected;
 		__u8 nr;
@@ -951,7 +1045,7 @@ struct kvm_vcpu_events {
 	__u8 reserved[27];
 	__u8 exception_has_payload;
 	__u64 exception_payload;
-};
+  };
 
 The following bits are defined in the flags field:
 
@@ -967,6 +1061,7 @@ The following bits are defined in the flags field:
   KVM_CAP_EXCEPTION_PAYLOAD is enabled.
 
 ARM/ARM64:
+^^^^^^^^^^
 
 If the guest accesses a device that is being emulated by the host kernel in
 such a way that a real device would generate a physical SError, KVM may make
@@ -1006,8 +1101,9 @@ It is not possible to read back a pending external abort (injected via
 KVM_SET_VCPU_EVENTS or otherwise) because such an exception is always delivered
 directly to the virtual CPU).
 
+::
 
-struct kvm_vcpu_events {
+  struct kvm_vcpu_events {
 	struct {
 		__u8 serror_pending;
 		__u8 serror_has_esr;
@@ -1017,18 +1113,20 @@ struct kvm_vcpu_events {
 		__u64 serror_esr;
 	} exception;
 	__u32 reserved[12];
-};
+  };
 
 4.32 KVM_SET_VCPU_EVENTS
+------------------------
 
-Capability: KVM_CAP_VCPU_EVENTS
-Extended by: KVM_CAP_INTR_SHADOW
-Architectures: x86, arm, arm64
-Type: vcpu ioctl
-Parameters: struct kvm_vcpu_event (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_VCPU_EVENTS
+:Extended by: KVM_CAP_INTR_SHADOW
+:Architectures: x86, arm, arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_vcpu_event (in)
+:Returns: 0 on success, -1 on error
 
 X86:
+^^^^
 
 Set pending exceptions, interrupts, and NMIs as well as related states of the
 vcpu.
@@ -1040,9 +1138,11 @@ from the update. These fields are nmi.pending, sipi_vector, smi.smm,
 smi.pending. Keep the corresponding bits in the flags field cleared to
 suppress overwriting the current in-kernel state. The bits are:
 
-KVM_VCPUEVENT_VALID_NMI_PENDING - transfer nmi.pending to the kernel
-KVM_VCPUEVENT_VALID_SIPI_VECTOR - transfer sipi_vector
-KVM_VCPUEVENT_VALID_SMM         - transfer the smi sub-struct.
+===============================  ==================================
+KVM_VCPUEVENT_VALID_NMI_PENDING  transfer nmi.pending to the kernel
+KVM_VCPUEVENT_VALID_SIPI_VECTOR  transfer sipi_vector
+KVM_VCPUEVENT_VALID_SMM          transfer the smi sub-struct.
+===============================  ==================================
 
 If KVM_CAP_INTR_SHADOW is available, KVM_VCPUEVENT_VALID_SHADOW can be set in
 the flags field to signal that interrupt.shadow contains a valid state and
@@ -1056,6 +1156,7 @@ exception_has_payload, exception_payload, and exception.pending fields
 contain a valid state and shall be written into the VCPU.
 
 ARM/ARM64:
+^^^^^^^^^^
 
 User space may need to inject several types of events to the guest.
 
@@ -1078,31 +1179,35 @@ See KVM_GET_VCPU_EVENTS for the data structure.
 
 
 4.33 KVM_GET_DEBUGREGS
+----------------------
 
-Capability: KVM_CAP_DEBUGREGS
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_debugregs (out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_DEBUGREGS
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_debugregs (out)
+:Returns: 0 on success, -1 on error
 
 Reads debug registers from the vcpu.
 
-struct kvm_debugregs {
+::
+
+  struct kvm_debugregs {
 	__u64 db[4];
 	__u64 dr6;
 	__u64 dr7;
 	__u64 flags;
 	__u64 reserved[9];
-};
+  };
 
 
 4.34 KVM_SET_DEBUGREGS
+----------------------
 
-Capability: KVM_CAP_DEBUGREGS
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_debugregs (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_DEBUGREGS
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_debugregs (in)
+:Returns: 0 on success, -1 on error
 
 Writes debug registers into the vcpu.
 
@@ -1111,24 +1216,27 @@ yet and must be cleared on entry.
 
 
 4.35 KVM_SET_USER_MEMORY_REGION
+-------------------------------
 
-Capability: KVM_CAP_USER_MEMORY
-Architectures: all
-Type: vm ioctl
-Parameters: struct kvm_userspace_memory_region (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_USER_MEMORY
+:Architectures: all
+:Type: vm ioctl
+:Parameters: struct kvm_userspace_memory_region (in)
+:Returns: 0 on success, -1 on error
 
-struct kvm_userspace_memory_region {
+::
+
+  struct kvm_userspace_memory_region {
 	__u32 slot;
 	__u32 flags;
 	__u64 guest_phys_addr;
 	__u64 memory_size; /* bytes */
 	__u64 userspace_addr; /* start of the userspace allocated memory */
-};
+  };
 
-/* for kvm_memory_region::flags */
-#define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
-#define KVM_MEM_READONLY	(1UL << 1)
+  /* for kvm_memory_region::flags */
+  #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
+  #define KVM_MEM_READONLY	(1UL << 1)
 
 This ioctl allows the user to create, modify or delete a guest physical
 memory slot.  Bits 0-15 of "slot" specify the slot id and this value
@@ -1174,12 +1282,13 @@ allocation and is deprecated.
 
 
 4.36 KVM_SET_TSS_ADDR
+---------------------
 
-Capability: KVM_CAP_SET_TSS_ADDR
-Architectures: x86
-Type: vm ioctl
-Parameters: unsigned long tss_address (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_SET_TSS_ADDR
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: unsigned long tss_address (in)
+:Returns: 0 on success, -1 on error
 
 This ioctl defines the physical address of a three-page region in the guest
 physical address space.  The region must be within the first 4GB of the
@@ -1193,21 +1302,24 @@ documentation when it pops into existence).
 
 
 4.37 KVM_ENABLE_CAP
+-------------------
 
-Capability: KVM_CAP_ENABLE_CAP
-Architectures: mips, ppc, s390
-Type: vcpu ioctl
-Parameters: struct kvm_enable_cap (in)
-Returns: 0 on success; -1 on error
+:Capability: KVM_CAP_ENABLE_CAP
+:Architectures: mips, ppc, s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_enable_cap (in)
+:Returns: 0 on success; -1 on error
 
-Capability: KVM_CAP_ENABLE_CAP_VM
-Architectures: all
-Type: vcpu ioctl
-Parameters: struct kvm_enable_cap (in)
-Returns: 0 on success; -1 on error
+:Capability: KVM_CAP_ENABLE_CAP_VM
+:Architectures: all
+:Type: vcpu ioctl
+:Parameters: struct kvm_enable_cap (in)
+:Returns: 0 on success; -1 on error
 
-+Not all extensions are enabled by default. Using this ioctl the application
-can enable an extension, making it available to the guest.
+.. note::
+
+   Not all extensions are enabled by default. Using this ioctl the application
+   can enable an extension, making it available to the guest.
 
 On systems that do not support this ioctl, it always fails. On systems that
 do support it, it only works for extensions that are supported for enablement.
@@ -1215,76 +1327,91 @@ do support it, it only works for extensions that are supported for enablement.
 To check if a capability can be enabled, the KVM_CHECK_EXTENSION ioctl should
 be used.
 
-struct kvm_enable_cap {
+::
+
+  struct kvm_enable_cap {
        /* in */
        __u32 cap;
 
 The capability that is supposed to get enabled.
 
+::
+
        __u32 flags;
 
 A bitfield indicating future enhancements. Has to be 0 for now.
 
+::
+
        __u64 args[4];
 
 Arguments for enabling a feature. If a feature needs initial values to
 function properly, this is the place to put them.
 
+::
+
        __u8  pad[64];
-};
+  };
 
 The vcpu ioctl should be used for vcpu-specific capabilities, the vm ioctl
 for vm-wide capabilities.
 
 4.38 KVM_GET_MP_STATE
+---------------------
 
-Capability: KVM_CAP_MP_STATE
-Architectures: x86, s390, arm, arm64
-Type: vcpu ioctl
-Parameters: struct kvm_mp_state (out)
-Returns: 0 on success; -1 on error
+:Capability: KVM_CAP_MP_STATE
+:Architectures: x86, s390, arm, arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_mp_state (out)
+:Returns: 0 on success; -1 on error
 
-struct kvm_mp_state {
+::
+
+  struct kvm_mp_state {
 	__u32 mp_state;
-};
+  };
 
 Returns the vcpu's current "multiprocessing state" (though also valid on
 uniprocessor guests).
 
 Possible values are:
 
- - KVM_MP_STATE_RUNNABLE:        the vcpu is currently running [x86,arm/arm64]
- - KVM_MP_STATE_UNINITIALIZED:   the vcpu is an application processor (AP)
+   ==========================    ===============================================
+   KVM_MP_STATE_RUNNABLE         the vcpu is currently running [x86,arm/arm64]
+   KVM_MP_STATE_UNINITIALIZED    the vcpu is an application processor (AP)
                                  which has not yet received an INIT signal [x86]
- - KVM_MP_STATE_INIT_RECEIVED:   the vcpu has received an INIT signal, and is
+   KVM_MP_STATE_INIT_RECEIVED    the vcpu has received an INIT signal, and is
                                  now ready for a SIPI [x86]
- - KVM_MP_STATE_HALTED:          the vcpu has executed a HLT instruction and
+   KVM_MP_STATE_HALTED           the vcpu has executed a HLT instruction and
                                  is waiting for an interrupt [x86]
- - KVM_MP_STATE_SIPI_RECEIVED:   the vcpu has just received a SIPI (vector
+   KVM_MP_STATE_SIPI_RECEIVED    the vcpu has just received a SIPI (vector
                                  accessible via KVM_GET_VCPU_EVENTS) [x86]
- - KVM_MP_STATE_STOPPED:         the vcpu is stopped [s390,arm/arm64]
- - KVM_MP_STATE_CHECK_STOP:      the vcpu is in a special error state [s390]
- - KVM_MP_STATE_OPERATING:       the vcpu is operating (running or halted)
+   KVM_MP_STATE_STOPPED          the vcpu is stopped [s390,arm/arm64]
+   KVM_MP_STATE_CHECK_STOP       the vcpu is in a special error state [s390]
+   KVM_MP_STATE_OPERATING        the vcpu is operating (running or halted)
                                  [s390]
- - KVM_MP_STATE_LOAD:            the vcpu is in a special load/startup state
+   KVM_MP_STATE_LOAD             the vcpu is in a special load/startup state
                                  [s390]
+   ==========================    ===============================================
 
 On x86, this ioctl is only useful after KVM_CREATE_IRQCHIP. Without an
 in-kernel irqchip, the multiprocessing state must be maintained by userspace on
 these architectures.
 
 For arm/arm64:
+^^^^^^^^^^^^^^
 
 The only states that are valid are KVM_MP_STATE_STOPPED and
 KVM_MP_STATE_RUNNABLE which reflect if the vcpu is paused or not.
 
 4.39 KVM_SET_MP_STATE
+---------------------
 
-Capability: KVM_CAP_MP_STATE
-Architectures: x86, s390, arm, arm64
-Type: vcpu ioctl
-Parameters: struct kvm_mp_state (in)
-Returns: 0 on success; -1 on error
+:Capability: KVM_CAP_MP_STATE
+:Architectures: x86, s390, arm, arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_mp_state (in)
+:Returns: 0 on success; -1 on error
 
 Sets the vcpu's current "multiprocessing state"; see KVM_GET_MP_STATE for
 arguments.
@@ -1294,17 +1421,19 @@ in-kernel irqchip, the multiprocessing state must be maintained by userspace on
 these architectures.
 
 For arm/arm64:
+^^^^^^^^^^^^^^
 
 The only states that are valid are KVM_MP_STATE_STOPPED and
 KVM_MP_STATE_RUNNABLE which reflect if the vcpu should be paused or not.
 
 4.40 KVM_SET_IDENTITY_MAP_ADDR
+------------------------------
 
-Capability: KVM_CAP_SET_IDENTITY_MAP_ADDR
-Architectures: x86
-Type: vm ioctl
-Parameters: unsigned long identity (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_SET_IDENTITY_MAP_ADDR
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: unsigned long identity (in)
+:Returns: 0 on success, -1 on error
 
 This ioctl defines the physical address of a one-page region in the guest
 physical address space.  The region must be within the first 4GB of the
@@ -1322,12 +1451,13 @@ documentation when it pops into existence).
 Fails if any VCPU has already been created.
 
 4.41 KVM_SET_BOOT_CPU_ID
+------------------------
 
-Capability: KVM_CAP_SET_BOOT_CPU_ID
-Architectures: x86
-Type: vm ioctl
-Parameters: unsigned long vcpu_id
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_SET_BOOT_CPU_ID
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: unsigned long vcpu_id
+:Returns: 0 on success, -1 on error
 
 Define which vcpu is the Bootstrap Processor (BSP).  Values are the same
 as the vcpu id in KVM_CREATE_VCPU.  If this ioctl is not called, the default
@@ -1335,102 +1465,119 @@ is vcpu 0.
 
 
 4.42 KVM_GET_XSAVE
+------------------
 
-Capability: KVM_CAP_XSAVE
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_xsave (out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_XSAVE
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_xsave (out)
+:Returns: 0 on success, -1 on error
 
-struct kvm_xsave {
+
+::
+
+  struct kvm_xsave {
 	__u32 region[1024];
-};
+  };
 
 This ioctl would copy current vcpu's xsave struct to the userspace.
 
 
 4.43 KVM_SET_XSAVE
+------------------
 
-Capability: KVM_CAP_XSAVE
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_xsave (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_XSAVE
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_xsave (in)
+:Returns: 0 on success, -1 on error
 
-struct kvm_xsave {
+::
+
+
+  struct kvm_xsave {
 	__u32 region[1024];
-};
+  };
 
 This ioctl would copy userspace's xsave struct to the kernel.
 
 
 4.44 KVM_GET_XCRS
+-----------------
 
-Capability: KVM_CAP_XCRS
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_xcrs (out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_XCRS
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_xcrs (out)
+:Returns: 0 on success, -1 on error
 
-struct kvm_xcr {
+::
+
+  struct kvm_xcr {
 	__u32 xcr;
 	__u32 reserved;
 	__u64 value;
-};
+  };
 
-struct kvm_xcrs {
+  struct kvm_xcrs {
 	__u32 nr_xcrs;
 	__u32 flags;
 	struct kvm_xcr xcrs[KVM_MAX_XCRS];
 	__u64 padding[16];
-};
+  };
 
 This ioctl would copy current vcpu's xcrs to the userspace.
 
 
 4.45 KVM_SET_XCRS
+-----------------
 
-Capability: KVM_CAP_XCRS
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_xcrs (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_XCRS
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_xcrs (in)
+:Returns: 0 on success, -1 on error
 
-struct kvm_xcr {
+::
+
+  struct kvm_xcr {
 	__u32 xcr;
 	__u32 reserved;
 	__u64 value;
-};
+  };
 
-struct kvm_xcrs {
+  struct kvm_xcrs {
 	__u32 nr_xcrs;
 	__u32 flags;
 	struct kvm_xcr xcrs[KVM_MAX_XCRS];
 	__u64 padding[16];
-};
+  };
 
 This ioctl would set vcpu's xcr to the value userspace specified.
 
 
 4.46 KVM_GET_SUPPORTED_CPUID
+----------------------------
 
-Capability: KVM_CAP_EXT_CPUID
-Architectures: x86
-Type: system ioctl
-Parameters: struct kvm_cpuid2 (in/out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_EXT_CPUID
+:Architectures: x86
+:Type: system ioctl
+:Parameters: struct kvm_cpuid2 (in/out)
+:Returns: 0 on success, -1 on error
 
-struct kvm_cpuid2 {
+::
+
+  struct kvm_cpuid2 {
 	__u32 nent;
 	__u32 padding;
 	struct kvm_cpuid_entry2 entries[0];
-};
+  };
 
-#define KVM_CPUID_FLAG_SIGNIFCANT_INDEX		BIT(0)
-#define KVM_CPUID_FLAG_STATEFUL_FUNC		BIT(1)
-#define KVM_CPUID_FLAG_STATE_READ_NEXT		BIT(2)
+  #define KVM_CPUID_FLAG_SIGNIFCANT_INDEX		BIT(0)
+  #define KVM_CPUID_FLAG_STATEFUL_FUNC		BIT(1)
+  #define KVM_CPUID_FLAG_STATE_READ_NEXT		BIT(2)
 
-struct kvm_cpuid_entry2 {
+  struct kvm_cpuid_entry2 {
 	__u32 function;
 	__u32 index;
 	__u32 flags;
@@ -1439,7 +1586,7 @@ struct kvm_cpuid_entry2 {
 	__u32 ecx;
 	__u32 edx;
 	__u32 padding[3];
-};
+  };
 
 This ioctl returns x86 cpuid features which are supported by both the
 hardware and kvm in its default configuration.  Userspace can use the
@@ -1467,10 +1614,16 @@ with unknown or unsupported features masked out.  Some features (for example,
 x2apic), may not be present in the host cpu, but are exposed by kvm if it can
 emulate them efficiently. The fields in each entry are defined as follows:
 
-  function: the eax value used to obtain the entry
-  index: the ecx value used to obtain the entry (for entries that are
+  function:
+         the eax value used to obtain the entry
+
+  index:
+         the ecx value used to obtain the entry (for entries that are
          affected by ecx)
-  flags: an OR of zero or more of the following:
+
+  flags:
+     an OR of zero or more of the following:
+
         KVM_CPUID_FLAG_SIGNIFCANT_INDEX:
            if the index field is valid
         KVM_CPUID_FLAG_STATEFUL_FUNC:
@@ -1480,12 +1633,14 @@ emulate them efficiently. The fields in each entry are defined as follows:
         KVM_CPUID_FLAG_STATE_READ_NEXT:
            for KVM_CPUID_FLAG_STATEFUL_FUNC entries, set if this entry is
            the first entry to be read by a cpu
-   eax, ebx, ecx, edx: the values returned by the cpuid instruction for
+
+   eax, ebx, ecx, edx:
+         the values returned by the cpuid instruction for
          this function/index combination
 
 The TSC deadline timer feature (CPUID leaf 1, ecx[24]) is always returned
 as false, since the feature depends on KVM_CREATE_IRQCHIP for local APIC
-support.  Instead it is reported via
+support.  Instead it is reported via::
 
   ioctl(KVM_CHECK_EXTENSION, KVM_CAP_TSC_DEADLINE_TIMER)
 
@@ -1494,18 +1649,21 @@ feature in userspace, then you can enable the feature for KVM_SET_CPUID2.
 
 
 4.47 KVM_PPC_GET_PVINFO
+-----------------------
 
-Capability: KVM_CAP_PPC_GET_PVINFO
-Architectures: ppc
-Type: vm ioctl
-Parameters: struct kvm_ppc_pvinfo (out)
-Returns: 0 on success, !0 on error
+:Capability: KVM_CAP_PPC_GET_PVINFO
+:Architectures: ppc
+:Type: vm ioctl
+:Parameters: struct kvm_ppc_pvinfo (out)
+:Returns: 0 on success, !0 on error
 
-struct kvm_ppc_pvinfo {
+::
+
+  struct kvm_ppc_pvinfo {
 	__u32 flags;
 	__u32 hcall[4];
 	__u8  pad[108];
-};
+  };
 
 This ioctl fetches PV specific information that need to be passed to the guest
 using the device tree or other means from vm context.
@@ -1515,33 +1673,39 @@ The hcall array defines 4 instructions that make up a hypercall.
 If any additional field gets added to this structure later on, a bit for that
 additional piece of information will be set in the flags bitmap.
 
-The flags bitmap is defined as:
+The flags bitmap is defined as::
 
    /* the host supports the ePAPR idle hcall
    #define KVM_PPC_PVINFO_FLAGS_EV_IDLE   (1<<0)
 
 4.52 KVM_SET_GSI_ROUTING
+------------------------
 
-Capability: KVM_CAP_IRQ_ROUTING
-Architectures: x86 s390 arm arm64
-Type: vm ioctl
-Parameters: struct kvm_irq_routing (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_IRQ_ROUTING
+:Architectures: x86 s390 arm arm64
+:Type: vm ioctl
+:Parameters: struct kvm_irq_routing (in)
+:Returns: 0 on success, -1 on error
 
 Sets the GSI routing table entries, overwriting any previously set entries.
 
 On arm/arm64, GSI routing has the following limitation:
+
 - GSI routing does not apply to KVM_IRQ_LINE but only to KVM_IRQFD.
 
-struct kvm_irq_routing {
+::
+
+  struct kvm_irq_routing {
 	__u32 nr;
 	__u32 flags;
 	struct kvm_irq_routing_entry entries[0];
-};
+  };
 
 No flags are specified so far, the corresponding field must be set to zero.
 
-struct kvm_irq_routing_entry {
+::
+
+  struct kvm_irq_routing_entry {
 	__u32 gsi;
 	__u32 type;
 	__u32 flags;
@@ -1553,15 +1717,16 @@ struct kvm_irq_routing_entry {
 		struct kvm_irq_routing_hv_sint hv_sint;
 		__u32 pad[8];
 	} u;
-};
+  };
 
-/* gsi routing entry types */
-#define KVM_IRQ_ROUTING_IRQCHIP 1
-#define KVM_IRQ_ROUTING_MSI 2
-#define KVM_IRQ_ROUTING_S390_ADAPTER 3
-#define KVM_IRQ_ROUTING_HV_SINT 4
+  /* gsi routing entry types */
+  #define KVM_IRQ_ROUTING_IRQCHIP 1
+  #define KVM_IRQ_ROUTING_MSI 2
+  #define KVM_IRQ_ROUTING_S390_ADAPTER 3
+  #define KVM_IRQ_ROUTING_HV_SINT 4
 
 flags:
+
 - KVM_MSI_VALID_DEVID: used along with KVM_IRQ_ROUTING_MSI routing entry
   type, specifies that the devid field contains a valid value.  The per-VM
   KVM_CAP_MSI_DEVID capability advertises the requirement to provide
@@ -1569,12 +1734,14 @@ flags:
   never set the KVM_MSI_VALID_DEVID flag as the ioctl might fail.
 - zero otherwise
 
-struct kvm_irq_routing_irqchip {
+::
+
+  struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
 	__u32 pin;
-};
+  };
 
-struct kvm_irq_routing_msi {
+  struct kvm_irq_routing_msi {
 	__u32 address_lo;
 	__u32 address_hi;
 	__u32 data;
@@ -1582,7 +1749,7 @@ struct kvm_irq_routing_msi {
 		__u32 pad;
 		__u32 devid;
 	};
-};
+  };
 
 If KVM_MSI_VALID_DEVID is set, devid contains a unique device identifier
 for the device that wrote the MSI message.  For PCI, this is usually a
@@ -1593,39 +1760,43 @@ feature of KVM_CAP_X2APIC_API capability is enabled.  If it is enabled,
 address_hi bits 31-8 provide bits 31-8 of the destination id.  Bits 7-0 of
 address_hi must be zero.
 
-struct kvm_irq_routing_s390_adapter {
+::
+
+  struct kvm_irq_routing_s390_adapter {
 	__u64 ind_addr;
 	__u64 summary_addr;
 	__u64 ind_offset;
 	__u32 summary_offset;
 	__u32 adapter_id;
-};
+  };
 
-struct kvm_irq_routing_hv_sint {
+  struct kvm_irq_routing_hv_sint {
 	__u32 vcpu;
 	__u32 sint;
-};
+  };
 
 
 4.55 KVM_SET_TSC_KHZ
+--------------------
 
-Capability: KVM_CAP_TSC_CONTROL
-Architectures: x86
-Type: vcpu ioctl
-Parameters: virtual tsc_khz
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_TSC_CONTROL
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: virtual tsc_khz
+:Returns: 0 on success, -1 on error
 
 Specifies the tsc frequency for the virtual machine. The unit of the
 frequency is KHz.
 
 
 4.56 KVM_GET_TSC_KHZ
+--------------------
 
-Capability: KVM_CAP_GET_TSC_KHZ
-Architectures: x86
-Type: vcpu ioctl
-Parameters: none
-Returns: virtual tsc-khz on success, negative value on error
+:Capability: KVM_CAP_GET_TSC_KHZ
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: none
+:Returns: virtual tsc-khz on success, negative value on error
 
 Returns the tsc frequency of the guest. The unit of the return value is
 KHz. If the host has unstable tsc this ioctl returns -EIO instead as an
@@ -1633,17 +1804,20 @@ error.
 
 
 4.57 KVM_GET_LAPIC
+------------------
 
-Capability: KVM_CAP_IRQCHIP
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_lapic_state (out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_IRQCHIP
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_lapic_state (out)
+:Returns: 0 on success, -1 on error
 
-#define KVM_APIC_REG_SIZE 0x400
-struct kvm_lapic_state {
+::
+
+  #define KVM_APIC_REG_SIZE 0x400
+  struct kvm_lapic_state {
 	char regs[KVM_APIC_REG_SIZE];
-};
+  };
 
 Reads the Local APIC registers and copies them into the input argument.  The
 data format and layout are the same as documented in the architecture manual.
@@ -1661,17 +1835,20 @@ always uses xAPIC format.
 
 
 4.58 KVM_SET_LAPIC
+------------------
 
-Capability: KVM_CAP_IRQCHIP
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_lapic_state (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_IRQCHIP
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_lapic_state (in)
+:Returns: 0 on success, -1 on error
 
-#define KVM_APIC_REG_SIZE 0x400
-struct kvm_lapic_state {
+::
+
+  #define KVM_APIC_REG_SIZE 0x400
+  struct kvm_lapic_state {
 	char regs[KVM_APIC_REG_SIZE];
-};
+  };
 
 Copies the input argument into the Local APIC registers.  The data format
 and layout are the same as documented in the architecture manual.
@@ -1682,35 +1859,38 @@ See the note in KVM_GET_LAPIC.
 
 
 4.59 KVM_IOEVENTFD
+------------------
 
-Capability: KVM_CAP_IOEVENTFD
-Architectures: all
-Type: vm ioctl
-Parameters: struct kvm_ioeventfd (in)
-Returns: 0 on success, !0 on error
+:Capability: KVM_CAP_IOEVENTFD
+:Architectures: all
+:Type: vm ioctl
+:Parameters: struct kvm_ioeventfd (in)
+:Returns: 0 on success, !0 on error
 
 This ioctl attaches or detaches an ioeventfd to a legal pio/mmio address
 within the guest.  A guest write in the registered address will signal the
 provided event instead of triggering an exit.
 
-struct kvm_ioeventfd {
+::
+
+  struct kvm_ioeventfd {
 	__u64 datamatch;
 	__u64 addr;        /* legal pio/mmio address */
 	__u32 len;         /* 0, 1, 2, 4, or 8 bytes    */
 	__s32 fd;
 	__u32 flags;
 	__u8  pad[36];
-};
+  };
 
 For the special case of virtio-ccw devices on s390, the ioevent is matched
 to a subchannel/virtqueue tuple instead.
 
-The following flags are defined:
+The following flags are defined::
 
-#define KVM_IOEVENTFD_FLAG_DATAMATCH (1 << kvm_ioeventfd_flag_nr_datamatch)
-#define KVM_IOEVENTFD_FLAG_PIO       (1 << kvm_ioeventfd_flag_nr_pio)
-#define KVM_IOEVENTFD_FLAG_DEASSIGN  (1 << kvm_ioeventfd_flag_nr_deassign)
-#define KVM_IOEVENTFD_FLAG_VIRTIO_CCW_NOTIFY \
+  #define KVM_IOEVENTFD_FLAG_DATAMATCH (1 << kvm_ioeventfd_flag_nr_datamatch)
+  #define KVM_IOEVENTFD_FLAG_PIO       (1 << kvm_ioeventfd_flag_nr_pio)
+  #define KVM_IOEVENTFD_FLAG_DEASSIGN  (1 << kvm_ioeventfd_flag_nr_deassign)
+  #define KVM_IOEVENTFD_FLAG_VIRTIO_CCW_NOTIFY \
 	(1 << kvm_ioeventfd_flag_nr_virtio_ccw_notify)
 
 If datamatch flag is set, the event will be signaled only if the written value
@@ -1725,17 +1905,20 @@ The speedup may only apply to specific architectures, but the ioeventfd will
 work anyway.
 
 4.60 KVM_DIRTY_TLB
+------------------
 
-Capability: KVM_CAP_SW_TLB
-Architectures: ppc
-Type: vcpu ioctl
-Parameters: struct kvm_dirty_tlb (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_SW_TLB
+:Architectures: ppc
+:Type: vcpu ioctl
+:Parameters: struct kvm_dirty_tlb (in)
+:Returns: 0 on success, -1 on error
 
-struct kvm_dirty_tlb {
+::
+
+  struct kvm_dirty_tlb {
 	__u64 bitmap;
 	__u32 num_dirty;
-};
+  };
 
 This must be called whenever userspace has changed an entry in the shared
 TLB, prior to calling KVM_RUN on the associated vcpu.
@@ -1758,23 +1941,26 @@ be set to the number of set bits in the bitmap.
 
 
 4.62 KVM_CREATE_SPAPR_TCE
+-------------------------
 
-Capability: KVM_CAP_SPAPR_TCE
-Architectures: powerpc
-Type: vm ioctl
-Parameters: struct kvm_create_spapr_tce (in)
-Returns: file descriptor for manipulating the created TCE table
+:Capability: KVM_CAP_SPAPR_TCE
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: struct kvm_create_spapr_tce (in)
+:Returns: file descriptor for manipulating the created TCE table
 
 This creates a virtual TCE (translation control entry) table, which
 is an IOMMU for PAPR-style virtual I/O.  It is used to translate
 logical addresses used in virtual I/O into guest physical addresses,
 and provides a scatter/gather capability for PAPR virtual I/O.
 
-/* for KVM_CAP_SPAPR_TCE */
-struct kvm_create_spapr_tce {
+::
+
+  /* for KVM_CAP_SPAPR_TCE */
+  struct kvm_create_spapr_tce {
 	__u64 liobn;
 	__u32 window_size;
-};
+  };
 
 The liobn field gives the logical IO bus number for which to create a
 TCE table.  The window_size field specifies the size of the DMA window
@@ -1794,12 +1980,13 @@ circumstances.
 
 
 4.63 KVM_ALLOCATE_RMA
+---------------------
 
-Capability: KVM_CAP_PPC_RMA
-Architectures: powerpc
-Type: vm ioctl
-Parameters: struct kvm_allocate_rma (out)
-Returns: file descriptor for mapping the allocated RMA
+:Capability: KVM_CAP_PPC_RMA
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: struct kvm_allocate_rma (out)
+:Returns: file descriptor for mapping the allocated RMA
 
 This allocates a Real Mode Area (RMA) from the pool allocated at boot
 time by the kernel.  An RMA is a physically-contiguous, aligned region
@@ -1808,10 +1995,12 @@ will be accessed by real-mode (MMU off) accesses in a KVM guest.
 POWER processors support a set of sizes for the RMA that usually
 includes 64MB, 128MB, 256MB and some larger powers of two.
 
-/* for KVM_ALLOCATE_RMA */
-struct kvm_allocate_rma {
+::
+
+  /* for KVM_ALLOCATE_RMA */
+  struct kvm_allocate_rma {
 	__u64 rma_size;
-};
+  };
 
 The return value is a file descriptor which can be passed to mmap(2)
 to map the allocated RMA into userspace.  The mapped area can then be
@@ -1827,12 +2016,13 @@ because it supports the Virtual RMA (VRMA) facility.
 
 
 4.64 KVM_NMI
+------------
 
-Capability: KVM_CAP_USER_NMI
-Architectures: x86
-Type: vcpu ioctl
-Parameters: none
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_USER_NMI
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: none
+:Returns: 0 on success, -1 on error
 
 Queues an NMI on the thread's vcpu.  Note this is well defined only
 when KVM_CREATE_IRQCHIP has not been called, since this is an interface
@@ -1853,14 +2043,16 @@ debugging.
 
 
 4.65 KVM_S390_UCAS_MAP
+----------------------
 
-Capability: KVM_CAP_S390_UCONTROL
-Architectures: s390
-Type: vcpu ioctl
-Parameters: struct kvm_s390_ucas_mapping (in)
-Returns: 0 in case of success
+:Capability: KVM_CAP_S390_UCONTROL
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_s390_ucas_mapping (in)
+:Returns: 0 in case of success
+
+The parameter is defined like this::
 
-The parameter is defined like this:
 	struct kvm_s390_ucas_mapping {
 		__u64 user_addr;
 		__u64 vcpu_addr;
@@ -1873,14 +2065,16 @@ be aligned by 1 megabyte.
 
 
 4.66 KVM_S390_UCAS_UNMAP
+------------------------
 
-Capability: KVM_CAP_S390_UCONTROL
-Architectures: s390
-Type: vcpu ioctl
-Parameters: struct kvm_s390_ucas_mapping (in)
-Returns: 0 in case of success
+:Capability: KVM_CAP_S390_UCONTROL
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_s390_ucas_mapping (in)
+:Returns: 0 in case of success
+
+The parameter is defined like this::
 
-The parameter is defined like this:
 	struct kvm_s390_ucas_mapping {
 		__u64 user_addr;
 		__u64 vcpu_addr;
@@ -1893,12 +2087,13 @@ All parameters need to be aligned by 1 megabyte.
 
 
 4.67 KVM_S390_VCPU_FAULT
+------------------------
 
-Capability: KVM_CAP_S390_UCONTROL
-Architectures: s390
-Type: vcpu ioctl
-Parameters: vcpu absolute address (in)
-Returns: 0 in case of success
+:Capability: KVM_CAP_S390_UCONTROL
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: vcpu absolute address (in)
+:Returns: 0 in case of success
 
 This call creates a page table entry on the virtual cpu's address space
 (for user controlled virtual machines) or the virtual machine's address
@@ -1910,23 +2105,31 @@ prior to calling the KVM_RUN ioctl.
 
 
 4.68 KVM_SET_ONE_REG
+--------------------
+
+:Capability: KVM_CAP_ONE_REG
+:Architectures: all
+:Type: vcpu ioctl
+:Parameters: struct kvm_one_reg (in)
+:Returns: 0 on success, negative value on failure
 
-Capability: KVM_CAP_ONE_REG
-Architectures: all
-Type: vcpu ioctl
-Parameters: struct kvm_one_reg (in)
-Returns: 0 on success, negative value on failure
 Errors:
-  ENOENT:   no such register
-  EINVAL:   invalid register ID, or no such register
-  EPERM:    (arm64) register access not allowed before vcpu finalization
+
+  ======   ============================================================
+  ENOENT   no such register
+  EINVAL   invalid register ID, or no such register
+  EPERM    (arm64) register access not allowed before vcpu finalization
+  ======   ============================================================
+
 (These error codes are indicative only: do not rely on a specific error
 code being returned in a specific situation.)
 
-struct kvm_one_reg {
+::
+
+  struct kvm_one_reg {
        __u64 id;
        __u64 addr;
-};
+ };
 
 Using this ioctl, a single vcpu register can be set to a specific value
 defined by user space with the passed in struct kvm_one_reg, where id
@@ -1936,217 +2139,226 @@ and architecture specific registers. Each have their own range of operation
 and their own constants and width. To keep track of the implemented
 registers, find a list below:
 
-  Arch  |           Register            | Width (bits)
-        |                               |
-  PPC   | KVM_REG_PPC_HIOR              | 64
-  PPC   | KVM_REG_PPC_IAC1              | 64
-  PPC   | KVM_REG_PPC_IAC2              | 64
-  PPC   | KVM_REG_PPC_IAC3              | 64
-  PPC   | KVM_REG_PPC_IAC4              | 64
-  PPC   | KVM_REG_PPC_DAC1              | 64
-  PPC   | KVM_REG_PPC_DAC2              | 64
-  PPC   | KVM_REG_PPC_DABR              | 64
-  PPC   | KVM_REG_PPC_DSCR              | 64
-  PPC   | KVM_REG_PPC_PURR              | 64
-  PPC   | KVM_REG_PPC_SPURR             | 64
-  PPC   | KVM_REG_PPC_DAR               | 64
-  PPC   | KVM_REG_PPC_DSISR             | 32
-  PPC   | KVM_REG_PPC_AMR               | 64
-  PPC   | KVM_REG_PPC_UAMOR             | 64
-  PPC   | KVM_REG_PPC_MMCR0             | 64
-  PPC   | KVM_REG_PPC_MMCR1             | 64
-  PPC   | KVM_REG_PPC_MMCRA             | 64
-  PPC   | KVM_REG_PPC_MMCR2             | 64
-  PPC   | KVM_REG_PPC_MMCRS             | 64
-  PPC   | KVM_REG_PPC_SIAR              | 64
-  PPC   | KVM_REG_PPC_SDAR              | 64
-  PPC   | KVM_REG_PPC_SIER              | 64
-  PPC   | KVM_REG_PPC_PMC1              | 32
-  PPC   | KVM_REG_PPC_PMC2              | 32
-  PPC   | KVM_REG_PPC_PMC3              | 32
-  PPC   | KVM_REG_PPC_PMC4              | 32
-  PPC   | KVM_REG_PPC_PMC5              | 32
-  PPC   | KVM_REG_PPC_PMC6              | 32
-  PPC   | KVM_REG_PPC_PMC7              | 32
-  PPC   | KVM_REG_PPC_PMC8              | 32
-  PPC   | KVM_REG_PPC_FPR0              | 64
-          ...
-  PPC   | KVM_REG_PPC_FPR31             | 64
-  PPC   | KVM_REG_PPC_VR0               | 128
-          ...
-  PPC   | KVM_REG_PPC_VR31              | 128
-  PPC   | KVM_REG_PPC_VSR0              | 128
-          ...
-  PPC   | KVM_REG_PPC_VSR31             | 128
-  PPC   | KVM_REG_PPC_FPSCR             | 64
-  PPC   | KVM_REG_PPC_VSCR              | 32
-  PPC   | KVM_REG_PPC_VPA_ADDR          | 64
-  PPC   | KVM_REG_PPC_VPA_SLB           | 128
-  PPC   | KVM_REG_PPC_VPA_DTL           | 128
-  PPC   | KVM_REG_PPC_EPCR              | 32
-  PPC   | KVM_REG_PPC_EPR               | 32
-  PPC   | KVM_REG_PPC_TCR               | 32
-  PPC   | KVM_REG_PPC_TSR               | 32
-  PPC   | KVM_REG_PPC_OR_TSR            | 32
-  PPC   | KVM_REG_PPC_CLEAR_TSR         | 32
-  PPC   | KVM_REG_PPC_MAS0              | 32
-  PPC   | KVM_REG_PPC_MAS1              | 32
-  PPC   | KVM_REG_PPC_MAS2              | 64
-  PPC   | KVM_REG_PPC_MAS7_3            | 64
-  PPC   | KVM_REG_PPC_MAS4              | 32
-  PPC   | KVM_REG_PPC_MAS6              | 32
-  PPC   | KVM_REG_PPC_MMUCFG            | 32
-  PPC   | KVM_REG_PPC_TLB0CFG           | 32
-  PPC   | KVM_REG_PPC_TLB1CFG           | 32
-  PPC   | KVM_REG_PPC_TLB2CFG           | 32
-  PPC   | KVM_REG_PPC_TLB3CFG           | 32
-  PPC   | KVM_REG_PPC_TLB0PS            | 32
-  PPC   | KVM_REG_PPC_TLB1PS            | 32
-  PPC   | KVM_REG_PPC_TLB2PS            | 32
-  PPC   | KVM_REG_PPC_TLB3PS            | 32
-  PPC   | KVM_REG_PPC_EPTCFG            | 32
-  PPC   | KVM_REG_PPC_ICP_STATE         | 64
-  PPC   | KVM_REG_PPC_VP_STATE          | 128
-  PPC   | KVM_REG_PPC_TB_OFFSET         | 64
-  PPC   | KVM_REG_PPC_SPMC1             | 32
-  PPC   | KVM_REG_PPC_SPMC2             | 32
-  PPC   | KVM_REG_PPC_IAMR              | 64
-  PPC   | KVM_REG_PPC_TFHAR             | 64
-  PPC   | KVM_REG_PPC_TFIAR             | 64
-  PPC   | KVM_REG_PPC_TEXASR            | 64
-  PPC   | KVM_REG_PPC_FSCR              | 64
-  PPC   | KVM_REG_PPC_PSPB              | 32
-  PPC   | KVM_REG_PPC_EBBHR             | 64
-  PPC   | KVM_REG_PPC_EBBRR             | 64
-  PPC   | KVM_REG_PPC_BESCR             | 64
-  PPC   | KVM_REG_PPC_TAR               | 64
-  PPC   | KVM_REG_PPC_DPDES             | 64
-  PPC   | KVM_REG_PPC_DAWR              | 64
-  PPC   | KVM_REG_PPC_DAWRX             | 64
-  PPC   | KVM_REG_PPC_CIABR             | 64
-  PPC   | KVM_REG_PPC_IC                | 64
-  PPC   | KVM_REG_PPC_VTB               | 64
-  PPC   | KVM_REG_PPC_CSIGR             | 64
-  PPC   | KVM_REG_PPC_TACR              | 64
-  PPC   | KVM_REG_PPC_TCSCR             | 64
-  PPC   | KVM_REG_PPC_PID               | 64
-  PPC   | KVM_REG_PPC_ACOP              | 64
-  PPC   | KVM_REG_PPC_VRSAVE            | 32
-  PPC   | KVM_REG_PPC_LPCR              | 32
-  PPC   | KVM_REG_PPC_LPCR_64           | 64
-  PPC   | KVM_REG_PPC_PPR               | 64
-  PPC   | KVM_REG_PPC_ARCH_COMPAT       | 32
-  PPC   | KVM_REG_PPC_DABRX             | 32
-  PPC   | KVM_REG_PPC_WORT              | 64
-  PPC	| KVM_REG_PPC_SPRG9             | 64
-  PPC	| KVM_REG_PPC_DBSR              | 32
-  PPC   | KVM_REG_PPC_TIDR              | 64
-  PPC   | KVM_REG_PPC_PSSCR             | 64
-  PPC   | KVM_REG_PPC_DEC_EXPIRY        | 64
-  PPC   | KVM_REG_PPC_PTCR              | 64
-  PPC   | KVM_REG_PPC_TM_GPR0           | 64
-          ...
-  PPC   | KVM_REG_PPC_TM_GPR31          | 64
-  PPC   | KVM_REG_PPC_TM_VSR0           | 128
-          ...
-  PPC   | KVM_REG_PPC_TM_VSR63          | 128
-  PPC   | KVM_REG_PPC_TM_CR             | 64
-  PPC   | KVM_REG_PPC_TM_LR             | 64
-  PPC   | KVM_REG_PPC_TM_CTR            | 64
-  PPC   | KVM_REG_PPC_TM_FPSCR          | 64
-  PPC   | KVM_REG_PPC_TM_AMR            | 64
-  PPC   | KVM_REG_PPC_TM_PPR            | 64
-  PPC   | KVM_REG_PPC_TM_VRSAVE         | 64
-  PPC   | KVM_REG_PPC_TM_VSCR           | 32
-  PPC   | KVM_REG_PPC_TM_DSCR           | 64
-  PPC   | KVM_REG_PPC_TM_TAR            | 64
-  PPC   | KVM_REG_PPC_TM_XER            | 64
-        |                               |
-  MIPS  | KVM_REG_MIPS_R0               | 64
-          ...
-  MIPS  | KVM_REG_MIPS_R31              | 64
-  MIPS  | KVM_REG_MIPS_HI               | 64
-  MIPS  | KVM_REG_MIPS_LO               | 64
-  MIPS  | KVM_REG_MIPS_PC               | 64
-  MIPS  | KVM_REG_MIPS_CP0_INDEX        | 32
-  MIPS  | KVM_REG_MIPS_CP0_ENTRYLO0     | 64
-  MIPS  | KVM_REG_MIPS_CP0_ENTRYLO1     | 64
-  MIPS  | KVM_REG_MIPS_CP0_CONTEXT      | 64
-  MIPS  | KVM_REG_MIPS_CP0_CONTEXTCONFIG| 32
-  MIPS  | KVM_REG_MIPS_CP0_USERLOCAL    | 64
-  MIPS  | KVM_REG_MIPS_CP0_XCONTEXTCONFIG| 64
-  MIPS  | KVM_REG_MIPS_CP0_PAGEMASK     | 32
-  MIPS  | KVM_REG_MIPS_CP0_PAGEGRAIN    | 32
-  MIPS  | KVM_REG_MIPS_CP0_SEGCTL0      | 64
-  MIPS  | KVM_REG_MIPS_CP0_SEGCTL1      | 64
-  MIPS  | KVM_REG_MIPS_CP0_SEGCTL2      | 64
-  MIPS  | KVM_REG_MIPS_CP0_PWBASE       | 64
-  MIPS  | KVM_REG_MIPS_CP0_PWFIELD      | 64
-  MIPS  | KVM_REG_MIPS_CP0_PWSIZE       | 64
-  MIPS  | KVM_REG_MIPS_CP0_WIRED        | 32
-  MIPS  | KVM_REG_MIPS_CP0_PWCTL        | 32
-  MIPS  | KVM_REG_MIPS_CP0_HWRENA       | 32
-  MIPS  | KVM_REG_MIPS_CP0_BADVADDR     | 64
-  MIPS  | KVM_REG_MIPS_CP0_BADINSTR     | 32
-  MIPS  | KVM_REG_MIPS_CP0_BADINSTRP    | 32
-  MIPS  | KVM_REG_MIPS_CP0_COUNT        | 32
-  MIPS  | KVM_REG_MIPS_CP0_ENTRYHI      | 64
-  MIPS  | KVM_REG_MIPS_CP0_COMPARE      | 32
-  MIPS  | KVM_REG_MIPS_CP0_STATUS       | 32
-  MIPS  | KVM_REG_MIPS_CP0_INTCTL       | 32
-  MIPS  | KVM_REG_MIPS_CP0_CAUSE        | 32
-  MIPS  | KVM_REG_MIPS_CP0_EPC          | 64
-  MIPS  | KVM_REG_MIPS_CP0_PRID         | 32
-  MIPS  | KVM_REG_MIPS_CP0_EBASE        | 64
-  MIPS  | KVM_REG_MIPS_CP0_CONFIG       | 32
-  MIPS  | KVM_REG_MIPS_CP0_CONFIG1      | 32
-  MIPS  | KVM_REG_MIPS_CP0_CONFIG2      | 32
-  MIPS  | KVM_REG_MIPS_CP0_CONFIG3      | 32
-  MIPS  | KVM_REG_MIPS_CP0_CONFIG4      | 32
-  MIPS  | KVM_REG_MIPS_CP0_CONFIG5      | 32
-  MIPS  | KVM_REG_MIPS_CP0_CONFIG7      | 32
-  MIPS  | KVM_REG_MIPS_CP0_XCONTEXT     | 64
-  MIPS  | KVM_REG_MIPS_CP0_ERROREPC     | 64
-  MIPS  | KVM_REG_MIPS_CP0_KSCRATCH1    | 64
-  MIPS  | KVM_REG_MIPS_CP0_KSCRATCH2    | 64
-  MIPS  | KVM_REG_MIPS_CP0_KSCRATCH3    | 64
-  MIPS  | KVM_REG_MIPS_CP0_KSCRATCH4    | 64
-  MIPS  | KVM_REG_MIPS_CP0_KSCRATCH5    | 64
-  MIPS  | KVM_REG_MIPS_CP0_KSCRATCH6    | 64
-  MIPS  | KVM_REG_MIPS_CP0_MAAR(0..63)  | 64
-  MIPS  | KVM_REG_MIPS_COUNT_CTL        | 64
-  MIPS  | KVM_REG_MIPS_COUNT_RESUME     | 64
-  MIPS  | KVM_REG_MIPS_COUNT_HZ         | 64
-  MIPS  | KVM_REG_MIPS_FPR_32(0..31)    | 32
-  MIPS  | KVM_REG_MIPS_FPR_64(0..31)    | 64
-  MIPS  | KVM_REG_MIPS_VEC_128(0..31)   | 128
-  MIPS  | KVM_REG_MIPS_FCR_IR           | 32
-  MIPS  | KVM_REG_MIPS_FCR_CSR          | 32
-  MIPS  | KVM_REG_MIPS_MSA_IR           | 32
-  MIPS  | KVM_REG_MIPS_MSA_CSR          | 32
+  ======= =============================== ============
+  Arch              Register              Width (bits)
+  ======= =============================== ============
+  PPC     KVM_REG_PPC_HIOR                64
+  PPC     KVM_REG_PPC_IAC1                64
+  PPC     KVM_REG_PPC_IAC2                64
+  PPC     KVM_REG_PPC_IAC3                64
+  PPC     KVM_REG_PPC_IAC4                64
+  PPC     KVM_REG_PPC_DAC1                64
+  PPC     KVM_REG_PPC_DAC2                64
+  PPC     KVM_REG_PPC_DABR                64
+  PPC     KVM_REG_PPC_DSCR                64
+  PPC     KVM_REG_PPC_PURR                64
+  PPC     KVM_REG_PPC_SPURR               64
+  PPC     KVM_REG_PPC_DAR                 64
+  PPC     KVM_REG_PPC_DSISR               32
+  PPC     KVM_REG_PPC_AMR                 64
+  PPC     KVM_REG_PPC_UAMOR               64
+  PPC     KVM_REG_PPC_MMCR0               64
+  PPC     KVM_REG_PPC_MMCR1               64
+  PPC     KVM_REG_PPC_MMCRA               64
+  PPC     KVM_REG_PPC_MMCR2               64
+  PPC     KVM_REG_PPC_MMCRS               64
+  PPC     KVM_REG_PPC_SIAR                64
+  PPC     KVM_REG_PPC_SDAR                64
+  PPC     KVM_REG_PPC_SIER                64
+  PPC     KVM_REG_PPC_PMC1                32
+  PPC     KVM_REG_PPC_PMC2                32
+  PPC     KVM_REG_PPC_PMC3                32
+  PPC     KVM_REG_PPC_PMC4                32
+  PPC     KVM_REG_PPC_PMC5                32
+  PPC     KVM_REG_PPC_PMC6                32
+  PPC     KVM_REG_PPC_PMC7                32
+  PPC     KVM_REG_PPC_PMC8                32
+  PPC     KVM_REG_PPC_FPR0                64
+  ...
+  PPC     KVM_REG_PPC_FPR31               64
+  PPC     KVM_REG_PPC_VR0                 128
+  ...
+  PPC     KVM_REG_PPC_VR31                128
+  PPC     KVM_REG_PPC_VSR0                128
+  ...
+  PPC     KVM_REG_PPC_VSR31               128
+  PPC     KVM_REG_PPC_FPSCR               64
+  PPC     KVM_REG_PPC_VSCR                32
+  PPC     KVM_REG_PPC_VPA_ADDR            64
+  PPC     KVM_REG_PPC_VPA_SLB             128
+  PPC     KVM_REG_PPC_VPA_DTL             128
+  PPC     KVM_REG_PPC_EPCR                32
+  PPC     KVM_REG_PPC_EPR                 32
+  PPC     KVM_REG_PPC_TCR                 32
+  PPC     KVM_REG_PPC_TSR                 32
+  PPC     KVM_REG_PPC_OR_TSR              32
+  PPC     KVM_REG_PPC_CLEAR_TSR           32
+  PPC     KVM_REG_PPC_MAS0                32
+  PPC     KVM_REG_PPC_MAS1                32
+  PPC     KVM_REG_PPC_MAS2                64
+  PPC     KVM_REG_PPC_MAS7_3              64
+  PPC     KVM_REG_PPC_MAS4                32
+  PPC     KVM_REG_PPC_MAS6                32
+  PPC     KVM_REG_PPC_MMUCFG              32
+  PPC     KVM_REG_PPC_TLB0CFG             32
+  PPC     KVM_REG_PPC_TLB1CFG             32
+  PPC     KVM_REG_PPC_TLB2CFG             32
+  PPC     KVM_REG_PPC_TLB3CFG             32
+  PPC     KVM_REG_PPC_TLB0PS              32
+  PPC     KVM_REG_PPC_TLB1PS              32
+  PPC     KVM_REG_PPC_TLB2PS              32
+  PPC     KVM_REG_PPC_TLB3PS              32
+  PPC     KVM_REG_PPC_EPTCFG              32
+  PPC     KVM_REG_PPC_ICP_STATE           64
+  PPC     KVM_REG_PPC_VP_STATE            128
+  PPC     KVM_REG_PPC_TB_OFFSET           64
+  PPC     KVM_REG_PPC_SPMC1               32
+  PPC     KVM_REG_PPC_SPMC2               32
+  PPC     KVM_REG_PPC_IAMR                64
+  PPC     KVM_REG_PPC_TFHAR               64
+  PPC     KVM_REG_PPC_TFIAR               64
+  PPC     KVM_REG_PPC_TEXASR              64
+  PPC     KVM_REG_PPC_FSCR                64
+  PPC     KVM_REG_PPC_PSPB                32
+  PPC     KVM_REG_PPC_EBBHR               64
+  PPC     KVM_REG_PPC_EBBRR               64
+  PPC     KVM_REG_PPC_BESCR               64
+  PPC     KVM_REG_PPC_TAR                 64
+  PPC     KVM_REG_PPC_DPDES               64
+  PPC     KVM_REG_PPC_DAWR                64
+  PPC     KVM_REG_PPC_DAWRX               64
+  PPC     KVM_REG_PPC_CIABR               64
+  PPC     KVM_REG_PPC_IC                  64
+  PPC     KVM_REG_PPC_VTB                 64
+  PPC     KVM_REG_PPC_CSIGR               64
+  PPC     KVM_REG_PPC_TACR                64
+  PPC     KVM_REG_PPC_TCSCR               64
+  PPC     KVM_REG_PPC_PID                 64
+  PPC     KVM_REG_PPC_ACOP                64
+  PPC     KVM_REG_PPC_VRSAVE              32
+  PPC     KVM_REG_PPC_LPCR                32
+  PPC     KVM_REG_PPC_LPCR_64             64
+  PPC     KVM_REG_PPC_PPR                 64
+  PPC     KVM_REG_PPC_ARCH_COMPAT         32
+  PPC     KVM_REG_PPC_DABRX               32
+  PPC     KVM_REG_PPC_WORT                64
+  PPC	  KVM_REG_PPC_SPRG9               64
+  PPC	  KVM_REG_PPC_DBSR                32
+  PPC     KVM_REG_PPC_TIDR                64
+  PPC     KVM_REG_PPC_PSSCR               64
+  PPC     KVM_REG_PPC_DEC_EXPIRY          64
+  PPC     KVM_REG_PPC_PTCR                64
+  PPC     KVM_REG_PPC_TM_GPR0             64
+  ...
+  PPC     KVM_REG_PPC_TM_GPR31            64
+  PPC     KVM_REG_PPC_TM_VSR0             128
+  ...
+  PPC     KVM_REG_PPC_TM_VSR63            128
+  PPC     KVM_REG_PPC_TM_CR               64
+  PPC     KVM_REG_PPC_TM_LR               64
+  PPC     KVM_REG_PPC_TM_CTR              64
+  PPC     KVM_REG_PPC_TM_FPSCR            64
+  PPC     KVM_REG_PPC_TM_AMR              64
+  PPC     KVM_REG_PPC_TM_PPR              64
+  PPC     KVM_REG_PPC_TM_VRSAVE           64
+  PPC     KVM_REG_PPC_TM_VSCR             32
+  PPC     KVM_REG_PPC_TM_DSCR             64
+  PPC     KVM_REG_PPC_TM_TAR              64
+  PPC     KVM_REG_PPC_TM_XER              64
+
+  MIPS    KVM_REG_MIPS_R0                 64
+  ...
+  MIPS    KVM_REG_MIPS_R31                64
+  MIPS    KVM_REG_MIPS_HI                 64
+  MIPS    KVM_REG_MIPS_LO                 64
+  MIPS    KVM_REG_MIPS_PC                 64
+  MIPS    KVM_REG_MIPS_CP0_INDEX          32
+  MIPS    KVM_REG_MIPS_CP0_ENTRYLO0       64
+  MIPS    KVM_REG_MIPS_CP0_ENTRYLO1       64
+  MIPS    KVM_REG_MIPS_CP0_CONTEXT        64
+  MIPS    KVM_REG_MIPS_CP0_CONTEXTCONFIG  32
+  MIPS    KVM_REG_MIPS_CP0_USERLOCAL      64
+  MIPS    KVM_REG_MIPS_CP0_XCONTEXTCONFIG 64
+  MIPS    KVM_REG_MIPS_CP0_PAGEMASK       32
+  MIPS    KVM_REG_MIPS_CP0_PAGEGRAIN      32
+  MIPS    KVM_REG_MIPS_CP0_SEGCTL0        64
+  MIPS    KVM_REG_MIPS_CP0_SEGCTL1        64
+  MIPS    KVM_REG_MIPS_CP0_SEGCTL2        64
+  MIPS    KVM_REG_MIPS_CP0_PWBASE         64
+  MIPS    KVM_REG_MIPS_CP0_PWFIELD        64
+  MIPS    KVM_REG_MIPS_CP0_PWSIZE         64
+  MIPS    KVM_REG_MIPS_CP0_WIRED          32
+  MIPS    KVM_REG_MIPS_CP0_PWCTL          32
+  MIPS    KVM_REG_MIPS_CP0_HWRENA         32
+  MIPS    KVM_REG_MIPS_CP0_BADVADDR       64
+  MIPS    KVM_REG_MIPS_CP0_BADINSTR       32
+  MIPS    KVM_REG_MIPS_CP0_BADINSTRP      32
+  MIPS    KVM_REG_MIPS_CP0_COUNT          32
+  MIPS    KVM_REG_MIPS_CP0_ENTRYHI        64
+  MIPS    KVM_REG_MIPS_CP0_COMPARE        32
+  MIPS    KVM_REG_MIPS_CP0_STATUS         32
+  MIPS    KVM_REG_MIPS_CP0_INTCTL         32
+  MIPS    KVM_REG_MIPS_CP0_CAUSE          32
+  MIPS    KVM_REG_MIPS_CP0_EPC            64
+  MIPS    KVM_REG_MIPS_CP0_PRID           32
+  MIPS    KVM_REG_MIPS_CP0_EBASE          64
+  MIPS    KVM_REG_MIPS_CP0_CONFIG         32
+  MIPS    KVM_REG_MIPS_CP0_CONFIG1        32
+  MIPS    KVM_REG_MIPS_CP0_CONFIG2        32
+  MIPS    KVM_REG_MIPS_CP0_CONFIG3        32
+  MIPS    KVM_REG_MIPS_CP0_CONFIG4        32
+  MIPS    KVM_REG_MIPS_CP0_CONFIG5        32
+  MIPS    KVM_REG_MIPS_CP0_CONFIG7        32
+  MIPS    KVM_REG_MIPS_CP0_XCONTEXT       64
+  MIPS    KVM_REG_MIPS_CP0_ERROREPC       64
+  MIPS    KVM_REG_MIPS_CP0_KSCRATCH1      64
+  MIPS    KVM_REG_MIPS_CP0_KSCRATCH2      64
+  MIPS    KVM_REG_MIPS_CP0_KSCRATCH3      64
+  MIPS    KVM_REG_MIPS_CP0_KSCRATCH4      64
+  MIPS    KVM_REG_MIPS_CP0_KSCRATCH5      64
+  MIPS    KVM_REG_MIPS_CP0_KSCRATCH6      64
+  MIPS    KVM_REG_MIPS_CP0_MAAR(0..63)    64
+  MIPS    KVM_REG_MIPS_COUNT_CTL          64
+  MIPS    KVM_REG_MIPS_COUNT_RESUME       64
+  MIPS    KVM_REG_MIPS_COUNT_HZ           64
+  MIPS    KVM_REG_MIPS_FPR_32(0..31)      32
+  MIPS    KVM_REG_MIPS_FPR_64(0..31)      64
+  MIPS    KVM_REG_MIPS_VEC_128(0..31)     128
+  MIPS    KVM_REG_MIPS_FCR_IR             32
+  MIPS    KVM_REG_MIPS_FCR_CSR            32
+  MIPS    KVM_REG_MIPS_MSA_IR             32
+  MIPS    KVM_REG_MIPS_MSA_CSR            32
+  ======= =============================== ============
 
 ARM registers are mapped using the lower 32 bits.  The upper 16 of that
 is the register group type, or coprocessor number:
 
-ARM core registers have the following id bit patterns:
+ARM core registers have the following id bit patterns::
+
   0x4020 0000 0010 <index into the kvm_regs struct:16>
 
-ARM 32-bit CP15 registers have the following id bit patterns:
+ARM 32-bit CP15 registers have the following id bit patterns::
+
   0x4020 0000 000F <zero:1> <crn:4> <crm:4> <opc1:4> <opc2:3>
 
-ARM 64-bit CP15 registers have the following id bit patterns:
+ARM 64-bit CP15 registers have the following id bit patterns::
+
   0x4030 0000 000F <zero:1> <zero:4> <crm:4> <opc1:4> <zero:3>
 
-ARM CCSIDR registers are demultiplexed by CSSELR value:
+ARM CCSIDR registers are demultiplexed by CSSELR value::
+
   0x4020 0000 0011 00 <csselr:8>
 
-ARM 32-bit VFP control registers have the following id bit patterns:
+ARM 32-bit VFP control registers have the following id bit patterns::
+
   0x4020 0000 0012 1 <regno:12>
 
-ARM 64-bit FP registers have the following id bit patterns:
+ARM 64-bit FP registers have the following id bit patterns::
+
   0x4030 0000 0012 0 <regno:12>
 
-ARM firmware pseudo-registers have the following bit pattern:
+ARM firmware pseudo-registers have the following bit pattern::
+
   0x4030 0000 0014 <regno:16>
 
 
@@ -2156,15 +2368,18 @@ that is the register group type, or coprocessor number:
 arm64 core/FP-SIMD registers have the following id bit patterns. Note
 that the size of the access is variable, as the kvm_regs structure
 contains elements ranging from 32 to 128 bits. The index is a 32bit
-value in the kvm_regs structure seen as a 32bit array.
+value in the kvm_regs structure seen as a 32bit array::
+
   0x60x0 0000 0010 <index into the kvm_regs struct:16>
 
 Specifically:
+
+======================= ========= ===== =======================================
     Encoding            Register  Bits  kvm_regs member
-----------------------------------------------------------------
+======================= ========= ===== =======================================
   0x6030 0000 0010 0000 X0          64  regs.regs[0]
   0x6030 0000 0010 0002 X1          64  regs.regs[1]
-    ...
+  ...
   0x6030 0000 0010 003c X30         64  regs.regs[30]
   0x6030 0000 0010 003e SP          64  regs.sp
   0x6030 0000 0010 0040 PC          64  regs.pc
@@ -2176,27 +2391,31 @@ Specifically:
   0x6030 0000 0010 004c SPSR_UND    64  spsr[KVM_SPSR_UND]
   0x6030 0000 0010 004e SPSR_IRQ    64  spsr[KVM_SPSR_IRQ]
   0x6060 0000 0010 0050 SPSR_FIQ    64  spsr[KVM_SPSR_FIQ]
-  0x6040 0000 0010 0054 V0         128  fp_regs.vregs[0]    (*)
-  0x6040 0000 0010 0058 V1         128  fp_regs.vregs[1]    (*)
-    ...
-  0x6040 0000 0010 00d0 V31        128  fp_regs.vregs[31]   (*)
+  0x6040 0000 0010 0054 V0         128  fp_regs.vregs[0]    [1]_
+  0x6040 0000 0010 0058 V1         128  fp_regs.vregs[1]    [1]_
+  ...
+  0x6040 0000 0010 00d0 V31        128  fp_regs.vregs[31]   [1]_
   0x6020 0000 0010 00d4 FPSR        32  fp_regs.fpsr
   0x6020 0000 0010 00d5 FPCR        32  fp_regs.fpcr
+======================= ========= ===== =======================================
 
-(*) These encodings are not accepted for SVE-enabled vcpus.  See
-    KVM_ARM_VCPU_INIT.
+.. [1] These encodings are not accepted for SVE-enabled vcpus.  See
+       KVM_ARM_VCPU_INIT.
 
-    The equivalent register content can be accessed via bits [127:0] of
-    the corresponding SVE Zn registers instead for vcpus that have SVE
-    enabled (see below).
+       The equivalent register content can be accessed via bits [127:0] of
+       the corresponding SVE Zn registers instead for vcpus that have SVE
+       enabled (see below).
+
+arm64 CCSIDR registers are demultiplexed by CSSELR value::
 
-arm64 CCSIDR registers are demultiplexed by CSSELR value:
   0x6020 0000 0011 00 <csselr:8>
 
-arm64 system registers have the following id bit patterns:
+arm64 system registers have the following id bit patterns::
+
   0x6030 0000 0013 <op0:2> <op1:3> <crn:4> <crm:4> <op2:3>
 
-WARNING:
+.. warning::
+
      Two system register IDs do not follow the specified pattern.  These
      are KVM_REG_ARM_TIMER_CVAL and KVM_REG_ARM_TIMER_CNT, which map to
      system registers CNTV_CVAL_EL0 and CNTVCT_EL0 respectively.  These
@@ -2205,10 +2424,12 @@ WARNING:
      derived from the register encoding for CNTV_CVAL_EL0.  As this is
      API, it must remain this way.
 
-arm64 firmware pseudo-registers have the following bit pattern:
+arm64 firmware pseudo-registers have the following bit pattern::
+
   0x6030 0000 0014 <regno:16>
 
-arm64 SVE registers have the following bit patterns:
+arm64 SVE registers have the following bit patterns::
+
   0x6080 0000 0015 00 <n:5> <slice:5>   Zn bits[2048*slice + 2047 : 2048*slice]
   0x6050 0000 0015 04 <n:4> <slice:5>   Pn bits[256*slice + 255 : 256*slice]
   0x6050 0000 0015 060 <slice:5>        FFR bits[256*slice + 255 : 256*slice]
@@ -2216,7 +2437,7 @@ arm64 SVE registers have the following bit patterns:
 
 Access to register IDs where 2048 * slice >= 128 * max_vq will fail with
 ENOENT.  max_vq is the vcpu's maximum supported vector length in 128-bit
-quadwords: see (**) below.
+quadwords: see [2]_ below.
 
 These registers are only accessible on vcpus for which SVE is enabled.
 See KVM_ARM_VCPU_INIT for details.
@@ -2231,21 +2452,21 @@ lengths supported by the vcpu to be discovered and configured by
 userspace.  When transferred to or from user memory via KVM_GET_ONE_REG
 or KVM_SET_ONE_REG, the value of this register is of type
 __u64[KVM_ARM64_SVE_VLS_WORDS], and encodes the set of vector lengths as
-follows:
+follows::
 
-__u64 vector_lengths[KVM_ARM64_SVE_VLS_WORDS];
+  __u64 vector_lengths[KVM_ARM64_SVE_VLS_WORDS];
 
-if (vq >= SVE_VQ_MIN && vq <= SVE_VQ_MAX &&
-    ((vector_lengths[(vq - KVM_ARM64_SVE_VQ_MIN) / 64] >>
+  if (vq >= SVE_VQ_MIN && vq <= SVE_VQ_MAX &&
+      ((vector_lengths[(vq - KVM_ARM64_SVE_VQ_MIN) / 64] >>
 		((vq - KVM_ARM64_SVE_VQ_MIN) % 64)) & 1))
 	/* Vector length vq * 16 bytes supported */
-else
+  else
 	/* Vector length vq * 16 bytes not supported */
 
-(**) The maximum value vq for which the above condition is true is
-max_vq.  This is the maximum vector length available to the guest on
-this vcpu, and determines which register slices are visible through
-this ioctl interface.
+.. [2] The maximum value vq for which the above condition is true is
+       max_vq.  This is the maximum vector length available to the guest on
+       this vcpu, and determines which register slices are visible through
+       this ioctl interface.
 
 (See Documentation/arm64/sve.rst for an explanation of the "vq"
 nomenclature.)
@@ -2270,11 +2491,13 @@ write this register will fail with EPERM.
 MIPS registers are mapped using the lower 32 bits.  The upper 16 of that is
 the register group type:
 
-MIPS core registers (see above) have the following id bit patterns:
+MIPS core registers (see above) have the following id bit patterns::
+
   0x7030 0000 0000 <reg:16>
 
 MIPS CP0 registers (see KVM_REG_MIPS_CP0_* above) have the following id bit
-patterns depending on whether they're 32-bit or 64-bit registers:
+patterns depending on whether they're 32-bit or 64-bit registers::
+
   0x7020 0000 0001 00 <reg:5> <sel:3>   (32-bit)
   0x7030 0000 0001 00 <reg:5> <sel:3>   (64-bit)
 
@@ -2285,10 +2508,12 @@ with the RI and XI bits (if they exist) in bits 63 and 62 respectively, and
 the PFNX field starting at bit 30.
 
 MIPS MAARs (see KVM_REG_MIPS_CP0_MAAR(*) above) have the following id bit
-patterns:
+patterns::
+
   0x7030 0000 0001 01 <reg:8>
 
-MIPS KVM control registers (see above) have the following id bit patterns:
+MIPS KVM control registers (see above) have the following id bit patterns::
+
   0x7030 0000 0002 <reg:16>
 
 MIPS FPU registers (see KVM_REG_MIPS_FPR_{32,64}() above) have the following
@@ -2297,31 +2522,40 @@ always accessed according to the current guest FPU mode (Status.FR and
 Config5.FRE), i.e. as the guest would see them, and they become unpredictable
 if the guest FPU mode is changed. MIPS SIMD Architecture (MSA) vector
 registers (see KVM_REG_MIPS_VEC_128() above) have similar patterns as they
-overlap the FPU registers:
+overlap the FPU registers::
+
   0x7020 0000 0003 00 <0:3> <reg:5> (32-bit FPU registers)
   0x7030 0000 0003 00 <0:3> <reg:5> (64-bit FPU registers)
   0x7040 0000 0003 00 <0:3> <reg:5> (128-bit MSA vector registers)
 
 MIPS FPU control registers (see KVM_REG_MIPS_FCR_{IR,CSR} above) have the
-following id bit patterns:
+following id bit patterns::
+
   0x7020 0000 0003 01 <0:3> <reg:5>
 
 MIPS MSA control registers (see KVM_REG_MIPS_MSA_{IR,CSR} above) have the
-following id bit patterns:
+following id bit patterns::
+
   0x7020 0000 0003 02 <0:3> <reg:5>
 
 
 4.69 KVM_GET_ONE_REG
+--------------------
+
+:Capability: KVM_CAP_ONE_REG
+:Architectures: all
+:Type: vcpu ioctl
+:Parameters: struct kvm_one_reg (in and out)
+:Returns: 0 on success, negative value on failure
 
-Capability: KVM_CAP_ONE_REG
-Architectures: all
-Type: vcpu ioctl
-Parameters: struct kvm_one_reg (in and out)
-Returns: 0 on success, negative value on failure
 Errors include:
-  ENOENT:   no such register
-  EINVAL:   invalid register ID, or no such register
-  EPERM:    (arm64) register access not allowed before vcpu finalization
+
+  ======== ============================================================
+  ENOENT   no such register
+  EINVAL   invalid register ID, or no such register
+  EPERM    (arm64) register access not allowed before vcpu finalization
+  ======== ============================================================
+
 (These error codes are indicative only: do not rely on a specific error
 code being returned in a specific situation.)
 
@@ -2335,12 +2569,13 @@ list in 4.68.
 
 
 4.70 KVM_KVMCLOCK_CTRL
+----------------------
 
-Capability: KVM_CAP_KVMCLOCK_CTRL
-Architectures: Any that implement pvclocks (currently x86 only)
-Type: vcpu ioctl
-Parameters: None
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_KVMCLOCK_CTRL
+:Architectures: Any that implement pvclocks (currently x86 only)
+:Type: vcpu ioctl
+:Parameters: None
+:Returns: 0 on success, -1 on error
 
 This signals to the host kernel that the specified guest is being paused by
 userspace.  The host will set a flag in the pvclock structure that is checked
@@ -2356,26 +2591,30 @@ after pausing the vcpu, but before it is resumed.
 
 
 4.71 KVM_SIGNAL_MSI
+-------------------
 
-Capability: KVM_CAP_SIGNAL_MSI
-Architectures: x86 arm arm64
-Type: vm ioctl
-Parameters: struct kvm_msi (in)
-Returns: >0 on delivery, 0 if guest blocked the MSI, and -1 on error
+:Capability: KVM_CAP_SIGNAL_MSI
+:Architectures: x86 arm arm64
+:Type: vm ioctl
+:Parameters: struct kvm_msi (in)
+:Returns: >0 on delivery, 0 if guest blocked the MSI, and -1 on error
 
 Directly inject a MSI message. Only valid with in-kernel irqchip that handles
 MSI messages.
 
-struct kvm_msi {
+::
+
+  struct kvm_msi {
 	__u32 address_lo;
 	__u32 address_hi;
 	__u32 data;
 	__u32 flags;
 	__u32 devid;
 	__u8  pad[12];
-};
+  };
 
-flags: KVM_MSI_VALID_DEVID: devid contains a valid value.  The per-VM
+flags:
+  KVM_MSI_VALID_DEVID: devid contains a valid value.  The per-VM
   KVM_CAP_MSI_DEVID capability advertises the requirement to provide
   the device ID.  If this capability is not available, userspace
   should never set the KVM_MSI_VALID_DEVID flag as the ioctl might fail.
@@ -2391,30 +2630,31 @@ address_hi must be zero.
 
 
 4.71 KVM_CREATE_PIT2
+--------------------
 
-Capability: KVM_CAP_PIT2
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_pit_config (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_PIT2
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_pit_config (in)
+:Returns: 0 on success, -1 on error
 
 Creates an in-kernel device model for the i8254 PIT. This call is only valid
 after enabling in-kernel irqchip support via KVM_CREATE_IRQCHIP. The following
-parameters have to be passed:
+parameters have to be passed::
 
-struct kvm_pit_config {
+  struct kvm_pit_config {
 	__u32 flags;
 	__u32 pad[15];
-};
+  };
 
-Valid flags are:
+Valid flags are::
 
-#define KVM_PIT_SPEAKER_DUMMY     1 /* emulate speaker port stub */
+  #define KVM_PIT_SPEAKER_DUMMY     1 /* emulate speaker port stub */
 
 PIT timer interrupts may use a per-VM kernel thread for injection. If it
-exists, this thread will have a name of the following pattern:
+exists, this thread will have a name of the following pattern::
 
-kvm-pit/<owner-process-pid>
+  kvm-pit/<owner-process-pid>
 
 When running a guest with elevated priorities, the scheduling parameters of
 this thread may have to be adjusted accordingly.
@@ -2423,37 +2663,39 @@ This IOCTL replaces the obsolete KVM_CREATE_PIT.
 
 
 4.72 KVM_GET_PIT2
+-----------------
 
-Capability: KVM_CAP_PIT_STATE2
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_pit_state2 (out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_PIT_STATE2
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_pit_state2 (out)
+:Returns: 0 on success, -1 on error
 
 Retrieves the state of the in-kernel PIT model. Only valid after
-KVM_CREATE_PIT2. The state is returned in the following structure:
+KVM_CREATE_PIT2. The state is returned in the following structure::
 
-struct kvm_pit_state2 {
+  struct kvm_pit_state2 {
 	struct kvm_pit_channel_state channels[3];
 	__u32 flags;
 	__u32 reserved[9];
-};
+  };
 
-Valid flags are:
+Valid flags are::
 
-/* disable PIT in HPET legacy mode */
-#define KVM_PIT_FLAGS_HPET_LEGACY  0x00000001
+  /* disable PIT in HPET legacy mode */
+  #define KVM_PIT_FLAGS_HPET_LEGACY  0x00000001
 
 This IOCTL replaces the obsolete KVM_GET_PIT.
 
 
 4.73 KVM_SET_PIT2
+-----------------
 
-Capability: KVM_CAP_PIT_STATE2
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_pit_state2 (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_PIT_STATE2
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_pit_state2 (in)
+:Returns: 0 on success, -1 on error
 
 Sets the state of the in-kernel PIT model. Only valid after KVM_CREATE_PIT2.
 See KVM_GET_PIT2 for details on struct kvm_pit_state2.
@@ -2462,12 +2704,13 @@ This IOCTL replaces the obsolete KVM_SET_PIT.
 
 
 4.74 KVM_PPC_GET_SMMU_INFO
+--------------------------
 
-Capability: KVM_CAP_PPC_GET_SMMU_INFO
-Architectures: powerpc
-Type: vm ioctl
-Parameters: None
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_PPC_GET_SMMU_INFO
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: None
+:Returns: 0 on success, -1 on error
 
 This populates and returns a structure describing the features of
 the "Server" class MMU emulation supported by KVM.
@@ -2475,7 +2718,7 @@ This can in turn be used by userspace to generate the appropriate
 device-tree properties for the guest operating system.
 
 The structure contains some global information, followed by an
-array of supported segment page sizes:
+array of supported segment page sizes::
 
       struct kvm_ppc_smmu_info {
 	     __u64 flags;
@@ -2503,7 +2746,7 @@ The "slb_size" field indicates how many SLB entries are supported
 
 The "sps" array contains 8 entries indicating the supported base
 page sizes for a segment in increasing order. Each entry is defined
-as follow:
+as follow::
 
    struct kvm_ppc_one_seg_page_size {
 	__u32 page_shift;	/* Base page shift of segment (or 0) */
@@ -2524,7 +2767,7 @@ size provides the list of supported actual page sizes (which can be
 only larger or equal to the base page size), along with the
 corresponding encoding in the hash PTE. Similarly, the array is
 8 entries sorted by increasing sizes and an entry with a "0" shift
-is an empty entry and a terminator:
+is an empty entry and a terminator::
 
    struct kvm_ppc_one_page_size {
 	__u32 page_shift;	/* Page shift (or 0) */
@@ -2536,12 +2779,13 @@ PTE's RPN field (ie, it needs to be shifted left by 12 to OR it
 into the hash PTE second double word).
 
 4.75 KVM_IRQFD
+--------------
 
-Capability: KVM_CAP_IRQFD
-Architectures: x86 s390 arm arm64
-Type: vm ioctl
-Parameters: struct kvm_irqfd (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_IRQFD
+:Architectures: x86 s390 arm arm64
+:Type: vm ioctl
+:Parameters: struct kvm_irqfd (in)
+:Returns: 0 on success, -1 on error
 
 Allows setting an eventfd to directly trigger a guest interrupt.
 kvm_irqfd.fd specifies the file descriptor to use as the eventfd and
@@ -2565,6 +2809,7 @@ irqfd.  The KVM_IRQFD_FLAG_RESAMPLE is only necessary on assignment
 and need not be specified with KVM_IRQFD_FLAG_DEASSIGN.
 
 On arm/arm64, gsi routing being supported, the following can happen:
+
 - in case no routing entry is associated to this gsi, injection fails
 - in case the gsi is associated to an irqchip routing entry,
   irqchip.pin + 32 corresponds to the injected SPI ID.
@@ -2573,12 +2818,13 @@ On arm/arm64, gsi routing being supported, the following can happen:
   to GICv3 ITS in-kernel emulation).
 
 4.76 KVM_PPC_ALLOCATE_HTAB
+--------------------------
 
-Capability: KVM_CAP_PPC_ALLOC_HTAB
-Architectures: powerpc
-Type: vm ioctl
-Parameters: Pointer to u32 containing hash table order (in/out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_PPC_ALLOC_HTAB
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: Pointer to u32 containing hash table order (in/out)
+:Returns: 0 on success, -1 on error
 
 This requests the host kernel to allocate an MMU hash table for a
 guest using the PAPR paravirtualization interface.  This only does
@@ -2609,75 +2855,88 @@ real-mode area (VRMA) facility, the kernel will re-create the VMRA
 HPTEs on the next KVM_RUN of any vcpu.
 
 4.77 KVM_S390_INTERRUPT
+-----------------------
 
-Capability: basic
-Architectures: s390
-Type: vm ioctl, vcpu ioctl
-Parameters: struct kvm_s390_interrupt (in)
-Returns: 0 on success, -1 on error
+:Capability: basic
+:Architectures: s390
+:Type: vm ioctl, vcpu ioctl
+:Parameters: struct kvm_s390_interrupt (in)
+:Returns: 0 on success, -1 on error
 
 Allows to inject an interrupt to the guest. Interrupts can be floating
 (vm ioctl) or per cpu (vcpu ioctl), depending on the interrupt type.
 
-Interrupt parameters are passed via kvm_s390_interrupt:
+Interrupt parameters are passed via kvm_s390_interrupt::
 
-struct kvm_s390_interrupt {
+  struct kvm_s390_interrupt {
 	__u32 type;
 	__u32 parm;
 	__u64 parm64;
-};
+  };
 
 type can be one of the following:
 
-KVM_S390_SIGP_STOP (vcpu) - sigp stop; optional flags in parm
-KVM_S390_PROGRAM_INT (vcpu) - program check; code in parm
-KVM_S390_SIGP_SET_PREFIX (vcpu) - sigp set prefix; prefix address in parm
-KVM_S390_RESTART (vcpu) - restart
-KVM_S390_INT_CLOCK_COMP (vcpu) - clock comparator interrupt
-KVM_S390_INT_CPU_TIMER (vcpu) - CPU timer interrupt
-KVM_S390_INT_VIRTIO (vm) - virtio external interrupt; external interrupt
-			   parameters in parm and parm64
-KVM_S390_INT_SERVICE (vm) - sclp external interrupt; sclp parameter in parm
-KVM_S390_INT_EMERGENCY (vcpu) - sigp emergency; source cpu in parm
-KVM_S390_INT_EXTERNAL_CALL (vcpu) - sigp external call; source cpu in parm
-KVM_S390_INT_IO(ai,cssid,ssid,schid) (vm) - compound value to indicate an
-    I/O interrupt (ai - adapter interrupt; cssid,ssid,schid - subchannel);
-    I/O interruption parameters in parm (subchannel) and parm64 (intparm,
-    interruption subclass)
-KVM_S390_MCHK (vm, vcpu) - machine check interrupt; cr 14 bits in parm,
-                           machine check interrupt code in parm64 (note that
-                           machine checks needing further payload are not
-                           supported by this ioctl)
+KVM_S390_SIGP_STOP (vcpu)
+    - sigp stop; optional flags in parm
+KVM_S390_PROGRAM_INT (vcpu)
+    - program check; code in parm
+KVM_S390_SIGP_SET_PREFIX (vcpu)
+    - sigp set prefix; prefix address in parm
+KVM_S390_RESTART (vcpu)
+    - restart
+KVM_S390_INT_CLOCK_COMP (vcpu)
+    - clock comparator interrupt
+KVM_S390_INT_CPU_TIMER (vcpu)
+    - CPU timer interrupt
+KVM_S390_INT_VIRTIO (vm)
+    - virtio external interrupt; external interrupt
+      parameters in parm and parm64
+KVM_S390_INT_SERVICE (vm)
+    - sclp external interrupt; sclp parameter in parm
+KVM_S390_INT_EMERGENCY (vcpu)
+    - sigp emergency; source cpu in parm
+KVM_S390_INT_EXTERNAL_CALL (vcpu)
+    - sigp external call; source cpu in parm
+KVM_S390_INT_IO(ai,cssid,ssid,schid) (vm)
+    - compound value to indicate an
+      I/O interrupt (ai - adapter interrupt; cssid,ssid,schid - subchannel);
+      I/O interruption parameters in parm (subchannel) and parm64 (intparm,
+      interruption subclass)
+KVM_S390_MCHK (vm, vcpu)
+    - machine check interrupt; cr 14 bits in parm, machine check interrupt
+      code in parm64 (note that machine checks needing further payload are not
+      supported by this ioctl)
 
 This is an asynchronous vcpu ioctl and can be invoked from any thread.
 
 4.78 KVM_PPC_GET_HTAB_FD
+------------------------
 
-Capability: KVM_CAP_PPC_HTAB_FD
-Architectures: powerpc
-Type: vm ioctl
-Parameters: Pointer to struct kvm_get_htab_fd (in)
-Returns: file descriptor number (>= 0) on success, -1 on error
+:Capability: KVM_CAP_PPC_HTAB_FD
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: Pointer to struct kvm_get_htab_fd (in)
+:Returns: file descriptor number (>= 0) on success, -1 on error
 
 This returns a file descriptor that can be used either to read out the
 entries in the guest's hashed page table (HPT), or to write entries to
 initialize the HPT.  The returned fd can only be written to if the
 KVM_GET_HTAB_WRITE bit is set in the flags field of the argument, and
 can only be read if that bit is clear.  The argument struct looks like
-this:
+this::
 
-/* For KVM_PPC_GET_HTAB_FD */
-struct kvm_get_htab_fd {
+  /* For KVM_PPC_GET_HTAB_FD */
+  struct kvm_get_htab_fd {
 	__u64	flags;
 	__u64	start_index;
 	__u64	reserved[2];
-};
+  };
 
-/* Values for kvm_get_htab_fd.flags */
-#define KVM_GET_HTAB_BOLTED_ONLY	((__u64)0x1)
-#define KVM_GET_HTAB_WRITE		((__u64)0x2)
+  /* Values for kvm_get_htab_fd.flags */
+  #define KVM_GET_HTAB_BOLTED_ONLY	((__u64)0x1)
+  #define KVM_GET_HTAB_WRITE		((__u64)0x2)
 
-The `start_index' field gives the index in the HPT of the entry at
+The 'start_index' field gives the index in the HPT of the entry at
 which to start reading.  It is ignored when writing.
 
 Reads on the fd will initially supply information about all
@@ -2692,29 +2951,34 @@ Data read or written is structured as a header (8 bytes) followed by a
 series of valid HPT entries (16 bytes) each.  The header indicates how
 many valid HPT entries there are and how many invalid entries follow
 the valid entries.  The invalid entries are not represented explicitly
-in the stream.  The header format is:
+in the stream.  The header format is::
 
-struct kvm_get_htab_header {
+  struct kvm_get_htab_header {
 	__u32	index;
 	__u16	n_valid;
 	__u16	n_invalid;
-};
+  };
 
 Writes to the fd create HPT entries starting at the index given in the
-header; first `n_valid' valid entries with contents from the data
-written, then `n_invalid' invalid entries, invalidating any previously
+header; first 'n_valid' valid entries with contents from the data
+written, then 'n_invalid' invalid entries, invalidating any previously
 valid entries found.
 
 4.79 KVM_CREATE_DEVICE
+----------------------
+
+:Capability: KVM_CAP_DEVICE_CTRL
+:Type: vm ioctl
+:Parameters: struct kvm_create_device (in/out)
+:Returns: 0 on success, -1 on error
 
-Capability: KVM_CAP_DEVICE_CTRL
-Type: vm ioctl
-Parameters: struct kvm_create_device (in/out)
-Returns: 0 on success, -1 on error
 Errors:
-  ENODEV: The device type is unknown or unsupported
-  EEXIST: Device already created, and this type of device may not
+
+  ======  =======================================================
+  ENODEV  The device type is unknown or unsupported
+  EEXIST  Device already created, and this type of device may not
           be instantiated multiple times
+  ======  =======================================================
 
   Other error conditions may be defined by individual device types or
   have their standard meanings.
@@ -2730,25 +2994,32 @@ Individual devices should not define flags.  Attributes should be used
 for specifying any behavior that is not implied by the device type
 number.
 
-struct kvm_create_device {
+::
+
+  struct kvm_create_device {
 	__u32	type;	/* in: KVM_DEV_TYPE_xxx */
 	__u32	fd;	/* out: device handle */
 	__u32	flags;	/* in: KVM_CREATE_DEVICE_xxx */
-};
+  };
 
 4.80 KVM_SET_DEVICE_ATTR/KVM_GET_DEVICE_ATTR
+--------------------------------------------
+
+:Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
+             KVM_CAP_VCPU_ATTRIBUTES for vcpu device
+:Type: device ioctl, vm ioctl, vcpu ioctl
+:Parameters: struct kvm_device_attr
+:Returns: 0 on success, -1 on error
 
-Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
-  KVM_CAP_VCPU_ATTRIBUTES for vcpu device
-Type: device ioctl, vm ioctl, vcpu ioctl
-Parameters: struct kvm_device_attr
-Returns: 0 on success, -1 on error
 Errors:
-  ENXIO:  The group or attribute is unknown/unsupported for this device
+
+  =====   =============================================================
+  ENXIO   The group or attribute is unknown/unsupported for this device
           or hardware support is missing.
-  EPERM:  The attribute cannot (currently) be accessed this way
+  EPERM   The attribute cannot (currently) be accessed this way
           (e.g. read-only attribute, or attribute that only makes
           sense when the device is in a different state)
+  =====   =============================================================
 
   Other error conditions may be defined by individual device types.
 
@@ -2757,23 +3028,30 @@ semantics are device-specific.  See individual device documentation in
 the "devices" directory.  As with ONE_REG, the size of the data
 transferred is defined by the particular attribute.
 
-struct kvm_device_attr {
+::
+
+  struct kvm_device_attr {
 	__u32	flags;		/* no flags currently defined */
 	__u32	group;		/* device-defined */
 	__u64	attr;		/* group-defined */
 	__u64	addr;		/* userspace address of attr data */
-};
+  };
 
 4.81 KVM_HAS_DEVICE_ATTR
+------------------------
+
+:Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
+	     KVM_CAP_VCPU_ATTRIBUTES for vcpu device
+:Type: device ioctl, vm ioctl, vcpu ioctl
+:Parameters: struct kvm_device_attr
+:Returns: 0 on success, -1 on error
 
-Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
-  KVM_CAP_VCPU_ATTRIBUTES for vcpu device
-Type: device ioctl, vm ioctl, vcpu ioctl
-Parameters: struct kvm_device_attr
-Returns: 0 on success, -1 on error
 Errors:
-  ENXIO:  The group or attribute is unknown/unsupported for this device
+
+  =====   =============================================================
+  ENXIO   The group or attribute is unknown/unsupported for this device
           or hardware support is missing.
+  =====   =============================================================
 
 Tests whether a device supports a particular attribute.  A successful
 return indicates the attribute is implemented.  It does not necessarily
@@ -2781,15 +3059,20 @@ indicate that the attribute can be read or written in the device's
 current state.  "addr" is ignored.
 
 4.82 KVM_ARM_VCPU_INIT
+----------------------
+
+:Capability: basic
+:Architectures: arm, arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_vcpu_init (in)
+:Returns: 0 on success; -1 on error
 
-Capability: basic
-Architectures: arm, arm64
-Type: vcpu ioctl
-Parameters: struct kvm_vcpu_init (in)
-Returns: 0 on success; -1 on error
 Errors:
-  EINVAL:    the target is unknown, or the combination of features is invalid.
-  ENOENT:    a features bit specified is unknown.
+
+  ======     =================================================================
+  EINVAL     the target is unknown, or the combination of features is invalid.
+  ENOENT     a features bit specified is unknown.
+  ======     =================================================================
 
 This tells KVM what type of CPU to present to the guest, and what
 optional features it should have.  This will cause a reset of the cpu
@@ -2805,6 +3088,7 @@ state. All calls to this function after the initial call must use the same
 target and same set of feature flags, otherwise EINVAL will be returned.
 
 Possible features:
+
 	- KVM_ARM_VCPU_POWER_OFF: Starts the CPU in a power-off state.
 	  Depends on KVM_CAP_ARM_PSCI.  If not set, the CPU will be powered on
 	  and execute guest code when KVM_RUN is called.
@@ -2861,14 +3145,19 @@ Possible features:
 	        no longer be written using KVM_SET_ONE_REG.
 
 4.83 KVM_ARM_PREFERRED_TARGET
+-----------------------------
+
+:Capability: basic
+:Architectures: arm, arm64
+:Type: vm ioctl
+:Parameters: struct struct kvm_vcpu_init (out)
+:Returns: 0 on success; -1 on error
 
-Capability: basic
-Architectures: arm, arm64
-Type: vm ioctl
-Parameters: struct struct kvm_vcpu_init (out)
-Returns: 0 on success; -1 on error
 Errors:
-  ENODEV:    no preferred target available for the host
+
+  ======     ==========================================
+  ENODEV     no preferred target available for the host
+  ======     ==========================================
 
 This queries KVM for preferred CPU target type which can be emulated
 by KVM on underlying host.
@@ -2885,43 +3174,57 @@ in VCPU matching underlying host.
 
 
 4.84 KVM_GET_REG_LIST
+---------------------
+
+:Capability: basic
+:Architectures: arm, arm64, mips
+:Type: vcpu ioctl
+:Parameters: struct kvm_reg_list (in/out)
+:Returns: 0 on success; -1 on error
 
-Capability: basic
-Architectures: arm, arm64, mips
-Type: vcpu ioctl
-Parameters: struct kvm_reg_list (in/out)
-Returns: 0 on success; -1 on error
 Errors:
-  E2BIG:     the reg index list is too big to fit in the array specified by
+
+  =====      ==============================================================
+  E2BIG      the reg index list is too big to fit in the array specified by
              the user (the number required will be written into n).
+  =====      ==============================================================
 
-struct kvm_reg_list {
+::
+
+  struct kvm_reg_list {
 	__u64 n; /* number of registers in reg[] */
 	__u64 reg[0];
-};
+  };
 
 This ioctl returns the guest registers that are supported for the
 KVM_GET_ONE_REG/KVM_SET_ONE_REG calls.
 
 
 4.85 KVM_ARM_SET_DEVICE_ADDR (deprecated)
+-----------------------------------------
+
+:Capability: KVM_CAP_ARM_SET_DEVICE_ADDR
+:Architectures: arm, arm64
+:Type: vm ioctl
+:Parameters: struct kvm_arm_device_address (in)
+:Returns: 0 on success, -1 on error
 
-Capability: KVM_CAP_ARM_SET_DEVICE_ADDR
-Architectures: arm, arm64
-Type: vm ioctl
-Parameters: struct kvm_arm_device_address (in)
-Returns: 0 on success, -1 on error
 Errors:
-  ENODEV: The device id is unknown
-  ENXIO:  Device not supported on current system
-  EEXIST: Address already set
-  E2BIG:  Address outside guest physical address space
-  EBUSY:  Address overlaps with other device range
 
-struct kvm_arm_device_addr {
+  ======  ============================================
+  ENODEV  The device id is unknown
+  ENXIO   Device not supported on current system
+  EEXIST  Address already set
+  E2BIG   Address outside guest physical address space
+  EBUSY   Address overlaps with other device range
+  ======  ============================================
+
+::
+
+  struct kvm_arm_device_addr {
 	__u64 id;
 	__u64 addr;
-};
+  };
 
 Specify a device address in the guest's physical address space where guests
 can access emulated or directly exposed devices, which the host kernel needs
@@ -2929,7 +3232,7 @@ to know about. The id field is an architecture specific identifier for a
 specific device.
 
 ARM/arm64 divides the id field into two parts, a device id and an
-address type id specific to the individual device.
+address type id specific to the individual device::
 
   bits:  | 63        ...       32 | 31    ...    16 | 15    ...    0 |
   field: |        0x00000000      |     device id   |  addr type id  |
@@ -2947,12 +3250,13 @@ should be used instead.
 
 
 4.86 KVM_PPC_RTAS_DEFINE_TOKEN
+------------------------------
 
-Capability: KVM_CAP_PPC_RTAS
-Architectures: ppc
-Type: vm ioctl
-Parameters: struct kvm_rtas_token_args
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_PPC_RTAS
+:Architectures: ppc
+:Type: vm ioctl
+:Parameters: struct kvm_rtas_token_args
+:Returns: 0 on success, -1 on error
 
 Defines a token value for a RTAS (Run Time Abstraction Services)
 service in order to allow it to be handled in the kernel.  The
@@ -2966,18 +3270,21 @@ calls by the guest for that service will be passed to userspace to be
 handled.
 
 4.87 KVM_SET_GUEST_DEBUG
+------------------------
 
-Capability: KVM_CAP_SET_GUEST_DEBUG
-Architectures: x86, s390, ppc, arm64
-Type: vcpu ioctl
-Parameters: struct kvm_guest_debug (in)
-Returns: 0 on success; -1 on error
+:Capability: KVM_CAP_SET_GUEST_DEBUG
+:Architectures: x86, s390, ppc, arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_guest_debug (in)
+:Returns: 0 on success; -1 on error
 
-struct kvm_guest_debug {
+::
+
+  struct kvm_guest_debug {
        __u32 control;
        __u32 pad;
        struct kvm_guest_debug_arch arch;
-};
+  };
 
 Set up the processor specific debug registers and configure vcpu for
 handling guest debug events. There are two parts to the structure, the
@@ -3019,26 +3326,31 @@ KVM_EXIT_DEBUG with the kvm_debug_exit_arch part of the kvm_run
 structure containing architecture specific debug information.
 
 4.88 KVM_GET_EMULATED_CPUID
+---------------------------
 
-Capability: KVM_CAP_EXT_EMUL_CPUID
-Architectures: x86
-Type: system ioctl
-Parameters: struct kvm_cpuid2 (in/out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_EXT_EMUL_CPUID
+:Architectures: x86
+:Type: system ioctl
+:Parameters: struct kvm_cpuid2 (in/out)
+:Returns: 0 on success, -1 on error
 
-struct kvm_cpuid2 {
+::
+
+  struct kvm_cpuid2 {
 	__u32 nent;
 	__u32 flags;
 	struct kvm_cpuid_entry2 entries[0];
-};
+  };
 
 The member 'flags' is used for passing flags from userspace.
 
-#define KVM_CPUID_FLAG_SIGNIFCANT_INDEX		BIT(0)
-#define KVM_CPUID_FLAG_STATEFUL_FUNC		BIT(1)
-#define KVM_CPUID_FLAG_STATE_READ_NEXT		BIT(2)
+::
 
-struct kvm_cpuid_entry2 {
+  #define KVM_CPUID_FLAG_SIGNIFCANT_INDEX		BIT(0)
+  #define KVM_CPUID_FLAG_STATEFUL_FUNC		BIT(1)
+  #define KVM_CPUID_FLAG_STATE_READ_NEXT		BIT(2)
+
+  struct kvm_cpuid_entry2 {
 	__u32 function;
 	__u32 index;
 	__u32 flags;
@@ -3047,7 +3359,7 @@ struct kvm_cpuid_entry2 {
 	__u32 ecx;
 	__u32 edx;
 	__u32 padding[3];
-};
+  };
 
 This ioctl returns x86 cpuid features which are emulated by
 kvm.Userspace can use the information returned by this ioctl to query
@@ -3072,10 +3384,14 @@ emulated efficiently and thus not included here.
 
 The fields in each entry are defined as follows:
 
-  function: the eax value used to obtain the entry
-  index: the ecx value used to obtain the entry (for entries that are
+  function:
+	 the eax value used to obtain the entry
+  index:
+	 the ecx value used to obtain the entry (for entries that are
          affected by ecx)
-  flags: an OR of zero or more of the following:
+  flags:
+    an OR of zero or more of the following:
+
         KVM_CPUID_FLAG_SIGNIFCANT_INDEX:
            if the index field is valid
         KVM_CPUID_FLAG_STATEFUL_FUNC:
@@ -3085,24 +3401,28 @@ The fields in each entry are defined as follows:
         KVM_CPUID_FLAG_STATE_READ_NEXT:
            for KVM_CPUID_FLAG_STATEFUL_FUNC entries, set if this entry is
            the first entry to be read by a cpu
-   eax, ebx, ecx, edx: the values returned by the cpuid instruction for
+
+   eax, ebx, ecx, edx:
+
+         the values returned by the cpuid instruction for
          this function/index combination
 
 4.89 KVM_S390_MEM_OP
+--------------------
 
-Capability: KVM_CAP_S390_MEM_OP
-Architectures: s390
-Type: vcpu ioctl
-Parameters: struct kvm_s390_mem_op (in)
-Returns: = 0 on success,
-         < 0 on generic error (e.g. -EFAULT or -ENOMEM),
-         > 0 if an exception occurred while walking the page tables
+:Capability: KVM_CAP_S390_MEM_OP
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_s390_mem_op (in)
+:Returns: = 0 on success,
+          < 0 on generic error (e.g. -EFAULT or -ENOMEM),
+          > 0 if an exception occurred while walking the page tables
 
 Read or write data from/to the logical (virtual) memory of a VCPU.
 
-Parameters are specified via the following structure:
+Parameters are specified via the following structure::
 
-struct kvm_s390_mem_op {
+  struct kvm_s390_mem_op {
 	__u64 gaddr;		/* the guest address */
 	__u64 flags;		/* flags */
 	__u32 size;		/* amount of bytes */
@@ -3110,7 +3430,7 @@ struct kvm_s390_mem_op {
 	__u64 buf;		/* buffer in userspace */
 	__u8 ar;		/* the access register number */
 	__u8 reserved[31];	/* should be set to 0 */
-};
+  };
 
 The type of operation is specified in the "op" field. It is either
 KVM_S390_MEMOP_LOGICAL_READ for reading from logical memory space or
@@ -3137,24 +3457,25 @@ The "reserved" field is meant for future extensions. It is not used by
 KVM with the currently defined set of flags.
 
 4.90 KVM_S390_GET_SKEYS
+-----------------------
 
-Capability: KVM_CAP_S390_SKEYS
-Architectures: s390
-Type: vm ioctl
-Parameters: struct kvm_s390_skeys
-Returns: 0 on success, KVM_S390_GET_KEYS_NONE if guest is not using storage
-         keys, negative value on error
+:Capability: KVM_CAP_S390_SKEYS
+:Architectures: s390
+:Type: vm ioctl
+:Parameters: struct kvm_s390_skeys
+:Returns: 0 on success, KVM_S390_GET_KEYS_NONE if guest is not using storage
+          keys, negative value on error
 
 This ioctl is used to get guest storage key values on the s390
-architecture. The ioctl takes parameters via the kvm_s390_skeys struct.
+architecture. The ioctl takes parameters via the kvm_s390_skeys struct::
 
-struct kvm_s390_skeys {
+  struct kvm_s390_skeys {
 	__u64 start_gfn;
 	__u64 count;
 	__u64 skeydata_addr;
 	__u32 flags;
 	__u32 reserved[9];
-};
+  };
 
 The start_gfn field is the number of the first guest frame whose storage keys
 you want to get.
@@ -3168,12 +3489,13 @@ The skeydata_addr field is the address to a buffer large enough to hold count
 bytes. This buffer will be filled with storage key data by the ioctl.
 
 4.91 KVM_S390_SET_SKEYS
+-----------------------
 
-Capability: KVM_CAP_S390_SKEYS
-Architectures: s390
-Type: vm ioctl
-Parameters: struct kvm_s390_skeys
-Returns: 0 on success, negative value on error
+:Capability: KVM_CAP_S390_SKEYS
+:Architectures: s390
+:Type: vm ioctl
+:Parameters: struct kvm_s390_skeys
+:Returns: 0 on success, negative value on error
 
 This ioctl is used to set guest storage key values on the s390
 architecture. The ioctl takes parameters via the kvm_s390_skeys struct.
@@ -3195,21 +3517,27 @@ Note: If any architecturally invalid key value is found in the given data then
 the ioctl will return -EINVAL.
 
 4.92 KVM_S390_IRQ
+-----------------
+
+:Capability: KVM_CAP_S390_INJECT_IRQ
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_s390_irq (in)
+:Returns: 0 on success, -1 on error
 
-Capability: KVM_CAP_S390_INJECT_IRQ
-Architectures: s390
-Type: vcpu ioctl
-Parameters: struct kvm_s390_irq (in)
-Returns: 0 on success, -1 on error
 Errors:
-  EINVAL: interrupt type is invalid
-          type is KVM_S390_SIGP_STOP and flag parameter is invalid value
+
+
+  ======  =================================================================
+  EINVAL  interrupt type is invalid
+          type is KVM_S390_SIGP_STOP and flag parameter is invalid value,
           type is KVM_S390_INT_EXTERNAL_CALL and code is bigger
-            than the maximum of VCPUs
-  EBUSY:  type is KVM_S390_SIGP_SET_PREFIX and vcpu is not stopped
-          type is KVM_S390_SIGP_STOP and a stop irq is already pending
+          than the maximum of VCPUs
+  EBUSY   type is KVM_S390_SIGP_SET_PREFIX and vcpu is not stopped,
+          type is KVM_S390_SIGP_STOP and a stop irq is already pending,
           type is KVM_S390_INT_EXTERNAL_CALL and an external call interrupt
-            is already pending
+          is already pending
+  ======  =================================================================
 
 Allows to inject an interrupt to the guest.
 
@@ -3217,9 +3545,9 @@ Using struct kvm_s390_irq as a parameter allows
 to inject additional payload which is not
 possible via KVM_S390_INTERRUPT.
 
-Interrupt parameters are passed via kvm_s390_irq:
+Interrupt parameters are passed via kvm_s390_irq::
 
-struct kvm_s390_irq {
+  struct kvm_s390_irq {
 	__u64 type;
 	union {
 		struct kvm_s390_io_info io;
@@ -3232,44 +3560,45 @@ struct kvm_s390_irq {
 		struct kvm_s390_mchk_info mchk;
 		char reserved[64];
 	} u;
-};
+  };
 
 type can be one of the following:
 
-KVM_S390_SIGP_STOP - sigp stop; parameter in .stop
-KVM_S390_PROGRAM_INT - program check; parameters in .pgm
-KVM_S390_SIGP_SET_PREFIX - sigp set prefix; parameters in .prefix
-KVM_S390_RESTART - restart; no parameters
-KVM_S390_INT_CLOCK_COMP - clock comparator interrupt; no parameters
-KVM_S390_INT_CPU_TIMER - CPU timer interrupt; no parameters
-KVM_S390_INT_EMERGENCY - sigp emergency; parameters in .emerg
-KVM_S390_INT_EXTERNAL_CALL - sigp external call; parameters in .extcall
-KVM_S390_MCHK - machine check interrupt; parameters in .mchk
+- KVM_S390_SIGP_STOP - sigp stop; parameter in .stop
+- KVM_S390_PROGRAM_INT - program check; parameters in .pgm
+- KVM_S390_SIGP_SET_PREFIX - sigp set prefix; parameters in .prefix
+- KVM_S390_RESTART - restart; no parameters
+- KVM_S390_INT_CLOCK_COMP - clock comparator interrupt; no parameters
+- KVM_S390_INT_CPU_TIMER - CPU timer interrupt; no parameters
+- KVM_S390_INT_EMERGENCY - sigp emergency; parameters in .emerg
+- KVM_S390_INT_EXTERNAL_CALL - sigp external call; parameters in .extcall
+- KVM_S390_MCHK - machine check interrupt; parameters in .mchk
 
 This is an asynchronous vcpu ioctl and can be invoked from any thread.
 
 4.94 KVM_S390_GET_IRQ_STATE
+---------------------------
 
-Capability: KVM_CAP_S390_IRQ_STATE
-Architectures: s390
-Type: vcpu ioctl
-Parameters: struct kvm_s390_irq_state (out)
-Returns: >= number of bytes copied into buffer,
-         -EINVAL if buffer size is 0,
-         -ENOBUFS if buffer size is too small to fit all pending interrupts,
-         -EFAULT if the buffer address was invalid
+:Capability: KVM_CAP_S390_IRQ_STATE
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_s390_irq_state (out)
+:Returns: >= number of bytes copied into buffer,
+          -EINVAL if buffer size is 0,
+          -ENOBUFS if buffer size is too small to fit all pending interrupts,
+          -EFAULT if the buffer address was invalid
 
 This ioctl allows userspace to retrieve the complete state of all currently
 pending interrupts in a single buffer. Use cases include migration
 and introspection. The parameter structure contains the address of a
-userspace buffer and its length:
+userspace buffer and its length::
 
-struct kvm_s390_irq_state {
+  struct kvm_s390_irq_state {
 	__u64 buf;
 	__u32 flags;        /* will stay unused for compatibility reasons */
 	__u32 len;
 	__u32 reserved[4];  /* will stay unused for compatibility reasons */
-};
+  };
 
 Userspace passes in the above struct and for each pending interrupt a
 struct kvm_s390_irq is copied to the provided buffer.
@@ -3283,29 +3612,30 @@ If -ENOBUFS is returned the buffer provided was too small and userspace
 may retry with a bigger buffer.
 
 4.95 KVM_S390_SET_IRQ_STATE
+---------------------------
 
-Capability: KVM_CAP_S390_IRQ_STATE
-Architectures: s390
-Type: vcpu ioctl
-Parameters: struct kvm_s390_irq_state (in)
-Returns: 0 on success,
-         -EFAULT if the buffer address was invalid,
-         -EINVAL for an invalid buffer length (see below),
-         -EBUSY if there were already interrupts pending,
-         errors occurring when actually injecting the
+:Capability: KVM_CAP_S390_IRQ_STATE
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_s390_irq_state (in)
+:Returns: 0 on success,
+          -EFAULT if the buffer address was invalid,
+          -EINVAL for an invalid buffer length (see below),
+          -EBUSY if there were already interrupts pending,
+          errors occurring when actually injecting the
           interrupt. See KVM_S390_IRQ.
 
 This ioctl allows userspace to set the complete state of all cpu-local
 interrupts currently pending for the vcpu. It is intended for restoring
 interrupt state after a migration. The input parameter is a userspace buffer
-containing a struct kvm_s390_irq_state:
+containing a struct kvm_s390_irq_state::
 
-struct kvm_s390_irq_state {
+  struct kvm_s390_irq_state {
 	__u64 buf;
 	__u32 flags;        /* will stay unused for compatibility reasons */
 	__u32 len;
 	__u32 reserved[4];  /* will stay unused for compatibility reasons */
-};
+  };
 
 The restrictions for flags and reserved apply as well.
 (see KVM_S390_GET_IRQ_STATE)
@@ -3320,20 +3650,22 @@ and it must not exceed (max_vcpus + 32) * sizeof(struct kvm_s390_irq),
 which is the maximum number of possibly pending cpu-local interrupts.
 
 4.96 KVM_SMI
+------------
 
-Capability: KVM_CAP_X86_SMM
-Architectures: x86
-Type: vcpu ioctl
-Parameters: none
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_X86_SMM
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: none
+:Returns: 0 on success, -1 on error
 
 Queues an SMI on the thread's vcpu.
 
 4.97 KVM_CAP_PPC_MULTITCE
+-------------------------
 
-Capability: KVM_CAP_PPC_MULTITCE
-Architectures: ppc
-Type: vm
+:Capability: KVM_CAP_PPC_MULTITCE
+:Architectures: ppc
+:Type: vm
 
 This capability means the kernel is capable of handling hypercalls
 H_PUT_TCE_INDIRECT and H_STUFF_TCE without passing those into the user
@@ -3355,26 +3687,27 @@ an implementation for these despite the in kernel acceleration.
 This capability is always enabled.
 
 4.98 KVM_CREATE_SPAPR_TCE_64
+----------------------------
 
-Capability: KVM_CAP_SPAPR_TCE_64
-Architectures: powerpc
-Type: vm ioctl
-Parameters: struct kvm_create_spapr_tce_64 (in)
-Returns: file descriptor for manipulating the created TCE table
+:Capability: KVM_CAP_SPAPR_TCE_64
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: struct kvm_create_spapr_tce_64 (in)
+:Returns: file descriptor for manipulating the created TCE table
 
 This is an extension for KVM_CAP_SPAPR_TCE which only supports 32bit
 windows, described in 4.62 KVM_CREATE_SPAPR_TCE
 
-This capability uses extended struct in ioctl interface:
+This capability uses extended struct in ioctl interface::
 
-/* for KVM_CAP_SPAPR_TCE_64 */
-struct kvm_create_spapr_tce_64 {
+  /* for KVM_CAP_SPAPR_TCE_64 */
+  struct kvm_create_spapr_tce_64 {
 	__u64 liobn;
 	__u32 page_shift;
 	__u32 flags;
 	__u64 offset;	/* in pages */
 	__u64 size; 	/* in pages */
-};
+  };
 
 The aim of extension is to support an additional bigger DMA window with
 a variable page size.
@@ -3387,12 +3720,13 @@ of IOMMU pages.
 The rest of functionality is identical to KVM_CREATE_SPAPR_TCE.
 
 4.99 KVM_REINJECT_CONTROL
+-------------------------
 
-Capability: KVM_CAP_REINJECT_CONTROL
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_reinject_control (in)
-Returns: 0 on success,
+:Capability: KVM_CAP_REINJECT_CONTROL
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_reinject_control (in)
+:Returns: 0 on success,
          -EFAULT if struct kvm_reinject_control cannot be read,
          -ENXIO if KVM_CREATE_PIT or KVM_CREATE_PIT2 didn't succeed earlier.
 
@@ -3402,21 +3736,24 @@ vector(s) that i8254 injects.  Reinject mode dequeues a tick and injects its
 interrupt whenever there isn't a pending interrupt from i8254.
 !reinject mode injects an interrupt as soon as a tick arrives.
 
-struct kvm_reinject_control {
+::
+
+  struct kvm_reinject_control {
 	__u8 pit_reinject;
 	__u8 reserved[31];
-};
+  };
 
 pit_reinject = 0 (!reinject mode) is recommended, unless running an old
 operating system that uses the PIT for timing (e.g. Linux 2.4.x).
 
 4.100 KVM_PPC_CONFIGURE_V3_MMU
+------------------------------
 
-Capability: KVM_CAP_PPC_RADIX_MMU or KVM_CAP_PPC_HASH_MMU_V3
-Architectures: ppc
-Type: vm ioctl
-Parameters: struct kvm_ppc_mmuv3_cfg (in)
-Returns: 0 on success,
+:Capability: KVM_CAP_PPC_RADIX_MMU or KVM_CAP_PPC_HASH_MMU_V3
+:Architectures: ppc
+:Type: vm ioctl
+:Parameters: struct kvm_ppc_mmuv3_cfg (in)
+:Returns: 0 on success,
          -EFAULT if struct kvm_ppc_mmuv3_cfg cannot be read,
          -EINVAL if the configuration is invalid
 
@@ -3424,10 +3761,12 @@ This ioctl controls whether the guest will use radix or HPT (hashed
 page table) translation, and sets the pointer to the process table for
 the guest.
 
-struct kvm_ppc_mmuv3_cfg {
+::
+
+  struct kvm_ppc_mmuv3_cfg {
 	__u64	flags;
 	__u64	process_table;
-};
+  };
 
 There are two bits that can be set in flags; KVM_PPC_MMUV3_RADIX and
 KVM_PPC_MMUV3_GTSE.  KVM_PPC_MMUV3_RADIX, if set, configures the guest
@@ -3442,12 +3781,13 @@ as the second doubleword of the partition table entry, as defined in
 the Power ISA V3.00, Book III section 5.7.6.1.
 
 4.101 KVM_PPC_GET_RMMU_INFO
+---------------------------
 
-Capability: KVM_CAP_PPC_RADIX_MMU
-Architectures: ppc
-Type: vm ioctl
-Parameters: struct kvm_ppc_rmmu_info (out)
-Returns: 0 on success,
+:Capability: KVM_CAP_PPC_RADIX_MMU
+:Architectures: ppc
+:Type: vm ioctl
+:Parameters: struct kvm_ppc_rmmu_info (out)
+:Returns: 0 on success,
 	 -EFAULT if struct kvm_ppc_rmmu_info cannot be written,
 	 -EINVAL if no useful information can be returned
 
@@ -3456,14 +3796,52 @@ containing supported radix tree geometries, and (b) a list that maps
 page sizes to put in the "AP" (actual page size) field for the tlbie
 (TLB invalidate entry) instruction.
 
-struct kvm_ppc_rmmu_info {
+::
+
+  struct kvm_ppc_rmmu_info {
+	struct kvm_ppc_radix_geom {
+		__u8	page_shift;
+		__u8	level_bits[4];
+		__u8	pad[3];
+	}	geometries[8];
+	__u32	ap_encodings[8];
+  };
+
+The geometries[] field gives up to 8 supported geometries for the
+radix page table, in terms of the log base 2 of the smallest page
+size, and the number of bits indexed at each level of the tree, from
+the PTE level up to the PGD level in that order.  Any unused entries
+will have 0 in the page_shift field.
+
+The ap_encodings gives the supported page sizes and their AP field
+encodings, encoded with the AP value in the top 3 bits and the log
+base 2 of the page size in the bottom 6 bits.
+
+4.102 KVM_PPC_RESIZE_HPT_PREPARE
+--------------------------------
+
+:Capability: KVM_CAP_SPAPR_RESIZE_HPT
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: struct kvm_ppc_resize_hpt (in)
+:Returns: 0 on successful completion,
+	 >0 if a new HPT is being prepared, the value is an estimated
+         number of milliseconds until preparation is complete,
+         -EFAULT if struct kvm_reinject_control cannot be read,
+	 -EINVAL if the supplied shift or flags are invalid,
+	 -ENOMEM if unable to allocate the new HPT,
+	 -ENOSPC if there was a hash collision
+
+::
+
+  struct kvm_ppc_rmmu_info {
 	struct kvm_ppc_radix_geom {
 		__u8	page_shift;
 		__u8	level_bits[4];
 		__u8	pad[3];
 	}	geometries[8];
 	__u32	ap_encodings[8];
-};
+  };
 
 The geometries[] field gives up to 8 supported geometries for the
 radix page table, in terms of the log base 2 of the smallest page
@@ -3476,19 +3854,18 @@ encodings, encoded with the AP value in the top 3 bits and the log
 base 2 of the page size in the bottom 6 bits.
 
 4.102 KVM_PPC_RESIZE_HPT_PREPARE
+--------------------------------
 
-Capability: KVM_CAP_SPAPR_RESIZE_HPT
-Architectures: powerpc
-Type: vm ioctl
-Parameters: struct kvm_ppc_resize_hpt (in)
-Returns: 0 on successful completion,
+:Capability: KVM_CAP_SPAPR_RESIZE_HPT
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: struct kvm_ppc_resize_hpt (in)
+:Returns: 0 on successful completion,
 	 >0 if a new HPT is being prepared, the value is an estimated
-             number of milliseconds until preparation is complete
+         number of milliseconds until preparation is complete,
          -EFAULT if struct kvm_reinject_control cannot be read,
-	 -EINVAL if the supplied shift or flags are invalid
-	 -ENOMEM if unable to allocate the new HPT
-	 -ENOSPC if there was a hash collision when moving existing
-                  HPT entries to the new HPT
+	 -EINVAL if the supplied shift or flags are invalid,when moving existing
+         HPT entries to the new HPT,
 	 -EIO on other error conditions
 
 Used to implement the PAPR extension for runtime resizing of a guest's
@@ -3506,6 +3883,7 @@ requested in the parameters, discards the existing pending HPT and
 creates a new one as above.
 
 If called when there is a pending HPT of the size requested, will:
+
   * If preparation of the pending HPT is already complete, return 0
   * If preparation of the pending HPT has failed, return an error
     code, then discard the pending HPT.
@@ -3522,26 +3900,29 @@ Normally this will be called repeatedly with the same parameters until
 it returns <= 0.  The first call will initiate preparation, subsequent
 ones will monitor preparation until it completes or fails.
 
-struct kvm_ppc_resize_hpt {
+::
+
+  struct kvm_ppc_resize_hpt {
 	__u64 flags;
 	__u32 shift;
 	__u32 pad;
-};
+  };
 
 4.103 KVM_PPC_RESIZE_HPT_COMMIT
+-------------------------------
 
-Capability: KVM_CAP_SPAPR_RESIZE_HPT
-Architectures: powerpc
-Type: vm ioctl
-Parameters: struct kvm_ppc_resize_hpt (in)
-Returns: 0 on successful completion,
+:Capability: KVM_CAP_SPAPR_RESIZE_HPT
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: struct kvm_ppc_resize_hpt (in)
+:Returns: 0 on successful completion,
          -EFAULT if struct kvm_reinject_control cannot be read,
-	 -EINVAL if the supplied shift or flags are invalid
+	 -EINVAL if the supplied shift or flags are invalid,
 	 -ENXIO is there is no pending HPT, or the pending HPT doesn't
-                 have the requested size
-	 -EBUSY if the pending HPT is not fully prepared
+         have the requested size,
+	 -EBUSY if the pending HPT is not fully prepared,
 	 -ENOSPC if there was a hash collision when moving existing
-                  HPT entries to the new HPT
+         HPT entries to the new HPT,
 	 -EIO on other error conditions
 
 Used to implement the PAPR extension for runtime resizing of a guest's
@@ -3564,31 +3945,35 @@ HPT and the previous HPT will be discarded.
 
 On failure, the guest will still be operating on its previous HPT.
 
-struct kvm_ppc_resize_hpt {
+::
+
+  struct kvm_ppc_resize_hpt {
 	__u64 flags;
 	__u32 shift;
 	__u32 pad;
-};
+  };
 
 4.104 KVM_X86_GET_MCE_CAP_SUPPORTED
+-----------------------------------
 
-Capability: KVM_CAP_MCE
-Architectures: x86
-Type: system ioctl
-Parameters: u64 mce_cap (out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_MCE
+:Architectures: x86
+:Type: system ioctl
+:Parameters: u64 mce_cap (out)
+:Returns: 0 on success, -1 on error
 
 Returns supported MCE capabilities. The u64 mce_cap parameter
 has the same format as the MSR_IA32_MCG_CAP register. Supported
 capabilities will have the corresponding bits set.
 
 4.105 KVM_X86_SETUP_MCE
+-----------------------
 
-Capability: KVM_CAP_MCE
-Architectures: x86
-Type: vcpu ioctl
-Parameters: u64 mcg_cap (in)
-Returns: 0 on success,
+:Capability: KVM_CAP_MCE
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: u64 mcg_cap (in)
+:Returns: 0 on success,
          -EFAULT if u64 mcg_cap cannot be read,
          -EINVAL if the requested number of banks is invalid,
          -EINVAL if requested MCE capability is not supported.
@@ -3601,20 +3986,21 @@ checking for KVM_CAP_MCE. The supported capabilities can be
 retrieved with KVM_X86_GET_MCE_CAP_SUPPORTED.
 
 4.106 KVM_X86_SET_MCE
+---------------------
 
-Capability: KVM_CAP_MCE
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_x86_mce (in)
-Returns: 0 on success,
+:Capability: KVM_CAP_MCE
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_x86_mce (in)
+:Returns: 0 on success,
          -EFAULT if struct kvm_x86_mce cannot be read,
          -EINVAL if the bank number is invalid,
          -EINVAL if VAL bit is not set in status field.
 
 Inject a machine check error (MCE) into the guest. The input
-parameter is:
+parameter is::
 
-struct kvm_x86_mce {
+  struct kvm_x86_mce {
 	__u64 status;
 	__u64 addr;
 	__u64 misc;
@@ -3622,7 +4008,7 @@ struct kvm_x86_mce {
 	__u8 bank;
 	__u8 pad1[7];
 	__u64 pad2[3];
-};
+  };
 
 If the MCE being reported is an uncorrected error, KVM will
 inject it as an MCE exception into the guest. If the guest
@@ -3634,15 +4020,17 @@ store it in the corresponding bank (provided this bank is
 not holding a previously reported uncorrected error).
 
 4.107 KVM_S390_GET_CMMA_BITS
+----------------------------
 
-Capability: KVM_CAP_S390_CMMA_MIGRATION
-Architectures: s390
-Type: vm ioctl
-Parameters: struct kvm_s390_cmma_log (in, out)
-Returns: 0 on success, a negative value on error
+:Capability: KVM_CAP_S390_CMMA_MIGRATION
+:Architectures: s390
+:Type: vm ioctl
+:Parameters: struct kvm_s390_cmma_log (in, out)
+:Returns: 0 on success, a negative value on error
 
 This ioctl is used to get the values of the CMMA bits on the s390
 architecture. It is meant to be used in two scenarios:
+
 - During live migration to save the CMMA values. Live migration needs
   to be enabled via the KVM_REQ_START_MIGRATION VM property.
 - To non-destructively peek at the CMMA values, with the flag
@@ -3652,9 +4040,12 @@ The ioctl takes parameters via the kvm_s390_cmma_log struct. The desired
 values are written to a buffer whose location is indicated via the "values"
 member in the kvm_s390_cmma_log struct.  The values in the input struct are
 also updated as needed.
+
 Each CMMA value takes up one byte.
 
-struct kvm_s390_cmma_log {
+::
+
+  struct kvm_s390_cmma_log {
 	__u64 start_gfn;
 	__u32 count;
 	__u32 flags;
@@ -3663,7 +4054,7 @@ struct kvm_s390_cmma_log {
 		__u64 mask;
 	};
 	__u64 values;
-};
+  };
 
 start_gfn is the number of the first guest frame whose CMMA values are
 to be retrieved,
@@ -3724,12 +4115,13 @@ KVM_S390_CMMA_PEEK is not set but migration mode was not enabled, with
 present for the addresses (e.g. when using hugepages).
 
 4.108 KVM_S390_SET_CMMA_BITS
+----------------------------
 
-Capability: KVM_CAP_S390_CMMA_MIGRATION
-Architectures: s390
-Type: vm ioctl
-Parameters: struct kvm_s390_cmma_log (in)
-Returns: 0 on success, a negative value on error
+:Capability: KVM_CAP_S390_CMMA_MIGRATION
+:Architectures: s390
+:Type: vm ioctl
+:Parameters: struct kvm_s390_cmma_log (in)
+:Returns: 0 on success, a negative value on error
 
 This ioctl is used to set the values of the CMMA bits on the s390
 architecture. It is meant to be used during live migration to restore
@@ -3737,16 +4129,18 @@ the CMMA values, but there are no restrictions on its use.
 The ioctl takes parameters via the kvm_s390_cmma_values struct.
 Each CMMA value takes up one byte.
 
-struct kvm_s390_cmma_log {
+::
+
+  struct kvm_s390_cmma_log {
 	__u64 start_gfn;
 	__u32 count;
 	__u32 flags;
 	union {
 		__u64 remaining;
 		__u64 mask;
-	};
+ 	};
 	__u64 values;
-};
+  };
 
 start_gfn indicates the starting guest frame number,
 
@@ -3769,26 +4163,27 @@ or if no page table is present for the addresses (e.g. when using
 hugepages).
 
 4.109 KVM_PPC_GET_CPU_CHAR
+--------------------------
 
-Capability: KVM_CAP_PPC_GET_CPU_CHAR
-Architectures: powerpc
-Type: vm ioctl
-Parameters: struct kvm_ppc_cpu_char (out)
-Returns: 0 on successful completion
+:Capability: KVM_CAP_PPC_GET_CPU_CHAR
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: struct kvm_ppc_cpu_char (out)
+:Returns: 0 on successful completion,
 	 -EFAULT if struct kvm_ppc_cpu_char cannot be written
 
 This ioctl gives userspace information about certain characteristics
 of the CPU relating to speculative execution of instructions and
 possible information leakage resulting from speculative execution (see
 CVE-2017-5715, CVE-2017-5753 and CVE-2017-5754).  The information is
-returned in struct kvm_ppc_cpu_char, which looks like this:
+returned in struct kvm_ppc_cpu_char, which looks like this::
 
-struct kvm_ppc_cpu_char {
+  struct kvm_ppc_cpu_char {
 	__u64	character;		/* characteristics of the CPU */
 	__u64	behaviour;		/* recommended software behaviour */
 	__u64	character_mask;		/* valid bits in character */
 	__u64	behaviour_mask;		/* valid bits in behaviour */
-};
+  };
 
 For extensibility, the character_mask and behaviour_mask fields
 indicate which bits of character and behaviour have been filled in by
@@ -3815,12 +4210,13 @@ These fields use the same bit definitions as the new
 H_GET_CPU_CHARACTERISTICS hypercall.
 
 4.110 KVM_MEMORY_ENCRYPT_OP
+---------------------------
 
-Capability: basic
-Architectures: x86
-Type: system
-Parameters: an opaque platform specific structure (in/out)
-Returns: 0 on success; -1 on error
+:Capability: basic
+:Architectures: x86
+:Type: system
+:Parameters: an opaque platform specific structure (in/out)
+:Returns: 0 on success; -1 on error
 
 If the platform supports creating encrypted VMs then this ioctl can be used
 for issuing platform-specific memory encryption commands to manage those
@@ -3831,12 +4227,13 @@ Currently, this ioctl is used for issuing Secure Encrypted Virtualization
 Documentation/virt/kvm/amd-memory-encryption.rst.
 
 4.111 KVM_MEMORY_ENCRYPT_REG_REGION
+-----------------------------------
 
-Capability: basic
-Architectures: x86
-Type: system
-Parameters: struct kvm_enc_region (in)
-Returns: 0 on success; -1 on error
+:Capability: basic
+:Architectures: x86
+:Type: system
+:Parameters: struct kvm_enc_region (in)
+:Returns: 0 on success; -1 on error
 
 This ioctl can be used to register a guest memory region which may
 contain encrypted data (e.g. guest RAM, SMRAM etc).
@@ -3854,60 +4251,71 @@ swap or migrate (move) ciphertext pages. Hence, for now we pin the guest
 memory region registered with the ioctl.
 
 4.112 KVM_MEMORY_ENCRYPT_UNREG_REGION
+-------------------------------------
 
-Capability: basic
-Architectures: x86
-Type: system
-Parameters: struct kvm_enc_region (in)
-Returns: 0 on success; -1 on error
+:Capability: basic
+:Architectures: x86
+:Type: system
+:Parameters: struct kvm_enc_region (in)
+:Returns: 0 on success; -1 on error
 
 This ioctl can be used to unregister the guest memory region registered
 with KVM_MEMORY_ENCRYPT_REG_REGION ioctl above.
 
 4.113 KVM_HYPERV_EVENTFD
+------------------------
 
-Capability: KVM_CAP_HYPERV_EVENTFD
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_hyperv_eventfd (in)
+:Capability: KVM_CAP_HYPERV_EVENTFD
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_hyperv_eventfd (in)
 
 This ioctl (un)registers an eventfd to receive notifications from the guest on
 the specified Hyper-V connection id through the SIGNAL_EVENT hypercall, without
 causing a user exit.  SIGNAL_EVENT hypercall with non-zero event flag number
 (bits 24-31) still triggers a KVM_EXIT_HYPERV_HCALL user exit.
 
-struct kvm_hyperv_eventfd {
+::
+
+  struct kvm_hyperv_eventfd {
 	__u32 conn_id;
 	__s32 fd;
 	__u32 flags;
 	__u32 padding[3];
-};
+  };
 
-The conn_id field should fit within 24 bits:
+The conn_id field should fit within 24 bits::
 
-#define KVM_HYPERV_CONN_ID_MASK		0x00ffffff
+  #define KVM_HYPERV_CONN_ID_MASK		0x00ffffff
 
-The acceptable values for the flags field are:
+The acceptable values for the flags field are::
 
-#define KVM_HYPERV_EVENTFD_DEASSIGN	(1 << 0)
+  #define KVM_HYPERV_EVENTFD_DEASSIGN	(1 << 0)
 
-Returns: 0 on success,
-	-EINVAL if conn_id or flags is outside the allowed range
-	-ENOENT on deassign if the conn_id isn't registered
-	-EEXIST on assign if the conn_id is already registered
+:Returns: 0 on success,
+ 	  -EINVAL if conn_id or flags is outside the allowed range,
+	  -ENOENT on deassign if the conn_id isn't registered,
+	  -EEXIST on assign if the conn_id is already registered
 
 4.114 KVM_GET_NESTED_STATE
+--------------------------
+
+:Capability: KVM_CAP_NESTED_STATE
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_nested_state (in/out)
+:Returns: 0 on success, -1 on error
 
-Capability: KVM_CAP_NESTED_STATE
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_nested_state (in/out)
-Returns: 0 on success, -1 on error
 Errors:
-  E2BIG:     the total state size exceeds the value of 'size' specified by
+
+  =====      =============================================================
+  E2BIG      the total state size exceeds the value of 'size' specified by
              the user; the size required will be written into size.
+  =====      =============================================================
 
-struct kvm_nested_state {
+::
+
+  struct kvm_nested_state {
 	__u16 flags;
 	__u16 format;
 	__u32 size;
@@ -3924,33 +4332,33 @@ struct kvm_nested_state {
 		struct kvm_vmx_nested_state_data vmx[0];
 		struct kvm_svm_nested_state_data svm[0];
 	} data;
-};
+  };
 
-#define KVM_STATE_NESTED_GUEST_MODE	0x00000001
-#define KVM_STATE_NESTED_RUN_PENDING	0x00000002
-#define KVM_STATE_NESTED_EVMCS		0x00000004
+  #define KVM_STATE_NESTED_GUEST_MODE		0x00000001
+  #define KVM_STATE_NESTED_RUN_PENDING		0x00000002
+  #define KVM_STATE_NESTED_EVMCS		0x00000004
 
-#define KVM_STATE_NESTED_FORMAT_VMX		0
-#define KVM_STATE_NESTED_FORMAT_SVM		1
+  #define KVM_STATE_NESTED_FORMAT_VMX		0
+  #define KVM_STATE_NESTED_FORMAT_SVM		1
 
-#define KVM_STATE_NESTED_VMX_VMCS_SIZE		0x1000
+  #define KVM_STATE_NESTED_VMX_VMCS_SIZE	0x1000
 
-#define KVM_STATE_NESTED_VMX_SMM_GUEST_MODE	0x00000001
-#define KVM_STATE_NESTED_VMX_SMM_VMXON		0x00000002
+  #define KVM_STATE_NESTED_VMX_SMM_GUEST_MODE	0x00000001
+  #define KVM_STATE_NESTED_VMX_SMM_VMXON	0x00000002
 
-struct kvm_vmx_nested_state_hdr {
+  struct kvm_vmx_nested_state_hdr {
 	__u64 vmxon_pa;
 	__u64 vmcs12_pa;
 
 	struct {
 		__u16 flags;
 	} smm;
-};
+  };
 
-struct kvm_vmx_nested_state_data {
+  struct kvm_vmx_nested_state_data {
 	__u8 vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
 	__u8 shadow_vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
-};
+  };
 
 This ioctl copies the vcpu's nested virtualization state from the kernel to
 userspace.
@@ -3959,24 +4367,26 @@ The maximum size of the state can be retrieved by passing KVM_CAP_NESTED_STATE
 to the KVM_CHECK_EXTENSION ioctl().
 
 4.115 KVM_SET_NESTED_STATE
+--------------------------
 
-Capability: KVM_CAP_NESTED_STATE
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_nested_state (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_NESTED_STATE
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_nested_state (in)
+:Returns: 0 on success, -1 on error
 
 This copies the vcpu's kvm_nested_state struct from userspace to the kernel.
 For the definition of struct kvm_nested_state, see KVM_GET_NESTED_STATE.
 
 4.116 KVM_(UN)REGISTER_COALESCED_MMIO
+-------------------------------------
 
-Capability: KVM_CAP_COALESCED_MMIO (for coalesced mmio)
-	    KVM_CAP_COALESCED_PIO (for coalesced pio)
-Architectures: all
-Type: vm ioctl
-Parameters: struct kvm_coalesced_mmio_zone
-Returns: 0 on success, < 0 on error
+:Capability: KVM_CAP_COALESCED_MMIO (for coalesced mmio)
+	     KVM_CAP_COALESCED_PIO (for coalesced pio)
+:Architectures: all
+:Type: vm ioctl
+:Parameters: struct kvm_coalesced_mmio_zone
+:Returns: 0 on success, < 0 on error
 
 Coalesced I/O is a performance optimization that defers hardware
 register write emulation so that userspace exits are avoided.  It is
@@ -3998,15 +4408,18 @@ between coalesced mmio and pio except that coalesced pio records accesses
 to I/O ports.
 
 4.117 KVM_CLEAR_DIRTY_LOG (vm ioctl)
+------------------------------------
 
-Capability: KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2
-Architectures: x86, arm, arm64, mips
-Type: vm ioctl
-Parameters: struct kvm_dirty_log (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2
+:Architectures: x86, arm, arm64, mips
+:Type: vm ioctl
+:Parameters: struct kvm_dirty_log (in)
+:Returns: 0 on success, -1 on error
 
-/* for KVM_CLEAR_DIRTY_LOG */
-struct kvm_clear_dirty_log {
+::
+
+  /* for KVM_CLEAR_DIRTY_LOG */
+  struct kvm_clear_dirty_log {
 	__u32 slot;
 	__u32 num_pages;
 	__u64 first_page;
@@ -4014,7 +4427,7 @@ struct kvm_clear_dirty_log {
 		void __user *dirty_bitmap; /* one bit per page */
 		__u64 padding;
 	};
-};
+  };
 
 The ioctl clears the dirty status of pages in a memory slot, according to
 the bitmap that is passed in struct kvm_clear_dirty_log's dirty_bitmap
@@ -4038,20 +4451,23 @@ However, it can always be used as long as KVM_CHECK_EXTENSION confirms
 that KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is present.
 
 4.118 KVM_GET_SUPPORTED_HV_CPUID
+--------------------------------
 
-Capability: KVM_CAP_HYPERV_CPUID
-Architectures: x86
-Type: vcpu ioctl
-Parameters: struct kvm_cpuid2 (in/out)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_HYPERV_CPUID
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_cpuid2 (in/out)
+:Returns: 0 on success, -1 on error
 
-struct kvm_cpuid2 {
+::
+
+  struct kvm_cpuid2 {
 	__u32 nent;
 	__u32 padding;
 	struct kvm_cpuid_entry2 entries[0];
-};
+  };
 
-struct kvm_cpuid_entry2 {
+  struct kvm_cpuid_entry2 {
 	__u32 function;
 	__u32 index;
 	__u32 flags;
@@ -4060,7 +4476,7 @@ struct kvm_cpuid_entry2 {
 	__u32 ecx;
 	__u32 edx;
 	__u32 padding[3];
-};
+  };
 
 This ioctl returns x86 cpuid features leaves related to Hyper-V emulation in
 KVM.  Userspace can use the information returned by this ioctl to construct
@@ -4073,13 +4489,13 @@ KVM_GET_SUPPORTED_CPUID ioctl because some of them intersect with KVM feature
 leaves (0x40000000, 0x40000001).
 
 Currently, the following list of CPUID leaves are returned:
- HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS
- HYPERV_CPUID_INTERFACE
- HYPERV_CPUID_VERSION
- HYPERV_CPUID_FEATURES
- HYPERV_CPUID_ENLIGHTMENT_INFO
- HYPERV_CPUID_IMPLEMENT_LIMITS
- HYPERV_CPUID_NESTED_FEATURES
+ - HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS
+ - HYPERV_CPUID_INTERFACE
+ - HYPERV_CPUID_VERSION
+ - HYPERV_CPUID_FEATURES
+ - HYPERV_CPUID_ENLIGHTMENT_INFO
+ - HYPERV_CPUID_IMPLEMENT_LIMITS
+ - HYPERV_CPUID_NESTED_FEATURES
 
 HYPERV_CPUID_NESTED_FEATURES leaf is only exposed when Enlightened VMCS was
 enabled on the corresponding vCPU (KVM_CAP_HYPERV_ENLIGHTENED_VMCS).
@@ -4095,17 +4511,25 @@ number of valid entries in the 'entries' array, which is then filled.
 userspace should not expect to get any particular value there.
 
 4.119 KVM_ARM_VCPU_FINALIZE
+---------------------------
+
+:Architectures: arm, arm64
+:Type: vcpu ioctl
+:Parameters: int feature (in)
+:Returns: 0 on success, -1 on error
 
-Architectures: arm, arm64
-Type: vcpu ioctl
-Parameters: int feature (in)
-Returns: 0 on success, -1 on error
 Errors:
-  EPERM:     feature not enabled, needs configuration, or already finalized
-  EINVAL:    feature unknown or not present
+
+  ======     ==============================================================
+  EPERM      feature not enabled, needs configuration, or already finalized
+  EINVAL     feature unknown or not present
+  ======     ==============================================================
 
 Recognised values for feature:
+
+  =====      ===========================================
   arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
+  =====      ===========================================
 
 Finalizes the configuration of the specified vcpu feature.
 
@@ -4129,21 +4553,24 @@ See KVM_ARM_VCPU_INIT for details of vcpu features that require finalization
 using this ioctl.
 
 4.120 KVM_SET_PMU_EVENT_FILTER
+------------------------------
 
-Capability: KVM_CAP_PMU_EVENT_FILTER
-Architectures: x86
-Type: vm ioctl
-Parameters: struct kvm_pmu_event_filter (in)
-Returns: 0 on success, -1 on error
+:Capability: KVM_CAP_PMU_EVENT_FILTER
+:Architectures: x86
+:Type: vm ioctl
+:Parameters: struct kvm_pmu_event_filter (in)
+:Returns: 0 on success, -1 on error
 
-struct kvm_pmu_event_filter {
+::
+
+  struct kvm_pmu_event_filter {
 	__u32 action;
 	__u32 nevents;
 	__u32 fixed_counter_bitmap;
 	__u32 flags;
 	__u32 pad[4];
 	__u64 events[0];
-};
+  };
 
 This ioctl restricts the set of PMU events that the guest can program.
 The argument holds a list of events which will be allowed or denied.
@@ -4154,20 +4581,26 @@ counters are controlled by the fixed_counter_bitmap.
 
 No flags are defined yet, the field must be zero.
 
-Valid values for 'action':
-#define KVM_PMU_EVENT_ALLOW 0
-#define KVM_PMU_EVENT_DENY 1
+Valid values for 'action'::
+
+  #define KVM_PMU_EVENT_ALLOW 0
+  #define KVM_PMU_EVENT_DENY 1
 
 4.121 KVM_PPC_SVM_OFF
+---------------------
+
+:Capability: basic
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: none
+:Returns: 0 on successful completion,
 
-Capability: basic
-Architectures: powerpc
-Type: vm ioctl
-Parameters: none
-Returns: 0 on successful completion,
 Errors:
-  EINVAL:    if ultravisor failed to terminate the secure guest
-  ENOMEM:    if hypervisor failed to allocate new radix page tables for guest
+
+  ======     ================================================================
+  EINVAL     if ultravisor failed to terminate the secure guest
+  ENOMEM     if hypervisor failed to allocate new radix page tables for guest
+  ======     ================================================================
 
 This ioctl is used to turn off the secure mode of the guest or transition
 the guest from secure mode to normal mode. This is invoked when the guest
@@ -4214,7 +4647,7 @@ into ESA mode. This reset is a superset of the initial reset.
 
 
 5. The kvm_run structure
-------------------------
+========================
 
 Application code obtains a pointer to the kvm_run structure by
 mmap()ing a vcpu fd.  From that point, application code can control
@@ -4222,13 +4655,17 @@ execution by changing fields in kvm_run prior to calling the KVM_RUN
 ioctl, and obtain information about the reason KVM_RUN returned by
 looking up structure members.
 
-struct kvm_run {
+::
+
+  struct kvm_run {
 	/* in */
 	__u8 request_interrupt_window;
 
 Request that KVM_RUN return when it becomes possible to inject external
 interrupts into the guest.  Useful in conjunction with KVM_INTERRUPT.
 
+::
+
 	__u8 immediate_exit;
 
 This field is polled once when KVM_RUN starts; if non-zero, KVM_RUN
@@ -4240,6 +4677,8 @@ a signal handler that sets run->immediate_exit to a non-zero value.
 
 This field is ignored if KVM_CAP_IMMEDIATE_EXIT is not available.
 
+::
+
 	__u8 padding1[6];
 
 	/* out */
@@ -4249,16 +4688,22 @@ When KVM_RUN has returned successfully (return value 0), this informs
 application code why KVM_RUN has returned.  Allowable values for this
 field are detailed below.
 
+::
+
 	__u8 ready_for_interrupt_injection;
 
 If request_interrupt_window has been specified, this field indicates
 an interrupt can be injected now with KVM_INTERRUPT.
 
+::
+
 	__u8 if_flag;
 
 The value of the current interrupt flag.  Only valid if in-kernel
 local APIC is not used.
 
+::
+
 	__u16 flags;
 
 More architecture-specific flags detailing state of the VCPU that may
@@ -4266,17 +4711,23 @@ affect the device's behavior.  The only currently defined flag is
 KVM_RUN_X86_SMM, which is valid on x86 machines and is set if the
 VCPU is in system management mode.
 
+::
+
 	/* in (pre_kvm_run), out (post_kvm_run) */
 	__u64 cr8;
 
 The value of the cr8 register.  Only valid if in-kernel local APIC is
 not used.  Both input and output.
 
+::
+
 	__u64 apic_base;
 
 The value of the APIC BASE msr.  Only valid if in-kernel local
 APIC is not used.  Both input and output.
 
+::
+
 	union {
 		/* KVM_EXIT_UNKNOWN */
 		struct {
@@ -4287,6 +4738,8 @@ If exit_reason is KVM_EXIT_UNKNOWN, the vcpu has exited due to unknown
 reasons.  Further architecture-specific information is available in
 hardware_exit_reason.
 
+::
+
 		/* KVM_EXIT_FAIL_ENTRY */
 		struct {
 			__u64 hardware_entry_failure_reason;
@@ -4296,6 +4749,8 @@ If exit_reason is KVM_EXIT_FAIL_ENTRY, the vcpu could not be run due
 to unknown reasons.  Further architecture-specific information is
 available in hardware_entry_failure_reason.
 
+::
+
 		/* KVM_EXIT_EXCEPTION */
 		struct {
 			__u32 exception;
@@ -4304,10 +4759,12 @@ available in hardware_entry_failure_reason.
 
 Unused.
 
+::
+
 		/* KVM_EXIT_IO */
 		struct {
-#define KVM_EXIT_IO_IN  0
-#define KVM_EXIT_IO_OUT 1
+  #define KVM_EXIT_IO_IN  0
+  #define KVM_EXIT_IO_OUT 1
 			__u8 direction;
 			__u8 size; /* bytes */
 			__u16 port;
@@ -4321,6 +4778,8 @@ data_offset describes where the data is located (KVM_EXIT_IO_OUT) or
 where kvm expects application code to place the data for the next
 KVM_RUN invocation (KVM_EXIT_IO_IN).  Data format is a packed array.
 
+::
+
 		/* KVM_EXIT_DEBUG */
 		struct {
 			struct kvm_debug_exit_arch arch;
@@ -4329,6 +4788,8 @@ KVM_RUN invocation (KVM_EXIT_IO_IN).  Data format is a packed array.
 If the exit_reason is KVM_EXIT_DEBUG, then a vcpu is processing a debug event
 for which architecture specific information is returned.
 
+::
+
 		/* KVM_EXIT_MMIO */
 		struct {
 			__u64 phys_addr;
@@ -4346,14 +4807,19 @@ The 'data' member contains, in its first 'len' bytes, the value as it would
 appear if the VCPU performed a load or store of the appropriate width directly
 to the byte array.
 
-NOTE: For KVM_EXIT_IO, KVM_EXIT_MMIO, KVM_EXIT_OSI, KVM_EXIT_PAPR and
+.. note::
+
+      For KVM_EXIT_IO, KVM_EXIT_MMIO, KVM_EXIT_OSI, KVM_EXIT_PAPR and
       KVM_EXIT_EPR the corresponding
+
 operations are complete (and guest state is consistent) only after userspace
 has re-entered the kernel with KVM_RUN.  The kernel side will first finish
 incomplete operations and then check for pending signals.  Userspace
 can re-enter the guest with an unmasked signal pending to complete
 pending operations.
 
+::
+
 		/* KVM_EXIT_HYPERCALL */
 		struct {
 			__u64 nr;
@@ -4365,7 +4831,10 @@ pending operations.
 
 Unused.  This was once used for 'hypercall to userspace'.  To implement
 such functionality, use KVM_EXIT_IO (x86) or KVM_EXIT_MMIO (all except s390).
-Note KVM_EXIT_IO is significantly faster than KVM_EXIT_MMIO.
+
+.. note:: KVM_EXIT_IO is significantly faster than KVM_EXIT_MMIO.
+
+::
 
 		/* KVM_EXIT_TPR_ACCESS */
 		struct {
@@ -4376,6 +4845,8 @@ Note KVM_EXIT_IO is significantly faster than KVM_EXIT_MMIO.
 
 To be documented (KVM_TPR_ACCESS_REPORTING).
 
+::
+
 		/* KVM_EXIT_S390_SIEIC */
 		struct {
 			__u8 icptcode;
@@ -4387,16 +4858,20 @@ To be documented (KVM_TPR_ACCESS_REPORTING).
 
 s390 specific.
 
+::
+
 		/* KVM_EXIT_S390_RESET */
-#define KVM_S390_RESET_POR       1
-#define KVM_S390_RESET_CLEAR     2
-#define KVM_S390_RESET_SUBSYSTEM 4
-#define KVM_S390_RESET_CPU_INIT  8
-#define KVM_S390_RESET_IPL       16
+  #define KVM_S390_RESET_POR       1
+  #define KVM_S390_RESET_CLEAR     2
+  #define KVM_S390_RESET_SUBSYSTEM 4
+  #define KVM_S390_RESET_CPU_INIT  8
+  #define KVM_S390_RESET_IPL       16
 		__u64 s390_reset_flags;
 
 s390 specific.
 
+::
+
 		/* KVM_EXIT_S390_UCONTROL */
 		struct {
 			__u64 trans_exc_code;
@@ -4411,6 +4886,8 @@ in the cpu's lowcore are presented here as defined by the z Architecture
 Principles of Operation Book in the Chapter for Dynamic Address Translation
 (DAT)
 
+::
+
 		/* KVM_EXIT_DCR */
 		struct {
 			__u32 dcrn;
@@ -4420,6 +4897,8 @@ Principles of Operation Book in the Chapter for Dynamic Address Translation
 
 Deprecated - was used for 440 KVM.
 
+::
+
 		/* KVM_EXIT_OSI */
 		struct {
 			__u64 gprs[32];
@@ -4433,6 +4912,8 @@ Userspace can now handle the hypercall and when it's done modify the gprs as
 necessary. Upon guest entry all guest GPRs will then be replaced by the values
 in this struct.
 
+::
+
 		/* KVM_EXIT_PAPR_HCALL */
 		struct {
 			__u64 nr;
@@ -4450,6 +4931,8 @@ The possible hypercalls are defined in the Power Architecture Platform
 Requirements (PAPR) document available from www.power.org (free
 developer registration required to access it).
 
+::
+
 		/* KVM_EXIT_S390_TSCH */
 		struct {
 			__u16 subchannel_id;
@@ -4466,6 +4949,8 @@ interrupt for the target subchannel has been dequeued and subchannel_id,
 subchannel_nr, io_int_parm and io_int_word contain the parameters for that
 interrupt. ipb is needed for instruction parameter decoding.
 
+::
+
 		/* KVM_EXIT_EPR */
 		struct {
 			__u32 epr;
@@ -4485,11 +4970,13 @@ It gets triggered whenever both KVM_CAP_PPC_EPR are enabled and an
 external interrupt has just been delivered into the guest. User space
 should put the acknowledged interrupt vector into the 'epr' field.
 
+::
+
 		/* KVM_EXIT_SYSTEM_EVENT */
 		struct {
-#define KVM_SYSTEM_EVENT_SHUTDOWN       1
-#define KVM_SYSTEM_EVENT_RESET          2
-#define KVM_SYSTEM_EVENT_CRASH          3
+  #define KVM_SYSTEM_EVENT_SHUTDOWN       1
+  #define KVM_SYSTEM_EVENT_RESET          2
+  #define KVM_SYSTEM_EVENT_CRASH          3
 			__u32 type;
 			__u64 flags;
 		} system_event;
@@ -4502,18 +4989,21 @@ the system-level event type. The 'flags' field describes architecture
 specific flags for the system-level event.
 
 Valid values for 'type' are:
-  KVM_SYSTEM_EVENT_SHUTDOWN -- the guest has requested a shutdown of the
+
+ - KVM_SYSTEM_EVENT_SHUTDOWN -- the guest has requested a shutdown of the
    VM. Userspace is not obliged to honour this, and if it does honour
    this does not need to destroy the VM synchronously (ie it may call
    KVM_RUN again before shutdown finally occurs).
-  KVM_SYSTEM_EVENT_RESET -- the guest has requested a reset of the VM.
+ - KVM_SYSTEM_EVENT_RESET -- the guest has requested a reset of the VM.
    As with SHUTDOWN, userspace can choose to ignore the request, or
    to schedule the reset to occur in the future and may call KVM_RUN again.
-  KVM_SYSTEM_EVENT_CRASH -- the guest crash occurred and the guest
+ - KVM_SYSTEM_EVENT_CRASH -- the guest crash occurred and the guest
    has requested a crash condition maintenance. Userspace can choose
    to ignore the request, or to gather VM memory core dump and/or
    reset/shutdown of the VM.
 
+::
+
 		/* KVM_EXIT_IOAPIC_EOI */
 		struct {
 			__u8 vector;
@@ -4526,9 +5016,11 @@ the userspace IOAPIC should process the EOI and retrigger the interrupt if
 it is still asserted.  Vector is the LAPIC interrupt vector for which the
 EOI was received.
 
+::
+
 		struct kvm_hyperv_exit {
-#define KVM_EXIT_HYPERV_SYNIC          1
-#define KVM_EXIT_HYPERV_HCALL          2
+  #define KVM_EXIT_HYPERV_SYNIC          1
+  #define KVM_EXIT_HYPERV_HCALL          2
 			__u32 type;
 			union {
 				struct {
@@ -4546,14 +5038,20 @@ EOI was received.
 		};
 		/* KVM_EXIT_HYPERV */
                 struct kvm_hyperv_exit hyperv;
+
 Indicates that the VCPU exits into userspace to process some tasks
 related to Hyper-V emulation.
+
 Valid values for 'type' are:
-	KVM_EXIT_HYPERV_SYNIC -- synchronously notify user-space about
+
+	- KVM_EXIT_HYPERV_SYNIC -- synchronously notify user-space about
+
 Hyper-V SynIC state change. Notification is used to remap SynIC
 event/message pages and to enable/disable SynIC messages/events processing
 in userspace.
 
+::
+
 		/* KVM_EXIT_ARM_NISV */
 		struct {
 			__u64 esr_iss;
@@ -4587,6 +5085,8 @@ Note that KVM does not skip the faulting instruction as it does for
 KVM_EXIT_MMIO, but userspace has to emulate any change to the processing state
 if it decides to decode and emulate the instruction.
 
+::
+
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -4611,18 +5111,20 @@ avoid some system call overhead if userspace has to handle the exit.
 Userspace can query the validity of the structure by checking
 kvm_valid_regs for specific bits. These bits are architecture specific
 and usually define the validity of a groups of registers. (e.g. one bit
- for general purpose registers)
+for general purpose registers)
 
 Please note that the kernel is allowed to use the kvm_run structure as the
 primary storage for certain register types. Therefore, the kernel may use the
 values in kvm_run even if the corresponding bit in kvm_dirty_regs is not set.
 
-};
+::
+
+  };
 
 
 
 6. Capabilities that can be enabled on vCPUs
---------------------------------------------
+============================================
 
 There are certain capabilities that change the behavior of the virtual CPU or
 the virtual machine when enabled. To enable them, please see section 4.37.
@@ -4631,23 +5133,28 @@ the virtual machine is when enabling them.
 
 The following information is provided along with the description:
 
-  Architectures: which instruction set architectures provide this ioctl.
+  Architectures:
+      which instruction set architectures provide this ioctl.
       x86 includes both i386 and x86_64.
 
-  Target: whether this is a per-vcpu or per-vm capability.
+  Target:
+      whether this is a per-vcpu or per-vm capability.
 
-  Parameters: what parameters are accepted by the capability.
+  Parameters:
+      what parameters are accepted by the capability.
 
-  Returns: the return value.  General error numbers (EBADF, ENOMEM, EINVAL)
+  Returns:
+      the return value.  General error numbers (EBADF, ENOMEM, EINVAL)
       are not detailed, but errors with specific meanings are.
 
 
 6.1 KVM_CAP_PPC_OSI
+-------------------
 
-Architectures: ppc
-Target: vcpu
-Parameters: none
-Returns: 0 on success; -1 on error
+:Architectures: ppc
+:Target: vcpu
+:Parameters: none
+:Returns: 0 on success; -1 on error
 
 This capability enables interception of OSI hypercalls that otherwise would
 be treated as normal system calls to be injected into the guest. OSI hypercalls
@@ -4658,11 +5165,12 @@ When this capability is enabled, KVM_EXIT_OSI can occur.
 
 
 6.2 KVM_CAP_PPC_PAPR
+--------------------
 
-Architectures: ppc
-Target: vcpu
-Parameters: none
-Returns: 0 on success; -1 on error
+:Architectures: ppc
+:Target: vcpu
+:Parameters: none
+:Returns: 0 on success; -1 on error
 
 This capability enables interception of PAPR hypercalls. PAPR hypercalls are
 done using the hypercall instruction "sc 1".
@@ -4678,18 +5186,21 @@ When this capability is enabled, KVM_EXIT_PAPR_HCALL can occur.
 
 
 6.3 KVM_CAP_SW_TLB
+------------------
 
-Architectures: ppc
-Target: vcpu
-Parameters: args[0] is the address of a struct kvm_config_tlb
-Returns: 0 on success; -1 on error
+:Architectures: ppc
+:Target: vcpu
+:Parameters: args[0] is the address of a struct kvm_config_tlb
+:Returns: 0 on success; -1 on error
 
-struct kvm_config_tlb {
+::
+
+  struct kvm_config_tlb {
 	__u64 params;
 	__u64 array;
 	__u32 mmu_type;
 	__u32 array_len;
-};
+  };
 
 Configures the virtual CPU's TLB array, establishing a shared memory area
 between userspace and KVM.  The "params" and "array" fields are userspace
@@ -4708,6 +5219,7 @@ to tell KVM which entries have been changed, prior to calling KVM_RUN again
 on this vcpu.
 
 For mmu types KVM_MMU_FSL_BOOKE_NOHV and KVM_MMU_FSL_BOOKE_HV:
+
  - The "params" field is of type "struct kvm_book3e_206_tlb_params".
  - The "array" field points to an array of type "struct
    kvm_book3e_206_tlb_entry".
@@ -4721,11 +5233,12 @@ For mmu types KVM_MMU_FSL_BOOKE_NOHV and KVM_MMU_FSL_BOOKE_HV:
    hardware ignores this value for TLB0.
 
 6.4 KVM_CAP_S390_CSS_SUPPORT
+----------------------------
 
-Architectures: s390
-Target: vcpu
-Parameters: none
-Returns: 0 on success; -1 on error
+:Architectures: s390
+:Target: vcpu
+:Parameters: none
+:Returns: 0 on success; -1 on error
 
 This capability enables support for handling of channel I/O instructions.
 
@@ -4739,11 +5252,12 @@ Note that even though this capability is enabled per-vcpu, the complete
 virtual machine is affected.
 
 6.5 KVM_CAP_PPC_EPR
+-------------------
 
-Architectures: ppc
-Target: vcpu
-Parameters: args[0] defines whether the proxy facility is active
-Returns: 0 on success; -1 on error
+:Architectures: ppc
+:Target: vcpu
+:Parameters: args[0] defines whether the proxy facility is active
+:Returns: 0 on success; -1 on error
 
 This capability enables or disables the delivery of interrupts through the
 external proxy facility.
@@ -4757,62 +5271,70 @@ When disabled (args[0] == 0), behavior is as if this facility is unsupported.
 When this capability is enabled, KVM_EXIT_EPR can occur.
 
 6.6 KVM_CAP_IRQ_MPIC
+--------------------
 
-Architectures: ppc
-Parameters: args[0] is the MPIC device fd
-            args[1] is the MPIC CPU number for this vcpu
+:Architectures: ppc
+:Parameters: args[0] is the MPIC device fd;
+             args[1] is the MPIC CPU number for this vcpu
 
 This capability connects the vcpu to an in-kernel MPIC device.
 
 6.7 KVM_CAP_IRQ_XICS
+--------------------
 
-Architectures: ppc
-Target: vcpu
-Parameters: args[0] is the XICS device fd
-            args[1] is the XICS CPU number (server ID) for this vcpu
+:Architectures: ppc
+:Target: vcpu
+:Parameters: args[0] is the XICS device fd;
+             args[1] is the XICS CPU number (server ID) for this vcpu
 
 This capability connects the vcpu to an in-kernel XICS device.
 
 6.8 KVM_CAP_S390_IRQCHIP
+------------------------
 
-Architectures: s390
-Target: vm
-Parameters: none
+:Architectures: s390
+:Target: vm
+:Parameters: none
 
 This capability enables the in-kernel irqchip for s390. Please refer to
 "4.24 KVM_CREATE_IRQCHIP" for details.
 
 6.9 KVM_CAP_MIPS_FPU
+--------------------
 
-Architectures: mips
-Target: vcpu
-Parameters: args[0] is reserved for future use (should be 0).
+:Architectures: mips
+:Target: vcpu
+:Parameters: args[0] is reserved for future use (should be 0).
 
 This capability allows the use of the host Floating Point Unit by the guest. It
 allows the Config1.FP bit to be set to enable the FPU in the guest. Once this is
-done the KVM_REG_MIPS_FPR_* and KVM_REG_MIPS_FCR_* registers can be accessed
-(depending on the current guest FPU register mode), and the Status.FR,
+done the ``KVM_REG_MIPS_FPR_*`` and ``KVM_REG_MIPS_FCR_*`` registers can be
+accessed (depending on the current guest FPU register mode), and the Status.FR,
 Config5.FRE bits are accessible via the KVM API and also from the guest,
 depending on them being supported by the FPU.
 
 6.10 KVM_CAP_MIPS_MSA
+---------------------
 
-Architectures: mips
-Target: vcpu
-Parameters: args[0] is reserved for future use (should be 0).
+:Architectures: mips
+:Target: vcpu
+:Parameters: args[0] is reserved for future use (should be 0).
 
 This capability allows the use of the MIPS SIMD Architecture (MSA) by the guest.
 It allows the Config3.MSAP bit to be set to enable the use of MSA by the guest.
-Once this is done the KVM_REG_MIPS_VEC_* and KVM_REG_MIPS_MSA_* registers can be
-accessed, and the Config5.MSAEn bit is accessible via the KVM API and also from
-the guest.
+Once this is done the ``KVM_REG_MIPS_VEC_*`` and ``KVM_REG_MIPS_MSA_*``
+registers can be accessed, and the Config5.MSAEn bit is accessible via the
+KVM API and also from the guest.
 
 6.74 KVM_CAP_SYNC_REGS
-Architectures: s390, x86
-Target: s390: always enabled, x86: vcpu
-Parameters: none
-Returns: x86: KVM_CHECK_EXTENSION returns a bit-array indicating which register
-sets are supported (bitfields defined in arch/x86/include/uapi/asm/kvm.h).
+----------------------
+
+:Architectures: s390, x86
+:Target: s390: always enabled, x86: vcpu
+:Parameters: none
+:Returns: x86: KVM_CHECK_EXTENSION returns a bit-array indicating which register
+          sets are supported
+          (bitfields defined in arch/x86/include/uapi/asm/kvm.h).
 
 As described above in the kvm_sync_regs struct info in section 5 (kvm_run):
 KVM_CAP_SYNC_REGS "allow[s] userspace to access certain guest registers
@@ -4825,6 +5347,7 @@ userspace.
 For s390 specifics, please refer to the source code.
 
 For x86:
+
 - the register sets to be copied out to kvm_run are selectable
   by userspace (rather that all sets being copied out for every exit).
 - vcpu_events are available in addition to regs and sregs.
@@ -4841,23 +5364,26 @@ into the vCPU even if they've been modified.
 
 Unused bitfields in the bitarrays must be set to zero.
 
-struct kvm_sync_regs {
+::
+
+  struct kvm_sync_regs {
         struct kvm_regs regs;
         struct kvm_sregs sregs;
         struct kvm_vcpu_events events;
-};
+  };
 
 6.75 KVM_CAP_PPC_IRQ_XIVE
+-------------------------
 
-Architectures: ppc
-Target: vcpu
-Parameters: args[0] is the XIVE device fd
-            args[1] is the XIVE CPU number (server ID) for this vcpu
+:Architectures: ppc
+:Target: vcpu
+:Parameters: args[0] is the XIVE device fd;
+             args[1] is the XIVE CPU number (server ID) for this vcpu
 
 This capability connects the vcpu to an in-kernel XIVE device.
 
 7. Capabilities that can be enabled on VMs
-------------------------------------------
+==========================================
 
 There are certain capabilities that change the behavior of the virtual
 machine when enabled. To enable them, please see section 4.37. Below
@@ -4866,20 +5392,24 @@ is when enabling them.
 
 The following information is provided along with the description:
 
-  Architectures: which instruction set architectures provide this ioctl.
+  Architectures:
+      which instruction set architectures provide this ioctl.
       x86 includes both i386 and x86_64.
 
-  Parameters: what parameters are accepted by the capability.
+  Parameters:
+      what parameters are accepted by the capability.
 
-  Returns: the return value.  General error numbers (EBADF, ENOMEM, EINVAL)
+  Returns:
+      the return value.  General error numbers (EBADF, ENOMEM, EINVAL)
       are not detailed, but errors with specific meanings are.
 
 
 7.1 KVM_CAP_PPC_ENABLE_HCALL
+----------------------------
 
-Architectures: ppc
-Parameters: args[0] is the sPAPR hcall number
-	    args[1] is 0 to disable, 1 to enable in-kernel handling
+:Architectures: ppc
+:Parameters: args[0] is the sPAPR hcall number;
+	     args[1] is 0 to disable, 1 to enable in-kernel handling
 
 This capability controls whether individual sPAPR hypercalls (hcalls)
 get handled by the kernel or not.  Enabling or disabling in-kernel
@@ -4897,13 +5427,15 @@ implementation, the KVM_ENABLE_CAP ioctl will fail with an EINVAL
 error.
 
 7.2 KVM_CAP_S390_USER_SIGP
+--------------------------
 
-Architectures: s390
-Parameters: none
+:Architectures: s390
+:Parameters: none
 
 This capability controls which SIGP orders will be handled completely in user
 space. With this capability enabled, all fast orders will be handled completely
 in the kernel:
+
 - SENSE
 - SENSE RUNNING
 - EXTERNAL CALL
@@ -4917,48 +5449,52 @@ in the hardware prior to interception). If this capability is not enabled, the
 old way of handling SIGP orders is used (partially in kernel and user space).
 
 7.3 KVM_CAP_S390_VECTOR_REGISTERS
+---------------------------------
 
-Architectures: s390
-Parameters: none
-Returns: 0 on success, negative value on error
+:Architectures: s390
+:Parameters: none
+:Returns: 0 on success, negative value on error
 
 Allows use of the vector registers introduced with z13 processor, and
 provides for the synchronization between host and user space.  Will
 return -EINVAL if the machine does not support vectors.
 
 7.4 KVM_CAP_S390_USER_STSI
+--------------------------
 
-Architectures: s390
-Parameters: none
+:Architectures: s390
+:Parameters: none
 
 This capability allows post-handlers for the STSI instruction. After
 initial handling in the kernel, KVM exits to user space with
 KVM_EXIT_S390_STSI to allow user space to insert further data.
 
 Before exiting to userspace, kvm handlers should fill in s390_stsi field of
-vcpu->run:
-struct {
+vcpu->run::
+
+  struct {
 	__u64 addr;
 	__u8 ar;
 	__u8 reserved;
 	__u8 fc;
 	__u8 sel1;
 	__u16 sel2;
-} s390_stsi;
+  } s390_stsi;
 
-@addr - guest address of STSI SYSIB
-@fc   - function code
-@sel1 - selector 1
-@sel2 - selector 2
-@ar   - access register number
+  @addr - guest address of STSI SYSIB
+  @fc   - function code
+  @sel1 - selector 1
+  @sel2 - selector 2
+  @ar   - access register number
 
 KVM handlers should exit to userspace with rc = -EREMOTE.
 
 7.5 KVM_CAP_SPLIT_IRQCHIP
+-------------------------
 
-Architectures: x86
-Parameters: args[0] - number of routes reserved for userspace IOAPICs
-Returns: 0 on success, -1 on error
+:Architectures: x86
+:Parameters: args[0] - number of routes reserved for userspace IOAPICs
+:Returns: 0 on success, -1 on error
 
 Create a local apic for each processor in the kernel. This can be used
 instead of KVM_CREATE_IRQCHIP if the userspace VMM wishes to emulate the
@@ -4975,24 +5511,26 @@ Fails if VCPU has already been created, or if the irqchip is already in the
 kernel (i.e. KVM_CREATE_IRQCHIP has already been called).
 
 7.6 KVM_CAP_S390_RI
+-------------------
 
-Architectures: s390
-Parameters: none
+:Architectures: s390
+:Parameters: none
 
 Allows use of runtime-instrumentation introduced with zEC12 processor.
 Will return -EINVAL if the machine does not support runtime-instrumentation.
 Will return -EBUSY if a VCPU has already been created.
 
 7.7 KVM_CAP_X2APIC_API
+----------------------
 
-Architectures: x86
-Parameters: args[0] - features that should be enabled
-Returns: 0 on success, -EINVAL when args[0] contains invalid features
+:Architectures: x86
+:Parameters: args[0] - features that should be enabled
+:Returns: 0 on success, -EINVAL when args[0] contains invalid features
 
-Valid feature flags in args[0] are
+Valid feature flags in args[0] are::
 
-#define KVM_X2APIC_API_USE_32BIT_IDS            (1ULL << 0)
-#define KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK  (1ULL << 1)
+  #define KVM_X2APIC_API_USE_32BIT_IDS            (1ULL << 0)
+  #define KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK  (1ULL << 1)
 
 Enabling KVM_X2APIC_API_USE_32BIT_IDS changes the behavior of
 KVM_SET_GSI_ROUTING, KVM_SIGNAL_MSI, KVM_SET_LAPIC, and KVM_GET_LAPIC,
@@ -5006,9 +5544,10 @@ without interrupt remapping.  This is undesirable in logical mode,
 where 0xff represents CPUs 0-7 in cluster 0.
 
 7.8 KVM_CAP_S390_USER_INSTR0
+----------------------------
 
-Architectures: s390
-Parameters: none
+:Architectures: s390
+:Parameters: none
 
 With this capability enabled, all illegal instructions 0x0000 (2 bytes) will
 be intercepted and forwarded to user space. User space can use this
@@ -5020,26 +5559,29 @@ This capability can be enabled dynamically even if VCPUs were already
 created and are running.
 
 7.9 KVM_CAP_S390_GS
+-------------------
 
-Architectures: s390
-Parameters: none
-Returns: 0 on success; -EINVAL if the machine does not support
-	 guarded storage; -EBUSY if a VCPU has already been created.
+:Architectures: s390
+:Parameters: none
+:Returns: 0 on success; -EINVAL if the machine does not support
+          guarded storage; -EBUSY if a VCPU has already been created.
 
 Allows use of guarded storage for the KVM guest.
 
 7.10 KVM_CAP_S390_AIS
+---------------------
 
-Architectures: s390
-Parameters: none
+:Architectures: s390
+:Parameters: none
 
 Allow use of adapter-interruption suppression.
-Returns: 0 on success; -EBUSY if a VCPU has already been created.
+:Returns: 0 on success; -EBUSY if a VCPU has already been created.
 
 7.11 KVM_CAP_PPC_SMT
+--------------------
 
-Architectures: ppc
-Parameters: vsmt_mode, flags
+:Architectures: ppc
+:Parameters: vsmt_mode, flags
 
 Enabling this capability on a VM provides userspace with a way to set
 the desired virtual SMT mode (i.e. the number of virtual CPUs per
@@ -5054,9 +5596,10 @@ The KVM_CAP_PPC_SMT_POSSIBLE capability indicates which virtual SMT
 modes are available.
 
 7.12 KVM_CAP_PPC_FWNMI
+----------------------
 
-Architectures: ppc
-Parameters: none
+:Architectures: ppc
+:Parameters: none
 
 With this capability a machine check exception in the guest address
 space will cause KVM to exit the guest with NMI exit reason. This
@@ -5065,17 +5608,18 @@ machine check handling routine. Without this capability KVM will
 branch to guests' 0x200 interrupt vector.
 
 7.13 KVM_CAP_X86_DISABLE_EXITS
+------------------------------
 
-Architectures: x86
-Parameters: args[0] defines which exits are disabled
-Returns: 0 on success, -EINVAL when args[0] contains invalid exits
+:Architectures: x86
+:Parameters: args[0] defines which exits are disabled
+:Returns: 0 on success, -EINVAL when args[0] contains invalid exits
 
-Valid bits in args[0] are
+Valid bits in args[0] are::
 
-#define KVM_X86_DISABLE_EXITS_MWAIT            (1 << 0)
-#define KVM_X86_DISABLE_EXITS_HLT              (1 << 1)
-#define KVM_X86_DISABLE_EXITS_PAUSE            (1 << 2)
-#define KVM_X86_DISABLE_EXITS_CSTATE           (1 << 3)
+  #define KVM_X86_DISABLE_EXITS_MWAIT            (1 << 0)
+  #define KVM_X86_DISABLE_EXITS_HLT              (1 << 1)
+  #define KVM_X86_DISABLE_EXITS_PAUSE            (1 << 2)
+  #define KVM_X86_DISABLE_EXITS_CSTATE           (1 << 3)
 
 Enabling this capability on a VM provides userspace with a way to no
 longer intercept some instructions for improved latency in some
@@ -5087,12 +5631,13 @@ all such vmexits.
 Do not enable KVM_FEATURE_PV_UNHALT if you disable HLT exits.
 
 7.14 KVM_CAP_S390_HPAGE_1M
+--------------------------
 
-Architectures: s390
-Parameters: none
-Returns: 0 on success, -EINVAL if hpage module parameter was not set
-	 or cmma is enabled, or the VM has the KVM_VM_S390_UCONTROL
-	 flag set
+:Architectures: s390
+:Parameters: none
+:Returns: 0 on success, -EINVAL if hpage module parameter was not set
+	  or cmma is enabled, or the VM has the KVM_VM_S390_UCONTROL
+	  flag set
 
 With this capability the KVM support for memory backing with 1m pages
 through hugetlbfs can be enabled for a VM. After the capability is
@@ -5104,20 +5649,22 @@ While it is generally possible to create a huge page backed VM without
 this capability, the VM will not be able to run.
 
 7.15 KVM_CAP_MSR_PLATFORM_INFO
+------------------------------
 
-Architectures: x86
-Parameters: args[0] whether feature should be enabled or not
+:Architectures: x86
+:Parameters: args[0] whether feature should be enabled or not
 
 With this capability, a guest may read the MSR_PLATFORM_INFO MSR. Otherwise,
 a #GP would be raised when the guest tries to access. Currently, this
 capability does not enable write permissions of this MSR for the guest.
 
 7.16 KVM_CAP_PPC_NESTED_HV
+--------------------------
 
-Architectures: ppc
-Parameters: none
-Returns: 0 on success, -EINVAL when the implementation doesn't support
-	 nested-HV virtualization.
+:Architectures: ppc
+:Parameters: none
+:Returns: 0 on success, -EINVAL when the implementation doesn't support
+	  nested-HV virtualization.
 
 HV-KVM on POWER9 and later systems allows for "nested-HV"
 virtualization, which provides a way for a guest VM to run guests that
@@ -5127,9 +5674,10 @@ the necessary functionality and on the facility being enabled with a
 kvm-hv module parameter.
 
 7.17 KVM_CAP_EXCEPTION_PAYLOAD
+------------------------------
 
-Architectures: x86
-Parameters: args[0] whether feature should be enabled or not
+:Architectures: x86
+:Parameters: args[0] whether feature should be enabled or not
 
 With this capability enabled, CR2 will not be modified prior to the
 emulated VM-exit when L1 intercepts a #PF exception that occurs in
@@ -5140,21 +5688,21 @@ L2. As a result, when KVM_GET_VCPU_EVENTS reports a pending #PF (or
 faulting address (or the new DR6 bits*) will be reported in the
 exception_payload field. Similarly, when userspace injects a #PF (or
 #DB) into L2 using KVM_SET_VCPU_EVENTS, it is expected to set
-exception.has_payload and to put the faulting address (or the new DR6
-bits*) in the exception_payload field.
+exception.has_payload and to put the faulting address - or the new DR6
+bits\ [#]_ - in the exception_payload field.
 
 This capability also enables exception.pending in struct
 kvm_vcpu_events, which allows userspace to distinguish between pending
 and injected exceptions.
 
 
-* For the new DR6 bits, note that bit 16 is set iff the #DB exception
-  will clear DR6.RTM.
+.. [#] For the new DR6 bits, note that bit 16 is set iff the #DB exception
+       will clear DR6.RTM.
 
 7.18 KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2
 
-Architectures: x86, arm, arm64, mips
-Parameters: args[0] whether feature should be enabled or not
+:Architectures: x86, arm, arm64, mips
+:Parameters: args[0] whether feature should be enabled or not
 
 With this capability enabled, KVM_GET_DIRTY_LOG will not automatically
 clear and write-protect all pages that are returned as dirty.
@@ -5181,14 +5729,15 @@ KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 signals that those bugs are fixed.
 Userspace should not try to use KVM_CAP_MANUAL_DIRTY_LOG_PROTECT.
 
 8. Other capabilities.
-----------------------
+======================
 
 This section lists capabilities that give information about other
 features of the KVM implementation.
 
 8.1 KVM_CAP_PPC_HWRNG
+---------------------
 
-Architectures: ppc
+:Architectures: ppc
 
 This capability, if KVM_CHECK_EXTENSION indicates that it is
 available, means that that the kernel has an implementation of the
@@ -5197,8 +5746,10 @@ If present, the kernel H_RANDOM handler can be enabled for guest use
 with the KVM_CAP_PPC_ENABLE_HCALL capability.
 
 8.2 KVM_CAP_HYPERV_SYNIC
+------------------------
+
+:Architectures: x86
 
-Architectures: x86
 This capability, if KVM_CHECK_EXTENSION indicates that it is
 available, means that that the kernel has an implementation of the
 Hyper-V Synthetic interrupt controller(SynIC). Hyper-V SynIC is
@@ -5210,8 +5761,9 @@ will disable the use of APIC hardware virtualization even if supported
 by the CPU, as it's incompatible with SynIC auto-EOI behavior.
 
 8.3 KVM_CAP_PPC_RADIX_MMU
+-------------------------
 
-Architectures: ppc
+:Architectures: ppc
 
 This capability, if KVM_CHECK_EXTENSION indicates that it is
 available, means that that the kernel can support guests using the
@@ -5219,8 +5771,9 @@ radix MMU defined in Power ISA V3.00 (as implemented in the POWER9
 processor).
 
 8.4 KVM_CAP_PPC_HASH_MMU_V3
+---------------------------
 
-Architectures: ppc
+:Architectures: ppc
 
 This capability, if KVM_CHECK_EXTENSION indicates that it is
 available, means that that the kernel can support guests using the
@@ -5228,8 +5781,9 @@ hashed page table MMU defined in Power ISA V3.00 (as implemented in
 the POWER9 processor), including in-memory segment tables.
 
 8.5 KVM_CAP_MIPS_VZ
+-------------------
 
-Architectures: mips
+:Architectures: mips
 
 This capability, if KVM_CHECK_EXTENSION on the main kvm handle indicates that
 it is available, means that full hardware assisted virtualization capabilities
@@ -5247,16 +5801,19 @@ values (see below). All other values are reserved. This is to allow for the
 possibility of other hardware assisted virtualization implementations which
 may be incompatible with the MIPS VZ ASE.
 
- 0: The trap & emulate implementation is in use to run guest code in user
+==  ==========================================================================
+ 0  The trap & emulate implementation is in use to run guest code in user
     mode. Guest virtual memory segments are rearranged to fit the guest in the
     user mode address space.
 
- 1: The MIPS VZ ASE is in use, providing full hardware assisted
+ 1  The MIPS VZ ASE is in use, providing full hardware assisted
     virtualization, including standard guest virtual memory segments.
+==  ==========================================================================
 
 8.6 KVM_CAP_MIPS_TE
+-------------------
 
-Architectures: mips
+:Architectures: mips
 
 This capability, if KVM_CHECK_EXTENSION on the main kvm handle indicates that
 it is available, means that the trap & emulate implementation is available to
@@ -5268,8 +5825,9 @@ If KVM_CHECK_EXTENSION on a kvm VM handle indicates that this capability is
 available, it means that the VM is using trap & emulate.
 
 8.7 KVM_CAP_MIPS_64BIT
+----------------------
 
-Architectures: mips
+:Architectures: mips
 
 This capability indicates the supported architecture type of the guest, i.e. the
 supported register and address width.
@@ -5279,22 +5837,26 @@ kvm VM handle correspond roughly to the CP0_Config.AT register field, and should
 be checked specifically against known values (see below). All other values are
 reserved.
 
- 0: MIPS32 or microMIPS32.
+==  ========================================================================
+ 0  MIPS32 or microMIPS32.
     Both registers and addresses are 32-bits wide.
     It will only be possible to run 32-bit guest code.
 
- 1: MIPS64 or microMIPS64 with access only to 32-bit compatibility segments.
+ 1  MIPS64 or microMIPS64 with access only to 32-bit compatibility segments.
     Registers are 64-bits wide, but addresses are 32-bits wide.
     64-bit guest code may run but cannot access MIPS64 memory segments.
     It will also be possible to run 32-bit guest code.
 
- 2: MIPS64 or microMIPS64 with access to all address segments.
+ 2  MIPS64 or microMIPS64 with access to all address segments.
     Both registers and addresses are 64-bits wide.
     It will be possible to run 64-bit or 32-bit guest code.
+==  ========================================================================
 
 8.9 KVM_CAP_ARM_USER_IRQ
+------------------------
+
+:Architectures: arm, arm64
 
-Architectures: arm, arm64
 This capability, if KVM_CHECK_EXTENSION indicates that it is available, means
 that if userspace creates a VM without an in-kernel interrupt controller, it
 will be notified of changes to the output level of in-kernel emulated devices,
@@ -5321,7 +5883,7 @@ If KVM_CAP_ARM_USER_IRQ is supported, the KVM_CHECK_EXTENSION ioctl returns a
 number larger than 0 indicating the version of this capability is implemented
 and thereby which bits in in run->s.regs.device_irq_level can signal values.
 
-Currently the following bits are defined for the device_irq_level bitmap:
+Currently the following bits are defined for the device_irq_level bitmap::
 
   KVM_CAP_ARM_USER_IRQ >= 1:
 
@@ -5334,8 +5896,9 @@ indicated by returning a higher number from KVM_CHECK_EXTENSION and will be
 listed above.
 
 8.10 KVM_CAP_PPC_SMT_POSSIBLE
+-----------------------------
 
-Architectures: ppc
+:Architectures: ppc
 
 Querying this capability returns a bitmap indicating the possible
 virtual SMT modes that can be set using KVM_CAP_PPC_SMT.  If bit N
@@ -5343,8 +5906,9 @@ virtual SMT modes that can be set using KVM_CAP_PPC_SMT.  If bit N
 available.
 
 8.11 KVM_CAP_HYPERV_SYNIC2
+--------------------------
 
-Architectures: x86
+:Architectures: x86
 
 This capability enables a newer version of Hyper-V Synthetic interrupt
 controller (SynIC).  The only difference with KVM_CAP_HYPERV_SYNIC is that KVM
@@ -5352,8 +5916,9 @@ doesn't clear SynIC message and event flags pages when they are enabled by
 writing to the respective MSRs.
 
 8.12 KVM_CAP_HYPERV_VP_INDEX
+----------------------------
 
-Architectures: x86
+:Architectures: x86
 
 This capability indicates that userspace can load HV_X64_MSR_VP_INDEX msr.  Its
 value is used to denote the target vcpu for a SynIC interrupt.  For
@@ -5361,47 +5926,53 @@ compatibilty, KVM initializes this msr to KVM's internal vcpu index.  When this
 capability is absent, userspace can still query this msr's value.
 
 8.13 KVM_CAP_S390_AIS_MIGRATION
+-------------------------------
 
-Architectures: s390
-Parameters: none
+:Architectures: s390
+:Parameters: none
 
 This capability indicates if the flic device will be able to get/set the
 AIS states for migration via the KVM_DEV_FLIC_AISM_ALL attribute and allows
 to discover this without having to create a flic device.
 
 8.14 KVM_CAP_S390_PSW
+---------------------
 
-Architectures: s390
+:Architectures: s390
 
 This capability indicates that the PSW is exposed via the kvm_run structure.
 
 8.15 KVM_CAP_S390_GMAP
+----------------------
 
-Architectures: s390
+:Architectures: s390
 
 This capability indicates that the user space memory used as guest mapping can
 be anywhere in the user memory address space, as long as the memory slots are
 aligned and sized to a segment (1MB) boundary.
 
 8.16 KVM_CAP_S390_COW
+---------------------
 
-Architectures: s390
+:Architectures: s390
 
 This capability indicates that the user space memory used as guest mapping can
 use copy-on-write semantics as well as dirty pages tracking via read-only page
 tables.
 
 8.17 KVM_CAP_S390_BPB
+---------------------
 
-Architectures: s390
+:Architectures: s390
 
 This capability indicates that kvm will implement the interfaces to handle
 reset, migration and nested KVM for branch prediction blocking. The stfle
 facility 82 should not be provided to the guest without this capability.
 
 8.18 KVM_CAP_HYPERV_TLBFLUSH
+----------------------------
 
-Architectures: x86
+:Architectures: x86
 
 This capability indicates that KVM supports paravirtualized Hyper-V TLB Flush
 hypercalls:
@@ -5409,8 +5980,9 @@ HvFlushVirtualAddressSpace, HvFlushVirtualAddressSpaceEx,
 HvFlushVirtualAddressList, HvFlushVirtualAddressListEx.
 
 8.19 KVM_CAP_ARM_INJECT_SERROR_ESR
+----------------------------------
 
-Architectures: arm, arm64
+:Architectures: arm, arm64
 
 This capability indicates that userspace can specify (via the
 KVM_SET_VCPU_EVENTS ioctl) the syndrome value reported to the guest when it
@@ -5421,16 +5993,20 @@ CPU when the exception is taken. If this virtual SError is taken to EL1 using
 AArch64, this value will be reported in the ISS field of ESR_ELx.
 
 See KVM_CAP_VCPU_EVENTS for more details.
+
 8.20 KVM_CAP_HYPERV_SEND_IPI
+----------------------------
 
-Architectures: x86
+:Architectures: x86
 
 This capability indicates that KVM supports paravirtualized Hyper-V IPI send
 hypercalls:
 HvCallSendSyntheticClusterIpi, HvCallSendSyntheticClusterIpiEx.
+
 8.21 KVM_CAP_HYPERV_DIRECT_TLBFLUSH
+-----------------------------------
 
-Architecture: x86
+:Architecture: x86
 
 This capability indicates that KVM running on top of Hyper-V hypervisor
 enables Direct TLB flush for its guests meaning that TLB flush
diff --git a/Documentation/virt/kvm/index.rst b/Documentation/virt/kvm/index.rst
index 24d1076ec680..6fe79185b9bc 100644
--- a/Documentation/virt/kvm/index.rst
+++ b/Documentation/virt/kvm/index.rst
@@ -7,6 +7,7 @@ KVM
 .. toctree::
    :maxdepth: 2
 
+   api
    amd-memory-encryption
    cpuid
    halt-polling
-- 
2.24.1

