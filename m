Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0625594E03
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 03:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239854AbiHPBZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 21:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239667AbiHPBZJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 21:25:09 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F801CBBCF;
        Mon, 15 Aug 2022 14:14:52 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s206so7538451pgs.3;
        Mon, 15 Aug 2022 14:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=2kiyz2f68H5F0GVQfsRhPhFfzHVyxEWsBeZz0K3ifLI=;
        b=nmgEgH6L7MMHItJHYHkaxml+1UFs3QcoG8d9WkteLtbiWaOV3YfDSC52Qijdt9Vy6D
         SvryTOs4GPbJtIirZcGMIj0YgVx2gXAofGB/DjkfcGOAAtvDfyHo6Ewqq/F5Lyxm8xAP
         +ZW3Z7htXDfl5fgijTq4iuyPg7h+JEb7ps54m//UYwFmOimEol6N4H8yqwTg9Ee0WISL
         ZERX9YVHMseDVUHBHAVQfH2y1C9gtH/0mtgCDQ1FsgsQjzUFF/CQhlgXd1ifJAP5cyAv
         9ieXDkJyZvov4MpaEKlQxqAVtPwIxfO8ywAG95aYqGgotHXPJh9J1fs+p2T7Z4mses9E
         dr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=2kiyz2f68H5F0GVQfsRhPhFfzHVyxEWsBeZz0K3ifLI=;
        b=iIaEJLjsoqx4b57Zwfa3Y+ZoPV8GDEStn282TpYvor2EXgloxlAZlxPp/tkdLnuytU
         Bh1NSv5cSAFZrhHMX+zvNj1J03/GSt7NoIzkLfG+Hol/OK38N2osK94D2bL5Vq6X9fUc
         UUcmeEAgtZkgJApLt646pUPGdMWUBtUwqyl/lZsLDvMRgwWIFtVj0mxGyPRzlrRVaI1R
         sLVAFan2o5syJiIzLL5gnJfY7RrE/m+5V9OTKUxsmwmXDYrQVHNykj/BLrd6mdHsK6no
         HuxvaStyfn0rEDY6UaW6SKciIeWuvgtWSNZiai9o597+5IUU4k7UJrTRU8dANPYwBF88
         IRkQ==
X-Gm-Message-State: ACgBeo0R/1G302TUrOjdckFXqat606dwMlpvjtcKX06vkgpAFdX/BGRu
        mtbtMAgfQhcMQ9dWW8OqZBw=
X-Google-Smtp-Source: AA6agR5u2vrmyOIUNs2Kj2ELCddQdL5Dl4dWx6B4J+I97T2jxSfb1OoAb12npEBWLsbl6f7zkD588w==
X-Received: by 2002:a63:6a89:0:b0:419:d863:321a with SMTP id f131-20020a636a89000000b00419d863321amr15342788pgc.9.1660598091775;
        Mon, 15 Aug 2022 14:14:51 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id q4-20020a17090311c400b0016bffc59718sm7495960plh.58.2022.08.15.14.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 14:14:51 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= 
        <jerome.pouiller@silabs.com>,
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache info
Date:   Mon, 15 Aug 2022 14:15:12 -0700
Message-Id: <20220815211516.3169470-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220815211516.3169470-1-robdclark@gmail.com>
References: <20220815211516.3169470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This is a fairly narrowly focused interface, providing a way for a VMM
in userspace to tell the guest kernel what pgprot settings to use when
mapping a buffer to guest userspace.

For buffers that get mapped into guest userspace, virglrenderer returns
a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
pages into the guest VM, it needs to report to drm/virtio in the guest
the cache settings to use for guest userspace.  In particular, on some
architectures, creating aliased mappings with different cache attributes
is frowned upon, so it is important that the guest mappings have the
same cache attributes as any potential host mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2: Combine with coherency, as that is a related concept.. and it is
    relevant to the VMM whether coherent access without the SYNC ioctl
    is possible; set map_info at export time to make it more clear
    that it applies for the lifetime of the dma-buf (for any mmap
    created via the dma-buf)

 drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
 include/linux/dma-buf.h      | 11 ++++++
 include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 32f55640890c..262c4706f721 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type = {
 	.kill_sb = kill_anon_super,
 };
 
+static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	int ret;
+
+	/* check if buffer supports mmap */
+	if (!dmabuf->ops->mmap)
+		return -EINVAL;
+
+	ret = dmabuf->ops->mmap(dmabuf, vma);
+
+	/*
+	 * If the exporter claims to support coherent access, ensure the
+	 * pgprot flags match the claim.
+	 */
+	if ((dmabuf->map_info != DMA_BUF_MAP_INCOHERENT) && !ret) {
+		pgprot_t wc_prot = pgprot_writecombine(vma->vm_page_prot);
+		if (dmabuf->map_info == DMA_BUF_COHERENT_WC) {
+			WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) != pgprot_val(wc_prot));
+		} else {
+			WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) == pgprot_val(wc_prot));
+		}
+	}
+
+	return ret;
+}
+
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
@@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 
 	dmabuf = file->private_data;
 
-	/* check if buffer supports mmap */
-	if (!dmabuf->ops->mmap)
-		return -EINVAL;
-
 	/* check for overflowing the buffer's size */
 	if (vma->vm_pgoff + vma_pages(vma) >
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	return __dma_buf_mmap(dmabuf, vma);
 }
 
 static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
@@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return 0;
 }
 
+static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
+{
+	struct dma_buf_info arg;
+
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	switch (arg.param) {
+	case DMA_BUF_INFO_MAP_INFO:
+		arg.value = dmabuf->map_info;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (copy_to_user(uarg, &arg, sizeof(arg)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
 	case DMA_BUF_SET_NAME_B:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
+	case DMA_BUF_IOCTL_INFO:
+		return dma_buf_info(dmabuf, (void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
@@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	dmabuf->priv = exp_info->priv;
 	dmabuf->ops = exp_info->ops;
 	dmabuf->size = exp_info->size;
+	dmabuf->map_info = exp_info->map_info;
 	dmabuf->exp_name = exp_info->exp_name;
 	dmabuf->owner = exp_info->owner;
 	spin_lock_init(&dmabuf->name_lock);
@@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
-	/* check if buffer supports mmap */
-	if (!dmabuf->ops->mmap)
-		return -EINVAL;
-
 	/* check for offset overflow */
 	if (pgoff + vma_pages(vma) < pgoff)
 		return -EOVERFLOW;
@@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	return __dma_buf_mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 71731796c8c3..37923c8d5c24 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -23,6 +23,8 @@
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
 
+#include <uapi/linux/dma-buf.h>
+
 struct device;
 struct dma_buf;
 struct dma_buf_attachment;
@@ -307,6 +309,13 @@ struct dma_buf {
 	 */
 	size_t size;
 
+	/**
+	 * @map_info:
+	 *
+	 * CPU mapping/coherency information for the buffer.
+	 */
+	enum dma_buf_map_info map_info;
+
 	/**
 	 * @file:
 	 *
@@ -533,6 +542,7 @@ struct dma_buf_attachment {
  * @ops:	Attach allocator-defined dma buf ops to the new buffer
  * @size:	Size of the buffer - invariant over the lifetime of the buffer
  * @flags:	mode flags for the file
+ * @map_info:	CPU mapping/coherency information for the buffer
  * @resv:	reservation-object, NULL to allocate default one
  * @priv:	Attach private data of allocator to this buffer
  *
@@ -545,6 +555,7 @@ struct dma_buf_export_info {
 	const struct dma_buf_ops *ops;
 	size_t size;
 	int flags;
+	enum dma_buf_map_info map_info;
 	struct dma_resv *resv;
 	void *priv;
 };
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index b1523cb8ab30..07b403ffdb43 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -85,6 +85,72 @@ struct dma_buf_sync {
 
 #define DMA_BUF_NAME_LEN	32
 
+/**
+ * enum dma_buf_map_info - CPU mapping info
+ *
+ * This enum describes coherency of a userspace mapping of the dmabuf.
+ *
+ * Importing devices should check dma_buf::map_info flag and reject an
+ * import if unsupported.  For example, if the exporting device uses
+ * @DMA_BUF_COHERENT_CACHED but the importing device does not support
+ * CPU cache coherency, the dma-buf import should fail.
+ */
+enum dma_buf_map_info {
+	/**
+	 * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
+	 *
+	 * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherenency.
+	 */
+	DMA_BUF_MAP_INCOHERENT,
+
+	/**
+	 * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
+	 *
+	 * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
+	 * However fences may be still required for synchronizing access.  Ie.
+	 * coherency can only be relied upon by an explicit-fencing userspace.
+	 * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
+	 *
+	 * The cpu mapping is writecombine.
+	 */
+	DMA_BUF_COHERENT_WC,
+
+	/**
+	 * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cached.
+	 *
+	 * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
+	 * However fences may be still required for synchronizing access.  Ie.
+	 * coherency can only be relied upon by an explicit-fencing userspace.
+	 * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
+	 *
+	 * The cpu mapping is cached.
+	 */
+	DMA_BUF_COHERENT_CACHED,
+};
+
+/**
+ * struct dma_buf_info - Query info about the buffer.
+ */
+struct dma_buf_info {
+
+#define DMA_BUF_INFO_MAP_INFO    1
+
+	/**
+	 * @param: Which param to query
+	 *
+	 * DMA_BUF_INFO_MAP_INFO:
+	 *     Returns enum dma_buf_map_info, describing the coherency and
+	 *     caching of a CPU mapping of the buffer.
+	 */
+	__u32 param;
+	__u32 pad;
+
+	/**
+	 * @value: Return value of the query.
+	 */
+	__u64 value;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -95,4 +161,6 @@ struct dma_buf_sync {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, __u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
 
+#define DMA_BUF_IOCTL_INFO	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
+
 #endif
-- 
2.36.1

