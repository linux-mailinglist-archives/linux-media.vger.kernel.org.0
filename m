Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9103F05E6
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238939AbhHROMk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238812AbhHROMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:12:35 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F36FC0613D9
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:00 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id x4so2367163pgh.1
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VG7TmDpgCPtcx1YrqDRM9gY1pXuKyoZ818yYVJ4nhrU=;
        b=nM+Vh8/E769scay4OzXwi7apEZu99TO7DNd3rW/5TMnljCjGsmLpkQU3ke3I7AQALs
         Kz8omE3Fk75jqmK4+/lb+UOCRbHD2DgmJrk1bgDzHXRgeulWOi1OzZ4e7xV2vunngWsO
         8rpOIa9Y8VEyZLa39R47/6VP2y4QnAcfQEuYJ7h3goD3QStLOShaSH6b3fukSBbVi/2e
         eg2CHJiNDPa062Ci9YegRUPi+qtNgIKn8BguVbvD+U9qRMfNFIxlTbyN1Ysih+Km7Qfl
         3NO9pgWV5v+jZE3fXHutQLQz1WwL/qlaK6a6kzMAjLpQioJHtHyFeTOxf64MQMTyav6t
         OK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=VG7TmDpgCPtcx1YrqDRM9gY1pXuKyoZ818yYVJ4nhrU=;
        b=Xpu1SoV/UxLrbEfZWuiZCHCf4l5RGW8F+eBBGG7RPhgG+uKgGrhxD6qIdO0lMNkyXd
         vOzhNqIZb/+RbDXgjZ6gdUioshZ6DQKGJ8BZXiJJ5Jrl6EbJfiIx9tNzpQKus7evO36P
         Ug35czycMJTxBsDEXMrHU0f6quwgyXFEmku+JluOeJV13c245G+z8mju+Hlu0WtrVHzn
         CyHQ0YYmbQ6il9CyE6IduJeWtwrWZMxmtswnlKR5LNkcTmYJFIC9casjnSlrh/tfNxBF
         64ccueaGlstKrsgLwTKK+2xwk39xkZCOU8mquK1ZoomRO0FjbOYnBsO4R4xe5FxGHmXL
         ln7w==
MIME-Version: 1.0
X-Gm-Message-State: AOAM531/caQzy1lBMZihkzAoioi640yXXghsv46eUiGxv7h0XM6uts/s
        sbtQQcjWVYS+CjgPVYj7/J2DaQC/vwApfsVltYG3G7vYgepD+CBXmgXXMZEAMMbKhKgK7MIWBF7
        lQOphg4PP2DAsXi2o
X-Google-Smtp-Source: ABdhPJxRifZsXPpwDXfEKH5wrEWQT/vWpPS9+PC3LwxRGxM4NGnej/7pWO+Byt2KwrPHu/WStDFJkQ==
X-Received: by 2002:a63:6284:: with SMTP id w126mr9078866pgb.189.1629295919788;
        Wed, 18 Aug 2021 07:11:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:11:59 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 02/30] v4l: vxd-dec: Create mmu programming helper library
Date:   Wed, 18 Aug 2021 19:40:09 +0530
Message-Id: <20210818141037.19990-3-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

The IMG D5520 has an MMU which needs to be programmed with all
memory which it needs access to. This includes input buffers,
output buffers and parameter buffers for each decode instance,
as well as common buffers for firmware, etc.

Functions are provided for creating MMU directories (each stream
will have it's own MMU context), retrieving the directory page,
and mapping/unmapping a buffer into the MMU for a specific MMU context.

Also helper(s) are provided for querying the capabilities of the MMU.

Signed-off-by: Buddy Liong <buddy.liong@ti.com>
Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                               |   2 +
 drivers/staging/media/vxd/common/imgmmu.c | 782 ++++++++++++++++++++++
 drivers/staging/media/vxd/common/imgmmu.h | 180 +++++
 3 files changed, 964 insertions(+)
 create mode 100644 drivers/staging/media/vxd/common/imgmmu.c
 create mode 100644 drivers/staging/media/vxd/common/imgmmu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 163b3176ccf9..2e921650a14c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19537,6 +19537,8 @@ M:	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
+F:	drivers/staging/media/vxd/common/imgmmu.c
+F:	drivers/staging/media/vxd/common/imgmmu.h
 
 VIDEO I2C POLLING DRIVER
 M:	Matt Ranostay <matt.ranostay@konsulko.com>
diff --git a/drivers/staging/media/vxd/common/imgmmu.c b/drivers/staging/media/vxd/common/imgmmu.c
new file mode 100644
index 000000000000..ce2f41f72485
--- /dev/null
+++ b/drivers/staging/media/vxd/common/imgmmu.c
@@ -0,0 +1,782 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMG DEC MMU function implementations
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+#include "img_mem_man.h"
+#include "imgmmu.h"
+
+/**
+ * struct mmu_directory - the MMU directory information
+ * @dir_page: pointer to the mmu_page_cfg_table (physical table used) which
+ *	      this mmu_directory belongs to
+ * @dir_page_table: All the page table structures in a static array of pointers
+ * @mmu_info_cfg: Functions to use to manage pages allocation, liberation and
+ *		  writing
+ * @num_mapping: number of mapping using this directory
+ */
+struct mmu_directory {
+	struct mmu_page_cfg *dir_page;
+	struct mmu_page_cfg_table **dir_page_table;
+	struct mmu_info mmu_info_cfg;
+	unsigned int num_mapping;
+};
+
+/*
+ * struct mmu_map - the MMU mapping information
+ * @mmu_dir: pointer to the mmu_directory which this mmu_map belongs to
+ * @dev_virt_addr: device virtual address root associated with this mapping
+ * @used_flag: flag used when allocating
+ * @n_entries: number of entries mapped
+ */
+struct mmu_map {
+	struct mmu_directory *mmu_dir;
+	struct mmu_heap_alloc dev_virt_addr;
+	unsigned int used_flag;
+	unsigned int n_entries;
+};
+
+/*
+ * struct mmu_page_cfg_table - the MMU page table information.
+ *			       One page table of the directory.
+ * @mmu_dir: pointer to the mmu_directory which this mmu_page_cfg_table
+ *	     belongs to
+ * @page: page used to store this mapping in the MMU
+ * @valid_entries: number of valid entries in this page
+ */
+struct mmu_page_cfg_table {
+	struct mmu_directory *mmu_dir;
+	struct mmu_page_cfg *page;
+	unsigned int valid_entries;
+};
+
+/*
+ * mmu_pgt_destroy() - Destruction of a page table (does not follow the
+ *                     child pointer)
+ * @pgt: pointer to the MMU page table information
+ *
+ * Warning: Does not verify if pages are still valid or not
+ */
+static void mmu_pgt_destroy(struct mmu_page_cfg_table *pgt)
+{
+	if (!pgt->mmu_dir ||
+	    !pgt->mmu_dir->mmu_info_cfg.pfn_page_free ||
+	    !pgt->page) {
+		return;
+	}
+
+	pr_debug("%s:%d Destroy page table (phys addr %llu)\n",
+		 __func__, __LINE__, pgt->page->phys_addr);
+
+	pgt->mmu_dir->mmu_info_cfg.pfn_page_free(pgt->page);
+	pgt->page = NULL;
+
+	kfree(pgt);
+}
+
+/*
+ * mmu_dir_entry() - Extact the directory index from a virtual address
+ * @vaddr: virtual address
+ */
+static inline unsigned int mmu_dir_entry(unsigned long vaddr)
+{
+	return (unsigned int)((vaddr & VIRT_DIR_IDX_MASK) >> MMU_DIR_SHIFT);
+}
+
+/*
+ * mmu_pg_entry() - Extract the page table index from a virtual address
+ * @vaddr: virtual address
+ */
+static inline unsigned int mmu_pg_entry(unsigned long vaddr)
+{
+	return (unsigned int)((vaddr & VIRT_PAGE_TBL_MASK) >> MMU_PAGE_SHIFT);
+}
+
+/*
+ * mmu_pg_wr() - Default function used when a mmu_info structure has an empty
+ *		 pfn_page_write pointer
+ * @mmu_page: pointer to the mmu_page to update
+ * @offset: offset into the directory
+ * @pa_to_write: physical address value to add to the entr
+ * @mmu_flag: mmu flag(s) to set
+ */
+static void mmu_pg_wr(struct mmu_page_cfg *mmu_page, unsigned int offset,
+		      unsigned long long pa_to_write, unsigned int mmu_flag)
+{
+	unsigned int *dir_mem = NULL;
+	unsigned long long cur_pa = pa_to_write;
+
+	if (!mmu_page)
+		return;
+
+	dir_mem = (unsigned int *)mmu_page->cpu_virt_addr;
+	/*
+	 * assumes that the MMU HW has the extra-bits enabled (this default
+	 * function has no way of knowing)
+	 */
+	if ((MMU_PHYS_SIZE - MMU_VIRT_SIZE) > 0)
+		cur_pa >>= (MMU_PHYS_SIZE - MMU_VIRT_SIZE);
+	/*
+	 * The MMU_PAGE_SHIFT bottom bits should be masked because page
+	 * allocation.
+	 * MMU_PAGE_SHIFT-(MMU_PHYS_SIZE-MMU_VIRT_SIZE) are used for
+	 * flags so it's ok
+	 */
+	dir_mem[offset] = (unsigned int)cur_pa | (mmu_flag);
+}
+
+/*
+ * mmu_page_cfg_table() - Create a page table
+ * @mmu_dir: pointer to the mmu_directory in which to create the new page table
+ *	     structure
+ *
+ * Return: A pointer to the new page table structure in case of success.
+ *	   (void *) in case of error
+ */
+static struct mmu_page_cfg_table *mmu_pgt_create(struct mmu_directory *mmu_dir)
+{
+	struct mmu_page_cfg_table *neo = NULL;
+	unsigned int i;
+
+	if (!mmu_dir || !mmu_dir->mmu_info_cfg.pfn_page_alloc ||
+	    !mmu_dir->mmu_info_cfg.pfn_page_write)
+		return (void *)(-EINVAL);
+
+	neo = kmalloc(sizeof(*neo), GFP_KERNEL);
+	if (!neo)
+		return (void *)(-ENOMEM);
+
+	neo->mmu_dir = mmu_dir;
+
+	neo->page =
+		mmu_dir->mmu_info_cfg.pfn_page_alloc(mmu_dir->mmu_info_cfg.alloc_ctx);
+	if (!neo->page) {
+		pr_err("%s:%d failed to allocate Page Table physical page\n",
+		       __func__, __LINE__);
+		kfree(neo);
+		return (void *)(-ENOMEM);
+	}
+	pr_debug("%s:%d Create page table (phys addr 0x%llx CPU Virt 0x%lx)\n",
+		 __func__, __LINE__, neo->page->phys_addr,
+			neo->page->cpu_virt_addr);
+
+	/* invalidate all pages */
+	for (i = 0; i < MMU_N_PAGE; i++) {
+		mmu_dir->mmu_info_cfg.pfn_page_write(neo->page, i, 0,
+				MMU_FLAG_INVALID);
+	}
+
+	/*
+	 * When non-UMA need to update the device memory after setting
+	 * it to 0
+	 */
+	if (mmu_dir->mmu_info_cfg.pfn_page_update)
+		mmu_dir->mmu_info_cfg.pfn_page_update(neo->page);
+
+	return neo;
+}
+
+/*
+ * mmu_create_directory - Create a directory entry based on a given directory
+ *			  configuration
+ * @mmu_info_ops: contains the functions to use to manage page table memory.
+ *		  Is copied and not modified.
+ *
+ * @warning Obviously creation of the directory allocates memory - do not call
+ * while interrupts are disabled
+ *
+ * @return The opaque handle to the mmu_directory object and result to 0
+ * @return (void *) in case of an error and result has the value:
+ * @li -EINVAL if mmu_info configuration is NULL or does not
+ * contain function pointers
+ * @li -ENOMEM if an internal allocation failed
+ * @li -ENOMEM if the given mmu_pfn_page_alloc returned NULL
+ */
+struct mmu_directory *mmu_create_directory(const struct mmu_info *mmu_info_ops)
+{
+	struct mmu_directory *neo = NULL;
+	unsigned int i;
+
+	/*
+	 * invalid information in the directory config:
+	 * - invalid page allocator and dealloc (page write can be NULL)
+	 * - invalid virtual address representation
+	 * - invalid page size
+	 * - invalid MMU size
+	 */
+	if (!mmu_info_ops || !mmu_info_ops->pfn_page_alloc || !mmu_info_ops->pfn_page_free) {
+		pr_err("%s:%d invalid MMU configuration\n", __func__, __LINE__);
+		return (void *)(-EINVAL);
+	}
+
+	neo = kzalloc(sizeof(*neo), GFP_KERNEL);
+	if (!neo)
+		return (void *)(-ENOMEM);
+
+	neo->dir_page_table = kcalloc(MMU_N_TABLE, sizeof(struct mmu_page_cfg_table *),
+				      GFP_KERNEL);
+	if (!neo->dir_page_table) {
+		kfree(neo);
+		return (void *)(-ENOMEM);
+	}
+
+	memcpy(&neo->mmu_info_cfg, mmu_info_ops, sizeof(struct mmu_info));
+	if (!mmu_info_ops->pfn_page_write) {
+		pr_debug("%s:%d using default MMU write\n", __func__, __LINE__);
+		/* use internal function */
+		neo->mmu_info_cfg.pfn_page_write = &mmu_pg_wr;
+	}
+
+	neo->dir_page = mmu_info_ops->pfn_page_alloc(mmu_info_ops->alloc_ctx);
+	if (!neo->dir_page) {
+		kfree(neo->dir_page_table);
+		kfree(neo);
+		return (void *)(-ENOMEM);
+	}
+
+	pr_debug("%s:%d (phys page 0x%llx; CPU virt 0x%lx)\n", __func__,
+		 __LINE__, neo->dir_page->phys_addr,
+			neo->dir_page->cpu_virt_addr);
+	/* now we have a valid mmu_directory structure */
+
+	/* invalidate all entries */
+	for (i = 0; i < MMU_N_TABLE; i++) {
+		neo->mmu_info_cfg.pfn_page_write(neo->dir_page, i, 0,
+				MMU_FLAG_INVALID);
+	}
+
+	/* when non-UMA need to update the device memory */
+	if (neo->mmu_info_cfg.pfn_page_update)
+		neo->mmu_info_cfg.pfn_page_update(neo->dir_page);
+
+	return neo;
+}
+
+/*
+ * mmu_destroy_directory - Destroy the mmu_directory - assumes that the HW is
+ *			   not going to access the memory any-more
+ * @mmu_dir: pointer to the mmu directory to destroy
+ *
+ * Does not invalidate any memory because it assumes that everything is not
+ * used any-more
+ */
+int mmu_destroy_directory(struct mmu_directory *mmu_dir)
+{
+	unsigned int i;
+
+	if (!mmu_dir) {
+		/* could be an assert */
+		pr_err("%s:%d mmu_dir is NULL\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (mmu_dir->num_mapping > 0)
+		/* mappings should have been destroyed! */
+		pr_err("%s:%d directory still has %u mapping attached to it\n",
+		       __func__, __LINE__, mmu_dir->num_mapping);
+	/*
+	 * not exiting because clearing the page table map is more
+	 * important than losing a few structures
+	 */
+
+	if (!mmu_dir->mmu_info_cfg.pfn_page_free || !mmu_dir->dir_page_table)
+		return -EINVAL;
+
+	pr_debug("%s:%d destroy MMU dir (phys page 0x%llx)\n",
+		 __func__, __LINE__, mmu_dir->dir_page->phys_addr);
+
+	/* first we destroy the directory entry */
+	mmu_dir->mmu_info_cfg.pfn_page_free(mmu_dir->dir_page);
+	mmu_dir->dir_page = NULL;
+
+	/* destroy every mapping that still exists */
+	for (i = 0; i < MMU_N_TABLE; i++) {
+		if (mmu_dir->dir_page_table[i]) {
+			mmu_pgt_destroy(mmu_dir->dir_page_table[i]);
+			mmu_dir->dir_page_table[i] = NULL;
+		}
+	}
+
+	kfree(mmu_dir->dir_page_table);
+	kfree(mmu_dir);
+	return 0;
+}
+
+/*
+ * mmu_directory_get_page - Get access to the page table structure used in the
+ *			    directory (to be able to write it to registers)
+ * @mmu_dir: pointer to the mmu directory. asserts if mmu_dir is NULL
+ *
+ * @return the page table structure used
+ */
+struct mmu_page_cfg *mmu_directory_get_page(struct mmu_directory *mmu_dir)
+{
+	if (!mmu_dir)
+		return NULL;
+
+	return mmu_dir->dir_page;
+}
+
+static struct mmu_map *mmu_directory_map(struct mmu_directory *mmu_dir,
+					 const struct mmu_heap_alloc *dev_va,
+					 unsigned int ui_map_flags,
+					 int (*phys_iter_next)(void *arg,
+							       unsigned long long *next),
+					 void *phys_iter_arg)
+{
+	unsigned int first_dir = 0;
+	unsigned int first_pg = 0;
+	unsigned int dir_off = 0;
+	unsigned int pg_off = 0;
+	unsigned int n_entries = 0;
+	unsigned int i;
+	unsigned int d;
+	const unsigned int duplicate = PAGE_SIZE / mmu_get_page_size();
+	int res = 0;
+	struct mmu_map *neo = NULL;
+	struct mmu_page_cfg_table **dir_pgtbl = NULL;
+
+	/*
+	 * in non UMA updates on pages needs to be done - store index of
+	 * directory entry pages to update
+	 */
+	unsigned int *to_update;
+	/*
+	 * number of pages in to_update (will be at least 1 for the first_pg to
+	 * update)
+	 */
+	unsigned int n_pgs_to_update = 0;
+	/*
+	 * to know if we also need to update the directory page (creation of new
+	 * page)
+	 */
+	unsigned char dir_modified = FALSE;
+
+	if (!mmu_dir || !dev_va || duplicate < 1)
+		return (void *)(-EINVAL);
+
+	dir_pgtbl = mmu_dir->dir_page_table;
+
+	n_entries = dev_va->alloc_size / PAGE_SIZE;
+	if (dev_va->alloc_size % MMU_PAGE_SIZE != 0 || n_entries == 0) {
+		pr_err("%s:%d invalid allocation size\n", __func__, __LINE__);
+		return (void *)(-EINVAL);
+	}
+
+	if ((ui_map_flags & MMU_FLAG_VALID) != 0) {
+		pr_err("%s:%d valid flag (0x%x) is set in the falgs 0x%x\n",
+		       __func__, __LINE__, MMU_FLAG_VALID, ui_map_flags);
+		return (void *)(-EINVAL);
+	}
+
+	/*
+	 * has to be dynamically allocated because it is bigger than 1k (max
+	 * stack in the kernel)
+	 * MMU_N_TABLE is 1024 for 4096B pages, that's a 4k allocation (1 page)
+	 *  - if it gets bigger may IMG_BIGALLOC should be used
+	 */
+	to_update = kcalloc(MMU_N_TABLE, sizeof(unsigned int), GFP_KERNEL);
+	if (!to_update)
+		return (void *)(-ENOMEM);
+
+	/* manage multiple page table mapping */
+
+	first_dir = mmu_dir_entry(dev_va->virt_addr);
+	first_pg = mmu_pg_entry(dev_va->virt_addr);
+
+	if (first_dir >= MMU_N_TABLE || first_pg >= MMU_N_PAGE) {
+		kfree(to_update);
+		return (void *)(-EINVAL);
+	}
+
+	/* verify that the pages that should be used are available */
+	dir_off = first_dir;
+	pg_off = first_pg;
+
+	/*
+	 * loop over the number of entries given by CPU allocator but CPU page
+	 * size can be > than MMU page size therefore it may need to "duplicate"
+	 * entries by creating a fake physical address
+	 */
+	for (i = 0; i < n_entries * duplicate; i++) {
+		if (pg_off >= MMU_N_PAGE) {
+			dir_off++; /* move to next directory */
+			if (dir_off >= MMU_N_TABLE) {
+				res = -EINVAL;
+				break;
+			}
+			pg_off = 0; /* using its first page */
+		}
+
+		/*
+		 * if dir_pgtbl[dir_off] == NULL not yet
+		 * allocated it means all entries are available
+		 */
+		if (dir_pgtbl[dir_off]) {
+			/*
+			 * inside a pagetable - verify that the required offset
+			 * is invalid
+			 */
+			struct mmu_page_cfg_table *tbl = dir_pgtbl[dir_off];
+			unsigned int *page_mem = (unsigned int *)tbl->page->cpu_virt_addr;
+
+			if ((page_mem[pg_off] & MMU_FLAG_VALID) != 0) {
+				pr_err("%s:%d one of the required page is currently in use\n",
+				       __func__, __LINE__);
+				res = -EPERM;
+				break;
+			}
+		}
+		/* PageTable struct exists */
+		pg_off++;
+	} /* for all needed entries */
+
+	/* it means one entry was not invalid or not enough page were given */
+	if (res != 0) {
+		/*
+		 * message already printed
+		 * IMG_ERROR_MEMORY_IN_USE when an entry is not invalid
+		 * IMG_ERROR_INVALID_PARAMETERS when not enough pages are given
+		 *  (or too much)
+		 */
+		kfree(to_update);
+		return (void *)(unsigned long)(res);
+	}
+
+	neo = kmalloc(sizeof(*neo), GFP_KERNEL);
+	if (!neo) {
+		kfree(to_update);
+		return (void *)(-ENOMEM);
+	}
+	neo->mmu_dir = mmu_dir;
+	neo->dev_virt_addr = *dev_va;
+	memcpy(&neo->dev_virt_addr, dev_va, sizeof(struct mmu_heap_alloc));
+	neo->used_flag = ui_map_flags;
+
+	/* we now know that all pages are available */
+	dir_off = first_dir;
+	pg_off = first_pg;
+
+	to_update[n_pgs_to_update] = first_dir;
+	n_pgs_to_update++;
+
+	for (i = 0; i < n_entries; i++) {
+		unsigned long long cur_phys_addr;
+
+		if (phys_iter_next(phys_iter_arg, &cur_phys_addr) != 0) {
+			pr_err("%s:%d not enough entries in physical address array\n",
+			       __func__, __LINE__);
+			kfree(neo);
+			kfree(to_update);
+			return (void *)(-EBUSY);
+		}
+		for (d = 0; d < duplicate; d++) {
+			if (pg_off >= MMU_N_PAGE) {
+				/* move to next directory */
+				dir_off++;
+				/* using its first page */
+				pg_off = 0;
+
+				to_update[n_pgs_to_update] = dir_off;
+				n_pgs_to_update++;
+			}
+
+			/* this page table object does not exists, create it */
+			if (!dir_pgtbl[dir_off]) {
+				dir_pgtbl[dir_off] = mmu_pgt_create(mmu_dir);
+				if (IS_ERR_VALUE((unsigned long)dir_pgtbl[dir_off])) {
+					dir_pgtbl[dir_off] = NULL;
+					goto cleanup_fail;
+				}
+				/*
+				 * make this page table valid
+				 * should be dir_off
+				 */
+				mmu_dir->mmu_info_cfg.pfn_page_write(mmu_dir->dir_page,
+						dir_off,
+						dir_pgtbl[dir_off]->page->phys_addr,
+						MMU_FLAG_VALID);
+				dir_modified = TRUE;
+			}
+
+			/*
+			 * map this particular page in the page table
+			 * use d*(MMU page size) to add additional entries from
+			 * the given physical address with the correct offset
+			 * for the MMU
+			 */
+			mmu_dir->mmu_info_cfg.pfn_page_write(dir_pgtbl[dir_off]->page,
+							     pg_off,
+							     cur_phys_addr + d *
+							     mmu_get_page_size(),
+							     neo->used_flag |
+							     MMU_FLAG_VALID);
+			dir_pgtbl[dir_off]->valid_entries++;
+
+			pg_off++;
+		} /* for duplicate */
+	} /* for entries */
+
+	neo->n_entries = n_entries * duplicate;
+	/* one more mapping is related to this directory */
+	mmu_dir->num_mapping++;
+
+	/* if non UMA we need to update device memory */
+	if (mmu_dir->mmu_info_cfg.pfn_page_update) {
+		while (n_pgs_to_update > 0) {
+			unsigned int idx = to_update[n_pgs_to_update - 1];
+			struct mmu_page_cfg_table *tbl = dir_pgtbl[idx];
+
+			mmu_dir->mmu_info_cfg.pfn_page_update(tbl->page);
+			n_pgs_to_update--;
+		}
+		if (dir_modified)
+			mmu_dir->mmu_info_cfg.pfn_page_update(mmu_dir->dir_page);
+	}
+
+	kfree(to_update);
+	return neo;
+
+cleanup_fail:
+	pr_err("%s:%d failed to create a non-existing page table\n", __func__, __LINE__);
+
+	/*
+	 * invalidate all already mapped pages -
+	 * do not destroy the created pages
+	 */
+	while (i > 1) {
+		if (d == 0) {
+			i--;
+			d = duplicate;
+		}
+		d--;
+
+		if (pg_off == 0) {
+			pg_off = MMU_N_PAGE;
+			if (!dir_off)
+				continue;
+			dir_off--;
+		}
+
+		pg_off--;
+
+		/* it should have been used before */
+		if (!dir_pgtbl[dir_off])
+			continue;
+
+		mmu_dir->mmu_info_cfg.pfn_page_write(dir_pgtbl[dir_off]->page,
+				pg_off, 0,
+				MMU_FLAG_INVALID);
+		dir_pgtbl[dir_off]->valid_entries--;
+	}
+
+	kfree(neo);
+	kfree(to_update);
+	return (void *)(-ENOMEM);
+}
+
+/*
+ * with sg
+ */
+struct sg_phys_iter {
+	void *sgl;
+	unsigned int offset;
+};
+
+static int sg_phys_iter_next(void *arg, unsigned long long *next)
+{
+	struct sg_phys_iter *iter = arg;
+
+	if (!iter->sgl)
+		return -ENOENT;
+
+	*next = sg_phys(iter->sgl) + iter->offset; /* phys_addr to dma_addr? */
+	iter->offset += PAGE_SIZE;
+
+	if (iter->offset == img_mmu_get_sgl_length(iter->sgl)) {
+		iter->sgl = sg_next(iter->sgl);
+		iter->offset = 0;
+	}
+
+	return 0;
+}
+
+/*
+ * mmu_directory_map_sg - Create a page table mapping for a list of physical
+ *			  pages and device virtual address
+ *
+ * @mmu_dir: directory to use for the mapping
+ * @phys_page_sg: sorted array of physical addresses (ascending order). The
+ *		  number of elements is dev_va->alloc_size/MMU_PAGE_SIZE
+ * @note This array can potentially be big, the caller may need to use vmalloc
+ * if running the linux kernel (e.g. mapping a 1080p NV12 is 760 entries, 6080
+ * Bytes - 2 CPU pages needed, fine with kmalloc; 4k NV12 is 3038 entries,
+ * 24304 Bytes - 6 CPU pages needed, kmalloc would try to find 8 contiguous
+ * pages which may be problematic if memory is fragmented)
+ * @dev_va: associated device virtual address. Given structure is copied
+ * @map_flag: flags to apply on the page (typically 0x2 for Write Only,
+ *	      0x4 for Read Only) - the flag should not set bit 1 as 0x1 is the
+ *	      valid flag.
+ *
+ * @warning Mapping can cause memory allocation (missing pages) - do not call
+ * while interrupts are disabled
+ *
+ * @return The opaque handle to the mmu_map object and result to 0
+ * @return (void *) in case of an error with the following values:
+ * @li -EINVAL if the allocation size is not a multiple of MMU_PAGE_SIZE,
+ *     if the given list of page table is too long or not long enough for the
+ *     mapping or if the give flags set the invalid bit
+ * @li -EPERM if the virtual memory is already mapped
+ * @li -ENOMEM if an internal allocation failed
+ * @li -ENOMEM if a page creation failed
+ */
+struct mmu_map *mmu_directory_map_sg(struct mmu_directory *mmu_dir,
+				     void *phys_page_sg,
+				     const struct mmu_heap_alloc *dev_va,
+				     unsigned int map_flag)
+{
+	struct sg_phys_iter arg = { phys_page_sg };
+
+	return mmu_directory_map(mmu_dir, dev_va, map_flag,
+				 sg_phys_iter_next, &arg);
+}
+
+/*
+ * mmu_directory_unmap - Un-map the mapped pages (invalidate their entries) and
+ *			 destroy the mapping object
+ * @map: pointer to the pages to un-map
+ *
+ * This does not destroy the created Page Table (even if they are becoming
+ * un-used) and does not change the Directory valid bits.
+ *
+ * @return 0
+ */
+int mmu_directory_unmap(struct mmu_map *map)
+{
+	unsigned int first_dir = 0;
+	unsigned int first_pg = 0;
+	unsigned int dir_offset = 0;
+	unsigned int pg_offset = 0;
+	unsigned int i;
+	struct mmu_directory *mmu_dir = NULL;
+
+	/*
+	 * in non UMA updates on pages needs to be done - store index of
+	 * directory entry pages to update
+	 */
+	unsigned int *to_update;
+	unsigned int n_pgs_to_update = 0;
+
+	if (!map || map->n_entries <= 0 || !map->mmu_dir)
+		return -EINVAL;
+
+	mmu_dir = map->mmu_dir;
+
+	/*
+	 * has to be dynamically allocated because it is bigger than 1k (max
+	 * stack in the kernel)
+	 */
+	to_update = kcalloc(MMU_N_TABLE, sizeof(unsigned int), GFP_KERNEL);
+	if (!to_update)
+		return -ENOMEM;
+
+	first_dir = mmu_dir_entry(map->dev_virt_addr.virt_addr);
+	first_pg = mmu_pg_entry(map->dev_virt_addr.virt_addr);
+
+	/* verify that the pages that should be used are available */
+	dir_offset = first_dir;
+	pg_offset = first_pg;
+
+	to_update[n_pgs_to_update] = first_dir;
+	n_pgs_to_update++;
+
+	for (i = 0; i < map->n_entries; i++) {
+		if (pg_offset >= MMU_N_PAGE) {
+			/* move to next directory */
+			dir_offset++;
+			/* using its first page */
+			pg_offset = 0;
+
+			to_update[n_pgs_to_update] = dir_offset;
+			n_pgs_to_update++;
+		}
+
+		/*
+		 * this page table object does not exist, something destroyed
+		 * it while the mapping was supposed to use it
+		 */
+		if (mmu_dir->dir_page_table[dir_offset]) {
+			mmu_dir->mmu_info_cfg.pfn_page_write
+				(mmu_dir->dir_page_table[dir_offset]->page,
+				 pg_offset, 0,
+				 MMU_FLAG_INVALID);
+			mmu_dir->dir_page_table[dir_offset]->valid_entries--;
+		}
+
+		pg_offset++;
+	}
+
+	mmu_dir->num_mapping--;
+
+	if (mmu_dir->mmu_info_cfg.pfn_page_update)
+		while (n_pgs_to_update > 0) {
+			unsigned int idx = to_update[n_pgs_to_update - 1];
+			struct mmu_page_cfg_table *tbl = mmu_dir->dir_page_table[idx];
+
+			mmu_dir->mmu_info_cfg.pfn_page_update(tbl->page);
+			n_pgs_to_update--;
+		}
+
+	/* mapping does not own the given virtual address */
+	kfree(map);
+	kfree(to_update);
+	return 0;
+}
+
+unsigned int mmu_directory_get_pagetable_entry(struct mmu_directory *mmu_dir,
+					       unsigned long dev_virt_addr)
+{
+	unsigned int dir_entry = 0;
+	unsigned int table_entry = 0;
+	struct mmu_page_cfg_table *tbl;
+	struct mmu_page_cfg_table **dir_pgtbl = NULL;
+	unsigned int *page_mem;
+
+	if (!mmu_dir) {
+		pr_err("mmu directory table is NULL\n");
+		return 0xFFFFFF;
+	}
+
+	dir_pgtbl = mmu_dir->dir_page_table;
+
+	dir_entry = mmu_dir_entry(dev_virt_addr);
+	table_entry = mmu_pg_entry(dev_virt_addr);
+
+	tbl = dir_pgtbl[dir_entry];
+	if (!tbl) {
+		pr_err("page table entry is NULL\n");
+		return 0xFFFFFF;
+	}
+
+	page_mem = (unsigned int *)tbl->page->cpu_virt_addr;
+
+#if defined(DEBUG_DECODER_DRIVER) || defined(DEBUG_ENCODER_DRIVER)
+	pr_info("Page table value@dir_entry:table_entry[%d : %d] = %x\n",
+		dir_entry, table_entry, page_mem[table_entry]);
+#endif
+
+	return page_mem[table_entry];
+}
diff --git a/drivers/staging/media/vxd/common/imgmmu.h b/drivers/staging/media/vxd/common/imgmmu.h
new file mode 100644
index 000000000000..b35256d09e24
--- /dev/null
+++ b/drivers/staging/media/vxd/common/imgmmu.h
@@ -0,0 +1,180 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG DEC MMU Library
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#ifndef IMG_DEC_MMU_MMU_H
+#define IMG_DEC_MMU_MMU_H
+
+#include <linux/types.h>
+
+#ifndef MMU_PHYS_SIZE
+/* @brief MMU physical address size in bits */
+#define MMU_PHYS_SIZE 40
+#endif
+
+#ifndef MMU_VIRT_SIZE
+/* @brief MMU virtual address size in bits */
+#define MMU_VIRT_SIZE 32
+#endif
+
+#ifndef MMU_PAGE_SIZE
+/* @brief Page size in bytes */
+#define MMU_PAGE_SIZE 4096u
+#define MMU_PAGE_SHIFT 12
+#define MMU_DIR_SHIFT 22
+#endif
+
+#if MMU_VIRT_SIZE == 32
+/* @brief max number of pagetable that can be stored in the directory entry */
+#define MMU_N_TABLE (MMU_PAGE_SIZE / 4u)
+/* @brief max number of page mapping in the pagetable */
+#define MMU_N_PAGE (MMU_PAGE_SIZE / 4u)
+#endif
+
+/* @brief Memory flag used to mark a page mapping as invalid */
+#define MMU_FLAG_VALID 0x1
+#define MMU_FLAG_INVALID 0x0
+
+/*
+ * This type defines MMU variant.
+ */
+enum mmu_etype {
+	MMU_TYPE_NONE = 0,
+	MMU_TYPE_32BIT,
+	MMU_TYPE_36BIT,
+	MMU_TYPE_40BIT,
+	MMU_TYPE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* @brief Page offset mask in virtual address - bottom bits */
+static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
+/* @brief Page table index mask in virtual address - middle bits */
+static const unsigned long VIRT_PAGE_TBL_MASK =
+	(((1 << MMU_DIR_SHIFT) - 1) & ~(((1 << MMU_PAGE_SHIFT) - 1)));
+/* @brief Directory index mask in virtual address - high bits */
+static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
+
+/*
+ * struct mmu_heap_alloc - information about a virtual mem heap allocation
+ * @virt_addr: pointer to start of the allocation
+ * @alloc_size: size in bytes
+ */
+struct mmu_heap_alloc {
+	unsigned long	virt_addr;
+	unsigned long	alloc_size;
+};
+
+/*
+ * struct mmu_page_cfg - mmu_page configuration
+ * @phys_addr: physical address - unsigned long long is used to support extended physical
+ *	       address on 32bit system
+ * @cpu_virt_addr: CPU virtual address pointer
+ */
+struct mmu_page_cfg {
+	unsigned long long	phys_addr;
+	unsigned long	cpu_virt_addr;
+};
+
+/*
+ * typedef mmu_pfn_page_alloc - page table allocation function
+ *
+ * Pointer to a function implemented by the used allocator to create 1
+ * page table (used for the MMU mapping - directory page and mapping page)
+ *
+ * Return:
+ * * A populated mmu_page_cfg structure with the result of the page alloc.
+ * * NULL if the allocation failed.
+ */
+typedef struct mmu_page_cfg *(*mmu_pfn_page_alloc) (void *);
+
+/*
+ * typedef mmu_pfn_page_free
+ * @arg1: pointer to the mmu_page_cfg that is allocated using mmu_pfn_page_alloc
+ *
+ * Pointer to a function to free the allocated page table used for MMU mapping.
+ *
+ * @return void
+ */
+typedef void (*mmu_pfn_page_free) (struct mmu_page_cfg *arg1);
+
+/*
+ * typedef mmu_pfn_page_update
+ * @arg1: pointer to the mmu_page_cfg that is allocated using mmu_pfn_page_alloc
+ *
+ * Pointer to a function to update Device memory on non Unified Memory
+ *
+ * @return void
+ */
+typedef void (*mmu_pfn_page_update) (struct mmu_page_cfg *arg1);
+
+/*
+ * typedef mmu_pfn_page_write
+ * @mmu_page: mmu_page mmu page configuration to be written
+ * @offset: offset in entries (32b word)
+ * @pa_to_write: pa_to_write physical address to write
+ * @flags: flags bottom part of the entry used as flags for the MMU (including
+ *	   valid flag)
+ *
+ * Pointer to a function to write to a device address
+ *
+ * @return void
+ */
+typedef void (*mmu_pfn_page_write) (struct mmu_page_cfg *mmu_page,
+				    unsigned int offset,
+				    unsigned long long pa_to_write, unsigned int flags);
+
+/*
+ * struct mmu_info
+ * @pfn_page_alloc: function pointer for allocating a physical page used in
+ *		    MMU mapping
+ * @alloc_ctx: allocation context handler
+ * @pfn_page_free: function pointer for freeing a physical page used in
+ *		   MMU mapping
+ * @pfn_page_write: function pointer to write a physical address onto a page.
+ *		    If NULL, then internal function is used. Internal function
+ *		    assumes that MMU_PHYS_SIZE is the MMU size.
+ * @pfn_page_update: function pointer to update a physical page on device if
+ *		     non UMA.
+ */
+struct mmu_info {
+	mmu_pfn_page_alloc	pfn_page_alloc;
+	void			*alloc_ctx;
+	mmu_pfn_page_free	pfn_page_free;
+	mmu_pfn_page_write	pfn_page_write;
+	mmu_pfn_page_update	pfn_page_update;
+};
+
+/*
+ * mmu_get_page_size() - Access the compilation specified page size of the
+ *			 MMU (in Bytes)
+ */
+static inline unsigned long mmu_get_page_size(void)
+{
+	return MMU_PAGE_SIZE;
+}
+
+struct mmu_directory *mmu_create_directory(const struct mmu_info *mmu_info_ops);
+int mmu_destroy_directory(struct mmu_directory *mmu_dir);
+
+struct mmu_page_cfg *mmu_directory_get_page(struct mmu_directory *mmu_dir);
+
+struct mmu_map *mmu_directory_map_sg(struct mmu_directory *mmu_dir,
+				     void *phys_page_sg,
+				     const struct mmu_heap_alloc *dev_va,
+				     unsigned int map_flag);
+int mmu_directory_unmap(struct mmu_map *map);
+
+unsigned int mmu_directory_get_pagetable_entry(struct mmu_directory *mmu_dir,
+					       unsigned long dev_virt_addr);
+
+#endif /* IMG_DEC_MMU_MMU_H */
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
