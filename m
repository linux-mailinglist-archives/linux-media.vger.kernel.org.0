Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07273634231
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 18:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbiKVRIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 12:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbiKVRIH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 12:08:07 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48411A81C
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 09:08:05 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id n3so9146409wrp.5
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve9qToTAjko4Xn5/rlkROCfUSo37Rgk78oiOnmwUwAU=;
        b=UTgjIRpLOL/7otFlPM7wX91GWVEbyelUoIOfxeC6ZhL8WuxwL4Nb7rXb4HD1EytWRF
         fM6S4/NXWz/8WrAreoT9cPW/bjXslVl/BKUmEg5pyx6M4Uaclx3FjX7vn4vXq8ig0wzL
         rCBB7/W7XRNLC+tcLw3TAl4no/GdXkQLmuKTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve9qToTAjko4Xn5/rlkROCfUSo37Rgk78oiOnmwUwAU=;
        b=oX8FO7mK92kShFzDa91a6kQInGZ4HyRaYKSN+ffSpf8GUZC9155/FR2k6okdzKBiYL
         DnQPx7DCtZLMLy4He5JLqgZ4D+ZvdiMhsReJqitltNiJ16fZXrFgPqNB3oXxnsFrd031
         PKk1CRc/IXa+UTu0zfA4vj7pMygwP6dmeJF5j3DdabwomLfiS19NWP9K50Dvfe5k8QK3
         JWhkFTxaE0E3UZpqk9AR4XHGP7f23plzS2dJ6rqyLrG+rKKqX1/466NRBUhtWcliBtXv
         ZrW7OGobFyfkTieUYDxwZ6dDjZbQijT8vUUAqfDX2Aj6pcwb5zmTtgADk3hLRcUXdGCP
         dDgg==
X-Gm-Message-State: ANoB5plZpcJc1DDjNkPqSz0VLghCaepmX3QVu+zgi5K9Eevt7hcgUa8S
        iLxYWTDEHnJkWSAOfVNV2XGIdA==
X-Google-Smtp-Source: AA0mqf74IZLJygrpyRzf5qHhhvP3A1tbMBtTE6ln+kXNQdMnkp0LHZho99MMNt+23oEZ2UGDXNYLyA==
X-Received: by 2002:a5d:6547:0:b0:241:e4cc:f044 with SMTP id z7-20020a5d6547000000b00241e4ccf044mr2164424wrv.457.1669136884287;
        Tue, 22 Nov 2022 09:08:04 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id m42-20020a05600c3b2a00b003cf47556f21sm24861760wms.2.2022.11.22.09.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 09:08:03 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
Date:   Tue, 22 Nov 2022 18:08:00 +0100
Message-Id: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tldr; DMA buffers aren't normal memory, expecting that you can use
them like that (like calling get_user_pages works, or that they're
accounting like any other normal memory) cannot be guaranteed.

Since some userspace only runs on integrated devices, where all
buffers are actually all resident system memory, there's a huge
temptation to assume that a struct page is always present and useable
like for any more pagecache backed mmap. This has the potential to
result in a uapi nightmare.

To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
blocks get_user_pages and all the other struct page based
infrastructure for everyone. In spirit this is the uapi counterpart to
the kernel-internal CONFIG_DMABUF_DEBUG.

Motivated by a recent patch which wanted to swich the system dma-buf
heap to vm_insert_page instead of vm_insert_pfn.

v2:

Jason brought up that we also want to guarantee that all ptes have the
pte_special flag set, to catch fast get_user_pages (on architectures
that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.

From auditing the various functions to insert pfn pte entires
(vm_insert_pfn_prot, remap_pfn_range and all it's callers like
dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
this should be the correct flag to check for.

v3: Change to WARN_ON_ONCE (Thomas Zimmermann)

References: https://lore.kernel.org/lkml/CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com/
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
--
Ok I entirely forgot about this patch but stumbled over it and checked
what's up with it no. I think it's ready now for merging:
- shmem helper patches to fix up vgem landed
- ttm has been fixed since a while
- I don't think we've had any other open issues

Time to lock down this uapi contract for real?
-Daniel
---
 drivers/dma-buf/dma-buf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b6c36914e7c6..88718665c3c3 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -150,6 +150,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	ret = dmabuf->ops->mmap(dmabuf, vma);
 	dma_resv_unlock(dmabuf->resv);
 
+	WARN_ON_ONCE(!(vma->vm_flags & VM_PFNMAP));
+
 	return ret;
 }
 
@@ -1495,6 +1497,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	ret = dmabuf->ops->mmap(dmabuf, vma);
 	dma_resv_unlock(dmabuf->resv);
 
+	WARN_ON_ONCE(!(vma->vm_flags & VM_PFNMAP));
+
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
-- 
2.37.2

