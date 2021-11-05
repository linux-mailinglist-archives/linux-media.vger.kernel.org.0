Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C627E446825
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 18:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234573AbhKERvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 13:51:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:35396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234518AbhKERvI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 13:51:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 782F661263;
        Fri,  5 Nov 2021 17:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636134508;
        bh=vP/JpDGb+Cvga7YPKCWXofdlkKeZJx+gI72wmHjEpAE=;
        h=From:To:Cc:Subject:Date:From;
        b=rnAmA0EWWThLfDwTYhC4RWpAGPB884QLGxI77QfxGwXhPnS2XKoyy/aoRaezAuLdn
         12YHb1LOs5WLGTNoDl4exiSraJAUpAacuk38uo1mQECAVWJO/ShxJ2W0G06etaL0Z2
         3qsHTe+Ei15cpH43TL4NmXkF9IPZ5NBZlRdmaYgPUxnk2IUVcb3jsIv3VRioCWFaB3
         SNTAcVDeaQfb6PT4d1F7Racjv22Kr4MGTYDgTpRJwtsp9gkpcrWmX6f0kQJAvH73ML
         80VvNI1Ev8pDtN8ViFuj5ta1kupTgc6EmAOnB/FJnh6kvbTdrKASkCgKWDPYfjBEAd
         t37Wz3wVuGcQQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mj3K4-007eNZ-8S; Fri, 05 Nov 2021 17:48:16 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/8] media: atomisp: drop duplicated ia_css_isp_configs.c
Date:   Fri,  5 Nov 2021 17:48:08 +0000
Message-Id: <286ba3e4f25e9ba2ab78de4cbf010f18167b2604.1636134411.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
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
 drivers/staging/media/atomisp/Makefile        |   3 +-
 .../css_2401_system/hive/ia_css_isp_configs.c | 386 ------------------
 .../hive => }/ia_css_isp_configs.c            |   0
 3 files changed, 1 insertion(+), 388 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.c
 rename drivers/staging/media/atomisp/pci/{css_2400_system/hive => }/ia_css_isp_configs.c (100%)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 606b7754fdfd..320c14f4afa6 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -53,6 +53,7 @@ atomisp-objs += \
 	pci/hmm/hmm.o \
 	pci/hmm/hmm_reserved_pool.o \
 	pci/ia_css_device_access.o \
+	pci/ia_css_isp_configs.o \
 	pci/isp/kernels/aa/aa_2/ia_css_aa2.host.o \
 	pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.o \
 	pci/isp/kernels/anr/anr_2/ia_css_anr2.host.o \
@@ -157,7 +158,6 @@ atomisp-objs += \
 	pci/system_local.o \
 
 obj-byt = \
-	pci/css_2400_system/hive/ia_css_isp_configs.o \
 	pci/css_2400_system/hive/ia_css_isp_params.o \
 	pci/css_2400_system/hive/ia_css_isp_states.o \
 
@@ -166,7 +166,6 @@ obj-byt = \
 #
 
 obj-cht = \
-	pci/css_2401_system/hive/ia_css_isp_configs.o \
 	pci/css_2401_system/hive/ia_css_isp_params.o \
 	pci/css_2401_system/hive/ia_css_isp_states.o \
 	pci/css_2401_system/host/csi_rx.o \
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.c
deleted file mode 100644
index 1a021ae841fe..000000000000
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.c
+++ /dev/null
@@ -1,386 +0,0 @@
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
-#define IA_CSS_INCLUDE_CONFIGURATIONS
-#include "ia_css_pipeline.h"
-#include "ia_css_isp_configs.h"
-#include "ia_css_debug.h"
-#include "assert_support.h"
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_iterator(
-    const struct ia_css_binary *binary,
-    const struct ia_css_iterator_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_iterator() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.iterator.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.iterator.offset;
-		}
-		if (size) {
-			ia_css_iterator_config((struct sh_css_isp_iterator_isp_config *)
-					       &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					       config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_iterator() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_copy_output(
-    const struct ia_css_binary *binary,
-    const struct ia_css_copy_output_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_copy_output() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.copy_output.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.copy_output.offset;
-		}
-		if (size) {
-			ia_css_copy_output_config((struct sh_css_isp_copy_output_isp_config *)
-						  &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-						  config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_copy_output() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_crop(
-    const struct ia_css_binary *binary,
-    const struct ia_css_crop_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_crop() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.crop.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.crop.offset;
-		}
-		if (size) {
-			ia_css_crop_config((struct sh_css_isp_crop_isp_config *)
-					   &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					   config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_crop() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_fpn(
-    const struct ia_css_binary *binary,
-    const struct ia_css_fpn_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_fpn() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.fpn.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.fpn.offset;
-		}
-		if (size) {
-			ia_css_fpn_config((struct sh_css_isp_fpn_isp_config *)
-					  &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					  config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_fpn() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_dvs(
-    const struct ia_css_binary *binary,
-    const struct ia_css_dvs_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_dvs() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.dvs.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.dvs.offset;
-		}
-		if (size) {
-			ia_css_dvs_config((struct sh_css_isp_dvs_isp_config *)
-					  &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					  config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_dvs() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_qplane(
-    const struct ia_css_binary *binary,
-    const struct ia_css_qplane_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_qplane() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.qplane.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.qplane.offset;
-		}
-		if (size) {
-			ia_css_qplane_config((struct sh_css_isp_qplane_isp_config *)
-					     &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					     config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_qplane() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_output0(
-    const struct ia_css_binary *binary,
-    const struct ia_css_output0_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_output0() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.output0.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.output0.offset;
-		}
-		if (size) {
-			ia_css_output0_config((struct sh_css_isp_output_isp_config *)
-					      &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					      config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_output0() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_output1(
-    const struct ia_css_binary *binary,
-    const struct ia_css_output1_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_output1() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.output1.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.output1.offset;
-		}
-		if (size) {
-			ia_css_output1_config((struct sh_css_isp_output_isp_config *)
-					      &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					      config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_output1() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_output(
-    const struct ia_css_binary *binary,
-    const struct ia_css_output_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_output() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.output.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.output.offset;
-		}
-		if (size) {
-			ia_css_output_config((struct sh_css_isp_output_isp_config *)
-					     &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					     config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_output() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_raw(
-    const struct ia_css_binary *binary,
-    const struct ia_css_raw_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_raw() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.raw.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.raw.offset;
-		}
-		if (size) {
-			ia_css_raw_config((struct sh_css_isp_raw_isp_config *)
-					  &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					  config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_raw() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_tnr(
-    const struct ia_css_binary *binary,
-    const struct ia_css_tnr_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_tnr() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.tnr.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.tnr.offset;
-		}
-		if (size) {
-			ia_css_tnr_config((struct sh_css_isp_tnr_isp_config *)
-					  &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					  config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_tnr() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_ref(
-    const struct ia_css_binary *binary,
-    const struct ia_css_ref_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_ref() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.ref.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.ref.offset;
-		}
-		if (size) {
-			ia_css_ref_config((struct sh_css_isp_ref_isp_config *)
-					  &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					  config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_ref() leave:\n");
-}
-
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-void
-ia_css_configure_vf(
-    const struct ia_css_binary *binary,
-    const struct ia_css_vf_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_vf() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.vf.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.vf.offset;
-		}
-		if (size) {
-			ia_css_vf_config((struct sh_css_isp_vf_isp_config *)
-					 &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					 config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_vf() leave:\n");
-}
diff --git a/drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
similarity index 100%
rename from drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_configs.c
rename to drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
-- 
2.31.1

