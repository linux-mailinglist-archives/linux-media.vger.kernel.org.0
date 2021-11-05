Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0594446820
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 18:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234535AbhKERvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 13:51:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:35296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234502AbhKERvE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 13:51:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A839F6135A;
        Fri,  5 Nov 2021 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636134504;
        bh=MBSyznzJxYlCzNuzpArBH+PHGzgD6dYu4NqeRsxiHN0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qNmN2vBw6r7h63ft7We1Q+WeLlTfqTPeaOo/9Yqq17S60w3uxvjUUP0kBjE+CR7CC
         AMPuTWMzEfAIYfjqZo27yii/zewX9BRjXWeXLsrg3m++ooqA84UEzTZQVt2LZVyL8C
         onmDW5aJ56SdeAG64JmkzJW4tzYQiXyBA2Y/7N3BRVcr0ZlGosaPaRYbvURbkLSP1w
         khKlMGPsJcw1bC9cQ6RBNwDdfCXls2NSxSM8Rtx9IBH9Y7yKZSIaUdL0yRCSe+2t3i
         ZLQKRG0lTqAmeijI/YNarcizO6qYdXs0npeZvr6XMKEZ/aA8bfzXLLvIPw6CLblQoG
         9XPfB7ooG6I1g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mj3K4-007eNu-GH; Fri, 05 Nov 2021 17:48:16 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 8/8] media: atomisp: return errors from ia_css_dma_configure_from_info()
Date:   Fri,  5 Nov 2021 17:48:15 +0000
Message-Id: <372257287956fa3f211580d0487058b5210ea189.1636134411.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <286ba3e4f25e9ba2ab78de4cbf010f18167b2604.1636134411.git.mchehab+huawei@kernel.org>
References: <286ba3e4f25e9ba2ab78de4cbf010f18167b2604.1636134411.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the pipeline config functions can return errors, change
ia_css_dma_configure_from_info() and callers in order for them
to return errors at pipelines instead of using assert().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c  | 11 ++++++++---
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c     | 11 ++++++++---
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c     |  9 +++++++--
 .../ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c   | 11 +++++++++--
 .../kernels/output/output_1.0/ia_css_output.host.c    | 11 ++++++++---
 .../isp/kernels/qplane/qplane_2/ia_css_qplane.host.c  | 11 ++++++++---
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c     |  6 ++++--
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c     |  9 +++++++--
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c     | 10 +++++++---
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c        |  9 ++++++---
 .../media/atomisp/pci/runtime/frame/src/frame.c       |  7 ++++++-
 11 files changed, 78 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
index 69b1c493e020..8c1d50f7aae4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
@@ -41,13 +41,18 @@ int ia_css_crop_config(struct sh_css_isp_crop_isp_config *to,
 		       unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
+	int ret;
+
+	ret = ia_css_dma_configure_from_info(&to->port_b, from->info);
+	if (ret)
+		return ret;
 
-	(void)size;
-	ia_css_dma_configure_from_info(&to->port_b, from->info);
 	to->width_a_over_b = elems_a / to->port_b.elems;
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
-	assert(elems_a % to->port_b.elems == 0);
+	if (elems_a % to->port_b.elems != 0)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index be68192c2437..57b5e11e1cfe 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -56,13 +56,18 @@ int ia_css_fpn_config(struct sh_css_isp_fpn_isp_config *to,
 		      unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
+	int ret;
+
+	ret = ia_css_dma_configure_from_info(&to->port_b, from->info);
+	if (ret)
+		return ret;
 
-	(void)size;
-	ia_css_dma_configure_from_info(&to->port_b, from->info);
 	to->width_a_over_b = elems_a / to->port_b.elems;
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
-	assert(elems_a % to->port_b.elems == 0);
+	if (elems_a % to->port_b.elems != 0)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
index 5e2755b45586..c7d88552dfde 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
@@ -36,6 +36,7 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 						ddr_bits_per_element);
 	unsigned int size_get = 0, size_put = 0;
 	unsigned int offset = 0;
+	int ret;
 
 	if (binary->info->mem_offsets.offsets.param) {
 		size_get = binary->info->mem_offsets.offsets.param->dmem.get.size;
@@ -51,7 +52,9 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 				    "ia_css_bayer_io_config() get part enter:\n");
 #endif
 
-		ia_css_dma_configure_from_info(&config, in_frame_info);
+		ret = ia_css_dma_configure_from_info(&config, in_frame_info);
+		if (ret)
+			return ret;
 		// The base_address of the input frame will be set in the ISP
 		to->width = in_frame_info->res.width;
 		to->height = in_frame_info->res.height;
@@ -77,7 +80,9 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 				    "ia_css_bayer_io_config() put part enter:\n");
 #endif
 
-		ia_css_dma_configure_from_info(&config, &out_frames[0]->info);
+		ret = ia_css_dma_configure_from_info(&config, &out_frames[0]->info);
+		if (ret)
+			return ret;
 		to->base_address = out_frames[0]->data;
 		to->width = out_frames[0]->info.res.width;
 		to->height = out_frames[0]->info.res.height;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
index 46fa1f708571..7d2ef6e26ee6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
@@ -36,6 +36,7 @@ int ia_css_yuv444_io_config(const struct ia_css_binary      *binary,
 						ddr_bits_per_element);
 	unsigned int size_get = 0, size_put = 0;
 	unsigned int offset = 0;
+	int ret;
 
 	if (binary->info->mem_offsets.offsets.param) {
 		size_get = binary->info->mem_offsets.offsets.param->dmem.get.size;
@@ -51,7 +52,10 @@ int ia_css_yuv444_io_config(const struct ia_css_binary      *binary,
 				    "ia_css_yuv444_io_config() get part enter:\n");
 #endif
 
-		ia_css_dma_configure_from_info(&config, in_frame_info);
+		ret = ia_css_dma_configure_from_info(&config, in_frame_info);
+		if (ret)
+			return ret;
+
 		// The base_address of the input frame will be set in the ISP
 		to->width = in_frame_info->res.width;
 		to->height = in_frame_info->res.height;
@@ -77,7 +81,10 @@ int ia_css_yuv444_io_config(const struct ia_css_binary      *binary,
 				    "ia_css_yuv444_io_config() put part enter:\n");
 #endif
 
-		ia_css_dma_configure_from_info(&config, &out_frames[0]->info);
+		ret = ia_css_dma_configure_from_info(&config, &out_frames[0]->info);
+		if (ret)
+			return ret;
+
 		to->base_address = out_frames[0]->data;
 		to->width = out_frames[0]->info.res.width;
 		to->height = out_frames[0]->info.res.height;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index 137e5b286ecf..be9e4ef29fce 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -57,16 +57,21 @@ int ia_css_output_config(struct sh_css_isp_output_isp_config *to,
 			 unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
+	int ret;
+
+	ret = ia_css_dma_configure_from_info(&to->port_b, from->info);
+	if (ret)
+		return ret;
 
-	(void)size;
-	ia_css_dma_configure_from_info(&to->port_b, from->info);
 	to->width_a_over_b = elems_a / to->port_b.elems;
 	to->height = from->info ? from->info->res.height : 0;
 	to->enable = from->info != NULL;
 	ia_css_frame_info_to_frame_sp_info(&to->info, from->info);
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
-	assert(elems_a % to->port_b.elems == 0);
+	if (elems_a % to->port_b.elems != 0)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
index 38ad6e52a848..9fd4435e96b0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
@@ -33,16 +33,21 @@ int ia_css_qplane_config(struct sh_css_isp_qplane_isp_config *to,
 			 unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
+	int ret;
+
+	ret = ia_css_dma_configure_from_info(&to->port_b, from->info);
+	if (ret)
+		return ret;
 
-	(void)size;
-	ia_css_dma_configure_from_info(&to->port_b, from->info);
 	to->width_a_over_b = elems_a / to->port_b.elems;
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
-	assert(elems_a % to->port_b.elems == 0);
+	if (elems_a % to->port_b.elems != 0)
+		return -EINVAL;
 
 	to->inout_port_config = from->pipe->inout_port_config;
 	to->format = from->info->format;
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index aba0409a4a0d..646d6e39c1e5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -71,8 +71,8 @@ int ia_css_raw_config(struct sh_css_isp_raw_isp_config *to,
 	unsigned int elems_a = ISP_VEC_NELEMS;
 	const struct ia_css_frame_info *in_info = from->in_info;
 	const struct ia_css_frame_info *internal_info = from->internal_info;
+	int ret;
 
-	(void)size;
 #if !defined(ISP2401)
 	/* 2401 input system uses input width width */
 	in_info = internal_info;
@@ -84,7 +84,9 @@ int ia_css_raw_config(struct sh_css_isp_raw_isp_config *to,
 		in_info = internal_info;
 
 #endif
-	ia_css_dma_configure_from_info(&to->port_b, in_info);
+	ret = ia_css_dma_configure_from_info(&to->port_b, in_info);
+	if (ret)
+		return ret;
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
 	assert((in_info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED) ||
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
index 663dbb7c39eb..08ed916a7eb8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
@@ -27,9 +27,12 @@ int ia_css_ref_config(struct sh_css_isp_ref_isp_config *to,
 		      unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS, i;
+	int ret;
 
 	if (from->ref_frames[0]) {
-		ia_css_dma_configure_from_info(&to->port_b, &from->ref_frames[0]->info);
+		ret = ia_css_dma_configure_from_info(&to->port_b, &from->ref_frames[0]->info);
+		if (ret)
+			return ret;
 		to->width_a_over_b = elems_a / to->port_b.elems;
 		to->dvs_frame_delay = from->dvs_frame_delay;
 	} else {
@@ -50,7 +53,9 @@ int ia_css_ref_config(struct sh_css_isp_ref_isp_config *to,
 	}
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
-	assert(elems_a % to->port_b.elems == 0);
+	if (elems_a % to->port_b.elems != 0)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
index 3a5bea219c48..7177cf292fb0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
@@ -77,9 +77,11 @@ int ia_css_tnr_config(struct sh_css_isp_tnr_isp_config *to,
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
 	unsigned int i;
+	int ret;
 
-	(void)size;
-	ia_css_dma_configure_from_info(&to->port_b, &from->tnr_frames[0]->info);
+	ret = ia_css_dma_configure_from_info(&to->port_b, &from->tnr_frames[0]->info);
+	if (ret)
+		return ret;
 	to->width_a_over_b = elems_a / to->port_b.elems;
 	to->frame_height = from->tnr_frames[0]->info.res.height;
 	for (i = 0; i < NUM_TNR_FRAMES; i++) {
@@ -88,7 +90,9 @@ int ia_css_tnr_config(struct sh_css_isp_tnr_isp_config *to,
 	}
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
-	assert(elems_a % to->port_b.elems == 0);
+	if (elems_a % to->port_b.elems != 0)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 1ace34f59f8d..aecdcbe04ce1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -31,18 +31,21 @@ int ia_css_vf_config(struct sh_css_isp_vf_isp_config      *to,
 		    unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
+	int ret;
 
-	(void)size;
 	to->vf_downscale_bits = from->vf_downscale_bits;
 	to->enable = from->info != NULL;
 
 	if (from->info) {
 		ia_css_frame_info_to_frame_sp_info(&to->info, from->info);
-		ia_css_dma_configure_from_info(&to->dma.port_b, from->info);
+		ret = ia_css_dma_configure_from_info(&to->dma.port_b, from->info);
+		if (ret)
+			return ret;
 		to->dma.width_a_over_b = elems_a / to->dma.port_b.elems;
 
 		/* Assume divisiblity here, may need to generalize to fixed point. */
-		assert(elems_a % to->dma.port_b.elems == 0);
+		if (elems_a % to->dma.port_b.elems != 0)
+			return -EINVAL;
 	}
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 647383e10f5e..3c9dd5c03850 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -608,7 +608,12 @@ int ia_css_dma_configure_from_info(struct dma_port_config *config,
 	config->elems  = (uint8_t)elems_b;
 	config->width  = (uint16_t)info->res.width;
 	config->crop   = 0;
-	assert(config->width <= info->padded_width);
+
+	if (config->width > info->padded_width) {
+		dev_err(atomisp_dev, "internal error: padded_width is too small!\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.31.1

