Return-Path: <linux-media+bounces-18460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19C97E7FB
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E4A01C20F65
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 08:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC71019414E;
	Mon, 23 Sep 2024 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXgRqQFq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FB31940B0;
	Mon, 23 Sep 2024 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727081824; cv=none; b=baUnjjtTUMr6OPwRKQpWDKTg7RanKNrP2GDBtMQKJyColTxFLBTrWxTIYOak0A4XYJKKXkj8xBm//7pYbyUmDd1akNRlu6nXtRECiPEfUyGiKF4M6UHRdIvfRHA/ekRJUse61ZEUZofjsVFR+RGb4YaVLAv4DwuZb5/kcdFxWWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727081824; c=relaxed/simple;
	bh=WTP2vkgSyoi7wDeWKgI7PNUcU1noZoNCYtA9ekWDUEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMiBbzXU4xTiC97YWctNFM6rNTYgc/R4cp5yQJDKqm/BGGDLe1XKrDFrcxgLxiBwrPmGnAOnKofd98P26F279cyuQi1fXqLsowmm3nH4ntVPbrVCgQxrNrbDvI2trZlEQfnDqeJcGJ7nSw/+Hi6XNlxLK9LEgeH/NHaGXZOqiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXgRqQFq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727081821; x=1758617821;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WTP2vkgSyoi7wDeWKgI7PNUcU1noZoNCYtA9ekWDUEU=;
  b=DXgRqQFq/PTNU6Aj93kT/byJTlymkU261A2rz8JiTPMiEyMTHUeI0fe5
   HA9850tW5coD4ohhY+rjViGQcPFGmpU6Nnnt+PybsfDwhKE0Ln+ksLFSO
   Y2+IQoyOxArQDFcM4dCPwzGFDno4RMIx9Zlrx13nKoFAE3Q+yLN/34jBk
   O67rArCbw+6p01lb4qg2BbxD/5FR3KVpc//k3Lf657aSdAJA4NySB1l41
   /vSje4Y0UK1l7dNE15irOrmwHVraBGgd+LkWM2a4nZLJlkrBX1XcLCb0z
   lDORgeR3nM+N6G0W8aI3gn/4x3CWZTRQw2TB94p2nej1sZcgHl76vzELO
   Q==;
X-CSE-ConnectionGUID: 9kfbcLkiQfWMQBUAXuliOw==
X-CSE-MsgGUID: dqEEZfi5QS+DxqjeQDu8rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25537173"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25537173"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:57:00 -0700
X-CSE-ConnectionGUID: v3S5j/8zQcWJ2TgLxSiw4Q==
X-CSE-MsgGUID: hT0FUBvVQQKgk8UNH2VMxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71272977"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2024 01:56:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2A69E2CC; Mon, 23 Sep 2024 11:56:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [rft, PATCH v1 1/1] media: atomisp: Replace macros from math_support.h
Date: Mon, 23 Sep 2024 11:56:06 +0300
Message-ID: <20240923085652.3457117-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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

Please, apply only after tests that confirm everything is working
as expected.

 .../media/atomisp/pci/atomisp_compat_css20.c  | 15 ++++----
 .../kernels/anr/anr_1.0/ia_css_anr_types.h    |  4 ++-
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h  |  6 ++--
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  4 +--
 .../isp/kernels/eed1_8/ia_css_eed1_8_param.h  | 22 ++++++------
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c |  6 ++--
 .../isp/kernels/sc/sc_1.0/ia_css_sc_param.h   |  2 +-
 .../pci/isp/modes/interface/input_buf.isp.h   |  5 ++-
 .../pci/isp/modes/interface/isp_const.h       | 32 +++++++++--------
 .../pci/runtime/debug/src/ia_css_debug.c      |  1 -
 .../atomisp/pci/runtime/frame/src/frame.c     | 34 +++++++++----------
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     | 11 +++---
 .../pci/runtime/isys/src/virtual_isys.c       |  2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 10 +++---
 .../staging/media/atomisp/pci/sh_css_defs.h   | 12 +++----
 .../media/atomisp/pci/sh_css_internal.h       |  8 ++---
 .../media/atomisp/pci/sh_css_param_dvs.h      | 19 ++++++-----
 .../media/atomisp/pci/sh_css_param_shading.c  |  4 +--
 .../staging/media/atomisp/pci/sh_css_params.c | 12 +++----
 19 files changed, 110 insertions(+), 99 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index a62a5c0b3c00..cbd57b52e7ea 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -12,10 +12,12 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
- *
  */
 
+#include <linux/io.h>
+#include <linux/math.h>
+#include <linux/pm_runtime.h>
+
 #include <media/v4l2-dev.h>
 #include <media/v4l2-event.h>
 
@@ -36,9 +38,6 @@
 #include "sh_css_hrt.h"
 #include "ia_css_isys.h"
 
-#include <linux/io.h>
-#include <linux/pm_runtime.h>
-
 /* Assume max number of ACC stages */
 #define MAX_ACC_STAGES	20
 
@@ -1939,10 +1938,8 @@ static void __configure_capture_pp_input(struct atomisp_sub_device *asd,
 	    height * 9 / 10 < pipe_configs->output_info[0].res.height)
 		return;
 	/* here just copy the calculation in css */
-	hor_ds_factor = CEIL_DIV(width >> 1,
-				 pipe_configs->output_info[0].res.width);
-	ver_ds_factor = CEIL_DIV(height >> 1,
-				 pipe_configs->output_info[0].res.height);
+	hor_ds_factor = DIV_ROUND_UP(width >> 1, pipe_configs->output_info[0].res.width);
+	ver_ds_factor = DIV_ROUND_UP(height >> 1, pipe_configs->output_info[0].res.height);
 
 	if ((asd->isp->media_dev.hw_revision <
 	     (ATOMISP_HW_REVISION_ISP2401 << ATOMISP_HW_REVISION_SHIFT) ||
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
index 9b22f2da45d5..1dd345ece44c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
@@ -20,9 +20,11 @@
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
index 1ccceadbb7bf..3b2e99065968 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h
@@ -16,6 +16,8 @@
 #ifndef __IA_CSS_DPC2_PARAM_H
 #define __IA_CSS_DPC2_PARAM_H
 
+#include <linux/math.h>
+
 #include "type_support.h"
 #include "vmem.h" /* for VMEM_ARRAY*/
 
@@ -28,12 +30,12 @@
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
index 07ce5b4f0816..a47fe523e1d9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -150,10 +150,10 @@ convert_coords_to_ispparams(
 
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
index 6fb3b38f49e7..27cf6ad7e293 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
@@ -16,6 +16,8 @@
 #ifndef __IA_CSS_EED1_8_PARAM_H
 #define __IA_CSS_EED1_8_PARAM_H
 
+#include <linux/math.h>
+
 #include "type_support.h"
 #include "vmem.h" /* needed for VMEM_ARRAY */
 
@@ -44,35 +46,35 @@
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
@@ -81,11 +83,11 @@
 
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
index 8ccfa99c61ef..4b83b828cbbe 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -13,6 +13,8 @@
  * more details.
  */
 
+#include <linux/math.h>
+
 #include <assert_support.h>
 #include <ia_css_frame_public.h>
 #include <ia_css_frame.h>
@@ -80,9 +82,9 @@ int ia_css_fpn_configure(const struct ia_css_binary     *binary,
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
index fab11d3350fd..ace918baeadc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
@@ -31,7 +31,7 @@ struct sh_css_isp_sc_params {
  * vec_slice is used for 2 adjacent vectors of shading gains.
  * The number of shift times by vec_slice is 8.
  *     Max grid cell bqs to support the shading table centerting: N = 32
- *     CEIL_DIV(N-1, ISP_SLICE_NELEMS) = CEIL_DIV(31, 4) = 8
+ *     DIV_ROUND_UP(N-1, ISP_SLICE_NELEMS) = DIV_ROUND_UP(31, 4) = 8
  */
 #define SH_CSS_SC_INTERPED_GAIN_HOR_SLICE_TIMES   8
 
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
index f86cf9bf13a5..7c021a83c05b 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
@@ -16,6 +16,8 @@ more details.
 #ifndef _INPUT_BUF_ISP_H_
 #define _INPUT_BUF_ISP_H_
 
+#include <linux/math.h>
+
 /* Temporary include, since IA_CSS_BINARY_MODE_COPY is still needed */
 #include "sh_css_defs.h"
 #include "isp_const.h" /* MAX_VECTORS_PER_INPUT_LINE */
@@ -30,7 +32,8 @@ more details.
 /* In continuous mode, the input buffer must be a fixed size for all binaries
  * and at a fixed address since it will be used by the SP. */
 #define EXTRA_INPUT_VECTORS	2 /* For left padding */
-#define MAX_VECTORS_PER_INPUT_LINE_CONT (CEIL_DIV(SH_CSS_MAX_SENSOR_WIDTH, ISP_NWAY) + EXTRA_INPUT_VECTORS)
+#define MAX_VECTORS_PER_INPUT_LINE_CONT						\
+	(DIV_ROUND_UP(SH_CSS_MAX_SENSOR_WIDTH, ISP_NWAY) + EXTRA_INPUT_VECTORS)
 
 /* The input buffer should be on a fixed address in vmem, for continuous capture */
 #define INPUT_BUF_ADDR 0x0
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
index 73432dc35ae3..f79764ad7e85 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
@@ -16,6 +16,8 @@ more details.
 #ifndef _COMMON_ISP_CONST_H_
 #define _COMMON_ISP_CONST_H_
 
+#include <linux/math.h>
+
 /*#include "isp.h"*/	/* ISP_VEC_NELEMS */
 
 /* Binary independent constants */
@@ -33,8 +35,8 @@ more details.
 #define XMEM_INTS_PER_WORD           (HIVE_ISP_DDR_WORD_BITS / 32)
 #define XMEM_POW2_BYTES_PER_WORD      HIVE_ISP_DDR_WORD_BYTES
 
-#define BITS8_ELEMENTS_PER_XMEM_ADDR    CEIL_DIV(XMEM_WIDTH_BITS, 8)
-#define BITS16_ELEMENTS_PER_XMEM_ADDR    CEIL_DIV(XMEM_WIDTH_BITS, 16)
+#define BITS8_ELEMENTS_PER_XMEM_ADDR    DIV_ROUND_UP(XMEM_WIDTH_BITS, 8)
+#define BITS16_ELEMENTS_PER_XMEM_ADDR    DIV_ROUND_UP(XMEM_WIDTH_BITS, 16)
 
 #define ISP_NWAY_LOG2  6
 
@@ -67,17 +69,17 @@ more details.
 #define UDS_MAX_CHUNKS                16
 
 #define ISP_LEFT_PADDING	_ISP_LEFT_CROP_EXTRA(ISP_LEFT_CROPPING)
-#define ISP_LEFT_PADDING_VECS	CEIL_DIV(ISP_LEFT_PADDING, ISP_VEC_NELEMS)
+#define ISP_LEFT_PADDING_VECS	DIV_ROUND_UP(ISP_LEFT_PADDING, ISP_VEC_NELEMS)
 /* in case of continuous the croppong of the current binary doesn't matter for the buffer calculation, but the cropping of the sp copy should be used */
 #define ISP_LEFT_PADDING_CONT	_ISP_LEFT_CROP_EXTRA(SH_CSS_MAX_LEFT_CROPPING)
-#define ISP_LEFT_PADDING_VECS_CONT	CEIL_DIV(ISP_LEFT_PADDING_CONT, ISP_VEC_NELEMS)
+#define ISP_LEFT_PADDING_VECS_CONT	DIV_ROUND_UP(ISP_LEFT_PADDING_CONT, ISP_VEC_NELEMS)
 
 #define CEIL_ROUND_DIV_STRIPE(width, stripe, padding) \
-	CEIL_MUL(padding + CEIL_DIV(width - padding, stripe), ((ENABLE_RAW_BINNING || ENABLE_FIXED_BAYER_DS) ? 4 : 2))
+	round_up(padding + DIV_ROUND_UP(width - padding, stripe), (ENABLE_RAW_BINNING || ENABLE_FIXED_BAYER_DS) ? 4 : 2)
 
 /* output (Y,U,V) image, 4:2:0 */
 #define MAX_VECTORS_PER_LINE \
-	CEIL_ROUND_DIV_STRIPE(CEIL_DIV(ISP_MAX_INTERNAL_WIDTH, ISP_VEC_NELEMS), \
+	CEIL_ROUND_DIV_STRIPE(DIV_ROUND_UP(ISP_MAX_INTERNAL_WIDTH, ISP_VEC_NELEMS), \
 			      ISP_NUM_STRIPES, \
 			      ISP_LEFT_PADDING_VECS)
 
@@ -89,16 +91,16 @@ more details.
  * ((width[vectors]/num_of_stripes) + 2[vectors])
  */
 #define MAX_VECTORS_PER_OUTPUT_LINE \
-	CEIL_DIV(CEIL_DIV(ISP_MAX_OUTPUT_WIDTH, ISP_NUM_STRIPES) + ISP_LEFT_PADDING, ISP_VEC_NELEMS)
+	DIV_ROUND_UP(DIV_ROUND_UP(ISP_MAX_OUTPUT_WIDTH, ISP_NUM_STRIPES) + ISP_LEFT_PADDING, ISP_VEC_NELEMS)
 
 /* Must be even due to interlaced bayer input */
-#define MAX_VECTORS_PER_INPUT_LINE	CEIL_MUL((CEIL_DIV(ISP_MAX_INPUT_WIDTH, ISP_VEC_NELEMS) + ISP_LEFT_PADDING_VECS), 2)
+#define MAX_VECTORS_PER_INPUT_LINE	round_up(DIV_ROUND_UP(ISP_MAX_INPUT_WIDTH, ISP_VEC_NELEMS) + ISP_LEFT_PADDING_VECS, 2)
 #define MAX_VECTORS_PER_INPUT_STRIPE	CEIL_ROUND_DIV_STRIPE(MAX_VECTORS_PER_INPUT_LINE, \
 							      ISP_NUM_STRIPES, \
 							      ISP_LEFT_PADDING_VECS)
 
 /* Add 2 for left croppping */
-#define MAX_SP_RAW_COPY_VECTORS_PER_INPUT_LINE	(CEIL_DIV(ISP_MAX_INPUT_WIDTH, ISP_VEC_NELEMS) + 2)
+#define MAX_SP_RAW_COPY_VECTORS_PER_INPUT_LINE	(DIV_ROUND_UP(ISP_MAX_INPUT_WIDTH, ISP_VEC_NELEMS) + 2)
 
 #define MAX_VECTORS_PER_BUF_LINE \
 	(MAX_VECTORS_PER_LINE + DUMMY_BUF_VECTORS)
@@ -111,14 +113,14 @@ more details.
 #define MAX_OUTPUT_C_FRAME_WIDTH \
 	(MAX_OUTPUT_Y_FRAME_WIDTH / 2)
 #define MAX_OUTPUT_C_FRAME_SIMDWIDTH \
-	CEIL_DIV(MAX_OUTPUT_C_FRAME_WIDTH, ISP_VEC_NELEMS)
+	DIV_ROUND_UP(MAX_OUTPUT_C_FRAME_WIDTH, ISP_VEC_NELEMS)
 
 /* should be even */
 #define NO_CHUNKING (OUTPUT_NUM_CHUNKS == 1)
 
 #define MAX_VECTORS_PER_CHUNK \
 	(NO_CHUNKING ? MAX_VECTORS_PER_LINE \
-				: 2 * CEIL_DIV(MAX_VECTORS_PER_LINE, \
+				: 2 * DIV_ROUND_UP(MAX_VECTORS_PER_LINE, \
 					     2 * OUTPUT_NUM_CHUNKS))
 
 #define MAX_C_VECTORS_PER_CHUNK \
@@ -127,7 +129,7 @@ more details.
 /* should be even */
 #define MAX_VECTORS_PER_OUTPUT_CHUNK \
 	(NO_CHUNKING ? MAX_VECTORS_PER_OUTPUT_LINE \
-				: 2 * CEIL_DIV(MAX_VECTORS_PER_OUTPUT_LINE, \
+				: 2 * DIV_ROUND_UP(MAX_VECTORS_PER_OUTPUT_LINE, \
 					     2 * OUTPUT_NUM_CHUNKS))
 
 #define MAX_C_VECTORS_PER_OUTPUT_CHUNK \
@@ -136,7 +138,7 @@ more details.
 /* should be even */
 #define MAX_VECTORS_PER_INPUT_CHUNK \
 	(INPUT_NUM_CHUNKS == 1 ? MAX_VECTORS_PER_INPUT_STRIPE \
-			       : 2 * CEIL_DIV(MAX_VECTORS_PER_INPUT_STRIPE, \
+			       : 2 * DIV_ROUND_UP(MAX_VECTORS_PER_INPUT_STRIPE, \
 					    2 * OUTPUT_NUM_CHUNKS))
 
 #define DEFAULT_C_SUBSAMPLING      2
@@ -148,9 +150,9 @@ more details.
 /* [isp vmem] table size[vectors] per line per color (GR,R,B,GB),
    multiples of NWAY */
 #define ISP2400_SCTBL_VECTORS_PER_LINE_PER_COLOR \
-	CEIL_DIV(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
+	DIV_ROUND_UP(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
 #define ISP2401_SCTBL_VECTORS_PER_LINE_PER_COLOR \
-	CEIL_DIV(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
+	DIV_ROUND_UP(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
 /* [isp vmem] table size[vectors] per line for 4colors (GR,R,B,GB),
    multiples of NWAY */
 #define SCTBL_VECTORS_PER_LINE \
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 35c98fb8d6e8..dfb8bef6897d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -60,7 +60,6 @@
 #include "sp.h"
 #include "isp.h"
 #include "type_support.h"
-#include "math_support.h" /* CEIL_DIV */
 #include "input_system.h"	/* input_formatter_reg_load */
 #include "ia_css_tagger_common.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 2d7fddb114f6..3adcefb2feeb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -13,15 +13,16 @@
  * more details.
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
@@ -427,7 +428,7 @@ int ia_css_dma_configure_from_info(struct dma_port_config *config,
 	unsigned int bits_per_pixel = is_raw_packed ? info->raw_bit_depth :
 				      ia_css_elems_bytes_from_info(info) * 8;
 	unsigned int pix_per_ddrword = HIVE_ISP_DDR_WORD_BITS / bits_per_pixel;
-	unsigned int words_per_line = CEIL_DIV(info->padded_width, pix_per_ddrword);
+	unsigned int words_per_line = DIV_ROUND_UP(info->padded_width, pix_per_ddrword);
 	unsigned int elems_b = pix_per_ddrword;
 
 	config->stride = HIVE_ISP_DDR_WORD_BYTES * words_per_line;
@@ -468,15 +469,16 @@ static void frame_init_single_plane(struct ia_css_frame *frame,
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
@@ -491,11 +493,9 @@ static void frame_init_raw_single_plane(
 	assert(frame);
 
 	stride = HIVE_ISP_DDR_WORD_BYTES *
-		 CEIL_DIV(subpixels_per_line,
-			  HIVE_ISP_DDR_WORD_BITS / bits_per_pixel);
+		 DIV_ROUND_UP(subpixels_per_line, HIVE_ISP_DDR_WORD_BITS / bits_per_pixel);
 	frame->data_bytes = stride * height;
 	frame_init_plane(plane, subpixels_per_line, stride, height, 0);
-	return;
 }
 
 static void frame_init_nv_planes(struct ia_css_frame *frame,
@@ -699,7 +699,7 @@ ia_css_elems_bytes_from_info(const struct ia_css_frame_info *info)
 	if (info->format == IA_CSS_FRAME_FORMAT_RAW
 	    || (info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED)) {
 		if (info->raw_bit_depth)
-			return CEIL_DIV(info->raw_bit_depth, 8);
+			return BITS_TO_BYTES(info->raw_bit_depth);
 		else
 			return 2; /* bytes per pixel */
 	}
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 7b5603e4e173..f8d184483a58 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -13,9 +13,9 @@
  * more details.
  */
 
-#include "system_global.h"
-#include <linux/kernel.h>
+#include <linux/math.h>
 
+#include "system_global.h"
 
 #include "ia_css_ifmtr.h"
 #include <math_support.h>
@@ -158,10 +158,9 @@ int ia_css_ifmtr_configure(struct ia_css_stream_config *config,
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
@@ -314,7 +313,7 @@ int ia_css_ifmtr_configure(struct ia_css_stream_config *config,
 		if ((!binary) || config->continuous)
 			/* !binary -> sp raw copy pipe */
 			buffer_height *= 2;
-		vectors_per_line = CEIL_DIV(cropped_width, ISP_VEC_NELEMS);
+		vectors_per_line = DIV_ROUND_UP(cropped_width, ISP_VEC_NELEMS);
 		vectors_per_line = CEIL_MUL(vectors_per_line, deinterleaving);
 		break;
 	case ATOMISP_INPUT_FORMAT_RAW_14:
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 2e0193671f4b..05d6bfaf921e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -817,7 +817,7 @@ static bool calculate_isys2401_dma_port_cfg(
 
 	cfg->elements	= HIVE_ISP_DDR_WORD_BITS / bits_per_pixel;
 	cfg->cropping	= 0;
-	cfg->width	= CEIL_DIV(cfg->stride, HIVE_ISP_DDR_WORD_BYTES);
+	cfg->width	= DIV_ROUND_UP(cfg->stride, HIVE_ISP_DDR_WORD_BYTES);
 
 	return true;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ca97ea082cf4..131defbce0cc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5846,8 +5846,8 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 	/* We assume that this function is used only for single output port case. */
 	descr->num_output_stage = 1;
 
-	hor_ds_factor = CEIL_DIV(in_info->res.width, out_info->res.width);
-	ver_ds_factor = CEIL_DIV(in_info->res.height, out_info->res.height);
+	hor_ds_factor = DIV_ROUND_UP(in_info->res.width, out_info->res.width);
+	ver_ds_factor = DIV_ROUND_UP(in_info->res.height, out_info->res.height);
 	/* use the same horizontal and vertical downscaling factor for simplicity */
 	assert(hor_ds_factor == ver_ds_factor);
 
@@ -5987,8 +5987,10 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 		}
 
 		if (out_info[i]) {
-			hor_scale_factor[i] = CEIL_DIV(in_info.res.width, out_info[i]->res.width);
-			ver_scale_factor[i] = CEIL_DIV(in_info.res.height, out_info[i]->res.height);
+			hor_scale_factor[i] =
+				DIV_ROUND_UP(in_info.res.width, out_info[i]->res.width);
+			ver_scale_factor[i] =
+				DIV_ROUND_UP(in_info.res.height, out_info[i]->res.height);
 			/* use the same horizontal and vertical scaling factor for simplicity */
 			assert(hor_scale_factor[i] == ver_scale_factor[i]);
 			scale_factor = 1;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index 2afde974e75d..cf00ae6c63ff 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -16,12 +16,12 @@
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
@@ -191,7 +191,7 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
    The ISP firmware needs these rules to be applied at pre-processor time,
    that's why these are macros, not functions. */
 #define _ISP_BQS(num)  ((num) / 2)
-#define _ISP_VECS(width) CEIL_DIV(width, ISP_VEC_NELEMS)
+#define _ISP_VECS(width) DIV_ROUND_UP(width, ISP_VEC_NELEMS)
 
 #define ISP_BQ_GRID_WIDTH(elements_per_line, deci_factor_log2) \
 	CEIL_SHIFT(elements_per_line / 2,  deci_factor_log2)
@@ -203,9 +203,9 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
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
@@ -307,7 +307,7 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 			     c_subsampling, \
 			     num_chunks, \
 			     pipelining) \
-	CEIL_MUL2(CEIL_MUL2(MAX(__ISP_PADDED_OUTPUT_WIDTH(out_width, \
+	round_up(round_up(MAX(__ISP_PADDED_OUTPUT_WIDTH(out_width, \
 							    dvs_env_width, \
 							    left_crop), \
 				  __ISP_MIN_INTERNAL_WIDTH(num_chunks, \
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 959e7f549641..b4623d044225 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -17,6 +17,7 @@
 #define _SH_CSS_INTERNAL_H_
 
 #include <linux/build_bug.h>
+#include <linux/math.h>
 #include <linux/stdarg.h>
 
 #include <system_global.h>
@@ -104,7 +105,6 @@
  * the SIZE_OF_XXX macro of the corresponding struct. If they are not
  * equal, functionality will break.
  */
-#define CALC_ALIGNMENT_MEMBER(x, y)	(CEIL_MUL(x, y) - x)
 #define SIZE_OF_HRT_VADDRESS		sizeof(hive_uint32)
 
 /* Number of SP's */
@@ -713,13 +713,11 @@ struct sh_css_hmm_buffer {
 
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
index 25e5b4570f7d..308e3d804d4a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
@@ -16,6 +16,8 @@
 #ifndef _SH_CSS_PARAMS_DVS_H_
 #define _SH_CSS_PARAMS_DVS_H_
 
+#include <linux/math.h>
+
 #include <math_support.h>
 #include <ia_css_types.h>
 #include "gdc_global.h" /* gdc_warp_param_mem_t */
@@ -29,16 +31,17 @@
 
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
 
@@ -52,8 +55,8 @@
 
 #define XMEM_ALIGN_LOG2 (5)
 
-#define DVS_6AXIS_COORDS_ELEMS CEIL_MUL(sizeof(gdc_warp_param_mem_t) \
-					, HIVE_ISP_DDR_WORD_BYTES)
+#define DVS_6AXIS_COORDS_ELEMS \
+	round_up(sizeof(gdc_warp_param_mem_t), HIVE_ISP_DDR_WORD_BYTES)
 
 /* currently we only support two output with the same resolution, output 0 is th default one. */
 #define DVS_6AXIS_BYTES(binary) \
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 5b43cc656269..1f95447ea5af 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -107,8 +107,8 @@ crop_and_interpolate(unsigned int cropped_width,
 	out_ptr = out_table->data[color];
 
 	padded_width = cropped_width + left_padding + right_padding;
-	out_cell_size = CEIL_DIV(padded_width, out_table->width - 1);
-	in_cell_size  = CEIL_DIV(sensor_width, table_width - 1);
+	out_cell_size = DIV_ROUND_UP(padded_width, out_table->width - 1);
+	in_cell_size  = DIV_ROUND_UP(sensor_width, table_width - 1);
 
 	out_start_col = ((int)sensor_width - (int)cropped_width) / 2 - left_padding;
 	out_start_row = ((int)sensor_height - (int)cropped_height) / 2 - top_padding;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 232744973ab8..bcb26b2dc56b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -13,6 +13,8 @@
  * more details.
  */
 
+#include <linux/math.h>
+
 #include "gdc_device.h"		/* gdc_lut_store(), ... */
 #include "isp.h"			/* ISP_VEC_ELEMBITS */
 #include "vamem.h"
@@ -30,8 +32,6 @@
 
 #include "platform_support.h"
 #include "assert_support.h"
-#include "misc_support.h"	/* NOT_USED */
-#include "math_support.h"	/* max(), min()  EVEN_FLOOR()*/
 
 #include "ia_css_stream.h"
 #include "sh_css_params_internal.h"
@@ -4051,10 +4051,10 @@ sh_css_update_uds_and_crop_info(
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
2.43.0.rc1.1336.g36b5255a03ac


