Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C525E1E8E80
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729036AbgE3G5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:57:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:44904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728872AbgE3G4I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A6B5221EE;
        Sat, 30 May 2020 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=Oyk1vXm1uatGUoTG7h+zDO23k3FvJgbQFqw1PbnWQIk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X9U8Ve9JIteXE+jzQMfDWKqDLfT19NIOtAfR6aU8poDx7WtPVU0DsNsOGpSY/OiGt
         5HCUcr0nVKh/O6T78TWDZd7zT9G/8M1sObpFjOciLrPsdDV5xpojtElQTGbu0wDHqh
         HQ2UeYFUO4unocAdZGG4OFjoWzj1j3ZNAqbTZqoQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPW-001hqm-7l; Sat, 30 May 2020 08:56:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v2 34/41] media: atomisp: get rid of system_types.h
Date:   Sat, 30 May 2020 08:55:51 +0200
Message-Id: <d99066d9d671b90e5cf3b4f42a51168cfac197bc.1590821410.git.mchehab+huawei@kernel.org>
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

This is just a wrapper for system_local.h.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../base/refcount/interface/ia_css_refcount.h |  2 +-
 .../input_formatter_global.h                  |  2 +-
 .../pci/hive_isp_css_common/irq_global.h      |  2 +-
 .../pci/hive_isp_css_common/isp_global.h      |  2 +-
 .../pci/hive_isp_css_common/sp_global.h       |  2 +-
 .../device_access/device_access.h             |  2 +-
 .../hive_isp_css_include/host/debug_public.h  |  2 +-
 .../hive_isp_css_include/host/dma_public.h    |  2 +-
 .../host/event_fifo_public.h                  |  2 +-
 .../host/fifo_monitor_public.h                |  2 +-
 .../host/gp_device_public.h                   |  2 +-
 .../host/gp_timer_public.h                    |  2 +-
 .../hive_isp_css_include/host/gpio_public.h   |  2 +-
 .../host/input_formatter_public.h             |  2 +-
 .../hive_isp_css_include/host/irq_public.h    |  2 +-
 .../hive_isp_css_include/host/isp_public.h    |  2 +-
 .../host/isys_dma_public.h                    |  2 +-
 .../hive_isp_css_include/host/mmu_public.h    |  2 +-
 .../pci/hive_isp_css_include/host/sp_public.h |  2 +-
 .../host/timed_ctrl_public.h                  |  2 +-
 .../pci/hive_isp_css_include/system_types.h   | 24 -------------------
 .../media/atomisp/pci/ia_css_acc_types.h      |  2 +-
 .../media/atomisp/pci/ia_css_device_access.c  |  2 +-
 .../media/atomisp/pci/ia_css_device_access.h  |  2 +-
 .../frame/interface/ia_css_frame_comm.h       |  2 +-
 .../runtime/rmgr/interface/ia_css_rmgr_vbuf.h |  2 +-
 .../media/atomisp/pci/sh_css_firmware.h       |  2 +-
 .../staging/media/atomisp/pci/sh_css_struct.h |  2 +-
 28 files changed, 27 insertions(+), 51 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/system_types.h

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h b/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
index 9d2b7f3b6c01..72ec09dde256 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
+++ b/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
@@ -16,7 +16,7 @@
 #define _IA_CSS_REFCOUNT_H_
 
 #include <type_support.h>
-#include <system_types.h>
+#include <system_local.h>
 #include <ia_css_err.h>
 #include <ia_css_types.h>
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter_global.h
index 163521c53d4b..c0658972f9cb 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter_global.h
@@ -19,7 +19,7 @@
 #define IS_INPUT_SWITCH_VERSION2
 
 #include <type_support.h>
-#include <system_types.h>
+#include <system_local.h>
 #include "if_defs.h"
 #include "str2mem_defs.h"
 #include "input_switch_2400_defs.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
index 64554d80dc0b..883754def2d8 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
@@ -15,7 +15,7 @@
 #ifndef __IRQ_GLOBAL_H_INCLUDED__
 #define __IRQ_GLOBAL_H_INCLUDED__
 
-#include <system_types.h>
+#include <system_local.h>
 
 #define IS_IRQ_VERSION_2
 #define IS_IRQ_MAP_VERSION_2
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
index 1a8547d58435..ad25597c4f03 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
@@ -15,7 +15,7 @@
 #ifndef __ISP_GLOBAL_H_INCLUDED__
 #define __ISP_GLOBAL_H_INCLUDED__
 
-#include <system_types.h>
+#include <system_local.h>
 
 #if defined(HAS_ISP_2401_MAMOIADA)
 #define IS_ISP_2401_MAMOIADA
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
index 6ec4e590e3b4..252fe8c624eb 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
@@ -15,7 +15,7 @@
 #ifndef __SP_GLOBAL_H_INCLUDED__
 #define __SP_GLOBAL_H_INCLUDED__
 
-#include <system_types.h>
+#include <system_local.h>
 
 #if defined(HAS_SP_2401)
 #define IS_SP_2401
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
index be031d41de7c..7168c3945772 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
@@ -39,7 +39,7 @@ more details.
  * User provided file that defines the system address types:
  *	- hrt_address	a type that can hold the (sub)system address range
  */
-#include "system_types.h"
+#include "system_local.h"
 /*
  * We cannot assume that the global system address size is the size of
  * a pointer because a (say) 64-bit host can be simulated in a 32-bit
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
index aa386e4d4149..8128e40dcc67 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
@@ -17,7 +17,7 @@
 
 #include <type_support.h>
 #include <ia_css_types.h>
-#include "system_types.h"
+#include "system_local.h"
 
 /*! brief
  *
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
index 385b978b703b..b32cfde16b5a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
@@ -15,7 +15,7 @@
 #ifndef __DMA_PUBLIC_H_INCLUDED__
 #define __DMA_PUBLIC_H_INCLUDED__
 
-#include "system_types.h"
+#include "system_local.h"
 
 typedef struct dma_state_s		dma_state_t;
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fifo_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fifo_public.h
index a84b74b3bc1e..f6a96401cc68 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fifo_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fifo_public.h
@@ -16,7 +16,7 @@
 #define __EVENT_FIFO_PUBLIC_H
 
 #include <type_support.h>
-#include "system_types.h"
+#include "system_local.h"
 
 /*! Blocking read from an event source EVENT[ID]
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_monitor_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_monitor_public.h
index e451d6f2a70d..9f01194184a7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_monitor_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_monitor_public.h
@@ -15,7 +15,7 @@
 #ifndef __FIFO_MONITOR_PUBLIC_H_INCLUDED__
 #define __FIFO_MONITOR_PUBLIC_H_INCLUDED__
 
-#include "system_types.h"
+#include "system_local.h"
 
 typedef struct fifo_channel_state_s		fifo_channel_state_t;
 typedef struct fifo_switch_state_s		fifo_switch_state_t;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device_public.h
index 7cc0799d49ed..5ec5d56457a7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device_public.h
@@ -15,7 +15,7 @@
 #ifndef __GP_DEVICE_PUBLIC_H_INCLUDED__
 #define __GP_DEVICE_PUBLIC_H_INCLUDED__
 
-#include "system_types.h"
+#include "system_local.h"
 
 typedef struct gp_device_state_s		gp_device_state_t;
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_public.h
index 2ddb8c40a5b2..0800280b7393 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_public.h
@@ -15,7 +15,7 @@
 #ifndef __GP_TIMER_PUBLIC_H_INCLUDED__
 #define __GP_TIMER_PUBLIC_H_INCLUDED__
 
-#include "system_types.h"
+#include "system_local.h"
 
 /*! initialize mentioned timer
 param ID		timer_id
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gpio_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gpio_public.h
index d21aab3a179d..bd1350b8f9ee 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gpio_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gpio_public.h
@@ -15,7 +15,7 @@
 #ifndef __GPIO_PUBLIC_H_INCLUDED__
 #define __GPIO_PUBLIC_H_INCLUDED__
 
-#include "system_types.h"
+#include "system_local.h"
 
 /*! Write to a control register of GPIO[ID]
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_formatter_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_formatter_public.h
index e5758cb8bedd..0a9e450af765 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_formatter_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_formatter_public.h
@@ -16,7 +16,7 @@
 #define __INPUT_FORMATTER_PUBLIC_H_INCLUDED__
 
 #include <type_support.h>
-#include "system_types.h"
+#include "system_local.h"
 
 /*! Reset INPUT_FORMATTER[ID]
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index dfe2aa9ff257..cb210166b3b9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -16,7 +16,7 @@
 #define __IRQ_PUBLIC_H_INCLUDED__
 
 #include <type_support.h>
-#include "system_types.h"
+#include "system_local.h"
 
 /*! Read the control registers of IRQ[ID]
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
index 0da2937b900e..09e209ed1847 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
@@ -16,7 +16,7 @@
 #define __ISP_PUBLIC_H_INCLUDED__
 
 #include <type_support.h>
-#include "system_types.h"
+#include "system_local.h"
 
 /*! Enable or disable the program complete irq signal of ISP[ID]
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
index 734634aedadf..96670c740a78 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
@@ -17,7 +17,7 @@
 
 #ifdef USE_INPUT_SYSTEM_VERSION_2401
 
-#include "system_types.h"
+#include "system_local.h"
 #include "type_support.h"
 
 STORAGE_CLASS_ISYS2401_DMA_H void isys2401_dma_reg_store(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 278f9cd85a00..7cdb270529f7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -15,7 +15,7 @@
 #ifndef __MMU_PUBLIC_H_INCLUDED__
 #define __MMU_PUBLIC_H_INCLUDED__
 
-#include "system_types.h"
+#include "system_local.h"
 #include "device_access.h"
 #include "assert_support.h"
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
index b8db5469b592..b309890f5a76 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
@@ -16,7 +16,7 @@
 #define __SP_PUBLIC_H_INCLUDED__
 
 #include <type_support.h>
-#include "system_types.h"
+#include "system_local.h"
 
 typedef struct sp_state_s		sp_state_t;
 typedef struct sp_stall_s		sp_stall_t;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
index 5f9277adb2ab..e59a1f8526af 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
@@ -15,7 +15,7 @@
 #ifndef __TIMED_CTRL_PUBLIC_H_INCLUDED__
 #define __TIMED_CTRL_PUBLIC_H_INCLUDED__
 
-#include "system_types.h"
+#include "system_local.h"
 
 /*! Write to a control register of TIMED_CTRL[ID]
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/system_types.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/system_types.h
deleted file mode 100644
index 764fda8dd214..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/system_types.h
+++ /dev/null
@@ -1,24 +0,0 @@
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
-#ifndef __SYSTEM_TYPES_H_INCLUDED__
-#define __SYSTEM_TYPES_H_INCLUDED__
-
-/**
-* @file
-* Platform specific types.
-*/
-
-#include "system_local.h"
-
-#endif /* __SYSTEM_TYPES_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index d281846eeba5..55b4dc9bb5ea 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -19,7 +19,7 @@
  * This file contains types used for acceleration
  */
 
-#include <system_types.h>	/* HAS_IRQ_MAP_VERSION_# */
+#include <system_local.h>	/* HAS_IRQ_MAP_VERSION_# */
 #include <type_support.h>
 #include <platform_support.h>
 #include <debug_global.h>
diff --git a/drivers/staging/media/atomisp/pci/ia_css_device_access.c b/drivers/staging/media/atomisp/pci/ia_css_device_access.c
index 6ad8687cf08b..fe7556b59aef 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_device_access.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_device_access.c
@@ -14,7 +14,7 @@
 
 #include "ia_css_device_access.h"
 #include <type_support.h>   /* for uint*, size_t */
-#include <system_types.h>   /* for hrt_address */
+#include <system_local.h>   /* for hrt_address */
 #include <ia_css_env.h>     /* for ia_css_hw_access_env */
 #include <assert_support.h> /* for assert */
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_device_access.h b/drivers/staging/media/atomisp/pci/ia_css_device_access.h
index b2bf7d540b62..9445c3141db5 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_device_access.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_device_access.h
@@ -20,7 +20,7 @@
  */
 
 #include <type_support.h> /* for uint*, size_t */
-#include <system_types.h> /* for hrt_address */
+#include <system_local.h> /* for hrt_address */
 #include <ia_css_env.h>   /* for ia_css_hw_access_env */
 
 void
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
index 138aaaf07854..0a98d363e2bf 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
@@ -18,7 +18,7 @@
 #include "type_support.h"
 #include "platform_support.h"
 #include "runtime/bufq/interface/ia_css_bufq_comm.h"
-#include <system_types.h>	 /* ia_css_ptr */
+#include <system_local.h>	 /* ia_css_ptr */
 
 /*
  * These structs are derived from structs defined in ia_css_types.h
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
index be5d42bb3545..b3cf42c67187 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
@@ -18,7 +18,7 @@
 #include "ia_css_rmgr.h"
 #include <type_support.h>
 #include <ia_css_types.h>
-#include <system_types.h>
+#include <system_local.h>
 
 /**
  * @brief Data structure for the resource handle (host, vbuf)
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.h b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
index 68f389dcf3fc..22a58ab9cad7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
@@ -15,7 +15,7 @@
 #ifndef _SH_CSS_FIRMWARE_H_
 #define _SH_CSS_FIRMWARE_H_
 
-#include <system_types.h>
+#include <system_local.h>
 
 #include <ia_css_err.h>
 #include <ia_css_acc_types.h>
diff --git a/drivers/staging/media/atomisp/pci/sh_css_struct.h b/drivers/staging/media/atomisp/pci/sh_css_struct.h
index d4ea847d29ce..fd87c2c5c92c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_struct.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_struct.h
@@ -24,7 +24,7 @@
 */
 
 #include <type_support.h>
-#include <system_types.h>
+#include <system_local.h>
 #include "ia_css_pipeline.h"
 #include "ia_css_pipe_public.h"
 #include "ia_css_frame_public.h"
-- 
2.26.2

