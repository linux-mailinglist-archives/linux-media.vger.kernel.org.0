Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B68BF156F2C
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 07:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbgBJGDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 01:03:33 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:36414 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgBJGDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 01:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=dJiiHgPJv+FD5Heh47DYQAiy3+LAt/Pk2+RFmbNpcJg=; b=LUnK2hcdRKw81wCCQc4MDrzvuU
        JnZVWjju4vT6f3oJZajh8CqV6ouPhp4FlwBXk5BQYWz37j2Y2MuyjLnIMZ4QRHlju3rVM7Uc7RQxX
        uH97+T3jWlzI2eU2u/LVuh3cJU3Mz9d0xS12ZoA9MPYfEztkS8lURTyyneLjsfuPCURakhpYVkcKs
        0r/DO15ZXZBapYJvqXP5hWgD4mFT4yER6b7zqWwO97cmwg7EaioNjA4wD6UbdDSd+TkRVxp1cw/y9
        big4LTHxs1BbSPMRcLgV09GcG7+1YKFF1OlBV8cyDEJVzevRLS1Ztgk1B8g2xdvySmsqoXm95/M4g
        Ho5r4o5w==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j12A4-0006Tv-7a; Mon, 10 Feb 2020 06:03:12 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j12A2-00C2WF-GU; Mon, 10 Feb 2020 07:03:10 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 21/28] docs: kvm: Convert locking.txt to ReST format
Date:   Mon, 10 Feb 2020 07:02:59 +0100
Message-Id: <e1b42a6a7965dea5f1e10b07e5f0552bf03a6384.1581314317.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581314316.git.mchehab+huawei@kernel.org>
References: <cover.1581314316.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Use document title and chapter markups;
- Add markups for literal blocks;
- use :field: for field descriptions;
- Add blank lines and adjust indentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/kvm/index.rst   |   1 +
 Documentation/virt/kvm/locking.rst | 243 +++++++++++++++++++++++++++++
 Documentation/virt/kvm/locking.txt | 215 -------------------------
 3 files changed, 244 insertions(+), 215 deletions(-)
 create mode 100644 Documentation/virt/kvm/locking.rst
 delete mode 100644 Documentation/virt/kvm/locking.txt

diff --git a/Documentation/virt/kvm/index.rst b/Documentation/virt/kvm/index.rst
index ac83bc588f7e..9be8f53b729d 100644
--- a/Documentation/virt/kvm/index.rst
+++ b/Documentation/virt/kvm/index.rst
@@ -12,6 +12,7 @@ KVM
    cpuid
    halt-polling
    hypercalls
+   locking
    msr
    vcpu-requests
 
diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
new file mode 100644
index 000000000000..c02291beac3f
--- /dev/null
+++ b/Documentation/virt/kvm/locking.rst
@@ -0,0 +1,243 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+KVM Lock Overview
+=================
+
+1. Acquisition Orders
+---------------------
+
+The acquisition orders for mutexes are as follows:
+
+- kvm->lock is taken outside vcpu->mutex
+
+- kvm->lock is taken outside kvm->slots_lock and kvm->irq_lock
+
+- kvm->slots_lock is taken outside kvm->irq_lock, though acquiring
+  them together is quite rare.
+
+On x86, vcpu->mutex is taken outside kvm->arch.hyperv.hv_lock.
+
+Everything else is a leaf: no other lock is taken inside the critical
+sections.
+
+2. Exception
+------------
+
+Fast page fault:
+
+Fast page fault is the fast path which fixes the guest page fault out of
+the mmu-lock on x86. Currently, the page fault can be fast in one of the
+following two cases:
+
+1. Access Tracking: The SPTE is not present, but it is marked for access
+   tracking i.e. the SPTE_SPECIAL_MASK is set. That means we need to
+   restore the saved R/X bits. This is described in more detail later below.
+
+2. Write-Protection: The SPTE is present and the fault is
+   caused by write-protect. That means we just need to change the W bit of
+   the spte.
+
+What we use to avoid all the race is the SPTE_HOST_WRITEABLE bit and
+SPTE_MMU_WRITEABLE bit on the spte:
+
+- SPTE_HOST_WRITEABLE means the gfn is writable on host.
+- SPTE_MMU_WRITEABLE means the gfn is writable on mmu. The bit is set when
+  the gfn is writable on guest mmu and it is not write-protected by shadow
+  page write-protection.
+
+On fast page fault path, we will use cmpxchg to atomically set the spte W
+bit if spte.SPTE_HOST_WRITEABLE = 1 and spte.SPTE_WRITE_PROTECT = 1, or
+restore the saved R/X bits if VMX_EPT_TRACK_ACCESS mask is set, or both. This
+is safe because whenever changing these bits can be detected by cmpxchg.
+
+But we need carefully check these cases:
+
+1) The mapping from gfn to pfn
+
+The mapping from gfn to pfn may be changed since we can only ensure the pfn
+is not changed during cmpxchg. This is a ABA problem, for example, below case
+will happen:
+
++------------------------------------------------------------------------+
+| At the beginning::                                                     |
+|                                                                        |
+|	gpte = gfn1                                                      |
+|	gfn1 is mapped to pfn1 on host                                   |
+|	spte is the shadow page table entry corresponding with gpte and  |
+|	spte = pfn1                                                      |
++------------------------------------------------------------------------+
+| On fast page fault path:                                               |
++------------------------------------+-----------------------------------+
+| CPU 0:                             | CPU 1:                            |
++------------------------------------+-----------------------------------+
+| ::                                 |                                   |
+|                                    |                                   |
+|   old_spte = *spte;                |                                   |
++------------------------------------+-----------------------------------+
+|                                    | pfn1 is swapped out::             |
+|                                    |                                   |
+|                                    |    spte = 0;                      |
+|                                    |                                   |
+|                                    | pfn1 is re-alloced for gfn2.      |
+|                                    |                                   |
+|                                    | gpte is changed to point to       |
+|                                    | gfn2 by the guest::               |
+|                                    |                                   |
+|                                    |    spte = pfn1;                   |
++------------------------------------+-----------------------------------+
+| ::                                                                     |
+|                                                                        |
+|   if (cmpxchg(spte, old_spte, old_spte+W)                              |
+|	mark_page_dirty(vcpu->kvm, gfn1)                                 |
+|            OOPS!!!                                                     |
++------------------------------------------------------------------------+
+
+We dirty-log for gfn1, that means gfn2 is lost in dirty-bitmap.
+
+For direct sp, we can easily avoid it since the spte of direct sp is fixed
+to gfn. For indirect sp, before we do cmpxchg, we call gfn_to_pfn_atomic()
+to pin gfn to pfn, because after gfn_to_pfn_atomic():
+
+- We have held the refcount of pfn that means the pfn can not be freed and
+  be reused for another gfn.
+- The pfn is writable that means it can not be shared between different gfns
+  by KSM.
+
+Then, we can ensure the dirty bitmaps is correctly set for a gfn.
+
+Currently, to simplify the whole things, we disable fast page fault for
+indirect shadow page.
+
+2) Dirty bit tracking
+
+In the origin code, the spte can be fast updated (non-atomically) if the
+spte is read-only and the Accessed bit has already been set since the
+Accessed bit and Dirty bit can not be lost.
+
+But it is not true after fast page fault since the spte can be marked
+writable between reading spte and updating spte. Like below case:
+
++------------------------------------------------------------------------+
+| At the beginning::                                                     |
+|                                                                        |
+|	spte.W = 0                                                       |
+|	spte.Accessed = 1                                                |
++------------------------------------+-----------------------------------+
+| CPU 0:                             | CPU 1:                            |
++------------------------------------+-----------------------------------+
+| In mmu_spte_clear_track_bits()::   |                                   |
+|                                    |                                   |
+|  old_spte = *spte;                 |                                   |
+|                                    |                                   |
+|                                    |                                   |
+|  /* 'if' condition is satisfied. */|                                   |
+|  if (old_spte.Accessed == 1 &&     |                                   |
+|       old_spte.W == 0)             |                                   |
+|     spte = 0ull;                   |                                   |
++------------------------------------+-----------------------------------+
+|                                    | on fast page fault path::         |
+|                                    |                                   |
+|                                    |    spte.W = 1                     |
+|                                    |                                   |
+|                                    | memory write on the spte::        |
+|                                    |                                   |
+|                                    |    spte.Dirty = 1                 |
++------------------------------------+-----------------------------------+
+|  ::                                |                                   |
+|                                    |                                   |
+|   else                             |                                   |
+|     old_spte = xchg(spte, 0ull)    |                                   |
+|   if (old_spte.Accessed == 1)      |                                   |
+|     kvm_set_pfn_accessed(spte.pfn);|                                   |
+|   if (old_spte.Dirty == 1)         |                                   |
+|     kvm_set_pfn_dirty(spte.pfn);   |                                   |
+|     OOPS!!!                        |                                   |
++------------------------------------+-----------------------------------+
+
+The Dirty bit is lost in this case.
+
+In order to avoid this kind of issue, we always treat the spte as "volatile"
+if it can be updated out of mmu-lock, see spte_has_volatile_bits(), it means,
+the spte is always atomically updated in this case.
+
+3) flush tlbs due to spte updated
+
+If the spte is updated from writable to readonly, we should flush all TLBs,
+otherwise rmap_write_protect will find a read-only spte, even though the
+writable spte might be cached on a CPU's TLB.
+
+As mentioned before, the spte can be updated to writable out of mmu-lock on
+fast page fault path, in order to easily audit the path, we see if TLBs need
+be flushed caused by this reason in mmu_spte_update() since this is a common
+function to update spte (present -> present).
+
+Since the spte is "volatile" if it can be updated out of mmu-lock, we always
+atomically update the spte, the race caused by fast page fault can be avoided,
+See the comments in spte_has_volatile_bits() and mmu_spte_update().
+
+Lockless Access Tracking:
+
+This is used for Intel CPUs that are using EPT but do not support the EPT A/D
+bits. In this case, when the KVM MMU notifier is called to track accesses to a
+page (via kvm_mmu_notifier_clear_flush_young), it marks the PTE as not-present
+by clearing the RWX bits in the PTE and storing the original R & X bits in
+some unused/ignored bits. In addition, the SPTE_SPECIAL_MASK is also set on the
+PTE (using the ignored bit 62). When the VM tries to access the page later on,
+a fault is generated and the fast page fault mechanism described above is used
+to atomically restore the PTE to a Present state. The W bit is not saved when
+the PTE is marked for access tracking and during restoration to the Present
+state, the W bit is set depending on whether or not it was a write access. If
+it wasn't, then the W bit will remain clear until a write access happens, at
+which time it will be set using the Dirty tracking mechanism described above.
+
+3. Reference
+------------
+
+:Name:		kvm_lock
+:Type:		mutex
+:Arch:		any
+:Protects:	- vm_list
+
+:Name:		kvm_count_lock
+:Type:		raw_spinlock_t
+:Arch:		any
+:Protects:	- hardware virtualization enable/disable
+:Comment:	'raw' because hardware enabling/disabling must be atomic /wrt
+		migration.
+
+:Name:		kvm_arch::tsc_write_lock
+:Type:		raw_spinlock
+:Arch:		x86
+:Protects:	- kvm_arch::{last_tsc_write,last_tsc_nsec,last_tsc_offset}
+		- tsc offset in vmcb
+:Comment:	'raw' because updating the tsc offsets must not be preempted.
+
+:Name:		kvm->mmu_lock
+:Type:		spinlock_t
+:Arch:		any
+:Protects:	-shadow page/shadow tlb entry
+:Comment:	it is a spinlock since it is used in mmu notifier.
+
+:Name:		kvm->srcu
+:Type:		srcu lock
+:Arch:		any
+:Protects:	- kvm->memslots
+		- kvm->buses
+:Comment:	The srcu read lock must be held while accessing memslots (e.g.
+		when using gfn_to_* functions) and while accessing in-kernel
+		MMIO/PIO address->device structure mapping (kvm->buses).
+		The srcu index can be stored in kvm_vcpu->srcu_idx per vcpu
+		if it is needed by multiple functions.
+
+:Name:		blocked_vcpu_on_cpu_lock
+:Type:		spinlock_t
+:Arch:		x86
+:Protects:	blocked_vcpu_on_cpu
+:Comment:	This is a per-CPU lock and it is used for VT-d posted-interrupts.
+		When VT-d posted-interrupts is supported and the VM has assigned
+		devices, we put the blocked vCPU on the list blocked_vcpu_on_cpu
+		protected by blocked_vcpu_on_cpu_lock, when VT-d hardware issues
+		wakeup notification event since external interrupts from the
+		assigned devices happens, we will find the vCPU on the list to
+		wakeup.
diff --git a/Documentation/virt/kvm/locking.txt b/Documentation/virt/kvm/locking.txt
deleted file mode 100644
index 635cd6eaf714..000000000000
--- a/Documentation/virt/kvm/locking.txt
+++ /dev/null
@@ -1,215 +0,0 @@
-KVM Lock Overview
-=================
-
-1. Acquisition Orders
----------------------
-
-The acquisition orders for mutexes are as follows:
-
-- kvm->lock is taken outside vcpu->mutex
-
-- kvm->lock is taken outside kvm->slots_lock and kvm->irq_lock
-
-- kvm->slots_lock is taken outside kvm->irq_lock, though acquiring
-  them together is quite rare.
-
-On x86, vcpu->mutex is taken outside kvm->arch.hyperv.hv_lock.
-
-Everything else is a leaf: no other lock is taken inside the critical
-sections.
-
-2: Exception
-------------
-
-Fast page fault:
-
-Fast page fault is the fast path which fixes the guest page fault out of
-the mmu-lock on x86. Currently, the page fault can be fast in one of the
-following two cases:
-
-1. Access Tracking: The SPTE is not present, but it is marked for access
-tracking i.e. the SPTE_SPECIAL_MASK is set. That means we need to
-restore the saved R/X bits. This is described in more detail later below.
-
-2. Write-Protection: The SPTE is present and the fault is
-caused by write-protect. That means we just need to change the W bit of the 
-spte.
-
-What we use to avoid all the race is the SPTE_HOST_WRITEABLE bit and
-SPTE_MMU_WRITEABLE bit on the spte:
-- SPTE_HOST_WRITEABLE means the gfn is writable on host.
-- SPTE_MMU_WRITEABLE means the gfn is writable on mmu. The bit is set when
-  the gfn is writable on guest mmu and it is not write-protected by shadow
-  page write-protection.
-
-On fast page fault path, we will use cmpxchg to atomically set the spte W
-bit if spte.SPTE_HOST_WRITEABLE = 1 and spte.SPTE_WRITE_PROTECT = 1, or 
-restore the saved R/X bits if VMX_EPT_TRACK_ACCESS mask is set, or both. This
-is safe because whenever changing these bits can be detected by cmpxchg.
-
-But we need carefully check these cases:
-1): The mapping from gfn to pfn
-The mapping from gfn to pfn may be changed since we can only ensure the pfn
-is not changed during cmpxchg. This is a ABA problem, for example, below case
-will happen:
-
-At the beginning:
-gpte = gfn1
-gfn1 is mapped to pfn1 on host
-spte is the shadow page table entry corresponding with gpte and
-spte = pfn1
-
-   VCPU 0                           VCPU0
-on fast page fault path:
-
-   old_spte = *spte;
-                                 pfn1 is swapped out:
-                                    spte = 0;
-
-                                 pfn1 is re-alloced for gfn2.
-
-                                 gpte is changed to point to
-                                 gfn2 by the guest:
-                                    spte = pfn1;
-
-   if (cmpxchg(spte, old_spte, old_spte+W)
-	mark_page_dirty(vcpu->kvm, gfn1)
-             OOPS!!!
-
-We dirty-log for gfn1, that means gfn2 is lost in dirty-bitmap.
-
-For direct sp, we can easily avoid it since the spte of direct sp is fixed
-to gfn. For indirect sp, before we do cmpxchg, we call gfn_to_pfn_atomic()
-to pin gfn to pfn, because after gfn_to_pfn_atomic():
-- We have held the refcount of pfn that means the pfn can not be freed and
-  be reused for another gfn.
-- The pfn is writable that means it can not be shared between different gfns
-  by KSM.
-
-Then, we can ensure the dirty bitmaps is correctly set for a gfn.
-
-Currently, to simplify the whole things, we disable fast page fault for
-indirect shadow page.
-
-2): Dirty bit tracking
-In the origin code, the spte can be fast updated (non-atomically) if the
-spte is read-only and the Accessed bit has already been set since the
-Accessed bit and Dirty bit can not be lost.
-
-But it is not true after fast page fault since the spte can be marked
-writable between reading spte and updating spte. Like below case:
-
-At the beginning:
-spte.W = 0
-spte.Accessed = 1
-
-   VCPU 0                                       VCPU0
-In mmu_spte_clear_track_bits():
-
-   old_spte = *spte;
-
-   /* 'if' condition is satisfied. */
-   if (old_spte.Accessed == 1 &&
-        old_spte.W == 0)
-      spte = 0ull;
-                                         on fast page fault path:
-                                             spte.W = 1
-                                         memory write on the spte:
-                                             spte.Dirty = 1
-
-
-   else
-      old_spte = xchg(spte, 0ull)
-
-
-   if (old_spte.Accessed == 1)
-      kvm_set_pfn_accessed(spte.pfn);
-   if (old_spte.Dirty == 1)
-      kvm_set_pfn_dirty(spte.pfn);
-      OOPS!!!
-
-The Dirty bit is lost in this case.
-
-In order to avoid this kind of issue, we always treat the spte as "volatile"
-if it can be updated out of mmu-lock, see spte_has_volatile_bits(), it means,
-the spte is always atomically updated in this case.
-
-3): flush tlbs due to spte updated
-If the spte is updated from writable to readonly, we should flush all TLBs,
-otherwise rmap_write_protect will find a read-only spte, even though the
-writable spte might be cached on a CPU's TLB.
-
-As mentioned before, the spte can be updated to writable out of mmu-lock on
-fast page fault path, in order to easily audit the path, we see if TLBs need
-be flushed caused by this reason in mmu_spte_update() since this is a common
-function to update spte (present -> present).
-
-Since the spte is "volatile" if it can be updated out of mmu-lock, we always
-atomically update the spte, the race caused by fast page fault can be avoided,
-See the comments in spte_has_volatile_bits() and mmu_spte_update().
-
-Lockless Access Tracking:
-
-This is used for Intel CPUs that are using EPT but do not support the EPT A/D
-bits. In this case, when the KVM MMU notifier is called to track accesses to a
-page (via kvm_mmu_notifier_clear_flush_young), it marks the PTE as not-present
-by clearing the RWX bits in the PTE and storing the original R & X bits in
-some unused/ignored bits. In addition, the SPTE_SPECIAL_MASK is also set on the
-PTE (using the ignored bit 62). When the VM tries to access the page later on,
-a fault is generated and the fast page fault mechanism described above is used
-to atomically restore the PTE to a Present state. The W bit is not saved when
-the PTE is marked for access tracking and during restoration to the Present
-state, the W bit is set depending on whether or not it was a write access. If
-it wasn't, then the W bit will remain clear until a write access happens, at 
-which time it will be set using the Dirty tracking mechanism described above.
-
-3. Reference
-------------
-
-Name:		kvm_lock
-Type:		mutex
-Arch:		any
-Protects:	- vm_list
-
-Name:		kvm_count_lock
-Type:		raw_spinlock_t
-Arch:		any
-Protects:	- hardware virtualization enable/disable
-Comment:	'raw' because hardware enabling/disabling must be atomic /wrt
-		migration.
-
-Name:		kvm_arch::tsc_write_lock
-Type:		raw_spinlock
-Arch:		x86
-Protects:	- kvm_arch::{last_tsc_write,last_tsc_nsec,last_tsc_offset}
-		- tsc offset in vmcb
-Comment:	'raw' because updating the tsc offsets must not be preempted.
-
-Name:		kvm->mmu_lock
-Type:		spinlock_t
-Arch:		any
-Protects:	-shadow page/shadow tlb entry
-Comment:	it is a spinlock since it is used in mmu notifier.
-
-Name:		kvm->srcu
-Type:		srcu lock
-Arch:		any
-Protects:	- kvm->memslots
-		- kvm->buses
-Comment:	The srcu read lock must be held while accessing memslots (e.g.
-		when using gfn_to_* functions) and while accessing in-kernel
-		MMIO/PIO address->device structure mapping (kvm->buses).
-		The srcu index can be stored in kvm_vcpu->srcu_idx per vcpu
-		if it is needed by multiple functions.
-
-Name:		blocked_vcpu_on_cpu_lock
-Type:		spinlock_t
-Arch:		x86
-Protects:	blocked_vcpu_on_cpu
-Comment:	This is a per-CPU lock and it is used for VT-d posted-interrupts.
-		When VT-d posted-interrupts is supported and the VM has assigned
-		devices, we put the blocked vCPU on the list blocked_vcpu_on_cpu
-		protected by blocked_vcpu_on_cpu_lock, when VT-d hardware issues
-		wakeup notification event since external interrupts from the
-		assigned devices happens, we will find the vCPU on the list to
-		wakeup.
-- 
2.24.1

