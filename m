Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F481ECA0C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgFCHCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:02:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:43120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgFCHBG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8076A207D3;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=zTgcn1xyeisASr5rtVgAA69S8arZoiZGZVVbiDZboIY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H3mW5vRx6VtVR1qOohDuchqIYDATutlTjsBRi+9PvVCCjvla3e+vffujS/0ru4xSE
         kwjiB0ulPpV4ayluWgkbMb9UVL6/z3ArY+K6bEPtZHr491RkrI99EHYSZS2Othjo/K
         afoZ1WO9OkKYsPV48QR/mE45FZpgzTkLDC98WA/s=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8V-DI; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 07/15] media: atomisp: use just one mamoiada_params.h
Date:   Wed,  3 Jun 2020 09:00:53 +0200
Message-Id: <628be9a7bed955aab004b076f5c6a44c32c90ad9.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As both isp2400 and isp2401 files are identical, remove one
of them and remove the test for ISP variant.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/hive_isp_css_common/isp_global.h      |   6 +-
 .../atomisp/pci/isp2401_mamoiada_params.h     | 211 ------------------
 ...00_mamoiada_params.h => mamoiada_params.h} |   0
 3 files changed, 1 insertion(+), 216 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h
 rename drivers/staging/media/atomisp/pci/{css_2400_system/hrt/isp2400_mamoiada_params.h => mamoiada_params.h} (100%)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
index 5212d52198bd..5c6891c9b451 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
@@ -18,11 +18,7 @@
 
 #include <system_local.h>
 
-#ifdef ISP2401
-#include "isp2401_mamoiada_params.h"
-#else
-#include "isp2400_mamoiada_params.h"
-#endif
+#include "mamoiada_params.h"
 
 #define ISP_PMEM_WIDTH_LOG2		ISP_LOG2_PMEM_WIDTH
 #define ISP_PMEM_SIZE			ISP_PMEM_DEPTH
diff --git a/drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h b/drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h
deleted file mode 100644
index e18e5f3576df..000000000000
--- a/drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h
+++ /dev/null
@@ -1,211 +0,0 @@
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
-/* Version */
-#define RTL_VERSION
-
-/* instruction pipeline depth */
-#define ISP_BRANCHDELAY                        5
-
-/* bus */
-#define ISP_BUS_WIDTH                          32
-#define ISP_BUS_ADDR_WIDTH                     32
-#define ISP_BUS_BURST_SIZE                     1
-
-/* data-path */
-#define ISP_SCALAR_WIDTH                       32
-#define ISP_SLICE_NELEMS                       4
-#define ISP_VEC_NELEMS                         64
-#define ISP_VEC_ELEMBITS                       14
-#define ISP_VEC_ELEM8BITS                      16
-#define ISP_CLONE_DATAPATH_IS_16               1
-
-/* memories */
-#define ISP_DMEM_DEPTH                         4096
-#define ISP_DMEM_BSEL_DOWNSAMPLE               8
-#define ISP_VMEM_DEPTH                         3072
-#define ISP_VMEM_BSEL_DOWNSAMPLE               8
-#define ISP_VMEM_ELEMBITS                      14
-#define ISP_VMEM_ELEM_PRECISION                14
-#define ISP_PMEM_DEPTH                         2048
-#define ISP_PMEM_WIDTH                         640
-#define ISP_VAMEM_ADDRESS_BITS                 12
-#define ISP_VAMEM_ELEMBITS                     12
-#define ISP_VAMEM_DEPTH                        2048
-#define ISP_VAMEM_ALIGNMENT                    2
-#define ISP_VA_ADDRESS_WIDTH                   896
-#define ISP_VEC_VALSU_LATENCY                  ISP_VEC_NELEMS
-#define ISP_HIST_ADDRESS_BITS                  12
-#define ISP_HIST_ALIGNMENT                     4
-#define ISP_HIST_COMP_IN_PREC                  12
-#define ISP_HIST_DEPTH                         1024
-#define ISP_HIST_WIDTH                         24
-#define ISP_HIST_COMPONENTS                    4
-
-/* program counter */
-#define ISP_PC_WIDTH                           13
-
-/* Template switches */
-#define ISP_SHIELD_INPUT_DMEM                  0
-#define ISP_SHIELD_OUTPUT_DMEM                 1
-#define ISP_SHIELD_INPUT_VMEM                  0
-#define ISP_SHIELD_OUTPUT_VMEM                 0
-#define ISP_SHIELD_INPUT_PMEM                  1
-#define ISP_SHIELD_OUTPUT_PMEM                 1
-#define ISP_SHIELD_INPUT_HIST                  1
-#define ISP_SHIELD_OUTPUT_HIST                 1
-/* When LUT is select the shielding is always on */
-#define ISP_SHIELD_INPUT_VAMEM                 1
-#define ISP_SHIELD_OUTPUT_VAMEM                1
-
-#define ISP_HAS_IRQ                            1
-#define ISP_HAS_SOFT_RESET                     1
-#define ISP_HAS_VEC_DIV                        0
-#define ISP_HAS_VFU_W_2O                       1
-#define ISP_HAS_DEINT3                         1
-#define ISP_HAS_LUT                            1
-#define ISP_HAS_HIST                           1
-#define ISP_HAS_VALSU                          1
-#define ISP_HAS_3rdVALSU                       1
-#define ISP_VRF1_HAS_2P                        1
-
-#define ISP_SRU_GUARDING                       1
-#define ISP_VLSU_GUARDING                      1
-
-#define ISP_VRF_RAM			     1
-#define ISP_SRF_RAM			     1
-
-#define ISP_SPLIT_VMUL_VADD_IS                 0
-#define ISP_RFSPLIT_FPGA                       0
-
-/* RSN or Bus pipelining */
-#define ISP_RSN_PIPE                           1
-#define ISP_VSF_BUS_PIPE                       0
-
-/* extra slave port to vmem */
-#define ISP_IF_VMEM                            0
-#define ISP_GDC_VMEM                           0
-
-/* Streaming ports */
-#define ISP_IF                                 1
-#define ISP_IF_B                               1
-#define ISP_GDC                                1
-#define ISP_SCL                                1
-#define ISP_GPFIFO                             1
-#define ISP_SP                                 1
-
-/* Removing Issue Slot(s) */
-#define ISP_HAS_NOT_SIMD_IS2                   0
-#define ISP_HAS_NOT_SIMD_IS3                   0
-#define ISP_HAS_NOT_SIMD_IS4                   0
-#define ISP_HAS_NOT_SIMD_IS4_VADD              0
-#define ISP_HAS_NOT_SIMD_IS5                   0
-#define ISP_HAS_NOT_SIMD_IS6                   0
-#define ISP_HAS_NOT_SIMD_IS7                   0
-#define ISP_HAS_NOT_SIMD_IS8                   0
-
-/* ICache  */
-#define ISP_ICACHE                             1
-#define ISP_ICACHE_ONLY                        0
-#define ISP_ICACHE_PREFETCH                    1
-#define ISP_ICACHE_INDEX_BITS                  8
-#define ISP_ICACHE_SET_BITS                    5
-#define ISP_ICACHE_BLOCKS_PER_SET_BITS         1
-
-/* Experimental Flags */
-#define ISP_EXP_1                              0
-#define ISP_EXP_2                              0
-#define ISP_EXP_3                              0
-#define ISP_EXP_4                              0
-#define ISP_EXP_5                              0
-#define ISP_EXP_6                              0
-
-/* Derived values */
-#define ISP_LOG2_PMEM_WIDTH                    10
-#define ISP_VEC_WIDTH                          896
-#define ISP_SLICE_WIDTH                        56
-#define ISP_VMEM_WIDTH                         896
-#define ISP_VMEM_ALIGN                         128
-#define ISP_SIMDLSU                            1
-#define ISP_LSU_IMM_BITS                       12
-
-/* convenient shortcuts for software*/
-#define ISP_NWAY                               ISP_VEC_NELEMS
-#define NBITS                                  ISP_VEC_ELEMBITS
-
-#define _isp_ceil_div(a, b)                     (((a) + (b) - 1) / (b))
-
-#define ISP_VEC_ALIGN                          ISP_VMEM_ALIGN
-
-/* register file sizes */
-#define ISP_RF0_SIZE        64
-#define ISP_RF1_SIZE        16
-#define ISP_RF2_SIZE        64
-#define ISP_RF3_SIZE        4
-#define ISP_RF4_SIZE        64
-#define ISP_RF5_SIZE        16
-#define ISP_RF6_SIZE        16
-#define ISP_RF7_SIZE        16
-#define ISP_RF8_SIZE        16
-#define ISP_RF9_SIZE        16
-#define ISP_RF10_SIZE       16
-#define ISP_RF11_SIZE       16
-
-#define ISP_SRF1_SIZE       4
-#define ISP_SRF2_SIZE       64
-#define ISP_SRF3_SIZE       64
-#define ISP_SRF4_SIZE       32
-#define ISP_SRF5_SIZE       64
-#define ISP_FRF0_SIZE       16
-#define ISP_FRF1_SIZE       4
-#define ISP_FRF2_SIZE       16
-#define ISP_FRF3_SIZE       4
-#define ISP_FRF4_SIZE       4
-#define ISP_FRF5_SIZE       8
-#define ISP_FRF6_SIZE       4
-/* register file read latency */
-#define ISP_VRF1_READ_LAT       1
-#define ISP_VRF2_READ_LAT       1
-#define ISP_VRF3_READ_LAT       1
-#define ISP_VRF4_READ_LAT       1
-#define ISP_VRF5_READ_LAT       1
-#define ISP_VRF6_READ_LAT       1
-#define ISP_VRF7_READ_LAT       1
-#define ISP_VRF8_READ_LAT       1
-#define ISP_SRF1_READ_LAT       1
-#define ISP_SRF2_READ_LAT       1
-#define ISP_SRF3_READ_LAT       1
-#define ISP_SRF4_READ_LAT       1
-#define ISP_SRF5_READ_LAT       1
-#define ISP_SRF5_READ_LAT       1
-/* immediate sizes */
-#define ISP_IS1_IMM_BITS        14
-#define ISP_IS2_IMM_BITS        13
-#define ISP_IS3_IMM_BITS        14
-#define ISP_IS4_IMM_BITS        14
-#define ISP_IS5_IMM_BITS        9
-#define ISP_IS6_IMM_BITS        16
-#define ISP_IS7_IMM_BITS        9
-#define ISP_IS8_IMM_BITS        16
-#define ISP_IS9_IMM_BITS        11
-/* fifo depths */
-#define ISP_IF_FIFO_DEPTH         0
-#define ISP_IF_B_FIFO_DEPTH       0
-#define ISP_DMA_FIFO_DEPTH        0
-#define ISP_OF_FIFO_DEPTH         0
-#define ISP_GDC_FIFO_DEPTH        0
-#define ISP_SCL_FIFO_DEPTH        0
-#define ISP_GPFIFO_FIFO_DEPTH     0
-#define ISP_SP_FIFO_DEPTH         0
diff --git a/drivers/staging/media/atomisp/pci/css_2400_system/hrt/isp2400_mamoiada_params.h b/drivers/staging/media/atomisp/pci/mamoiada_params.h
similarity index 100%
rename from drivers/staging/media/atomisp/pci/css_2400_system/hrt/isp2400_mamoiada_params.h
rename to drivers/staging/media/atomisp/pci/mamoiada_params.h
-- 
2.26.2

