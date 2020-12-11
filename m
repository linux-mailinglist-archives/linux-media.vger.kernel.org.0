Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD562D7A70
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 17:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406667AbgLKQAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 11:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406341AbgLKP7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 10:59:38 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BB8C0613CF
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 07:58:50 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id y23so9073704wmi.1
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 07:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MaHCZAdgD/UD/VQUsOk2P9+31rgrVdxvdPUjva6U0D0=;
        b=dBiIfNYv+sMwwUJpozHRM5Ij3tA0ayCxirzqnF22PWNj+NAgWx2+A30gj3+An9jk8l
         K62Ha4GLOamQH54m1DNhnJr9j9kadnh/Vhy0XC4OsT49MhrZo68UfgdDrXb239AjwCuy
         NNm7q83o+jzUmSfkAxRiZuuBXUlVBT3HX5R5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MaHCZAdgD/UD/VQUsOk2P9+31rgrVdxvdPUjva6U0D0=;
        b=lcCzNcX79wjQgGFvsi0MILnGAjU0y1ZO+gs1bsA2fU3bAhhHX57orzxrGz/k8uzz5f
         1UhoBNH4rOA6tovgn/xX03B2WhNFyJ4vc8YfUGbJfeNXnPhlllx92habjNCUvuj4tNMx
         nuggr6KyP7m18wq8nAwhhHAyMrkwlps3wdXcFFC/uJRYBUWcgKggHu/5BYCwsCVuFOSd
         s/1XRG2cebnxuRep52NRN4m/A4Y+UGERszHtd8Kw0bvT4+pPVjeEH+wvpnbJZUyDk1pt
         sO/tKTp6ue7M/tii4hR8HeAMkou/BECiHjazYexFDiLfK0gy/oPdAY9nOMXzf/7nEQGM
         jWyg==
X-Gm-Message-State: AOAM532JHljw/CnNkGH5Cb2dYf6SjQIIFNHAVkq9hphsIgGflbi32EB4
        ryjYarXYW/F6bWxwj9cS5EhNEHgwstBQxw==
X-Google-Smtp-Source: ABdhPJzp6riLVmKPkMw3+mlDUkh18/Y4i0QR8rA3Sfj5Yv5uXpu0DO9HIJGbDkZWtipf8LC0u1OFZw==
X-Received: by 2002:a7b:c091:: with SMTP id r17mr10687617wmh.129.1607702329299;
        Fri, 11 Dec 2020 07:58:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z21sm14828241wmk.20.2020.12.11.07.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 07:58:48 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/4] dma-buf: Remove kmap kerneldoc vestiges
Date:   Fri, 11 Dec 2020 16:58:40 +0100
Message-Id: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also try to clarify a bit when dma_buf_begin/end_cpu_access should
be called.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-buf.c | 20 ++++++++++++++------
 include/linux/dma-buf.h   | 25 +++++++++----------------
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e63684d4cd90..a12fdffa130f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1001,15 +1001,15 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
  *   vmalloc space might be limited and result in vmap calls failing.
  *
  *   Interfaces::
+ *
  *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
  *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vaddr)
  *
  *   The vmap call can fail if there is no vmap support in the exporter, or if
- *   it runs out of vmalloc space. Fallback to kmap should be implemented. Note
- *   that the dma-buf layer keeps a reference count for all vmap access and
- *   calls down into the exporter's vmap function only when no vmapping exists,
- *   and only unmaps it once. Protection against concurrent vmap/vunmap calls is
- *   provided by taking the dma_buf->lock mutex.
+ *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
+ *   count for all vmap access and calls down into the exporter's vmap function
+ *   only when no vmapping exists, and only unmaps it once. Protection against
+ *   concurrent vmap/vunmap calls is provided by taking the &dma_buf.lock mutex.
  *
  * - For full compatibility on the importer side with existing userspace
  *   interfaces, which might already support mmap'ing buffers. This is needed in
@@ -1098,6 +1098,11 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
  * dma_buf_end_cpu_access(). Only when cpu access is braketed by both calls is
  * it guaranteed to be coherent with other DMA access.
  *
+ * This function will also wait for any DMA transactions tracked through
+ * implicit synchronization in &dma_buf.resv. For DMA transactions with explicit
+ * synchronization this function will only ensure cache coherency, callers must
+ * ensure synchronization with such DMA transactions on their own.
+ *
  * Can return negative error values, returns 0 on success.
  */
 int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
@@ -1199,7 +1204,10 @@ EXPORT_SYMBOL_GPL(dma_buf_mmap);
  * This call may fail due to lack of virtual mapping address space.
  * These calls are optional in drivers. The intended use for them
  * is for mapping objects linear in kernel space for high use objects.
- * Please attempt to use kmap/kunmap before thinking about these interfaces.
+ *
+ * To ensure coherency users must call dma_buf_begin_cpu_access() and
+ * dma_buf_end_cpu_access() around any cpu access performed through this
+ * mapping.
  *
  * Returns 0 on success, or a negative errno code otherwise.
  */
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index cf72699cb2bc..7eca37c8b10c 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -183,24 +183,19 @@ struct dma_buf_ops {
 	 * @begin_cpu_access:
 	 *
 	 * This is called from dma_buf_begin_cpu_access() and allows the
-	 * exporter to ensure that the memory is actually available for cpu
-	 * access - the exporter might need to allocate or swap-in and pin the
-	 * backing storage. The exporter also needs to ensure that cpu access is
-	 * coherent for the access direction. The direction can be used by the
-	 * exporter to optimize the cache flushing, i.e. access with a different
+	 * exporter to ensure that the memory is actually coherent for cpu
+	 * access. The exporter also needs to ensure that cpu access is coherent
+	 * for the access direction. The direction can be used by the exporter
+	 * to optimize the cache flushing, i.e. access with a different
 	 * direction (read instead of write) might return stale or even bogus
 	 * data (e.g. when the exporter needs to copy the data to temporary
 	 * storage).
 	 *
-	 * This callback is optional.
+	 * Note that this is both called through the DMA_BUF_IOCTL_SYNC IOCTL
+	 * command for userspace mappings established through @mmap, and also
+	 * for kernel mappings established with @vmap.
 	 *
-	 * FIXME: This is both called through the DMA_BUF_IOCTL_SYNC command
-	 * from userspace (where storage shouldn't be pinned to avoid handing
-	 * de-factor mlock rights to userspace) and for the kernel-internal
-	 * users of the various kmap interfaces, where the backing storage must
-	 * be pinned to guarantee that the atomic kmap calls can succeed. Since
-	 * there's no in-kernel users of the kmap interfaces yet this isn't a
-	 * real problem.
+	 * This callback is optional.
 	 *
 	 * Returns:
 	 *
@@ -216,9 +211,7 @@ struct dma_buf_ops {
 	 *
 	 * This is called from dma_buf_end_cpu_access() when the importer is
 	 * done accessing the CPU. The exporter can use this to flush caches and
-	 * unpin any resources pinned in @begin_cpu_access.
-	 * The result of any dma_buf kmap calls after end_cpu_access is
-	 * undefined.
+	 * undo anything else done in @begin_cpu_access.
 	 *
 	 * This callback is optional.
 	 *
-- 
2.29.2

