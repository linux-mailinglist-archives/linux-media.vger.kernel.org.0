Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6772530E4DA
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 22:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhBCVUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 16:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhBCVUk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 16:20:40 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5506C0613D6
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 13:19:59 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id w4so1136189wmi.4
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 13:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0KFkS15Rzk/OuayxNy0U6nwvFrwjvOdNgW3QDiU+4sc=;
        b=B7EMeYtWrV2AdNBT7y1PBSR9YxDl9aaGbp4q9BWq9AqSEZX9pd79s3t/xli9kTbRB6
         Xo/S/aN4oPc7Fu9md3ZQkcmMZ2qEZi9lZ8KtRMICl828jKRyISGJ6gnYUBenEUVvWGHs
         j5AjwWMz62ODeMu25iCr6b7IgeKTDPmOXwGoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0KFkS15Rzk/OuayxNy0U6nwvFrwjvOdNgW3QDiU+4sc=;
        b=V6K7xz1DpLnRiTCm36Q2hzS5I10PCz7qC7gKjGiNOkUySU7G1SX8XYjU5IJfdWR5l1
         8bhkxMyr40F/+43Sg2STGcl04z7dB4C+o3pIxEVP5/1x/sl9LKi3EhoSOJfpWRjuK0kT
         PmN0xCNlu3KXtCwbblB+8vukfEQ6S0xIrEz4xH8hTFgMHltYU74CZSO+kYYrJfyrBqog
         xSYKg2do2gs2E06fXqyMHC2/Y5SE4v0zOqaNysO7zhyscXfeuw/DCINus7oap6aIcvNe
         NsoP/UeEO3EIhrN18a8UeXwmQy9s3QrzAVsIvxMPc8OjD1j8/m8WisasDMl0jszEiWcJ
         u1AA==
X-Gm-Message-State: AOAM532+ETiO/FV6YX2lYmDeYLlPeT0jOwZq8NIklahnVzebO8s6QSSM
        ikxQcyPTXCkRGQV+RX+XUDU2Bw==
X-Google-Smtp-Source: ABdhPJzmU+Or9jzYUxXpAPVaDeRxSWgaJEx85VA2rMsPqlZffUGrONNNs7GEJYIhtZkMGnZTZpPI4g==
X-Received: by 2002:a7b:c854:: with SMTP id c20mr4449864wml.127.1612387198566;
        Wed, 03 Feb 2021 13:19:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j185sm4217399wma.1.2021.02.03.13.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 13:19:57 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
Date:   Wed,  3 Feb 2021 22:19:48 +0100
Message-Id: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
blocks get_user_pages and all the other struct page based
infrastructure for everyone. In spirit this is the uapi counterpart to
the kernel-internal CONFIG_DMABUF_DEBUG.

Motivated by a recent patch which wanted to swich the system dma-buf
heap to vm_insert_page instead of vm_insert_pfn.

References: https://lore.kernel.org/lkml/CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com/
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-buf.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383e..d3081fc07056 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -127,6 +127,7 @@ static struct file_system_type dma_buf_fs_type = {
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
+	int ret;
 
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
@@ -142,7 +143,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	ret = dmabuf->ops->mmap(dmabuf, vma);
+
+	WARN_ON(!(vma->vm_flags & VM_SPECIAL));
+
+	return ret;
 }
 
 static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
@@ -1244,6 +1249,8 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
 int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		 unsigned long pgoff)
 {
+	int ret;
+
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1264,7 +1271,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	ret = dmabuf->ops->mmap(dmabuf, vma);
+
+	WARN_ON(!(vma->vm_flags & VM_SPECIAL));
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_buf_mmap);
 
-- 
2.30.0

