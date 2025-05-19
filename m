Return-Path: <linux-media+bounces-32832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A6CABC320
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 17:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7817A7A2F83
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568792882BC;
	Mon, 19 May 2025 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYJTriVl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975128642D;
	Mon, 19 May 2025 15:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669837; cv=none; b=q/06ilqyo5mHPGPE1DtrjP6dL+niNbixdwfOPRPLiXymdWG/MxQWniDizUXRm8+3ChD+Pgh3ZVwOc5YpFZkEt6f8SRwexRHESz3GCTMvfGhkq7GNbfg80vH8WXMi2GxoCGPGm6e+wvwKsO2ipwwxJs9sOB019T5Y0uW1M5mLzSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669837; c=relaxed/simple;
	bh=jeIPyjQvqCHdg0uMfjyPdnBY0HddoOjHz/j+0oOxyDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukl57y3LkIbeC2ktUDzXyws1vGgNjFZFlLb28UsEohT01eXBeSKa36ox5Dqw15lurWu5K/jWzi+z0hD0+4cImQ0UmmtAg2JnIeA9kRKQYsVfUfZA+28S4sTgL93FUo9ZmtNtGjc3AuNjlO5oKxotHqR6Q6NiPeiR7BjMt5rSSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYJTriVl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669836; x=1779205836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jeIPyjQvqCHdg0uMfjyPdnBY0HddoOjHz/j+0oOxyDQ=;
  b=mYJTriVlEGyHm2a1axpgP7ASKIm7MNaGUqjHSFiA8Xy/AYgzDa0AMmjt
   IwD41mf/aozw253/QuheGlisOyQnq0KFQgdPI1EBcy6VwPFLaQdo9mYNu
   ogqHHXNIDrU9dfRo79tRQ88sg/X3BhoSd55hWHTdtwDY9MpjVQ5Z0Sbev
   MrxJfRw5a8VDkluP5SOgxvOtwRbSBAPzpSzk92BhSTZgYbCgenJNPbl7q
   e0V4uFTOOygJLHiiPxt0jQ3Do38bjNIG02jO66Kas/rHcU1Z/k62mqmWl
   15vDXs2C1T3F7BjddKSRoITJYijsTsdJODI4vfWA70gHkmTIaGMO57S5s
   Q==;
X-CSE-ConnectionGUID: 01QHs3G8QVS4IZWBMw3GlQ==
X-CSE-MsgGUID: +vt4x52XRf+LnL8/RRrtPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72082166"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="72082166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:50:34 -0700
X-CSE-ConnectionGUID: 49pltkCGTFeJzPwIcX/IRA==
X-CSE-MsgGUID: ki1ml3T4TcSbl7+IIb69HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="140302021"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2025 08:50:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7570E256; Mon, 19 May 2025 18:50:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/3] media: atomisp: Replace macros from math_support.h
Date: Mon, 19 May 2025 18:46:48 +0300
Message-ID: <20250519155028.526453-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
References: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace rarely used macros by generic ones from Linux kernel headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../kernels/anr/anr_1.0/ia_css_anr_types.h    |  4 ++-
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h  |  6 ++--
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  4 +--
 .../isp/kernels/eed1_8/ia_css_eed1_8_param.h  | 22 +++++++-------
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c |  6 ++--
 .../isp/kernels/sc/sc_1.0/ia_css_sc_param.h   |  2 +-
 .../pci/isp/modes/interface/input_buf.isp.h   |  5 +++-
 .../pci/runtime/debug/src/ia_css_debug.c      |  1 -
 .../atomisp/pci/runtime/frame/src/frame.c     | 29 ++++++++++---------
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     | 11 ++++---
 .../pci/runtime/isys/src/virtual_isys.c       |  2 +-
 .../staging/media/atomisp/pci/sh_css_defs.h   | 12 ++++----
 .../media/atomisp/pci/sh_css_internal.h       |  8 ++---
 .../media/atomisp/pci/sh_css_param_dvs.h      | 19 +++++++-----
 .../staging/media/atomisp/pci/sh_css_params.c | 12 ++++----
 15 files changed, 77 insertions(+), 66 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
index 6e573ceaa9ea..bc2a78dff004 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
@@ -11,9 +11,11 @@
  * CSS-API header file for Advanced Noise Reduction kernel v1
  */
 
+#include <linux/math.h>
+
 /* Application specific DMA settings  */
 #define ANR_BPP                 10
-#define ANR_ELEMENT_BITS        ((CEIL_DIV(ANR_BPP, 8)) * 8)
+#define ANR_ELEMENT_BITS        round_up(ANR_BPP, 8)
 
 /* Advanced Noise Reduction configuration.
  *  This is also known as Low-Light.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h
index 099f32b8de1a..b1bbc283e367 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h
@@ -7,6 +7,8 @@
 #ifndef __IA_CSS_DPC2_PARAM_H
 #define __IA_CSS_DPC2_PARAM_H
 
+#include <linux/math.h>
+
 #include "type_support.h"
 #include "vmem.h" /* for VMEM_ARRAY*/
 
@@ -19,12 +21,12 @@
 /* 3 lines state per color plane input_line_state */
 #define DPC2_STATE_INPUT_BUFFER_HEIGHT	(3 * NUM_PLANES)
 /* Each plane has width equal to half frame line */
-#define DPC2_STATE_INPUT_BUFFER_WIDTH	CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define DPC2_STATE_INPUT_BUFFER_WIDTH	DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 1 line state per color plane for local deviation state*/
 #define DPC2_STATE_LOCAL_DEVIATION_BUFFER_HEIGHT	(1 * NUM_PLANES)
 /* Each plane has width equal to half frame line */
-#define DPC2_STATE_LOCAL_DEVIATION_BUFFER_WIDTH		CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define DPC2_STATE_LOCAL_DEVIATION_BUFFER_WIDTH		DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* MINMAX state buffer stores 1 full input line (GR-R color line) */
 #define DPC2_STATE_SECOND_MINMAX_BUFFER_HEIGHT	1
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index 30c84639d7e8..e9d6dd0bbfe2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -141,10 +141,10 @@ convert_coords_to_ispparams(
 
 			/* similar to topleft_y calculation, but round up if ymax
 			 * has any fraction bits */
-			bottom_y = CEIL_DIV(ymax, 1 << DVS_COORD_FRAC_BITS);
+			bottom_y = DIV_ROUND_UP(ymax, BIT(DVS_COORD_FRAC_BITS));
 			s.in_block_height = bottom_y - topleft_y + dvs_interp_envelope;
 
-			bottom_x = CEIL_DIV(xmax, 1 << DVS_COORD_FRAC_BITS);
+			bottom_x = DIV_ROUND_UP(xmax, BIT(DVS_COORD_FRAC_BITS));
 			s.in_block_width = bottom_x - topleft_x + dvs_interp_envelope;
 
 			topleft_x_frac = topleft_x << (DVS_COORD_FRAC_BITS);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
index df87770446dd..a24eef965f16 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
@@ -7,6 +7,8 @@
 #ifndef __IA_CSS_EED1_8_PARAM_H
 #define __IA_CSS_EED1_8_PARAM_H
 
+#include <linux/math.h>
+
 #include "type_support.h"
 #include "vmem.h" /* needed for VMEM_ARRAY */
 
@@ -35,35 +37,35 @@
 #define EED1_8_STATE_INPUT_BUFFER_HEIGHT	(5 * NUM_PLANES)
 
 /* Each plane has width equal to half frame line */
-#define EED1_8_STATE_INPUT_BUFFER_WIDTH	CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_INPUT_BUFFER_WIDTH	DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 1 line state per color plane LD_H state */
 #define EED1_8_STATE_LD_H_HEIGHT	(1 * NUM_PLANES)
-#define EED1_8_STATE_LD_H_WIDTH		CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_LD_H_WIDTH		DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 1 line state per color plane LD_V state */
 #define EED1_8_STATE_LD_V_HEIGHT	(1 * NUM_PLANES)
-#define EED1_8_STATE_LD_V_WIDTH		CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_LD_V_WIDTH		DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 1 line (single plane) state for D_Hr state */
 #define EED1_8_STATE_D_HR_HEIGHT	1
-#define EED1_8_STATE_D_HR_WIDTH		CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_D_HR_WIDTH		DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 1 line (single plane) state for D_Hb state */
 #define EED1_8_STATE_D_HB_HEIGHT	1
-#define EED1_8_STATE_D_HB_WIDTH		CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_D_HB_WIDTH		DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 2 lines (single plane) state for D_Vr state */
 #define EED1_8_STATE_D_VR_HEIGHT	2
-#define EED1_8_STATE_D_VR_WIDTH		CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_D_VR_WIDTH		DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 2 line (single plane) state for D_Vb state */
 #define EED1_8_STATE_D_VB_HEIGHT	2
-#define EED1_8_STATE_D_VB_WIDTH		CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_D_VB_WIDTH		DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 2 lines state for R and B (= 2 planes) rb_zipped_state */
 #define EED1_8_STATE_RB_ZIPPED_HEIGHT	(2 * 2)
-#define EED1_8_STATE_RB_ZIPPED_WIDTH	CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_RB_ZIPPED_WIDTH	DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 #if EED1_8_FC_ENABLE_MEDIAN
 /* 1 full input line (GR-R color line) for Yc state */
@@ -72,11 +74,11 @@
 
 /* 1 line state per color plane Cg_state */
 #define EED1_8_STATE_CG_HEIGHT	(1 * NUM_PLANES)
-#define EED1_8_STATE_CG_WIDTH	CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_CG_WIDTH	DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 1 line state per color plane Co_state */
 #define EED1_8_STATE_CO_HEIGHT	(1 * NUM_PLANES)
-#define EED1_8_STATE_CO_WIDTH	CEIL_DIV(MAX_FRAME_SIMDWIDTH, 2)
+#define EED1_8_STATE_CO_WIDTH	DIV_ROUND_UP(MAX_FRAME_SIMDWIDTH, 2)
 
 /* 1 full input line (GR-R color line) for AbsK state */
 #define EED1_8_STATE_ABSK_HEIGHT	1
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index b34feba5340b..e701b7e41ef4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include <linux/math.h>
+
 #include <assert_support.h>
 #include <ia_css_frame_public.h>
 #include <ia_css_frame.h>
@@ -71,9 +73,9 @@ int ia_css_fpn_configure(const struct ia_css_binary     *binary,
 		&my_info
 	};
 
-	my_info.res.width       = CEIL_DIV(info->res.width, 2);		/* Packed by 2x */
+	my_info.res.width       = DIV_ROUND_UP(info->res.width, 2);	/* Packed by 2x */
 	my_info.res.height      = info->res.height;
-	my_info.padded_width    = CEIL_DIV(info->padded_width, 2);	/* Packed by 2x */
+	my_info.padded_width    = DIV_ROUND_UP(info->padded_width, 2);	/* Packed by 2x */
 	my_info.format          = info->format;
 	my_info.raw_bit_depth   = FPN_BITS_PER_PIXEL;
 	my_info.raw_bayer_order = info->raw_bayer_order;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
index 61e9c04d2515..b49761ad39ca 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
@@ -22,7 +22,7 @@ struct sh_css_isp_sc_params {
  * vec_slice is used for 2 adjacent vectors of shading gains.
  * The number of shift times by vec_slice is 8.
  *     Max grid cell bqs to support the shading table centerting: N = 32
- *     CEIL_DIV(N-1, ISP_SLICE_NELEMS) = CEIL_DIV(31, 4) = 8
+ *     DIV_ROUND_UP(N-1, ISP_SLICE_NELEMS) = DIV_ROUND_UP(31, 4) = 8
  */
 #define SH_CSS_SC_INTERPED_GAIN_HOR_SLICE_TIMES   8
 
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
index 55de6cb02833..6a0257359e69 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
@@ -8,6 +8,8 @@ Copyright (c) 2010 - 2015, Intel Corporation.
 #ifndef _INPUT_BUF_ISP_H_
 #define _INPUT_BUF_ISP_H_
 
+#include <linux/math.h>
+
 /* Temporary include, since IA_CSS_BINARY_MODE_COPY is still needed */
 #include "sh_css_defs.h"
 
@@ -21,7 +23,8 @@ Copyright (c) 2010 - 2015, Intel Corporation.
 /* In continuous mode, the input buffer must be a fixed size for all binaries
  * and at a fixed address since it will be used by the SP. */
 #define EXTRA_INPUT_VECTORS	2 /* For left padding */
-#define MAX_VECTORS_PER_INPUT_LINE_CONT (CEIL_DIV(SH_CSS_MAX_SENSOR_WIDTH, ISP_NWAY) + EXTRA_INPUT_VECTORS)
+#define MAX_VECTORS_PER_INPUT_LINE_CONT						\
+	(DIV_ROUND_UP(SH_CSS_MAX_SENSOR_WIDTH, ISP_NWAY) + EXTRA_INPUT_VECTORS)
 
 /* The input buffer should be on a fixed address in vmem, for continuous capture */
 #define INPUT_BUF_ADDR 0x0
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 84220359c957..b411ca2f415e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -51,7 +51,6 @@
 #include "sp.h"
 #include "isp.h"
 #include "type_support.h"
-#include "math_support.h" /* CEIL_DIV */
 #include "input_system.h"	/* input_formatter_reg_load */
 #include "ia_css_tagger_common.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 4f610f57e6c1..2cb96f9a6030 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -4,15 +4,16 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-#include "hmm.h"
+#include <linux/bitops.h>
+#include <linux/math.h>
 
-#include "ia_css_frame.h"
-#include <math_support.h>
 #include "assert_support.h"
+#include "atomisp_internal.h"
+#include "hmm.h"
 #include "ia_css_debug.h"
+#include "ia_css_frame.h"
 #include "isp.h"
 #include "sh_css_internal.h"
-#include "atomisp_internal.h"
 
 #define NV12_TILEY_TILE_WIDTH  128
 #define NV12_TILEY_TILE_HEIGHT  32
@@ -459,15 +460,16 @@ static void frame_init_single_plane(struct ia_css_frame *frame,
 	unsigned int stride;
 
 	stride = subpixels_per_line * bytes_per_pixel;
-	/* Frame height needs to be even number - needed by hw ISYS2401
-	   In case of odd number, round up to even.
-	   Images won't be impacted by this round up,
-	   only needed by jpeg/embedded data.
-	   As long as buffer allocation and release are using data_bytes,
-	   there won't be memory leak. */
-	frame->data_bytes = stride * CEIL_MUL2(height, 2);
+	/*
+	 * Frame height needs to be even number - needed by hw ISYS2401.
+	 * In case of odd number, round up to even.
+	 * Images won't be impacted by this round up,
+	 * only needed by jpeg/embedded data.
+	 * As long as buffer allocation and release are using data_bytes,
+	 * there won't be memory leak.
+	 */
+	frame->data_bytes = stride * round_up(height, 2);
 	frame_init_plane(plane, subpixels_per_line, stride, height, 0);
-	return;
 }
 
 static void frame_init_raw_single_plane(
@@ -486,7 +488,6 @@ static void frame_init_raw_single_plane(
 			  HIVE_ISP_DDR_WORD_BITS / bits_per_pixel);
 	frame->data_bytes = stride * height;
 	frame_init_plane(plane, subpixels_per_line, stride, height, 0);
-	return;
 }
 
 static void frame_init_nv_planes(struct ia_css_frame *frame,
@@ -690,7 +691,7 @@ ia_css_elems_bytes_from_info(const struct ia_css_frame_info *info)
 	if (info->format == IA_CSS_FRAME_FORMAT_RAW
 	    || (info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED)) {
 		if (info->raw_bit_depth)
-			return CEIL_DIV(info->raw_bit_depth, 8);
+			return BITS_TO_BYTES(info->raw_bit_depth);
 		else
 			return 2; /* bytes per pixel */
 	}
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index d57ffb335fc0..50b0b31d734a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -4,9 +4,9 @@
  * Copyright (c) 2010 - 2015, Intel Corporation.
  */
 
-#include "system_global.h"
-#include <linux/kernel.h>
+#include <linux/math.h>
 
+#include "system_global.h"
 
 #include "ia_css_ifmtr.h"
 #include <math_support.h>
@@ -149,10 +149,9 @@ int ia_css_ifmtr_configure(struct ia_css_stream_config *config,
 		left_padding = 2 * ISP_VEC_NELEMS - config->left_padding;
 
 	if (left_padding) {
-		num_vectors = CEIL_DIV(cropped_width + left_padding,
-				       ISP_VEC_NELEMS);
+		num_vectors = DIV_ROUND_UP(cropped_width + left_padding, ISP_VEC_NELEMS);
 	} else {
-		num_vectors = CEIL_DIV(cropped_width, ISP_VEC_NELEMS);
+		num_vectors = DIV_ROUND_UP(cropped_width, ISP_VEC_NELEMS);
 		num_vectors *= buffer_height;
 		/* todo: in case of left padding,
 		   num_vectors is vectors per line,
@@ -305,7 +304,7 @@ int ia_css_ifmtr_configure(struct ia_css_stream_config *config,
 		if ((!binary) || config->continuous)
 			/* !binary -> sp raw copy pipe */
 			buffer_height *= 2;
-		vectors_per_line = CEIL_DIV(cropped_width, ISP_VEC_NELEMS);
+		vectors_per_line = DIV_ROUND_UP(cropped_width, ISP_VEC_NELEMS);
 		vectors_per_line = CEIL_MUL(vectors_per_line, deinterleaving);
 		break;
 	case ATOMISP_INPUT_FORMAT_RAW_14:
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index b5395aea89fc..e6c11d5f77b4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -808,7 +808,7 @@ static bool calculate_isys2401_dma_port_cfg(
 
 	cfg->elements	= HIVE_ISP_DDR_WORD_BITS / bits_per_pixel;
 	cfg->cropping	= 0;
-	cfg->width	= CEIL_DIV(cfg->stride, HIVE_ISP_DDR_WORD_BYTES);
+	cfg->width	= DIV_ROUND_UP(cfg->stride, HIVE_ISP_DDR_WORD_BYTES);
 
 	return true;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index 51491dfe05cc..7bfeeb8cf053 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -7,12 +7,12 @@
 #ifndef _SH_CSS_DEFS_H_
 #define _SH_CSS_DEFS_H_
 
+#include <linux/math.h>
+
 #include "isp.h"
 
 /*#include "vamem.h"*/ /* Cannot include for VAMEM properties this file is visible on ISP -> pipeline generator */
 
-#include "math_support.h"	/* max(), min, etc etc */
-
 /* ID's for refcount */
 #define IA_CSS_REFCOUNT_PARAM_SET_POOL  0xCAFE0001
 #define IA_CSS_REFCOUNT_PARAM_BUFFER    0xCAFE0002
@@ -182,7 +182,7 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
    The ISP firmware needs these rules to be applied at pre-processor time,
    that's why these are macros, not functions. */
 #define _ISP_BQS(num)  ((num) / 2)
-#define _ISP_VECS(width) CEIL_DIV(width, ISP_VEC_NELEMS)
+#define _ISP_VECS(width) DIV_ROUND_UP(width, ISP_VEC_NELEMS)
 
 #define ISP_BQ_GRID_WIDTH(elements_per_line, deci_factor_log2) \
 	CEIL_SHIFT(elements_per_line / 2,  deci_factor_log2)
@@ -194,9 +194,9 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 /* The morphing table is similar to the shading table in the sense that we
    have 1 more value than we have cells in the grid. */
 #define _ISP_MORPH_TABLE_WIDTH(int_width) \
-	(CEIL_DIV(int_width, SH_CSS_MORPH_TABLE_GRID) + 1)
+	(DIV_ROUND_UP(int_width, SH_CSS_MORPH_TABLE_GRID) + 1)
 #define _ISP_MORPH_TABLE_HEIGHT(int_height) \
-	(CEIL_DIV(int_height, SH_CSS_MORPH_TABLE_GRID) + 1)
+	(DIV_ROUND_UP(int_height, SH_CSS_MORPH_TABLE_GRID) + 1)
 #define _ISP_MORPH_TABLE_ALIGNED_WIDTH(width) \
 	CEIL_MUL(_ISP_MORPH_TABLE_WIDTH(width), \
 		 SH_CSS_MORPH_TABLE_ELEMS_PER_DDR_WORD)
@@ -298,7 +298,7 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 			     c_subsampling, \
 			     num_chunks, \
 			     pipelining) \
-	CEIL_MUL2(CEIL_MUL2(MAX(__ISP_PADDED_OUTPUT_WIDTH(out_width, \
+	round_up(round_up(MAX(__ISP_PADDED_OUTPUT_WIDTH(out_width, \
 							    dvs_env_width, \
 							    left_crop), \
 				  __ISP_MIN_INTERNAL_WIDTH(num_chunks, \
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 7b3483585748..9155a83fcc03 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -8,6 +8,7 @@
 #define _SH_CSS_INTERNAL_H_
 
 #include <linux/build_bug.h>
+#include <linux/math.h>
 #include <linux/stdarg.h>
 
 #include <system_global.h>
@@ -95,7 +96,6 @@
  * the SIZE_OF_XXX macro of the corresponding struct. If they are not
  * equal, functionality will break.
  */
-#define CALC_ALIGNMENT_MEMBER(x, y)	(CEIL_MUL(x, y) - x)
 #define SIZE_OF_HRT_VADDRESS		sizeof(hive_uint32)
 
 /* Number of SP's */
@@ -704,13 +704,11 @@ struct sh_css_hmm_buffer {
 
 /* Do not use sizeof(uint64_t) since that does not exist of SP */
 #define SIZE_OF_SH_CSS_HMM_BUFFER_STRUCT				\
-	(SIZE_OF_PAYLOAD_UNION +					\
-	CALC_ALIGNMENT_MEMBER(SIZE_OF_PAYLOAD_UNION, 8) +		\
+	(round_up(SIZE_OF_PAYLOAD_UNION, 8) +		\
 	8 +						\
 	8 +						\
 	SIZE_OF_IA_CSS_TIME_MEAS_STRUCT +				\
-	SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT +			\
-	CALC_ALIGNMENT_MEMBER(SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT, 8))
+	round_up(SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT, 8))
 
 static_assert(sizeof(struct sh_css_hmm_buffer) == SIZE_OF_SH_CSS_HMM_BUFFER_STRUCT);
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
index fd5cf6038829..b31a0d4e8acb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
@@ -7,6 +7,8 @@
 #ifndef _SH_CSS_PARAMS_DVS_H_
 #define _SH_CSS_PARAMS_DVS_H_
 
+#include <linux/math.h>
+
 #include <math_support.h>
 #include <ia_css_types.h>
 #include "gdc_global.h" /* gdc_warp_param_mem_t */
@@ -20,16 +22,17 @@
 
 /* ISP2400 */
 /* horizontal 64x64 blocks round up to DVS_BLOCKDIM_X, make even */
-#define DVS_NUM_BLOCKS_X(X)		(CEIL_MUL(CEIL_DIV((X), DVS_BLOCKDIM_X), 2))
+#define DVS_NUM_BLOCKS_X(X)		round_up(DIV_ROUND_UP((X), DVS_BLOCKDIM_X), 2)
+#define DVS_NUM_BLOCKS_X_CHROMA(X)	DIV_ROUND_UP((X), DVS_BLOCKDIM_X)
 
 /* ISP2400 */
 /* vertical   64x64 blocks round up to DVS_BLOCKDIM_Y */
-#define DVS_NUM_BLOCKS_Y(X)		(CEIL_DIV((X), DVS_BLOCKDIM_Y_LUMA))
-#define DVS_NUM_BLOCKS_X_CHROMA(X)	(CEIL_DIV((X), DVS_BLOCKDIM_X))
-#define DVS_NUM_BLOCKS_Y_CHROMA(X)	(CEIL_DIV((X), DVS_BLOCKDIM_Y_CHROMA))
+#define DVS_NUM_BLOCKS_Y(X)		DIV_ROUND_UP((X), DVS_BLOCKDIM_Y_LUMA)
+#define DVS_NUM_BLOCKS_Y_CHROMA(X)	DIV_ROUND_UP((X), DVS_BLOCKDIM_Y_CHROMA)
 
-#define DVS_TABLE_IN_BLOCKDIM_X_LUMA(X)	(DVS_NUM_BLOCKS_X(X) + 1)  /* N blocks have N + 1 set of coords */
-#define DVS_TABLE_IN_BLOCKDIM_X_CHROMA(X)   (DVS_NUM_BLOCKS_X_CHROMA(X) + 1)
+/* N blocks have N + 1 set of coords */
+#define DVS_TABLE_IN_BLOCKDIM_X_LUMA(X)		(DVS_NUM_BLOCKS_X(X) + 1)
+#define DVS_TABLE_IN_BLOCKDIM_X_CHROMA(X)	(DVS_NUM_BLOCKS_X_CHROMA(X) + 1)
 #define DVS_TABLE_IN_BLOCKDIM_Y_LUMA(X)		(DVS_NUM_BLOCKS_Y(X) + 1)
 #define DVS_TABLE_IN_BLOCKDIM_Y_CHROMA(X)	(DVS_NUM_BLOCKS_Y_CHROMA(X) + 1)
 
@@ -40,8 +43,8 @@
 
 #define XMEM_ALIGN_LOG2 (5)
 
-#define DVS_6AXIS_COORDS_ELEMS CEIL_MUL(sizeof(gdc_warp_param_mem_t) \
-					, HIVE_ISP_DDR_WORD_BYTES)
+#define DVS_6AXIS_COORDS_ELEMS \
+	round_up(sizeof(gdc_warp_param_mem_t), HIVE_ISP_DDR_WORD_BYTES)
 
 /* currently we only support two output with the same resolution, output 0 is th default one. */
 #define DVS_6AXIS_BYTES(binary) \
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 0d4a936ad80f..11d62313c908 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include <linux/math.h>
+
 #include "gdc_device.h"		/* gdc_lut_store(), ... */
 #include "isp.h"			/* ISP_VEC_ELEMBITS */
 #include "vamem.h"
@@ -21,8 +23,6 @@
 
 #include "platform_support.h"
 #include "assert_support.h"
-#include "misc_support.h"	/* NOT_USED */
-#include "math_support.h"	/* max(), min()  EVEN_FLOOR()*/
 
 #include "ia_css_stream.h"
 #include "sh_css_params_internal.h"
@@ -4042,10 +4042,10 @@ sh_css_update_uds_and_crop_info(
 		}
 
 		/* Must enforce that the crop position is even */
-		crop_x = EVEN_FLOOR(crop_x);
-		crop_y = EVEN_FLOOR(crop_y);
-		uds_xc = EVEN_FLOOR(uds_xc);
-		uds_yc = EVEN_FLOOR(uds_yc);
+		crop_x = round_down(crop_x, 2);
+		crop_y = round_down(crop_y, 2);
+		uds_xc = round_down(uds_xc, 2);
+		uds_yc = round_down(uds_yc, 2);
 
 		uds->xc = (uint16_t)uds_xc;
 		uds->yc = (uint16_t)uds_yc;
-- 
2.47.2


