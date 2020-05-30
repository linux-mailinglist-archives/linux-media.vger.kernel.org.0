Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5951E8EAD
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgE3G6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:44916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728788AbgE3G4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3C6A20897;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=vw/Iz5Jl+3iwT5erxVEPNa3zaZ0MrR4KDCytdwPZ+Q0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aG7W1ZkKeMJAhlRV6UKSpmdGw9LgVwUi6wbZb062le6O8aVampZFWgsL2+VVrziz8
         yEp9JxXMQtTD8VKY+6JBysADLrImuKMW04LDBPNg+vjLqbXnVoj49Ih1a7U2xPMdc8
         ++JoSOQgNUsSCrJPKFz+9OFFMdX3MKle8F6Cc67U=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hoh-SM; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v2 08/41] media: atomisp: get rid of memory_access.c
Date:   Sat, 30 May 2020 08:55:25 +0200
Message-Id: <5e16d62e5a00ab9a3bdc27f7960b8c473d718e97.1590821410.git.mchehab+huawei@kernel.org>
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

Now that we have everything in place, we can get rid of the
memory_access abstraction layer.

Now, everything related to heterogeneous memory management
(hmm) is under hmm.c & related pools.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile        |  1 -
 .../staging/media/atomisp/include/hmm/hmm.h   |  3 +
 .../staging/media/atomisp/pci/atomisp_acc.c   |  3 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |  1 -
 .../atomisp/pci/base/refcount/src/refcount.c  |  3 +-
 .../pci/hive_isp_css_common/host/debug.c      |  3 +-
 .../hive_isp_css_common/host/debug_private.h  |  1 -
 .../memory_access/memory_access.h             | 94 -------------------
 .../media/atomisp/pci/ia_css_memory_access.c  | 20 ----
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c  |  1 -
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  3 +-
 .../raw_aa_binning_1.0/ia_css_raa.host.c      |  1 -
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |  5 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  5 +-
 .../media/atomisp/pci/mmu/sh_mmu_mrfld.c      |  1 -
 .../atomisp/pci/runtime/binary/src/binary.c   |  4 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  3 +-
 .../atomisp/pci/runtime/event/src/event.c     |  1 -
 .../atomisp/pci/runtime/frame/src/frame.c     | 21 +++--
 .../pci/runtime/isp_param/src/isp_param.c     |  5 +-
 .../pci/runtime/pipeline/src/pipeline.c       |  3 +-
 .../pci/runtime/queue/src/queue_access.c      |  3 +-
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |  4 +-
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   |  5 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  3 +-
 .../media/atomisp/pci/sh_css_firmware.c       |  5 +-
 .../staging/media/atomisp/pci/sh_css_mmu.c    |  1 -
 .../media/atomisp/pci/sh_css_param_dvs.c      |  1 -
 .../staging/media/atomisp/pci/sh_css_params.c | 46 +++++----
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  3 +-
 30 files changed, 79 insertions(+), 174 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
 delete mode 100644 drivers/staging/media/atomisp/pci/ia_css_memory_access.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 4a77d6d6910d..01764c487b52 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -54,7 +54,6 @@ atomisp-objs += \
 	pci/hmm/hmm.o \
 	pci/hmm/hmm_reserved_pool.o \
 	pci/ia_css_device_access.o \
-	pci/ia_css_memory_access.o \
 	pci/isp/kernels/aa/aa_2/ia_css_aa2.host.o \
 	pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.o \
 	pci/isp/kernels/anr/anr_2/ia_css_anr2.host.o \
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a661c039a2cc..5d725a6b6e10 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -28,6 +28,9 @@
 #include "hmm/hmm_pool.h"
 #include "ia_css_types.h"
 
+#define mmgr_NULL              ((ia_css_ptr)0)
+#define mmgr_EXCEPTION         ((ia_css_ptr)-1)
+
 int hmm_pool_register(unsigned int pool_size, enum hmm_pool_type pool_type);
 void hmm_pool_unregister(enum hmm_pool_type pool_type);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
index 5e7f4cd47c8f..8633afdc3f39 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.c
@@ -23,12 +23,13 @@
 #include <linux/init.h>
 #include <media/v4l2-event.h>
 
+#include "hmm.h"
+
 #include "atomisp_acc.h"
 #include "atomisp_internal.h"
 #include "atomisp_compat.h"
 #include "atomisp_cmd.h"
 
-#include "memory_access/memory_access.h"
 #include "ia_css.h"
 
 static const struct {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index fc3043bded46..1588e84a6b91 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -36,7 +36,6 @@
 
 #include "type_support.h"
 #include "device_access/device_access.h"
-#include "memory_access/memory_access.h"
 
 #include "atomisp_acc.h"
 
diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 52c40aaa1e52..1616f3a38ddd 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -12,8 +12,9 @@
  * more details.
  */
 
+#include "hmm.h"
+
 #include "ia_css_refcount.h"
-#include "memory_access/memory_access.h"
 #include "sh_css_defs.h"
 
 #include "platform_support.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
index 3a5414b8912a..85b054c5ec80 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
@@ -14,11 +14,12 @@
 
 #include "debug.h"
 
+#include "hmm.h"
+
 #ifndef __INLINE_DEBUG__
 #include "debug_private.h"
 #endif /* __INLINE_DEBUG__ */
 
-#include "memory_access.h"
 
 #define __INLINE_SP__
 #include "sp.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
index f2f5b7658819..0b107ee13072 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
@@ -22,7 +22,6 @@
 #define __INLINE_ISP__
 #include "isp.h"
 
-#include "memory_access.h"
 
 #include "assert_support.h"
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
deleted file mode 100644
index 8559b5045f20..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
+++ /dev/null
@@ -1,94 +0,0 @@
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015-2017, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-#ifndef __MEMORY_ACCESS_H_INCLUDED__
-#define __MEMORY_ACCESS_H_INCLUDED__
-
-/*!
- * \brief
- * Define the public interface for virtual memory
- * access functions. Access types are limited to
- * those defined in <stdint.h>
- *
- * The address representation is private to the system
- * and represented as "ia_css_ptr" rather than a
- * pointer, as the memory allocation cannot be accessed
- * by dereferencing but reaquires load and store access
- * functions
- *
- * The page table selection or virtual memory context;
- * The page table base index; Is implicit. This page
- * table base index must be set by the implementation
- * of the access function
- *
- * "store" is a transfer to the system
- * "load" is a transfer from the system
- *
- * Allocation properties can be specified by setting
- * attributes (see below) in case of multiple physical
- * memories the memory ID is encoded on the attribute
- *
- * Allocations in the same physical memory, but in a
- * different (set of) page tables can be shared through
- * a page table information mapping function
- */
-
-#include <type_support.h>
-#include "platform_support.h"	/* for __func__ */
-
-/*
- * User provided file that defines the (sub)system address types:
- *	- ia_css_ptr	a type that can hold the (sub)system virtual address range
- */
-#include "system_types.h"
-
-/*
- * The MMU base address is a physical address, thus the same type is used
- * as for the device base address
- */
-#include "device_access.h"
-
-#include "hmm/hmm.h"
-
-/*!
- * \brief
- * Bit masks for specialised allocation functions
- * the default is "uncached", "not contiguous",
- * "not page aligned" and "not cleared"
- *
- * Forcing alignment (usually) returns a pointer
- * at an alignment boundary that is offset from
- * the allocated pointer. Without storing this
- * pointer/offset, we cannot free it. The memory
- * manager is responsible for the bookkeeping, e.g.
- * the allocation function creates a sentinel
- * within the allocation referencable from the
- * returned pointer/address.
- */
-
-#define mmgr_NULL		((ia_css_ptr)0)
-#define mmgr_EXCEPTION		((ia_css_ptr)-1)
-
-/*! Return the address of an allocation in memory
-
- \param	size[in]		Size in bytes of the allocation
- \param	attribute[in]		Bit vector specifying the properties
-				of the allocation including zero initialisation
-
- \return vaddress
- */
-
-ia_css_ptr mmgr_alloc_attr(const size_t size, const uint16_t attribute);
-
-#endif /* __MEMORY_ACCESS_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
deleted file mode 100644
index 79048e1d6bcc..000000000000
--- a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
+++ /dev/null
@@ -1,20 +0,0 @@
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015-2017, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-#include <memory_access.h>
-
-ia_css_ptr mmgr_alloc_attr(const size_t size, const uint16_t attrs)
-{
-	return hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, attrs);
-}
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 6c7aa51ec079..4f1efd6db536 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -14,7 +14,6 @@
 
 #if !defined(HAS_NO_HMEM)
 
-#include "memory_access.h"
 #include "ia_css_types.h"
 #include "sh_css_internal.h"
 #include "assert_support.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index 775a0009e1b6..4dd0b0373e79 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -12,6 +12,8 @@
  * more details.
  */
 
+#include "hmm.h"
+
 #include "ia_css_frame_public.h"
 #define IA_CSS_INCLUDE_CONFIGURATIONS
 #include "ia_css_isp_configs.h"
@@ -22,7 +24,6 @@
 #include "sh_css_params.h"
 #include "ia_css_binary.h"
 #include "ia_css_debug.h"
-#include "memory_access.h"
 #include "assert_support.h"
 
 #include "ia_css_dvs.host.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
index 2045b974ec8a..5aaa018370ef 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
@@ -14,7 +14,6 @@
 
 #if !defined(HAS_NO_HMEM)
 
-#include "memory_access.h"
 #include "ia_css_types.h"
 #include "sh_css_internal.h"
 #include "sh_css_frac.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index fb0e6dcbca43..dfd621d3f6da 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -12,7 +12,8 @@
  * more details.
  */
 
-#include "memory_access.h"
+#include "hmm.h"
+
 #include "assert_support.h"
 #include "ia_css_debug.h"
 #include "ia_css_sdis_types.h"
@@ -329,7 +330,7 @@ ia_css_isp_dvs_statistics_allocate(
 			    HIVE_ISP_DDR_WORD_BYTES);
 
 	me->size = hor_size + ver_size;
-	me->data_ptr = mmgr_alloc_attr(me->size, 0);
+	me->data_ptr = hmm_alloc(me->size, HMM_BO_PRIVATE, 0, NULL, 0);
 	if (me->data_ptr == mmgr_NULL)
 		goto err;
 	me->hor_size = hor_size;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index b9c7736baa44..ca34299b7998 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -12,8 +12,9 @@
  * more details.
  */
 
+#include "hmm.h"
+
 #include <assert_support.h>
-#include "memory_access.h"
 #include "ia_css_debug.h"
 #include "ia_css_sdis2.host.h"
 
@@ -295,7 +296,7 @@ ia_css_isp_dvs2_statistics_allocate(
 	       * grid->aligned_height * IA_CSS_DVS2_NUM_COEF_TYPES;
 
 	me->size = 2 * size;
-	me->data_ptr = mmgr_alloc_attr(me->size, 0);
+	me->data_ptr = hmm_alloc(me->size, HMM_BO_PRIVATE, 0, NULL, 0);
 	if (me->data_ptr == mmgr_NULL)
 		goto err;
 	me->hor_proj = me->data_ptr;
diff --git a/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c b/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
index 031d7fa00510..0f55978ad2bd 100644
--- a/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
+++ b/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
@@ -19,7 +19,6 @@
 #include "type_support.h"
 #include "mmu/isp_mmu.h"
 #include "mmu/sh_mmu_mrfld.h"
-#include "memory_access/memory_access.h"
 #include "atomisp_compat.h"
 
 #define MERR_VALID_PTE_MASK	0x80000000
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 2a23b7c6aeeb..c7083d9b3f10 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -14,6 +14,9 @@
 
 #include <math_support.h>
 #include <gdc_device.h>	/* HR_GDC_N */
+
+#include "hmm.h"
+
 #include "isp.h"	/* ISP_VEC_NELEMS */
 
 #include "ia_css_binary.h"
@@ -33,7 +36,6 @@
 
 #include "camera/pipe/interface/ia_css_pipe_binarydesc.h"
 
-#include "memory_access.h"
 
 #include "assert_support.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 7784e39869a6..c46621315e7b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -13,7 +13,6 @@
  */
 
 #include "debug.h"
-#include "memory_access.h"
 
 #ifndef __INLINE_INPUT_SYSTEM__
 #define __INLINE_INPUT_SYSTEM__
@@ -2490,7 +2489,7 @@ void ia_css_debug_dump_perf_counters(void)
 void sh_css_init_ddr_debug_queue(void)
 {
 	ia_css_ptr ddr_debug_queue_addr =
-			mmgr_alloc_attr(sizeof(debug_data_ddr_t), 0);
+			hmm_alloc(sizeof(debug_data_ddr_t), HMM_BO_PRIVATE, 0, NULL, 0);
 	const struct ia_css_fw_info *fw;
 	unsigned int HIVE_ADDR_debug_buffer_ddr_address;
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/event/src/event.c b/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
index c4578470ad8c..4bbed9ee2e35 100644
--- a/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
+++ b/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
@@ -29,7 +29,6 @@
 
 /*#include "sp.h"*/	/* host2sp_enqueue_frame_data() */
 
-#include "memory_access.h"
 
 #include "assert_support.h"
 #include "platform_support.h"	/* hrt_sleep() */
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 9a9c1fffd3d9..c7d15a01ec9a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -12,13 +12,14 @@
  * more details.
  */
 
+#include "hmm.h"
+
 #include "ia_css_frame.h"
 #include <math_support.h>
 #include "assert_support.h"
 #include "ia_css_debug.h"
 #include "isp.h"
 #include "sh_css_internal.h"
-#include "memory_access.h"
 #include "atomisp_internal.h"
 
 #define NV12_TILEY_TILE_WIDTH  128
@@ -170,20 +171,23 @@ enum ia_css_err ia_css_frame_map(struct ia_css_frame **frame,
 		if (pgnr < ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
 			dev_err(atomisp_dev,
 				"user space memory size is less than the expected size..\n");
-			return -ENOMEM;
+			err = -ENOMEM;
+			goto error;
 		} else if (pgnr > ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
 			dev_err(atomisp_dev,
 				"user space memory size is large than the expected size..\n");
-			return -ENOMEM;
+			err = -ENOMEM;
+			goto error;
 		}
 
-		return hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data,
-				 attribute & ATOMISP_MAP_FLAG_CACHED);
+		me->data = hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data,
+				     attribute & ATOMISP_MAP_FLAG_CACHED);
 
 		if (me->data == mmgr_NULL)
 			err = IA_CSS_ERR_INVALID_ARGUMENTS;
 	}
 
+error:
 	if (err != IA_CSS_SUCCESS) {
 		sh_css_free(me);
 		me = NULL;
@@ -797,9 +801,10 @@ static enum ia_css_err frame_allocate_buffer_data(struct ia_css_frame *frame)
 #ifdef ISP2401
 	IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
 #endif
-	frame->data = mmgr_alloc_attr(frame->data_bytes,
-				      frame->contiguous ?
-				      ATOMISP_MAP_FLAG_CONTIGUOUS : 0);
+	frame->data = hmm_alloc(frame->data_bytes,
+			        HMM_BO_PRIVATE, 0, NULL,
+			        frame->contiguous ?
+			        ATOMISP_MAP_FLAG_CONTIGUOUS : 0);
 
 	if (frame->data == mmgr_NULL)
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 8646000fabd4..6f7c21bbe62d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -12,7 +12,8 @@
  * more details.
  */
 
-#include "memory_access.h"
+#include "hmm.h"
+
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_param.h"
 
@@ -127,7 +128,7 @@ ia_css_isp_param_allocate_isp_parameters(
 					goto cleanup;
 				}
 				if (pclass != IA_CSS_PARAM_CLASS_PARAM) {
-					css_params->params[pclass][mem].address = mmgr_alloc_attr(size, 0);
+					css_params->params[pclass][mem].address = hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, 0);
 					if (!css_params->params[pclass][mem].address) {
 						err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 						goto cleanup;
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index 8b9982de8deb..f65d7491abd9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -12,11 +12,12 @@
  * more details.
  */
 
+#include "hmm.h"
+
 #include "ia_css_debug.h"
 #include "sw_event_global.h"		/* encode_sw_event */
 #include "sp.h"			/* cnd_sp_irq_enable() */
 #include "assert_support.h"
-#include "memory_access.h"
 #include "sh_css_sp.h"
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_param.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
index a2f7bacd4206..ba7219644256 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
@@ -12,11 +12,12 @@
  * more details.
  */
 
+#include "hmm.h"
+
 #include "type_support.h"
 #include "queue_access.h"
 #include "ia_css_circbuf.h"
 #include "sp.h"
-#include "memory_access.h"
 #include "assert_support.h"
 
 int ia_css_queue_load(
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 714b8099e544..546988a1a42e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -12,12 +12,12 @@
  * more details.
  */
 
+#include "hmm.h"
 #include "ia_css_rmgr.h"
 
 #include <type_support.h>
 #include <assert_support.h>
 #include <platform_support.h> /* memset */
-#include <memory_access.h>    /* mmmgr_alloc_attr */
 #include <ia_css_debug.h>
 
 /*
@@ -297,7 +297,7 @@ void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			}
 			if ((*handle)->vptr == 0x0) {
 				/* we need to allocate */
-				(*handle)->vptr = mmgr_alloc_attr((*handle)->size, 0);
+				(*handle)->vptr = hmm_alloc((*handle)->size, HMM_BO_PRIVATE, 0, NULL, 0);
 			} else {
 				/* we popped a buffer */
 				return;
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 142f181d1e55..d361ccdd70e8 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -12,11 +12,12 @@
  * more details.
  */
 
+#include "hmm.h"
+
 #include "ia_css_types.h"
 #define __INLINE_SP__
 #include "sp.h"
 
-#include "memory_access.h"
 #include "assert_support.h"
 #include "ia_css_spctrl.h"
 #include "ia_css_debug.h"
@@ -63,7 +64,7 @@ enum ia_css_err ia_css_spctrl_load_fw(sp_ID_t sp_id,
 	 * Data used to be stored separately, because of access alignment constraints,
 	 * fix the FW generation instead
 	 */
-	code_addr = mmgr_alloc_attr(spctrl_cfg->code_size, 0);
+	code_addr = hmm_alloc(spctrl_cfg->code_size, HMM_BO_PRIVATE, 0, NULL, 0);
 	if (code_addr == mmgr_NULL)
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 	hmm_store(code_addr, spctrl_cfg->code, spctrl_cfg->code_size);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 5b9ed910f407..835da6f12309 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -17,6 +17,8 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#include "hmm.h"
+
 #include "ia_css.h"
 #include "sh_css_hrt.h"		/* only for file 2 MIPI */
 #include "ia_css_buffer.h"
@@ -52,7 +54,6 @@
 #include "ia_css_isys.h"
 #endif
 
-#include "memory_access.h"
 #include "tag.h"
 #include "assert_support.h"
 #include "math_support.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index e189d59783f8..ee23d28b1bef 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -15,6 +15,8 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#include "hmm.h"
+
 #include <math_support.h>
 #include "platform_support.h"
 #include "sh_css_firmware.h"
@@ -24,7 +26,6 @@
 #include "sh_css_internal.h"
 #include "ia_css_isp_param.h"
 
-#include "memory_access.h"
 #include "assert_support.h"
 #include "string_support.h"
 
@@ -322,7 +323,7 @@ void sh_css_unload_firmware(void)
 ia_css_ptr
 sh_css_load_blob(const unsigned char *blob, unsigned int size)
 {
-	ia_css_ptr target_addr = mmgr_alloc_attr(size, 0);
+	ia_css_ptr target_addr = hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, 0);
 	/* this will allocate memory aligned to a DDR word boundary which
 	   is required for the CSS DMA to read the instructions. */
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index 179b6f40be49..4965a9e5e161 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -43,7 +43,6 @@ ia_css_mmu_invalidate_cache(void)
 			    "ia_css_mmu_invalidate_cache() leave\n");
 }
 
-/* Deprecated, this is an HRT backend function (memory_access.h) */
 void
 sh_css_mmu_set_page_table_base_index(hrt_data base_index)
 {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 52e29161cb35..025f26a40062 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -18,7 +18,6 @@
 #include <ia_css_err.h>
 #include <ia_css_types.h>
 #include "ia_css_debug.h"
-#include "memory_access.h"
 
 static struct ia_css_dvs_6axis_config *
 alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 7bd2fd0124cb..f1b543a6db82 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -24,6 +24,7 @@
 #define IA_CSS_INCLUDE_PARAMETERS
 #define IA_CSS_INCLUDE_ACC_PARAMETERS
 
+#include "hmm.h"
 #include "sh_css_params.h"
 #include "ia_css_queue.h"
 #include "sw_event_global.h"		/* Event IDs */
@@ -45,7 +46,6 @@
 #include "sh_css_sp.h"
 #include "ia_css_pipeline.h"
 #include "ia_css_debug.h"
-#include "memory_access.h"
 
 #include "ia_css_isp_param.h"
 #include "ia_css_isp_params.h"
@@ -2734,8 +2734,10 @@ static bool realloc_isp_css_mm_buf(
 
 	id = IA_CSS_REFCOUNT_PARAM_BUFFER;
 	ia_css_refcount_decrement(id, *curr_buf);
-	*curr_buf = ia_css_refcount_increment(id, mmgr_alloc_attr(needed_size,
-					      mmgr_attribute));
+	*curr_buf = ia_css_refcount_increment(id, hmm_alloc(needed_size,
+							    HMM_BO_PRIVATE, 0,
+							    NULL,
+							    mmgr_attribute));
 
 	if (!*curr_buf) {
 		*err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
@@ -2800,7 +2802,7 @@ ia_css_isp_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 	me->hmem_size = CEIL_MUL(me->hmem_size, HIVE_ISP_DDR_WORD_BYTES);
 
 	me->size = me->dmem_size + me->vmem_size * 2 + me->hmem_size;
-	me->data_ptr = mmgr_alloc_attr(me->size, 0);
+	me->data_ptr = hmm_alloc(me->size, HMM_BO_PRIVATE, 0, NULL, 0);
 	if (me->data_ptr == mmgr_NULL) {
 		sh_css_free(me);
 		me = NULL;
@@ -2850,7 +2852,7 @@ ia_css_metadata_allocate(const struct ia_css_metadata_info *metadata_info)
 
 	md->info = *metadata_info;
 	md->exp_id = 0;
-	md->address = mmgr_alloc_attr(metadata_info->size, 0);
+	md->address = hmm_alloc(metadata_info->size, HMM_BO_PRIVATE, 0, NULL, 0);
 	if (md->address == mmgr_NULL)
 		goto error;
 
@@ -3007,13 +3009,13 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 	ddr_ptrs_size->isp_param = params_size;
 	ddr_ptrs->isp_param =
 	ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_BUFFER,
-				  mmgr_alloc_attr(params_size, 0));
+				  hmm_alloc(params_size, HMM_BO_PRIVATE, 0, NULL, 0));
 	succ &= (ddr_ptrs->isp_param != mmgr_NULL);
 
 	ddr_ptrs_size->macc_tbl = sizeof(struct ia_css_macc_table);
 	ddr_ptrs->macc_tbl =
 	ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_BUFFER,
-				  mmgr_alloc_attr(sizeof(struct ia_css_macc_table), 0));
+				  hmm_alloc(sizeof(struct ia_css_macc_table), HMM_BO_PRIVATE, 0, NULL, 0));
 	succ &= (ddr_ptrs->macc_tbl != mmgr_NULL);
 
 	*isp_params_out = params;
@@ -3264,12 +3266,14 @@ sh_css_params_init(void) {
 		for (i = 0; i < SH_CSS_MAX_STAGES; i++) {
 			xmem_sp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
-						  mmgr_alloc_attr(sizeof(struct sh_css_sp_stage),
-								  ATOMISP_MAP_FLAG_CLEARED));
+						  hmm_alloc(sizeof(struct sh_css_sp_stage),
+							    HMM_BO_PRIVATE, 0, NULL,
+							    ATOMISP_MAP_FLAG_CLEARED));
 			xmem_isp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
-						  mmgr_alloc_attr(sizeof(struct sh_css_sp_stage),
-								  ATOMISP_MAP_FLAG_CLEARED));
+						  hmm_alloc(sizeof(struct sh_css_sp_stage),
+							    HMM_BO_PRIVATE, 0, NULL,
+							    ATOMISP_MAP_FLAG_CLEARED));
 
 			if ((xmem_sp_stage_ptrs[p][i] == mmgr_NULL) ||
 			    (xmem_isp_stage_ptrs[p][i] == mmgr_NULL)) {
@@ -3286,12 +3290,14 @@ sh_css_params_init(void) {
 	ia_css_config_xnr_table();
 
 	sp_ddr_ptrs = ia_css_refcount_increment(-1,
-						mmgr_alloc_attr(CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
-									 HIVE_ISP_DDR_WORD_BYTES),
-								ATOMISP_MAP_FLAG_CLEARED));
+						hmm_alloc(CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
+								   HIVE_ISP_DDR_WORD_BYTES),
+							  HMM_BO_PRIVATE, 0, NULL,
+							  ATOMISP_MAP_FLAG_CLEARED));
 	xmem_sp_group_ptrs = ia_css_refcount_increment(-1,
-						       mmgr_alloc_attr(sizeof(struct sh_css_sp_group),
-								       ATOMISP_MAP_FLAG_CLEARED));
+						       hmm_alloc(sizeof(struct sh_css_sp_group),
+								 HMM_BO_PRIVATE, 0, NULL,
+								 ATOMISP_MAP_FLAG_CLEARED));
 
 	if ((sp_ddr_ptrs == mmgr_NULL) ||
 	    (xmem_sp_group_ptrs == mmgr_NULL))
@@ -3315,7 +3321,7 @@ static void host_lut_store(const void *lut)
 /* Note that allocation is in ipu address space. */
 inline ia_css_ptr sh_css_params_alloc_gdc_lut(void)
 {
-	return mmgr_alloc_attr(sizeof(zoom_table), 0);
+	return hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
 }
 
 inline void sh_css_params_free_gdc_lut(ia_css_ptr addr)
@@ -3355,7 +3361,7 @@ enum ia_css_err ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 
 	if (!stream_started) {
 		if (!atomisp_hw_is_isp2401)
-			pipe->scaler_pp_lut = mmgr_alloc_attr(sizeof(zoom_table), 0);
+			pipe->scaler_pp_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
 		else
 			pipe->scaler_pp_lut = sh_css_params_alloc_gdc_lut();
 
@@ -3400,7 +3406,7 @@ enum ia_css_err sh_css_params_map_and_store_default_gdc_lut(void)
 	host_lut_store((void *)zoom_table);
 
 	if (!atomisp_hw_is_isp2401)
-		default_gdc_lut = mmgr_alloc_attr(sizeof(zoom_table), 0);
+		default_gdc_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
 	else
 		default_gdc_lut = sh_css_params_alloc_gdc_lut();
 
@@ -4540,7 +4546,7 @@ static enum ia_css_err write_ia_css_isp_parameter_set_info_to_ddr(
 	assert(out);
 
 	*out = ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_SET_POOL,
-					 mmgr_alloc_attr(sizeof(struct ia_css_isp_parameter_set_info), 0));
+					 hmm_alloc(sizeof(struct ia_css_isp_parameter_set_info), HMM_BO_PRIVATE, 0, NULL, 0));
 	succ = (*out != mmgr_NULL);
 	if (succ)
 		hmm_store(*out,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 9a80968f115a..1ed060d6d855 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -12,6 +12,8 @@
  * more details.
  */
 
+#include "hmm.h"
+
 #include "sh_css_sp.h"
 
 #if !defined(HAS_NO_INPUT_FORMATTER)
@@ -43,7 +45,6 @@
 
 /*#include "sp.h"*/	/* host2sp_enqueue_frame_data() */
 
-#include "memory_access.h"
 
 #include "assert_support.h"
 #include "platform_support.h"	/* hrt_sleep() */
-- 
2.26.2

