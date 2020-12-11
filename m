Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313452D7A6F
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 17:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406349AbgLKQAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 11:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406342AbgLKP7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 10:59:38 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9C1C0613D3
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 07:58:51 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id r7so9532883wrc.5
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 07:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WhXmefZSTvpDKo6owjq5Ccn4MusL6HQNqDzqvbjA8sQ=;
        b=cNOr3dLxtzI2QvQqYFVEzfqa8VVJ4YiIkHOgGFULgtgCffkobMbFsvN1yFSxmZ9BA8
         3TloSl+PNgRPLIa4Y/DYnCWRHNkWxcFpym/HLTeNjIPss3UJJgaSw10FfmmIQHlJgveE
         kIwZ0qf7O/BGvw4nocPe8a+sUMFSDS0MdlEHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WhXmefZSTvpDKo6owjq5Ccn4MusL6HQNqDzqvbjA8sQ=;
        b=sdZYp5suQ8SRnGEO4cO8Z0hJxsqpFuisB65dDhgClt4IKa+4d7bwLluqK8Ye0WUbOD
         cpDXUTgXkNznhc6rZhvz/r27cTBhDFX7zdl+/D4+cPQuqbmMRC0I3AExXYMluPSJcUzp
         ML6dKzPhMkmv6A41qPT/nLFocGmKoCGBkw8Hn83dBC6BBfTOqcn7J3GvmsXSjpGf4G5L
         1rn6/IFtUGFXR0yFRzKfipCCAb460vONkW/SrRPWFUfyVyR7lcziU+ZsXtt/iBV03ImZ
         ItSYi95glFHjgR18LFtYW73CJoDgOuBylxLr3+ZZtzzG9Rgtd8uI1rQo7s4QwchkFv/Y
         P9Zg==
X-Gm-Message-State: AOAM5321xY2IHI2wa1AKXvw3p3Vr3lV0juzk2MGz4Ayk14c7gfHHhqdv
        STvxhnV4CakLsa/f0r8s+PqE+g==
X-Google-Smtp-Source: ABdhPJx7XkrQjyR6z/zdr9E40WSHhaMnGSXMi/aJH+IRKynp9hSMVKO5IZBtxkA1arAvCDv7CHd8XQ==
X-Received: by 2002:adf:a441:: with SMTP id e1mr14535904wra.385.1607702330609;
        Fri, 11 Dec 2020 07:58:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z21sm14828241wmk.20.2020.12.11.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 07:58:49 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/4] dma-buf: some kerneldoc formatting fixes
Date:   Fri, 11 Dec 2020 16:58:41 +0100
Message-Id: <20201211155843.3348718-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Noticed while reviewing the output. Adds a bunch more links and fixes
the function interface quoting.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-buf.c | 31 ++++++++++++++++++-------------
 include/linux/dma-buf.h   |  6 +++---
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a12fdffa130f..e1fa6c6f02c4 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -480,7 +480,7 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
  *
  * 4. Once a driver is done with a shared buffer it needs to call
  *    dma_buf_detach() (after cleaning up any mappings) and then release the
- *    reference acquired with dma_buf_get by calling dma_buf_put().
+ *    reference acquired with dma_buf_get() by calling dma_buf_put().
  *
  * For the detailed semantics exporters are expected to implement see
  * &dma_buf_ops.
@@ -496,9 +496,10 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
  *			by the exporter. see &struct dma_buf_export_info
  *			for further details.
  *
- * Returns, on success, a newly created dma_buf object, which wraps the
- * supplied private data and operations for dma_buf_ops. On either missing
- * ops, or error in allocating struct dma_buf, will return negative error.
+ * Returns, on success, a newly created struct dma_buf object, which wraps the
+ * supplied private data and operations for struct dma_buf_ops. On either
+ * missing ops, or error in allocating struct dma_buf, will return negative
+ * error.
  *
  * For most cases the easiest way to create @exp_info is through the
  * %DEFINE_DMA_BUF_EXPORT_INFO macro.
@@ -584,7 +585,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 EXPORT_SYMBOL_GPL(dma_buf_export);
 
 /**
- * dma_buf_fd - returns a file descriptor for the given dma_buf
+ * dma_buf_fd - returns a file descriptor for the given struct dma_buf
  * @dmabuf:	[in]	pointer to dma_buf for which fd is required.
  * @flags:      [in]    flags to give to fd
  *
@@ -608,10 +609,10 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 EXPORT_SYMBOL_GPL(dma_buf_fd);
 
 /**
- * dma_buf_get - returns the dma_buf structure related to an fd
- * @fd:	[in]	fd associated with the dma_buf to be returned
+ * dma_buf_get - returns the struct dma_buf related to an fd
+ * @fd:	[in]	fd associated with the struct dma_buf to be returned
  *
- * On success, returns the dma_buf structure associated with an fd; uses
+ * On success, returns the struct dma_buf associated with an fd; uses
  * file's refcounting done by fget to increase refcount. returns ERR_PTR
  * otherwise.
  */
@@ -653,8 +654,7 @@ void dma_buf_put(struct dma_buf *dmabuf)
 EXPORT_SYMBOL_GPL(dma_buf_put);
 
 /**
- * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list; optionally,
- * calls attach() of dma_buf_ops to allow device-specific attach functionality
+ * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
  * @dmabuf:		[in]	buffer to attach device to.
  * @dev:		[in]	device to be attached.
  * @importer_ops:	[in]	importer operations for the attachment
@@ -663,6 +663,9 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
  * must be cleaned up by calling dma_buf_detach().
  *
+ * Optionally this calls &dma_buf_ops.attach to allow device-specific attach
+ * functionality.
+ *
  * Returns:
  *
  * A pointer to newly created &dma_buf_attachment on success, or a negative
@@ -769,12 +772,13 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 EXPORT_SYMBOL_GPL(dma_buf_attach);
 
 /**
- * dma_buf_detach - Remove the given attachment from dmabuf's attachments list;
- * optionally calls detach() of dma_buf_ops for device-specific detach
+ * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
  * @dmabuf:	[in]	buffer to detach from.
  * @attach:	[in]	attachment to be detached; is free'd after this call.
  *
  * Clean up a device attachment obtained by calling dma_buf_attach().
+ *
+ * Optionally this calls &dma_buf_ops.detach for device-specific detach.
  */
 void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 {
@@ -1061,11 +1065,12 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
  *   shootdowns would increase the complexity quite a bit.
  *
  *   Interface::
+ *
  *      int dma_buf_mmap(struct dma_buf \*, struct vm_area_struct \*,
  *		       unsigned long);
  *
  *   If the importing subsystem simply provides a special-purpose mmap call to
- *   set up a mapping in userspace, calling do_mmap with dma_buf->file will
+ *   set up a mapping in userspace, calling do_mmap with &dma_buf.file will
  *   equally achieve that for a dma-buf object.
  */
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 7eca37c8b10c..43802a31b25d 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -85,10 +85,10 @@ struct dma_buf_ops {
 	/**
 	 * @pin:
 	 *
-	 * This is called by dma_buf_pin and lets the exporter know that the
+	 * This is called by dma_buf_pin() and lets the exporter know that the
 	 * DMA-buf can't be moved any more.
 	 *
-	 * This is called with the dmabuf->resv object locked and is mutual
+	 * This is called with the &dmabuf.resv object locked and is mutual
 	 * exclusive with @cache_sgt_mapping.
 	 *
 	 * This callback is optional and should only be used in limited use
@@ -103,7 +103,7 @@ struct dma_buf_ops {
 	/**
 	 * @unpin:
 	 *
-	 * This is called by dma_buf_unpin and lets the exporter know that the
+	 * This is called by dma_buf_unpin() and lets the exporter know that the
 	 * DMA-buf can be moved again.
 	 *
 	 * This is called with the dmabuf->resv object locked and is mutual
-- 
2.29.2

