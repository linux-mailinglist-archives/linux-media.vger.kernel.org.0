Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A661E8EC9
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgE3G7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:59:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:44424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728706AbgE3G4E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:04 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2489207DF;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=plivQRHYcTAUg4ZPA9vTT5v0KjNBE51ZLMtZPtOJApE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gc8BTqA/HsHe9HgaR+gyCSQoNqwitiHhVJ6+M2ZnQYapvHYdOpz+v9B5kAzRL1Vf4
         spc5d6l03L5XmEMFegMGoIHjT0DNxuZjfUfgIEmFFUXRGrk4Hg6w7eBBCOwnoLn52M
         40oPlrC1Aj960ZZ0x7ls3/6LRG/52QsVuUpjiCKg=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hoI-Jp; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/41] media: atomisp: reduce abstraction at ia_css_memory_access
Date:   Sat, 30 May 2020 08:55:20 +0200
Message-Id: <c87fdd8a82c50b6160910662d4bd28abfe1a64e3.1590821410.git.mchehab+huawei@kernel.org>
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

Yet another memory abstraction layer. Getting rid of this
may be a little trickier, but let's reduce it to a minimal.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  3 -
 .../memory_access/memory_access.h             | 61 +------------------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  2 +-
 .../media/atomisp/pci/ia_css_memory_access.c  | 45 +-------------
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |  2 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  2 +-
 .../media/atomisp/pci/memory_realloc.c        |  3 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  2 +-
 .../atomisp/pci/runtime/frame/src/frame.c     | 23 ++++---
 .../pci/runtime/isp_param/src/isp_param.c     |  2 +-
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |  4 +-
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   |  2 +-
 .../media/atomisp/pci/sh_css_firmware.c       |  2 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 41 +++++++------
 14 files changed, 51 insertions(+), 143 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 254a71442451..e2149b16c9fd 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -28,9 +28,6 @@
 #include "hmm/hmm_pool.h"
 #include "ia_css_types.h"
 
-#define HMM_CACHED true
-#define HMM_UNCACHED false
-
 int hmm_pool_register(unsigned int pool_size, enum hmm_pool_type pool_type);
 void hmm_pool_unregister(enum hmm_pool_type pool_type);
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
index cdba741dfdf2..c8a41e5d8dab 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
@@ -76,37 +76,12 @@
  * within the allocation referencable from the
  * returned pointer/address.
  */
-#define MMGR_ATTRIBUTE_MASK		0x000f
 #define MMGR_ATTRIBUTE_CACHED		0x0001
 #define MMGR_ATTRIBUTE_CONTIGUOUS	0x0002
-#define MMGR_ATTRIBUTE_PAGEALIGN	0x0004
 #define MMGR_ATTRIBUTE_CLEARED		0x0008
-#define MMGR_ATTRIBUTE_UNUSED		0xfff0
 
-/* #define MMGR_ATTRIBUTE_DEFAULT	(MMGR_ATTRIBUTE_CACHED) */
-#define MMGR_ATTRIBUTE_DEFAULT	0
-
-extern const hrt_vaddress	mmgr_NULL;
-extern const hrt_vaddress	mmgr_EXCEPTION;
-
-/*! Return the address of an allocation in memory
-
- \param	size[in]		Size in bytes of the allocation
- \param	caller_func[in]		Caller function name
- \param	caller_line[in]		Caller function line number
-
- \return vaddress
- */
-hrt_vaddress mmgr_malloc(const size_t size);
-
-/*! Return the address of a zero initialised allocation in memory
-
- \param	N[in]			Horizontal dimension of array
- \param	size[in]		Vertical dimension of array  Total size is N*size
-
- \return vaddress
- */
-hrt_vaddress mmgr_calloc(const size_t N, const size_t size);
+#define mmgr_NULL		((hrt_vaddress)0)
+#define mmgr_EXCEPTION		((hrt_vaddress)-1)
 
 /*! Return the address of an allocation in memory
 
@@ -119,38 +94,6 @@ hrt_vaddress mmgr_calloc(const size_t N, const size_t size);
 
 hrt_vaddress mmgr_alloc_attr(const size_t size, const uint16_t attribute);
 
-/*! Return the address of a mapped existing allocation in memory
-
- \param	ptr[in]			Pointer to an allocation in a different
-				virtual memory page table, but the same
-				physical memory
- \param size[in]		Size of the memory of the pointer
- \param	attribute[in]		Bit vector specifying the properties
-				of the allocation
- \param context			Pointer of a context provided by
-				client/driver for additional parameters
-				needed by the implementation
- \Note
-	This interface is tentative, limited to the desired function
-	the actual interface may require furhter parameters
-
- \return vaddress
- */
-hrt_vaddress mmgr_mmap(
-    const void __user *ptr,
-    const size_t size,
-    u16 attribute,
-    unsigned int pgnr);
-
-/*! Zero initialise an allocation in memory
-
- \param	vaddr[in]		Address of an allocation
- \param	size[in]		Size in bytes of the area to be cleared
-
- \return none
- */
-void mmgr_clear(hrt_vaddress vaddr, const size_t	size);
-
 /*! Read an array of bytes from a virtual memory address
 
  \param	vaddr[in]		Address of an allocation
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 0ff81ea06241..975749d67131 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -193,7 +193,7 @@ int hmm_init(void)
 	 * at the beginning, to avoid hmm_alloc return 0 in the
 	 * further allocation.
 	 */
-	dummy_ptr = hmm_alloc(1, HMM_BO_PRIVATE, 0, NULL, HMM_UNCACHED);
+	dummy_ptr = hmm_alloc(1, HMM_BO_PRIVATE, 0, NULL, false);
 
 	if (!ret) {
 		ret = sysfs_create_group(&atomisp_dev->kobj,
diff --git a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
index ae9d453aed00..d11843a717e0 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
@@ -20,46 +20,24 @@
 
 #include "atomisp_internal.h"
 
-const hrt_vaddress mmgr_NULL = (hrt_vaddress)0;
-const hrt_vaddress mmgr_EXCEPTION = (hrt_vaddress)-1;
-
-hrt_vaddress
-mmgr_malloc(const size_t size)
-{
-	return mmgr_alloc_attr(size, 0);
-}
-
 hrt_vaddress mmgr_alloc_attr(const size_t size, const uint16_t attrs)
 {
-	u16 masked_attrs = attrs & MMGR_ATTRIBUTE_MASK;
 	ia_css_ptr data;
 
 	WARN_ON(attrs & MMGR_ATTRIBUTE_CONTIGUOUS);
 
 	data = hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL,
-			 masked_attrs & MMGR_ATTRIBUTE_CACHED);
+			 attrs & MMGR_ATTRIBUTE_CACHED);
 
 	if (!data)
 		return 0;
 
-	if (masked_attrs & MMGR_ATTRIBUTE_CLEARED)
+	if (attrs & MMGR_ATTRIBUTE_CLEARED)
 		hmm_set(data, 0, size);
 
 	return (ia_css_ptr)data;
 }
 
-hrt_vaddress
-mmgr_calloc(const size_t N, const size_t size)
-{
-	return mmgr_alloc_attr(size * N, MMGR_ATTRIBUTE_CLEARED);
-}
-
-void mmgr_clear(hrt_vaddress vaddr, const size_t size)
-{
-	if (vaddr)
-		hmm_set(vaddr, 0, size);
-}
-
 void mmgr_load(const hrt_vaddress vaddr, void *data, const size_t size)
 {
 	if (vaddr && data)
@@ -72,22 +50,3 @@ mmgr_store(const hrt_vaddress vaddr, const void *data, const size_t size)
 	if (vaddr && data)
 		hmm_store(vaddr, data, size);
 }
-
-hrt_vaddress
-mmgr_mmap(const void __user *ptr, const size_t size,
-	  u16 attribute, unsigned int pgnr)
-{
-	if (pgnr < ((PAGE_ALIGN(size)) >> PAGE_SHIFT)) {
-		dev_err(atomisp_dev,
-			"user space memory size is less than the expected size..\n");
-		return -ENOMEM;
-	} else if (pgnr > ((PAGE_ALIGN(size)) >> PAGE_SHIFT)) {
-		dev_err(atomisp_dev,
-			"user space memory size is large than the expected size..\n");
-		return -ENOMEM;
-	}
-
-	return hmm_alloc(size, HMM_BO_USER, 0, ptr,
-			 attribute & MMGR_ATTRIBUTE_CACHED);
-
-}
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index 418481e016f7..827400957bad 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -329,7 +329,7 @@ ia_css_isp_dvs_statistics_allocate(
 			    HIVE_ISP_DDR_WORD_BYTES);
 
 	me->size = hor_size + ver_size;
-	me->data_ptr = mmgr_malloc(me->size);
+	me->data_ptr = mmgr_alloc_attr(me->size, 0);
 	if (me->data_ptr == mmgr_NULL)
 		goto err;
 	me->hor_size = hor_size;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index 20fa7d924d58..21e5fb940180 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -295,7 +295,7 @@ ia_css_isp_dvs2_statistics_allocate(
 	       * grid->aligned_height * IA_CSS_DVS2_NUM_COEF_TYPES;
 
 	me->size = 2 * size;
-	me->data_ptr = mmgr_malloc(me->size);
+	me->data_ptr = mmgr_alloc_attr(me->size, 0);
 	if (me->data_ptr == mmgr_NULL)
 		goto err;
 	me->hor_proj = me->data_ptr;
diff --git a/drivers/staging/media/atomisp/pci/memory_realloc.c b/drivers/staging/media/atomisp/pci/memory_realloc.c
index e640d5daf502..ec0a078e65f9 100644
--- a/drivers/staging/media/atomisp/pci/memory_realloc.c
+++ b/drivers/staging/media/atomisp/pci/memory_realloc.c
@@ -32,12 +32,11 @@ bool reallocate_buffer(
     enum ia_css_err *err)
 {
 	bool ret;
-	u16	mmgr_attribute = MMGR_ATTRIBUTE_DEFAULT;
 
 	IA_CSS_ENTER_PRIVATE("void");
 
 	ret = realloc_isp_css_mm_buf(curr_buf,
-				     curr_size, needed_size, force, err, mmgr_attribute);
+				     curr_size, needed_size, force, err, 0);
 
 	IA_CSS_LEAVE_PRIVATE("ret=%d", ret);
 	return ret;
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 0f0d9d88e1fe..070025de2ae6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -2490,7 +2490,7 @@ void ia_css_debug_dump_perf_counters(void)
 void sh_css_init_ddr_debug_queue(void)
 {
 	hrt_vaddress ddr_debug_queue_addr =
-			mmgr_malloc(sizeof(debug_data_ddr_t));
+			mmgr_alloc_attr(sizeof(debug_data_ddr_t), 0);
 	const struct ia_css_fw_info *fw;
 	unsigned int HIVE_ADDR_debug_buffer_ddr_address;
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 0c1e30f2923b..75edd79b7968 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -19,6 +19,7 @@
 #include "isp.h"
 #include "sh_css_internal.h"
 #include "memory_access.h"
+#include "atomisp_internal.h"
 
 #define NV12_TILEY_TILE_WIDTH  128
 #define NV12_TILEY_TILE_HEIGHT  32
@@ -96,7 +97,7 @@ ia_css_elems_bytes_from_info(
 void ia_css_frame_zero(struct ia_css_frame *frame)
 {
 	assert(frame);
-	mmgr_clear(frame->data, frame->data_bytes);
+	hmm_set(frame->data, 0, frame->data_bytes);
 }
 
 enum ia_css_err ia_css_frame_allocate_from_info(struct ia_css_frame **frame,
@@ -166,10 +167,19 @@ enum ia_css_err ia_css_frame_map(struct ia_css_frame **frame,
 		return err;
 
 	if (err == IA_CSS_SUCCESS) {
-		/* use mmgr_mmap to map */
-		me->data = (ia_css_ptr) mmgr_mmap(data,
-						  me->data_bytes,
-						  attribute, pgnr);
+		if (pgnr < ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
+			dev_err(atomisp_dev,
+				"user space memory size is less than the expected size..\n");
+			return -ENOMEM;
+		} else if (pgnr > ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
+			dev_err(atomisp_dev,
+				"user space memory size is large than the expected size..\n");
+			return -ENOMEM;
+		}
+
+		return hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data,
+				 attribute & MMGR_ATTRIBUTE_CACHED);
+
 		if (me->data == mmgr_NULL)
 			err = IA_CSS_ERR_INVALID_ARGUMENTS;
 	}
@@ -789,8 +799,7 @@ static enum ia_css_err frame_allocate_buffer_data(struct ia_css_frame *frame)
 #endif
 	frame->data = mmgr_alloc_attr(frame->data_bytes,
 				      frame->contiguous ?
-				      MMGR_ATTRIBUTE_CONTIGUOUS :
-				      MMGR_ATTRIBUTE_DEFAULT);
+				      MMGR_ATTRIBUTE_CONTIGUOUS : 0);
 
 	if (frame->data == mmgr_NULL)
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 443e412d05ad..8138fb8b4155 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -127,7 +127,7 @@ ia_css_isp_param_allocate_isp_parameters(
 					goto cleanup;
 				}
 				if (pclass != IA_CSS_PARAM_CLASS_PARAM) {
-					css_params->params[pclass][mem].address = mmgr_malloc(size);
+					css_params->params[pclass][mem].address = mmgr_alloc_attr(size, 0);
 					if (!css_params->params[pclass][mem].address) {
 						err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 						goto cleanup;
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 2c204dceb491..714b8099e544 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -17,7 +17,7 @@
 #include <type_support.h>
 #include <assert_support.h>
 #include <platform_support.h> /* memset */
-#include <memory_access.h>    /* mmmgr_malloc, mhmm_free */
+#include <memory_access.h>    /* mmmgr_alloc_attr */
 #include <ia_css_debug.h>
 
 /*
@@ -297,7 +297,7 @@ void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			}
 			if ((*handle)->vptr == 0x0) {
 				/* we need to allocate */
-				(*handle)->vptr = mmgr_malloc((*handle)->size);
+				(*handle)->vptr = mmgr_alloc_attr((*handle)->size, 0);
 			} else {
 				/* we popped a buffer */
 				return;
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index db39fa273251..19326d888e53 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -63,7 +63,7 @@ enum ia_css_err ia_css_spctrl_load_fw(sp_ID_t sp_id,
 	 * Data used to be stored separately, because of access alignment constraints,
 	 * fix the FW generation instead
 	 */
-	code_addr = mmgr_malloc(spctrl_cfg->code_size);
+	code_addr = mmgr_alloc_attr(spctrl_cfg->code_size, 0);
 	if (code_addr == mmgr_NULL)
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 	mmgr_store(code_addr, spctrl_cfg->code, spctrl_cfg->code_size);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index eb3c01574853..5a2e86b02c85 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -322,7 +322,7 @@ void sh_css_unload_firmware(void)
 hrt_vaddress
 sh_css_load_blob(const unsigned char *blob, unsigned int size)
 {
-	hrt_vaddress target_addr = mmgr_malloc(size);
+	hrt_vaddress target_addr = mmgr_alloc_attr(size, 0);
 	/* this will allocate memory aligned to a DDR word boundary which
 	   is required for the CSS DMA to read the instructions. */
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 2e719f7db89e..0a59ef0d4bce 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2757,12 +2757,11 @@ static bool reallocate_buffer(
     enum ia_css_err *err)
 {
 	bool ret;
-	u16	mmgr_attribute = MMGR_ATTRIBUTE_DEFAULT;
 
 	IA_CSS_ENTER_PRIVATE("void");
 
 	ret = realloc_isp_css_mm_buf(curr_buf,
-				     curr_size, needed_size, force, err, mmgr_attribute);
+				     curr_size, needed_size, force, err, 0);
 
 	IA_CSS_LEAVE_PRIVATE("ret=%d", ret);
 	return ret;
@@ -2803,7 +2802,7 @@ ia_css_isp_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 	me->hmem_size = CEIL_MUL(me->hmem_size, HIVE_ISP_DDR_WORD_BYTES);
 
 	me->size = me->dmem_size + me->vmem_size * 2 + me->hmem_size;
-	me->data_ptr = mmgr_malloc(me->size);
+	me->data_ptr = mmgr_alloc_attr(me->size, 0);
 	if (me->data_ptr == mmgr_NULL) {
 		sh_css_free(me);
 		me = NULL;
@@ -2853,7 +2852,7 @@ ia_css_metadata_allocate(const struct ia_css_metadata_info *metadata_info)
 
 	md->info = *metadata_info;
 	md->exp_id = 0;
-	md->address = mmgr_malloc(metadata_info->size);
+	md->address = mmgr_alloc_attr(metadata_info->size, 0);
 	if (md->address == mmgr_NULL)
 		goto error;
 
@@ -3010,13 +3009,13 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 	ddr_ptrs_size->isp_param = params_size;
 	ddr_ptrs->isp_param =
 	ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_BUFFER,
-				  mmgr_malloc(params_size));
+				  mmgr_alloc_attr(params_size, 0));
 	succ &= (ddr_ptrs->isp_param != mmgr_NULL);
 
 	ddr_ptrs_size->macc_tbl = sizeof(struct ia_css_macc_table);
 	ddr_ptrs->macc_tbl =
 	ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_BUFFER,
-				  mmgr_malloc(sizeof(struct ia_css_macc_table)));
+				  mmgr_alloc_attr(sizeof(struct ia_css_macc_table), 0));
 	succ &= (ddr_ptrs->macc_tbl != mmgr_NULL);
 
 	*isp_params_out = params;
@@ -3267,12 +3266,12 @@ sh_css_params_init(void) {
 		for (i = 0; i < SH_CSS_MAX_STAGES; i++) {
 			xmem_sp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
-						  mmgr_calloc(1,
-							      sizeof(struct sh_css_sp_stage)));
+						  mmgr_alloc_attr(sizeof(struct sh_css_sp_stage),
+								  MMGR_ATTRIBUTE_CLEARED));
 			xmem_isp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
-						  mmgr_calloc(1,
-							      sizeof(struct sh_css_isp_stage)));
+						  mmgr_alloc_attr(sizeof(struct sh_css_sp_stage),
+								  MMGR_ATTRIBUTE_CLEARED));
 
 			if ((xmem_sp_stage_ptrs[p][i] == mmgr_NULL) ||
 			    (xmem_isp_stage_ptrs[p][i] == mmgr_NULL)) {
@@ -3288,11 +3287,13 @@ sh_css_params_init(void) {
 	ia_css_config_rgb_gamma_tables();
 	ia_css_config_xnr_table();
 
-	sp_ddr_ptrs = ia_css_refcount_increment(-1, mmgr_calloc(1,
-						CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
-							HIVE_ISP_DDR_WORD_BYTES)));
-	xmem_sp_group_ptrs = ia_css_refcount_increment(-1, mmgr_calloc(1,
-			     sizeof(struct sh_css_sp_group)));
+	sp_ddr_ptrs = ia_css_refcount_increment(-1,
+						mmgr_alloc_attr(CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
+									 HIVE_ISP_DDR_WORD_BYTES),
+								MMGR_ATTRIBUTE_CLEARED));
+	xmem_sp_group_ptrs = ia_css_refcount_increment(-1,
+						       mmgr_alloc_attr(sizeof(struct sh_css_sp_group),
+								       MMGR_ATTRIBUTE_CLEARED));
 
 	if ((sp_ddr_ptrs == mmgr_NULL) ||
 	    (xmem_sp_group_ptrs == mmgr_NULL))
@@ -3316,7 +3317,7 @@ static void host_lut_store(const void *lut)
 /* Note that allocation is in ipu address space. */
 inline hrt_vaddress sh_css_params_alloc_gdc_lut(void)
 {
-	return mmgr_malloc(sizeof(zoom_table));
+	return mmgr_alloc_attr(sizeof(zoom_table), 0);
 }
 
 inline void sh_css_params_free_gdc_lut(hrt_vaddress addr)
@@ -3356,7 +3357,7 @@ enum ia_css_err ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 
 	if (!stream_started) {
 		if (!atomisp_hw_is_isp2401)
-			pipe->scaler_pp_lut = mmgr_malloc(sizeof(zoom_table));
+			pipe->scaler_pp_lut = mmgr_alloc_attr(sizeof(zoom_table), 0);
 		else
 			pipe->scaler_pp_lut = sh_css_params_alloc_gdc_lut();
 
@@ -3401,7 +3402,7 @@ enum ia_css_err sh_css_params_map_and_store_default_gdc_lut(void)
 	host_lut_store((void *)zoom_table);
 
 	if (!atomisp_hw_is_isp2401)
-		default_gdc_lut = mmgr_malloc(sizeof(zoom_table));
+		default_gdc_lut = mmgr_alloc_attr(sizeof(zoom_table), 0);
 	else
 		default_gdc_lut = sh_css_params_alloc_gdc_lut();
 
@@ -4540,8 +4541,8 @@ static enum ia_css_err write_ia_css_isp_parameter_set_info_to_ddr(
 	assert(me);
 	assert(out);
 
-	*out = ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_SET_POOL, mmgr_malloc(
-					     sizeof(struct ia_css_isp_parameter_set_info)));
+	*out = ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_SET_POOL,
+					 mmgr_alloc_attr(sizeof(struct ia_css_isp_parameter_set_info), 0));
 	succ = (*out != mmgr_NULL);
 	if (succ)
 		mmgr_store(*out,
-- 
2.26.2

