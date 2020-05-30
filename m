Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426A61E8E87
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgE3G5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:57:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728824AbgE3G4J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EAF2020820;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=5M8B1PEzzWNAt+zlHesObe/X63g4U7gmjkrUgYPrSeg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eOlrF/xfmHse6A1S0EUG7RRxN7+YjvEzmIDcobECDr5/xi10rDki79t+ETgVRmWzg
         r5GDO1dlMER4wvGBBlMdzQZIKZ6bAIl9djiCs147vfX5NrNcDmJiiJCMQbgeOqmolg
         9WX6sz5fzvMn8p5OvjsyMoHsdsjp2biFt9qhJk2Y=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hob-Q7; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/41] media: atomisp: change the type returned by mmgr alloc
Date:   Sat, 30 May 2020 08:55:24 +0200
Message-Id: <199fa367455d06030b694253c92a4d94abc21338.1590821410.git.mchehab+huawei@kernel.org>
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

The mmgr alloc code returns a different type than hmm, due to
some abstraction layer.

Change the driver to use just one type to represent the
hmm memory.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../base/refcount/interface/ia_css_refcount.h | 13 ++--
 .../atomisp/pci/base/refcount/src/refcount.c  | 14 ++--
 .../pci/hive_isp_css_common/host/debug.c      |  4 +-
 .../hive_isp_css_include/host/debug_public.h  |  5 +-
 .../memory_access/memory_access.h             | 10 +--
 .../staging/media/atomisp/pci/hive_types.h    |  3 -
 .../media/atomisp/pci/ia_css_memory_access.c  |  2 +-
 .../staging/media/atomisp/pci/ia_css_pipe.h   |  2 +-
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  2 +-
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h |  2 +-
 .../kernels/ref/ref_1.0/ia_css_ref_param.h    |  4 +-
 .../kernels/tnr/tnr_1.0/ia_css_tnr_param.h    |  2 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  2 +-
 .../frame/interface/ia_css_frame_comm.h       |  4 +-
 .../isp_param/interface/ia_css_isp_param.h    |  2 +-
 .../pci/runtime/isp_param/src/isp_param.c     |  4 +-
 .../runtime/rmgr/interface/ia_css_rmgr_vbuf.h |  3 +-
 .../runtime/spctrl/interface/ia_css_spctrl.h  |  2 +-
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   | 10 +--
 drivers/staging/media/atomisp/pci/sh_css.c    |  8 +-
 .../media/atomisp/pci/sh_css_firmware.c       |  4 +-
 .../media/atomisp/pci/sh_css_firmware.h       |  2 +-
 .../media/atomisp/pci/sh_css_internal.h       | 76 +++++++++----------
 .../staging/media/atomisp/pci/sh_css_params.c | 76 +++++++++----------
 .../staging/media/atomisp/pci/sh_css_params.h | 12 +--
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  4 +-
 .../staging/media/atomisp/pci/sh_css_struct.h |  2 +-
 27 files changed, 137 insertions(+), 137 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h b/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
index 8cf3b0e0cc39..9f6e05b19262 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
+++ b/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
@@ -18,8 +18,9 @@
 #include <type_support.h>
 #include <system_types.h>
 #include <ia_css_err.h>
+#include <ia_css_types.h>
 
-typedef void (*clear_func)(hrt_vaddress ptr);
+typedef void (*clear_func)(ia_css_ptr ptr);
 
 /*! \brief Function for initializing refcount list
  *
@@ -38,9 +39,9 @@ void ia_css_refcount_uninit(void);
  *
  * \param[in]	id		ID of the object.
  * \param[in]	ptr		Data of the object (ptr).
- * \return				hrt_vaddress (saved address)
+ * \return				ia_css_ptr (saved address)
  */
-hrt_vaddress ia_css_refcount_increment(s32 id, hrt_vaddress ptr);
+ia_css_ptr ia_css_refcount_increment(s32 id, ia_css_ptr ptr);
 
 /*! \brief Function for decrease reference by 1.
  *
@@ -50,7 +51,7 @@ hrt_vaddress ia_css_refcount_increment(s32 id, hrt_vaddress ptr);
  *	- true, if it is successful.
  *	- false, otherwise.
  */
-bool ia_css_refcount_decrement(s32 id, hrt_vaddress ptr);
+bool ia_css_refcount_decrement(s32 id, ia_css_ptr ptr);
 
 /*! \brief Function to check if reference count is 1.
  *
@@ -59,7 +60,7 @@ bool ia_css_refcount_decrement(s32 id, hrt_vaddress ptr);
  *	- true, if it is successful.
  *	- false, otherwise.
  */
-bool ia_css_refcount_is_single(hrt_vaddress ptr);
+bool ia_css_refcount_is_single(ia_css_ptr ptr);
 
 /*! \brief Function to clear reference list objects.
  *
@@ -78,6 +79,6 @@ void ia_css_refcount_clear(s32 id,
  *      - true, if valid
  *      - false, if invalid
  */
-bool ia_css_refcount_is_valid(hrt_vaddress ptr);
+bool ia_css_refcount_is_valid(ia_css_ptr ptr);
 
 #endif /* _IA_CSS_REFCOUNT_H_ */
diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 8f0c94449ec9..52c40aaa1e52 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -23,10 +23,10 @@
 #include "ia_css_debug.h"
 
 /* TODO: enable for other memory aswell
-	 now only for hrt_vaddress */
+	 now only for ia_css_ptr */
 struct ia_css_refcount_entry {
 	u32 count;
-	hrt_vaddress data;
+	ia_css_ptr data;
 	s32 id;
 };
 
@@ -37,7 +37,7 @@ struct ia_css_refcount_list {
 
 static struct ia_css_refcount_list myrefcount;
 
-static struct ia_css_refcount_entry *refcount_find_entry(hrt_vaddress ptr,
+static struct ia_css_refcount_entry *refcount_find_entry(ia_css_ptr ptr,
 	bool firstfree)
 {
 	u32 i;
@@ -121,7 +121,7 @@ void ia_css_refcount_uninit(void)
 			    "ia_css_refcount_uninit() leave\n");
 }
 
-hrt_vaddress ia_css_refcount_increment(s32 id, hrt_vaddress ptr)
+ia_css_ptr ia_css_refcount_increment(s32 id, ia_css_ptr ptr)
 {
 	struct ia_css_refcount_entry *entry;
 
@@ -158,7 +158,7 @@ hrt_vaddress ia_css_refcount_increment(s32 id, hrt_vaddress ptr)
 	return ptr;
 }
 
-bool ia_css_refcount_decrement(s32 id, hrt_vaddress ptr)
+bool ia_css_refcount_decrement(s32 id, ia_css_ptr ptr)
 {
 	struct ia_css_refcount_entry *entry;
 
@@ -201,7 +201,7 @@ bool ia_css_refcount_decrement(s32 id, hrt_vaddress ptr)
 	return false;
 }
 
-bool ia_css_refcount_is_single(hrt_vaddress ptr)
+bool ia_css_refcount_is_single(ia_css_ptr ptr)
 {
 	struct ia_css_refcount_entry *entry;
 
@@ -262,7 +262,7 @@ void ia_css_refcount_clear(s32 id, clear_func clear_func_ptr)
 			    count);
 }
 
-bool ia_css_refcount_is_valid(hrt_vaddress ptr)
+bool ia_css_refcount_is_valid(ia_css_ptr ptr)
 {
 	struct ia_css_refcount_entry *entry;
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
index 6079ca1e7732..3a5414b8912a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
@@ -27,7 +27,7 @@
 
 /* The address of the remote copy */
 hrt_address	debug_buffer_address = (hrt_address) - 1;
-hrt_vaddress	debug_buffer_ddr_address = (hrt_vaddress)-1;
+ia_css_ptr	debug_buffer_ddr_address = (ia_css_ptr)-1;
 /* The local copy */
 static debug_data_t		debug_data;
 debug_data_t		*debug_data_ptr = &debug_data;
@@ -40,7 +40,7 @@ void debug_buffer_init(const hrt_address addr)
 	debug_data.tail = 0;
 }
 
-void debug_buffer_ddr_init(const hrt_vaddress addr)
+void debug_buffer_ddr_init(const ia_css_ptr addr)
 {
 	debug_buf_mode_t mode = DEBUG_BUFFER_MODE_LINEAR;
 	u32 enable = 1;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
index 79a8446658ee..aa386e4d4149 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
@@ -16,6 +16,7 @@
 #define __DEBUG_PUBLIC_H_INCLUDED__
 
 #include <type_support.h>
+#include <ia_css_types.h>
 #include "system_types.h"
 
 /*! brief
@@ -42,7 +43,7 @@ typedef struct debug_data_ddr_s	debug_data_ddr_t;
 
 extern debug_data_t				*debug_data_ptr;
 extern hrt_address				debug_buffer_address;
-extern hrt_vaddress				debug_buffer_ddr_address;
+extern ia_css_ptr				debug_buffer_ddr_address;
 
 /*! Check the empty state of the local debug data buffer
 
@@ -86,7 +87,7 @@ void debug_buffer_init(
  \return none
  */
 void debug_buffer_ddr_init(
-    const hrt_vaddress		addr);
+    const ia_css_ptr		addr);
 
 /*! Set the (remote) operating mode of the debug buffer
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
index 4a062ee2f8df..8559b5045f20 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
@@ -22,7 +22,7 @@
  * those defined in <stdint.h>
  *
  * The address representation is private to the system
- * and represented as "hrt_vaddress" rather than a
+ * and represented as "ia_css_ptr" rather than a
  * pointer, as the memory allocation cannot be accessed
  * by dereferencing but reaquires load and store access
  * functions
@@ -49,7 +49,7 @@
 
 /*
  * User provided file that defines the (sub)system address types:
- *	- hrt_vaddress	a type that can hold the (sub)system virtual address range
+ *	- ia_css_ptr	a type that can hold the (sub)system virtual address range
  */
 #include "system_types.h"
 
@@ -77,8 +77,8 @@
  * returned pointer/address.
  */
 
-#define mmgr_NULL		((hrt_vaddress)0)
-#define mmgr_EXCEPTION		((hrt_vaddress)-1)
+#define mmgr_NULL		((ia_css_ptr)0)
+#define mmgr_EXCEPTION		((ia_css_ptr)-1)
 
 /*! Return the address of an allocation in memory
 
@@ -89,6 +89,6 @@
  \return vaddress
  */
 
-hrt_vaddress mmgr_alloc_attr(const size_t size, const uint16_t attribute);
+ia_css_ptr mmgr_alloc_attr(const size_t size, const uint16_t attribute);
 
 #endif /* __MEMORY_ACCESS_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_types.h b/drivers/staging/media/atomisp/pci/hive_types.h
index 9715893c8a36..312a2ab3866d 100644
--- a/drivers/staging/media/atomisp/pci/hive_types.h
+++ b/drivers/staging/media/atomisp/pci/hive_types.h
@@ -78,9 +78,6 @@ typedef hive_uint32 hrt_address;
 #error adddres width not supported
 #endif
 
-/* The SP side representation of an HMM virtual address */
-typedef hive_uint32 hrt_vaddress;
-
 /* use 64 bit addresses in simulation, where possible */
 typedef hive_uint64  hive_sim_address;
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
index 8dd41ec725f4..79048e1d6bcc 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
@@ -14,7 +14,7 @@
 
 #include <memory_access.h>
 
-hrt_vaddress mmgr_alloc_attr(const size_t size, const uint16_t attrs)
+ia_css_ptr mmgr_alloc_attr(const size_t size, const uint16_t attrs)
 {
 	return hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, attrs);
 }
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe.h b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
index 9c9e1264feb0..792b51e8055a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
@@ -146,7 +146,7 @@ struct ia_css_pipe {
 		struct ia_css_capture_settings capture;
 		struct ia_css_yuvpp_settings yuvpp;
 	} pipe_settings;
-	hrt_vaddress scaler_pp_lut;
+	ia_css_ptr scaler_pp_lut;
 	struct osys_object *osys_obj;
 
 	/* This number is unique per pipe each instance of css. This number is
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index d2c3e8edf626..775a0009e1b6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -275,7 +275,7 @@ store_dvs_6axis_config(
     const struct ia_css_dvs_6axis_config *dvs_6axis_config,
     const struct ia_css_binary *binary,
     const struct ia_css_frame_info *dvs_in_frame_info,
-    hrt_vaddress ddr_addr_y) {
+    ia_css_ptr ddr_addr_y) {
 	struct ia_css_host_data *me;
 
 	assert(dvs_6axis_config);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
index d711170cf7cc..81c2d4ef71e2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
@@ -55,6 +55,6 @@ store_dvs_6axis_config(
     const struct ia_css_dvs_6axis_config *dvs_6axis_config,
     const struct ia_css_binary *binary,
     const struct ia_css_frame_info *dvs_in_frame_info,
-    hrt_vaddress ddr_addr_y);
+    ia_css_ptr ddr_addr_y);
 
 #endif /* __IA_CSS_DVS_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h
index 0a0498c17fba..5cb38350ce4f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h
@@ -28,8 +28,8 @@ struct ia_css_ref_configuration {
 struct sh_css_isp_ref_isp_config {
 	u32 width_a_over_b;
 	struct dma_port_config port_b;
-	hrt_vaddress ref_frame_addr_y[MAX_NUM_VIDEO_DELAY_FRAMES];
-	hrt_vaddress ref_frame_addr_c[MAX_NUM_VIDEO_DELAY_FRAMES];
+	ia_css_ptr ref_frame_addr_y[MAX_NUM_VIDEO_DELAY_FRAMES];
+	ia_css_ptr ref_frame_addr_c[MAX_NUM_VIDEO_DELAY_FRAMES];
 	u32 dvs_frame_delay;
 };
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
index 1973766d8e41..9b527eccc35a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
@@ -34,7 +34,7 @@ struct sh_css_isp_tnr_isp_config {
 	u32 width_a_over_b;
 	u32 frame_height;
 	struct dma_port_config port_b;
-	hrt_vaddress tnr_frame_addr[NUM_TNR_FRAMES];
+	ia_css_ptr tnr_frame_addr[NUM_TNR_FRAMES];
 };
 
 #endif /* __IA_CSS_TNR_PARAM_H */
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 070025de2ae6..7784e39869a6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -2489,7 +2489,7 @@ void ia_css_debug_dump_perf_counters(void)
 
 void sh_css_init_ddr_debug_queue(void)
 {
-	hrt_vaddress ddr_debug_queue_addr =
+	ia_css_ptr ddr_debug_queue_addr =
 			mmgr_alloc_attr(sizeof(debug_data_ddr_t), 0);
 	const struct ia_css_fw_info *fw;
 	unsigned int HIVE_ADDR_debug_buffer_ddr_address;
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
index 8861d07193bd..138aaaf07854 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
@@ -18,7 +18,7 @@
 #include "type_support.h"
 #include "platform_support.h"
 #include "runtime/bufq/interface/ia_css_bufq_comm.h"
-#include <system_types.h>	 /* hrt_vaddress */
+#include <system_types.h>	 /* ia_css_ptr */
 
 /*
  * These structs are derived from structs defined in ia_css_types.h
@@ -83,7 +83,7 @@ struct ia_css_frame_sp_info {
 
 struct ia_css_buffer_sp {
 	union {
-		hrt_vaddress xmem_addr;
+		ia_css_ptr xmem_addr;
 		enum sh_css_queue_id queue_id;
 	} buf_src;
 	enum ia_css_buffer_type buf_type;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param.h b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param.h
index 2769183a8956..3c6bba7c7772 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param.h
@@ -31,7 +31,7 @@ ia_css_isp_param_set_css_mem_init(
     struct ia_css_isp_param_css_segments *mem_init,
     enum ia_css_param_class pclass,
     enum ia_css_isp_memories mem,
-    hrt_vaddress address, size_t size);
+    ia_css_ptr address, size_t size);
 
 void
 ia_css_isp_param_set_isp_mem_init(
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index d1442f5653da..8646000fabd4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -34,7 +34,7 @@ ia_css_isp_param_set_css_mem_init(
     struct ia_css_isp_param_css_segments *mem_init,
     enum ia_css_param_class pclass,
     enum ia_css_isp_memories mem,
-    hrt_vaddress address, size_t size)
+    ia_css_ptr address, size_t size)
 {
 	mem_init->params[pclass][mem].address = address;
 	mem_init->params[pclass][mem].size = (uint32_t)size;
@@ -187,7 +187,7 @@ ia_css_isp_param_copy_isp_mem_if_to_ddr(
 	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
 	{
 		size_t       size	  = host->params[pclass][mem].size;
-		hrt_vaddress ddr_mem_ptr  = ddr->params[pclass][mem].address;
+		ia_css_ptr ddr_mem_ptr  = ddr->params[pclass][mem].address;
 		char	    *host_mem_ptr = host->params[pclass][mem].address;
 
 		if (size != ddr->params[pclass][mem].size)
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
index 0660b65f2e34..377f7c8f64db 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
@@ -17,13 +17,14 @@
 
 #include "ia_css_rmgr.h"
 #include <type_support.h>
+#include <ia_css_types.h>
 #include <system_types.h>
 
 /**
  * @brief Data structure for the resource handle (host, vbuf)
  */
 struct ia_css_rmgr_vbuf_handle {
-	hrt_vaddress vptr;
+	ia_css_ptr vptr;
 	u8 count;
 	u32 size;
 };
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 543ca8968418..8a7fe6821b1f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -34,7 +34,7 @@ typedef struct {
 } ia_css_spctrl_cfg;
 
 /* Get the code addr in DDR of SP */
-hrt_vaddress get_sp_code_addr(sp_ID_t  sp_id);
+ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);
 
 /* ! Load firmware on to specfied SP
 */
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 65f8dda5e2c8..142f181d1e55 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -26,7 +26,7 @@ struct spctrl_context_info {
 	u32        spctrl_config_dmem_addr; /* location of dmem_cfg  in SP dmem */
 	u32        spctrl_state_dmem_addr;
 	unsigned int    sp_entry;           /* entry function ptr on SP */
-	hrt_vaddress    code_addr;          /* sp firmware location in host mem-DDR*/
+	ia_css_ptr    code_addr;          /* sp firmware location in host mem-DDR*/
 	u32        code_size;
 	char           *program_name;       /* used in case of PLATFORM_SIM */
 };
@@ -38,7 +38,7 @@ static bool spctrl_loaded[N_SP_ID] = {0};
 enum ia_css_err ia_css_spctrl_load_fw(sp_ID_t sp_id,
 				      ia_css_spctrl_cfg *spctrl_cfg)
 {
-	hrt_vaddress code_addr = mmgr_NULL;
+	ia_css_ptr code_addr = mmgr_NULL;
 	struct ia_css_sp_init_dmem_cfg *init_dmem_cfg;
 
 	if ((sp_id >= N_SP_ID) || (!spctrl_cfg))
@@ -68,9 +68,9 @@ enum ia_css_err ia_css_spctrl_load_fw(sp_ID_t sp_id,
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 	hmm_store(code_addr, spctrl_cfg->code, spctrl_cfg->code_size);
 
-	if (sizeof(hrt_vaddress) > sizeof(hrt_data)) {
+	if (sizeof(ia_css_ptr) > sizeof(hrt_data)) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
-				    "size of hrt_vaddress can not be greater than hrt_data\n");
+				    "size of ia_css_ptr can not be greater than hrt_data\n");
 		hmm_free(code_addr);
 		code_addr = mmgr_NULL;
 		return IA_CSS_ERR_INTERNAL_ERROR;
@@ -112,7 +112,7 @@ void sh_css_spctrl_reload_fw(sp_ID_t sp_id)
 	spctrl_loaded[sp_id] = true;
 }
 
-hrt_vaddress get_sp_code_addr(sp_ID_t  sp_id)
+ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id)
 {
 	return spctrl_cofig_info[sp_id].code_addr;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 791f03572f59..5b9ed910f407 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -383,7 +383,7 @@ static struct sh_css_hmm_buffer_record
 				  hrt_address kernel_ptr);
 
 static struct sh_css_hmm_buffer_record
-*sh_css_hmm_buffer_record_validate(hrt_vaddress ddr_buffer_addr,
+*sh_css_hmm_buffer_record_validate(ia_css_ptr ddr_buffer_addr,
 				   enum ia_css_buffer_type type);
 
 void
@@ -4404,7 +4404,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			   struct ia_css_buffer *buffer) {
 	enum ia_css_err return_err;
 	enum sh_css_queue_id queue_id;
-	hrt_vaddress ddr_buffer_addr = (hrt_vaddress)0;
+	ia_css_ptr ddr_buffer_addr = (ia_css_ptr)0;
 	struct sh_css_hmm_buffer ddr_buffer;
 	enum ia_css_buffer_type buf_type;
 	enum ia_css_pipe_id pipe_id;
@@ -8435,7 +8435,7 @@ remove_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware) {
 }
 
 static enum ia_css_err upload_isp_code(struct ia_css_fw_info *firmware) {
-	hrt_vaddress binary;
+	ia_css_ptr binary;
 
 	if (!firmware) {
 		IA_CSS_ERROR("NULL input parameter");
@@ -11071,7 +11071,7 @@ static struct sh_css_hmm_buffer_record
 }
 
 static struct sh_css_hmm_buffer_record
-*sh_css_hmm_buffer_record_validate(hrt_vaddress ddr_buffer_addr,
+*sh_css_hmm_buffer_record_validate(ia_css_ptr ddr_buffer_addr,
 				    enum ia_css_buffer_type type) {
 	int i;
 	struct sh_css_hmm_buffer_record *buffer_record = NULL;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index fa7c62465f90..e189d59783f8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -319,10 +319,10 @@ void sh_css_unload_firmware(void)
 	sh_css_num_binaries = 0;
 }
 
-hrt_vaddress
+ia_css_ptr
 sh_css_load_blob(const unsigned char *blob, unsigned int size)
 {
-	hrt_vaddress target_addr = mmgr_alloc_attr(size, 0);
+	ia_css_ptr target_addr = mmgr_alloc_attr(size, 0);
 	/* this will allocate memory aligned to a DDR word boundary which
 	   is required for the CSS DMA to read the instructions. */
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.h b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
index f6253392a6c9..75648e4b975e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
@@ -46,7 +46,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 
 void sh_css_unload_firmware(void);
 
-hrt_vaddress sh_css_load_blob(const unsigned char *blob, unsigned int size);
+ia_css_ptr sh_css_load_blob(const unsigned char *blob, unsigned int size);
 
 enum ia_css_err
 sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 731611971420..aaf37f0ad753 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -209,28 +209,28 @@ enum sh_css_sp_event_type {
 };
 
 /* xmem address map allocation per pipeline, css pointers */
-/* Note that the struct below should only consist of hrt_vaddress-es
+/* Note that the struct below should only consist of ia_css_ptr-es
    Otherwise this will cause a fail in the function ref_sh_css_ddr_address_map
  */
 struct sh_css_ddr_address_map {
-	hrt_vaddress isp_param;
-	hrt_vaddress isp_mem_param[SH_CSS_MAX_STAGES][IA_CSS_NUM_MEMORIES];
-	hrt_vaddress macc_tbl;
-	hrt_vaddress fpn_tbl;
-	hrt_vaddress sc_tbl;
-	hrt_vaddress tetra_r_x;
-	hrt_vaddress tetra_r_y;
-	hrt_vaddress tetra_gr_x;
-	hrt_vaddress tetra_gr_y;
-	hrt_vaddress tetra_gb_x;
-	hrt_vaddress tetra_gb_y;
-	hrt_vaddress tetra_b_x;
-	hrt_vaddress tetra_b_y;
-	hrt_vaddress tetra_ratb_x;
-	hrt_vaddress tetra_ratb_y;
-	hrt_vaddress tetra_batr_x;
-	hrt_vaddress tetra_batr_y;
-	hrt_vaddress dvs_6axis_params_y;
+	ia_css_ptr isp_param;
+	ia_css_ptr isp_mem_param[SH_CSS_MAX_STAGES][IA_CSS_NUM_MEMORIES];
+	ia_css_ptr macc_tbl;
+	ia_css_ptr fpn_tbl;
+	ia_css_ptr sc_tbl;
+	ia_css_ptr tetra_r_x;
+	ia_css_ptr tetra_r_y;
+	ia_css_ptr tetra_gr_x;
+	ia_css_ptr tetra_gr_y;
+	ia_css_ptr tetra_gb_x;
+	ia_css_ptr tetra_gb_y;
+	ia_css_ptr tetra_b_x;
+	ia_css_ptr tetra_b_y;
+	ia_css_ptr tetra_ratb_x;
+	ia_css_ptr tetra_ratb_y;
+	ia_css_ptr tetra_batr_x;
+	ia_css_ptr tetra_batr_y;
+	ia_css_ptr dvs_6axis_params_y;
 };
 
 #define SIZE_OF_SH_CSS_DDR_ADDRESS_MAP_STRUCT					\
@@ -531,8 +531,8 @@ struct sh_css_sp_pipeline {
 	u32	port_id;	/* port_id for input system */
 	u32	num_stages;		/* the pipe config */
 	u32	running;	/* needed for pipe termination */
-	hrt_vaddress	sp_stage_addr[SH_CSS_MAX_STAGES];
-	hrt_vaddress	scaler_pp_lut; /* Early bound LUT */
+	ia_css_ptr	sp_stage_addr[SH_CSS_MAX_STAGES];
+	ia_css_ptr	scaler_pp_lut; /* Early bound LUT */
 	u32	dummy; /* stage ptr is only used on sp but lives in
 				  this struct; needs cleanup */
 	s32 num_execs; /* number of times to run if this is
@@ -544,7 +544,7 @@ struct sh_css_sp_pipeline {
 		u32        height;   /* Number of lines */
 		u32        stride;   /* Stride (in bytes) per line */
 		u32        size;     /* Total size (in bytes) */
-		hrt_vaddress    cont_buf; /* Address of continuous buffer */
+		ia_css_ptr    cont_buf; /* Address of continuous buffer */
 	} metadata;
 #endif
 #if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
@@ -657,9 +657,9 @@ struct sh_css_sp_stage {
 	struct ia_css_frames_sp		frames;
 	struct ia_css_resolution	dvs_envelope;
 	struct sh_css_uds_info		uds;
-	hrt_vaddress			isp_stage_addr;
-	hrt_vaddress			xmem_bin_addr;
-	hrt_vaddress			xmem_map_addr;
+	ia_css_ptr			isp_stage_addr;
+	ia_css_ptr			xmem_bin_addr;
+	ia_css_ptr			xmem_map_addr;
 
 	u16		top_cropping;
 	u16		row_stripes_height;
@@ -692,7 +692,7 @@ struct sh_css_sp_group {
 /* Data in SP dmem that is set from the host every stage. */
 struct sh_css_sp_per_frame_data {
 	/* ddr address of sp_group and sp_stage */
-	hrt_vaddress			sp_group_addr;
+	ia_css_ptr			sp_group_addr;
 };
 
 #define SH_CSS_NUM_SDW_IRQS 3
@@ -742,11 +742,11 @@ struct sh_css_hmm_buffer {
 	union {
 		struct ia_css_isp_3a_statistics  s3a;
 		struct ia_css_isp_dvs_statistics dis;
-		hrt_vaddress skc_dvs_statistics;
-		hrt_vaddress lace_stat;
+		ia_css_ptr skc_dvs_statistics;
+		ia_css_ptr lace_stat;
 		struct ia_css_metadata	metadata;
 		struct frame_data_wrapper {
-			hrt_vaddress	frame_data;
+			ia_css_ptr	frame_data;
 			u32	flashed;
 			u32	exp_id;
 			u32	isp_parameters_id; /** Unique ID to track which config was
@@ -755,7 +755,7 @@ struct sh_css_hmm_buffer {
 			struct sh_css_config_on_frame_enqueue config_on_frame_enqueue;
 #endif
 		} frame;
-		hrt_vaddress ddr_ptrs;
+		ia_css_ptr ddr_ptrs;
 	} payload;
 	/*
 	 * kernel_ptr is present for host administration purposes only.
@@ -834,12 +834,12 @@ struct host_sp_communication {
 	 * TODO:
 	 *   Remove it when the Host and the SP is decoupled.
 	 */
-	hrt_vaddress host2sp_offline_frames[NUM_CONTINUOUS_FRAMES];
-	hrt_vaddress host2sp_offline_metadata[NUM_CONTINUOUS_FRAMES];
+	ia_css_ptr host2sp_offline_frames[NUM_CONTINUOUS_FRAMES];
+	ia_css_ptr host2sp_offline_metadata[NUM_CONTINUOUS_FRAMES];
 
 #if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
-	hrt_vaddress host2sp_mipi_frames[N_CSI_PORTS][NUM_MIPI_FRAMES_PER_STREAM];
-	hrt_vaddress host2sp_mipi_metadata[N_CSI_PORTS][NUM_MIPI_FRAMES_PER_STREAM];
+	ia_css_ptr host2sp_mipi_frames[N_CSI_PORTS][NUM_MIPI_FRAMES_PER_STREAM];
+	ia_css_ptr host2sp_mipi_metadata[N_CSI_PORTS][NUM_MIPI_FRAMES_PER_STREAM];
 	u32 host2sp_num_mipi_frames[N_CSI_PORTS];
 #endif
 	u32 host2sp_cont_avail_num_raw_frames;
@@ -960,7 +960,7 @@ sh_css_vprint(const char *fmt, va_list args)
    issue with the firmware struct/union's.
    More permanent solution will be to refactor this include.
 */
-hrt_vaddress sh_css_params_ddr_address_map(void);
+ia_css_ptr sh_css_params_ddr_address_map(void);
 
 enum ia_css_err
 sh_css_params_init(void);
@@ -1010,13 +1010,13 @@ sh_css_get_mipi_sizes_for_check(const unsigned int port,
 
 #endif
 
-hrt_vaddress
+ia_css_ptr
 sh_css_store_sp_group_to_ddr(void);
 
-hrt_vaddress
+ia_css_ptr
 sh_css_store_sp_stage_to_ddr(unsigned int pipe, unsigned int stage);
 
-hrt_vaddress
+ia_css_ptr
 sh_css_store_isp_stage_to_ddr(unsigned int pipe, unsigned int stage);
 
 void
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 70a8e7ae765e..7bd2fd0124cb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -124,17 +124,17 @@
 
 /* We keep a second copy of the ptr struct for the SP to access.
    Again, this would not be necessary on the chip. */
-static hrt_vaddress sp_ddr_ptrs;
+static ia_css_ptr sp_ddr_ptrs;
 
 /* sp group address on DDR */
-static hrt_vaddress xmem_sp_group_ptrs;
+static ia_css_ptr xmem_sp_group_ptrs;
 
-static hrt_vaddress xmem_sp_stage_ptrs[IA_CSS_PIPE_ID_NUM]
+static ia_css_ptr xmem_sp_stage_ptrs[IA_CSS_PIPE_ID_NUM]
 [SH_CSS_MAX_STAGES];
-static hrt_vaddress xmem_isp_stage_ptrs[IA_CSS_PIPE_ID_NUM]
+static ia_css_ptr xmem_isp_stage_ptrs[IA_CSS_PIPE_ID_NUM]
 [SH_CSS_MAX_STAGES];
 
-static hrt_vaddress default_gdc_lut;
+static ia_css_ptr default_gdc_lut;
 static int interleaved_lut_temp[4][HRT_GDC_N];
 
 /* END DO NOT MOVE INTO VIMALS_WORLD */
@@ -1235,10 +1235,10 @@ ref_sh_css_ddr_address_map(
 static enum ia_css_err
 write_ia_css_isp_parameter_set_info_to_ddr(
     struct ia_css_isp_parameter_set_info *me,
-    hrt_vaddress *out);
+    ia_css_ptr *out);
 
 static enum ia_css_err
-free_ia_css_isp_parameter_set_info(hrt_vaddress ptr);
+free_ia_css_isp_parameter_set_info(ia_css_ptr ptr);
 
 static enum ia_css_err
 sh_css_params_write_to_ddr_internal(
@@ -1292,7 +1292,7 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
     struct ia_css_resolution pipe_in_res,
     bool enable_zoom);
 
-hrt_vaddress
+ia_css_ptr
 sh_css_params_ddr_address_map(void)
 {
 	return sp_ddr_ptrs;
@@ -1350,7 +1350,7 @@ convert_allocate_fpntbl(struct ia_css_isp_parameters *params)
 }
 
 static enum ia_css_err
-store_fpntbl(struct ia_css_isp_parameters *params, hrt_vaddress ptr) {
+store_fpntbl(struct ia_css_isp_parameters *params, ia_css_ptr ptr) {
 	struct ia_css_host_data *isp_data;
 
 	assert(params);
@@ -1479,7 +1479,7 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 	 * that it can use the DMA.
 	 */
 	unsigned int height, width, y, x, k, data;
-	hrt_vaddress ptr;
+	ia_css_ptr ptr;
 
 	assert(stream);
 	assert(raw_black_frame);
@@ -1609,7 +1609,7 @@ sh_css_set_shading_table(struct ia_css_stream *stream,
 
 void
 ia_css_params_store_ia_css_host_data(
-    hrt_vaddress ddr_addr,
+    ia_css_ptr ddr_addr,
     struct ia_css_host_data *data)
 {
 	assert(data);
@@ -1676,7 +1676,7 @@ ia_css_params_alloc_convert_sctbl(
 
 enum ia_css_err ia_css_params_store_sctbl(
     const struct ia_css_pipeline_stage *stage,
-    hrt_vaddress sc_tbl,
+    ia_css_ptr sc_tbl,
     const struct ia_css_shading_table  *sc_config)
 {
 	struct ia_css_host_data *isp_sc_tbl;
@@ -2707,7 +2707,7 @@ ia_css_pipe_get_isp_config(struct ia_css_pipe *pipe,
  * Deprecated: Implement mmgr_realloc()
  */
 static bool realloc_isp_css_mm_buf(
-    hrt_vaddress *curr_buf,
+    ia_css_ptr *curr_buf,
     size_t *curr_size,
     size_t needed_size,
     bool force,
@@ -2748,7 +2748,7 @@ static bool realloc_isp_css_mm_buf(
 }
 
 static bool reallocate_buffer(
-    hrt_vaddress *curr_buf,
+    ia_css_ptr *curr_buf,
     size_t *curr_size,
     size_t needed_size,
     bool force,
@@ -3313,12 +3313,12 @@ static void host_lut_store(const void *lut)
 }
 
 /* Note that allocation is in ipu address space. */
-inline hrt_vaddress sh_css_params_alloc_gdc_lut(void)
+inline ia_css_ptr sh_css_params_alloc_gdc_lut(void)
 {
 	return mmgr_alloc_attr(sizeof(zoom_table), 0);
 }
 
-inline void sh_css_params_free_gdc_lut(hrt_vaddress addr)
+inline void sh_css_params_free_gdc_lut(ia_css_ptr addr)
 {
 	if (addr != mmgr_NULL)
 		hmm_free(addr);
@@ -3377,7 +3377,7 @@ enum ia_css_err ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 }
 
 /* if pipe is NULL, returns default lut addr. */
-hrt_vaddress sh_css_pipe_get_pp_gdc_lut(const struct ia_css_pipe *pipe)
+ia_css_ptr sh_css_pipe_get_pp_gdc_lut(const struct ia_css_pipe *pipe)
 {
 	assert(pipe);
 
@@ -3426,13 +3426,13 @@ void sh_css_params_free_default_gdc_lut(void)
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-hrt_vaddress sh_css_params_get_default_gdc_lut(void)
+ia_css_ptr sh_css_params_get_default_gdc_lut(void)
 {
 	return default_gdc_lut;
 }
 
 static void free_param_set_callback(
-    hrt_vaddress ptr)
+    ia_css_ptr ptr)
 {
 	IA_CSS_ENTER_PRIVATE("void");
 
@@ -3442,7 +3442,7 @@ static void free_param_set_callback(
 }
 
 static void free_buffer_callback(
-    hrt_vaddress ptr)
+    ia_css_ptr ptr)
 {
 	IA_CSS_ENTER_PRIVATE("void");
 
@@ -3475,7 +3475,7 @@ static void free_map(struct sh_css_ddr_address_map *map)
 {
 	unsigned int i;
 
-	hrt_vaddress *addrs = (hrt_vaddress *)map;
+	ia_css_ptr *addrs = (ia_css_ptr *)map;
 
 	IA_CSS_ENTER_PRIVATE("void");
 
@@ -3626,7 +3626,7 @@ store_morph_plane(
     unsigned short *data,
     unsigned int width,
     unsigned int height,
-    hrt_vaddress dest,
+    ia_css_ptr dest,
     unsigned int aligned_width) {
 	struct ia_css_host_data *isp_data;
 
@@ -3646,7 +3646,7 @@ store_morph_plane(
 
 static void sh_css_update_isp_params_to_ddr(
     struct ia_css_isp_parameters *params,
-    hrt_vaddress ddr_ptr)
+    ia_css_ptr ddr_ptr)
 {
 	size_t size = sizeof(params->uds);
 
@@ -3660,7 +3660,7 @@ static void sh_css_update_isp_params_to_ddr(
 
 static void sh_css_update_isp_mem_params_to_ddr(
     const struct ia_css_binary *binary,
-    hrt_vaddress ddr_mem_ptr,
+    ia_css_ptr ddr_mem_ptr,
     size_t size,
     enum ia_css_isp_memories mem)
 {
@@ -3678,7 +3678,7 @@ static void sh_css_update_isp_mem_params_to_ddr(
 void ia_css_dequeue_param_buffers(/*unsigned int pipe_num*/ void)
 {
 	unsigned int i;
-	hrt_vaddress cpy;
+	ia_css_ptr cpy;
 	enum sh_css_queue_id param_queue_ids[3] = {	IA_CSS_PARAMETER_SET_QUEUE_ID,
 						    IA_CSS_PER_FRAME_PARAMETER_SET_QUEUE_ID,
 						    SH_CSS_INVALID_QUEUE_ID
@@ -3693,7 +3693,7 @@ void ia_css_dequeue_param_buffers(/*unsigned int pipe_num*/ void)
 	}
 
 	for (i = 0; SH_CSS_INVALID_QUEUE_ID != param_queue_ids[i]; i++) {
-		cpy = (hrt_vaddress)0;
+		cpy = (ia_css_ptr)0;
 		/* clean-up old copy */
 		while (ia_css_bufq_dequeue_buffer(param_queue_ids[i],
 						  (uint32_t *)&cpy) == IA_CSS_SUCCESS) {
@@ -3708,7 +3708,7 @@ void ia_css_dequeue_param_buffers(/*unsigned int pipe_num*/ void)
 
 			IA_CSS_LOG("dequeued param set %x from %d, release ref", cpy, 0);
 			free_ia_css_isp_parameter_set_info(cpy);
-			cpy = (hrt_vaddress)0;
+			cpy = (ia_css_ptr)0;
 		}
 	}
 
@@ -3756,7 +3756,7 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 			       bool commit,
 			       struct ia_css_pipe *pipe_in) {
 	enum ia_css_err err = IA_CSS_SUCCESS;
-	hrt_vaddress cpy;
+	ia_css_ptr cpy;
 	int i;
 	unsigned int raw_bit_depth = 10;
 	unsigned int isp_pipe_version = SH_CSS_ISP_PIPE_VERSION_1;
@@ -4241,11 +4241,11 @@ sh_css_params_write_to_ddr_internal(
 	if (binary->info->sp.enable.ca_gdc)
 	{
 		unsigned int i;
-		hrt_vaddress *virt_addr_tetra_x[
+		ia_css_ptr *virt_addr_tetra_x[
 		IA_CSS_MORPH_TABLE_NUM_PLANES];
 		size_t *virt_size_tetra_x[
 		IA_CSS_MORPH_TABLE_NUM_PLANES];
-		hrt_vaddress *virt_addr_tetra_y[
+		ia_css_ptr *virt_addr_tetra_y[
 		IA_CSS_MORPH_TABLE_NUM_PLANES];
 		size_t *virt_size_tetra_y[
 		IA_CSS_MORPH_TABLE_NUM_PLANES];
@@ -4456,7 +4456,7 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 	return table;
 }
 
-hrt_vaddress sh_css_store_sp_group_to_ddr(void)
+ia_css_ptr sh_css_store_sp_group_to_ddr(void)
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
 	hmm_store(xmem_sp_group_ptrs,
@@ -4465,7 +4465,7 @@ hrt_vaddress sh_css_store_sp_group_to_ddr(void)
 	return xmem_sp_group_ptrs;
 }
 
-hrt_vaddress sh_css_store_sp_stage_to_ddr(
+ia_css_ptr sh_css_store_sp_stage_to_ddr(
     unsigned int pipe,
     unsigned int stage)
 {
@@ -4476,7 +4476,7 @@ hrt_vaddress sh_css_store_sp_stage_to_ddr(
 	return xmem_sp_stage_ptrs[pipe][stage];
 }
 
-hrt_vaddress sh_css_store_isp_stage_to_ddr(
+ia_css_ptr sh_css_store_isp_stage_to_ddr(
     unsigned int pipe,
     unsigned int stage)
 {
@@ -4500,7 +4500,7 @@ static enum ia_css_err ref_sh_css_ddr_address_map(
 	*/
 	union {
 		struct sh_css_ddr_address_map *map;
-		hrt_vaddress *addrs;
+		ia_css_ptr *addrs;
 	} in_addrs, to_addrs;
 
 	IA_CSS_ENTER_PRIVATE("void");
@@ -4511,7 +4511,7 @@ static enum ia_css_err ref_sh_css_ddr_address_map(
 	to_addrs.map = out;
 
 	assert(sizeof(struct sh_css_ddr_address_map_size) / sizeof(size_t) ==
-	       sizeof(struct sh_css_ddr_address_map) / sizeof(hrt_vaddress));
+	       sizeof(struct sh_css_ddr_address_map) / sizeof(ia_css_ptr));
 
 	/* copy map using size info */
 	for (i = 0; i < (sizeof(struct sh_css_ddr_address_map_size) /
@@ -4529,7 +4529,7 @@ static enum ia_css_err ref_sh_css_ddr_address_map(
 
 static enum ia_css_err write_ia_css_isp_parameter_set_info_to_ddr(
     struct ia_css_isp_parameter_set_info *me,
-    hrt_vaddress *out)
+    ia_css_ptr *out)
 {
 	enum ia_css_err err = IA_CSS_SUCCESS;
 	bool succ;
@@ -4554,11 +4554,11 @@ static enum ia_css_err write_ia_css_isp_parameter_set_info_to_ddr(
 
 static enum ia_css_err
 free_ia_css_isp_parameter_set_info(
-    hrt_vaddress ptr) {
+    ia_css_ptr ptr) {
 	enum ia_css_err err = IA_CSS_SUCCESS;
 	struct ia_css_isp_parameter_set_info isp_params_info;
 	unsigned int i;
-	hrt_vaddress *addrs = (hrt_vaddress *) &isp_params_info.mem_map;
+	ia_css_ptr *addrs = (ia_css_ptr *) &isp_params_info.mem_map;
 
 	IA_CSS_ENTER_PRIVATE("ptr = %u", ptr);
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.h b/drivers/staging/media/atomisp/pci/sh_css_params.h
index 96d503967fd1..221d2a47b513 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.h
@@ -150,13 +150,13 @@ struct ia_css_isp_parameters {
 
 void
 ia_css_params_store_ia_css_host_data(
-    hrt_vaddress ddr_addr,
+    ia_css_ptr ddr_addr,
     struct ia_css_host_data *data);
 
 enum ia_css_err
 ia_css_params_store_sctbl(
     const struct ia_css_pipeline_stage *stage,
-    hrt_vaddress ddr_addr,
+    ia_css_ptr ddr_addr,
     const struct ia_css_shading_table *shading_table);
 
 struct ia_css_host_data *
@@ -168,10 +168,10 @@ struct ia_css_isp_config *
 sh_css_pipe_isp_config_get(struct ia_css_pipe *pipe);
 
 /* ipu address allocation/free for gdc lut */
-hrt_vaddress
+ia_css_ptr
 sh_css_params_alloc_gdc_lut(void);
 void
-sh_css_params_free_gdc_lut(hrt_vaddress addr);
+sh_css_params_free_gdc_lut(ia_css_ptr addr);
 
 enum ia_css_err
 sh_css_params_map_and_store_default_gdc_lut(void);
@@ -179,10 +179,10 @@ sh_css_params_map_and_store_default_gdc_lut(void);
 void
 sh_css_params_free_default_gdc_lut(void);
 
-hrt_vaddress
+ia_css_ptr
 sh_css_params_get_default_gdc_lut(void);
 
-hrt_vaddress
+ia_css_ptr
 sh_css_pipe_get_pp_gdc_lut(const struct ia_css_pipe *pipe);
 
 #endif /* _SH_CSS_PARAMS_H_ */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 5970a660456c..9a80968f115a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -82,7 +82,7 @@ set_output_frame_buffer(const struct ia_css_frame *frame,
 static void
 sh_css_copy_buffer_attr_to_spbuffer(struct ia_css_buffer_sp *dest_buf,
 				    const enum sh_css_queue_id queue_id,
-				    const hrt_vaddress xmem_addr,
+				    const ia_css_ptr xmem_addr,
 				    const enum ia_css_buffer_type buf_type);
 
 static void
@@ -412,7 +412,7 @@ sh_css_sp_get_sw_interrupt_value(unsigned int irq)
 static void
 sh_css_copy_buffer_attr_to_spbuffer(struct ia_css_buffer_sp *dest_buf,
 				    const enum sh_css_queue_id queue_id,
-				    const hrt_vaddress xmem_addr,
+				    const ia_css_ptr xmem_addr,
 				    const enum ia_css_buffer_type buf_type)
 {
 	assert(buf_type < IA_CSS_NUM_BUFFER_TYPE);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_struct.h b/drivers/staging/media/atomisp/pci/sh_css_struct.h
index 81b9598ef8b7..9e25887b9ab8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_struct.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_struct.h
@@ -64,7 +64,7 @@ struct sh_css {
 	mipi_sizes_for_check[N_CSI_PORTS][IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT];
 	unsigned int                   mipi_frame_size[N_CSI_PORTS];
 #endif
-	hrt_vaddress                   sp_bin_addr;
+	ia_css_ptr                   sp_bin_addr;
 	hrt_data                       page_table_base_index;
 	unsigned int
 	size_mem_words; /* \deprecated{Use ia_css_mipi_buffer_config instead.}*/
-- 
2.26.2

