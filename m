Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3900C25B0EA
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgIBQMe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:12:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:54076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728365AbgIBQLF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:11:05 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B96521D91;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063047;
        bh=EUf66YRYnbmCpIfd4wNfcVXQuvF5yJvPYose5VlYl/Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=davYzh1c5pIVnDS3mrHDJeAQFVKX6BFjlS+aBWng72nmzG9CI4sk/Szbb1HpEu0rB
         zTyyQ5CLSSTCH3qHFvEEO3Xjfkrey/EWIY9ZkRcSrBAlaLoyshhk7RA7HdKestsmE1
         6lqbfhgPSfZwmbOtvnMyN/kOxGH2R71yN78nXJ50=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAy-Eq; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 27/38] media: atomisp: get rid of version-dependent globals
Date:   Wed,  2 Sep 2020 18:10:30 +0200
Message-Id: <301c1ad689d4694e2858465ed055eee1b1a139e2.1599062230.git.mchehab+huawei@kernel.org>
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

Replace all occurrences along the atomisp tree for the conditional
compilation macros found at system_global.h, replacing them by
tests wheather ISP2401 is defined or not.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/css_2401_system/host/isys_irq_local.h |   4 +-
 .../css_2401_system/host/isys_irq_private.h   |   4 +-
 .../pci/css_2401_system/isys_irq_global.h     |   4 +-
 .../host/input_formatter.c                    |   2 +-
 .../hive_isp_css_common/host/input_system.c   |   2 +-
 .../hive_isp_css_include/host/csi_rx_public.h |   4 +-
 .../host/ibuf_ctrl_public.h                   |   4 +-
 .../host/isys_dma_public.h                    |   4 +-
 .../host/isys_irq_public.h                    |   4 +-
 .../hive_isp_css_include/host/isys_public.h   |   4 +-
 .../host/pixelgen_public.h                    |   4 +-
 .../pci/hive_isp_css_include/isys_irq.h       |   4 +-
 .../staging/media/atomisp/pci/ia_css_stream.h |   4 +-
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |   4 +-
 .../atomisp/pci/isp2400_input_system_public.h |   4 +-
 .../media/atomisp/pci/isp2400_system_global.h |  16 -
 .../media/atomisp/pci/isp2401_system_global.h |  19 -
 .../atomisp/pci/runtime/binary/src/binary.c   |   2 +-
 .../runtime/bufq/interface/ia_css_bufq_comm.h |   6 -
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |   2 +-
 .../pci/runtime/isys/interface/ia_css_isys.h  |  12 +-
 .../runtime/isys/interface/ia_css_isys_comm.h |   4 +-
 .../pci/runtime/isys/src/csi_rx_rmgr.c        |   2 +-
 .../pci/runtime/isys/src/isys_dma_rmgr.c      |   2 +-
 .../atomisp/pci/runtime/isys/src/isys_init.c  |  10 +-
 .../runtime/isys/src/isys_stream2mmio_rmgr.c  |   2 +-
 .../media/atomisp/pci/runtime/isys/src/rx.c   |  12 +-
 .../pci/runtime/isys/src/virtual_isys.c       |   2 +-
 .../pipeline/interface/ia_css_pipeline.h      |   2 +-
 .../pci/runtime/pipeline/src/pipeline.c       |   2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 158 +++---
 .../staging/media/atomisp/pci/sh_css_defs.h   |   4 -
 .../media/atomisp/pci/sh_css_internal.h       |  36 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |  34 +-
 .../media/atomisp/pci/sh_css_param_shading.c  |   2 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 533 ------------------
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  24 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h |   6 +-
 .../staging/media/atomisp/pci/sh_css_struct.h |   2 -
 .../staging/media/atomisp/pci/system_global.h |  23 -
 40 files changed, 155 insertions(+), 818 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2400_system_global.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2401_system_global.h

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
index e3d6d5e1634e..a76987190292 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
@@ -18,7 +18,7 @@
 
 #include <type_support.h>
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 
 typedef struct isys_irqc_state_s isys_irqc_state_t;
 
@@ -31,6 +31,6 @@ struct isys_irqc_state_s {
 	/*hrt_data clear;	*/	/* write-only register */
 };
 
-#endif /* defined(USE_INPUT_SYSTEM_VERSION_2401) */
+#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_LOCAL_H__ */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
index 91ef000d76dc..1e96f0267ac0 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
@@ -19,7 +19,7 @@
 #include "isys_irq_global.h"
 #include "isys_irq_local.h"
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 
 /* -------------------------------------------------------+
  |             Native command interface (NCI)             |
@@ -102,6 +102,6 @@ STORAGE_CLASS_ISYS2401_IRQ_C hrt_data isys_irqc_reg_load(
 
 /* end of DLI */
 
-#endif /* defined(USE_INPUT_SYSTEM_VERSION_2401) */
+#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_PRIVATE_H__ */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
index 156b4c95277e..a81e4d13ac9f 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
@@ -16,7 +16,7 @@
 #ifndef __ISYS_IRQ_GLOBAL_H__
 #define __ISYS_IRQ_GLOBAL_H__
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 
 /* Register offset/index from base location */
 #define ISYS_IRQ_EDGE_REG_IDX		(0)
@@ -31,6 +31,6 @@
 #define ISYS_IRQ_CLEAR_REG_VALUE	(0xFFFF)
 #define ISYS_IRQ_ENABLE_REG_VALUE	(0xFFFF)
 
-#endif /* defined(USE_INPUT_SYSTEM_VERSION_2401) */
+#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_GLOBAL_H__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index bec9c7238a78..1b196cd265b9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -15,7 +15,7 @@
 
 #include "system_global.h"
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2
+#ifndef ISP2401
 
 #include "input_formatter.h"
 #include <type_support.h>
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index fc000af042dc..4f3d75fac3e3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -15,7 +15,7 @@
 
 #include "system_global.h"
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2
+#ifndef ISP2401
 
 #include "input_system.h"
 #include <type_support.h>
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
index e6f695691407..3d6621f2fa96 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
@@ -16,7 +16,7 @@
 #ifndef __CSI_RX_PUBLIC_H_INCLUDED__
 #define __CSI_RX_PUBLIC_H_INCLUDED__
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 /*****************************************************
  *
  * Native command interface (NCI).
@@ -132,5 +132,5 @@ void csi_rx_be_ctrl_reg_store(
     const hrt_address reg,
     const hrt_data value);
 /* end of DLI */
-#endif /* USE_INPUT_SYSTEM_VERSION_2401 */
+#endif /* ISP2401 */
 #endif /* __CSI_RX_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/ibuf_ctrl_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/ibuf_ctrl_public.h
index 053803d2cae3..54982b15d9a9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/ibuf_ctrl_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/ibuf_ctrl_public.h
@@ -16,7 +16,7 @@
 #ifndef __IBUF_CTRL_PUBLIC_H_INCLUDED__
 #define __IBUF_CTRL_PUBLIC_H_INCLUDED__
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 /*****************************************************
  *
  * Native command interface (NCI).
@@ -90,5 +90,5 @@ STORAGE_CLASS_IBUF_CTRL_H void ibuf_ctrl_reg_store(
     const hrt_data value);
 /* end of DLI */
 
-#endif /* USE_INPUT_SYSTEM_VERSION_2401 */
+#endif /* ISP2401 */
 #endif /* __IBUF_CTRL_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
index 23a158b81b13..88ac78f69e7b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
@@ -16,7 +16,7 @@
 #ifndef __ISYS_DMA_PUBLIC_H_INCLUDED__
 #define __ISYS_DMA_PUBLIC_H_INCLUDED__
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 
 #include "system_local.h"
 #include "type_support.h"
@@ -34,6 +34,6 @@ void isys2401_dma_set_max_burst_size(
     const isys2401_dma_ID_t dma_id,
     uint32_t		max_burst_size);
 
-#endif /* USE_INPUT_SYSTEM_VERSION_2401 */
+#endif /* ISP2401 */
 
 #endif /* __ISYS_DMA_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
index b9befdd2508e..cd738f4b65a0 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
@@ -19,7 +19,7 @@
 #include "isys_irq_global.h"
 #include "isys_irq_local.h"
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 
 STORAGE_CLASS_ISYS2401_IRQ_H void isys_irqc_state_get(
     const isys_irq_ID_t	isys_irqc_id,
@@ -41,6 +41,6 @@ STORAGE_CLASS_ISYS2401_IRQ_H hrt_data isys_irqc_reg_load(
 STORAGE_CLASS_ISYS2401_IRQ_H void isys_irqc_status_enable(
     const isys_irq_ID_t	isys_irqc_id);
 
-#endif /* defined(USE_INPUT_SYSTEM_VERSION_2401) */
+#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_PUBLIC_H__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
index 509f75fe025c..dac53e324118 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
@@ -16,7 +16,7 @@
 #ifndef __ISYS_PUBLIC_H_INCLUDED__
 #define __ISYS_PUBLIC_H_INCLUDED__
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 /*! Read the state of INPUT_SYSTEM[ID]
  \param ID[in]		INPUT_SYSTEM identifier
  \param state[out]	pointer to input system state structure
@@ -34,5 +34,5 @@ STORAGE_CLASS_INPUT_SYSTEM_H input_system_err_t input_system_get_state(
 STORAGE_CLASS_INPUT_SYSTEM_H void input_system_dump_state(
     const input_system_ID_t	ID,
     input_system_state_t *state);
-#endif /* USE_INPUT_SYSTEM_VERSION_2401 */
+#endif /* ISP2401 */
 #endif /* __ISYS_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
index ded4dce06d09..40a9fb6d7761 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
@@ -16,7 +16,7 @@
 #ifndef __PIXELGEN_PUBLIC_H_INCLUDED__
 #define __PIXELGEN_PUBLIC_H_INCLUDED__
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 /*****************************************************
  *
  * Native command interface (NCI).
@@ -76,5 +76,5 @@ STORAGE_CLASS_PIXELGEN_H void pixelgen_ctrl_reg_store(
     const hrt_data value);
 /* end of DLI */
 
-#endif /* USE_INPUT_SYSTEM_VERSION_2401 */
+#endif /* ISP2401 */
 #endif /* __PIXELGEN_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
index d854124f4f97..06bc9e1450ec 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
@@ -19,7 +19,7 @@
 #include <type_support.h>
 #include <system_local.h>
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 
 #ifndef __INLINE_ISYS2401_IRQ__
 
@@ -35,6 +35,6 @@
 
 #endif /* __INLINE_ISYS2401_IRQ__ */
 
-#endif /* defined(USE_INPUT_SYSTEM_VERSION_2401) */
+#endif /* defined(ISP2401) */
 
 #endif	/* __IA_CSS_ISYS_IRQ_H__ */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream.h b/drivers/staging/media/atomisp/pci/ia_css_stream.h
index 4dffc6d7c8d8..70b0378748f1 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream.h
@@ -18,7 +18,7 @@
 
 #include <type_support.h>
 #include <system_local.h>
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 #include <input_system.h>
 #endif
 #include "ia_css_types.h"
@@ -30,7 +30,7 @@
 struct ia_css_stream {
 	struct ia_css_stream_config    config;
 	struct ia_css_stream_info      info;
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 	rx_cfg_t                       csi_rx_config;
 #endif
 	bool                           reconfigure_css_rx;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index 1c6f6792d57b..c505c94a7241 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -81,7 +81,7 @@ ia_css_raw_config(
 	const struct ia_css_frame_info *internal_info = from->internal_info;
 
 	(void)size;
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 	/* 2401 input system uses input width width */
 	in_info = internal_info;
 #else
@@ -105,7 +105,7 @@ ia_css_raw_config(
 	to->two_ppc             = from->two_ppc;
 	to->stream_format       = css2isp_stream_format(from->stream_format);
 	to->deinterleaved       = from->deinterleaved;
-#if (defined(USE_INPUT_SYSTEM_VERSION_2401) || defined(CONFIG_CSI2_PLUS))
+#if defined(ISP2401)
 	to->start_column        = in_info->crop_info.start_column;
 	to->start_line          = in_info->crop_info.start_line;
 	to->enable_left_padding = from->enable_left_padding;
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 689e451f1ce2..c6e5b17b3c40 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -17,7 +17,7 @@
 #define __INPUT_SYSTEM_PUBLIC_H_INCLUDED__
 
 #include <type_support.h>
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 #include "isys_public.h"
 #else
 
@@ -365,6 +365,6 @@ input_system_error_t	input_system_gpfifo_channel_cfg(
     u32		nof_frames,
     target_cfg2400_t	target
 );
-#endif /* #ifdef USE_INPUT_SYSTEM_VERSION_2401 */
+#endif /* #ifdef ISP2401 */
 
 #endif /* __INPUT_SYSTEM_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_system_global.h
deleted file mode 100644
index 74fff465e8e8..000000000000
--- a/drivers/staging/media/atomisp/pci/isp2400_system_global.h
+++ /dev/null
@@ -1,16 +0,0 @@
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
-#define USE_INPUT_SYSTEM_VERSION_2
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_system_global.h
deleted file mode 100644
index 27cd2535bab8..000000000000
--- a/drivers/staging/media/atomisp/pci/isp2401_system_global.h
+++ /dev/null
@@ -1,19 +0,0 @@
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
-#define HAS_NO_INPUT_FORMATTER
-#define USE_INPUT_SYSTEM_VERSION_2401
-#define HAS_INPUT_SYSTEM_VERSION_2401
-#define CSI2P_DISABLE_ISYS2401_ONLINE_MODE
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 9813014c3fd3..a77c2072db13 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1045,7 +1045,7 @@ binary_in_frame_padded_width(int in_frame_width,
 	int rval;
 	int nr_of_left_paddings;	/* number of paddings pixels on the left of an image line */
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	/* the output image line of Input System 2401 does not have the left paddings  */
 	nr_of_left_paddings = 0;
 #else
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
index 35f4528b724f..567d94d91e3c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
@@ -27,15 +27,9 @@ enum sh_css_queue_id {
 	SH_CSS_QUEUE_E_ID,
 	SH_CSS_QUEUE_F_ID,
 	SH_CSS_QUEUE_G_ID,
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	SH_CSS_QUEUE_H_ID, /* for metadata */
-#endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 #define SH_CSS_MAX_NUM_QUEUES (SH_CSS_QUEUE_H_ID + 1)
-#else
-#define SH_CSS_MAX_NUM_QUEUES (SH_CSS_QUEUE_G_ID + 1)
-#endif
 
 };
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 89cded6b6e2b..6d9f47629fbc 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -16,7 +16,7 @@
 #include "system_global.h"
 #include <linux/kernel.h>
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2
+#ifndef ISP2401
 
 #include "ia_css_ifmtr.h"
 #include <math_support.h>
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
index f975429b8705..bd972d966fe2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
@@ -24,7 +24,7 @@
 #include <system_global.h>
 #include "ia_css_isys_comm.h"
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 /**
  * Virtual Input System. (Input System 2401)
  */
@@ -32,14 +32,12 @@ typedef input_system_cfg_t	ia_css_isys_descr_t;
 /* end of Virtual Input System */
 #endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 input_system_error_t ia_css_isys_init(void);
 void ia_css_isys_uninit(void);
 enum mipi_port_id ia_css_isys_port_to_mipi_port(
     enum mipi_port_id api_port);
-#endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 
 /**
  * @brief Register one (virtual) stream. This is used to track when all
@@ -78,7 +76,7 @@ unsigned int ia_css_csi2_calculate_input_system_alignment(
     enum atomisp_input_format fmt_type);
 #endif
 
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 /* CSS Receiver */
 void ia_css_isys_rx_configure(
     const rx_cfg_t *config,
@@ -95,7 +93,7 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 				   unsigned int irq_infos);
 unsigned int ia_css_isys_rx_translate_irq_infos(unsigned int bits);
 
-#endif /* #if !defined(USE_INPUT_SYSTEM_VERSION_2401) */
+#endif /* #if !defined(ISP2401) */
 
 /* @brief Translate format and compression to format type.
  *
@@ -113,7 +111,7 @@ int ia_css_isys_convert_stream_format_to_mipi_format(
     mipi_predictor_t compression,
     unsigned int *fmt_type);
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 /**
  * Virtual Input System. (Input System 2401)
  */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
index 6f1a86c81d7c..d80ef42c7a64 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
@@ -19,7 +19,7 @@
 #include <type_support.h>
 #include <input_system.h>
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 #include <platform_support.h>		/* inline */
 #include <input_system_global.h>
 #include <ia_css_stream_public.h>	/* IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH */
@@ -50,5 +50,5 @@ static inline uint32_t ia_css_isys_generate_stream_id(
 	return sp_thread_id * IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH + stream_id;
 }
 
-#endif  /* USE_INPUT_SYSTEM_VERSION_2401*/
+#endif  /* ISP2401*/
 #endif  /*_IA_CSS_ISYS_COMM_H */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
index 5a44d8f6c196..3fc9fed1e516 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
@@ -15,7 +15,7 @@
 
 #include "system_global.h"
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 
 #include "assert_support.h"
 #include "platform_support.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
index 68baec78b1c4..261c6460e970 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
@@ -15,7 +15,7 @@
 
 #include "system_global.h"
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 
 #include "assert_support.h"
 #include "platform_support.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index 13cb02ac2651..c88b14ce69a5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -18,12 +18,12 @@
 #include "ia_css_isys.h"
 #include "platform_support.h"
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 #include "isys_dma.h"		/* isys2401_dma_set_max_burst_size() */
 #include "isys_irq.h"
 #endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 input_system_error_t ia_css_isys_init(void)
 {
 	backend_channel_cfg_t backend_ch0;
@@ -86,7 +86,7 @@ input_system_error_t ia_css_isys_init(void)
 
 	return error;
 }
-#elif defined(USE_INPUT_SYSTEM_VERSION_2401)
+#elif defined(ISP2401)
 input_system_error_t ia_css_isys_init(void)
 {
 	ia_css_isys_csi_rx_lut_rmgr_init();
@@ -106,11 +106,11 @@ input_system_error_t ia_css_isys_init(void)
 }
 #endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 void ia_css_isys_uninit(void)
 {
 }
-#elif defined(USE_INPUT_SYSTEM_VERSION_2401)
+#elif defined(ISP2401)
 void ia_css_isys_uninit(void)
 {
 	ia_css_isys_csi_rx_lut_rmgr_uninit();
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
index bc4a2ff3c0fc..fb0cb183f701 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
@@ -15,7 +15,7 @@
 
 #include "system_global.h"
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 
 #include "assert_support.h"
 #include "platform_support.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index fa87afaff6e5..c4bb9fd9ce20 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -20,7 +20,7 @@
 #include "ia_css_irq.h"
 #include "sh_css_internal.h"
 
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
 {
 	hrt_data bits = receiver_port_reg_load(RX0_ID,
@@ -209,7 +209,7 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 
 	return;
 }
-#endif /* #if !defined(USE_INPUT_SYSTEM_VERSION_2401) */
+#endif /* #if !defined(ISP2401) */
 
 int ia_css_isys_convert_stream_format_to_mipi_format(
     enum atomisp_input_format input_format,
@@ -311,7 +311,7 @@ int ia_css_isys_convert_stream_format_to_mipi_format(
 	case ATOMISP_INPUT_FORMAT_EMBEDDED:
 		*fmt_type = MIPI_FORMAT_EMBEDDED;
 		break;
-#ifndef USE_INPUT_SYSTEM_VERSION_2401
+#ifndef ISP2401
 	case ATOMISP_INPUT_FORMAT_RAW_16:
 		/* This is not specified by Arasan, so we use
 		 * 17 for now.
@@ -356,7 +356,7 @@ int ia_css_isys_convert_stream_format_to_mipi_format(
 	return 0;
 }
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 static mipi_predictor_t sh_css_csi2_compression_type_2_mipi_predictor(
     enum ia_css_csi2_compression_type type)
 {
@@ -474,7 +474,7 @@ unsigned int ia_css_csi2_calculate_input_system_alignment(
 
 #endif
 
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 void ia_css_isys_rx_configure(const rx_cfg_t *config,
 			      const enum ia_css_input_mode input_mode)
 {
@@ -588,4 +588,4 @@ void ia_css_isys_rx_disable(void)
 	}
 	return;
 }
-#endif /* if !defined(USE_INPUT_SYSTEM_VERSION_2401) */
+#endif /* if !defined(ISP2401) */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index b3c6831cb9e3..037b9e71a655 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -17,7 +17,7 @@
 
 #include "system_global.h"
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 
 #include "ia_css_isys.h"
 #include "ia_css_debug.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
index 18a7d18e197e..de2c526a58ae 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
@@ -243,7 +243,7 @@ bool ia_css_pipeline_uses_params(struct ia_css_pipeline *pipeline);
  */
 bool ia_css_pipeline_get_sp_thread_id(unsigned int key, unsigned int *val);
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 /**
  * @brief Get the pipeline io status
  *
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index e34df58b124a..d03957d1ecf4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -455,7 +455,7 @@ bool ia_css_pipeline_has_stopped(struct ia_css_pipeline *pipeline)
 	return sp_group.pipe[thread_id].num_stages == 0;
 }
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void)
 {
 	return(&sh_css_sp_group.pipe_io_status);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4f7984b75abc..87347013b747 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -49,7 +49,7 @@
 #include "ia_css_pipe_util.h"
 #include "ia_css_pipe_binarydesc.h"
 #include "ia_css_pipe_stagedesc.h"
-#ifdef USE_INPUT_SYSTEM_VERSION_2
+#ifndef ISP2401
 #include "ia_css_isys.h"
 #endif
 
@@ -57,7 +57,7 @@
 #include "assert_support.h"
 #include "math_support.h"
 #include "sw_event_global.h"			/* Event IDs.*/
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 #include "ia_css_ifmtr.h"
 #endif
 #include "input_system.h"
@@ -393,7 +393,7 @@ static int set_config_on_frame_enqueue(struct ia_css_frame_info
 	*info, struct frame_data_wrapper *frame);
 #endif
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 static unsigned int get_crop_lines_for_bayer_order(const struct
 	ia_css_stream_config *config);
 static unsigned int get_crop_columns_for_bayer_order(const struct
@@ -529,7 +529,7 @@ ia_css_stream_input_format_bits_per_pixel(struct ia_css_stream *stream)
 
 #define GP_ISEL_TPG_MODE 0x90058
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 static int
 sh_css_config_input_network(struct ia_css_stream *stream) {
 	unsigned int fmt_type;
@@ -590,7 +590,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 			    "sh_css_config_input_network() leave:\n");
 	return 0;
 }
-#elif defined(USE_INPUT_SYSTEM_VERSION_2401)
+#elif defined(ISP2401)
 static unsigned int csi2_protocol_calculate_max_subpixels_per_line(
     enum atomisp_input_format	format,
     unsigned int			pixels_per_line)
@@ -890,7 +890,7 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 		    stream_cfg->source.port.num_lanes;
 		isys_stream_descr->csi_port_attr.fmt_type = fmt_type;
 		isys_stream_descr->csi_port_attr.ch_id = stream_cfg->channel_id;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 		isys_stream_descr->online = stream_cfg->online;
 #endif
 		err |= ia_css_isys_convert_compressed_format(
@@ -915,7 +915,7 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 			    stream_cfg->metadata_config.resolution.width;
 			isys_stream_descr->metadata.lines_per_frame =
 			    stream_cfg->metadata_config.resolution.height;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 			/* For new input system, number of str2mmio requests must be even.
 			 * So we round up number of metadata lines to be even. */
 			if (isys_stream_descr->metadata.lines_per_frame > 0)
@@ -1386,7 +1386,7 @@ start_binary(struct ia_css_pipe *pipe,
 		sh_binary_running = true;
 #endif
 
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 	if (stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
 					 pipe->stream->config.mode);
@@ -1406,7 +1406,7 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
 	if ((!pipe) || (!pipe->stream))
 		return -EINVAL;
 
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 	if (pipe->stream->reconfigure_css_rx)
 		ia_css_isys_rx_disable();
 #endif
@@ -1415,7 +1415,7 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
 		return -EINVAL;
 	sh_css_sp_start_binary_copy(ia_css_pipe_get_pipe_num(pipe), out_frame, pipe->stream->config.pixels_per_clock == 2);
 
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 	if (pipe->stream->reconfigure_css_rx)
 	{
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
@@ -1515,7 +1515,7 @@ sh_css_invalidate_shading_tables(struct ia_css_stream *stream)
 static void
 enable_interrupts(enum ia_css_irq_type irq_type)
 {
-#ifdef USE_INPUT_SYSTEM_VERSION_2
+#ifndef ISP2401
 	enum mipi_port_id port;
 #endif
 	bool enable_pulse = irq_type != IA_CSS_IRQ_TYPE_EDGE;
@@ -1538,7 +1538,7 @@ enable_interrupts(enum ia_css_irq_type irq_type)
 	    (enum virq_id)(IRQ_SW_CHANNEL1_ID + IRQ_SW_CHANNEL_OFFSET),
 	    true);
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2
+#ifndef ISP2401
 	for (port = 0; port < N_MIPI_PORT_ID; port++)
 		ia_css_isys_rx_enable_all_interrupts(port);
 #endif
@@ -1811,7 +1811,7 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	sh_css_init_buffer_queues();
 	*/
 
-#if defined(HAS_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	gp_device_reg_store(GP_DEVICE0_ID, _REG_GP_SWITCH_ISYS2401_ADDR, 1);
 #endif
 
@@ -2076,7 +2076,7 @@ create_host_pipeline(struct ia_css_stream *stream) {
 		}
 	}
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 	/* old isys: need to allocate_mipi_frames() even in IA_CSS_PIPE_MODE_COPY */
 	if (pipe_id != IA_CSS_PIPE_ID_ACC)
 	{
@@ -2084,7 +2084,7 @@ create_host_pipeline(struct ia_css_stream *stream) {
 		if (err)
 			goto ERR;
 	}
-#elif defined(USE_INPUT_SYSTEM_VERSION_2401)
+#elif defined(ISP2401)
 	if ((pipe_id != IA_CSS_PIPE_ID_ACC) &&
 	    (main_pipe->config.mode != IA_CSS_PIPE_MODE_COPY))
 	{
@@ -2498,7 +2498,7 @@ ia_css_uninit(void)
 
 	ia_css_rmgr_uninit();
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 	/* needed for reprogramming the inputformatter after power cycle of css */
 	ifmtr_set_if_blocking_mode_reset = true;
 #endif
@@ -2508,10 +2508,8 @@ ia_css_uninit(void)
 	}
 	ia_css_spctrl_unload_fw(SP0_ID);
 	sh_css_sp_set_sp_running(false);
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	/* check and free any remaining mipi frames */
 	free_mipi_frames(NULL);
-#endif
 
 	sh_css_sp_reset_global_vars();
 
@@ -2560,7 +2558,7 @@ int ia_css_irq_translate(
 		case virq_isys_csi:
 			infos |= IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR;
 			break;
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 		case virq_ifmt0_id:
 			infos |= IA_CSS_IRQ_INFO_IF_ERROR;
 			break;
@@ -2599,7 +2597,7 @@ int ia_css_irq_enable(
 	IA_CSS_ENTER("info=%d, enable=%d", info, enable);
 
 	switch (info) {
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 	case IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF:
 		irq = virq_isys_sof;
 		break;
@@ -2739,7 +2737,7 @@ alloc_continuous_frames(
 		return -EINVAL;
 	}
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	/* For CSI2+, the continuous frame will hold the full input frame */
 	ref_info.res.width = pipe->stream->config.input_config.input_res.width;
 	ref_info.res.height = pipe->stream->config.input_config.input_res.height;
@@ -2832,7 +2830,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 	int err = 0;
 	bool continuous, need_vf_pp = false;
 	bool need_isp_copy_binary = false;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	bool sensor = false;
 #endif
 	/* preview only have 1 output pin now */
@@ -2846,7 +2844,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 
 	online = pipe->stream->config.online;
 	continuous = pipe->stream->config.continuous;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
 #endif
 
@@ -2967,7 +2965,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 			return err;
 	}
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	/* When the input system is 2401, only the Direct Sensor Mode
 	 * Offline Preview uses the ISP copy binary.
 	 */
@@ -3308,7 +3306,7 @@ init_vf_frameinfo_defaults(struct ia_css_pipe *pipe,
 	return err;
 }
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 static unsigned int
 get_crop_lines_for_bayer_order(
     const struct ia_css_stream_config *config)
@@ -3465,7 +3463,7 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 
 	in_frame->info.format = format;
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	if (format == IA_CSS_FRAME_FORMAT_RAW)
 		in_frame->info.format = (pipe->stream->config.pack_raw_pixels) ?
 		IA_CSS_FRAME_FORMAT_RAW_PACKED : IA_CSS_FRAME_FORMAT_RAW;
@@ -3482,7 +3480,7 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_INPUT_FRAME, thread_id, &queue_id);
 	in_frame->dynamic_queue_id = queue_id;
 	in_frame->buf_type = IA_CSS_BUFFER_TYPE_INPUT_FRAME;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	ia_css_get_crop_offsets(pipe, &in_frame->info);
 #endif
 	err = ia_css_frame_init_planes(in_frame);
@@ -3553,7 +3551,7 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 
 	me->dvs_frame_delay = pipe->dvs_frame_delay;
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	/* When the input system is 2401, always enable 'in_frameinfo_memory'
 	 * except for the following: online or continuous
 	 */
@@ -3611,7 +3609,7 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 			goto ERR;
 		in_frame = me->stages->args.out_frame[0];
 	} else if (pipe->stream->config.continuous) {
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 		/* When continuous is enabled, configure in_frame with the
 		 * last pipe, which is the copy pipe.
 		 */
@@ -3783,7 +3781,7 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe) {
 	struct ia_css_frame *out_frame;
 	struct ia_css_frame *out_frames[IA_CSS_BINARY_MAX_OUTPUT_PORTS];
 	bool need_in_frameinfo_memory = false;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	bool sensor = false;
 	bool buffered_sensor = false;
 	bool online = false;
@@ -3802,7 +3800,7 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe) {
 	me = &pipe->pipeline;
 	ia_css_pipeline_clean(me);
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	/* When the input system is 2401, always enable 'in_frameinfo_memory'
 	 * except for the following:
 	 * - Direct Sensor Mode Online Preview
@@ -3854,14 +3852,8 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe) {
 		if (err)
 			goto ERR;
 		in_frame = me->stages->args.out_frame[0];
-#ifndef ISP2401
-	} else
-	{
-#else
-	} else if (pipe->stream->config.continuous)
-	{
-#endif
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+	} else if (pipe->stream->config.continuous) {
+#ifdef ISP2401
 		/* When continuous is enabled, configure in_frame with the
 		 * last pipe, which is the copy pipe.
 		 */
@@ -3973,14 +3965,12 @@ preview_start(struct ia_css_pipe *pipe) {
 
 	sh_css_metrics_start_frame();
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	/* multi stream video needs mipi buffers */
 	err = send_mipi_frames(pipe);
 	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
-#endif
 	send_raw_frames(pipe);
 
 	{
@@ -4456,7 +4446,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
 			case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
 				if ((pipe) && (pipe->stop_requested == true)) {
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 					/* free mipi frames only for old input system
 					 * for 2401 it is done in ia_css_stream_destroy call
 					 */
@@ -4488,7 +4478,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 					pipe->num_invalid_frames--;
 
 				if (frame->info.format == IA_CSS_FRAME_FORMAT_BINARY_8) {
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 					frame->planes.binary.size = frame->data_bytes;
 #else
 					frame->planes.binary.size =
@@ -5245,7 +5235,7 @@ sh_css_pipes_have_stopped(struct ia_css_stream *stream)
 	return rval;
 }
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 unsigned int
 sh_css_get_mipi_sizes_for_check(const unsigned int port, const unsigned int idx)
 {
@@ -5630,7 +5620,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			    pipe->num_invalid_frames, pipe->dvs_frame_delay);
 
 	/* pqiao TODO: temp hack for PO, should be removed after offline YUVPP is enabled */
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 	/* Copy */
 	if (!online && !continuous) {
 		/* TODO: what exactly needs doing, prepend the copy binary to
@@ -5783,11 +5773,9 @@ static int video_start(struct ia_css_pipe *pipe)
 
 	/* multi stream video needs mipi buffers */
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	err = send_mipi_frames(pipe);
 	if (err)
 		return err;
-#endif
 
 	send_raw_frames(pipe);
 	{
@@ -6027,7 +6015,7 @@ static int load_primary_binaries(
 	bool need_pp = false;
 	bool need_isp_copy_binary = false;
 	bool need_ldc = false;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	bool sensor = false;
 #endif
 	struct ia_css_frame_info prim_in_info,
@@ -6051,7 +6039,7 @@ static int load_primary_binaries(
 	online = pipe->stream->config.online;
 	memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
 	continuous = pipe->stream->config.continuous;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
 #endif
 
@@ -6269,7 +6257,7 @@ static int load_primary_binaries(
 	if (err)
 		return err;
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	/* When the input system is 2401, only the Direct Sensor Mode
 	    * Offline Capture uses the ISP copy binary.
 	    */
@@ -6483,7 +6471,7 @@ static int load_advanced_binaries(
 	}
 
 	/* Copy */
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	/* For CSI2+, only the direct sensor mode/online requires ISP copy */
 	need_isp_copy = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
 #endif
@@ -6630,7 +6618,7 @@ static int load_low_light_binaries(
 	}
 
 	/* Copy */
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	/* For CSI2+, only the direct sensor mode/online requires ISP copy */
 	need_isp_copy = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
 #endif
@@ -6703,7 +6691,7 @@ static int load_capture_binaries(
 	switch (pipe->config.default_capture_config.mode) {
 	case IA_CSS_CAPTURE_MODE_RAW:
 		err = load_copy_binaries(pipe);
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 		if (!err)
 			pipe->pipe_settings.capture.copy_binary.online = pipe->stream->config.online;
 #endif
@@ -7195,7 +7183,7 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 		next_binary = NULL;
 	}
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	/*
 	    * NOTES
 	    * - Why does the "yuvpp" pipe needs "isp_copy_binary" (i.e. ISP Copy) when
@@ -7215,9 +7203,9 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 	    */
 	need_isp_copy_binary =
 	    (pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_YUV422_8);
-#else  /* !USE_INPUT_SYSTEM_VERSION_2401 */
+#else  /* !ISP2401 */
 	need_isp_copy_binary = true;
-#endif /*  USE_INPUT_SYSTEM_VERSION_2401 */
+#endif /*  ISP2401 */
 
 	if (need_isp_copy_binary)
 	{
@@ -7358,13 +7346,11 @@ static int yuvpp_start(struct ia_css_pipe *pipe)
 
 	/* multi stream video needs mipi buffers */
 
-#if (defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401))
 	err = send_mipi_frames(pipe);
 	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
-#endif
 
 	{
 		unsigned int thread_id;
@@ -7480,7 +7466,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 	struct ia_css_frame *vf_frame[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
 	struct ia_css_pipeline_stage_desc stage_desc;
 	bool need_in_frameinfo_memory = false;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	bool sensor = false;
 	bool buffered_sensor = false;
 	bool online = false;
@@ -7505,7 +7491,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 	num_vf_pp_stage   = pipe->pipe_settings.yuvpp.num_vf_pp;
 	num_output_stage   = pipe->pipe_settings.yuvpp.num_output;
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	/* When the input system is 2401, always enable 'in_frameinfo_memory'
 	    * except for the following:
 	    * - Direct Sensor Mode Online Capture
@@ -7612,7 +7598,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 	{
 		struct ia_css_frame *in_frame_local = NULL;
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 		/* After isp copy is enabled in_frame needs to be passed. */
 		if (!online)
 			in_frame_local = in_frame;
@@ -7829,7 +7815,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 	struct ia_css_frame *vf_frame;
 	struct ia_css_pipeline_stage_desc stage_desc;
 	bool need_in_frameinfo_memory = false;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	bool sensor = false;
 	bool buffered_sensor = false;
 	bool online = false;
@@ -7851,7 +7837,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 	ia_css_pipeline_clean(me);
 	ia_css_pipe_util_create_output_frames(out_frames);
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	/* When the input system is 2401, always enable 'in_frameinfo_memory'
 	    * except for the following:
 	    * - Direct Sensor Mode Online Capture
@@ -7938,7 +7924,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 	{
 		if (raw) {
 			ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 			if (!continuous) {
 				ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
 								    out_frames, in_frame, NULL);
@@ -8205,14 +8191,14 @@ static int capture_start(
 		}
 	}
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 	/* old isys: need to send_mipi_frames() in all pipe modes */
 	err = send_mipi_frames(pipe);
 	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
-#elif defined(USE_INPUT_SYSTEM_VERSION_2401)
+#elif defined(ISP2401)
 	if (pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
 		err = send_mipi_frames(pipe);
 		if (err) {
@@ -8231,7 +8217,7 @@ static int capture_start(
 	}
 	start_pipe(pipe, copy_ovrd, pipe->stream->config.mode);
 
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 	/*
 	    * old isys: for IA_CSS_PIPE_MODE_COPY pipe, isys rx has to be configured,
 	    * which is currently done in start_binary(); but COPY pipe contains no binary,
@@ -8661,9 +8647,7 @@ sh_css_init_host_sp_control_vars(void) {
 	unsigned int o = offsetof(struct host_sp_communication, host2sp_command)
 			    / sizeof(int);
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	unsigned int i;
-#endif
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "sh_css_init_host_sp_control_vars() enter: void\n");
@@ -9080,7 +9064,7 @@ ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
 	return err;
 }
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 /* Configuration of INPUT_SYSTEM_VERSION_2401 is done on SP */
 static int
 ia_css_stream_configure_rx(struct ia_css_stream *stream) {
@@ -9270,7 +9254,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	int err = -EINVAL;
 	struct ia_css_metadata_info md_info;
 	struct ia_css_resolution effective_res;
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	bool aspect_ratio_crop_enabled = false;
 #endif
 
@@ -9287,7 +9271,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		return err;
 	}
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 	/* We don't support metadata for JPEG stream, since they both use str2mem */
 	if (stream_config->input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8 &&
 	    stream_config->metadata_config.resolution.height > 0)
@@ -9298,7 +9282,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	}
 #endif
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	if (stream_config->online && stream_config->pack_raw_pixels)
 	{
 		IA_CSS_LOG("online and pack raw is invalid on input system 2401");
@@ -9312,7 +9296,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* check if mipi size specified */
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 		if (!stream_config->online)
 #endif
 		{
@@ -9392,13 +9376,13 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	/* take over stream config */
 	curr_stream->config = *stream_config;
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401) && defined(CSI2P_DISABLE_ISYS2401_ONLINE_MODE)
+#if defined(ISP2401)
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR &&
 	    stream_config->online)
 		curr_stream->config.online = false;
 #endif
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	if (curr_stream->config.online)
 	{
 		curr_stream->config.source.port.num_lanes =
@@ -9422,12 +9406,12 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	{
 	case IA_CSS_INPUT_MODE_SENSOR:
 	case IA_CSS_INPUT_MODE_BUFFERED_SENSOR:
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 		ia_css_stream_configure_rx(curr_stream);
 #endif
 		break;
 	case IA_CSS_INPUT_MODE_TPG:
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 		IA_CSS_LOG("tpg_configuration: x_mask=%d, y_mask=%d, x_delta=%d, y_delta=%d, xy_mask=%d",
 			    curr_stream->config.source.tpg.x_mask,
 			    curr_stream->config.source.tpg.y_mask,
@@ -9444,7 +9428,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 #endif
 		break;
 	case IA_CSS_INPUT_MODE_PRBS:
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 		IA_CSS_LOG("mode prbs");
 		sh_css_sp_configure_prbs(curr_stream->config.source.prbs.seed);
 #endif
@@ -9457,7 +9441,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		IA_CSS_LOG("mode sensor/default");
 	}
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	err = aspect_ratio_crop_init(curr_stream,
 					pipes,
 					&aspect_ratio_crop_enabled);
@@ -9480,7 +9464,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		if (effective_res.height == 0 || effective_res.width == 0) {
 			effective_res = curr_pipe->stream->config.input_config.effective_res;
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 			/* The aspect ratio cropping is currently only
 			    * supported on the new input system. */
 			if (aspect_ratio_crop_check(aspect_ratio_crop_enabled, curr_pipe)) {
@@ -9754,7 +9738,7 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
 	if ((stream->last_pipe) &&
 	    ia_css_pipeline_is_mapped(stream->last_pipe->pipe_num))
 	{
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 		bool free_mpi;
 
 		for (i = 0; i < stream->num_pipes; i++) {
@@ -9946,13 +9930,13 @@ ia_css_stream_start(struct ia_css_stream *stream) {
 		return err;
 	}
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	if ((stream->config.mode == IA_CSS_INPUT_MODE_SENSOR) ||
 	    (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR))
 		stream_register_with_csi_rx(stream);
 #endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 	/* Initialize mipi size checks */
 	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
 	{
@@ -9988,7 +9972,7 @@ ia_css_stream_stop(struct ia_css_stream *stream) {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop: stopping %d\n",
 			    stream->last_pipe->mode);
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 	/* De-initialize mipi size checks */
 	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
 	{
@@ -10466,7 +10450,7 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	need_input_queue = true;
 #else
 	need_input_queue = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
@@ -10795,7 +10779,7 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 	return err;
 }
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 static int
 aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
 			struct ia_css_pipe *pipes[],
diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index 92d80213860f..30a84a587b2a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -397,10 +397,6 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 #define SH_CSS_MAX_STAGES 8 /* primary_stage[1-6], capture_pp, vf_pp */
 
 /* For CSI2+ input system, it requires extra paddinga from vmem */
-#ifdef CONFIG_CSI2_PLUS
-#define _ISP_EXTRA_PADDING_VECS 2
-#else
 #define _ISP_EXTRA_PADDING_VECS 0
-#endif /* CONFIG_CSI2_PLUS */
 
 #endif /* _SH_CSS_DEFS_H_ */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 54847abf667a..415353ceb7f6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -22,7 +22,7 @@
 #include <platform_support.h>
 #include <stdarg.h>
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 #include "input_formatter.h"
 #endif
 #include "input_system.h"
@@ -86,11 +86,9 @@
 #define SH_CSS_MAX_IF_CONFIGS	3 /* Must match with IA_CSS_NR_OF_CONFIGS (not defined yet).*/
 #define SH_CSS_IF_CONFIG_NOT_NEEDED	0xFF
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 #define SH_CSS_ENABLE_METADATA
-#endif
 
-#if defined(SH_CSS_ENABLE_METADATA) && !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(SH_CSS_ENABLE_METADATA) && !defined(ISP2401)
 #define SH_CSS_ENABLE_METADATA_THREAD
 #endif
 
@@ -320,15 +318,9 @@ struct sh_css_sp_debug_state {
 
 #elif SP_DEBUG == SP_DEBUG_TRACE
 
-#if 1
 /* Example of just one global trace */
 #define SH_CSS_SP_DBG_NR_OF_TRACES	(1)
 #define SH_CSS_SP_DBG_TRACE_DEPTH	(40)
-#else
-/* E.g. if you like separate traces for 4 threads */
-#define SH_CSS_SP_DBG_NR_OF_TRACES	(4)
-#define SH_CSS_SP_DBG_TRACE_DEPTH	(10)
-#endif
 
 #define SH_CSS_SP_DBG_TRACE_FILE_ID_BIT_POS (13)
 
@@ -371,7 +363,7 @@ struct sh_css_sp_debug_command {
 	u32 dma_sw_reg;
 };
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 /* SP input formatter configuration.*/
 struct sh_css_sp_input_formatter_set {
 	u32				stream_format;
@@ -391,7 +383,7 @@ struct sh_css_sp_config {
 	     frames are locked when their EOF event is successfully sent to the
 	     host (true) or when they are passed to the preview/video pipe
 	     (false). */
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 	struct {
 		u8					a_changed;
 		u8					b_changed;
@@ -400,7 +392,7 @@ struct sh_css_sp_config {
 			set[SH_CSS_MAX_IF_CONFIGS]; /* CSI-2 port is used as index. */
 	} input_formatter;
 #endif
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 	sync_generator_cfg_t	sync_gen;
 	tpg_cfg_t		tpg;
 	prbs_cfg_t		prbs;
@@ -423,7 +415,7 @@ enum sh_css_stage_type {
 #define SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS_MASK \
 	((SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << SH_CSS_MAX_SP_THREADS) - 1)
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 struct sh_css_sp_pipeline_terminal {
 	union {
 		/* Input System 2401 */
@@ -679,7 +671,7 @@ struct sh_css_sp_stage {
 struct sh_css_sp_group {
 	struct sh_css_sp_config		config;
 	struct sh_css_sp_pipeline	pipe[SH_CSS_MAX_SP_THREADS];
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	struct sh_css_sp_pipeline_io	pipe_io[SH_CSS_MAX_SP_THREADS];
 	struct sh_css_sp_pipeline_io_status	pipe_io_status;
 #endif
@@ -828,11 +820,9 @@ struct host_sp_communication {
 	ia_css_ptr host2sp_offline_frames[NUM_CONTINUOUS_FRAMES];
 	ia_css_ptr host2sp_offline_metadata[NUM_CONTINUOUS_FRAMES];
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	ia_css_ptr host2sp_mipi_frames[N_CSI_PORTS][NUM_MIPI_FRAMES_PER_STREAM];
 	ia_css_ptr host2sp_mipi_metadata[N_CSI_PORTS][NUM_MIPI_FRAMES_PER_STREAM];
 	u32 host2sp_num_mipi_frames[N_CSI_PORTS];
-#endif
 	u32 host2sp_cont_avail_num_raw_frames;
 	u32 host2sp_cont_extra_num_raw_frames;
 	u32 host2sp_cont_target_num_raw_frames;
@@ -840,20 +830,12 @@ struct host_sp_communication {
 
 };
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 #define SIZE_OF_HOST_SP_COMMUNICATION_STRUCT				\
 	(sizeof(uint32_t) +						\
 	(NUM_CONTINUOUS_FRAMES * SIZE_OF_HRT_VADDRESS * 2) +		\
 	(N_CSI_PORTS * NUM_MIPI_FRAMES_PER_STREAM * SIZE_OF_HRT_VADDRESS * 2) +			\
 	((3 + N_CSI_PORTS) * sizeof(uint32_t)) +						\
 	(NR_OF_PIPELINES * SIZE_OF_SH_CSS_EVENT_IRQ_MASK_STRUCT))
-#else
-#define SIZE_OF_HOST_SP_COMMUNICATION_STRUCT				\
-	(sizeof(uint32_t) +						\
-	(NUM_CONTINUOUS_FRAMES * SIZE_OF_HRT_VADDRESS * 2) +		\
-	(3 * sizeof(uint32_t)) +						\
-	(NR_OF_PIPELINES * SIZE_OF_SH_CSS_EVENT_IRQ_MASK_STRUCT))
-#endif
 
 struct host_sp_queues {
 	/*
@@ -987,7 +969,7 @@ sh_css_frame_info_set_width(struct ia_css_frame_info *info,
 			    unsigned int width,
 			    unsigned int aligned);
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 
 unsigned int
 sh_css_get_mipi_sizes_for_check(const unsigned int port,
@@ -1036,7 +1018,7 @@ sh_css_continuous_is_enabled(uint8_t pipe_num);
 struct ia_css_pipe *
 find_pipe_by_num(uint32_t pipe_num);
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 void
 ia_css_get_crop_offsets(
     struct ia_css_pipe *pipe,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index a0be171fba83..ba7d406bcc10 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -30,10 +30,8 @@
 #include "sh_css_sp.h" /* sh_css_update_host2sp_mipi_frame sh_css_update_host2sp_num_mipi_frames ... */
 #include "sw_event_global.h" /* IA_CSS_PSYS_SW_EVENT_MIPI_BUFFERS_READY */
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 static u32
 ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
-#endif
 
 int
 ia_css_mipi_frame_specify(const unsigned int size_mem_words,
@@ -120,7 +118,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	unsigned int mem_words = 0;
 	unsigned int width_padded = width;
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	/* The changes will be reverted as soon as RAW
 	 * Buffers are deployed by the 2401 Input System
 	 * in the non-continuous use scenario.
@@ -246,7 +244,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	return err;
 }
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 int
 ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
 				       const unsigned int	size_mem_words) {
@@ -275,19 +273,17 @@ ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
 void
 mipi_init(void)
 {
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	unsigned int i;
 
 	for (i = 0; i < N_CSI_PORTS; i++)
 		ref_count_mipi_allocation[i] = 0;
-#endif
 }
 
 int
 calculate_mipi_buff_size(
     struct ia_css_stream_config *stream_cfg,
     unsigned int *size_mem_words) {
-#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(ISP2401)
 	int err = -EINVAL;
 	(void)stream_cfg;
 	(void)size_mem_words;
@@ -409,7 +405,6 @@ static bool buffers_needed(struct ia_css_pipe *pipe)
 int
 allocate_mipi_frames(struct ia_css_pipe *pipe,
 		     struct ia_css_stream_info *info) {
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	int err = -EINVAL;
 	unsigned int port;
 	struct ia_css_frame_info mipi_intermediate_info;
@@ -427,7 +422,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return -EINVAL;
 	}
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	if (pipe->stream->config.online)
 	{
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
@@ -459,13 +454,13 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return -EINVAL;
 	}
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	err = calculate_mipi_buff_size(
 	    &pipe->stream->config,
 	    &my_css.mipi_frame_size[port]);
 #endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 	if (ref_count_mipi_allocation[port] != 0)
 	{
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
@@ -560,16 +555,10 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 			    "allocate_mipi_frames(%p) exit:\n", pipe);
 
 	return err;
-#else
-	(void)pipe;
-	(void)info;
-	return 0;
-#endif
 }
 
 int
 free_mipi_frames(struct ia_css_pipe *pipe) {
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	int err = -EINVAL;
 	unsigned int port;
 
@@ -609,7 +598,7 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 		}
 
 		if (ref_count_mipi_allocation[port] > 0) {
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 			assert(ref_count_mipi_allocation[port] == 1);
 			if (ref_count_mipi_allocation[port] != 1) {
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
@@ -641,7 +630,7 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 						    "free_mipi_frames(%p) exit (deallocated).\n", pipe);
 			}
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 			else {
 				/* 2401 system allows multiple streams to use same physical port. This is not
 				 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
@@ -675,15 +664,11 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 			ref_count_mipi_allocation[port] = 0;
 		}
 	}
-#else
-	(void)pipe;
-#endif
 	return 0;
 }
 
 int
 send_mipi_frames(struct ia_css_pipe *pipe) {
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	int err = -EINVAL;
 	unsigned int i;
 #ifndef ISP2401
@@ -751,8 +736,5 @@ send_mipi_frames(struct ia_css_pipe *pipe) {
 	    (uint8_t)my_css.num_mipi_frames[port],
 	    0 /* not used */);
 	IA_CSS_LEAVE_ERR_PRIVATE(0);
-#else
-	(void)pipe;
-#endif
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 046f34857891..ed496f6d28f0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -258,7 +258,7 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 	/* We use the ISP input resolution for the shading table because
 	   shading correction is performed in the bayer domain (before bayer
 	   down scaling). */
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	padded_width = CEIL_MUL(binary->effective_in_frame_res.width + 2 *
 				ISP_VEC_NELEMS,
 				2 * ISP_VEC_NELEMS);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 6d827ec67192..fa0158c190a7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -55,9 +55,6 @@
 #include "ia_css_host_data.h"
 #include "ia_css_pipe.h"
 #include "ia_css_pipe_binarydesc.h"
-#if 0
-#include "ia_css_system_ctrl.h"
-#endif
 
 /* Include all kernel host interfaces for ISP1 */
 
@@ -143,535 +140,6 @@ static int interleaved_lut_temp[4][HRT_GDC_N];
 /* Digital Zoom lookup table. See documentation for more details about the
  * contents of this table.
  */
-#if defined(CONFIG_CSI2_PLUS)
-/*
- * Coefficients from
- * Css_Mizuchi/regressions/20140424_0930/all/applications/common/gdc_v2_common/lut.h
- */
-
-static const int zoom_table[4][HRT_GDC_N] = {
-	{
-		0,    0,    0,    0,    0,    0,    0,    0,
-		0,    0,    0,    0,    0,    0,    0,    0,
-		0,    0,    0,    0,    0,    0,    0,   -1,
-		-1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
-		-1,   -2,   -2,   -2,   -2,   -2,   -2,   -2,
-		-3,   -3,   -3,   -3,   -3,   -3,   -3,   -4,
-		-4,   -4,   -4,   -4,   -5,   -5,   -5,   -5,
-		-5,   -5,   -6,   -6,   -6,   -6,   -7,   -7,
-		-7,   -7,   -7,   -8,   -8,   -8,   -8,   -9,
-		-9,   -9,   -9,  -10,  -10,  -10,  -10,  -11,
-		-11,  -11,  -12,  -12,  -12,  -12,  -13,  -13,
-		-13,  -14,  -14,  -14,  -15,  -15,  -15,  -15,
-		-16,  -16,  -16,  -17,  -17,  -17,  -18,  -18,
-		-18,  -19,  -19,  -20,  -20,  -20,  -21,  -21,
-		-21,  -22,  -22,  -22,  -23,  -23,  -24,  -24,
-		-24,  -25,  -25,  -25,  -26,  -26,  -27,  -27,
-		-28,  -28,  -28,  -29,  -29,  -30,  -30,  -30,
-		-31,  -31,  -32,  -32,  -33,  -33,  -33,  -34,
-		-34,  -35,  -35,  -36,  -36,  -37,  -37,  -37,
-		-38,  -38,  -39,  -39,  -40,  -40,  -41,  -41,
-		-42,  -42,  -43,  -43,  -44,  -44,  -45,  -45,
-		-46,  -46,  -47,  -47,  -48,  -48,  -49,  -49,
-		-50,  -50,  -51,  -51,  -52,  -52,  -53,  -53,
-		-54,  -54,  -55,  -55,  -56,  -56,  -57,  -57,
-		-58,  -59,  -59,  -60,  -60,  -61,  -61,  -62,
-		-62,  -63,  -63,  -64,  -65,  -65,  -66,  -66,
-		-67,  -67,  -68,  -69,  -69,  -70,  -70,  -71,
-		-71,  -72,  -73,  -73,  -74,  -74,  -75,  -75,
-		-76,  -77,  -77,  -78,  -78,  -79,  -80,  -80,
-		-81,  -81,  -82,  -83,  -83,  -84,  -84,  -85,
-		-86,  -86,  -87,  -87,  -88,  -89,  -89,  -90,
-		-91,  -91,  -92,  -92,  -93,  -94,  -94,  -95,
-		-96,  -96,  -97,  -97,  -98,  -99,  -99, -100,
-		-101, -101, -102, -102, -103, -104, -104, -105,
-		-106, -106, -107, -108, -108, -109, -109, -110,
-		-111, -111, -112, -113, -113, -114, -115, -115,
-		-116, -117, -117, -118, -119, -119, -120, -121,
-		-121, -122, -122, -123, -124, -124, -125, -126,
-		-126, -127, -128, -128, -129, -130, -130, -131,
-		-132, -132, -133, -134, -134, -135, -136, -136,
-		-137, -138, -138, -139, -140, -140, -141, -142,
-		-142, -143, -144, -144, -145, -146, -146, -147,
-		-148, -148, -149, -150, -150, -151, -152, -152,
-		-153, -154, -154, -155, -156, -156, -157, -158,
-		-158, -159, -160, -160, -161, -162, -162, -163,
-		-164, -164, -165, -166, -166, -167, -168, -168,
-		-169, -170, -170, -171, -172, -172, -173, -174,
-		-174, -175, -176, -176, -177, -178, -178, -179,
-		-180, -180, -181, -181, -182, -183, -183, -184,
-		-185, -185, -186, -187, -187, -188, -189, -189,
-		-190, -191, -191, -192, -193, -193, -194, -194,
-		-195, -196, -196, -197, -198, -198, -199, -200,
-		-200, -201, -201, -202, -203, -203, -204, -205,
-		-205, -206, -206, -207, -208, -208, -209, -210,
-		-210, -211, -211, -212, -213, -213, -214, -215,
-		-215, -216, -216, -217, -218, -218, -219, -219,
-		-220, -221, -221, -222, -222, -223, -224, -224,
-		-225, -225, -226, -227, -227, -228, -228, -229,
-		-229, -230, -231, -231, -232, -232, -233, -233,
-		-234, -235, -235, -236, -236, -237, -237, -238,
-		-239, -239, -240, -240, -241, -241, -242, -242,
-		-243, -244, -244, -245, -245, -246, -246, -247,
-		-247, -248, -248, -249, -249, -250, -250, -251,
-		-251, -252, -252, -253, -253, -254, -254, -255,
-		-256, -256, -256, -257, -257, -258, -258, -259,
-		-259, -260, -260, -261, -261, -262, -262, -263,
-		-263, -264, -264, -265, -265, -266, -266, -266,
-		-267, -267, -268, -268, -269, -269, -270, -270,
-		-270, -271, -271, -272, -272, -273, -273, -273,
-		-274, -274, -275, -275, -275, -276, -276, -277,
-		-277, -277, -278, -278, -279, -279, -279, -280,
-		-280, -280, -281, -281, -282, -282, -282, -283,
-		-283, -283, -284, -284, -284, -285, -285, -285,
-		-286, -286, -286, -287, -287, -287, -288, -288,
-		-288, -289, -289, -289, -289, -290, -290, -290,
-		-291, -291, -291, -291, -292, -292, -292, -293,
-		-293, -293, -293, -294, -294, -294, -294, -295,
-		-295, -295, -295, -295, -296, -296, -296, -296,
-		-297, -297, -297, -297, -297, -298, -298, -298,
-		-298, -298, -299, -299, -299, -299, -299, -299,
-		-300, -300, -300, -300, -300, -300, -300, -301,
-		-301, -301, -301, -301, -301, -301, -301, -301,
-		-302, -302, -302, -302, -302, -302, -302, -302,
-		-302, -302, -302, -302, -302, -303, -303, -303,
-		-303, -303, -303, -303, -303, -303, -303, -303,
-		-303, -303, -303, -303, -303, -303, -303, -303,
-		-303, -303, -303, -303, -303, -303, -303, -303,
-		-303, -303, -302, -302, -302, -302, -302, -302,
-		-302, -302, -302, -302, -302, -302, -301, -301,
-		-301, -301, -301, -301, -301, -301, -300, -300,
-		-300, -300, -300, -300, -299, -299, -299, -299,
-		-299, -299, -298, -298, -298, -298, -298, -297,
-		-297, -297, -297, -296, -296, -296, -296, -295,
-		-295, -295, -295, -294, -294, -294, -293, -293,
-		-293, -293, -292, -292, -292, -291, -291, -291,
-		-290, -290, -290, -289, -289, -289, -288, -288,
-		-288, -287, -287, -286, -286, -286, -285, -285,
-		-284, -284, -284, -283, -283, -282, -282, -281,
-		-281, -280, -280, -279, -279, -279, -278, -278,
-		-277, -277, -276, -276, -275, -275, -274, -273,
-		-273, -272, -272, -271, -271, -270, -270, -269,
-		-268, -268, -267, -267, -266, -266, -265, -264,
-		-264, -263, -262, -262, -261, -260, -260, -259,
-		-259, -258, -257, -256, -256, -255, -254, -254,
-		-253, -252, -252, -251, -250, -249, -249, -248,
-		-247, -246, -246, -245, -244, -243, -242, -242,
-		-241, -240, -239, -238, -238, -237, -236, -235,
-		-234, -233, -233, -232, -231, -230, -229, -228,
-		-227, -226, -226, -225, -224, -223, -222, -221,
-		-220, -219, -218, -217, -216, -215, -214, -213,
-		-212, -211, -210, -209, -208, -207, -206, -205,
-		-204, -203, -202, -201, -200, -199, -198, -197,
-		-196, -194, -193, -192, -191, -190, -189, -188,
-		-187, -185, -184, -183, -182, -181, -180, -178,
-		-177, -176, -175, -174, -172, -171, -170, -169,
-		-167, -166, -165, -164, -162, -161, -160, -158,
-		-157, -156, -155, -153, -152, -151, -149, -148,
-		-147, -145, -144, -142, -141, -140, -138, -137,
-		-135, -134, -133, -131, -130, -128, -127, -125,
-		-124, -122, -121, -120, -118, -117, -115, -114,
-		-112, -110, -109, -107, -106, -104, -103, -101,
-		-100,  -98,  -96,  -95,  -93,  -92,  -90,  -88,
-		-87,  -85,  -83,  -82,  -80,  -78,  -77,  -75,
-		-73,  -72,  -70,  -68,  -67,  -65,  -63,  -61,
-		-60,  -58,  -56,  -54,  -52,  -51,  -49,  -47,
-		-45,  -43,  -42,  -40,  -38,  -36,  -34,  -32,
-		-31,  -29,  -27,  -25,  -23,  -21,  -19,  -17,
-		-15,  -13,  -11,   -9,   -7,   -5,   -3,   -1
-	},
-	{
-		0,    2,    4,    6,    8,   10,   12,   14,
-		16,   18,   20,   22,   25,   27,   29,   31,
-		33,   36,   38,   40,   43,   45,   47,   50,
-		52,   54,   57,   59,   61,   64,   66,   69,
-		71,   74,   76,   79,   81,   84,   86,   89,
-		92,   94,   97,   99,  102,  105,  107,  110,
-		113,  116,  118,  121,  124,  127,  129,  132,
-		135,  138,  141,  144,  146,  149,  152,  155,
-		158,  161,  164,  167,  170,  173,  176,  179,
-		182,  185,  188,  191,  194,  197,  200,  203,
-		207,  210,  213,  216,  219,  222,  226,  229,
-		232,  235,  239,  242,  245,  248,  252,  255,
-		258,  262,  265,  269,  272,  275,  279,  282,
-		286,  289,  292,  296,  299,  303,  306,  310,
-		313,  317,  321,  324,  328,  331,  335,  338,
-		342,  346,  349,  353,  357,  360,  364,  368,
-		372,  375,  379,  383,  386,  390,  394,  398,
-		402,  405,  409,  413,  417,  421,  425,  429,
-		432,  436,  440,  444,  448,  452,  456,  460,
-		464,  468,  472,  476,  480,  484,  488,  492,
-		496,  500,  504,  508,  512,  516,  521,  525,
-		529,  533,  537,  541,  546,  550,  554,  558,
-		562,  567,  571,  575,  579,  584,  588,  592,
-		596,  601,  605,  609,  614,  618,  622,  627,
-		631,  635,  640,  644,  649,  653,  657,  662,
-		666,  671,  675,  680,  684,  689,  693,  698,
-		702,  707,  711,  716,  720,  725,  729,  734,
-		738,  743,  747,  752,  757,  761,  766,  771,
-		775,  780,  784,  789,  794,  798,  803,  808,
-		813,  817,  822,  827,  831,  836,  841,  846,
-		850,  855,  860,  865,  870,  874,  879,  884,
-		889,  894,  898,  903,  908,  913,  918,  923,
-		928,  932,  937,  942,  947,  952,  957,  962,
-		967,  972,  977,  982,  986,  991,  996, 1001,
-		1006, 1011, 1016, 1021, 1026, 1031, 1036, 1041,
-		1046, 1051, 1056, 1062, 1067, 1072, 1077, 1082,
-		1087, 1092, 1097, 1102, 1107, 1112, 1117, 1122,
-		1128, 1133, 1138, 1143, 1148, 1153, 1158, 1164,
-		1169, 1174, 1179, 1184, 1189, 1195, 1200, 1205,
-		1210, 1215, 1221, 1226, 1231, 1236, 1242, 1247,
-		1252, 1257, 1262, 1268, 1273, 1278, 1284, 1289,
-		1294, 1299, 1305, 1310, 1315, 1321, 1326, 1331,
-		1336, 1342, 1347, 1352, 1358, 1363, 1368, 1374,
-		1379, 1384, 1390, 1395, 1400, 1406, 1411, 1417,
-		1422, 1427, 1433, 1438, 1443, 1449, 1454, 1460,
-		1465, 1470, 1476, 1481, 1487, 1492, 1497, 1503,
-		1508, 1514, 1519, 1525, 1530, 1535, 1541, 1546,
-		1552, 1557, 1563, 1568, 1574, 1579, 1585, 1590,
-		1596, 1601, 1606, 1612, 1617, 1623, 1628, 1634,
-		1639, 1645, 1650, 1656, 1661, 1667, 1672, 1678,
-		1683, 1689, 1694, 1700, 1705, 1711, 1716, 1722,
-		1727, 1733, 1738, 1744, 1749, 1755, 1761, 1766,
-		1772, 1777, 1783, 1788, 1794, 1799, 1805, 1810,
-		1816, 1821, 1827, 1832, 1838, 1844, 1849, 1855,
-		1860, 1866, 1871, 1877, 1882, 1888, 1893, 1899,
-		1905, 1910, 1916, 1921, 1927, 1932, 1938, 1943,
-		1949, 1955, 1960, 1966, 1971, 1977, 1982, 1988,
-		1993, 1999, 2005, 2010, 2016, 2021, 2027, 2032,
-		2038, 2043, 2049, 2055, 2060, 2066, 2071, 2077,
-		2082, 2088, 2093, 2099, 2105, 2110, 2116, 2121,
-		2127, 2132, 2138, 2143, 2149, 2154, 2160, 2165,
-		2171, 2177, 2182, 2188, 2193, 2199, 2204, 2210,
-		2215, 2221, 2226, 2232, 2237, 2243, 2248, 2254,
-		2259, 2265, 2270, 2276, 2281, 2287, 2292, 2298,
-		2304, 2309, 2314, 2320, 2325, 2331, 2336, 2342,
-		2347, 2353, 2358, 2364, 2369, 2375, 2380, 2386,
-		2391, 2397, 2402, 2408, 2413, 2419, 2424, 2429,
-		2435, 2440, 2446, 2451, 2457, 2462, 2467, 2473,
-		2478, 2484, 2489, 2495, 2500, 2505, 2511, 2516,
-		2522, 2527, 2532, 2538, 2543, 2549, 2554, 2559,
-		2565, 2570, 2575, 2581, 2586, 2591, 2597, 2602,
-		2607, 2613, 2618, 2623, 2629, 2634, 2639, 2645,
-		2650, 2655, 2661, 2666, 2671, 2676, 2682, 2687,
-		2692, 2698, 2703, 2708, 2713, 2719, 2724, 2729,
-		2734, 2740, 2745, 2750, 2755, 2760, 2766, 2771,
-		2776, 2781, 2786, 2792, 2797, 2802, 2807, 2812,
-		2817, 2823, 2828, 2833, 2838, 2843, 2848, 2853,
-		2859, 2864, 2869, 2874, 2879, 2884, 2889, 2894,
-		2899, 2904, 2909, 2914, 2919, 2924, 2930, 2935,
-		2940, 2945, 2950, 2955, 2960, 2965, 2970, 2975,
-		2980, 2984, 2989, 2994, 2999, 3004, 3009, 3014,
-		3019, 3024, 3029, 3034, 3039, 3044, 3048, 3053,
-		3058, 3063, 3068, 3073, 3078, 3082, 3087, 3092,
-		3097, 3102, 3106, 3111, 3116, 3121, 3126, 3130,
-		3135, 3140, 3145, 3149, 3154, 3159, 3163, 3168,
-		3173, 3177, 3182, 3187, 3191, 3196, 3201, 3205,
-		3210, 3215, 3219, 3224, 3228, 3233, 3238, 3242,
-		3247, 3251, 3256, 3260, 3265, 3269, 3274, 3279,
-		3283, 3287, 3292, 3296, 3301, 3305, 3310, 3314,
-		3319, 3323, 3327, 3332, 3336, 3341, 3345, 3349,
-		3354, 3358, 3362, 3367, 3371, 3375, 3380, 3384,
-		3388, 3393, 3397, 3401, 3405, 3410, 3414, 3418,
-		3422, 3426, 3431, 3435, 3439, 3443, 3447, 3451,
-		3455, 3460, 3464, 3468, 3472, 3476, 3480, 3484,
-		3488, 3492, 3496, 3500, 3504, 3508, 3512, 3516,
-		3520, 3524, 3528, 3532, 3536, 3540, 3544, 3548,
-		3552, 3555, 3559, 3563, 3567, 3571, 3575, 3578,
-		3582, 3586, 3590, 3593, 3597, 3601, 3605, 3608,
-		3612, 3616, 3619, 3623, 3627, 3630, 3634, 3638,
-		3641, 3645, 3649, 3652, 3656, 3659, 3663, 3666,
-		3670, 3673, 3677, 3680, 3684, 3687, 3691, 3694,
-		3698, 3701, 3704, 3708, 3711, 3714, 3718, 3721,
-		3724, 3728, 3731, 3734, 3738, 3741, 3744, 3747,
-		3751, 3754, 3757, 3760, 3763, 3767, 3770, 3773,
-		3776, 3779, 3782, 3785, 3788, 3791, 3794, 3798,
-		3801, 3804, 3807, 3809, 3812, 3815, 3818, 3821,
-		3824, 3827, 3830, 3833, 3836, 3839, 3841, 3844,
-		3847, 3850, 3853, 3855, 3858, 3861, 3864, 3866,
-		3869, 3872, 3874, 3877, 3880, 3882, 3885, 3887,
-		3890, 3893, 3895, 3898, 3900, 3903, 3905, 3908,
-		3910, 3913, 3915, 3917, 3920, 3922, 3925, 3927,
-		3929, 3932, 3934, 3936, 3939, 3941, 3943, 3945,
-		3948, 3950, 3952, 3954, 3956, 3958, 3961, 3963,
-		3965, 3967, 3969, 3971, 3973, 3975, 3977, 3979,
-		3981, 3983, 3985, 3987, 3989, 3991, 3993, 3994,
-		3996, 3998, 4000, 4002, 4004, 4005, 4007, 4009,
-		4011, 4012, 4014, 4016, 4017, 4019, 4021, 4022,
-		4024, 4025, 4027, 4028, 4030, 4031, 4033, 4034,
-		4036, 4037, 4039, 4040, 4042, 4043, 4044, 4046,
-		4047, 4048, 4050, 4051, 4052, 4053, 4055, 4056,
-		4057, 4058, 4059, 4060, 4062, 4063, 4064, 4065,
-		4066, 4067, 4068, 4069, 4070, 4071, 4072, 4073,
-		4074, 4075, 4075, 4076, 4077, 4078, 4079, 4079,
-		4080, 4081, 4082, 4082, 4083, 4084, 4084, 4085,
-		4086, 4086, 4087, 4087, 4088, 4088, 4089, 4089,
-		4090, 4090, 4091, 4091, 4092, 4092, 4092, 4093,
-		4093, 4093, 4094, 4094, 4094, 4094, 4095, 4095,
-		4095, 4095, 4095, 4095, 4095, 4095, 4095, 4095
-	},
-	{
-		4096, 4095, 4095, 4095, 4095, 4095, 4095, 4095,
-		4095, 4095, 4095, 4094, 4094, 4094, 4094, 4093,
-		4093, 4093, 4092, 4092, 4092, 4091, 4091, 4090,
-		4090, 4089, 4089, 4088, 4088, 4087, 4087, 4086,
-		4086, 4085, 4084, 4084, 4083, 4082, 4082, 4081,
-		4080, 4079, 4079, 4078, 4077, 4076, 4075, 4075,
-		4074, 4073, 4072, 4071, 4070, 4069, 4068, 4067,
-		4066, 4065, 4064, 4063, 4062, 4060, 4059, 4058,
-		4057, 4056, 4055, 4053, 4052, 4051, 4050, 4048,
-		4047, 4046, 4044, 4043, 4042, 4040, 4039, 4037,
-		4036, 4034, 4033, 4031, 4030, 4028, 4027, 4025,
-		4024, 4022, 4021, 4019, 4017, 4016, 4014, 4012,
-		4011, 4009, 4007, 4005, 4004, 4002, 4000, 3998,
-		3996, 3994, 3993, 3991, 3989, 3987, 3985, 3983,
-		3981, 3979, 3977, 3975, 3973, 3971, 3969, 3967,
-		3965, 3963, 3961, 3958, 3956, 3954, 3952, 3950,
-		3948, 3945, 3943, 3941, 3939, 3936, 3934, 3932,
-		3929, 3927, 3925, 3922, 3920, 3917, 3915, 3913,
-		3910, 3908, 3905, 3903, 3900, 3898, 3895, 3893,
-		3890, 3887, 3885, 3882, 3880, 3877, 3874, 3872,
-		3869, 3866, 3864, 3861, 3858, 3855, 3853, 3850,
-		3847, 3844, 3841, 3839, 3836, 3833, 3830, 3827,
-		3824, 3821, 3818, 3815, 3812, 3809, 3807, 3804,
-		3801, 3798, 3794, 3791, 3788, 3785, 3782, 3779,
-		3776, 3773, 3770, 3767, 3763, 3760, 3757, 3754,
-		3751, 3747, 3744, 3741, 3738, 3734, 3731, 3728,
-		3724, 3721, 3718, 3714, 3711, 3708, 3704, 3701,
-		3698, 3694, 3691, 3687, 3684, 3680, 3677, 3673,
-		3670, 3666, 3663, 3659, 3656, 3652, 3649, 3645,
-		3641, 3638, 3634, 3630, 3627, 3623, 3619, 3616,
-		3612, 3608, 3605, 3601, 3597, 3593, 3590, 3586,
-		3582, 3578, 3575, 3571, 3567, 3563, 3559, 3555,
-		3552, 3548, 3544, 3540, 3536, 3532, 3528, 3524,
-		3520, 3516, 3512, 3508, 3504, 3500, 3496, 3492,
-		3488, 3484, 3480, 3476, 3472, 3468, 3464, 3460,
-		3455, 3451, 3447, 3443, 3439, 3435, 3431, 3426,
-		3422, 3418, 3414, 3410, 3405, 3401, 3397, 3393,
-		3388, 3384, 3380, 3375, 3371, 3367, 3362, 3358,
-		3354, 3349, 3345, 3341, 3336, 3332, 3327, 3323,
-		3319, 3314, 3310, 3305, 3301, 3296, 3292, 3287,
-		3283, 3279, 3274, 3269, 3265, 3260, 3256, 3251,
-		3247, 3242, 3238, 3233, 3228, 3224, 3219, 3215,
-		3210, 3205, 3201, 3196, 3191, 3187, 3182, 3177,
-		3173, 3168, 3163, 3159, 3154, 3149, 3145, 3140,
-		3135, 3130, 3126, 3121, 3116, 3111, 3106, 3102,
-		3097, 3092, 3087, 3082, 3078, 3073, 3068, 3063,
-		3058, 3053, 3048, 3044, 3039, 3034, 3029, 3024,
-		3019, 3014, 3009, 3004, 2999, 2994, 2989, 2984,
-		2980, 2975, 2970, 2965, 2960, 2955, 2950, 2945,
-		2940, 2935, 2930, 2924, 2919, 2914, 2909, 2904,
-		2899, 2894, 2889, 2884, 2879, 2874, 2869, 2864,
-		2859, 2853, 2848, 2843, 2838, 2833, 2828, 2823,
-		2817, 2812, 2807, 2802, 2797, 2792, 2786, 2781,
-		2776, 2771, 2766, 2760, 2755, 2750, 2745, 2740,
-		2734, 2729, 2724, 2719, 2713, 2708, 2703, 2698,
-		2692, 2687, 2682, 2676, 2671, 2666, 2661, 2655,
-		2650, 2645, 2639, 2634, 2629, 2623, 2618, 2613,
-		2607, 2602, 2597, 2591, 2586, 2581, 2575, 2570,
-		2565, 2559, 2554, 2549, 2543, 2538, 2532, 2527,
-		2522, 2516, 2511, 2505, 2500, 2495, 2489, 2484,
-		2478, 2473, 2467, 2462, 2457, 2451, 2446, 2440,
-		2435, 2429, 2424, 2419, 2413, 2408, 2402, 2397,
-		2391, 2386, 2380, 2375, 2369, 2364, 2358, 2353,
-		2347, 2342, 2336, 2331, 2325, 2320, 2314, 2309,
-		2304, 2298, 2292, 2287, 2281, 2276, 2270, 2265,
-		2259, 2254, 2248, 2243, 2237, 2232, 2226, 2221,
-		2215, 2210, 2204, 2199, 2193, 2188, 2182, 2177,
-		2171, 2165, 2160, 2154, 2149, 2143, 2138, 2132,
-		2127, 2121, 2116, 2110, 2105, 2099, 2093, 2088,
-		2082, 2077, 2071, 2066, 2060, 2055, 2049, 2043,
-		2038, 2032, 2027, 2021, 2016, 2010, 2005, 1999,
-		1993, 1988, 1982, 1977, 1971, 1966, 1960, 1955,
-		1949, 1943, 1938, 1932, 1927, 1921, 1916, 1910,
-		1905, 1899, 1893, 1888, 1882, 1877, 1871, 1866,
-		1860, 1855, 1849, 1844, 1838, 1832, 1827, 1821,
-		1816, 1810, 1805, 1799, 1794, 1788, 1783, 1777,
-		1772, 1766, 1761, 1755, 1749, 1744, 1738, 1733,
-		1727, 1722, 1716, 1711, 1705, 1700, 1694, 1689,
-		1683, 1678, 1672, 1667, 1661, 1656, 1650, 1645,
-		1639, 1634, 1628, 1623, 1617, 1612, 1606, 1601,
-		1596, 1590, 1585, 1579, 1574, 1568, 1563, 1557,
-		1552, 1546, 1541, 1535, 1530, 1525, 1519, 1514,
-		1508, 1503, 1497, 1492, 1487, 1481, 1476, 1470,
-		1465, 1460, 1454, 1449, 1443, 1438, 1433, 1427,
-		1422, 1417, 1411, 1406, 1400, 1395, 1390, 1384,
-		1379, 1374, 1368, 1363, 1358, 1352, 1347, 1342,
-		1336, 1331, 1326, 1321, 1315, 1310, 1305, 1299,
-		1294, 1289, 1284, 1278, 1273, 1268, 1262, 1257,
-		1252, 1247, 1242, 1236, 1231, 1226, 1221, 1215,
-		1210, 1205, 1200, 1195, 1189, 1184, 1179, 1174,
-		1169, 1164, 1158, 1153, 1148, 1143, 1138, 1133,
-		1128, 1122, 1117, 1112, 1107, 1102, 1097, 1092,
-		1087, 1082, 1077, 1072, 1067, 1062, 1056, 1051,
-		1046, 1041, 1036, 1031, 1026, 1021, 1016, 1011,
-		1006, 1001,  996,  991,  986,  982,  977,  972,
-		967,  962,  957,  952,  947,  942,  937,  932,
-		928,  923,  918,  913,  908,  903,  898,  894,
-		889,  884,  879,  874,  870,  865,  860,  855,
-		850,  846,  841,  836,  831,  827,  822,  817,
-		813,  808,  803,  798,  794,  789,  784,  780,
-		775,  771,  766,  761,  757,  752,  747,  743,
-		738,  734,  729,  725,  720,  716,  711,  707,
-		702,  698,  693,  689,  684,  680,  675,  671,
-		666,  662,  657,  653,  649,  644,  640,  635,
-		631,  627,  622,  618,  614,  609,  605,  601,
-		596,  592,  588,  584,  579,  575,  571,  567,
-		562,  558,  554,  550,  546,  541,  537,  533,
-		529,  525,  521,  516,  512,  508,  504,  500,
-		496,  492,  488,  484,  480,  476,  472,  468,
-		464,  460,  456,  452,  448,  444,  440,  436,
-		432,  429,  425,  421,  417,  413,  409,  405,
-		402,  398,  394,  390,  386,  383,  379,  375,
-		372,  368,  364,  360,  357,  353,  349,  346,
-		342,  338,  335,  331,  328,  324,  321,  317,
-		313,  310,  306,  303,  299,  296,  292,  289,
-		286,  282,  279,  275,  272,  269,  265,  262,
-		258,  255,  252,  248,  245,  242,  239,  235,
-		232,  229,  226,  222,  219,  216,  213,  210,
-		207,  203,  200,  197,  194,  191,  188,  185,
-		182,  179,  176,  173,  170,  167,  164,  161,
-		158,  155,  152,  149,  146,  144,  141,  138,
-		135,  132,  129,  127,  124,  121,  118,  116,
-		113,  110,  107,  105,  102,   99,   97,   94,
-		92,   89,   86,   84,   81,   79,   76,   74,
-		71,   69,   66,   64,   61,   59,   57,   54,
-		52,   50,   47,   45,   43,   40,   38,   36,
-		33,   31,   29,   27,   25,   22,   20,   18,
-		16,   14,   12,   10,    8,    6,    4,    2
-	},
-	{
-		0,   -1,   -3,   -5,   -7,   -9,  -11,  -13,
-		-15,  -17,  -19,  -20,  -23,  -25,  -27,  -28,
-		-30,  -33,  -34,  -36,  -39,  -40,  -42,  -43,
-		-45,  -46,  -49,  -50,  -52,  -54,  -56,  -58,
-		-60,  -61,  -62,  -65,  -66,  -68,  -70,  -72,
-		-73,  -74,  -77,  -78,  -80,  -82,  -83,  -85,
-		-87,  -89,  -90,  -92,  -93,  -95,  -96,  -98,
-		-100, -102, -103, -105, -106, -107, -108, -110,
-		-112, -114, -116, -116, -118, -120, -122, -122,
-		-124, -126, -127, -128, -130, -131, -133, -133,
-		-136, -137, -138, -139, -141, -142, -144, -145,
-		-147, -147, -150, -151, -151, -153, -155, -156,
-		-157, -159, -160, -161, -163, -164, -165, -166,
-		-168, -168, -170, -171, -172, -174, -174, -176,
-		-177, -178, -180, -181, -182, -183, -184, -185,
-		-187, -188, -189, -190, -191, -192, -193, -195,
-		-196, -196, -198, -199, -200, -200, -202, -204,
-		-204, -205, -206, -207, -208, -209, -211, -212,
-		-212, -213, -214, -215, -216, -217, -218, -220,
-		-220, -221, -222, -223, -224, -225, -225, -227,
-		-227, -228, -229, -230, -230, -231, -233, -234,
-		-234, -235, -235, -237, -238, -239, -239, -240,
-		-240, -242, -242, -243, -243, -245, -246, -247,
-		-247, -249, -248, -249, -250, -251, -251, -253,
-		-253, -253, -255, -255, -256, -256, -257, -258,
-		-259, -259, -260, -261, -261, -262, -262, -264,
-		-263, -265, -265, -265, -266, -267, -267, -268,
-		-269, -269, -269, -270, -271, -271, -272, -273,
-		-273, -273, -274, -274, -276, -275, -276, -277,
-		-277, -278, -278, -278, -279, -279, -280, -281,
-		-280, -281, -282, -283, -283, -282, -284, -284,
-		-284, -285, -285, -286, -286, -286, -287, -287,
-		-288, -288, -288, -289, -289, -289, -290, -290,
-		-290, -291, -291, -292, -291, -291, -292, -292,
-		-292, -293, -293, -293, -294, -294, -295, -295,
-		-294, -295, -295, -296, -297, -297, -297, -297,
-		-297, -297, -298, -298, -297, -298, -298, -298,
-		-299, -299, -300, -299, -299, -300, -299, -300,
-		-301, -300, -300, -301, -300, -301, -301, -301,
-		-301, -301, -302, -301, -302, -301, -302, -302,
-		-302, -302, -302, -302, -302, -302, -303, -302,
-		-303, -302, -303, -303, -302, -303, -303, -303,
-		-302, -303, -303, -302, -303, -303, -302, -303,
-		-303, -302, -303, -303, -302, -303, -303, -303,
-		-303, -302, -303, -303, -302, -302, -302, -303,
-		-302, -302, -302, -301, -303, -302, -301, -302,
-		-301, -301, -301, -302, -301, -301, -301, -300,
-		-301, -300, -300, -300, -300, -299, -300, -299,
-		-300, -300, -299, -300, -299, -299, -299, -299,
-		-298, -299, -298, -297, -297, -297, -296, -297,
-		-296, -296, -296, -296, -295, -296, -295, -296,
-		-295, -294, -294, -294, -293, -294, -294, -293,
-		-293, -292, -293, -292, -292, -292, -291, -290,
-		-291, -290, -291, -289, -289, -290, -289, -289,
-		-288, -288, -288, -288, -286, -287, -286, -286,
-		-286, -285, -286, -284, -284, -284, -284, -283,
-		-283, -283, -282, -282, -282, -281, -280, -281,
-		-279, -280, -280, -278, -279, -278, -278, -277,
-		-278, -276, -276, -277, -275, -276, -274, -275,
-		-274, -273, -273, -272, -273, -272, -272, -271,
-		-270, -270, -269, -269, -269, -268, -268, -267,
-		-267, -266, -266, -266, -265, -265, -264, -264,
-		-263, -263, -262, -262, -261, -261, -260, -260,
-		-259, -259, -258, -258, -257, -257, -256, -256,
-		-256, -255, -254, -254, -253, -253, -252, -252,
-		-251, -251, -250, -250, -249, -249, -248, -248,
-		-247, -247, -246, -246, -245, -245, -244, -244,
-		-243, -242, -242, -241, -241, -240, -239, -239,
-		-239, -238, -238, -237, -237, -235, -235, -235,
-		-234, -234, -232, -233, -232, -232, -231, -229,
-		-230, -229, -228, -228, -227, -226, -227, -225,
-		-224, -225, -223, -223, -222, -222, -221, -221,
-		-220, -219, -219, -218, -218, -216, -217, -216,
-		-215, -215, -214, -213, -212, -213, -211, -211,
-		-210, -210, -209, -209, -208, -206, -207, -206,
-		-205, -204, -204, -204, -203, -202, -202, -200,
-		-200, -200, -200, -198, -197, -197, -196, -195,
-		-195, -195, -194, -194, -192, -192, -191, -191,
-		-189, -189, -188, -188, -187, -186, -186, -186,
-		-185, -185, -183, -183, -182, -182, -181, -181,
-		-180, -178, -178, -177, -177, -176, -176, -174,
-		-174, -173, -173, -172, -172, -172, -170, -170,
-		-168, -168, -167, -167, -167, -165, -165, -164,
-		-164, -164, -162, -162, -161, -160, -160, -158,
-		-158, -158, -157, -156, -155, -155, -154, -153,
-		-153, -152, -151, -151, -150, -149, -149, -148,
-		-147, -147, -146, -146, -144, -144, -144, -142,
-		-142, -141, -142, -140, -140, -139, -138, -138,
-		-137, -136, -136, -134, -134, -133, -134, -132,
-		-132, -131, -130, -130, -128, -128, -128, -127,
-		-127, -126, -124, -124, -124, -123, -123, -122,
-		-121, -120, -120, -119, -118, -118, -117, -117,
-		-116, -115, -115, -115, -114, -113, -111, -111,
-		-110, -110, -109, -109, -108, -107, -107, -106,
-		-105, -104, -104, -103, -102, -103, -102, -101,
-		-101, -100,  -99,  -99,  -98,  -97,  -97,  -96,
-		-96,  -95,  -94,  -94,  -93,  -92,  -92,  -91,
-		-91,  -90,  -89,  -88,  -88,  -88,  -87,  -86,
-		-85,  -86,  -84,  -84,  -83,  -82,  -82,  -81,
-		-81,  -80,  -80,  -78,  -79,  -77,  -77,  -77,
-		-76,  -76,  -75,  -74,  -74,  -73,  -72,  -72,
-		-72,  -71,  -70,  -70,  -69,  -68,  -68,  -68,
-		-66,  -67,  -66,  -65,  -65,  -65,  -63,  -63,
-		-62,  -62,  -61,  -61,  -60,  -60,  -60,  -58,
-		-58,  -58,  -56,  -56,  -56,  -55,  -54,  -55,
-		-54,  -54,  -53,  -52,  -51,  -51,  -51,  -50,
-		-49,  -49,  -49,  -49,  -48,  -47,  -46,  -46,
-		-46,  -46,  -45,  -43,  -43,  -43,  -43,  -42,
-		-42,  -42,  -40,  -40,  -40,  -39,  -39,  -38,
-		-38,  -38,  -37,  -37,  -36,  -36,  -35,  -35,
-		-34,  -35,  -34,  -33,  -33,  -32,  -32,  -31,
-		-31,  -31,  -30,  -29,  -29,  -29,  -28,  -27,
-		-28,  -28,  -27,  -26,  -26,  -25,  -25,  -25,
-		-24,  -24,  -24,  -23,  -23,  -22,  -22,  -22,
-		-21,  -21,  -20,  -20,  -20,  -20,  -19,  -18,
-		-19,  -18,  -18,  -17,  -18,  -17,  -16,  -17,
-		-16,  -15,  -15,  -15,  -14,  -14,  -15,  -13,
-		-13,  -13,  -13,  -12,  -12,  -11,  -12,  -11,
-		-12,  -10,  -10,  -10,  -10,  -10,   -9,  -10,
-		-9,   -9,   -9,   -8,   -8,   -7,   -8,   -7,
-		-7,   -7,   -6,   -6,   -6,   -7,   -6,   -6,
-		-5,   -5,   -5,   -5,   -5,   -4,   -4,   -5,
-		-4,   -4,   -3,   -3,   -3,   -3,   -3,   -2,
-		-3,   -2,   -2,   -2,   -1,   -2,   -1,   -2,
-		-1,   -1,   -1,   -1,   -1,    0,   -1,    0,
-		-1,   -1,    0,    0,   -1,    0,    0,   -1,
-		1,    1,    0,    0,    0,    1,    0,    0,
-		0,    0,    0,    0,    0,    0,    0,    0
-	}
-};
-#else   /* defined(CONFIG_CSI2_PLUS) */
 static const int zoom_table[4][HRT_GDC_N] = {
 	{
 		0 << 4,   0 << 4,   0 << 4,   0 << 4,   0 << 4,   0 << 4,   0 << 4,   0 << 4,
@@ -1194,7 +662,6 @@ static const int zoom_table[4][HRT_GDC_N] = {
 		  0 << 4,   0 << 4,   0 << 4,   0 << 4,   0 << 4,   0 << 4,   0 << 4,   0 << 4
 	}
 };
-#endif
 
 static const struct ia_css_dz_config default_dz_config = {
 	HRT_GDC_N,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 9f681b2e9f99..02f5a73b4096 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -17,7 +17,7 @@
 
 #include "sh_css_sp.h"
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 #include "input_formatter.h"
 #endif
 
@@ -227,7 +227,7 @@ sh_css_sp_start_binary_copy(unsigned int pipe_num,
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe->pipe_id, pipe->inout_port_config);
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 	sh_css_sp_group.config.input_formatter.isp_2ppc = (uint8_t)two_ppc;
 #else
 	(void)two_ppc;
@@ -305,7 +305,7 @@ sh_css_sp_start_raw_copy(struct ia_css_frame *out_frame,
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe->pipe_id, pipe->inout_port_config);
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 	sh_css_sp_group.config.input_formatter.isp_2ppc = (uint8_t)two_ppc;
 #else
 	(void)two_ppc;
@@ -636,7 +636,7 @@ set_view_finder_buffer(const struct ia_css_frame *frame) {
 	return 0;
 }
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 void sh_css_sp_set_if_configs(
     const input_formatter_cfg_t	*config_a,
     const input_formatter_cfg_t	*config_b,
@@ -660,7 +660,7 @@ void sh_css_sp_set_if_configs(
 }
 #endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 void
 sh_css_sp_program_input_circuit(int fmt_type,
 				int ch_id,
@@ -679,7 +679,7 @@ sh_css_sp_program_input_circuit(int fmt_type,
 }
 #endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 void
 sh_css_sp_configure_sync_gen(int width, int height,
 			     int hblank_cycles,
@@ -760,7 +760,7 @@ sh_css_sp_init_group(bool two_ppc,
 		     bool no_isp_sync,
 		     uint8_t if_config_index)
 {
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 	sh_css_sp_group.config.input_formatter.isp_2ppc = two_ppc;
 #else
 	(void)two_ppc;
@@ -769,7 +769,7 @@ sh_css_sp_init_group(bool two_ppc,
 	sh_css_sp_group.config.no_isp_sync = (uint8_t)no_isp_sync;
 	/* decide whether the frame is processed online or offline */
 	if (if_config_index == SH_CSS_IF_CONFIG_NOT_NEEDED) return;
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 	assert(if_config_index < SH_CSS_MAX_IF_CONFIGS);
 	sh_css_sp_group.config.input_formatter.set[if_config_index].stream_format =
 	    input_format;
@@ -934,7 +934,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 		return 0;
 	}
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(ISP2401)
 	(void)continuous;
 	sh_css_sp_stage.deinterleaved = 0;
 #else
@@ -1019,7 +1019,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	if (err)
 		return err;
 
-#ifdef USE_INPUT_SYSTEM_VERSION_2401
+#ifdef ISP2401
 	if (stage == 0) {
 		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
 		if (!pipe)
@@ -1255,12 +1255,10 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 				     offline, if_config_index);
 	} /* if (first_binary != NULL) */
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2401) || defined(USE_INPUT_SYSTEM_VERSION_2)
 	/* Signal the host immediately after start for SP_ISYS_COPY only */
 	if ((me->num_stages == 1) && me->stages &&
 	    (me->stages->sp_func == IA_CSS_PIPELINE_ISYS_COPY))
 		sh_css_sp_group.config.no_isp_sync = true;
-#endif
 
 	/* Init stage data */
 	sh_css_init_host2sp_frame_data();
@@ -1467,7 +1465,6 @@ sh_css_update_host2sp_offline_frame(
 	store_sp_array_uint(host_sp_com, offset, metadata ? metadata->address : 0);
 }
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 /*
  * @brief Update the mipi frame information in host_sp_communication.
  * Refer to "sh_css_sp.h" for more details.
@@ -1532,7 +1529,6 @@ sh_css_update_host2sp_num_mipi_frames(unsigned int num_frames)
 
 	store_sp_array_uint(host_sp_com, offset, num_frames);
 }
-#endif
 
 void
 sh_css_update_host2sp_cont_num_raw_frames(unsigned int num_frames,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.h b/drivers/staging/media/atomisp/pci/sh_css_sp.h
index 18a1fefda4b5..832eed711525 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.h
@@ -18,7 +18,7 @@
 
 #include <system_global.h>
 #include <type_support.h>
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 #include "input_formatter.h"
 #endif
 
@@ -96,7 +96,6 @@ sh_css_update_host2sp_offline_frame(
     struct ia_css_frame *frame,
     struct ia_css_metadata *metadata);
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 /**
  * @brief Update the mipi frame information in host_sp_communication.
  *
@@ -126,7 +125,6 @@ sh_css_update_host2sp_mipi_metadata(
  */
 void
 sh_css_update_host2sp_num_mipi_frames(unsigned int num_frames);
-#endif
 
 /**
  * @brief Update the nr of offline frames to use in host_sp_communication.
@@ -156,7 +154,7 @@ sh_css_sp_get_debug_state(struct sh_css_sp_debug_state *state);
 
 #endif
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 void
 sh_css_sp_set_if_configs(
     const input_formatter_cfg_t	*config_a,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_struct.h b/drivers/staging/media/atomisp/pci/sh_css_struct.h
index bd260252317a..eb8960ebae34 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_struct.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_struct.h
@@ -55,7 +55,6 @@ struct sh_css {
 
 	bool                           check_system_idle;
 	unsigned int                   num_cont_raw_frames;
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	unsigned int                   num_mipi_frames[N_CSI_PORTS];
 	struct ia_css_frame
 		*mipi_frames[N_CSI_PORTS][NUM_MIPI_FRAMES_PER_STREAM];
@@ -64,7 +63,6 @@ struct sh_css {
 	unsigned int
 	mipi_sizes_for_check[N_CSI_PORTS][IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT];
 	unsigned int                   mipi_frame_size[N_CSI_PORTS];
-#endif
 	ia_css_ptr                   sp_bin_addr;
 	hrt_data                       page_table_base_index;
 
diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 90210f6943d2..9b22b8c168be 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -25,23 +25,6 @@
  * N.B. the 3 input formatters are of 2 different classess
  */
 
-#define HAS_MMU_VERSION_2
-#define HAS_DMA_VERSION_2
-#define HAS_GDC_VERSION_2
-#define HAS_VAMEM_VERSION_2
-#define HAS_HMEM_VERSION_1
-#define HAS_BAMEM_VERSION_2
-#define HAS_IRQ_VERSION_2
-#define HAS_IRQ_MAP_VERSION_2
-#define HAS_INPUT_FORMATTER_VERSION_2
-#define HAS_INPUT_SYSTEM_VERSION_2
-#define HAS_BUFFERED_SENSOR
-#define HAS_FIFO_MONITORS_VERSION_2
-#define HAS_GP_DEVICE_VERSION_2
-#define HAS_GPIO_VERSION_1
-#define HAS_TIMED_CTRL_VERSION_1
-#define HAS_RX_VERSION_2
-
 /* per-frame parameter handling support */
 #define SH_CSS_ENABLE_PER_FRAME_PARAMS
 
@@ -64,12 +47,6 @@
 #define ISP2400_DMA_MAX_BURST_LENGTH	128
 #define ISP2401_DMA_MAX_BURST_LENGTH	2
 
-#ifdef ISP2401
-#  include "isp2401_system_global.h"
-#else
-#  include "isp2400_system_global.h"
-#endif
-
 #include <hive_isp_css_defs.h>
 #include <type_support.h>
 
-- 
2.26.2

