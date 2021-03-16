Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB70633D7A1
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 16:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbhCPPdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 11:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238112AbhCPPdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 11:33:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD72FC0613D7
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 08:33:16 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id o16so7656853wrn.0
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwe0ekXmy9t5eNr3sFs9jCzA/xhMldV8JLAydoSdCfc=;
        b=GzG+edIxhOWO3e0C//e9ZTvwmWIMqXUh3qVGupEH1XpIfgojiM9nr7zfSbfVnLpEX1
         TppZD/lYq2BFxWK6uExvqhTf4cGvOaXXXtjYXrDDvq/txY4i5BzARGuD/BQ+Nc/vZ9CP
         U43D7zJSOobDqMzHTu1jMNW+6MtVYMmXPpabc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwe0ekXmy9t5eNr3sFs9jCzA/xhMldV8JLAydoSdCfc=;
        b=ob450YSgsmq+Ps/BV4B5r3Mwb3+CyKaU3runh4+NznhkZByQTSLLutp7+7w+2VuSj7
         sNYp9ZMp/G2YQsVaSx35zoa5+XVvRZtfOXrSrmaEju6qAL/S43amHPsZmYnauMP7wCFe
         fwf1nGnmrmYrn997ysJiWVsxM8iX6F1qQit6FVm4l6CLZpusGatkktckix2GEUqWxQcc
         VoZy3BQ0BNXqsn4QChBb5dtu0I/znW0vqKn6wnUXFlxO3bUFm6t0kZAYLOhdHlWzd12m
         xaoKqDCgFudXa3i5My2eqWbHRHfaa9m1NwE65hJFAiq88+F6hLV1S4e6nuV3A+57mw18
         SmEg==
X-Gm-Message-State: AOAM531UVUkRS0RCHpaZRiP0IyDagvH/O0rvoFet7fBXAf2JYq7LkFE2
        Sy4Eyck0UJ0Ipiv0/2JJTJfzTw==
X-Google-Smtp-Source: ABdhPJxsQT1ztD0lh1/0ccaL0ZTcHbZx32nTGgPOptwOia/Vap2jPDUXToCOLm5fL6HRJJsLfse8jA==
X-Received: by 2002:adf:ec0b:: with SMTP id x11mr5396504wrn.175.1615908795642;
        Tue, 16 Mar 2021 08:33:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h22sm3985078wmb.36.2021.03.16.08.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 08:33:15 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>, 3pvd@google.com,
        Jann Horn <jannh@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 3/3] mm: unexport follow_pfn
Date:   Tue, 16 Mar 2021 16:33:03 +0100
Message-Id: <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
follow_pte()")) have lost their callsites of follow_pfn(). All the
other ones have been switched over to unsafe_follow_pfn because they
cannot be fixed without breaking userspace api.

Argueably the vfio code is still racy, but that's kinda a bigger
picture. But since it does leak the pte beyond where it drops the pt
lock, without anything else like an mmu notifier guaranteeing
coherence, the problem is at least clearly visible in the vfio code.
So good enough with me.

I've decided to keep the explanation that after dropping the pt lock
you must have an mmu notifier if you keep using the pte somehow by
adjusting it and moving it into the kerneldoc for the new follow_pte()
function.

Cc: 3pvd@google.com
Cc: Jann Horn <jannh@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: kvm@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 include/linux/mm.h |  2 --
 mm/memory.c        | 26 +++++---------------------
 mm/nommu.c         | 13 +------------
 3 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index caec8b25d66f..304588e2f829 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1693,8 +1693,6 @@ int follow_invalidate_pte(struct mm_struct *mm, unsigned long address,
 			  pmd_t **pmdpp, spinlock_t **ptlp);
 int follow_pte(struct mm_struct *mm, unsigned long address,
 	       pte_t **ptepp, spinlock_t **ptlp);
-int follow_pfn(struct vm_area_struct *vma, unsigned long address,
-	unsigned long *pfn);
 int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
 		      unsigned long *pfn);
 int follow_phys(struct vm_area_struct *vma, unsigned long address,
diff --git a/mm/memory.c b/mm/memory.c
index e8a145505b69..317e653c8aeb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4724,7 +4724,10 @@ int follow_invalidate_pte(struct mm_struct *mm, unsigned long address,
  * should be taken for read.
  *
  * KVM uses this function.  While it is arguably less bad than ``follow_pfn``,
- * it is not a good general-purpose API.
+ * it is not a good general-purpose API: If callers use the pte after they've
+ * unlocked @ptlp they must ensure coherency with pte updates by using a
+ * &mmu_notifier to follow updates. Any caller not following these requirements
+ * must use unsafe_follow_pfn() instead.
  *
  * Return: zero on success, -ve otherwise.
  */
@@ -4735,25 +4738,7 @@ int follow_pte(struct mm_struct *mm, unsigned long address,
 }
 EXPORT_SYMBOL_GPL(follow_pte);
 
-/**
- * follow_pfn - look up PFN at a user virtual address
- * @vma: memory mapping
- * @address: user virtual address
- * @pfn: location to store found PFN
- *
- * Only IO mappings and raw PFN mappings are allowed. Note that callers must
- * ensure coherency with pte updates by using a &mmu_notifier to follow updates.
- * If this is not feasible, or the access to the @pfn is only very short term,
- * use follow_pte_pmd() instead and hold the pagetable lock for the duration of
- * the access instead. Any caller not following these requirements must use
- * unsafe_follow_pfn() instead.
- *
- * This function does not allow the caller to read the permissions
- * of the PTE.  Do not use it.
- *
- * Return: zero and the pfn at @pfn on success, -ve otherwise.
- */
-int follow_pfn(struct vm_area_struct *vma, unsigned long address,
+static int follow_pfn(struct vm_area_struct *vma, unsigned long address,
 	unsigned long *pfn)
 {
 	int ret = -EINVAL;
@@ -4770,7 +4755,6 @@ int follow_pfn(struct vm_area_struct *vma, unsigned long address,
 	pte_unmap_unlock(ptep, ptl);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(follow_pfn);
 
 /**
  * unsafe_follow_pfn - look up PFN at a user virtual address
diff --git a/mm/nommu.c b/mm/nommu.c
index 1dc983f50e2c..cee29d0791b3 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -111,17 +111,7 @@ unsigned int kobjsize(const void *objp)
 	return page_size(page);
 }
 
-/**
- * follow_pfn - look up PFN at a user virtual address
- * @vma: memory mapping
- * @address: user virtual address
- * @pfn: location to store found PFN
- *
- * Only IO mappings and raw PFN mappings are allowed.
- *
- * Returns zero and the pfn at @pfn on success, -ve otherwise.
- */
-int follow_pfn(struct vm_area_struct *vma, unsigned long address,
+static int follow_pfn(struct vm_area_struct *vma, unsigned long address,
 	unsigned long *pfn)
 {
 	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
@@ -130,7 +120,6 @@ int follow_pfn(struct vm_area_struct *vma, unsigned long address,
 	*pfn = address >> PAGE_SHIFT;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(follow_pfn);
 
 /**
  * unsafe_follow_pfn - look up PFN at a user virtual address
-- 
2.30.0

