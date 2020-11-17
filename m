Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A5F2B6D1F
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 19:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731282AbgKQSTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 13:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731267AbgKQSTu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 13:19:50 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AD6C0613CF;
        Tue, 17 Nov 2020 10:19:50 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id l11so909504plt.1;
        Tue, 17 Nov 2020 10:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q8kidPFG0ShsrD4EKZFHMGOfpY+czdS6PReDEDQbdzA=;
        b=Ss4Iqc3UxqcFxDXwzjylxzWG4tnvFAlp0z7KwhwRCQ6/A4Fiboihyyz+OtkIWWaTmo
         q6HEssaPnI7BWoXCjO9q4ctsz9z0BJ8qo5Gz4QX2L2IYMIS7locnci4Ka/lb9l8YXg0/
         JZ3s21ZPGUd/O05p3sebOK9xJqTqWr0xeYut/4U+lv5Ay1FqnxYPWgG1gnwiNb9y12Ii
         K5OsrIIKQAyZZ9K26oEtFZAquc5g7KSS0Lm4ec6kPD4ZaY4P+2VheOkOtNRP9sYi8HrB
         DKAfd7MnFcRL66vMqz6BmzWkIsvnTqfJtNu9dpk9kL7CAofN8VW5kP0xkzYU6EO66UHw
         kIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=q8kidPFG0ShsrD4EKZFHMGOfpY+czdS6PReDEDQbdzA=;
        b=COHD72/yjwqJZBEg6Ul0iy01tw3p4k46iu8d1i+bpLpa/p5Xra/HkB+y+O9kUJfM+K
         EUR177u552VUh3wwwfeOST8VVhhRxgQsWPfa4rQVVazSaE8e7fAu24FU1Fv+MCLeNJRd
         jJYIek43sBr45tQnFwdXZMte646AwNZpE8sIUADkVOBbJfk8f5aHNwnwXxr1OBP/DK3s
         vw2vU9zPBbIdtDy6X9fxAgutKT2cc6GEVxgSgTA2wil7j5njet7vzaSedxVnMWHySD15
         l4JhrYy+PavggWVIVD/Xslumz+iIivfEUkCNkJdUCagQhmp7a0W2UXrvt+9hAVOde6KY
         057g==
X-Gm-Message-State: AOAM532756mxFEKUdBdXcpudKjTO+7rlxy0ctXiezDralmmZqErVGZvh
        KypZwc88euqcDz2xVqAfiBg=
X-Google-Smtp-Source: ABdhPJyQ446q/Ak38ZEn3hLJs3wvpyQM6zYG9Z6FeiHKyC/wU2GU+8h9b/m1GDAa14eu5Aua13Cu+A==
X-Received: by 2002:a17:902:778d:b029:d7:cd5a:945e with SMTP id o13-20020a170902778db02900d7cd5a945emr384335pll.25.1605637189747;
        Tue, 17 Nov 2020 10:19:49 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id h8sm4302639pjc.54.2020.11.17.10.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 10:19:48 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Minchan Kim <minchan@kernel.org>
Subject: [PATCH 2/4] dma-buf: add export symbol for dma-heap
Date:   Tue, 17 Nov 2020 10:19:33 -0800
Message-Id: <20201117181935.3613581-3-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201117181935.3613581-1-minchan@kernel.org>
References: <20201117181935.3613581-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyesoo Yu <hyesoo.yu@samsung.com>

The heaps could be added as module, so some functions should
be exported to register dma-heaps. And dma-heap of module can use
cma area to allocate and free. However the function related cma
is not exported now. Let's export them for next patches.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 drivers/dma-buf/dma-heap.c | 2 ++
 mm/cma.c                   | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9dbdcf..cc6339cbca09 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -189,6 +189,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL_GPL(dma_heap_get_drvdata);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
@@ -272,6 +273,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL_GPL(dma_heap_add);
 
 static char *dma_heap_devnode(struct device *dev, umode_t *mode)
 {
diff --git a/mm/cma.c b/mm/cma.c
index 7c11ec2dc04c..87834e2966fa 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -54,6 +54,7 @@ const char *cma_get_name(const struct cma *cma)
 {
 	return cma->name;
 }
+EXPORT_SYMBOL_GPL(cma_get_name);
 
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
@@ -498,6 +499,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 	pr_debug("%s(): returned %p\n", __func__, page);
 	return page;
 }
+EXPORT_SYMBOL_GPL(cma_alloc);
 
 /*
  * cma_alloc_bulk() - allocate high order bulk pages from contiguous area with
@@ -641,6 +643,7 @@ bool cma_release(struct cma *cma, const struct page *pages, unsigned int count)
 
 	return true;
 }
+EXPORT_SYMBOL_GPL(cma_release);
 
 int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
 {
-- 
2.29.2.299.gdc1121823c-goog

