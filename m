Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44611E8EC6
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgE3G4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:56:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:44330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728404AbgE3G4D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7B1B207F9;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821762;
        bh=uCGANdPlGKLqUwt0nywQxGLZo+IJxAKCxL9fgIL/EVo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xoZ7CCo2QrhBLZQSFKTqRfQAYzqMElgBjJ3arLPg9yziozBynjvP2yk3AoMoy7P8l
         NToIHkmqGfxxhPqLQHb3RIcFfmTV89uM9Z+0+IctBBzJQIcp5t8fXL0Eb1eUK7KhoS
         uehWBG9nPunOI4WH/LZpA2xplmHZPvwKkI0C47jU=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hoM-LF; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/41] media: atomisp: go one step further to drop ia_css_memory_access.c
Date:   Sat, 30 May 2020 08:55:21 +0200
Message-Id: <dad0d48d7c31c157cf5354c3fda9bc00214f650b.1590821410.git.mchehab+huawei@kernel.org>
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

Move the attrs handling into hmm, simplifying even further
what the ia_css_memory_access.c file does.

Yet, the returned type for ia_css_memory_access.c is an
integer, instead of a pointer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  3 ++-
 .../media/atomisp/include/linux/atomisp.h     |  2 ++
 .../memory_access/memory_access.h             |  3 ---
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 11 ++++++++--
 .../media/atomisp/pci/ia_css_memory_access.c  | 21 +------------------
 .../atomisp/pci/runtime/frame/src/frame.c     |  4 ++--
 .../staging/media/atomisp/pci/sh_css_params.c |  8 +++----
 7 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index e2149b16c9fd..a661c039a2cc 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -35,7 +35,8 @@ int hmm_init(void);
 void hmm_cleanup(void);
 
 ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
-		     int from_highmem, const void __user *userptr, bool cached);
+		     int from_highmem, const void __user *userptr,
+		     const uint16_t attrs);
 void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index e9670749bae0..fc2e76694613 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -917,6 +917,8 @@ struct atomisp_acc_map {
 
 #define ATOMISP_MAP_FLAG_NOFLUSH	0x0001	/* Do not flush cache */
 #define ATOMISP_MAP_FLAG_CACHED		0x0002	/* Enable cache */
+#define ATOMISP_MAP_FLAG_CONTIGUOUS	0x0004
+#define ATOMISP_MAP_FLAG_CLEARED	0x0008
 
 struct atomisp_acc_state {
 	__u32 flags;			/* Flags, see list below */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
index c8a41e5d8dab..19b9083995a4 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
@@ -76,9 +76,6 @@
  * within the allocation referencable from the
  * returned pointer/address.
  */
-#define MMGR_ATTRIBUTE_CACHED		0x0001
-#define MMGR_ATTRIBUTE_CONTIGUOUS	0x0002
-#define MMGR_ATTRIBUTE_CLEARED		0x0008
 
 #define mmgr_NULL		((hrt_vaddress)0)
 #define mmgr_EXCEPTION		((hrt_vaddress)-1)
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 975749d67131..68dab2393767 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -193,7 +193,7 @@ int hmm_init(void)
 	 * at the beginning, to avoid hmm_alloc return 0 in the
 	 * further allocation.
 	 */
-	dummy_ptr = hmm_alloc(1, HMM_BO_PRIVATE, 0, NULL, false);
+	dummy_ptr = hmm_alloc(1, HMM_BO_PRIVATE, 0, NULL, 0);
 
 	if (!ret) {
 		ret = sysfs_create_group(&atomisp_dev->kobj,
@@ -219,12 +219,16 @@ void hmm_cleanup(void)
 }
 
 ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
-		     int from_highmem, const void __user *userptr, bool cached)
+		     int from_highmem, const void __user *userptr,
+		     const uint16_t attrs)
 {
 	unsigned int pgnr;
 	struct hmm_buffer_object *bo;
+	bool cached = attrs & ATOMISP_MAP_FLAG_CACHED;
 	int ret;
 
+	WARN_ON(attrs & ATOMISP_MAP_FLAG_CONTIGUOUS);
+
 	/*
 	 * Check if we are initialized. In the ideal world we wouldn't need
 	 * this but we can tackle it once the driver is a lot cleaner
@@ -258,6 +262,9 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 
 	hmm_mem_stat.tol_cnt += pgnr;
 
+	if (attrs & ATOMISP_MAP_FLAG_CLEARED)
+		hmm_set(bo->start, 0, bytes);
+
 	return bo->start;
 
 bind_err:
diff --git a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
index d11843a717e0..e19b98fe7201 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
@@ -12,30 +12,11 @@
  * more details.
  */
 
-#include <type_support.h>
-#include <system_types.h>
-#include <assert_support.h>
 #include <memory_access.h>
-#include <ia_css_env.h>
-
-#include "atomisp_internal.h"
 
 hrt_vaddress mmgr_alloc_attr(const size_t size, const uint16_t attrs)
 {
-	ia_css_ptr data;
-
-	WARN_ON(attrs & MMGR_ATTRIBUTE_CONTIGUOUS);
-
-	data = hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL,
-			 attrs & MMGR_ATTRIBUTE_CACHED);
-
-	if (!data)
-		return 0;
-
-	if (attrs & MMGR_ATTRIBUTE_CLEARED)
-		hmm_set(data, 0, size);
-
-	return (ia_css_ptr)data;
+	return hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, attrs);
 }
 
 void mmgr_load(const hrt_vaddress vaddr, void *data, const size_t size)
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 75edd79b7968..9a9c1fffd3d9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -178,7 +178,7 @@ enum ia_css_err ia_css_frame_map(struct ia_css_frame **frame,
 		}
 
 		return hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data,
-				 attribute & MMGR_ATTRIBUTE_CACHED);
+				 attribute & ATOMISP_MAP_FLAG_CACHED);
 
 		if (me->data == mmgr_NULL)
 			err = IA_CSS_ERR_INVALID_ARGUMENTS;
@@ -799,7 +799,7 @@ static enum ia_css_err frame_allocate_buffer_data(struct ia_css_frame *frame)
 #endif
 	frame->data = mmgr_alloc_attr(frame->data_bytes,
 				      frame->contiguous ?
-				      MMGR_ATTRIBUTE_CONTIGUOUS : 0);
+				      ATOMISP_MAP_FLAG_CONTIGUOUS : 0);
 
 	if (frame->data == mmgr_NULL)
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 0a59ef0d4bce..00388e563668 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3267,11 +3267,11 @@ sh_css_params_init(void) {
 			xmem_sp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
 						  mmgr_alloc_attr(sizeof(struct sh_css_sp_stage),
-								  MMGR_ATTRIBUTE_CLEARED));
+								  ATOMISP_MAP_FLAG_CLEARED));
 			xmem_isp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
 						  mmgr_alloc_attr(sizeof(struct sh_css_sp_stage),
-								  MMGR_ATTRIBUTE_CLEARED));
+								  ATOMISP_MAP_FLAG_CLEARED));
 
 			if ((xmem_sp_stage_ptrs[p][i] == mmgr_NULL) ||
 			    (xmem_isp_stage_ptrs[p][i] == mmgr_NULL)) {
@@ -3290,10 +3290,10 @@ sh_css_params_init(void) {
 	sp_ddr_ptrs = ia_css_refcount_increment(-1,
 						mmgr_alloc_attr(CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
 									 HIVE_ISP_DDR_WORD_BYTES),
-								MMGR_ATTRIBUTE_CLEARED));
+								ATOMISP_MAP_FLAG_CLEARED));
 	xmem_sp_group_ptrs = ia_css_refcount_increment(-1,
 						       mmgr_alloc_attr(sizeof(struct sh_css_sp_group),
-								       MMGR_ATTRIBUTE_CLEARED));
+								       ATOMISP_MAP_FLAG_CLEARED));
 
 	if ((sp_ddr_ptrs == mmgr_NULL) ||
 	    (xmem_sp_group_ptrs == mmgr_NULL))
-- 
2.26.2

