Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD2125B127
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgIBQNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728308AbgIBQK4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:56 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6927C21D90;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=EERb3EiHYgV+kjoeUIa1qghfUpQCDCfNMYKTD1gr61w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kww1qjzBj12rxsBQlAPH4J1DJfhRyBctOFqrkl+9DzFmV9keKOc3OvN9WVnd3WESM
         IQtIIkG8m5YjLySb0Akn8UoDYJCw8H4sGHVH97rUgRMO2Kkk7DUgcFwFKzuvAMD0NE
         8Bq7gKZEvc6qXTp2QFbtGeKM/HDh+7UEkm0vEy1Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tB1-IN; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 28/38] media: atomisp: get rid of isys_dma.h and isys_dma_local.h
Date:   Wed,  2 Sep 2020 18:10:31 +0200
Message-Id: <5904ab04523f4d6e863e615b2a56f9734aa8a5ee.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There aren't much on this abstraction. Just move the defines
to isys_dma_private.h and isys_dma_public.h, cleaning up
the includes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/css_2401_system/host/isys_dma.c       | 10 +---
 .../pci/css_2401_system/host/isys_dma_local.h | 21 ---------
 .../css_2401_system/host/isys_dma_private.h   | 12 ++---
 .../host/isys_dma_public.h                    |  4 +-
 .../pci/hive_isp_css_include/isys_dma.h       | 47 -------------------
 .../atomisp/pci/isp2401_input_system_global.h |  3 +-
 .../atomisp/pci/runtime/isys/src/isys_init.c  |  2 +-
 7 files changed, 12 insertions(+), 87 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_dma.h

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
index 5809dbb6e5aa..2a5159945a44 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
@@ -13,16 +13,10 @@
  * more details.
  */
 
-#include "isys_dma.h"
+#include "system_local.h"
+#include "isys_dma_global.h"
 #include "assert_support.h"
-
-#ifndef __INLINE_ISYS2401_DMA__
-/*
- * Include definitions for isys dma register access functions. isys_dma.h
- * includes declarations of these functions by including isys_dma_public.h.
- */
 #include "isys_dma_private.h"
-#endif
 
 const isys2401_dma_channel N_ISYS2401_DMA_CHANNEL_PROCS[N_ISYS2401_DMA_ID] = {
 	N_ISYS2401_DMA_CHANNEL
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_local.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_local.h
deleted file mode 100644
index 878933261a43..000000000000
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_local.h
+++ /dev/null
@@ -1,21 +0,0 @@
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
-#ifndef __ISYS_DMA_LOCAL_H_INCLUDED__
-#define __ISYS_DMA_LOCAL_H_INCLUDED__
-
-#include "isys_dma_global.h"
-
-#endif /* __ISYS_DMA_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
index eb35b7bcead4..a313e1dc7c71 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
@@ -23,10 +23,9 @@
 #include "dma_v2_defs.h"
 #include "print_support.h"
 
-STORAGE_CLASS_ISYS2401_DMA_C void isys2401_dma_reg_store(
-    const isys2401_dma_ID_t	dma_id,
-    const unsigned int	reg,
-    const hrt_data		value)
+void isys2401_dma_reg_store(const isys2401_dma_ID_t	dma_id,
+			    const unsigned int		reg,
+			    const hrt_data		value)
 {
 	unsigned int reg_loc;
 
@@ -40,9 +39,8 @@ STORAGE_CLASS_ISYS2401_DMA_C void isys2401_dma_reg_store(
 	ia_css_device_store_uint32(reg_loc, value);
 }
 
-STORAGE_CLASS_ISYS2401_DMA_C hrt_data isys2401_dma_reg_load(
-    const isys2401_dma_ID_t	dma_id,
-    const unsigned int	reg)
+hrt_data isys2401_dma_reg_load(const isys2401_dma_ID_t	dma_id,
+			       const unsigned int	reg)
 {
 	unsigned int reg_loc;
 	hrt_data value;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
index 88ac78f69e7b..d9b6af898c06 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
@@ -21,12 +21,12 @@
 #include "system_local.h"
 #include "type_support.h"
 
-STORAGE_CLASS_ISYS2401_DMA_H void isys2401_dma_reg_store(
+extern void isys2401_dma_reg_store(
     const isys2401_dma_ID_t dma_id,
     const unsigned int	reg,
     const hrt_data		value);
 
-STORAGE_CLASS_ISYS2401_DMA_H hrt_data isys2401_dma_reg_load(
+extern hrt_data isys2401_dma_reg_load(
     const isys2401_dma_ID_t dma_id,
     const unsigned int	reg);
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_dma.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_dma.h
deleted file mode 100644
index 6a759142eda8..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_dma.h
+++ /dev/null
@@ -1,47 +0,0 @@
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
-#ifndef __ISYS_DMA_H_INCLUDED__
-#define __ISYS_DMA_H_INCLUDED__
-
-/*
- * This file is included on every cell {SP,ISP,host} and on every system
- * that uses the input system device(s). It defines the API to DLI bridge
- *
- * System and cell specific interfaces and inline code are included
- * conditionally through Makefile path settings.
- *
- * - system and cell agnostic interfaces, constants and identifiers
- * - public:  system agnostic, cell specific interfaces
- * - private: system dependent, cell specific interfaces &
- *   inline implementations
- * - global:  system specific constants and identifiers
- * - local:   system and cell specific constants and identifiers
- */
-
-#include "system_local.h"
-#include "isys_dma_local.h"
-
-#ifndef __INLINE_ISYS2401_DMA__
-#define STORAGE_CLASS_ISYS2401_DMA_H extern
-#define STORAGE_CLASS_ISYS2401_DMA_C
-#include "isys_dma_public.h"
-#else  /* __INLINE_ISYS2401_DMA__ */
-#define STORAGE_CLASS_ISYS2401_DMA_H static inline
-#define STORAGE_CLASS_ISYS2401_DMA_C static inline
-#include "isys_dma_private.h"
-#endif /* __INLINE_ISYS2401_DMA__ */
-
-#endif /* __ISYS_DMA_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
index 5070e651f7c4..6407be9331ae 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
@@ -21,7 +21,8 @@
 /* CSI reveiver has 3 ports. */
 #define		N_CSI_PORTS (3)
 
-#include "isys_dma.h"		/*	isys2401_dma_channel,
+#include "system_local.h"
+#include "isys_dma_global.h"	/*	isys2401_dma_channel,
 				 *	isys2401_dma_cfg_t
 				 */
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index c88b14ce69a5..484c5967ad1c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -19,7 +19,7 @@
 #include "platform_support.h"
 
 #ifdef ISP2401
-#include "isys_dma.h"		/* isys2401_dma_set_max_burst_size() */
+#include "isys_dma_public.h"	/* isys2401_dma_set_max_burst_size() */
 #include "isys_irq.h"
 #endif
 
-- 
2.26.2

