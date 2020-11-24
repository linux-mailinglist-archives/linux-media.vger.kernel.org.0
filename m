Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958382C2B91
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 16:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389805AbgKXPjF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 10:39:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389808AbgKXPiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 10:38:50 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A22C061A4D
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:38:50 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so22742384wrb.9
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mn1wB4UIIJYCPFpu55sy3LOHzNh5rEWUlXSp9HWhrTs=;
        b=n2RkEUROrYeufAtCSKDWr3fmq/B5Dj/1/iujvWXNBpKVXM46G14POxuNtrvFGvG4xS
         65IlJ8mFMtlZ+DEw0CCukK4ngUegaZeo8SVlB1Gy+ncs+XC07IzM0JfpHRFMuhx4DL+q
         Rc6TA7y3GVyTSBWrC+0pOexy8rwtT88yGy6aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mn1wB4UIIJYCPFpu55sy3LOHzNh5rEWUlXSp9HWhrTs=;
        b=eKtOQOU1/uaqrTmuIokr3P/r9aPf9O8UvWafvpI5nKhfmKo6vVJF4WgHiPCQmGpoxs
         4JOWMn5wHvJ97mIm226fh7Th9/a/Id5Qpbr8mqFUwJ/etbgo/+Cc4xcsVZe9f5mlWc2G
         N33QvabW3CIRtJ8KFHNgaLIyyBXnqFMRCsl9t9/r4zSuvKvnEBfIm5V2o7E91Tb87j5d
         EAJBEuGW0/nK71wFMiSO2WT4xhu9abdPCU/MV0JL5i8JiuiIbB58iDg1eZw6VoUVwKeY
         VkIgR7vLaJ6ts3iOQbPV6JJY1wJLZLER+PWmLLkYEYldDVD0/QQcf2XGODT+16NwZtSI
         o4xg==
X-Gm-Message-State: AOAM532k42bOCxjDkNg8LjFqwtRTU5QVD2JqR33rJJMTBO10MBedrsx2
        drr2IHWj7YOp5ne5Xuk82QL1Eg==
X-Google-Smtp-Source: ABdhPJzJQS12dAtHSIto+AkUackkC3dZ1AW4aqhTl1qwf4siZheZKe0WXY06YOIImYJlDwLUTKFQtw==
X-Received: by 2002:adf:e80b:: with SMTP id o11mr5939427wrm.409.1606232329253;
        Tue, 24 Nov 2020 07:38:49 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id 25sm5814752wmk.19.2020.11.24.07.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:38:48 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: [PATCH 3/6] dma-iommu: remove __iommu_dma_mmap
Date:   Tue, 24 Nov 2020 16:38:42 +0100
Message-Id: <20201124153845.132207-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201124153845.132207-1-ribalda@chromium.org>
References: <20201124153845.132207-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>

The function has a single caller, so open code it there and take
advantage of the precalculated page count variable.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 73249732afd3..a2fb92de7e3d 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -655,21 +655,6 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	return NULL;
 }
 
-/**
- * __iommu_dma_mmap - Map a buffer into provided user VMA
- * @pages: Array representing buffer from __iommu_dma_alloc()
- * @size: Size of buffer in bytes
- * @vma: VMA describing requested userspace mapping
- *
- * Maps the pages of the buffer in @pages into @vma. The caller is responsible
- * for verifying the correct size and protection of @vma beforehand.
- */
-static int __iommu_dma_mmap(struct page **pages, size_t size,
-		struct vm_area_struct *vma)
-{
-	return vm_map_pages(vma, pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
-}
-
 static void iommu_dma_sync_single_for_cpu(struct device *dev,
 		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
 {
@@ -1074,7 +1059,7 @@ static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		struct page **pages = dma_common_find_pages(cpu_addr);
 
 		if (pages)
-			return __iommu_dma_mmap(pages, size, vma);
+			return vm_map_pages(vma, pages, nr_pages);
 		pfn = vmalloc_to_pfn(cpu_addr);
 	} else {
 		pfn = page_to_pfn(virt_to_page(cpu_addr));
-- 
2.29.2.454.gaff20da3a2-goog

