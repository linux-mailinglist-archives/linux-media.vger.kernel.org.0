Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7123828848F
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 10:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732868AbgJIIBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 04:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732685AbgJIIAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 04:00:13 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B32DC0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 01:00:13 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i1so3123134wro.1
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 01:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+w/Nn7YNzQtL1R8HRvtzmLcceEG02qI4DQoPSHvskY=;
        b=SipLyVLu1maT+t1abz+yr4JywllfndSf6j6ENSrLq2AfSPXsjK05ajnSvbgqsompuC
         1UhyDtuQjFpLpdHPLuaPJ1Y5re9PD8a0kaqxKFb6bu6P7peJGTnfxqpJ9GUn/cQVjw0m
         wfneMt3tfvx7mL59KoMFPgFV7khypHJ1pv88Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+w/Nn7YNzQtL1R8HRvtzmLcceEG02qI4DQoPSHvskY=;
        b=F0FoRPL0Mz5VbvPZ3E41OoHdB+bTcS7TnaebOXU6P3kVjFqPyvzm+u1h8XQMz3HYQ6
         nsdUBefLrLph656MCZ2whRjhQeQTN95f+V5f7alR3JERIeGDz6cNt+NjmjxOyQUd1eHG
         BBy6sVNKpQs2ya/Lbs4m3aQLauGSa5AIchpABgdane1dpOcoiFdFSREgV5UVTH3Pyn1r
         od1vjSw2CZ+TE1gFE13U92i2G6oFLoFoBqK0uNmOY6RhnT9SEhAUV30DK5mHb7v6npLy
         fMzmQ+9cR+QeLDgZqQXbYC80q9d7ymq9/Q7AjvvmcE2sX7TxAtB6lALlOQdRK1Y9ZImY
         N3Eg==
X-Gm-Message-State: AOAM533Y5N3q/qnsuNZ/MJw/c1nGxy631a0KdEBhphdhC5HX7B9CdcuP
        JmS3G6mCQk5p7DpXKO8ytgqyTg==
X-Google-Smtp-Source: ABdhPJwb1srE61RQrgeCbJO2ZU0Hri/NPq8TLZEHtmQEdkQpUeTbudhLIlI6H1MTzcH4vFJipHM18Q==
X-Received: by 2002:adf:df91:: with SMTP id z17mr5138518wrl.379.1602230412191;
        Fri, 09 Oct 2020 01:00:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:00:11 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v2 14/17] resource: Move devmem revoke code to resource framework
Date:   Fri,  9 Oct 2020 09:59:31 +0200
Message-Id: <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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
---
 drivers/char/mem.c     | 85 +------------------------------------
 include/linux/ioport.h |  6 +--
 kernel/resource.c      | 95 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 96 insertions(+), 90 deletions(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 5502f56f3655..53338aad8d28 100644
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
@@ -809,42 +806,6 @@ static loff_t memory_lseek(struct file *file, loff_t offset, int orig)
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
@@ -864,7 +825,7 @@ static int open_port(struct inode *inode, struct file *filp)
 	 * revocations when drivers want to take over a /dev/mem mapped
 	 * range.
 	 */
-	filp->f_mapping = inode->i_mapping;
+	filp->f_mapping = iomem_get_mapping();
 
 	return 0;
 }
@@ -995,48 +956,6 @@ static char *mem_devnode(struct device *dev, umode_t *mode)
 
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
@@ -1058,8 +977,6 @@ static int __init chr_dev_init(void)
 		 */
 		if ((minor == DEVPORT_MINOR) && !arch_has_dev_port())
 			continue;
-		if ((minor == DEVMEM_MINOR) && devmem_init_inode() != 0)
-			continue;
 
 		device_create(mem_class, NULL, MKDEV(MEM_MAJOR, minor),
 			      NULL, devlist[minor].name);
diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 6c2b06fe8beb..8ffb61b36606 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -302,11 +302,7 @@ struct resource *devm_request_free_mem_region(struct device *dev,
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
index 841737bbda9e..22153fdec4f5 100644
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
 
 
@@ -1112,6 +1115,52 @@ resource_size_t resource_alignment(struct resource *res)
 
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
+	 * the fs_initcall level of init and prevent /dev/mem from
+	 * establishing mappings.
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
+struct address_space *iomem_get_mapping(void)
+{
+	return iomem_inode->i_mapping;
+}
+#else
+static void revoke_iomem(struct resource *res) {}
+struct address_space *iomem_get_mapping(void)
+{
+	return NULL;
+}
+#endif
+
 /**
  * __request_region - create a new busy resource region
  * @parent: parent resource descriptor
@@ -1179,7 +1228,7 @@ struct resource * __request_region(struct resource *parent,
 	write_unlock(&resource_lock);
 
 	if (res && orig_parent == &iomem_resource)
-		revoke_devmem(res);
+		revoke_iomem(res);
 
 	return res;
 }
@@ -1713,4 +1762,48 @@ static int __init strict_iomem(char *str)
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
+	 * Publish /dev/mem initialized.
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
2.28.0

