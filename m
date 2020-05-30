Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A581E8EC2
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbgE3G4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:56:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:44278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbgE3G4D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2079206C3;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821762;
        bh=DjmJm0c6hUdHH4PGQZbBqFRsmurjCQhBjKplPNOt/zk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tEwjaW1L4hXRPRIpkgcUfbPUwcrJigVvGf4+jxh7294KLKZhA3R2oMWya6djEoVkh
         mbigOsJK43HZLqHenq6inc07XmasTPwxIMBrBmAnaOSDigf/0cTSoqvR1uebz4WjaU
         mMQ0Dw1pzR2UnGOW4MpqyPJqe3a/YCO6itFo8Ub4=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hoA-Gc; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/41] media: atomisp: simplify hive_isp_css_mm_hrt wrapper
Date:   Sat, 30 May 2020 08:55:18 +0200
Message-Id: <fee8b40da7cc0499b64abc705dcd81964d9057f2.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code there is a wrapper for hmm/ wrapper. Simplify it,
and get rid of ION-specific code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile        |  5 --
 .../media/atomisp/include/hmm/hmm_bo.h        |  9 ---
 .../staging/media/atomisp/pci/atomisp_acc.c   |  2 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 35 ---------
 .../media/atomisp/pci/atomisp_subdev.c        |  5 --
 .../atomisp/pci/hrt/hive_isp_css_mm_hrt.c     | 77 +++----------------
 .../atomisp/pci/hrt/hive_isp_css_mm_hrt.h     | 12 ---
 .../media/atomisp/pci/ia_css_memory_access.c  |  1 -
 8 files changed, 13 insertions(+), 133 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index c7a55d059425..b48eb7946a58 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -327,11 +327,6 @@ INCLUDES_cht += \
 #	-I$(atomisp)/pci/css_2401_system/hrt/ \
 #	-I$(atomisp)/pci/css_2401_system/hive_isp_css_2401_system_generated/ \
 
-
-ifeq ($(CONFIG_ION),y)
-INCLUDES += -I$(srctree)/drivers/staging/android/ion
-endif
-
 DEFINES := -DHRT_HW -DHRT_ISP_CSS_CUSTOM_HOST -DHRT_USE_VIR_ADDRS -D__HOST__
 #DEFINES += -DUSE_DYNAMIC_BIN
 #DEFINES += -DISP_POWER_GATING
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index f847d1de860e..7fcb93b6c0f5 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -77,9 +77,6 @@ enum hmm_bo_type {
 	HMM_BO_PRIVATE,
 	HMM_BO_SHARE,
 	HMM_BO_USER,
-#ifdef CONFIG_ION
-	HMM_BO_ION,
-#endif
 	HMM_BO_LAST,
 };
 
@@ -111,9 +108,6 @@ struct hmm_bo_device {
 
 	/* list lock is used to protect the entire_bo_list */
 	spinlock_t	list_lock;
-#ifdef CONFIG_ION
-	struct ion_client	*iclient;
-#endif
 	int flag;
 
 	/* linked list for entire buffer object */
@@ -142,9 +136,6 @@ struct hmm_buffer_object {
 	struct hmm_page_object	*page_obj;	/* physical pages */
 	int		from_highmem;
 	int		mmap_count;
-#ifdef CONFIG_ION
-	struct ion_handle	*ihandle;
-#endif
 	int		status;
 	int		mem_type;
 	void		*vmap_addr; /* kernel virtual address by vmap */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
index 21337c23bfa8..bb1f60fab786 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.c
@@ -355,7 +355,7 @@ int atomisp_acc_map(struct atomisp_sub_device *asd, struct atomisp_acc_map *map)
 		pgnr = DIV_ROUND_UP(map->length, PAGE_SIZE);
 		cssptr = hrt_isp_css_mm_alloc_user_ptr(map->length,
 						       map->user_ptr,
-						       pgnr, HRT_USR_PTR,
+						       pgnr,
 						       (map->flags & ATOMISP_MAP_FLAG_CACHED));
 	} else {
 		/* Allocate private buffer. */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 39400a8677aa..8aea90ecd508 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1205,41 +1205,6 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		}
 
 		attributes.pgnr = pgnr;
-		attributes.type = HRT_USR_PTR;
-#ifdef CONFIG_ION
-		if (!atomisp_hw_is_isp2401) {
-			if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_ION)
-					attributes.type = HRT_USR_ION;
-		} else {
-			if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_ION) {
-				attributes.type = HRT_USR_ION;
-				if (asd->ion_dev_fd->val !=  ION_FD_UNSET) {
-					dev_dbg(isp->dev, "ION buffer queued, share_fd=%lddev_fd=%d.\n",
-						buf->m.userptr, asd->ion_dev_fd->val);
-					/*
-					* Make sure the shared fd we just got
-					* from user space isn't larger than
-					* the space we have for it.
-					*/
-					if ((buf->m.userptr &
-					    (ATOMISP_ION_DEVICE_FD_MASK)) != 0) {
-						dev_err(isp->dev,
-							"Error: v4l2 buffer fd:0X%0lX > 0XFFFF.\n",
-							buf->m.userptr);
-						ret = -EINVAL;
-						goto error;
-					}
-					buf->m.userptr |= asd->ion_dev_fd->val <<
-							ATOMISP_ION_DEVICE_FD_OFFSET;
-				} else {
-					dev_err(isp->dev, "v4l2 buffer type is ION, \
-							but no dev fd set from userspace.\n");
-					ret = -EINVAL;
-					goto error;
-				}
-			}
-		}
-#endif
 		ret = atomisp_css_frame_map(&handle, &frame_info,
 					    (void __user *)buf->m.userptr,
 					    0, &attributes);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index d3206ddf3b65..830aefad9312 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1223,11 +1223,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 		asd->select_isp_version = v4l2_ctrl_new_custom(&asd->ctrl_handler,
 							       &ctrl_select_isp_version,
 							       NULL);
-#if 0 /* #ifdef CONFIG_ION */
-		asd->ion_dev_fd = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-						       &ctrl_ion_dev_fd,
-						       NULL);
-#endif
 	}
 
 	/* Make controls visible on subdev as well. */
diff --git a/drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.c b/drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.c
index 236f27b50386..14e02fd76ddf 100644
--- a/drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.c
+++ b/drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.c
@@ -24,85 +24,32 @@
 
 #define __page_align(size)	(((size) + (PAGE_SIZE - 1)) & (~(PAGE_SIZE - 1)))
 
-static void __user *my_userptr;
-static unsigned int my_num_pages;
-static enum hrt_userptr_type my_usr_type;
-
-void hrt_isp_css_mm_set_user_ptr(void __user *userptr,
-				 unsigned int num_pages,
-				 enum hrt_userptr_type type)
-{
-	my_userptr = userptr;
-	my_num_pages = num_pages;
-	my_usr_type = type;
-}
-
-static ia_css_ptr __hrt_isp_css_mm_alloc(size_t bytes,
-	const void __user *userptr,
-	unsigned int num_pages,
-	enum hrt_userptr_type type,
-	bool cached)
-{
-#ifdef CONFIG_ION
-	if (type == HRT_USR_ION)
-		return hmm_alloc(bytes, HMM_BO_ION, 0,
-				 userptr, cached);
-
-#endif
-	if (type == HRT_USR_PTR) {
-		if (!userptr)
-			return hmm_alloc(bytes, HMM_BO_PRIVATE, 0,
-					 NULL, cached);
-		else {
-			if (num_pages < ((__page_align(bytes)) >> PAGE_SHIFT))
-				dev_err(atomisp_dev,
-					"user space memory size is less than the expected size..\n");
-			else if (num_pages > ((__page_align(bytes))
-					      >> PAGE_SHIFT))
-				dev_err(atomisp_dev,
-					"user space memory size is large than the expected size..\n");
-
-			return hmm_alloc(bytes, HMM_BO_USER, 0,
-					 userptr, cached);
-		}
-	} else {
-		dev_err(atomisp_dev, "user ptr type is incorrect.\n");
-		return 0;
-	}
-}
-
 ia_css_ptr hrt_isp_css_mm_alloc(size_t bytes)
 {
-	return __hrt_isp_css_mm_alloc(bytes, my_userptr,
-				      my_num_pages, my_usr_type, false);
+	return hmm_alloc(bytes, HMM_BO_PRIVATE, 0, NULL, false);
 }
 
 ia_css_ptr hrt_isp_css_mm_alloc_user_ptr(size_t bytes,
 	const void __user *userptr,
 	unsigned int num_pages,
-	enum hrt_userptr_type type,
 	bool cached)
 {
-	return __hrt_isp_css_mm_alloc(bytes, userptr, num_pages,
-				      type, cached);
+	if (num_pages < ((__page_align(bytes)) >> PAGE_SHIFT))
+		dev_err(atomisp_dev,
+			"user space memory size is less than the expected size..\n");
+	else if (num_pages > ((__page_align(bytes))
+				>> PAGE_SHIFT))
+		dev_err(atomisp_dev,
+			"user space memory size is large than the expected size..\n");
+
+	return hmm_alloc(bytes, HMM_BO_USER, 0,
+			    userptr, cached);
 }
 
 ia_css_ptr hrt_isp_css_mm_alloc_cached(size_t bytes)
 {
-	if (!my_userptr)
-		return hmm_alloc(bytes, HMM_BO_PRIVATE, 0, NULL,
+	return hmm_alloc(bytes, HMM_BO_PRIVATE, 0, NULL,
 				 HMM_CACHED);
-	else {
-		if (my_num_pages < ((__page_align(bytes)) >> PAGE_SHIFT))
-			dev_err(atomisp_dev,
-				"user space memory size is less than the expected size..\n");
-		else if (my_num_pages > ((__page_align(bytes)) >> PAGE_SHIFT))
-			dev_err(atomisp_dev,
-				"user space memory size is large than the expected size..\n");
-
-		return hmm_alloc(bytes, HMM_BO_USER, 0,
-				 my_userptr, HMM_CACHED);
-	}
 }
 
 ia_css_ptr hrt_isp_css_mm_calloc(size_t bytes)
diff --git a/drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.h b/drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.h
index 818ecf90b1f5..e4c90c268c42 100644
--- a/drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.h
+++ b/drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.h
@@ -25,27 +25,15 @@
 
 #define HRT_BUF_FLAG_CACHED BIT(0)
 
-enum hrt_userptr_type {
-	HRT_USR_PTR = 0,
-#ifdef CONFIG_ION
-	HRT_USR_ION,
-#endif
-};
-
 struct hrt_userbuffer_attr {
-	enum hrt_userptr_type	type;
 	unsigned int		pgnr;
 };
 
-void hrt_isp_css_mm_set_user_ptr(void __user *userptr,
-				 unsigned int num_pages, enum hrt_userptr_type);
-
 /* Allocate memory, returns a virtual address */
 ia_css_ptr hrt_isp_css_mm_alloc(size_t bytes);
 ia_css_ptr hrt_isp_css_mm_alloc_user_ptr(size_t bytes,
 	const void __user *userptr,
 	unsigned int num_pages,
-	enum hrt_userptr_type,
 	bool cached);
 ia_css_ptr hrt_isp_css_mm_alloc_cached(size_t bytes);
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
index 8d1356047448..6084d54acac3 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
@@ -80,6 +80,5 @@ mmgr_mmap(const void __user *ptr, const size_t size,
 
 	return hrt_isp_css_mm_alloc_user_ptr(
 		   size, ptr, userbuffer_attr->pgnr,
-		   userbuffer_attr->type,
 		   attribute & HRT_BUF_FLAG_CACHED);
 }
-- 
2.26.2

