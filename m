Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA58224A49
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 11:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgGRJ2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 05:28:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgGRJ22 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 05:28:28 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56DA422B4E;
        Sat, 18 Jul 2020 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595064507;
        bh=3uRg7pvFf8g1x96A1+t5IAXzYaG6T2fxriU8eQPHY2U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VTtnPkURNhW2O/5pk6XtV2mVH6obm4Cg95If4bpND51wY3cK0W1zUMoBpVkb+qfHh
         qOpIktVijHuJl0kJH9z20slGaj0oaR9XL1dRVjts0s3p+BaYrHBa/tJfnUeztZ3vTS
         Gxkw9dlyqDB24PXD1/HB6v0dk/Piiuux/I4mSQFc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1jwj8r-005wDa-Bi; Sat, 18 Jul 2020 11:28:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v2 4/4] media: atomisp: get rid of version-specific system_local.h
Date:   Sat, 18 Jul 2020 11:28:22 +0200
Message-Id: <1f8fd88ad2b4d22629f97d563a7951add7b323e3.1595062851.git.mchehab+huawei@kernel.org>
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

After removing the unused 32-bits data, the isp2401_system_local.h
now contains everything that it is needed, either by isp2401 or
by isp2400.

So, remove code duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/isp2400_system_local.h  | 149 -------------
 .../media/atomisp/pci/isp2401_system_local.h  | 196 -----------------
 .../staging/media/atomisp/pci/system_local.h  | 199 +++++++++++++++++-
 3 files changed, 194 insertions(+), 350 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2400_system_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2401_system_local.h

diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
deleted file mode 100644
index fb6355c7e1a3..000000000000
--- a/drivers/staging/media/atomisp/pci/isp2400_system_local.h
+++ /dev/null
@@ -1,149 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2010-2015, Intel Corporation.
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
-#ifndef __SYSTEM_LOCAL_H_INCLUDED__
-#define __SYSTEM_LOCAL_H_INCLUDED__
-
-#ifdef HRT_ISP_CSS_CUSTOM_HOST
-#ifndef HRT_USE_VIR_ADDRS
-#define HRT_USE_VIR_ADDRS
-#endif
-#endif
-
-#include "system_global.h"
-
-/*
- * Cell specific address maps
- */
-
-#define GP_FIFO_BASE   ((hrt_address)0x0000000000090104)		/* This is NOT a base address */
-
-/* ISP */
-static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
-	(hrt_address)0x0000000000020000ULL
-};
-
-static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
-	(hrt_address)0x0000000000200000ULL
-};
-
-static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
-	(hrt_address)0x0000000000100000ULL
-};
-
-/* SP */
-static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
-	(hrt_address)0x0000000000010000ULL
-};
-
-static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
-	(hrt_address)0x0000000000300000ULL
-};
-
-/* MMU */
-/*
- * MMU0_ID: The data MMU
- * MMU1_ID: The icache MMU
- */
-static const hrt_address MMU_BASE[N_MMU_ID] = {
-	(hrt_address)0x0000000000070000ULL,
-	(hrt_address)0x00000000000A0000ULL
-};
-
-/* DMA */
-static const hrt_address DMA_BASE[N_DMA_ID] = {
-	(hrt_address)0x0000000000040000ULL
-};
-
-/* IRQ */
-static const hrt_address IRQ_BASE[N_IRQ_ID] = {
-	(hrt_address)0x0000000000000500ULL,
-	(hrt_address)0x0000000000030A00ULL,
-	(hrt_address)0x000000000008C000ULL,
-	(hrt_address)0x0000000000090200ULL
-};
-
-/*
-	(hrt_address)0x0000000000000500ULL};
- */
-
-/* GDC */
-static const hrt_address GDC_BASE[N_GDC_ID] = {
-	(hrt_address)0x0000000000050000ULL,
-	(hrt_address)0x0000000000060000ULL
-};
-
-/* FIFO_MONITOR (not a subset of GP_DEVICE) */
-static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
-	(hrt_address)0x0000000000000000ULL
-};
-
-/*
-static const hrt_address GP_REGS_BASE[N_GP_REGS_ID] = {
-	(hrt_address)0x0000000000000000ULL};
-
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	(hrt_address)0x0000000000090000ULL};
-*/
-
-/* GP_DEVICE (single base for all separate GP_REG instances) */
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	(hrt_address)0x0000000000000000ULL
-};
-
-/*GP TIMER , all timer registers are inter-twined,
- * so, having multiple base addresses for
- * different timers does not help*/
-static const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
-/* GPIO */
-static const hrt_address GPIO_BASE[N_GPIO_ID] = {
-	(hrt_address)0x0000000000000400ULL
-};
-
-/* TIMED_CTRL */
-static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
-	(hrt_address)0x0000000000000100ULL
-};
-
-/* INPUT_FORMATTER */
-static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
-	(hrt_address)0x0000000000030000ULL,
-	(hrt_address)0x0000000000030200ULL,
-	(hrt_address)0x0000000000030400ULL,
-	(hrt_address)0x0000000000030600ULL
-}; /* memcpy() */
-
-/* INPUT_SYSTEM */
-static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
-	(hrt_address)0x0000000000080000ULL
-};
-
-/*	(hrt_address)0x0000000000081000ULL, */ /* capture A */
-/*	(hrt_address)0x0000000000082000ULL, */ /* capture B */
-/*	(hrt_address)0x0000000000083000ULL, */ /* capture C */
-/*	(hrt_address)0x0000000000084000ULL, */ /* Acquisition */
-/*	(hrt_address)0x0000000000085000ULL, */ /* DMA */
-/*	(hrt_address)0x0000000000089000ULL, */ /* ctrl */
-/*	(hrt_address)0x000000000008A000ULL, */ /* GP regs */
-/*	(hrt_address)0x000000000008B000ULL, */ /* FIFO */
-/*	(hrt_address)0x000000000008C000ULL, */ /* IRQ */
-
-/* RX, the MIPI lane control regs start at offset 0 */
-static const hrt_address RX_BASE[N_RX_ID] = {
-	(hrt_address)0x0000000000080100ULL
-};
-
-#endif /* __SYSTEM_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
deleted file mode 100644
index ae7dfd9ea0c4..000000000000
--- a/drivers/staging/media/atomisp/pci/isp2401_system_local.h
+++ /dev/null
@@ -1,196 +0,0 @@
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
-#ifndef __SYSTEM_LOCAL_H_INCLUDED__
-#define __SYSTEM_LOCAL_H_INCLUDED__
-
-#ifdef HRT_ISP_CSS_CUSTOM_HOST
-#ifndef HRT_USE_VIR_ADDRS
-#define HRT_USE_VIR_ADDRS
-#endif
-#endif
-
-#include "system_global.h"
-
-/*
- * Cell specific address maps
- */
-
-#define GP_FIFO_BASE   ((hrt_address)0x0000000000090104)		/* This is NOT a base address */
-
-/* ISP */
-static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
-	0x0000000000020000ULL
-};
-
-static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
-	0x0000000000200000ULL
-};
-
-static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
-	0x0000000000100000ULL
-};
-
-/* SP */
-static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
-	0x0000000000010000ULL
-};
-
-static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
-	0x0000000000300000ULL
-};
-
-/* MMU */
-/*
- * MMU0_ID: The data MMU
- * MMU1_ID: The icache MMU
- */
-static const hrt_address MMU_BASE[N_MMU_ID] = {
-	0x0000000000070000ULL,
-	0x00000000000A0000ULL
-};
-
-/* DMA */
-static const hrt_address DMA_BASE[N_DMA_ID] = {
-	0x0000000000040000ULL
-};
-
-static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
-	0x00000000000CA000ULL
-};
-
-/* IRQ */
-static const hrt_address IRQ_BASE[N_IRQ_ID] = {
-	0x0000000000000500ULL,
-	0x0000000000030A00ULL,
-	0x000000000008C000ULL,
-	0x0000000000090200ULL
-};
-
-/*
-	0x0000000000000500ULL};
- */
-
-/* GDC */
-static const hrt_address GDC_BASE[N_GDC_ID] = {
-	0x0000000000050000ULL,
-	0x0000000000060000ULL
-};
-
-/* FIFO_MONITOR (not a subset of GP_DEVICE) */
-static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
-	0x0000000000000000ULL
-};
-
-/*
-static const hrt_address GP_REGS_BASE[N_GP_REGS_ID] = {
-	0x0000000000000000ULL};
-
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	0x0000000000090000ULL};
-*/
-
-/* GP_DEVICE (single base for all separate GP_REG instances) */
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	0x0000000000000000ULL
-};
-
-/*GP TIMER , all timer registers are inter-twined,
- * so, having multiple base addresses for
- * different timers does not help*/
-static const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
-
-/* GPIO */
-static const hrt_address GPIO_BASE[N_GPIO_ID] = {
-	0x0000000000000400ULL
-};
-
-/* TIMED_CTRL */
-static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
-	0x0000000000000100ULL
-};
-
-/* INPUT_FORMATTER */
-static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
-	0x0000000000030000ULL,
-	0x0000000000030200ULL,
-	0x0000000000030400ULL,
-	0x0000000000030600ULL
-}; /* memcpy() */
-
-/* INPUT_SYSTEM */
-static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
-	0x0000000000080000ULL
-};
-
-/*	0x0000000000081000ULL, */ /* capture A */
-/*	0x0000000000082000ULL, */ /* capture B */
-/*	0x0000000000083000ULL, */ /* capture C */
-/*	0x0000000000084000ULL, */ /* Acquisition */
-/*	0x0000000000085000ULL, */ /* DMA */
-/*	0x0000000000089000ULL, */ /* ctrl */
-/*	0x000000000008A000ULL, */ /* GP regs */
-/*	0x000000000008B000ULL, */ /* FIFO */
-/*	0x000000000008C000ULL, */ /* IRQ */
-
-/* RX, the MIPI lane control regs start at offset 0 */
-static const hrt_address RX_BASE[N_RX_ID] = {
-	0x0000000000080100ULL
-};
-
-/* IBUF_CTRL, part of the Input System 2401 */
-static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
-	0x00000000000C1800ULL,	/* ibuf controller A */
-	0x00000000000C3800ULL,	/* ibuf controller B */
-	0x00000000000C5800ULL	/* ibuf controller C */
-};
-
-/* ISYS IRQ Controllers, part of the Input System 2401 */
-static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
-	0x00000000000C1400ULL,	/* port a */
-	0x00000000000C3400ULL,	/* port b */
-	0x00000000000C5400ULL	/* port c */
-};
-
-/* CSI FE, part of the Input System 2401 */
-static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
-	0x00000000000C0400ULL,	/* csi fe controller A */
-	0x00000000000C2400ULL,	/* csi fe controller B */
-	0x00000000000C4400ULL	/* csi fe controller C */
-};
-
-/* CSI BE, part of the Input System 2401 */
-static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
-	0x00000000000C0800ULL,	/* csi be controller A */
-	0x00000000000C2800ULL,	/* csi be controller B */
-	0x00000000000C4800ULL	/* csi be controller C */
-};
-
-/* PIXEL Generator, part of the Input System 2401 */
-static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
-	0x00000000000C1000ULL,	/* pixel gen controller A */
-	0x00000000000C3000ULL,	/* pixel gen controller B */
-	0x00000000000C5000ULL	/* pixel gen controller C */
-};
-
-/* Stream2MMIO, part of the Input System 2401 */
-static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
-	0x00000000000C0C00ULL,	/* stream2mmio controller A */
-	0x00000000000C2C00ULL,	/* stream2mmio controller B */
-	0x00000000000C4C00ULL	/* stream2mmio controller C */
-};
-
-#endif /* __SYSTEM_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers/staging/media/atomisp/pci/system_local.h
index 7ad9cee6d550..d60591e04b61 100644
--- a/drivers/staging/media/atomisp/pci/system_local.h
+++ b/drivers/staging/media/atomisp/pci/system_local.h
@@ -1,10 +1,199 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+ * Support for Intel Camera Imaging ISP subsystem.
+ * Copyright (c) 2015, Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
  */
 
-#ifdef ISP2401
-#  include "isp2401_system_local.h"
-#else
-#  include "isp2400_system_local.h"
+#ifndef __SYSTEM_LOCAL_H_INCLUDED__
+#define __SYSTEM_LOCAL_H_INCLUDED__
+
+#ifdef HRT_ISP_CSS_CUSTOM_HOST
+#ifndef HRT_USE_VIR_ADDRS
+#define HRT_USE_VIR_ADDRS
+#endif
 #endif
+
+#include "system_global.h"
+
+/* This interface is deprecated */
+#include "hive_types.h"
+
+/*
+ * Cell specific address maps
+ */
+
+#define GP_FIFO_BASE   ((hrt_address)0x0000000000090104)		/* This is NOT a base address */
+
+/* ISP */
+static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
+	0x0000000000020000ULL
+};
+
+static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
+	0x0000000000200000ULL
+};
+
+static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
+	0x0000000000100000ULL
+};
+
+/* SP */
+static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
+	0x0000000000010000ULL
+};
+
+static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
+	0x0000000000300000ULL
+};
+
+/* MMU */
+/*
+ * MMU0_ID: The data MMU
+ * MMU1_ID: The icache MMU
+ */
+static const hrt_address MMU_BASE[N_MMU_ID] = {
+	0x0000000000070000ULL,
+	0x00000000000A0000ULL
+};
+
+/* DMA */
+static const hrt_address DMA_BASE[N_DMA_ID] = {
+	0x0000000000040000ULL
+};
+
+static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
+	0x00000000000CA000ULL
+};
+
+/* IRQ */
+static const hrt_address IRQ_BASE[N_IRQ_ID] = {
+	0x0000000000000500ULL,
+	0x0000000000030A00ULL,
+	0x000000000008C000ULL,
+	0x0000000000090200ULL
+};
+
+/*
+	0x0000000000000500ULL};
+ */
+
+/* GDC */
+static const hrt_address GDC_BASE[N_GDC_ID] = {
+	0x0000000000050000ULL,
+	0x0000000000060000ULL
+};
+
+/* FIFO_MONITOR (not a subset of GP_DEVICE) */
+static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
+	0x0000000000000000ULL
+};
+
+/*
+static const hrt_address GP_REGS_BASE[N_GP_REGS_ID] = {
+	0x0000000000000000ULL};
+
+static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
+	0x0000000000090000ULL};
+*/
+
+/* GP_DEVICE (single base for all separate GP_REG instances) */
+static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
+	0x0000000000000000ULL
+};
+
+/*GP TIMER , all timer registers are inter-twined,
+ * so, having multiple base addresses for
+ * different timers does not help*/
+static const hrt_address GP_TIMER_BASE =
+    (hrt_address)0x0000000000000600ULL;
+
+/* GPIO */
+static const hrt_address GPIO_BASE[N_GPIO_ID] = {
+	0x0000000000000400ULL
+};
+
+/* TIMED_CTRL */
+static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
+	0x0000000000000100ULL
+};
+
+/* INPUT_FORMATTER */
+static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
+	0x0000000000030000ULL,
+	0x0000000000030200ULL,
+	0x0000000000030400ULL,
+	0x0000000000030600ULL
+}; /* memcpy() */
+
+/* INPUT_SYSTEM */
+static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
+	0x0000000000080000ULL
+};
+
+/*	0x0000000000081000ULL, */ /* capture A */
+/*	0x0000000000082000ULL, */ /* capture B */
+/*	0x0000000000083000ULL, */ /* capture C */
+/*	0x0000000000084000ULL, */ /* Acquisition */
+/*	0x0000000000085000ULL, */ /* DMA */
+/*	0x0000000000089000ULL, */ /* ctrl */
+/*	0x000000000008A000ULL, */ /* GP regs */
+/*	0x000000000008B000ULL, */ /* FIFO */
+/*	0x000000000008C000ULL, */ /* IRQ */
+
+/* RX, the MIPI lane control regs start at offset 0 */
+static const hrt_address RX_BASE[N_RX_ID] = {
+	0x0000000000080100ULL
+};
+
+/* IBUF_CTRL, part of the Input System 2401 */
+static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
+	0x00000000000C1800ULL,	/* ibuf controller A */
+	0x00000000000C3800ULL,	/* ibuf controller B */
+	0x00000000000C5800ULL	/* ibuf controller C */
+};
+
+/* ISYS IRQ Controllers, part of the Input System 2401 */
+static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
+	0x00000000000C1400ULL,	/* port a */
+	0x00000000000C3400ULL,	/* port b */
+	0x00000000000C5400ULL	/* port c */
+};
+
+/* CSI FE, part of the Input System 2401 */
+static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
+	0x00000000000C0400ULL,	/* csi fe controller A */
+	0x00000000000C2400ULL,	/* csi fe controller B */
+	0x00000000000C4400ULL	/* csi fe controller C */
+};
+
+/* CSI BE, part of the Input System 2401 */
+static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
+	0x00000000000C0800ULL,	/* csi be controller A */
+	0x00000000000C2800ULL,	/* csi be controller B */
+	0x00000000000C4800ULL	/* csi be controller C */
+};
+
+/* PIXEL Generator, part of the Input System 2401 */
+static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
+	0x00000000000C1000ULL,	/* pixel gen controller A */
+	0x00000000000C3000ULL,	/* pixel gen controller B */
+	0x00000000000C5000ULL	/* pixel gen controller C */
+};
+
+/* Stream2MMIO, part of the Input System 2401 */
+static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
+	0x00000000000C0C00ULL,	/* stream2mmio controller A */
+	0x00000000000C2C00ULL,	/* stream2mmio controller B */
+	0x00000000000C4C00ULL	/* stream2mmio controller C */
+};
+
+#endif /* __SYSTEM_LOCAL_H_INCLUDED__ */
-- 
2.26.2

