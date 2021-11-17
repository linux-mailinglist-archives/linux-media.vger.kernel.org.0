Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7800245439F
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhKQJ2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:58814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234643AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9D8D63238;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141142;
        bh=FVOkodDbUxhSkY0UYTLkR9HNVnv30jyJjcuWn9EqHpQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h6tdVay6UZDJd53oRb2pnDQVZUawtxy3+nWY7UOT1UmX+OwHq4MAvyXl5WsOKuLqX
         tNTxNojQR5n8niOj0bGdtOs+mE74t987gTWxS6D7PoM4ldTVLYXboznz8Cut5lt4UO
         TQzHtoGC6IrQHkML7RBkboKkXKaKjHFfKh65YnQszbXz6mftNpjsZ65tMau3M323Li
         MYCmqaZsXwGyzk983aYeRMfRmMjAOymVdiQ95nTwODZx5ltKRh0VPnLLD9K3a9MDC9
         5U7Bsxjko0Eit8Qkc6ErtIfk9YqbIb+WQQsFlq56GfeDULnasx+ExRZ9g6Zdg2rocF
         eY4mddCs6mhdQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb5v-9a; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 07/13] media: atomisp: remove #ifdef HAS_NO_HMEM
Date:   Wed, 17 Nov 2021 09:25:32 +0000
Message-Id: <806da791b727b612a602a06ca75c7013804ed3a8.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is not defined anywhere, so, solve the ifdefs, getting
rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 .../atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c   |  2 --
 .../raw_aa_binning_1.0/ia_css_raa.host.c               |  2 --
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c      |  5 -----
 .../media/atomisp/pci/runtime/binary/src/binary.c      |  4 ----
 drivers/staging/media/atomisp/pci/sh_css_params.c      | 10 ----------
 5 files changed, 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 82aa69b74677..2091f001502d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -13,7 +13,6 @@
  * more details.
  */
 
-#if !defined(HAS_NO_HMEM)
 
 #include "ia_css_types.h"
 #include "sh_css_internal.h"
@@ -63,4 +62,3 @@ ia_css_bh_encode(
 	    uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHIFT);
 }
 
-#endif
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
index 29c707ecf9f3..9b756daddee0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
@@ -13,7 +13,6 @@
  * more details.
  */
 
-#if !defined(HAS_NO_HMEM)
 
 #include "ia_css_types.h"
 #include "sh_css_internal.h"
@@ -32,4 +31,3 @@ ia_css_raa_encode(
 	(void)from;
 }
 
-#endif
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
index ba52c80df4a5..bd7b89d9475b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
@@ -227,10 +227,6 @@ ia_css_s3a_hmem_decode(
     struct ia_css_3a_statistics *host_stats,
     const struct ia_css_bh_table *hmem_buf)
 {
-#if defined(HAS_NO_HMEM)
-	(void)host_stats;
-	(void)hmem_buf;
-#else
 	struct ia_css_3a_rgby_output	*out_ptr;
 	int			i;
 
@@ -291,7 +287,6 @@ ia_css_s3a_hmem_decode(
 	out_ptr[0].g -= diff;
 	out_ptr[0].b -= diff;
 	out_ptr[0].y -= diff;
-#endif
 }
 
 void
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 851e1d34a521..bbb93cb8c070 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -805,11 +805,7 @@ ia_css_binary_3a_grid_info(const struct ia_css_binary *binary,
 	s3a_info->deci_factor_log2  = binary->deci_factor_log2;
 	s3a_info->elem_bit_depth    = SH_CSS_BAYER_BITS;
 	s3a_info->use_dmem          = binary->info->sp.s3a.s3atbl_use_dmem;
-#if defined(HAS_NO_HMEM)
-	s3a_info->has_histogram     = 1;
-#else
 	s3a_info->has_histogram     = 0;
-#endif
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
 	return err;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index f3f8d99c84a4..41ed8e4600ff 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -16,12 +16,10 @@
 #include "gdc_device.h"		/* gdc_lut_store(), ... */
 #include "isp.h"			/* ISP_VEC_ELEMBITS */
 #include "vamem.h"
-#if !defined(HAS_NO_HMEM)
 #ifndef __INLINE_HMEM__
 #define __INLINE_HMEM__
 #endif
 #include "hmem.h"
-#endif /* !defined(HAS_NO_HMEM) */
 #define IA_CSS_INCLUDE_PARAMETERS
 #define IA_CSS_INCLUDE_ACC_PARAMETERS
 
@@ -1489,10 +1487,8 @@ ia_css_translate_3a_statistics(
 		ia_css_s3a_vmem_decode(host_stats, isp_stats->vmem_stats_hi,
 				       isp_stats->vmem_stats_lo);
 	}
-#if !defined(HAS_NO_HMEM)
 	IA_CSS_LOG("3A: HMEM");
 	ia_css_s3a_hmem_decode(host_stats, isp_stats->hmem_stats);
-#endif
 
 	IA_CSS_LEAVE("void");
 }
@@ -2157,9 +2153,7 @@ ia_css_isp_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 		me->vmem_size = ISP_S3ATBL_HI_LO_STRIDE_BYTES *
 				grid->aligned_height;
 	}
-#if !defined(HAS_NO_HMEM)
 	me->hmem_size = sizeof_hmem(HMEM0_ID);
-#endif
 
 	/* All subsections need to be aligned to the system bus width */
 	me->dmem_size = CEIL_MUL(me->dmem_size, HIVE_ISP_DDR_WORD_BYTES);
@@ -4148,12 +4142,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 	me->data = kvmalloc(grid_size * sizeof(*me->data), GFP_KERNEL);
 	if (!me->data)
 		goto err;
-#if !defined(HAS_NO_HMEM)
 	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
 	me->rgby_data = kvmalloc(sizeof_hmem(HMEM0_ID), GFP_KERNEL);
-#else
-	me->rgby_data = NULL;
-#endif
 
 	IA_CSS_LEAVE("return=%p", me);
 	return me;
-- 
2.33.1

