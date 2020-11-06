Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D222A95B8
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 12:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgKFLsM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 06:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgKFLsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 06:48:12 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB83C0613CF;
        Fri,  6 Nov 2020 03:48:11 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id k3so1475774ejj.10;
        Fri, 06 Nov 2020 03:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EHBGsJ+axiVeE8GmrzxBefG74B7GrWvtyoVrJ1bJNe4=;
        b=dwBxmPRis0CiuAvK3dpOVlXXCno92VoLNCF1plCpOyt21fe2HVq2z6F84DJPbrQF4y
         0J9okR7YYlAYxRqf+Dz8r9mKuiULzAsOf5AF3Hc/S5Ywjvftp9XrZgxQzWBdZ+eTeYsR
         jWe04yebEH/9RyBNzawmtcYPrsJ0aLi6bS/P6GABAf0jO3H5KVomei5TdK8hJBvTWbb6
         FEKDthSvgXbSF48Z7njmHcOCSPpext8ymP5f9Goy62lvTZc6BnWB7Ez/Ie9LvPYT8r/R
         CzScPtmKb8LsbbGsHY0Mz2nJg0jR4KtUoiLMkvbfsFmGc1jpjoLlQVAL2zaVn1PlXOZq
         XhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EHBGsJ+axiVeE8GmrzxBefG74B7GrWvtyoVrJ1bJNe4=;
        b=HwTIESxnmnpolpE3ypfd8hrai/imnY15iI1QTzsSjQxe+aUwIHC3UfKeiD9JisOdBv
         DdNw6Pvhjrc0cC0+5cXN9PbcGmw4gIzIY/gjCdakWIq548JIFMtz+kP/BtHujDNYUUXJ
         KAgTP61RpmiLZHaqZF6P27SVpPoYb8AuHW4WOSefU/oTHCW2JIXpIqO1HLRKczpGXsjR
         7crFykfr7wwPtDyHLSvhZNuYz/odtKwJMkfbJ3EDBYJiNkSqAIxdEIkFkWG2B5AKW4YS
         9YahkaWlZkJxDw7OZYTmahJpjEKrAgqQzpWU7WJLls93gi16m2nmdLJ2diroXH9kC6Si
         Uatw==
X-Gm-Message-State: AOAM5327th+1TLxgWsV1ri3NoNvU9HkpVnACYal/2YlJmDnNVp8m0D/C
        kmBhZAbMM/giAkgvAg8LXUc=
X-Google-Smtp-Source: ABdhPJzcrRQtSzVw6Cx/8bs9wFTOEqntQvRxu+IoDSCnHLgYmCyzUgZk5DO9jYm3No8iZLoVYt4mvg==
X-Received: by 2002:a17:907:119e:: with SMTP id uz30mr1681508ejb.125.1604663290625;
        Fri, 06 Nov 2020 03:48:10 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c066:c9fc:f8c2:d50b])
        by smtp.gmail.com with ESMTPSA id j8sm875933edk.79.2020.11.06.03.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 03:48:10 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: [PATCH 1/2] mm: mmap: fix fput in error path v2
Date:   Fri,  6 Nov 2020 12:48:05 +0100
Message-Id: <20201106114806.46015-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106114806.46015-1-christian.koenig@amd.com>
References: <20201106114806.46015-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
adds a workaround for a bug in mmap_region.

As the comment states ->mmap() callback can change
vma->vm_file and so we might call fput() on the wrong file.

Revert the workaround and proper fix this in mmap_region.

v2: drop the extra if in dma_buf_mmap as well

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf.c | 20 +++-----------------
 mm/mmap.c                 |  2 +-
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 0eb80c1ecdab..282bd8b84170 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1166,9 +1166,6 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
 int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		 unsigned long pgoff)
 {
-	struct file *oldfile;
-	int ret;
-
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1186,22 +1183,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		return -EINVAL;
 
 	/* readjust the vma */
-	get_file(dmabuf->file);
-	oldfile = vma->vm_file;
-	vma->vm_file = dmabuf->file;
+	fput(vma->vm_file);
+	vma->vm_file = get_file(dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
-	ret = dmabuf->ops->mmap(dmabuf, vma);
-	if (ret) {
-		/* restore old parameters on failure */
-		vma->vm_file = oldfile;
-		fput(dmabuf->file);
-	} else {
-		if (oldfile)
-			fput(oldfile);
-	}
-	return ret;
-
+	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_GPL(dma_buf_mmap);
 
diff --git a/mm/mmap.c b/mm/mmap.c
index d91ecb00d38c..30a4e8412a58 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1899,8 +1899,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	return addr;
 
 unmap_and_free_vma:
+	fput(vma->vm_file);
 	vma->vm_file = NULL;
-	fput(file);
 
 	/* Undo any partial mapping done by a device driver. */
 	unmap_region(mm, vma, prev, vma->vm_start, vma->vm_end);
-- 
2.25.1

