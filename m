Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED72A224A4B
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 11:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGRJ2c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 05:28:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:43104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbgGRJ22 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 05:28:28 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5607122B4B;
        Sat, 18 Jul 2020 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595064507;
        bh=BS0rLaTKgIYv7YZTAi5CbvFOwVpWyr5E6Tx5aa710Xw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ccZBIjNJZZYqxn3x1XpOhRg1QwzmrQIgA1rttyPMHRFUGnNiLWiLAXWFrS8SJcQdc
         fzI+SZ2xOVUgu+otlmDKgEwA3qQYM+mKIRTatl6qoN67mvc1RruEcSbAZ76eGYqSS5
         16GXoEktqtcYHtb5i0rQjOnxKiioCsE/cAGQzvhU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1jwj8r-005wDU-8h; Sat, 18 Jul 2020 11:28:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] media: atomisp: remove non-used 32-bits consts at system_local
Date:   Sat, 18 Jul 2020 11:28:20 +0200
Message-Id: <d26a137b11b34503cd1d56abf3b66a2728aec652.1595062851.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <22a1ad531d3b2030fe0b0ffae9d883b0d5cc0406.1595062851.git.mchehab+huawei@kernel.org>
References: <22a1ad531d3b2030fe0b0ffae9d883b0d5cc0406.1595062851.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is an abstraction at the code in order to support
32 or 64 bits address/data length. However, for all
Atom chipsets supported by this version, the size is fixed.

So, cleanup the mess, removing the uused code and placing
the data sizes on a single place.

The end goal is to completely remove those local/global
headers, replacing them by some ISP-version dependent struct,
in order for the driver to decide what version it would need
in runtime.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/hive_types.h    |  24 +--
 .../media/atomisp/pci/isp2400_system_global.h |   2 -
 .../media/atomisp/pci/isp2400_system_local.h  | 131 -------------
 .../media/atomisp/pci/isp2401_system_global.h |   4 -
 .../media/atomisp/pci/isp2401_system_local.h  | 173 ------------------
 5 files changed, 3 insertions(+), 331 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_types.h b/drivers/staging/media/atomisp/pci/hive_types.h
index addda9b81d7b..4b8a679fb672 100644
--- a/drivers/staging/media/atomisp/pci/hive_types.h
+++ b/drivers/staging/media/atomisp/pci/hive_types.h
@@ -52,32 +52,14 @@ typedef unsigned short       hive_uint16;
 typedef unsigned int         hive_uint32;
 typedef unsigned long long   hive_uint64;
 
-/* by default assume 32 bit master port (both data and address) */
-#ifndef HRT_DATA_WIDTH
-#define HRT_DATA_WIDTH 32
-#endif
-#ifndef HRT_ADDRESS_WIDTH
-#define HRT_ADDRESS_WIDTH 32
-#endif
-
+#define HRT_DATA_WIDTH	  32
+#define HRT_ADDRESS_WIDTH 64
 #define HRT_DATA_BYTES    (HRT_DATA_WIDTH / 8)
 #define HRT_ADDRESS_BYTES (HRT_ADDRESS_WIDTH / 8)
+#define SIZEOF_HRT_REG    (HRT_DATA_WIDTH >> 3)
 
-#if HRT_DATA_WIDTH == 64
-typedef hive_uint64 hrt_data;
-#elif HRT_DATA_WIDTH == 32
 typedef hive_uint32 hrt_data;
-#else
-#error data width not supported
-#endif
-
-#if HRT_ADDRESS_WIDTH == 64
 typedef hive_uint64 hrt_address;
-#elif HRT_ADDRESS_WIDTH == 32
-typedef hive_uint32 hrt_address;
-#else
-#error adddres width not supported
-#endif
 
 /* use 64 bit addresses in simulation, where possible */
 typedef hive_uint64  hive_sim_address;
diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_system_global.h
index d87ddf1d2fe9..3888793a31e2 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_system_global.h
@@ -75,8 +75,6 @@
  * Semi global. "HRT" is accessible from SP, but the HRT types do not fully apply
  */
 #define HRT_VADDRESS_WIDTH	32
-//#define HRT_ADDRESS_WIDTH	64		/* Surprise, this is a local property*/
-#define HRT_DATA_WIDTH		32
 
 #define SIZEOF_HRT_REG		(HRT_DATA_WIDTH >> 3)
 #define HIVE_ISP_CTRL_DATA_BYTES (HIVE_ISP_CTRL_DATA_WIDTH / 8)
diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
index f889b7bf8f2d..3c7dc180ffe6 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
@@ -24,17 +24,12 @@
 
 #include "system_global.h"
 
-/* HRT assumes 32 by default (see Linux/include/hive_types.h), overrule it in case it is different */
-#undef HRT_ADDRESS_WIDTH
-#define HRT_ADDRESS_WIDTH	64		/* Surprise, this is a local property */
-
 /* This interface is deprecated */
 #include "hive_types.h"
 
 /*
  * Cell specific address maps
  */
-#if HRT_ADDRESS_WIDTH == 64
 
 #define GP_FIFO_BASE   ((hrt_address)0x0000000000090104)		/* This is NOT a base address */
 
@@ -154,130 +149,4 @@ static const hrt_address RX_BASE[N_RX_ID] = {
 	(hrt_address)0x0000000000080100ULL
 };
 
-#elif HRT_ADDRESS_WIDTH == 32
-
-#define GP_FIFO_BASE   ((hrt_address)0x00090104)		/* This is NOT a base address */
-
-/* ISP */
-static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
-	(hrt_address)0x00020000UL
-};
-
-static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
-	(hrt_address)0x00200000UL
-};
-
-static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
-	(hrt_address)0x100000UL
-};
-
-/* SP */
-static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
-	(hrt_address)0x00010000UL
-};
-
-static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
-	(hrt_address)0x00300000UL
-};
-
-/* MMU */
-/*
- * MMU0_ID: The data MMU
- * MMU1_ID: The icache MMU
- */
-static const hrt_address MMU_BASE[N_MMU_ID] = {
-	(hrt_address)0x00070000UL,
-	(hrt_address)0x000A0000UL
-};
-
-/* DMA */
-static const hrt_address DMA_BASE[N_DMA_ID] = {
-	(hrt_address)0x00040000UL
-};
-
-/* IRQ */
-static const hrt_address IRQ_BASE[N_IRQ_ID] = {
-	(hrt_address)0x00000500UL,
-	(hrt_address)0x00030A00UL,
-	(hrt_address)0x0008C000UL,
-	(hrt_address)0x00090200UL
-};
-
-/*
-	(hrt_address)0x00000500UL};
- */
-
-/* GDC */
-static const hrt_address GDC_BASE[N_GDC_ID] = {
-	(hrt_address)0x00050000UL,
-	(hrt_address)0x00060000UL
-};
-
-/* FIFO_MONITOR (not a subset of GP_DEVICE) */
-static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
-	(hrt_address)0x00000000UL
-};
-
-/*
-static const hrt_address GP_REGS_BASE[N_GP_REGS_ID] = {
-	(hrt_address)0x00000000UL};
-
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	(hrt_address)0x00090000UL};
-*/
-
-/* GP_DEVICE (single base for all separate GP_REG instances) */
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	(hrt_address)0x00000000UL
-};
-
-/*GP TIMER , all timer registers are inter-twined,
- * so, having multiple base addresses for
- * different timers does not help*/
-static const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x00000600UL;
-
-/* GPIO */
-static const hrt_address GPIO_BASE[N_GPIO_ID] = {
-	(hrt_address)0x00000400UL
-};
-
-/* TIMED_CTRL */
-static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
-	(hrt_address)0x00000100UL
-};
-
-/* INPUT_FORMATTER */
-static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
-	(hrt_address)0x00030000UL,
-	(hrt_address)0x00030200UL,
-	(hrt_address)0x00030400UL
-};
-
-/*	(hrt_address)0x00030600UL, */ /* memcpy() */
-
-/* INPUT_SYSTEM */
-static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
-	(hrt_address)0x00080000UL
-};
-
-/*	(hrt_address)0x00081000UL, */ /* capture A */
-/*	(hrt_address)0x00082000UL, */ /* capture B */
-/*	(hrt_address)0x00083000UL, */ /* capture C */
-/*	(hrt_address)0x00084000UL, */ /* Acquisition */
-/*	(hrt_address)0x00085000UL, */ /* DMA */
-/*	(hrt_address)0x00089000UL, */ /* ctrl */
-/*	(hrt_address)0x0008A000UL, */ /* GP regs */
-/*	(hrt_address)0x0008B000UL, */ /* FIFO */
-/*	(hrt_address)0x0008C000UL, */ /* IRQ */
-
-/* RX, the MIPI lane control regs start at offset 0 */
-static const hrt_address RX_BASE[N_RX_ID] = {
-	(hrt_address)0x00080100UL
-};
-
-#else
-#error "system_local.h: HRT_ADDRESS_WIDTH must be one of {32,64}"
-#endif
-
 #endif /* __SYSTEM_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_system_global.h
index 8bb2a956f983..b4a6976d7eab 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_system_global.h
@@ -85,11 +85,7 @@
  * the HRT types do not fully apply
  */
 #define HRT_VADDRESS_WIDTH	32
-/* Surprise, this is a local property*/
-/*#define HRT_ADDRESS_WIDTH	64 */
-#define HRT_DATA_WIDTH		32
 
-#define SIZEOF_HRT_REG		(HRT_DATA_WIDTH >> 3)
 #define HIVE_ISP_CTRL_DATA_BYTES (HIVE_ISP_CTRL_DATA_WIDTH / 8)
 
 /* The main bus connecting all devices */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
index 1bb01e627cd7..d60591e04b61 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
@@ -24,15 +24,12 @@
 
 #include "system_global.h"
 
-#define HRT_ADDRESS_WIDTH	64		/* Surprise, this is a local property */
-
 /* This interface is deprecated */
 #include "hive_types.h"
 
 /*
  * Cell specific address maps
  */
-#if HRT_ADDRESS_WIDTH == 64
 
 #define GP_FIFO_BASE   ((hrt_address)0x0000000000090104)		/* This is NOT a base address */
 
@@ -198,175 +195,5 @@ static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
 	0x00000000000C2C00ULL,	/* stream2mmio controller B */
 	0x00000000000C4C00ULL	/* stream2mmio controller C */
 };
-#elif HRT_ADDRESS_WIDTH == 32
-
-#define GP_FIFO_BASE   ((hrt_address)0x00090104)		/* This is NOT a base address */
-
-/* ISP */
-static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
-	0x00020000UL
-};
-
-static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
-	0xffffffffUL
-};
-
-static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
-	0xffffffffUL
-};
-
-/* SP */
-static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
-	0x00010000UL
-};
-
-static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
-	0x00300000UL
-};
-
-/* MMU */
-/*
- * MMU0_ID: The data MMU
- * MMU1_ID: The icache MMU
- */
-static const hrt_address MMU_BASE[N_MMU_ID] = {
-	0x00070000UL,
-	0x000A0000UL
-};
-
-/* DMA */
-static const hrt_address DMA_BASE[N_DMA_ID] = {
-	0x00040000UL
-};
-
-static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
-	0x000CA000UL
-};
-
-/* IRQ */
-static const hrt_address IRQ_BASE[N_IRQ_ID] = {
-	0x00000500UL,
-	0x00030A00UL,
-	0x0008C000UL,
-	0x00090200UL
-};
-
-/*
-	0x00000500UL};
- */
-
-/* GDC */
-static const hrt_address GDC_BASE[N_GDC_ID] = {
-	0x00050000UL,
-	0x00060000UL
-};
-
-/* FIFO_MONITOR (not a subset of GP_DEVICE) */
-static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
-	0x00000000UL
-};
-
-/*
-static const hrt_address GP_REGS_BASE[N_GP_REGS_ID] = {
-	0x00000000UL};
-
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	0x00090000UL};
-*/
-
-/* GP_DEVICE (single base for all separate GP_REG instances) */
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	0x00000000UL
-};
-
-/*GP TIMER , all timer registers are inter-twined,
- * so, having multiple base addresses for
- * different timers does not help*/
-static const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x00000600UL;
-/* GPIO */
-static const hrt_address GPIO_BASE[N_GPIO_ID] = {
-	0x00000400UL
-};
-
-/* TIMED_CTRL */
-static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
-	0x00000100UL
-};
-
-/* INPUT_FORMATTER */
-static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
-	0x00030000UL,
-	0x00030200UL,
-	0x00030400UL
-};
-
-/*	0x00030600UL, */ /* memcpy() */
-
-/* INPUT_SYSTEM */
-static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
-	0x00080000UL
-};
-
-/*	0x00081000UL, */ /* capture A */
-/*	0x00082000UL, */ /* capture B */
-/*	0x00083000UL, */ /* capture C */
-/*	0x00084000UL, */ /* Acquisition */
-/*	0x00085000UL, */ /* DMA */
-/*	0x00089000UL, */ /* ctrl */
-/*	0x0008A000UL, */ /* GP regs */
-/*	0x0008B000UL, */ /* FIFO */
-/*	0x0008C000UL, */ /* IRQ */
-
-/* RX, the MIPI lane control regs start at offset 0 */
-static const hrt_address RX_BASE[N_RX_ID] = {
-	0x00080100UL
-};
-
-/* IBUF_CTRL, part of the Input System 2401 */
-static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
-	0x000C1800UL,	/* ibuf controller A */
-	0x000C3800UL,	/* ibuf controller B */
-	0x000C5800UL	/* ibuf controller C */
-};
-
-/* ISYS IRQ Controllers, part of the Input System 2401 */
-static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
-	0x000C1400ULL,	/* port a */
-	0x000C3400ULL,	/* port b */
-	0x000C5400ULL	/* port c */
-};
-
-/* CSI FE, part of the Input System 2401 */
-static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
-	0x000C0400UL,	/* csi fe controller A */
-	0x000C2400UL,	/* csi fe controller B */
-	0x000C4400UL	/* csi fe controller C */
-};
-
-/* CSI BE, part of the Input System 2401 */
-static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
-	0x000C0800UL,	/* csi be controller A */
-	0x000C2800UL,	/* csi be controller B */
-	0x000C4800UL	/* csi be controller C */
-};
-
-/* PIXEL Generator, part of the Input System 2401 */
-static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
-	0x000C1000UL,	/* pixel gen controller A */
-	0x000C3000UL,	/* pixel gen controller B */
-	0x000C5000UL	/* pixel gen controller C */
-};
-
-/* Stream2MMIO, part of the Input System 2401 */
-static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
-	0x000C0C00UL,	/* stream2mmio controller A */
-	0x000C2C00UL,	/* stream2mmio controller B */
-	0x000C4C00UL	/* stream2mmio controller C */
-};
-
-#else
-#error "system_local.h: HRT_ADDRESS_WIDTH must be one of {32,64}"
-#endif
 
 #endif /* __SYSTEM_LOCAL_H_INCLUDED__ */
-- 
2.26.2

