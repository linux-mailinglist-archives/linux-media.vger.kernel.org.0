Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BE5446818
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 18:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234483AbhKERvB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 13:51:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232041AbhKERu7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 13:50:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3332E61220;
        Fri,  5 Nov 2021 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636134499;
        bh=VyExh6XGAMs3UkHWRtUsvJttPtGuk6USieO7ScrITAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kybLd/pgL1PnQ0zgFbiT6w01eU3ylydzYyVcd1Cid1s8yN8zr7uwRkrB06UDK6eFw
         B3ghjsS8CAg7RYtkop8K9qJBDrGkteCpLqyAuevua/ny61IVNMoySgI1UIzDYZdaik
         Fpy+uAmd+ZkzhM49XstL3FdzUBpSTwv2eqwnUO5ziME1SY/+oXWMuHsjb68VsKF0Y+
         vs3sgN4uornmA2j0GYHwIq+Ev/DAFyS2MTjPHNi6Pq+9DfxiO1NqZXY1O11Ka7PVww
         i3nOvOiKtbktU3oMpONASEar75rtD+Dxq57LoVYSIRdER3DxV7bjub5xxmxcVmUSxg
         UOnBnx4/HnMhg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mj3K4-007eNc-A1; Fri, 05 Nov 2021 17:48:16 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/8] media: atomisp: drop duplicated ia_css_isp_states.c
Date:   Fri,  5 Nov 2021 17:48:09 +0000
Message-Id: <ab83b5d83839adcf89ff60e8431fd216170b2af1.1636134411.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <286ba3e4f25e9ba2ab78de4cbf010f18167b2604.1636134411.git.mchehab+huawei@kernel.org>
References: <286ba3e4f25e9ba2ab78de4cbf010f18167b2604.1636134411.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both 2400 and 2401 have this file, but they're identical.
So, drop one of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile        |   5 +-
 .../css_2401_system/hive/ia_css_isp_states.c  | 224 ------------------
 .../hive => }/ia_css_isp_states.c             |   0
 3 files changed, 2 insertions(+), 227 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.c
 rename drivers/staging/media/atomisp/pci/{css_2400_system/hive => }/ia_css_isp_states.c (100%)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 320c14f4afa6..f7f670a70d3f 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -54,6 +54,7 @@ atomisp-objs += \
 	pci/hmm/hmm_reserved_pool.o \
 	pci/ia_css_device_access.o \
 	pci/ia_css_isp_configs.o \
+	pci/ia_css_isp_states.o \
 	pci/isp/kernels/aa/aa_2/ia_css_aa2.host.o \
 	pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.o \
 	pci/isp/kernels/anr/anr_2/ia_css_anr2.host.o \
@@ -158,8 +159,7 @@ atomisp-objs += \
 	pci/system_local.o \
 
 obj-byt = \
-	pci/css_2400_system/hive/ia_css_isp_params.o \
-	pci/css_2400_system/hive/ia_css_isp_states.o \
+	pci/css_2400_system/hive/ia_css_isp_params.o
 
 # These will be needed when clean merge CHT support nicely into the driver
 # Keep them here handy for when we get to that point
@@ -167,7 +167,6 @@ obj-byt = \
 
 obj-cht = \
 	pci/css_2401_system/hive/ia_css_isp_params.o \
-	pci/css_2401_system/hive/ia_css_isp_states.o \
 	pci/css_2401_system/host/csi_rx.o \
 	pci/css_2401_system/host/ibuf_ctrl.o \
 	pci/css_2401_system/host/isys_dma.o \
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.c
deleted file mode 100644
index 514ffe0303cb..000000000000
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.c
+++ /dev/null
@@ -1,224 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
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
-/* Generated code: do not edit or commmit. */
-
-#include "ia_css_pipeline.h"
-#include "ia_css_isp_states.h"
-#include "ia_css_debug.h"
-#include "assert_support.h"
-
-/* Code generated by genparam/genstate.c:gen_init_function() */
-
-static void
-ia_css_initialize_aa_state(
-    const struct ia_css_binary *binary)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_aa_state() enter:\n");
-
-	{
-		unsigned int size   = binary->info->mem_offsets.offsets.state->vmem.aa.size;
-		unsigned int offset = binary->info->mem_offsets.offsets.state->vmem.aa.offset;
-
-		if (size)
-			memset(&binary->mem_params.params[IA_CSS_PARAM_CLASS_STATE][IA_CSS_ISP_VMEM].address[offset],
-			       0, size);
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_aa_state() leave:\n");
-}
-
-/* Code generated by genparam/genstate.c:gen_init_function() */
-
-static void
-ia_css_initialize_cnr_state(
-    const struct ia_css_binary *binary)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_cnr_state() enter:\n");
-
-	{
-		unsigned int size   = binary->info->mem_offsets.offsets.state->vmem.cnr.size;
-
-		unsigned int offset = binary->info->mem_offsets.offsets.state->vmem.cnr.offset;
-
-		if (size) {
-			ia_css_init_cnr_state(
-			    &binary->mem_params.params[IA_CSS_PARAM_CLASS_STATE][IA_CSS_ISP_VMEM].address[offset],
-			    size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_cnr_state() leave:\n");
-}
-
-/* Code generated by genparam/genstate.c:gen_init_function() */
-
-static void
-ia_css_initialize_cnr2_state(
-    const struct ia_css_binary *binary)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_cnr2_state() enter:\n");
-
-	{
-		unsigned int size   = binary->info->mem_offsets.offsets.state->vmem.cnr2.size;
-
-		unsigned int offset = binary->info->mem_offsets.offsets.state->vmem.cnr2.offset;
-
-		if (size) {
-			ia_css_init_cnr2_state(
-			    &binary->mem_params.params[IA_CSS_PARAM_CLASS_STATE][IA_CSS_ISP_VMEM].address[offset],
-			    size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_cnr2_state() leave:\n");
-}
-
-/* Code generated by genparam/genstate.c:gen_init_function() */
-
-static void
-ia_css_initialize_dp_state(
-    const struct ia_css_binary *binary)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_dp_state() enter:\n");
-
-	{
-		unsigned int size   = binary->info->mem_offsets.offsets.state->vmem.dp.size;
-
-		unsigned int offset = binary->info->mem_offsets.offsets.state->vmem.dp.offset;
-
-		if (size) {
-			ia_css_init_dp_state(
-			    &binary->mem_params.params[IA_CSS_PARAM_CLASS_STATE][IA_CSS_ISP_VMEM].address[offset],
-			    size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_dp_state() leave:\n");
-}
-
-/* Code generated by genparam/genstate.c:gen_init_function() */
-
-static void
-ia_css_initialize_de_state(
-    const struct ia_css_binary *binary)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_de_state() enter:\n");
-
-	{
-		unsigned int size   = binary->info->mem_offsets.offsets.state->vmem.de.size;
-
-		unsigned int offset = binary->info->mem_offsets.offsets.state->vmem.de.offset;
-
-		if (size) {
-			ia_css_init_de_state(
-			    &binary->mem_params.params[IA_CSS_PARAM_CLASS_STATE][IA_CSS_ISP_VMEM].address[offset],
-			    size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_de_state() leave:\n");
-}
-
-/* Code generated by genparam/genstate.c:gen_init_function() */
-
-static void
-ia_css_initialize_tnr_state(
-    const struct ia_css_binary *binary)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_tnr_state() enter:\n");
-
-	{
-		unsigned int size   = binary->info->mem_offsets.offsets.state->dmem.tnr.size;
-
-		unsigned int offset = binary->info->mem_offsets.offsets.state->dmem.tnr.offset;
-
-		if (size) {
-			ia_css_init_tnr_state((struct sh_css_isp_tnr_dmem_state *)
-					      &binary->mem_params.params[IA_CSS_PARAM_CLASS_STATE][IA_CSS_ISP_DMEM].address[offset],
-					      size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_tnr_state() leave:\n");
-}
-
-/* Code generated by genparam/genstate.c:gen_init_function() */
-
-static void
-ia_css_initialize_ref_state(
-    const struct ia_css_binary *binary)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_ref_state() enter:\n");
-
-	{
-		unsigned int size   = binary->info->mem_offsets.offsets.state->dmem.ref.size;
-
-		unsigned int offset = binary->info->mem_offsets.offsets.state->dmem.ref.offset;
-
-		if (size) {
-			ia_css_init_ref_state((struct sh_css_isp_ref_dmem_state *)
-					      &binary->mem_params.params[IA_CSS_PARAM_CLASS_STATE][IA_CSS_ISP_DMEM].address[offset],
-					      size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_ref_state() leave:\n");
-}
-
-/* Code generated by genparam/genstate.c:gen_init_function() */
-
-static void
-ia_css_initialize_ynr_state(
-    const struct ia_css_binary *binary)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_ynr_state() enter:\n");
-
-	{
-		unsigned int size   = binary->info->mem_offsets.offsets.state->vmem.ynr.size;
-
-		unsigned int offset = binary->info->mem_offsets.offsets.state->vmem.ynr.offset;
-
-		if (size) {
-			ia_css_init_ynr_state(
-			    &binary->mem_params.params[IA_CSS_PARAM_CLASS_STATE][IA_CSS_ISP_VMEM].address[offset],
-			    size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_initialize_ynr_state() leave:\n");
-}
-
-/* Code generated by genparam/genstate.c:gen_state_init_table() */
-
-void (*ia_css_kernel_init_state[IA_CSS_NUM_STATE_IDS])(
-    const struct ia_css_binary *binary) = {
-	ia_css_initialize_aa_state,
-	ia_css_initialize_cnr_state,
-	ia_css_initialize_cnr2_state,
-	ia_css_initialize_dp_state,
-	ia_css_initialize_de_state,
-	ia_css_initialize_tnr_state,
-	ia_css_initialize_ref_state,
-	ia_css_initialize_ynr_state,
-};
diff --git a/drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
similarity index 100%
rename from drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_states.c
rename to drivers/staging/media/atomisp/pci/ia_css_isp_states.c
-- 
2.31.1

