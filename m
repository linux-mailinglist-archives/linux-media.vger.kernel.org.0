Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BE12C69C7
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731859AbgK0QmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731805AbgK0QmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:42:12 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E98C0613D2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:42:12 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id i2so6204687wrs.4
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0DCehF4zZ3fhQRejLB/8aYMpRa95wWTeDCqZJ49ug5U=;
        b=cXE7uopdJpDCC9ukasYE1MZhOpMvCDOw8aBOn4lVUiCtBUjjkQL4YQNkQU2GdEP+/f
         jKBNeBqyAeQdG9N2dLlqXY4tEG589CDZGtcv2LVit7mRQ+I4Fqyl8yl5HVnX0YnuUkJI
         7vE4dDro3l523HNgaAbD76h80zfpoLzldEFFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0DCehF4zZ3fhQRejLB/8aYMpRa95wWTeDCqZJ49ug5U=;
        b=RwER297UpWB3LakT21A0ABGpybk77jrDu1bce20/DT9bH4GpsyUFB2vNirQQZd+jm0
         YoHTTYHzaWORnb126oMkLTltSSAXlN8HRKVYI6OCv7tQ4svN/lbPa/XuxZ3op44Rf6p8
         JdgIoTN//qgazE4tI9xS9TM6wGlOBgc1DJ2HgWxDnq3xUjvXL+JGv1P7rRNeCVn8y7ST
         PKks9uwFrceu9Nhznxjd2bkHlP+UpMvGtL09ZctUyDje3kj30Sb87sto1L/RyawmLifV
         kF3Q+7A3XK8db0GisC3mu15AjYRlnX0y1Af0yLFy9pkVfFZLheE/FzgEJ5Nec56rljeA
         KkrA==
X-Gm-Message-State: AOAM530TgIRb8FNGb9Y0yc99M6C2Hj0AgupAcxSsj/U4S0Cl682wBICy
        MKQFP25YPw3mxu51cZ2/OGUZEQ==
X-Google-Smtp-Source: ABdhPJwA6BKMRNSm//OZD0UDzoMNQD9CPizJ1Nvwa3DXYtenMXckQ1xp0BcV//DS0aC8S+EGVtYc6Q==
X-Received: by 2002:adf:c147:: with SMTP id w7mr11889034wre.60.1606495330973;
        Fri, 27 Nov 2020 08:42:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:42:10 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
        David Hildenbrand <david@redhat.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v7 10/17] resource: Move devmem revoke code to resource framework
Date:   Fri, 27 Nov 2020 17:41:24 +0100
Message-Id: <20201127164131.2244124-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We want all iomem mmaps to consistently revoke ptes when the kernel
takes over and CONFIG_IO_STRICT_DEVMEM is enabled. This includes the
pci bar mmaps available through procfs and sysfs, which currently do
not revoke mappings.

To prepare for this, move the code from the /dev/kmem driver to
kernel/resource.c.

During review Jason spotted that barriers are used somewhat
inconsistently. Fix that up while we shuffle this code, since it
doesn't have an actual impact at runtime. Otherwise no semantic and
behavioural changes intended, just code extraction and adjusting
comments and names.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Hildenbrand <david@redhat.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v3:
- add barrier for consistency and document why we don't have to check
  for NULL (Jason)
v4
- Adjust comments to reflect the general nature of this iomem revoke
  code now (Dan)
v6:
- An unintentional change which caused side-effects of this
  refactoring is that iomem_get_mapping returned NULL for
  !CONFIG_IO_STRICT_DEVMEM. But that makes core vfs code blow up,
  which assumes a mapping always exists. Undo that accidentional
  change. Reported by John.
- Augment the commit message to explain what actually changed with
  this extraction (also John).
---
 drivers/char/mem.c     | 85 +-----------------------------------
 include/linux/ioport.h |  6 +--
 kernel/resource.c      | 98 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 99 insertions(+), 90 deletions(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 7dcf9e4ea79d..43c871dc7477 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -31,9 +31,6 @@
 #include <linux/uio.h>
 #include <linux/uaccess.h>
 #include <linux/security.h>
-#include <linux/pseudo_fs.h>
-#include <uapi/linux/magic.h>
-#include <linux/mount.h>
 
 #ifdef CONFIG_IA64
 # include <linux/efi.h>
@@ -836,42 +833,6 @@ static loff_t memory_lseek(struct file *file, loff_t offset, int orig)
 	return ret;
 }
 
-static struct inode *devmem_inode;
-
-#ifdef CONFIG_IO_STRICT_DEVMEM
-void revoke_devmem(struct resource *res)
-{
-	/* pairs with smp_store_release() in devmem_init_inode() */
-	struct inode *inode = smp_load_acquire(&devmem_inode);
-
-	/*
-	 * Check that the initialization has completed. Losing the race
-	 * is ok because it means drivers are claiming resources before
-	 * the fs_initcall level of init and prevent /dev/mem from
-	 * establishing mappings.
-	 */
-	if (!inode)
-		return;
-
-	/*
-	 * The expectation is that the driver has successfully marked
-	 * the resource busy by this point, so devmem_is_allowed()
-	 * should start returning false, however for performance this
-	 * does not iterate the entire resource range.
-	 */
-	if (devmem_is_allowed(PHYS_PFN(res->start)) &&
-	    devmem_is_allowed(PHYS_PFN(res->end))) {
-		/*
-		 * *cringe* iomem=relaxed says "go ahead, what's the
-		 * worst that can happen?"
-		 */
-		return;
-	}
-
-	unmap_mapping_range(inode->i_mapping, res->start, resource_size(res), 1);
-}
-#endif
-
 static int open_port(struct inode *inode, struct file *filp)
 {
 	int rc;
@@ -891,7 +852,7 @@ static int open_port(struct inode *inode, struct file *filp)
 	 * revocations when drivers want to take over a /dev/mem mapped
 	 * range.
 	 */
-	filp->f_mapping = inode->i_mapping;
+	filp->f_mapping = iomem_get_mapping();
 
 	return 0;
 }
@@ -1023,48 +984,6 @@ static char *mem_devnode(struct device *dev, umode_t *mode)
 
 static struct class *mem_class;
 
-static int devmem_fs_init_fs_context(struct fs_context *fc)
-{
-	return init_pseudo(fc, DEVMEM_MAGIC) ? 0 : -ENOMEM;
-}
-
-static struct file_system_type devmem_fs_type = {
-	.name		= "devmem",
-	.owner		= THIS_MODULE,
-	.init_fs_context = devmem_fs_init_fs_context,
-	.kill_sb	= kill_anon_super,
-};
-
-static int devmem_init_inode(void)
-{
-	static struct vfsmount *devmem_vfs_mount;
-	static int devmem_fs_cnt;
-	struct inode *inode;
-	int rc;
-
-	rc = simple_pin_fs(&devmem_fs_type, &devmem_vfs_mount, &devmem_fs_cnt);
-	if (rc < 0) {
-		pr_err("Cannot mount /dev/mem pseudo filesystem: %d\n", rc);
-		return rc;
-	}
-
-	inode = alloc_anon_inode(devmem_vfs_mount->mnt_sb);
-	if (IS_ERR(inode)) {
-		rc = PTR_ERR(inode);
-		pr_err("Cannot allocate inode for /dev/mem: %d\n", rc);
-		simple_release_fs(&devmem_vfs_mount, &devmem_fs_cnt);
-		return rc;
-	}
-
-	/*
-	 * Publish /dev/mem initialized.
-	 * Pairs with smp_load_acquire() in revoke_devmem().
-	 */
-	smp_store_release(&devmem_inode, inode);
-
-	return 0;
-}
-
 static int __init chr_dev_init(void)
 {
 	int minor;
@@ -1086,8 +1005,6 @@ static int __init chr_dev_init(void)
 		 */
 		if ((minor == DEVPORT_MINOR) && !arch_has_dev_port())
 			continue;
-		if ((minor == DEVMEM_MINOR) && devmem_init_inode() != 0)
-			continue;
 
 		device_create(mem_class, NULL, MKDEV(MEM_MAJOR, minor),
 			      NULL, devlist[minor].name);
diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 5135d4b86cd6..02a5466245c0 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -307,11 +307,7 @@ struct resource *devm_request_free_mem_region(struct device *dev,
 struct resource *request_free_mem_region(struct resource *base,
 		unsigned long size, const char *name);
 
-#ifdef CONFIG_IO_STRICT_DEVMEM
-void revoke_devmem(struct resource *res);
-#else
-static inline void revoke_devmem(struct resource *res) { };
-#endif
+extern struct address_space *iomem_get_mapping(void);
 
 #endif /* __ASSEMBLY__ */
 #endif	/* _LINUX_IOPORT_H */
diff --git a/kernel/resource.c b/kernel/resource.c
index 3ae2f56cc79d..c3d71db7a40e 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -18,12 +18,15 @@
 #include <linux/spinlock.h>
 #include <linux/fs.h>
 #include <linux/proc_fs.h>
+#include <linux/pseudo_fs.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/pfn.h>
 #include <linux/mm.h>
+#include <linux/mount.h>
 #include <linux/resource_ext.h>
+#include <uapi/linux/magic.h>
 #include <asm/io.h>
 
 
@@ -1115,6 +1118,55 @@ resource_size_t resource_alignment(struct resource *res)
 
 static DECLARE_WAIT_QUEUE_HEAD(muxed_resource_wait);
 
+static struct inode *iomem_inode;
+
+#ifdef CONFIG_IO_STRICT_DEVMEM
+static void revoke_iomem(struct resource *res)
+{
+	/* pairs with smp_store_release() in iomem_init_inode() */
+	struct inode *inode = smp_load_acquire(&iomem_inode);
+
+	/*
+	 * Check that the initialization has completed. Losing the race
+	 * is ok because it means drivers are claiming resources before
+	 * the fs_initcall level of init and prevent iomem_get_mapping users
+	 * from establishing mappings.
+	 */
+	if (!inode)
+		return;
+
+	/*
+	 * The expectation is that the driver has successfully marked
+	 * the resource busy by this point, so devmem_is_allowed()
+	 * should start returning false, however for performance this
+	 * does not iterate the entire resource range.
+	 */
+	if (devmem_is_allowed(PHYS_PFN(res->start)) &&
+	    devmem_is_allowed(PHYS_PFN(res->end))) {
+		/*
+		 * *cringe* iomem=relaxed says "go ahead, what's the
+		 * worst that can happen?"
+		 */
+		return;
+	}
+
+	unmap_mapping_range(inode->i_mapping, res->start, resource_size(res), 1);
+}
+#else
+static void revoke_iomem(struct resource *res) {}
+#endif
+
+struct address_space *iomem_get_mapping(void)
+{
+	/*
+	 * This function is only called from file open paths, hence guaranteed
+	 * that fs_initcalls have completed and no need to check for NULL. But
+	 * since revoke_iomem can be called before the initcall we still need
+	 * the barrier to appease checkers.
+	 */
+	return smp_load_acquire(&iomem_inode)->i_mapping;
+}
+
 /**
  * __request_region - create a new busy resource region
  * @parent: parent resource descriptor
@@ -1182,7 +1234,7 @@ struct resource * __request_region(struct resource *parent,
 	write_unlock(&resource_lock);
 
 	if (res && orig_parent == &iomem_resource)
-		revoke_devmem(res);
+		revoke_iomem(res);
 
 	return res;
 }
@@ -1782,4 +1834,48 @@ static int __init strict_iomem(char *str)
 	return 1;
 }
 
+static int iomem_fs_init_fs_context(struct fs_context *fc)
+{
+	return init_pseudo(fc, DEVMEM_MAGIC) ? 0 : -ENOMEM;
+}
+
+static struct file_system_type iomem_fs_type = {
+	.name		= "iomem",
+	.owner		= THIS_MODULE,
+	.init_fs_context = iomem_fs_init_fs_context,
+	.kill_sb	= kill_anon_super,
+};
+
+static int __init iomem_init_inode(void)
+{
+	static struct vfsmount *iomem_vfs_mount;
+	static int iomem_fs_cnt;
+	struct inode *inode;
+	int rc;
+
+	rc = simple_pin_fs(&iomem_fs_type, &iomem_vfs_mount, &iomem_fs_cnt);
+	if (rc < 0) {
+		pr_err("Cannot mount iomem pseudo filesystem: %d\n", rc);
+		return rc;
+	}
+
+	inode = alloc_anon_inode(iomem_vfs_mount->mnt_sb);
+	if (IS_ERR(inode)) {
+		rc = PTR_ERR(inode);
+		pr_err("Cannot allocate inode for iomem: %d\n", rc);
+		simple_release_fs(&iomem_vfs_mount, &iomem_fs_cnt);
+		return rc;
+	}
+
+	/*
+	 * Publish iomem revocation inode initialized.
+	 * Pairs with smp_load_acquire() in revoke_iomem().
+	 */
+	smp_store_release(&iomem_inode, inode);
+
+	return 0;
+}
+
+fs_initcall(iomem_init_inode);
+
 __setup("iomem=", strict_iomem);
-- 
2.29.2

