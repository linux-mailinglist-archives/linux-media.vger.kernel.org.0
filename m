Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7FC288C1A
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388984AbgJIPDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388803AbgJIPDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:03:47 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A72BC0613D2;
        Fri,  9 Oct 2020 08:03:46 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l16so9688552eds.3;
        Fri, 09 Oct 2020 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HfGOHdnl8P4UkAJXJm+asFhJ2S9PMVltmlEIidPYuz0=;
        b=aa4N1QGk9MW7oVueE84pS3IhklP/XdU7RdM9t04ujPc6+KsxPbCNzpAmnfSeiYSmsC
         KZHr/LYqlvTGsoZDC8fMF7aq5OM7PcEj+UFzb/n5MBMqNsV4HiFNcfPx+U870RxwOmLw
         GRoRXjF2T5oyi2JVye4+SIOr5LZDF+F7fqGvrZu/jXjQRTccEH+EzI3DH/xZJp/mz+yO
         OwWK8xhq3V2y4QsDyDIf+dMsxIEbHlQTRm4WK0p8lbBa0q8jYQfoCm/ZoqeSuAefFrVZ
         0MuUPGHPEXS1TyeXAZHNNS1KCQ/ZLCrRDgD86GSjDsitEqB1cZOrUExVxuVKJacSGZqs
         I2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HfGOHdnl8P4UkAJXJm+asFhJ2S9PMVltmlEIidPYuz0=;
        b=heExrcx6mH4nPlsNCo8CsxnAjrr1e/q6wGfr6J+seyDBOHDGdVy7N9Ob65Pj7txBFo
         nXwuXkwhjDYxI0gOCDn5J5OmaD1GdVik5CVbr60qHTQDSDRc7HkzZ2jnE7MPXRUKKhuc
         xkR7u5b+YktKOg0X6WLyzJWi577CiYTGBc9JVwZdRFb6zUH/0VXBRV4TSzgQ0fgiJ58Q
         AsuGtFPNzUku1xmVMaqRBW7PfjHf9LkvrPXRPA9yZ9Ht0NNiZ+S0w0zYwVAoC1KxaHxJ
         tOMzeBVdVv3kPDoyo0hLACh/dqNXUbsYRja58dIJ1rkvU+XLzTGv9B9571+q4cOQBEUG
         P27w==
X-Gm-Message-State: AOAM531K/vYsSKIKUcjIoXY7nUJSstTNyxAxNYuMboK+doeCTQd9lrc3
        8lEap5ZZds8Da3HhomhJnDA=
X-Google-Smtp-Source: ABdhPJyibPjE78lcVPlBYyG6PW0fP1GpDj3X5Tpm1VzsO7r6v4QYdB2IMOhxokvqNlnbjQNZuzUauQ==
X-Received: by 2002:aa7:cc18:: with SMTP id q24mr8619083edt.108.1602255824666;
        Fri, 09 Oct 2020 08:03:44 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
        by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:03:43 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        jgg@ziepe.ca
Subject: [PATCH 1/6] mm: mmap: fix fput in error path
Date:   Fri,  9 Oct 2020 17:03:37 +0200
Message-Id: <20201009150342.1979-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 22 +++++-----------------
 mm/mmap.c                 |  2 +-
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a6ba4d598f0e..edd57402a48a 100644
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
 
@@ -1163,22 +1160,13 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		return -EINVAL;
 
 	/* readjust the vma */
-	get_file(dmabuf->file);
-	oldfile = vma->vm_file;
-	vma->vm_file = dmabuf->file;
-	vma->vm_pgoff = pgoff;
+	if (vma->vm_file)
+		fput(vma->vm_file);
 
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
+	vma->vm_file = get_file(dmabuf->file);
+	vma->vm_pgoff = pgoff;
 
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

