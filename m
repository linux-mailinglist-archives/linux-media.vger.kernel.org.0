Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA472A026E
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgJ3KKS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgJ3KIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:08:50 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAB9C0613DD
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:08:49 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n18so5790719wrs.5
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HiI1+lLgMnsDQrYrNhRZjnVGpkNPEsmr7OdQwQZ1pJM=;
        b=Gcc++IpNNygNqtJu4MOWlOxXDTLkz8kWRrWBTguDYU0QSDOK1lmStqYhCY80JP1x87
         nnoIM/kxhaqSCxhTbtNStA1+u8N8i8vvYmmr+2qlMbzhOp1A6XcFYXNVmwMv8phCp320
         uR7glXXilJAM58uJT7pnvEqFSZFFav+qZ48X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HiI1+lLgMnsDQrYrNhRZjnVGpkNPEsmr7OdQwQZ1pJM=;
        b=tqNDpesGnJLe2lQSt4ZANFBdI8IdFu/+I9X6RD+siAu8gTeIPvkC8sZEHbH/XGkZlz
         xDfIZ84Q3fgI/72/IuOF7r32gNZXVR+XlmuMoi/0J5xqlI5coMrrfqIYEDGAWaZRlXKB
         7KpE1smtcH75wb1pYUROu7LT9Ke1A4UQSsZr2LIUghF7Ue2xSgHVFQykdBEkWK8XJBi0
         GB5wIazXJB2RdfnwQQ/jHqU0EB9haeXRuDOjy4OHv7vic8SFzvsXptFaLqgUwIyID00U
         EYyM7A6WgX7W3OAl9dXQCgL57rZUNnzXNd23+iYOo9hwzb7pn6pEjZ9NuIq138rHV4F8
         /QcA==
X-Gm-Message-State: AOAM532gz6wSb8nTfbHcWIpNh8v9EVNjCTEpkJ6rEaTGstT8DoRK2iJF
        BnRyTWKM+ERNmDkVPZS1ZOzl9w==
X-Google-Smtp-Source: ABdhPJz2EbQLLd9y23l7XD4h1NQjvIRRCqqxxXIiiwxNslHpfrfcptIiI2iHPCasY7SN1JKAQAi14g==
X-Received: by 2002:a5d:4d8a:: with SMTP id b10mr2128836wru.5.1604052527823;
        Fri, 30 Oct 2020 03:08:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 03:08:46 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Benjamin Herrensmidt <benh@kernel.crashing.org>,
        Dave Airlie <airlied@linux.ie>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH v5 07/15] mm: Close race in generic_access_phys
Date:   Fri, 30 Oct 2020 11:08:07 +0100
Message-Id: <20201030100815.2269-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
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
  iomem region when CONFIG_IO_STRICT_DEVMEM is set, see 3234ac664a87
  ("/dev/mem: Revoke mappings when a driver claims the region")

Accessing pfns obtained from ptes without holding all the locks is
therefore no longer a good idea. Fix this.

Since ioremap might need to manipulate pagetables too we need to drop
the pt lock and have a retry loop if we raced.

While at it, also add kerneldoc and improve the comment for the
vma_ops->access function. It's for accessing, not for moving the
memory from iomem to system memory, as the old comment seemed to
suggest.

References: 28b2ee20c7cb ("access_process_vm device memory infrastructure")
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Benjamin Herrensmidt <benh@kernel.crashing.org>
Cc: Dave Airlie <airlied@linux.ie>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v2: Fix inversion in the retry check (John).

v4: While at it, use offset_in_page (Chris Wilson)
---
 include/linux/mm.h |  3 ++-
 mm/memory.c        | 46 +++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 179dbb78d08d..83d0be101a38 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -574,7 +574,8 @@ struct vm_operations_struct {
 	vm_fault_t (*pfn_mkwrite)(struct vm_fault *vmf);
 
 	/* called by access_process_vm when get_user_pages() fails, typically
-	 * for use by special VMAs that can switch between memory and hardware
+	 * for use by special VMAs. See also generic_access_phys() for a generic
+	 * implementation useful for any iomem mapping.
 	 */
 	int (*access)(struct vm_area_struct *vma, unsigned long addr,
 		      void *buf, int len, int write);
diff --git a/mm/memory.c b/mm/memory.c
index c48f8df6e502..ac32039ce941 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4847,28 +4847,68 @@ int follow_phys(struct vm_area_struct *vma,
 	return ret;
 }
 
+/**
+ * generic_access_phys - generic implementation for iomem mmap access
+ * @vma: the vma to access
+ * @addr: userspace addres, not relative offset within @vma
+ * @buf: buffer to read/write
+ * @len: length of transfer
+ * @write: set to FOLL_WRITE when writing, otherwise reading
+ *
+ * This is a generic implementation for &vm_operations_struct.access for an
+ * iomem mapping. This callback is used by access_process_vm() when the @vma is
+ * not page based.
+ */
 int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
 			void *buf, int len, int write)
 {
 	resource_size_t phys_addr;
 	unsigned long prot = 0;
 	void __iomem *maddr;
-	int offset = addr & (PAGE_SIZE-1);
+	pte_t *ptep, pte;
+	spinlock_t *ptl;
+	int offset = offset_in_page(addr);
+	int ret = -EINVAL;
+
+	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
+		return -EINVAL;
+
+retry:
+	if (follow_pte(vma->vm_mm, addr, &ptep, &ptl))
+		return -EINVAL;
+	pte = *ptep;
+	pte_unmap_unlock(ptep, ptl);
 
-	if (follow_phys(vma, addr, write, &prot, &phys_addr))
+	prot = pgprot_val(pte_pgprot(pte));
+	phys_addr = (resource_size_t)pte_pfn(pte) << PAGE_SHIFT;
+
+	if ((write & FOLL_WRITE) && !pte_write(pte))
 		return -EINVAL;
 
 	maddr = ioremap_prot(phys_addr, PAGE_ALIGN(len + offset), prot);
 	if (!maddr)
 		return -ENOMEM;
 
+	if (follow_pte(vma->vm_mm, addr, &ptep, &ptl))
+		goto out_unmap;
+
+	if (!pte_same(pte, *ptep)) {
+		pte_unmap_unlock(ptep, ptl);
+		iounmap(maddr);
+
+		goto retry;
+	}
+
 	if (write)
 		memcpy_toio(maddr + offset, buf, len);
 	else
 		memcpy_fromio(buf, maddr + offset, len);
+	ret = len;
+	pte_unmap_unlock(ptep, ptl);
+out_unmap:
 	iounmap(maddr);
 
-	return len;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(generic_access_phys);
 #endif
-- 
2.28.0

