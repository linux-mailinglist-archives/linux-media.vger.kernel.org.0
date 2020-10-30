Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6F32A0280
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgJ3KKo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgJ3KIn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:08:43 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1600C0613D7
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:08:42 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y12so5798167wrp.6
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LviVmALlSgblFMBLYwpV18ifgqJQyTuRFngxF2ueWqY=;
        b=jVoJqWq4DFPoCMIuDC/TTFq838TwJoryu1vDg2f8eECd5NB93hIuiebO6nwtiPqJk2
         PBNDqRZzpjAVPcXrmwI57kn0rzxUQFLXxtp1+7PALigEN2sBiDtyTHMwyCrgzu1jbMP7
         ZEkSAoP/BL/ISsqH2EgmRIPYA3UlrbRAKUUGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LviVmALlSgblFMBLYwpV18ifgqJQyTuRFngxF2ueWqY=;
        b=fVjN9My+xH+CkL8BIigdNipizXQvG570iIqLRxjE4fpxtz/+7CIKOIa/CCbhhrhrMg
         kguCloJE1J+5fn1tAbKAF/B286aby4lps2Gr2vxb6RKpbLveetkcwiiauNqHxm8iqOFo
         Srt/bu6qQK6kKRLAUXhHDiDJsWXnDu7vXiBfDBJKVMZjoA6G14Stkris4gG0GZ7ZiW74
         7pK+GNgEqcObkmehVEM4o2AlmEoe3+CKymgtZYPmajCMhzscfUkRSjJ19cs1m/NiXxKz
         bXg6MrEZyBRJPJ3Ie18bWkosSgh2E2GDEWZN1K+hu4P9e3JQfMk9mLmnJI/h5OStcIfm
         gW2g==
X-Gm-Message-State: AOAM533QDQuo0uv8i37j9UqrSKeZECAd7Sobj4Z/mWGsoSKMlqQUU1Rb
        vTh+nkvUZ4xcjMZwTjOL0hHVYQ==
X-Google-Smtp-Source: ABdhPJy80j36pVqL/FfPCmR4vFg8BYnMcSH66PK+Yxy9tBdWcTRFmNrh1EyMMQmo3IueEFvjyMOgnw==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr2023146wrl.325.1604052521488;
        Fri, 30 Oct 2020 03:08:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 03:08:40 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        John Hubbard <jhubbard@nvidia.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
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
Subject: [PATCH v5 03/15] misc/habana: Stop using frame_vector helpers
Date:   Fri, 30 Oct 2020 11:08:03 +0100
Message-Id: <20201030100815.2269-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All we need are a pages array, pin_user_pages_fast can give us that
directly. Plus this avoids the entire raw pfn side of get_vaddr_frames.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
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
---
 drivers/misc/habanalabs/Kconfig             |  1 -
 drivers/misc/habanalabs/common/habanalabs.h |  6 ++-
 drivers/misc/habanalabs/common/memory.c     | 49 ++++++++-------------
 3 files changed, 22 insertions(+), 34 deletions(-)

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
index 80d4d7385ffe..272aa3f29200 100644
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
index 84227819e4d1..0b220221873d 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1291,45 +1291,41 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -EFAULT;
 	}
 
-	userptr->vec = frame_vector_create(npages);
-	if (!userptr->vec) {
+	userptr->pages = kvmalloc_array(npages, sizeof(*userptr->pages),
+					GFP_KERNEL);
+	if (!userptr->pages) {
 		dev_err(hdev->dev, "Failed to create frame vector\n");
 		return -ENOMEM;
 	}
 
-	rc = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-				userptr->vec);
+	rc = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+				 userptr->pages);
 
 	if (rc != npages) {
 		dev_err(hdev->dev,
 			"Failed to map host memory, user ptr probably wrong\n");
 		if (rc < 0)
-			goto destroy_framevec;
+			goto destroy_pages;
+		npages = rc;
 		rc = -EFAULT;
-		goto put_framevec;
-	}
-
-	if (frame_vector_to_pages(userptr->vec) < 0) {
-		dev_err(hdev->dev,
-			"Failed to translate frame vector to pages\n");
-		rc = -EFAULT;
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
 
@@ -1415,8 +1411,6 @@ int hl_pin_host_memory(struct hl_device *hdev, u64 addr, u64 size,
  */
 void hl_unpin_host_memory(struct hl_device *hdev, struct hl_userptr *userptr)
 {
-	struct page **pages;
-
 	hl_debugfs_remove_userptr(hdev, userptr);
 
 	if (userptr->dma_mapped)
@@ -1424,15 +1418,8 @@ void hl_unpin_host_memory(struct hl_device *hdev, struct hl_userptr *userptr)
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
2.28.0

