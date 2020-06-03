Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA431ECA0F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgFCHCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:02:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:43104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbgFCHBG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82E28207DA;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=726xFVF7IIAMWok/JzclpdaLkSETydAbYT1Vt3Cjp8E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vu9BNj2fM3gbZHbWhjuubDiMS4qI0xLAieNaacl7R6P2L575yK/TRs0dXm4ztihx6
         CUYFREUQ5pmlVqEBwd209t4YlMNmf0dGpLgpVkx6TEmAvajjlwXlhnf858E08zP5jM
         uewOtnehIHmdlfzbUswDdGDf0J9eMlkFaZpzCEWI=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8C-75; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 03/15] media: atomisp: get rid of a duplicated file
Date:   Wed,  3 Jun 2020 09:00:49 +0200
Message-Id: <5a1fbf15b2a720f74f0548edcd27690efbaffe67.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The contents of hive_isp_css_2401_irq_types_hrt.h and
hive_isp_css_common/irq_global.h are identical, except for
one unused enum:

On isp2401, this IRQ line has this name:

	hrt_isp_css_irq_is2401 = HIVE_GP_DEV_IRQ_ISP_PMEM_ERROR_BIT_ID,

While the same bit is named as:
	hrt_isp_css_irq_isp_pmem_error = HIVE_GP_DEV_IRQ_ISP_PMEM_ERROR_BIT_ID,

At the isp2400 version.

Remove one of them, in order to reduce the code differences
between those two versions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/hive_isp_css_2401_irq_types_hrt.h     | 69 -------------------
 .../pci/hive_isp_css_common/irq_global.h      | 10 +--
 ...sp_css_irq_types_hrt.h => irq_types_hrt.h} |  0
 3 files changed, 1 insertion(+), 78 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_2401_irq_types_hrt.h
 rename drivers/staging/media/atomisp/pci/{css_2400_system/hrt/hive_isp_css_irq_types_hrt.h => irq_types_hrt.h} (100%)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_2401_irq_types_hrt.h b/drivers/staging/media/atomisp/pci/hive_isp_css_2401_irq_types_hrt.h
deleted file mode 100644
index 69fefe634a6a..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_2401_irq_types_hrt.h
+++ /dev/null
@@ -1,69 +0,0 @@
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
-#ifndef _HIVE_ISP_CSS_2401_IRQ_TYPES_HRT_H_
-#define _HIVE_ISP_CSS_2401_IRQ_TYPES_HRT_H_
-
-/*
- * These are the indices of each interrupt in the interrupt
- * controller's registers. these can be used as the irq_id
- * argument to the hrt functions irq_controller.h.
- *
- * The definitions are taken from <system>_defs.h
- */
-typedef enum hrt_isp_css_irq {
-	hrt_isp_css_irq_gpio_pin_0           = HIVE_GP_DEV_IRQ_GPIO_PIN_0_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_1           = HIVE_GP_DEV_IRQ_GPIO_PIN_1_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_2           = HIVE_GP_DEV_IRQ_GPIO_PIN_2_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_3           = HIVE_GP_DEV_IRQ_GPIO_PIN_3_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_4           = HIVE_GP_DEV_IRQ_GPIO_PIN_4_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_5           = HIVE_GP_DEV_IRQ_GPIO_PIN_5_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_6           = HIVE_GP_DEV_IRQ_GPIO_PIN_6_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_7           = HIVE_GP_DEV_IRQ_GPIO_PIN_7_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_8           = HIVE_GP_DEV_IRQ_GPIO_PIN_8_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_9           = HIVE_GP_DEV_IRQ_GPIO_PIN_9_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_10          = HIVE_GP_DEV_IRQ_GPIO_PIN_10_BIT_ID,
-	hrt_isp_css_irq_gpio_pin_11          = HIVE_GP_DEV_IRQ_GPIO_PIN_11_BIT_ID,
-	hrt_isp_css_irq_sp                   = HIVE_GP_DEV_IRQ_SP_BIT_ID,
-	hrt_isp_css_irq_isp                  = HIVE_GP_DEV_IRQ_ISP_BIT_ID,
-	hrt_isp_css_irq_isys                 = HIVE_GP_DEV_IRQ_ISYS_BIT_ID,
-	hrt_isp_css_irq_isel                 = HIVE_GP_DEV_IRQ_ISEL_BIT_ID,
-	hrt_isp_css_irq_ifmt                 = HIVE_GP_DEV_IRQ_IFMT_BIT_ID,
-	hrt_isp_css_irq_sp_stream_mon        = HIVE_GP_DEV_IRQ_SP_STREAM_MON_BIT_ID,
-	hrt_isp_css_irq_isp_stream_mon       = HIVE_GP_DEV_IRQ_ISP_STREAM_MON_BIT_ID,
-	hrt_isp_css_irq_mod_stream_mon       = HIVE_GP_DEV_IRQ_MOD_STREAM_MON_BIT_ID,
-	hrt_isp_css_irq_is2401               = HIVE_GP_DEV_IRQ_ISP_PMEM_ERROR_BIT_ID,
-	hrt_isp_css_irq_isp_bamem_error      = HIVE_GP_DEV_IRQ_ISP_BAMEM_ERROR_BIT_ID,
-	hrt_isp_css_irq_isp_dmem_error       = HIVE_GP_DEV_IRQ_ISP_DMEM_ERROR_BIT_ID,
-	hrt_isp_css_irq_sp_icache_mem_error  = HIVE_GP_DEV_IRQ_SP_ICACHE_MEM_ERROR_BIT_ID,
-	hrt_isp_css_irq_sp_dmem_error        = HIVE_GP_DEV_IRQ_SP_DMEM_ERROR_BIT_ID,
-	hrt_isp_css_irq_mmu_cache_mem_error  = HIVE_GP_DEV_IRQ_MMU_CACHE_MEM_ERROR_BIT_ID,
-	hrt_isp_css_irq_gp_timer_0           = HIVE_GP_DEV_IRQ_GP_TIMER_0_BIT_ID,
-	hrt_isp_css_irq_gp_timer_1           = HIVE_GP_DEV_IRQ_GP_TIMER_1_BIT_ID,
-	hrt_isp_css_irq_sw_pin_0             = HIVE_GP_DEV_IRQ_SW_PIN_0_BIT_ID,
-	hrt_isp_css_irq_sw_pin_1             = HIVE_GP_DEV_IRQ_SW_PIN_1_BIT_ID,
-	hrt_isp_css_irq_dma                  = HIVE_GP_DEV_IRQ_DMA_BIT_ID,
-	hrt_isp_css_irq_sp_stream_mon_b      = HIVE_GP_DEV_IRQ_SP_STREAM_MON_B_BIT_ID,
-	/* this must (obviously) be the last on in the enum */
-	hrt_isp_css_irq_num_irqs
-} hrt_isp_css_irq_t;
-
-typedef enum hrt_isp_css_irq_status {
-	hrt_isp_css_irq_status_error,
-	hrt_isp_css_irq_status_more_irqs,
-	hrt_isp_css_irq_status_success
-} hrt_isp_css_irq_status_t;
-
-#endif /* _HIVE_ISP_CSS_2401_IRQ_TYPES_HRT_H_ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
index f8e9005dc9c1..4a1dea6dfd40 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
@@ -23,15 +23,7 @@
 
 /* We cannot include the (hrt host ID) file defining the "CSS_RECEIVER" property without side effects */
 #ifndef HAS_NO_RX
-#if defined(IS_ISP_2400_MAMOIADA_SYSTEM)
-/*#define CSS_RECEIVER testbench_isp_inp_sys_csi_receiver*/
-#include "hive_isp_css_irq_types_hrt.h"	/* enum	hrt_isp_css_irq */
-#elif defined(IS_ISP_2401_MAMOIADA_SYSTEM)
-/*#define CSS_RECEIVER testbench_isp_is_2400_inp_sys_csi_receiver*/
-#include "hive_isp_css_2401_irq_types_hrt.h"	/* enum	hrt_isp_css_irq */
-#else
-#error "irq_global.h: 2400_SYSTEM must be one of {2400, 2401 }"
-#endif
+#include "irq_types_hrt.h"
 #endif
 
 /* The IRQ is not mapped uniformly on its related interfaces */
diff --git a/drivers/staging/media/atomisp/pci/css_2400_system/hrt/hive_isp_css_irq_types_hrt.h b/drivers/staging/media/atomisp/pci/irq_types_hrt.h
similarity index 100%
rename from drivers/staging/media/atomisp/pci/css_2400_system/hrt/hive_isp_css_irq_types_hrt.h
rename to drivers/staging/media/atomisp/pci/irq_types_hrt.h
-- 
2.26.2

