Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E019E2949E6
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 10:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502344AbgJUI63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 04:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441168AbgJUI5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 04:57:16 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFDFC0613CF
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:15 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e17so2016679wru.12
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S+7ufuislqzXK0m1Ak/J4PVW8igwq369gehzbG0B91s=;
        b=TASte01LfK3tJrNEskEJg0JBrkEwFReNqZJcsPAqw0ud/54iE3NFZPYAz4seclzObY
         8qyaNJ7feKdYZc7R1FFJdgR6e4chx6xmBKBCGr9MetZUB65nJ+IYSxcj8fXdkIxAF9Wa
         835vPJ0u8wjGgm4Lqk1+pFbsMYj81cW6UvpFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S+7ufuislqzXK0m1Ak/J4PVW8igwq369gehzbG0B91s=;
        b=NDQ3+lBP705zz0yyiNUIrGsd9h7Wo1Gw3vAraV9IBEESNxeZyhOqjI7yuiA02jUWNc
         ZgRry2JnSiF/vriMQ2PmgFDLM/WM2I2NZ26iZh2HfD5stQXbUIYZGyMbB2QY3NSrpYHw
         MMPUFQQQBlJ3fog+rZI8/cw+aJKiwWVVgtfr/IJhTh7jREzXOP9xImjYA0NOkSIVfE2p
         C/fvMiGej4nBvP9gh+J6YKoEsGPfAe7pqSkzahGwBPwoJCNbTqRIBo5o9Fr7pcxCFd05
         +WGTm/6SZHjUyP6Wyl6JzKYDxsx/TE0KiuhzcKrVyXYkZIIOxzTQskiWqMDBoXFb/bsT
         CbiQ==
X-Gm-Message-State: AOAM532xJEFmJpn62HzD9U4UzXA9n6F5V6mJuELF+pwDDqmivp1SLOwK
        lUMPrTWpcLpZ++fTRf7xL6a7Ew==
X-Google-Smtp-Source: ABdhPJzgdpJKzdh0Z7/Ixx6DmwTqWbM+l3YLKx7fvymTBFfXMek7eKSHLlh0kohA3cb0UMcaEODvqA==
X-Received: by 2002:a5d:6a4f:: with SMTP id t15mr3390316wrw.126.1603270634157;
        Wed, 21 Oct 2020 01:57:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:57:13 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Subject: [PATCH v3 08/16] s390/pci: Remove races against pte updates
Date:   Wed, 21 Oct 2020 10:56:47 +0200
Message-Id: <20201021085655.1192025-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Way back it was a reasonable assumptions that iomem mappings never
change the pfn range they point at. But this has changed:

- gpu drivers dynamically manage their memory nowadays, invalidating
ptes with unmap_mapping_range when buffers get moved

- contiguous dma allocations have moved from dedicated carvetouts to
cma regions. This means if we miss the unmap the pfn might contain
pagecache or anon memory (well anything allocated with GFP_MOVEABLE)

- even /dev/mem now invalidates mappings when the kernel requests that
iomem region when CONFIG_IO_STRICT_DEVMEM is set, see commit
3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims the
region")

Accessing pfns obtained from ptes without holding all the locks is
therefore no longer a good idea. Fix this.

Since zpci_memcpy_from|toio seems to not do anything nefarious with
locks we just need to open code get_pfn and follow_pfn and make sure
we drop the locks only after we're done. The write function also needs
the copy_from_user move, since we can't take userspace faults while
holding the mmap sem.

v2: Move VM_IO | VM_PFNMAP checks around so they keep returning EINVAL
like before (Gerard)

v3: Polish commit message (Niklas)

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
---
 arch/s390/pci/pci_mmio.c | 98 +++++++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 41 deletions(-)

diff --git a/arch/s390/pci/pci_mmio.c b/arch/s390/pci/pci_mmio.c
index 401cf670a243..1a6adbc68ee8 100644
--- a/arch/s390/pci/pci_mmio.c
+++ b/arch/s390/pci/pci_mmio.c
@@ -119,33 +119,15 @@ static inline int __memcpy_toio_inuser(void __iomem *dst,
 	return rc;
 }
 
-static long get_pfn(unsigned long user_addr, unsigned long access,
-		    unsigned long *pfn)
-{
-	struct vm_area_struct *vma;
-	long ret;
-
-	mmap_read_lock(current->mm);
-	ret = -EINVAL;
-	vma = find_vma(current->mm, user_addr);
-	if (!vma)
-		goto out;
-	ret = -EACCES;
-	if (!(vma->vm_flags & access))
-		goto out;
-	ret = follow_pfn(vma, user_addr, pfn);
-out:
-	mmap_read_unlock(current->mm);
-	return ret;
-}
-
 SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
 		const void __user *, user_buffer, size_t, length)
 {
 	u8 local_buf[64];
 	void __iomem *io_addr;
 	void *buf;
-	unsigned long pfn;
+	struct vm_area_struct *vma;
+	pte_t *ptep;
+	spinlock_t *ptl;
 	long ret;
 
 	if (!zpci_is_enabled())
@@ -158,7 +140,7 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
 	 * We only support write access to MIO capable devices if we are on
 	 * a MIO enabled system. Otherwise we would have to check for every
 	 * address if it is a special ZPCI_ADDR and would have to do
-	 * a get_pfn() which we don't need for MIO capable devices.  Currently
+	 * a pfn lookup which we don't need for MIO capable devices.  Currently
 	 * ISM devices are the only devices without MIO support and there is no
 	 * known need for accessing these from userspace.
 	 */
@@ -176,21 +158,37 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
 	} else
 		buf = local_buf;
 
-	ret = get_pfn(mmio_addr, VM_WRITE, &pfn);
+	ret = -EFAULT;
+	if (copy_from_user(buf, user_buffer, length))
+		goto out_free;
+
+	mmap_read_lock(current->mm);
+	ret = -EINVAL;
+	vma = find_vma(current->mm, mmio_addr);
+	if (!vma)
+		goto out_unlock_mmap;
+	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
+		goto out_unlock_mmap;
+	ret = -EACCES;
+	if (!(vma->vm_flags & VM_WRITE))
+		goto out_unlock_mmap;
+
+	ret = follow_pte_pmd(vma->vm_mm, mmio_addr, NULL, &ptep, NULL, &ptl);
 	if (ret)
-		goto out;
-	io_addr = (void __iomem *)((pfn << PAGE_SHIFT) |
+		goto out_unlock_mmap;
+
+	io_addr = (void __iomem *)((pte_pfn(*ptep) << PAGE_SHIFT) |
 			(mmio_addr & ~PAGE_MASK));
 
-	ret = -EFAULT;
 	if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE)
-		goto out;
-
-	if (copy_from_user(buf, user_buffer, length))
-		goto out;
+		goto out_unlock_pt;
 
 	ret = zpci_memcpy_toio(io_addr, buf, length);
-out:
+out_unlock_pt:
+	pte_unmap_unlock(ptep, ptl);
+out_unlock_mmap:
+	mmap_read_unlock(current->mm);
+out_free:
 	if (buf != local_buf)
 		kfree(buf);
 	return ret;
@@ -274,7 +272,9 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, mmio_addr,
 	u8 local_buf[64];
 	void __iomem *io_addr;
 	void *buf;
-	unsigned long pfn;
+	struct vm_area_struct *vma;
+	pte_t *ptep;
+	spinlock_t *ptl;
 	long ret;
 
 	if (!zpci_is_enabled())
@@ -287,7 +287,7 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, mmio_addr,
 	 * We only support read access to MIO capable devices if we are on
 	 * a MIO enabled system. Otherwise we would have to check for every
 	 * address if it is a special ZPCI_ADDR and would have to do
-	 * a get_pfn() which we don't need for MIO capable devices.  Currently
+	 * a pfn lookup which we don't need for MIO capable devices.  Currently
 	 * ISM devices are the only devices without MIO support and there is no
 	 * known need for accessing these from userspace.
 	 */
@@ -306,22 +306,38 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, mmio_addr,
 		buf = local_buf;
 	}
 
-	ret = get_pfn(mmio_addr, VM_READ, &pfn);
+	mmap_read_lock(current->mm);
+	ret = -EINVAL;
+	vma = find_vma(current->mm, mmio_addr);
+	if (!vma)
+		goto out_unlock_mmap;
+	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
+		goto out_unlock_mmap;
+	ret = -EACCES;
+	if (!(vma->vm_flags & VM_WRITE))
+		goto out_unlock_mmap;
+
+	ret = follow_pte_pmd(vma->vm_mm, mmio_addr, NULL, &ptep, NULL, &ptl);
 	if (ret)
-		goto out;
-	io_addr = (void __iomem *)((pfn << PAGE_SHIFT) | (mmio_addr & ~PAGE_MASK));
+		goto out_unlock_mmap;
+
+	io_addr = (void __iomem *)((pte_pfn(*ptep) << PAGE_SHIFT) |
+			(mmio_addr & ~PAGE_MASK));
 
 	if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE) {
 		ret = -EFAULT;
-		goto out;
+		goto out_unlock_pt;
 	}
 	ret = zpci_memcpy_fromio(buf, io_addr, length);
-	if (ret)
-		goto out;
-	if (copy_to_user(user_buffer, buf, length))
+
+out_unlock_pt:
+	pte_unmap_unlock(ptep, ptl);
+out_unlock_mmap:
+	mmap_read_unlock(current->mm);
+
+	if (!ret && copy_to_user(user_buffer, buf, length))
 		ret = -EFAULT;
 
-out:
 	if (buf != local_buf)
 		kfree(buf);
 	return ret;
-- 
2.28.0

