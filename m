Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4F0298B0F
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 12:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772840AbgJZK6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 06:58:50 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54877 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1772844AbgJZK6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 06:58:49 -0400
Received: by mail-wm1-f68.google.com with SMTP id w23so10050782wmi.4
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2020 03:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eh+QFd2rUGVvEdUIq62q2ZCwC5wIklTNSjxdtgUk2/Y=;
        b=jSxXw1bdLmRXLhowjIdJTAeFXSixknzvMUIhBtEkBTKblKK8gZhTBOmABTDpvK2mRK
         CHL6hpUwxkbtVwWsXHHKBuwfNXMjDvNqE7BjTsIdEhpavhGAohvQkJxPMZhKyjjQLw4S
         LLb4iUCkIVz3tAmLqVziqEiqntHi77N/25Lzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eh+QFd2rUGVvEdUIq62q2ZCwC5wIklTNSjxdtgUk2/Y=;
        b=pppuTG6FicTpWYyM9HkZHVYM3BfdMqAufcevaIWJH3rcsZ+zkc0l+PyHnB0GUZZ7+x
         exC4Xjam/1pMCp3+yhgSYr4gRxQsGAyb4bldyIDU4ZOy0LFECMhOsjbkDhymuE0AXbNC
         vTdV7KrAcZDcSeNs6yM9hX027wKLxGpbthwjcVr3Zxnqw6gfJNh8te28JVr7AWh4frWP
         DNltgNZisIA88PKElC961NOvCq/oDzLPFS+O7lY6twv1kT9m7k2ROF+zsl197nte9lTw
         GHDteWd9vMDv6R0gjPaCPM7+n7vpFzo0BM2HbdR4OwLf/wyHwMgoYW2J1ira45xnZcRq
         r65w==
X-Gm-Message-State: AOAM5322JfcNJht+QusF8SEbXlhhOYESc6iI9n6lpaNHQTdch3SaZ1rH
        QHI4GUP+6R7Taz4G+9oaera7aA==
X-Google-Smtp-Source: ABdhPJwZtspo4YWDyrf5aVA+XBuFLqv6jVzUzeHUWGaCCCiq+U0MVt5sAZLIvYoPnIbBSWUE2POZhg==
X-Received: by 2002:a1c:7707:: with SMTP id t7mr16302030wmi.54.1603709924198;
        Mon, 26 Oct 2020 03:58:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w83sm21165156wmg.48.2020.10.26.03.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 03:58:43 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
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
Subject: [PATCH v4 13/15] resource: Move devmem revoke code to resource framework
Date:   Mon, 26 Oct 2020 11:58:16 +0100
Message-Id: <20201026105818.2585306-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
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
---
 drivers/char/mem.c     |  85 +---------------------------------
 include/linux/ioport.h |   6 +--
 kernel/resource.c      | 101 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 102 insertions(+), 90 deletions(-)

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
index 841737bbda9e..a800acbc578c 100644
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
 
 
@@ -1112,6 +1115,58 @@ resource_size_t resource_alignment(struct resource *res)
 
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
@@ -1179,7 +1234,7 @@ struct resource * __request_region(struct resource *parent,
 	write_unlock(&resource_lock);
 
 	if (res && orig_parent == &iomem_resource)
-		revoke_devmem(res);
+		revoke_iomem(res);
 
 	return res;
 }
@@ -1713,4 +1768,48 @@ static int __init strict_iomem(char *str)
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
2.28.0

