Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F86C28B092
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 10:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgJLIwI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 04:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgJLIwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 04:52:08 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EABC0613CE;
        Mon, 12 Oct 2020 01:52:06 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id qp15so22100698ejb.3;
        Mon, 12 Oct 2020 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yMIANltJzggMKevCuA/64ylJ5xrfMe99CRAziEtSDMY=;
        b=lw+tUQcX6E58leo0iNUqUuxVirmooB9X9E28JBa9u2lgsb0RDv0+NxJBs03bTu7r0B
         D5EPdSramySPYUis9ltXlotS4rQuxBR+Lpg3kMC59NVAL4HKTGbhmk92F5o8LIbmtzv7
         iMpjDgh6fHILhflZmN61tUTEN+tVt4sHxRVmsmlXUWFTWigpqtu+/NNfdmgb6t9xuYQJ
         UR1KOZokmCcW8f1eYTtWvUlJrfmNcsSSOy5zYIB6J+97c1BT/O3HLomn+xovaPPdAKVB
         dQVqbzeDFYRKcQP3MlkRlIElHDn3nkr52Yh/OQIpwBDSFtHpuLbXkazdkd5l455I7zZ6
         nJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yMIANltJzggMKevCuA/64ylJ5xrfMe99CRAziEtSDMY=;
        b=J7wMn2rO1Nq8qg9osIos6IjZLEWJ2I+QSDhwEI9kP1Mx2IltyNF0/Oc62BjmgTMgHb
         h5LiuPVYBadf9Vi/9Gxun1eNPrEznNOw8E2ySnx/ZGLHChOAKzlXWCXuzN8UIPQiebLN
         FMV76qt6h1QWUt7KKzPeREWuEFuJGJ4vQmH9IG+vRGASj0d7ZFvFnYkKHC4sZG5Dvo1G
         usfypL1o4Cn464jKsQQf8vXZ6Ef/5K85DRjhXkAaPC45O6LXi4z2/CWoFDvylplb0Qr4
         TRgqYWJaHkw6hNDbd6Q3H2PIobeiDJb/B/SW2iqLGNg7kS9PaGz16VV+NX3YCw7vSK0U
         eZoA==
X-Gm-Message-State: AOAM530KJixxeJqr4LP8Nze8wh4WA7jAuwPId+Zvve4YuqCWfOKp0VbP
        CpjXeqvzrmKLP7CYg3mt7v4=
X-Google-Smtp-Source: ABdhPJxnwEuylsU7eSmkWOtF42j8bglh0/rf5pkHlz0ZkTIK1CSAgwpiELeW85OngsabmXKbddLIWw==
X-Received: by 2002:a17:906:95c5:: with SMTP id n5mr27686729ejy.111.1602492725376;
        Mon, 12 Oct 2020 01:52:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6a6c:c67:2644:1d74])
        by smtp.gmail.com with ESMTPSA id o35sm8622988edd.4.2020.10.12.01.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 01:52:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        jgg@ziepe.ca, linmiaohe@huawei.com
Subject: [PATCH 1/2] mm: mmap: fix fput in error path v2
Date:   Mon, 12 Oct 2020 10:52:02 +0200
Message-Id: <20201012085203.56119-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
index a6ba4d598f0e..08630d057cf2 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1143,9 +1143,6 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
 int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		 unsigned long pgoff)
 {
-	struct file *oldfile;
-	int ret;
-
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1163,22 +1160,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
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
index 40248d84ad5f..3a2670d73355 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1852,8 +1852,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	return addr;
 
 unmap_and_free_vma:
+	fput(vma->vm_file);
 	vma->vm_file = NULL;
-	fput(file);
 
 	/* Undo any partial mapping done by a device driver. */
 	unmap_region(mm, vma, prev, vma->vm_start, vma->vm_end);
-- 
2.17.1

