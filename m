Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616E61ECA09
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgFCHCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:02:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:43116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgFCHBH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8373A207ED;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=yU4P1s6jg7uPhV1MW+EmpL+ueFr+IMkJzMOUKpTmU/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PkuFTlIo5RKV+kpPdqfteiRuALT/YbxJSHj5EhTJXIvLIZ4tbIJii0eSrCCX3gT1s
         iwMe5SlaOujjFSrnmoyXYF/PRlHFR7mQqCY/rZ880lIgRWMDrU8TC2QuNdErgfgviY
         izU1nGuVLuRW9qLJNPJ9/bgdERjLDevKFAem8gjA=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8M-A8; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/15] media: atomisp: simplify IRQ ifdef logic
Date:   Wed,  3 Jun 2020 09:00:51 +0200
Message-Id: <b58c0c2e6acec3e526fd8f74fe52e9033d9b8f37.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are lots of mess with IRQ ifdef settings. As the
*_global.h will already detect the type of IRQ system at
compile time, we can get rid of them, replacing by just
one ifdef for ISP2401.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/hive_isp_css_common/isp_global.h      | 10 ++----
 .../pci/hive_isp_css_common/sp_global.h       | 10 ------
 .../media/atomisp/pci/isp2400_system_global.h | 31 -------------------
 .../media/atomisp/pci/isp2400_system_local.h  |  8 -----
 .../media/atomisp/pci/isp2401_system_global.h | 31 -------------------
 .../media/atomisp/pci/isp2401_system_local.h  |  8 -----
 .../pci/runtime/debug/src/ia_css_debug.c      | 10 ------
 .../tagger/interface/ia_css_tagger_common.h   |  4 ---
 .../media/atomisp/pci/sh_css_internal.h       | 10 ------
 9 files changed, 2 insertions(+), 120 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
index 5ea3f1938fbd..5212d52198bd 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
@@ -18,16 +18,10 @@
 
 #include <system_local.h>
 
-#if defined(HAS_ISP_2401_MAMOIADA)
-#define IS_ISP_2401_MAMOIADA
-
+#ifdef ISP2401
 #include "isp2401_mamoiada_params.h"
-#elif defined(HAS_ISP_2400_MAMOIADA)
-#define IS_ISP_2400_MAMOIADA
-
+#else
 #include "isp2400_mamoiada_params.h"
-#else
-#error "isp_global_h: ISP_2400_MAMOIDA must be one of {2400, 2401 }"
 #endif
 
 #define ISP_PMEM_WIDTH_LOG2		ISP_LOG2_PMEM_WIDTH
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
index 125fe577073f..b8338f9b5c0c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
@@ -18,17 +18,7 @@
 
 #include <system_local.h>
 
-#if defined(HAS_SP_2401)
-#define IS_SP_2401
-/* 2401 uses 2400 */
 #include <scalar_processor_2400_params.h>
-#elif defined(HAS_SP_2400)
-#define IS_SP_2400
-
-#include <scalar_processor_2400_params.h>
-#else
-#error "sp_global.h: SP_2400 must be one of {2400, 2401 }"
-#endif
 
 #define SP_PMEM_WIDTH_LOG2		SP_PMEM_LOG_WIDTH_BITS
 #define SP_PMEM_SIZE			SP_PMEM_DEPTH
diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_system_global.h
index ed3c24a77a3c..d87ddf1d2fe9 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_system_global.h
@@ -47,27 +47,6 @@
  * N.B. the 3 input formatters are of 2 different classess
  */
 
-/*
- * Since this file is visible everywhere and the system definition
- * macros are not, detect the separate definitions for {host, SP, ISP}
- *
- * The 2401 system has the nice property that it uses a vanilla 2400 SP
- * so the SP will believe it is a 2400 system rather than 2401...
- */
-//#if defined(SYSTEM_hive_isp_css_2401_system) || defined(__isp2401_mamoiada) || defined(__scalar_processor_2401)
-#if defined(SYSTEM_hive_isp_css_2401_system) || defined(__isp2401_mamoiada)
-#define IS_ISP_2401_MAMOIADA_SYSTEM
-#define HAS_ISP_2401_MAMOIADA
-#define HAS_SP_2400
-//#elif defined(SYSTEM_hive_isp_css_2400_system) || defined(__isp2400_mamoiada) || defined(__scalar_processor_2400)
-#elif defined(SYSTEM_hive_isp_css_2400_system) || defined(__isp2400_mamoiada)
-#define IS_ISP_2400_MAMOIADA_SYSTEM
-#define HAS_ISP_2400_MAMOIADA
-#define HAS_SP_2400
-#else
-#error "system_global.h: 2400_SYSTEM must be one of {2400, 2401 }"
-#endif
-
 #define USE_INPUT_SYSTEM_VERSION_2
 
 #define HAS_MMU_VERSION_2
@@ -130,21 +109,11 @@ typedef enum {
 	N_SP_ID
 } sp_ID_t;
 
-#if defined(IS_ISP_2401_MAMOIADA_SYSTEM)
 typedef enum {
 	MMU0_ID = 0,
 	MMU1_ID,
 	N_MMU_ID
 } mmu_ID_t;
-#elif defined(IS_ISP_2400_MAMOIADA_SYSTEM)
-typedef enum {
-	MMU0_ID = 0,
-	MMU1_ID,
-	N_MMU_ID
-} mmu_ID_t;
-#else
-#error "system_global.h: SYSTEM must be one of {2400, 2401}"
-#endif
 
 typedef enum {
 	DMA0_ID = 0,
diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
index 0574bb9a0a77..da34e3e5f3fb 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
@@ -82,7 +82,6 @@ static const hrt_address SP_PMEM_BASE[N_SP_ID] = {
 };
 
 /* MMU */
-#if defined(IS_ISP_2400_MAMOIADA_SYSTEM) || defined(IS_ISP_2401_MAMOIADA_SYSTEM)
 /*
  * MMU0_ID: The data MMU
  * MMU1_ID: The icache MMU
@@ -91,9 +90,6 @@ static const hrt_address MMU_BASE[N_MMU_ID] = {
 	(hrt_address)0x0000000000070000ULL,
 	(hrt_address)0x00000000000A0000ULL
 };
-#else
-#error "system_local.h: SYSTEM must be one of {2400, 2401 }"
-#endif
 
 /* DMA */
 static const hrt_address DMA_BASE[N_DMA_ID] = {
@@ -225,7 +221,6 @@ static const hrt_address SP_PMEM_BASE[N_SP_ID] = {
 };
 
 /* MMU */
-#if defined(IS_ISP_2400_MAMOIADA_SYSTEM) || defined(IS_ISP_2401_MAMOIADA_SYSTEM)
 /*
  * MMU0_ID: The data MMU
  * MMU1_ID: The icache MMU
@@ -234,9 +229,6 @@ static const hrt_address MMU_BASE[N_MMU_ID] = {
 	(hrt_address)0x00070000UL,
 	(hrt_address)0x000A0000UL
 };
-#else
-#error "system_local.h: SYSTEM must be one of {2400, 2401 }"
-#endif
 
 /* DMA */
 static const hrt_address DMA_BASE[N_DMA_ID] = {
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_system_global.h
index 67464e59c35b..8bb2a956f983 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_system_global.h
@@ -53,27 +53,6 @@
 
 #define USE_INPUT_SYSTEM_VERSION_2401
 
-/*
- * Since this file is visible everywhere and the system definition
- * macros are not, detect the separate definitions for {host, SP, ISP}
- *
- * The 2401 system has the nice property that it uses a vanilla 2400 SP
- * so the SP will believe it is a 2400 system rather than 2401...
- */
-/* #if defined(SYSTEM_hive_isp_css_2401_system) || defined(__isp2401_mamoiada) || defined(__scalar_processor_2401) */
-#if defined(SYSTEM_hive_isp_css_2401_system) || defined(__isp2401_mamoiada)
-#define IS_ISP_2401_MAMOIADA_SYSTEM
-#define HAS_ISP_2401_MAMOIADA
-#define HAS_SP_2400
-/* #elif defined(SYSTEM_hive_isp_css_2400_system) || defined(__isp2400_mamoiada) || defined(__scalar_processor_2400)*/
-#elif defined(SYSTEM_hive_isp_css_2400_system) || defined(__isp2400_mamoiada)
-#define IS_ISP_2400_MAMOIADA_SYSTEM
-#define HAS_ISP_2400_MAMOIADA
-#define HAS_SP_2400
-#else
-#error "system_global.h: 2400_SYSTEM must be one of {2400, 2401 }"
-#endif
-
 #define HAS_MMU_VERSION_2
 #define HAS_DMA_VERSION_2
 #define HAS_GDC_VERSION_2
@@ -144,21 +123,11 @@ typedef enum {
 	N_SP_ID
 } sp_ID_t;
 
-#if defined(IS_ISP_2401_MAMOIADA_SYSTEM)
 typedef enum {
 	MMU0_ID = 0,
 	MMU1_ID,
 	N_MMU_ID
 } mmu_ID_t;
-#elif defined(IS_ISP_2400_MAMOIADA_SYSTEM)
-typedef enum {
-	MMU0_ID = 0,
-	MMU1_ID,
-	N_MMU_ID
-} mmu_ID_t;
-#else
-#error "system_global.h: SYSTEM must be one of {2400, 2401}"
-#endif
 
 typedef enum {
 	DMA0_ID = 0,
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
index 6605e1a92900..4d9fe06ac1cc 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
@@ -76,7 +76,6 @@ static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
 };
 
 /* MMU */
-#if defined(IS_ISP_2400_MAMOIADA_SYSTEM) || defined(IS_ISP_2401_MAMOIADA_SYSTEM)
 /*
  * MMU0_ID: The data MMU
  * MMU1_ID: The icache MMU
@@ -85,9 +84,6 @@ static const hrt_address MMU_BASE[N_MMU_ID] = {
 	0x0000000000070000ULL,
 	0x00000000000A0000ULL
 };
-#else
-#error "system_local.h: SYSTEM must be one of {2400, 2401 }"
-#endif
 
 /* DMA */
 static const hrt_address DMA_BASE[N_DMA_ID] = {
@@ -261,7 +257,6 @@ static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
 };
 
 /* MMU */
-#if defined(IS_ISP_2400_MAMOIADA_SYSTEM) || defined(IS_ISP_2401_MAMOIADA_SYSTEM)
 /*
  * MMU0_ID: The data MMU
  * MMU1_ID: The icache MMU
@@ -270,9 +265,6 @@ static const hrt_address MMU_BASE[N_MMU_ID] = {
 	0x00070000UL,
 	0x000A0000UL
 };
-#else
-#error "system_local.h: SYSTEM must be one of {2400, 2401 }"
-#endif
 
 /* DMA */
 static const hrt_address DMA_BASE[N_DMA_ID] = {
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 49836016559f..543359d200af 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -460,7 +460,6 @@ void ia_css_debug_dump_isp_state(void)
 #endif
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[2] dma_FIFO stalled",
 				    stall.fifo2);
-#if defined(HAS_ISP_2400_MAMOIADA) || defined(HAS_ISP_2401_MAMOIADA) || defined(IS_ISP_2500_SYSTEM)
 
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[3] gdc0_FIFO stalled",
 				    stall.fifo3);
@@ -472,9 +471,6 @@ void ia_css_debug_dump_isp_state(void)
 #endif
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[6] sp_FIFO stalled",
 				    stall.fifo6);
-#else
-#error "ia_css_debug: ISP cell must be one of {2400_MAMOIADA,, 2401_MAMOIADA, 2500_SKYCAM}"
-#endif
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
 				    "status & control stalled",
 				    stall.stat_ctrl);
@@ -486,14 +482,12 @@ void ia_css_debug_dump_isp_state(void)
 				    stall.vamem1);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "vamem2 stalled",
 				    stall.vamem2);
-#if defined(HAS_ISP_2400_MAMOIADA) || defined(HAS_ISP_2401_MAMOIADA)
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "vamem3 stalled",
 				    stall.vamem3);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "hmem stalled",
 				    stall.hmem);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "pmem stalled",
 				    stall.pmem);
-#endif
 	}
 	return;
 }
@@ -506,7 +500,6 @@ void ia_css_debug_dump_sp_state(void)
 	sp_get_state(SP0_ID, &state, &stall);
 	debug_print_sp_state(&state, "SP");
 	if (state.is_stalling) {
-#if defined(HAS_SP_2400) || defined(IS_ISP_2500_SYSTEM)
 #if !defined(HAS_NO_INPUT_SYSTEM)
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "isys_FIFO stalled",
 				    stall.fifo0);
@@ -537,9 +530,6 @@ void ia_css_debug_dump_sp_state(void)
 #endif
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "irq FIFO stalled",
 				    stall.fifoa);
-#else
-#error "ia_css_debug: SP cell must be one of {SP2400, SP2500}"
-#endif
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "dmem stalled",
 				    stall.dmem);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
diff --git a/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h b/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
index 285867ea8aa7..49801fbc1924 100644
--- a/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
+++ b/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
@@ -24,11 +24,7 @@
  *
  * Should be one less than NUM_CONTINUOUS_FRAMES in sh_css_internal.h
  */
-#if defined(HAS_SP_2400)
 #define MAX_CB_ELEMS_FOR_TAGGER 14
-#else
-#define MAX_CB_ELEMS_FOR_TAGGER 9
-#endif
 
 /**
  * @brief Data structure for the tagger buffer element.
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index d56188aa8f09..5c25a25dce92 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -76,11 +76,7 @@
 #define SH_CSS_REF_BIT_DEPTH 8
 
 /* keep next up to date with the definition for MAX_CB_ELEMS_FOR_TAGGER in tagger.sp.c */
-#if defined(HAS_SP_2400)
 #define NUM_CONTINUOUS_FRAMES	15
-#else
-#define NUM_CONTINUOUS_FRAMES	10
-#endif
 #define NUM_MIPI_FRAMES_PER_STREAM		2
 
 #define NUM_ONLINE_INIT_CONTINUOUS_FRAMES      2
@@ -729,15 +725,9 @@ struct sh_css_sp_output {
  * separate SP thread for this. */
 #define  IA_CSS_NUM_ELEMS_HOST2SP_ISYS_EVENT_QUEUE (2 * N_CSI_PORTS)
 
-#if defined(HAS_SP_2400)
 #define  IA_CSS_NUM_ELEMS_HOST2SP_PSYS_EVENT_QUEUE    13
 #define  IA_CSS_NUM_ELEMS_SP2HOST_BUFFER_QUEUE        19
 #define  IA_CSS_NUM_ELEMS_SP2HOST_PSYS_EVENT_QUEUE    26 /* holds events for all type of buffers, hence deeper */
-#else
-#define  IA_CSS_NUM_ELEMS_HOST2SP_PSYS_EVENT_QUEUE    6
-#define  IA_CSS_NUM_ELEMS_SP2HOST_BUFFER_QUEUE        6
-#define  IA_CSS_NUM_ELEMS_SP2HOST_PSYS_EVENT_QUEUE    6
-#endif
 
 struct sh_css_hmm_buffer {
 	union {
-- 
2.26.2

