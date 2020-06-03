Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B921EC9F6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgFCHBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:43412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgFCHBJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8EEF2087D;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167666;
        bh=yEWmdMtfWS+RkXWM/jVffJ8ardkXYMIQy2MCeetwIjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DWwT3pqmxcbM45q/Ny5q3T+WUlRxKPU+34+S6DAhz7aSDaB8PMXzjUF44WeVfNGSy
         n1dTNLsBg9jhaBCkMOr5xTwjucxLm6knssFQQ+hKDbpZs/g1FTfPQot5BrofpYEQ7L
         AkCdbjLCEiHsNAzTT+JVYmdGW9KTX5I18AmUP5fE=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j9A-QQ; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 15/15] media: atomisp: get rid of a string_support.h abstraction layer
Date:   Wed,  3 Jun 2020 09:01:01 +0200
Message-Id: <be4b9e888184bc10c16b180096ee2592cd42f5f1.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some parts of the driver have their own implementation of
memcpy() & friends. Replace all of them by strscpy().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/hive_isp_css_include/string_support.h | 165 ------------------
 .../ctc/ctc_1.0/ia_css_ctc_table.host.c       |   3 +-
 .../kernels/gc/gc_1.0/ia_css_gc_table.host.c  |   3 +-
 .../kernels/gc/gc_2/ia_css_gc2_table.host.c   |   3 +-
 .../xnr/xnr_1.0/ia_css_xnr_table.host.c       |   3 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  45 +++--
 .../pci/runtime/isys/src/virtual_isys.c       |  29 +--
 .../media/atomisp/pci/sh_css_firmware.c       |   2 +-
 8 files changed, 38 insertions(+), 215 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
deleted file mode 100644
index 7805b40a1855..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
+++ /dev/null
@@ -1,165 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
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
-#ifndef __STRING_SUPPORT_H_INCLUDED__
-#define __STRING_SUPPORT_H_INCLUDED__
-#include <platform_support.h>
-#include <type_support.h>
-
-/*
- * For all non microsoft cases, we need the following functions
- */
-
-/* @brief Copy from src_buf to dest_buf.
- *
- * @param[out] dest_buf. Destination buffer to copy to
- * @param[in]  dest_size. The size of the destination buffer in bytes
- * @param[in]  src_buf. The source buffer
- * @param[in]  src_size. The size of the source buffer in bytes
- * @return     0 on success, error code on failure
- * @return     -EINVAL on Invalid arguments
- * @return     ERANGE on Destination size too small
- */
-static inline int memcpy_s(
-    void *dest_buf,
-    size_t dest_size,
-    const void *src_buf,
-    size_t src_size)
-{
-	if ((!src_buf) || (!dest_buf)) {
-		/* Invalid arguments*/
-		return -EINVAL;
-	}
-
-	if ((dest_size < src_size) || (src_size == 0)) {
-		/* Destination too small*/
-		return ERANGE;
-	}
-
-	memcpy(dest_buf, src_buf, src_size);
-	return 0;
-}
-
-/* @brief Get the length of the string, excluding the null terminator
- *
- * @param[in]  src_str. The source string
- * @param[in]  max_len. Look only for max_len bytes in the string
- * @return     Return the string length excluding null character
- * @return     Return max_len if no null character in the first max_len bytes
- * @return     Returns 0 if src_str is NULL
- */
-static size_t strnlen_s(
-    const char *src_str,
-    size_t max_len)
-{
-	size_t ix;
-
-	if (!src_str) {
-		/* Invalid arguments*/
-		return 0;
-	}
-
-	for (ix = 0; ix < max_len && src_str[ix] != '\0'; ix++)
-		;
-
-	/* On Error, it will return src_size == max_len*/
-	return ix;
-}
-
-/* @brief Copy string from src_str to dest_str
- *
- * @param[out] dest_str. Destination buffer to copy to
- * @param[in]  dest_size. The size of the destination buffer in bytes
- * @param[in]  src_str. The source buffer
- * @param[in]  src_size. The size of the source buffer in bytes
- * @return     Returns 0 on success
- * @return     Returns -EINVAL on invalid arguments
- * @return     Returns ERANGE on destination size too small
- */
-static inline int strncpy_s(
-    char *dest_str,
-    size_t dest_size,
-    const char *src_str,
-    size_t src_size)
-{
-	size_t len;
-
-	if (!dest_str) {
-		/* Invalid arguments*/
-		return -EINVAL;
-	}
-
-	if ((!src_str) || (dest_size == 0)) {
-		/* Invalid arguments*/
-		dest_str[0] = '\0';
-		return -EINVAL;
-	}
-
-	len = strnlen_s(src_str, src_size);
-
-	if (len >= dest_size) {
-		/* Destination too small*/
-		dest_str[0] = '\0';
-		return ERANGE;
-	}
-
-	/* dest_str is big enough for the len */
-	strncpy(dest_str, src_str, len);
-	dest_str[len] = '\0';
-	return 0;
-}
-
-/* @brief Copy string from src_str to dest_str
- *
- * @param[out] dest_str. Destination buffer to copy to
- * @param[in]  dest_size. The size of the destination buffer in bytes
- * @param[in]  src_str. The source buffer
- * @return     Returns 0 on success
- * @return     Returns -EINVAL on invalid arguments
- * @return     Returns ERANGE on destination size too small
- */
-static inline int strcpy_s(
-    char *dest_str,
-    size_t dest_size,
-    const char *src_str)
-{
-	size_t len;
-
-	if (!dest_str) {
-		/* Invalid arguments*/
-		return -EINVAL;
-	}
-
-	if ((!src_str) || (dest_size == 0)) {
-		/* Invalid arguments*/
-		dest_str[0] = '\0';
-		return -EINVAL;
-	}
-
-	len = strnlen_s(src_str, dest_size);
-
-	if (len >= dest_size) {
-		/* Destination too small*/
-		dest_str[0] = '\0';
-		return ERANGE;
-	}
-
-	/* dest_str is big enough for the len */
-	strncpy(dest_str, src_str, len);
-	dest_str[len] = '\0';
-	return 0;
-}
-
-#endif /* __STRING_SUPPORT_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
index 454697c05b56..f13b79586963 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
@@ -13,8 +13,9 @@
  * more details.
  */
 
+#include <linux/string.h> /* for memcpy() */
+
 #include <type_support.h>
-#include <string_support.h> /* memcpy */
 #include "system_global.h"
 #include "vamem.h"
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
index 08e173fff6e0..f48f876777dc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
@@ -13,8 +13,9 @@
  * more details.
  */
 
+#include <linux/string.h> /* for memcpy() */
+
 #include <type_support.h>
-#include <string_support.h> /* memcpy */
 #include "system_global.h"
 #include "vamem.h"
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
index fddb9e2ec24e..7eadb31268eb 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
@@ -13,8 +13,9 @@
  * more details.
  */
 
+#include <linux/string.h> /* for memcpy() */
+
 #include <type_support.h>
-#include <string_support.h> /* memcpy */
 #include "system_global.h"
 #include "vamem.h"
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
index b892dd8ebc2e..5566f3c16aac 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
@@ -13,8 +13,9 @@
  * more details.
  */
 
+#include <linux/string.h> /* for memcpy() */
+
 #include <type_support.h>
-#include <string_support.h> /* memcpy */
 #include "system_global.h"
 #include "vamem.h"
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index f64d8243400b..2bca27a04b02 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -31,6 +31,8 @@
 #define __INLINE_STREAM2MMIO__
 #endif
 
+#include <linux/string.h> /* for strscpy() */
+
 #include "ia_css_debug.h"
 #include "ia_css_debug_pipe.h"
 #include "ia_css_irq.h"
@@ -47,7 +49,6 @@
 #include "system_local.h"
 #include "assert_support.h"
 #include "print_support.h"
-#include "string_support.h"
 
 #include "fifo_monitor.h"
 
@@ -2769,8 +2770,9 @@ ia_css_debug_pipe_graph_dump_stage(
 				 stage->binary->info->blob->name, stage->stage_num);
 	} else if (stage->firmware) {
 		bin_type = "firmware";
-		strncpy_s(blob_name, sizeof(blob_name),
-			  IA_CSS_EXT_ISP_PROG_NAME(stage->firmware), sizeof(blob_name));
+
+		strscpy(blob_name, IA_CSS_EXT_ISP_PROG_NAME(stage->firmware),
+			sizeof(blob_name));
 	}
 
 	/* Guard in case of binaries that don't have any binary_info */
@@ -2836,10 +2838,8 @@ ia_css_debug_pipe_graph_dump_stage(
 				while (ei[p] != ',')
 					p--;
 				/* Last comma found, copy till that comma */
-				strncpy_s(enable_info1,
-					  sizeof(enable_info1),
-					  ei, p);
-				enable_info1[p] = '\0';
+				strscpy(enable_info1, ei,
+                                        p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
 
 				ei += p + 1;
 				l = strlen(ei);
@@ -2849,10 +2849,10 @@ ia_css_debug_pipe_graph_dump_stage(
 					/* we cannot use ei as argument because
 					 * it is not guaranteed dword aligned
 					 */
-					strncpy_s(enable_info2,
-						  sizeof(enable_info2),
-						  ei, l);
-					enable_info2[l] = '\0';
+
+					strscpy(enable_info2, ei,
+						l > sizeof(enable_info2) ? sizeof(enable_info2) : l);
+
 					snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
 						 enable_info1, enable_info2);
 
@@ -2861,10 +2861,10 @@ ia_css_debug_pipe_graph_dump_stage(
 					p = ENABLE_LINE_MAX_LENGTH;
 					while (ei[p] != ',')
 						p--;
-					strncpy_s(enable_info2,
-						  sizeof(enable_info2),
-						  ei, p);
-					enable_info2[p] = '\0';
+
+					strscpy(enable_info2, ei,
+						p > sizeof(enable_info2) ? sizeof(enable_info2) : p);
+
 					ei += p + 1;
 					l = strlen(ei);
 
@@ -2873,9 +2873,8 @@ ia_css_debug_pipe_graph_dump_stage(
 						/* we cannot use ei as argument because
 						* it is not guaranteed dword aligned
 						*/
-						strcpy_s(enable_info3,
-							 sizeof(enable_info3), ei);
-						enable_info3[l] = '\0';
+						strscpy(enable_info3, ei,
+							sizeof(enable_info3));
 						snprintf(enable_info, sizeof(enable_info),
 							 "%s\\n%s\\n%s",
 							 enable_info1, enable_info2,
@@ -2885,13 +2884,11 @@ ia_css_debug_pipe_graph_dump_stage(
 						p = ENABLE_LINE_MAX_LENGTH;
 						while (ei[p] != ',')
 							p--;
-						strncpy_s(enable_info3,
-							  sizeof(enable_info3),
-							  ei, p);
-						enable_info3[p] = '\0';
+						strscpy(enable_info3, ei,
+							p > sizeof(enable_info3) ? sizeof(enable_info3) : p);
 						ei += p + 1;
-						strcpy_s(enable_info3,
-							 sizeof(enable_info3), ei);
+						strscpy(enable_info3, ei,
+							sizeof(enable_info3));
 						snprintf(enable_info, sizeof(enable_info),
 							 "%s\\n%s\\n%s",
 							 enable_info1, enable_info2,
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 95cf6ac342b6..b3c6831cb9e3 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -13,6 +13,8 @@
  * more details.
  */
 
+#include <linux/string.h> /* for memcpy() */
+
 #include "system_global.h"
 
 #ifdef USE_INPUT_SYSTEM_VERSION_2401
@@ -20,7 +22,6 @@
 #include "ia_css_isys.h"
 #include "ia_css_debug.h"
 #include "math_support.h"
-#include "string_support.h"
 #include "virtual_isys.h"
 #include "isp.h"
 #include "sh_css_defs.h"
@@ -650,14 +651,8 @@ static bool calculate_tpg_cfg(
     input_system_cfg_t		*isys_cfg,
     pixelgen_tpg_cfg_t		*cfg)
 {
-	(void)channel;
-	(void)input_port;
+	memcpy(cfg, &isys_cfg->tpg_port_attr, sizeof(pixelgen_tpg_cfg_t));
 
-	memcpy_s(
-	    (void *)cfg,
-	    sizeof(pixelgen_tpg_cfg_t),
-	    (void *)(&isys_cfg->tpg_port_attr),
-	    sizeof(pixelgen_tpg_cfg_t));
 	return true;
 }
 
@@ -667,14 +662,8 @@ static bool calculate_prbs_cfg(
     input_system_cfg_t		*isys_cfg,
     pixelgen_prbs_cfg_t		*cfg)
 {
-	(void)channel;
-	(void)input_port;
+	memcpy(cfg, &isys_cfg->prbs_port_attr, sizeof(pixelgen_prbs_cfg_t));
 
-	memcpy_s(
-	    (void *)cfg,
-	    sizeof(pixelgen_prbs_cfg_t),
-	    (void *)(&isys_cfg->prbs_port_attr),
-	    sizeof(pixelgen_prbs_cfg_t));
 	return true;
 }
 
@@ -692,12 +681,10 @@ static bool calculate_be_cfg(
     bool				metadata,
     csi_rx_backend_cfg_t		*cfg)
 {
-	memcpy_s(
-	    (void *)(&cfg->lut_entry),
-	    sizeof(csi_rx_backend_lut_entry_t),
-	    metadata ? (void *)(&input_port->metadata.backend_lut_entry) :
-	    (void *)(&input_port->csi_rx.backend_lut_entry),
-	    sizeof(csi_rx_backend_lut_entry_t));
+	memcpy(&cfg->lut_entry,
+	      metadata ? &input_port->metadata.backend_lut_entry :
+			 &input_port->csi_rx.backend_lut_entry,
+	      sizeof(csi_rx_backend_lut_entry_t));
 
 	cfg->csi_mipi_cfg.virtual_channel = isys_cfg->csi_port_attr.ch_id;
 	if (metadata) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index d464052a3d2d..2daee7d85631 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -13,6 +13,7 @@
  * more details.
  */
 
+#include <linux/string.h> /* for memcpy() */
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
@@ -28,7 +29,6 @@
 #include "ia_css_isp_param.h"
 
 #include "assert_support.h"
-#include "string_support.h"
 
 #include "isp.h"				/* PMEM_WIDTH_LOG2 */
 
-- 
2.26.2

