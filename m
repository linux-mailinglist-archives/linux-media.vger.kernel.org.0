Return-Path: <linux-media+bounces-32833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27728ABC323
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 17:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FBA03A28AA
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085C82868A3;
	Mon, 19 May 2025 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPUfa+dF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D928751A;
	Mon, 19 May 2025 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669839; cv=none; b=d6IruCn5dR7ZVkpYqIdaf5eWrAfga6H2lZ2xZBhvrVVHNkrCTFt35XUEq0oq+jA60XkEnClfoHRwCQ/fNPbP9IcDRgzGQ/ijYBG8JAgiDGKqIes9wrTcJ/XVeGaBbK5lXJuElVR/P29aoTYxuufk3kafwmZ5M7IOMhBohTCi3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669839; c=relaxed/simple;
	bh=5V0TqHIiCLQb8ZvP2k7riv+kcSYbLR2nDRn3e8pt4IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwSLbmFpZqRODHYiR+vOAR1QGmgL7ePQnPwyWJKVdnNJJg7SSVWI2F4UwdH6VWQVSUky5cg4Ry5mjsVNDL87qKaST6jPVlB9pbYC0YKLBPT07VRAeNPhNlzwOCuF/NpUfeMS4107lXRZgTSufW51awGdE+zWUGontAwPtHZmuVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPUfa+dF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669838; x=1779205838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5V0TqHIiCLQb8ZvP2k7riv+kcSYbLR2nDRn3e8pt4IA=;
  b=QPUfa+dFYsWRSnNrYyxso/blQrbb70qKpWOOSXD3dN1X5pcDqDueLxaN
   QXzSZsqpDCkRH/y8nGNW66bcKtfXFz/31VDXFvfhqrXCOY+RL6+DwDPZg
   Nc34iEoWptoPlsx+2RImZF8MgpjU0j/MzeMDS6i9QvF9rKKpicKlSB7wP
   O3KwY/TEuacjkpTm6MmL3uPOP05q7uHSNI9QyFIWSnsjLzV86toQg38RJ
   i0vBi8U+2xXuFLcZjZh9zunTPdk6DQGpYja9mZMAF6vPlkg079wxffSO9
   7BRt94D7s9nrTXaiGesYEo6Iv3VMsv+2W2FOXjBMWv+hOaUsC1O5hIoHg
   w==;
X-CSE-ConnectionGUID: rsdgtrqFTxWPRgu5SjRxHA==
X-CSE-MsgGUID: VOZsXgh2QmiWt+NH0Q3pxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72082161"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="72082161"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:50:34 -0700
X-CSE-ConnectionGUID: PlMFt2xPTVu3T4r+y+nkQQ==
X-CSE-MsgGUID: 8uG5doxmQq2LTKpJjfPvsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="140302022"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2025 08:50:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 666EE117; Mon, 19 May 2025 18:50:30 +0300 (EEST)
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
Subject: [PATCH v2 1/3] media: atomisp: Remove unused header
Date: Mon, 19 May 2025 18:46:47 +0300
Message-ID: <20250519155028.526453-2-andriy.shevchenko@linux.intel.com>
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

There are some unused definitions that are using macros from math_support.h.
In order to have a cleaner future changes, remove them first.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../pci/isp/modes/interface/input_buf.isp.h   |   1 -
 .../pci/isp/modes/interface/isp_const.h       | 157 ------------------
 .../media/atomisp/pci/sh_css_param_dvs.h      |   3 -
 3 files changed, 161 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h

diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
index c7ade6ce6c68..55de6cb02833 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
@@ -10,7 +10,6 @@ Copyright (c) 2010 - 2015, Intel Corporation.
 
 /* Temporary include, since IA_CSS_BINARY_MODE_COPY is still needed */
 #include "sh_css_defs.h"
-#include "isp_const.h" /* MAX_VECTORS_PER_INPUT_LINE */
 
 #define INPUT_BUF_HEIGHT	2 /* double buffer */
 #define INPUT_BUF_LINES		2
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
deleted file mode 100644
index b767b0d35bb4..000000000000
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
+++ /dev/null
@@ -1,157 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/**
-Support for Intel Camera Imaging ISP subsystem.
-Copyright (c) 2010 - 2015, Intel Corporation.
-
-*/
-
-#ifndef _COMMON_ISP_CONST_H_
-#define _COMMON_ISP_CONST_H_
-
-/*#include "isp.h"*/	/* ISP_VEC_NELEMS */
-
-/* Binary independent constants */
-
-#ifndef NO_HOIST
-#  define		NO_HOIST	HIVE_ATTRIBUTE((no_hoist))
-#endif
-
-#define NO_HOIST_CSE HIVE_ATTRIBUTE((no_hoist, no_cse))
-
-#define UNION struct /* Union constructors not allowed in C++ */
-
-#define XMEM_WIDTH_BITS              HIVE_ISP_DDR_WORD_BITS
-#define XMEM_SHORTS_PER_WORD         (HIVE_ISP_DDR_WORD_BITS / 16)
-#define XMEM_INTS_PER_WORD           (HIVE_ISP_DDR_WORD_BITS / 32)
-#define XMEM_POW2_BYTES_PER_WORD      HIVE_ISP_DDR_WORD_BYTES
-
-#define BITS8_ELEMENTS_PER_XMEM_ADDR    CEIL_DIV(XMEM_WIDTH_BITS, 8)
-#define BITS16_ELEMENTS_PER_XMEM_ADDR    CEIL_DIV(XMEM_WIDTH_BITS, 16)
-
-#define ISP_NWAY_LOG2  6
-
-/* *****************************
- * ISP input/output buffer sizes
- * ****************************/
-/* input image */
-#define INPUT_BUF_DMA_HEIGHT          2
-#define INPUT_BUF_HEIGHT              2 /* double buffer */
-#define OUTPUT_BUF_DMA_HEIGHT         2
-#define OUTPUT_BUF_HEIGHT             2 /* double buffer */
-#define OUTPUT_NUM_TRANSFERS	      4
-
-/* GDC accelerator: Up/Down Scaling */
-/* These should be moved to the gdc_defs.h in the device */
-#define UDS_SCALING_N                 HRT_GDC_N
-/* AB: This should cover the zooming up to 16MP */
-#define UDS_MAX_OXDIM                 5000
-/* We support maximally 2 planes with different parameters
-       - luma and chroma (YUV420) */
-#define UDS_MAX_PLANES                2
-#define UDS_BLI_BLOCK_HEIGHT          2
-#define UDS_BCI_BLOCK_HEIGHT          4
-#define UDS_BLI_INTERP_ENVELOPE       1
-#define UDS_BCI_INTERP_ENVELOPE       3
-#define UDS_MAX_ZOOM_FAC              64
-/* Make it always one FPGA vector.
-   Four FPGA vectors are required and
-   four of them fit in one ASIC vector.*/
-#define UDS_MAX_CHUNKS                16
-
-#define ISP_LEFT_PADDING	_ISP_LEFT_CROP_EXTRA(ISP_LEFT_CROPPING)
-#define ISP_LEFT_PADDING_VECS	CEIL_DIV(ISP_LEFT_PADDING, ISP_VEC_NELEMS)
-/* in case of continuous the croppong of the current binary doesn't matter for the buffer calculation, but the cropping of the sp copy should be used */
-#define ISP_LEFT_PADDING_CONT	_ISP_LEFT_CROP_EXTRA(SH_CSS_MAX_LEFT_CROPPING)
-#define ISP_LEFT_PADDING_VECS_CONT	CEIL_DIV(ISP_LEFT_PADDING_CONT, ISP_VEC_NELEMS)
-
-#define CEIL_ROUND_DIV_STRIPE(width, stripe, padding) \
-	CEIL_MUL(padding + CEIL_DIV(width - padding, stripe), ((ENABLE_RAW_BINNING || ENABLE_FIXED_BAYER_DS) ? 4 : 2))
-
-/* output (Y,U,V) image, 4:2:0 */
-#define MAX_VECTORS_PER_LINE \
-	CEIL_ROUND_DIV_STRIPE(CEIL_DIV(ISP_MAX_INTERNAL_WIDTH, ISP_VEC_NELEMS), \
-			      ISP_NUM_STRIPES, \
-			      ISP_LEFT_PADDING_VECS)
-
-/*
- * ITERATOR_VECTOR_INCREMENT' explanation:
- * when striping an even number of iterations, one of the stripes is
- * one iteration wider than the other to account for overlap
- * so the calc for the output buffer vmem size is:
- * ((width[vectors]/num_of_stripes) + 2[vectors])
- */
-#define MAX_VECTORS_PER_OUTPUT_LINE \
-	CEIL_DIV(CEIL_DIV(ISP_MAX_OUTPUT_WIDTH, ISP_NUM_STRIPES) + ISP_LEFT_PADDING, ISP_VEC_NELEMS)
-
-/* Must be even due to interlaced bayer input */
-#define MAX_VECTORS_PER_INPUT_LINE	CEIL_MUL((CEIL_DIV(ISP_MAX_INPUT_WIDTH, ISP_VEC_NELEMS) + ISP_LEFT_PADDING_VECS), 2)
-#define MAX_VECTORS_PER_INPUT_STRIPE	CEIL_ROUND_DIV_STRIPE(MAX_VECTORS_PER_INPUT_LINE, \
-							      ISP_NUM_STRIPES, \
-							      ISP_LEFT_PADDING_VECS)
-
-/* Add 2 for left croppping */
-#define MAX_SP_RAW_COPY_VECTORS_PER_INPUT_LINE	(CEIL_DIV(ISP_MAX_INPUT_WIDTH, ISP_VEC_NELEMS) + 2)
-
-#define MAX_VECTORS_PER_BUF_LINE \
-	(MAX_VECTORS_PER_LINE + DUMMY_BUF_VECTORS)
-#define MAX_VECTORS_PER_BUF_INPUT_LINE \
-	(MAX_VECTORS_PER_INPUT_STRIPE + DUMMY_BUF_VECTORS)
-#define MAX_OUTPUT_Y_FRAME_WIDTH \
-	(MAX_VECTORS_PER_LINE * ISP_VEC_NELEMS)
-#define MAX_OUTPUT_Y_FRAME_SIMDWIDTH \
-	MAX_VECTORS_PER_LINE
-#define MAX_OUTPUT_C_FRAME_WIDTH \
-	(MAX_OUTPUT_Y_FRAME_WIDTH / 2)
-#define MAX_OUTPUT_C_FRAME_SIMDWIDTH \
-	CEIL_DIV(MAX_OUTPUT_C_FRAME_WIDTH, ISP_VEC_NELEMS)
-
-/* should be even */
-#define NO_CHUNKING (OUTPUT_NUM_CHUNKS == 1)
-
-#define MAX_VECTORS_PER_CHUNK \
-	(NO_CHUNKING ? MAX_VECTORS_PER_LINE \
-				: 2 * CEIL_DIV(MAX_VECTORS_PER_LINE, \
-					     2 * OUTPUT_NUM_CHUNKS))
-
-#define MAX_C_VECTORS_PER_CHUNK \
-	(MAX_VECTORS_PER_CHUNK / 2)
-
-/* should be even */
-#define MAX_VECTORS_PER_OUTPUT_CHUNK \
-	(NO_CHUNKING ? MAX_VECTORS_PER_OUTPUT_LINE \
-				: 2 * CEIL_DIV(MAX_VECTORS_PER_OUTPUT_LINE, \
-					     2 * OUTPUT_NUM_CHUNKS))
-
-#define MAX_C_VECTORS_PER_OUTPUT_CHUNK \
-	(MAX_VECTORS_PER_OUTPUT_CHUNK / 2)
-
-/* should be even */
-#define MAX_VECTORS_PER_INPUT_CHUNK \
-	(INPUT_NUM_CHUNKS == 1 ? MAX_VECTORS_PER_INPUT_STRIPE \
-			       : 2 * CEIL_DIV(MAX_VECTORS_PER_INPUT_STRIPE, \
-					    2 * OUTPUT_NUM_CHUNKS))
-
-#define DEFAULT_C_SUBSAMPLING      2
-
-/****** DMA buffer properties */
-
-#define RAW_BUF_LINES ((ENABLE_RAW_BINNING || ENABLE_FIXED_BAYER_DS) ? 4 : 2)
-
-/* [isp vmem] table size[vectors] per line per color (GR,R,B,GB),
-   multiples of NWAY */
-#define ISP2400_SCTBL_VECTORS_PER_LINE_PER_COLOR \
-	CEIL_DIV(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
-#define ISP2401_SCTBL_VECTORS_PER_LINE_PER_COLOR \
-	CEIL_DIV(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
-/* [isp vmem] table size[vectors] per line for 4colors (GR,R,B,GB),
-   multiples of NWAY */
-#define SCTBL_VECTORS_PER_LINE \
-	(SCTBL_VECTORS_PER_LINE_PER_COLOR * IA_CSS_SC_NUM_COLORS)
-
-/*************/
-
-/* Format for fixed primaries */
-
-#define ISP_FIXED_PRIMARY_FORMAT IA_CSS_FRAME_FORMAT_NV12
-
-#endif /* _COMMON_ISP_CONST_H_ */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
index b7057887adea..fd5cf6038829 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
@@ -33,9 +33,6 @@
 #define DVS_TABLE_IN_BLOCKDIM_Y_LUMA(X)		(DVS_NUM_BLOCKS_Y(X) + 1)
 #define DVS_TABLE_IN_BLOCKDIM_Y_CHROMA(X)	(DVS_NUM_BLOCKS_Y_CHROMA(X) + 1)
 
-#define DVS_ENVELOPE_X(X) (((X) == 0) ? (DVS_ENV_MIN_X) : (X))
-#define DVS_ENVELOPE_Y(X) (((X) == 0) ? (DVS_ENV_MIN_Y) : (X))
-
 #define DVS_COORD_FRAC_BITS (10)
 
 /* ISP2400 */
-- 
2.47.2


