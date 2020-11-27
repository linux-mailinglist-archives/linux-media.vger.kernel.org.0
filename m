Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C71F2C69AB
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbgK0QmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731577AbgK0QmD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:42:03 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C117C061A47
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:42:02 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so6193028wrb.9
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZksVGApk98zqPsAWw78BKRzIEsQF4b04ZNKI0BcksDw=;
        b=UhRRerfutI6O0HsSwpe9AWN/5A4TFyk3ESQhXdxKTcxJAbAsj/B1y9zXC2vxCMgf9Q
         nyNxYWiTlYWnj/S+sRfdtVs98Ke+7sFH0UEcNGoUIKNHwPb1l6envlhCtYH8v1O2RtTU
         prSo4rWH81b9X6HhtrnUb9U5bRiaEJIQwpRE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZksVGApk98zqPsAWw78BKRzIEsQF4b04ZNKI0BcksDw=;
        b=O/1GFt3Vqa6hde0KIVVIZ0fjpfBLvsd8eld8m/K+3vmt0wIp9UNfAgSKSguMwfXhby
         iHBq6DPL8cpwn8pOTVF7f+YqQRkCVAFaTHD8F4SANA95DNXkPI7PDFT8QvTJ589zok5x
         7nwDHkXtvY8Fdw79aX+j9U4mejdj5k7t1e3Ubnqih9i6tEJss8cpbl0+U+2e+iuhTP3p
         aILB4ZDePMZqOhUlv9Ammx29iSGctELpCtMKLCnX1ytbas9/5Z5C/IKal3Lk7yus0ZTG
         fIJRAScfeI2I2pEfEe18eQEFPP6wEwjkKh+Df1RfswylHkZ+3Ge8oeba8kUobbkU8rIh
         KdgA==
X-Gm-Message-State: AOAM533JdSCogHim5ZDArbLoAdfF5KwxVaUk8r9ltH0Dflzg5cDqFuio
        qDNOcoiiaef/Bfkf8FvrmaBo7g==
X-Google-Smtp-Source: ABdhPJzZTcHDI/HDUBPUkKv9r5yIfNsTxyzq9owJl03yvUAtrn6FZDouMmnPycgbxWmpK0rFsFq00g==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr11829464wrw.221.1606495321359;
        Fri, 27 Nov 2020 08:42:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:42:00 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        John Hubbard <jhubbard@nvidia.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Ofir Bitton <obitton@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Moti Haimovski <mhaimovski@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>
Subject: [PATCH v7 03/17] misc/habana: Stop using frame_vector helpers
Date:   Fri, 27 Nov 2020 17:41:17 +0100
Message-Id: <20201127164131.2244124-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All we need are a pages array, pin_user_pages_fast can give us that
directly. Plus this avoids the entire raw pfn side of get_vaddr_frames.

Note that pin_user_pages_fast is a safe replacement despite the
seeming lack of checking for vma->vm_flasg & (VM_IO | VM_PFNMAP). Such
ptes are marked with pte_mkspecial (which pup_fast rejects in the
fastpath), and only architectures supporting that support the
pin_user_pages_fast fastpath.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: Tomer Tayar <ttayar@habana.ai>
Cc: Moti Haimovski <mhaimovski@habana.ai>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Piskorski <ppiskorski@habana.ai>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v2: Use unpin_user_pages_dirty_lock (John)
v3: Update kerneldoc (Oded)
v6: Explain why pup_fast is safe, after discussions with John and
Christoph.
v7: Remove error message for kmalloc failures, habanalabs doesn't do
that (Oded)
---
 drivers/misc/habanalabs/Kconfig             |  1 -
 drivers/misc/habanalabs/common/habanalabs.h |  6 ++-
 drivers/misc/habanalabs/common/memory.c     | 51 ++++++++-------------
 3 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/misc/habanalabs/Kconfig b/drivers/misc/habanalabs/Kconfig
index 1640340d3e62..293d79811372 100644
--- a/drivers/misc/habanalabs/Kconfig
+++ b/drivers/misc/habanalabs/Kconfig
@@ -6,7 +6,6 @@
 config HABANA_AI
 	tristate "HabanaAI accelerators (habanalabs)"
 	depends on PCI && HAS_IOMEM
-	select FRAME_VECTOR
 	select GENERIC_ALLOCATOR
 	select HWMON
 	help
diff --git a/drivers/misc/habanalabs/common/habanalabs.h b/drivers/misc/habanalabs/common/habanalabs.h
index 6ed974d2def0..107442a20197 100644
--- a/drivers/misc/habanalabs/common/habanalabs.h
+++ b/drivers/misc/habanalabs/common/habanalabs.h
@@ -921,7 +921,8 @@ struct hl_ctx_mgr {
  * struct hl_userptr - memory mapping chunk information
  * @vm_type: type of the VM.
  * @job_node: linked-list node for hanging the object on the Job's list.
- * @vec: pointer to the frame vector.
+ * @pages: pointer to struct page array
+ * @npages: size of @pages array
  * @sgt: pointer to the scatter-gather table that holds the pages.
  * @dir: for DMA unmapping, the direction must be supplied, so save it.
  * @debugfs_list: node in debugfs list of command submissions.
@@ -932,7 +933,8 @@ struct hl_ctx_mgr {
 struct hl_userptr {
 	enum vm_type_t		vm_type; /* must be first */
 	struct list_head	job_node;
-	struct frame_vector	*vec;
+	struct page		**pages;
+	unsigned int		npages;
 	struct sg_table		*sgt;
 	enum dma_data_direction dir;
 	struct list_head	debugfs_list;
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 84227819e4d1..2c59fa869684 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1291,45 +1291,39 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -EFAULT;
 	}
 
-	userptr->vec = frame_vector_create(npages);
-	if (!userptr->vec) {
-		dev_err(hdev->dev, "Failed to create frame vector\n");
+	userptr->pages = kvmalloc_array(npages, sizeof(*userptr->pages),
+					GFP_KERNEL);
+	if (!userptr->pages)
 		return -ENOMEM;
-	}
 
-	rc = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-				userptr->vec);
+	rc = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+				 userptr->pages);
 
 	if (rc != npages) {
 		dev_err(hdev->dev,
 			"Failed to map host memory, user ptr probably wrong\n");
 		if (rc < 0)
-			goto destroy_framevec;
-		rc = -EFAULT;
-		goto put_framevec;
-	}
-
-	if (frame_vector_to_pages(userptr->vec) < 0) {
-		dev_err(hdev->dev,
-			"Failed to translate frame vector to pages\n");
+			goto destroy_pages;
+		npages = rc;
 		rc = -EFAULT;
-		goto put_framevec;
+		goto put_pages;
 	}
+	userptr->npages = npages;
 
 	rc = sg_alloc_table_from_pages(userptr->sgt,
-					frame_vector_pages(userptr->vec),
-					npages, offset, size, GFP_ATOMIC);
+				       userptr->pages,
+				       npages, offset, size, GFP_ATOMIC);
 	if (rc < 0) {
 		dev_err(hdev->dev, "failed to create SG table from pages\n");
-		goto put_framevec;
+		goto put_pages;
 	}
 
 	return 0;
 
-put_framevec:
-	put_vaddr_frames(userptr->vec);
-destroy_framevec:
-	frame_vector_destroy(userptr->vec);
+put_pages:
+	unpin_user_pages(userptr->pages, npages);
+destroy_pages:
+	kvfree(userptr->pages);
 	return rc;
 }
 
@@ -1415,8 +1409,6 @@ int hl_pin_host_memory(struct hl_device *hdev, u64 addr, u64 size,
  */
 void hl_unpin_host_memory(struct hl_device *hdev, struct hl_userptr *userptr)
 {
-	struct page **pages;
-
 	hl_debugfs_remove_userptr(hdev, userptr);
 
 	if (userptr->dma_mapped)
@@ -1424,15 +1416,8 @@ void hl_unpin_host_memory(struct hl_device *hdev, struct hl_userptr *userptr)
 							userptr->sgt->nents,
 							userptr->dir);
 
-	pages = frame_vector_pages(userptr->vec);
-	if (!IS_ERR(pages)) {
-		int i;
-
-		for (i = 0; i < frame_vector_count(userptr->vec); i++)
-			set_page_dirty_lock(pages[i]);
-	}
-	put_vaddr_frames(userptr->vec);
-	frame_vector_destroy(userptr->vec);
+	unpin_user_pages_dirty_lock(userptr->pages, userptr->npages, true);
+	kvfree(userptr->pages);
 
 	list_del(&userptr->job_node);
 
-- 
2.29.2

