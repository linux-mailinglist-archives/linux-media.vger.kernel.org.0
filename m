Return-Path: <linux-media+bounces-22632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DF09E3F1C
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 17:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81A7CB30BE7
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 15:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F319A1BC9F0;
	Wed,  4 Dec 2024 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="GezznGjh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0931C205E1C;
	Wed,  4 Dec 2024 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325470; cv=none; b=JEK2HaXbzWFXWLX9fb3+5vRlIoqdkXygLJjSVs+2XmX088W6D/hcyKtcweP9lMN3ymT41JOevn8FKiteoWUdsOe3CM9pyPKqoSfmEUNQy0voCsyQmCQ+8hWwiZZXWAapboocqafAG3ySL0wHcIp5v1Nz4Imz9FvWOVP1mANjitI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325470; c=relaxed/simple;
	bh=imTyW5qs4VLxVBzu/Kz01yfJYL47jAGErlyACSyqeFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MeTsixYBZZW82iAO5kfBfZpYeLa7vsqk4flmyEhtrESg7m4mhitWc6KWG3h4KORqrWaF9KuvSWopmIM9JcAIvjjpyp9X6dyLMBgRifg8r1xf0+NsfUeQYkLCgTsqMbfAdkZ5RC/YMQw2qg5LFAsj4LsOMAFW+Sssdih3jzpzvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=GezznGjh; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Andrey Kalachev <kalachev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1733325457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stfWGS3BClOC/+OPYKfYd33IKMOm/Qu4X4Okloj0fNw=;
	b=GezznGjhNo2/JXbSl4qJFmrYCJR3E6vHvG9hTFOll3zaVmZ5aUwJXcvmtO1MwHKxlxlinC
	N9yi7MYwVfxvfhUjMwTK+upuFQfDpuNtpseSHA6P/Hy5xCoMMSyoKER+RoHCABxqKhPqnr
	tvxtpYHFsGwuOCrNUkHb3WUOWvlqi1A=
To: stable@vger.kernel.org
Cc: vivek.kasireddy@intel.com,
	kraxel@redhat.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kalachev@swemel.ru,
	lvc-project@linuxtesting.org
Subject: [PATCH v5.4-v6.1] udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap
Date: Wed,  4 Dec 2024 18:17:35 +0300
Message-Id: <20241204151735.141277-3-kalachev@swemel.ru>
In-Reply-To: <20241204151735.141277-1-kalachev@swemel.ru>
References: <20241204151735.141277-1-kalachev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

[ Upstream commit 7d79cd784470395539bda91bf0b3505ff5b2ab6d ]

Add VM_PFNMAP to vm_flags in the mmap handler to ensure that the mappings
would be managed without using struct page.

And, in the vm_fault handler, use vmf_insert_pfn to share the page's pfn
to userspace instead of directly sharing the page (via struct page *).

Link: https://lkml.kernel.org/r/20240624063952.1572359-6-vivek.kasireddy@intel.com
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Dave Airlie <airlied@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reported-by: syzbot+3d218f7b6c5511a83a79@syzkaller.appspotmail.com
[ Andrey: Backport required minor change: replace call
to vm_flags_set() in mmap_udmabuf() by direct
modification of the vma->vm_flags, because the set
of vm_flags_*() functions is not in this versions. ]
Signed-off-by: Andrey Kalachev <kalachev@swemel.ru>
---
 drivers/dma-buf/udmabuf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 2bcdb935a3ac..e57d57a10bb0 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -33,12 +33,13 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct udmabuf *ubuf = vma->vm_private_data;
 	pgoff_t pgoff = vmf->pgoff;
+	unsigned long pfn;
 
 	if (pgoff >= ubuf->pagecount)
 		return VM_FAULT_SIGBUS;
-	vmf->page = ubuf->pages[pgoff];
-	get_page(vmf->page);
-	return 0;
+
+	pfn = page_to_pfn(ubuf->pages[pgoff]);
+	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
 static const struct vm_operations_struct udmabuf_vm_ops = {
@@ -54,6 +55,7 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 
 	vma->vm_ops = &udmabuf_vm_ops;
 	vma->vm_private_data = ubuf;
+	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
 	return 0;
 }
 
-- 
2.30.2


