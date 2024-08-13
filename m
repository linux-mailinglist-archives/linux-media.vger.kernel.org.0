Return-Path: <linux-media+bounces-16220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F60950621
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 15:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D64A72873A1
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 13:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D7819B3CE;
	Tue, 13 Aug 2024 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fC9/7Smm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3327199E84;
	Tue, 13 Aug 2024 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554756; cv=none; b=sqOXebTTrvAxym8ooRjYhEIhBJqwkxh7hSEldiuSEFcKVgzBdSGCQiZMm9Cvlbr584fhLY/sO0/Sz2WBhIVu0Od7oaE2+CkWCmBKTQyY5RgLb0uRn6IUerPCrb2RRw8sw3m0JkiyprBifhjXFJDOAa/gj55tSuvixzUbcWUnq1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554756; c=relaxed/simple;
	bh=uoqDNeAJb5WryfWJBMETwWztM1l30CYsj7KasEM+Z9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=csXp2xxQNqyy6ECZJvmYmmqviAKmCDOEJQ6bYLin/rP47O17Ir2zkz0dEDu+HQupbXVy7mEIiZtHoLecmzPhAT2l1b3NiO8Lzgjy0i5lb/LfHSkF57Cf769s97HvJNND0Se6EO1NtOp0w6XmxbcOSPE+zxE1Qun8Qf6VsSOVz+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fC9/7Smm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723554755; x=1755090755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uoqDNeAJb5WryfWJBMETwWztM1l30CYsj7KasEM+Z9M=;
  b=fC9/7SmmK+8AuFZa0iNlVG/YdjMJWyoiYEW4FfIy/RvNw8/HN/WtWgx2
   hX40sh1fZeP00BFkUJt6MH91hN2kQhoF7KkGzvKkKg/fxMVjSacBZOzOj
   m2/MjWcNedbkryvKjhFx6lP/e02yiC0lVosfoajyt0ZrHU7+w/Md0pqz0
   Dr8iZ96u/5lvW4MjjApBXJHwTcAk7bE7Sig0TIuloioryyUPW38JXqVvF
   GSXyufLATeSz4UzkPCZ9hRsb9WZCp3e7TSuFz34kAyMig4KGD4jkUITPT
   nuCn7q8WSERvDBrlZuHQlcA3HBtb66obayQlTKhOKXM0XRdaXSItlOHe8
   A==;
X-CSE-ConnectionGUID: 6Geag84+QkaacR24eu7reQ==
X-CSE-MsgGUID: yzZwOIMzS4S1cBQtyO5diA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="39225786"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="39225786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 06:12:34 -0700
X-CSE-ConnectionGUID: /1gIWA2uQG6JpkF1c4ltyA==
X-CSE-MsgGUID: +sfTXrSuT56MHEjC6oHieA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58610132"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2024 06:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9EE6F2CC; Tue, 13 Aug 2024 16:12:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/1] media: atomisp: Replace rarely used macro from math_support.h
Date: Tue, 13 Aug 2024 16:12:25 +0300
Message-ID: <20240813131225.2232817-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace rarely used macro by generic ones from Linux kernel headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../atomisp/pci/hive_isp_css_include/math_support.h      | 6 ------
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c        | 9 +++++----
 .../ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c      | 9 +++++----
 .../media/atomisp/pci/runtime/binary/src/binary.c        | 3 ++-
 .../media/atomisp/pci/runtime/isys/src/virtual_isys.c    | 8 ++++----
 5 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
index 160c496784b7..907f9ebcc60d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
@@ -28,12 +28,6 @@
 #define CEIL_SHIFT(a, b)     (((a) + (1 << (b)) - 1) >> (b))
 #define CEIL_SHIFT_MUL(a, b) (CEIL_SHIFT(a, b) << (b))
 
-#if !defined(PIPE_GENERATION)
-
-#define ceil_div(a, b)		(CEIL_DIV(a, b))
-
-#endif /* !defined(PIPE_GENERATION) */
-
 /*
  * For SP and ISP, SDK provides the definition of OP_std_modadd.
  * We need it only for host
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
index 0091e2a3da52..c32659894c29 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
@@ -13,9 +13,11 @@
  * more details.
  */
 
+#include <linux/bitops.h>
+#include <linux/math.h>
+
 #include "ia_css_bayer_io.host.h"
 #include "dma.h"
-#include "math_support.h"
 #ifndef IA_CSS_NO_DEBUG
 #include "ia_css_debug.h"
 #endif
@@ -29,9 +31,8 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 	const struct ia_css_frame **out_frames = (const struct ia_css_frame **)
 		&args->out_frame;
 	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
-	const unsigned int ddr_bits_per_element = sizeof(short) * 8;
-	const unsigned int ddr_elems_per_word = ceil_div(HIVE_ISP_DDR_WORD_BITS,
-						ddr_bits_per_element);
+	const unsigned int ddr_elems_per_word =
+		DIV_ROUND_UP(HIVE_ISP_DDR_WORD_BITS, BITS_PER_TYPE(short));
 	unsigned int size_get = 0, size_put = 0;
 	unsigned int offset = 0;
 	int ret;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
index 32c504a950ce..5b2d5023b5ee 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
@@ -13,9 +13,11 @@ FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 more details.
 */
 
+#include <linux/bitops.h>
+#include <linux/math.h>
+
 #include "ia_css_yuv444_io.host.h"
 #include "dma.h"
-#include "math_support.h"
 #ifndef IA_CSS_NO_DEBUG
 #include "ia_css_debug.h"
 #endif
@@ -29,9 +31,8 @@ int ia_css_yuv444_io_config(const struct ia_css_binary      *binary,
 	const struct ia_css_frame **out_frames = (const struct ia_css_frame **)
 		&args->out_frame;
 	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
-	const unsigned int ddr_bits_per_element = sizeof(short) * 8;
-	const unsigned int ddr_elems_per_word = ceil_div(HIVE_ISP_DDR_WORD_BITS,
-						ddr_bits_per_element);
+	const unsigned int ddr_elems_per_word =
+		DIV_ROUND_UP(HIVE_ISP_DDR_WORD_BITS, BITS_PER_TYPE(short));
 	unsigned int size_get = 0, size_put = 0;
 	unsigned int offset = 0;
 	int ret;
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index b0f904a5e442..2ff522f7dec8 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -328,7 +328,8 @@ ia_css_binary_dvs_grid_info(const struct ia_css_binary *binary,
 
 	dvs_info = &info->dvs_grid.dvs_grid_info;
 
-	/* for DIS, we use a division instead of a ceil_div. If this is smaller
+	/*
+	 * For DIS, we use a division instead of a DIV_ROUND_UP(). If this is smaller
 	 * than the 3a grid size, it indicates that the outer values are not
 	 * valid for DIS.
 	 */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 52483498239d..2e0193671f4b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -13,6 +13,8 @@
  * more details.
  */
 
+#include <linux/bitops.h>
+#include <linux/math.h>
 #include <linux/string.h> /* for memcpy() */
 
 #include "system_global.h"
@@ -20,7 +22,6 @@
 
 #include "ia_css_isys.h"
 #include "ia_css_debug.h"
-#include "math_support.h"
 #include "virtual_isys.h"
 #include "isp.h"
 #include "sh_css_defs.h"
@@ -558,7 +559,7 @@ static int32_t calculate_stride(
 		bits_per_pixel = CEIL_MUL(bits_per_pixel, 8);
 
 	pixels_per_word = HIVE_ISP_DDR_WORD_BITS / bits_per_pixel;
-	words_per_line  = ceil_div(pixels_per_line_padded, pixels_per_word);
+	words_per_line  = DIV_ROUND_UP(pixels_per_line_padded, pixels_per_word);
 	bytes_per_line  = HIVE_ISP_DDR_WORD_BYTES * words_per_line;
 
 	return bytes_per_line;
@@ -690,7 +691,6 @@ static bool calculate_ibuf_ctrl_cfg(
     const isp2401_input_system_cfg_t	*isys_cfg,
     ibuf_ctrl_cfg_t			*cfg)
 {
-	const s32 bits_per_byte = 8;
 	s32 bits_per_pixel;
 	s32 bytes_per_pixel;
 	s32 left_padding;
@@ -698,7 +698,7 @@ static bool calculate_ibuf_ctrl_cfg(
 	(void)input_port;
 
 	bits_per_pixel = isys_cfg->input_port_resolution.bits_per_pixel;
-	bytes_per_pixel = ceil_div(bits_per_pixel, bits_per_byte);
+	bytes_per_pixel = BITS_TO_BYTES(bits_per_pixel);
 
 	left_padding = CEIL_MUL(isys_cfg->output_port_attr.left_padding, ISP_VEC_NELEMS)
 		       * bytes_per_pixel;
-- 
2.43.0.rc1.1336.g36b5255a03ac


