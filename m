Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37D0410027B
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 11:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfKRKf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 05:35:57 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40163 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfKRKf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 05:35:57 -0500
Received: by mail-wm1-f66.google.com with SMTP id f3so18131299wmc.5
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 02:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4O+DjGncRXcJcCFVpP6ISG8p76MxWaTQU3Lx36GPcdQ=;
        b=WbswzU5pI8SKc9yH4T6lbGLhKN25UJ64jwCotkeqm34/v60ZMkRtIhODOo1ghT1bUn
         DbCz7OE9RWFJl4niEsxrAiQlzlsZNAwhWWLZlPi6Qt4ljGdJMiGFd/Mvr21J+cm1onoF
         FjXZNlkuHSX/DNdTrPRTel+m/U2+c2Mz68ZWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4O+DjGncRXcJcCFVpP6ISG8p76MxWaTQU3Lx36GPcdQ=;
        b=e+NHapIfSdmPpGrzOZe8aUEynPVfxlwOjja+j93DS3RKNfHY2AE/+fUw+PX0IvPIfC
         /qID6goFXZ/iiO+318lCdvRH1d3y+mXoHbTdYJar5ILSMvf8dcXhMxuj0V+Mh9+86oJV
         +PZuBUgJ1EHdFXPT9mKmuRlzgg/AzIW5kJBtGPgMyn0q/G8yxR2kAy7OK5XgiAoyvPeS
         1fMQbv7la68XPMH6eHcjFd76Bcht9+mQP+gVYI2jmtQdx0CiApAXsIP9OhmCoaan+ObS
         KP0WGYH+jAaapqCs7sOb/Qt8EYuGRCuZcgKLVusnxBDTSDTAllUi8PdZTB59KjaVKeZ7
         i6jg==
X-Gm-Message-State: APjAAAXG+eJUtpuYvQxY/dU5RadlEscxnLOMWWk+7Pb+Nk7LWR2CjHaC
        vLL6JmpBaKIftk3onq9x2AwBhA==
X-Google-Smtp-Source: APXvYqz4u4XBXXkK/g/yh/sAL9UFiIBiNKvdy+aixEZ5b4x6OZa08ED1jN1Wv+ckjyTyBl/PJJyLJQ==
X-Received: by 2002:a1c:113:: with SMTP id 19mr29872833wmb.42.1574073354440;
        Mon, 18 Nov 2019 02:35:54 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 02:35:53 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/15] dma-buf: Drop dma_buf_k(un)map
Date:   Mon, 18 Nov 2019 11:35:30 +0100
Message-Id: <20191118103536.17675-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's unused.

10 years ago, back when 32bit was still fairly common and trying to
not exhaust vmalloc space sounded like a worthwhile goal, adding these
to dma_buf made sense.

Reality is that they simply never caught on, and nowadays everyone who
needs plenty of buffers will run in 64bit mode anyway.

Also update the docs in this area to adjust them to reality.

The actual hooks in dma_buf_ops will be removed once all the
implementations are gone.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-buf.c | 63 ++-------------------------------------
 include/linux/dma-buf.h   |  2 --
 2 files changed, 3 insertions(+), 62 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d377b4ca66bf..97988ce1d2dc 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -880,29 +880,9 @@ EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
  *   with calls to dma_buf_begin_cpu_access() and dma_buf_end_cpu_access()
  *   access.
  *
- *   To support dma_buf objects residing in highmem cpu access is page-based
- *   using an api similar to kmap. Accessing a dma_buf is done in aligned chunks
- *   of PAGE_SIZE size. Before accessing a chunk it needs to be mapped, which
- *   returns a pointer in kernel virtual address space. Afterwards the chunk
- *   needs to be unmapped again. There is no limit on how often a given chunk
- *   can be mapped and unmapped, i.e. the importer does not need to call
- *   begin_cpu_access again before mapping the same chunk again.
- *
- *   Interfaces::
- *      void \*dma_buf_kmap(struct dma_buf \*, unsigned long);
- *      void dma_buf_kunmap(struct dma_buf \*, unsigned long, void \*);
- *
- *   Implementing the functions is optional for exporters and for importers all
- *   the restrictions of using kmap apply.
- *
- *   dma_buf kmap calls outside of the range specified in begin_cpu_access are
- *   undefined. If the range is not PAGE_SIZE aligned, kmap needs to succeed on
- *   the partial chunks at the beginning and end but may return stale or bogus
- *   data outside of the range (in these partial chunks).
- *
- *   For some cases the overhead of kmap can be too high, a vmap interface
- *   is introduced. This interface should be used very carefully, as vmalloc
- *   space is a limited resources on many architectures.
+ *   Since for most kernel internal dma-buf accesses need the entire buffer, a
+ *   vmap interface is introduced. Note that on very old 32-bit architectures
+ *   vmalloc space might be limited and result in vmap calls failing.
  *
  *   Interfaces::
  *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
@@ -1052,43 +1032,6 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 }
 EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
 
-/**
- * dma_buf_kmap - Map a page of the buffer object into kernel address space. The
- * same restrictions as for kmap and friends apply.
- * @dmabuf:	[in]	buffer to map page from.
- * @page_num:	[in]	page in PAGE_SIZE units to map.
- *
- * This call must always succeed, any necessary preparations that might fail
- * need to be done in begin_cpu_access.
- */
-void *dma_buf_kmap(struct dma_buf *dmabuf, unsigned long page_num)
-{
-	WARN_ON(!dmabuf);
-
-	if (!dmabuf->ops->map)
-		return NULL;
-	return dmabuf->ops->map(dmabuf, page_num);
-}
-EXPORT_SYMBOL_GPL(dma_buf_kmap);
-
-/**
- * dma_buf_kunmap - Unmap a page obtained by dma_buf_kmap.
- * @dmabuf:	[in]	buffer to unmap page from.
- * @page_num:	[in]	page in PAGE_SIZE units to unmap.
- * @vaddr:	[in]	kernel space pointer obtained from dma_buf_kmap.
- *
- * This call must always succeed.
- */
-void dma_buf_kunmap(struct dma_buf *dmabuf, unsigned long page_num,
-		    void *vaddr)
-{
-	WARN_ON(!dmabuf);
-
-	if (dmabuf->ops->unmap)
-		dmabuf->ops->unmap(dmabuf, page_num, vaddr);
-}
-EXPORT_SYMBOL_GPL(dma_buf_kunmap);
-
 
 /**
  * dma_buf_mmap - Setup up a userspace mmap with the given vma
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index af73f835c51c..7feb9c3805ae 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -464,8 +464,6 @@ int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
 int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
 			   enum dma_data_direction dir);
-void *dma_buf_kmap(struct dma_buf *, unsigned long);
-void dma_buf_kunmap(struct dma_buf *, unsigned long, void *);
 
 int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
-- 
2.24.0

