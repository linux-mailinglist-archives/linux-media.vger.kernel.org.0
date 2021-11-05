Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD67446817
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 18:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbhKERvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 13:51:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234178AbhKERu7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 13:50:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3052460F38;
        Fri,  5 Nov 2021 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636134499;
        bh=L6S2cQGzClE8BmoEqH/O6wQdEc/E3J7xkTpyT5f7WaE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rB/72AxScy0VYEM4BeT386rMtYmY0ZbLPNfCDCovTVIjtOt2s1PuJSWtQp3UZe9IN
         w9/7X2BDlrB+dg7eU0Bf8xBft9vX1kJMg4j04GT/cufyI4BFiO8SI7JSW29jwYiWFa
         zW0TR4xpowbsiJ53fPqeI8gkJtlmrqzTU4hUCzsUlTIcJMEJPUXEZi68YrUD3hxHeZ
         VY16BknpWqr8tRD75X26TqQ3sXJJr9sqELVAijTLK28VLII+zYLclsfK88uF1LT6Dv
         FZQZw4zdIKFzy3QtqG3wy0nR7VPOUWnur2CsO02qHlT6hCdViqy6JV2EZalWpxGbx8
         N117JGo064fMw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mj3K4-007eNr-FR; Fri, 05 Nov 2021 17:48:16 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 7/8] media: atomisp: add return codes for pipeline config functions
Date:   Fri,  5 Nov 2021 17:48:14 +0000
Message-Id: <4c53ca49a2787065e42c322865a9f0417b944b99.1636134411.git.mchehab+huawei@kernel.org>
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

Those functions can internally break, but, as they don't return
errors, internally there are some assert() calls, which is bad,
as it hangs the driver.

So, add return codes there, in preparation for removing such
assert() calls.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../kernels/crop/crop_1.0/ia_css_crop.host.c  |  9 +++---
 .../kernels/crop/crop_1.0/ia_css_crop.host.h  |  8 ++---
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c |  9 +++---
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h |  8 ++---
 .../bayer_io_ls/ia_css_bayer_io.host.c        |  7 ++---
 .../bayer_io_ls/ia_css_bayer_io.host.h        |  6 ++--
 .../yuv444_io_ls/ia_css_yuv444_io.host.c      |  7 ++---
 .../yuv444_io_ls/ia_css_yuv444_io.host.h      |  6 ++--
 .../output/output_1.0/ia_css_output.host.c    | 31 +++++++------------
 .../output/output_1.0/ia_css_output.host.h    | 24 ++++++--------
 .../qplane/qplane_2/ia_css_qplane.host.c      |  9 +++---
 .../qplane/qplane_2/ia_css_qplane.host.h      |  8 ++---
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c | 10 +++---
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.h |  8 ++---
 .../isp/kernels/ref/ref_1.0/ia_css_ref.host.c |  9 +++---
 .../isp/kernels/ref/ref_1.0/ia_css_ref.host.h |  8 ++---
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c |  9 +++---
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h |  8 ++---
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    |  9 +++---
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.h    |  8 ++---
 .../runtime/frame/interface/ia_css_frame.h    |  5 ++-
 .../atomisp/pci/runtime/frame/src/frame.c     |  7 ++---
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  3 +-
 23 files changed, 87 insertions(+), 129 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
index 8ab0604b364a..69b1c493e020 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
@@ -36,11 +36,9 @@ ia_css_crop_encode(
 	to->crop_pos = from->crop_pos;
 }
 
-void
-ia_css_crop_config(
-    struct sh_css_isp_crop_isp_config *to,
-    const struct ia_css_crop_configuration  *from,
-    unsigned int size)
+int ia_css_crop_config(struct sh_css_isp_crop_isp_config *to,
+		       const struct ia_css_crop_configuration *from,
+		       unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
 
@@ -50,6 +48,7 @@ ia_css_crop_config(
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
 	assert(elems_a % to->port_b.elems == 0);
+	return 0;
 }
 
 int ia_css_crop_configure(const struct ia_css_binary     *binary,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
index 877601bfa7c0..e700149c1e95 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
@@ -28,11 +28,9 @@ ia_css_crop_encode(
     const struct ia_css_crop_config *from,
     unsigned int size);
 
-void
-ia_css_crop_config(
-    struct sh_css_isp_crop_isp_config      *to,
-    const struct ia_css_crop_configuration *from,
-    unsigned int size);
+int ia_css_crop_config(struct sh_css_isp_crop_isp_config      *to,
+		       const struct ia_css_crop_configuration *from,
+		       unsigned int size);
 
 int ia_css_crop_configure(const struct ia_css_binary     *binary,
 			  const struct ia_css_frame_info *from);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index 9933113adf46..be68192c2437 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -51,11 +51,9 @@ ia_css_fpn_dump(
 			    "fpn_enabled", fpn->enabled);
 }
 
-void
-ia_css_fpn_config(
-    struct sh_css_isp_fpn_isp_config *to,
-    const struct ia_css_fpn_configuration *from,
-    unsigned int size)
+int ia_css_fpn_config(struct sh_css_isp_fpn_isp_config *to,
+		      const struct ia_css_fpn_configuration *from,
+		      unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
 
@@ -65,6 +63,7 @@ ia_css_fpn_config(
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
 	assert(elems_a % to->port_b.elems == 0);
+	return 0;
 }
 
 int ia_css_fpn_configure(const struct ia_css_binary     *binary,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
index 1c644c0decfe..bd341fa287fe 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
@@ -31,11 +31,9 @@ ia_css_fpn_dump(
     const struct sh_css_isp_fpn_params *fpn,
     unsigned int level);
 
-void
-ia_css_fpn_config(
-    struct sh_css_isp_fpn_isp_config      *to,
-    const struct ia_css_fpn_configuration *from,
-    unsigned int size);
+int ia_css_fpn_config(struct sh_css_isp_fpn_isp_config      *to,
+		      const struct ia_css_fpn_configuration *from,
+		      unsigned int size);
 
 int ia_css_fpn_configure(const struct ia_css_binary     *binary,
 			 const struct ia_css_frame_info *from);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
index ea8055148fb3..5e2755b45586 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
@@ -22,10 +22,8 @@
 #include "ia_css_isp_params.h"
 #include "ia_css_frame.h"
 
-void
-ia_css_bayer_io_config(
-    const struct ia_css_binary      *binary,
-    const struct sh_css_binary_args *args)
+int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
+			   const struct sh_css_binary_args *args)
 {
 	const struct ia_css_frame *in_frame = args->in_frame;
 	const struct ia_css_frame **out_frames = (const struct ia_css_frame **)
@@ -91,4 +89,5 @@ ia_css_bayer_io_config(
 				    "ia_css_bayer_io_config() put part leave:\n");
 #endif
 	}
+	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h
index 635ccb1b27d0..9c7e5a1ad57b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h
@@ -21,9 +21,7 @@
 #include "ia_css_binary.h"
 #include "sh_css_internal.h"
 
-void
-ia_css_bayer_io_config(
-    const struct ia_css_binary     *binary,
-    const struct sh_css_binary_args *args);
+int ia_css_bayer_io_config(const struct ia_css_binary     *binary,
+			   const struct sh_css_binary_args *args);
 
 #endif /*__BAYER_IO_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
index f8bd207b28e1..46fa1f708571 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
@@ -22,10 +22,8 @@ more details.
 #include "ia_css_isp_params.h"
 #include "ia_css_frame.h"
 
-void
-ia_css_yuv444_io_config(
-    const struct ia_css_binary      *binary,
-    const struct sh_css_binary_args *args)
+int ia_css_yuv444_io_config(const struct ia_css_binary      *binary,
+			    const struct sh_css_binary_args *args)
 {
 	const struct ia_css_frame *in_frame = args->in_frame;
 	const struct ia_css_frame **out_frames = (const struct ia_css_frame **)
@@ -91,4 +89,5 @@ ia_css_yuv444_io_config(
 				    "ia_css_yuv444_io_config() put part leave:\n");
 #endif
 	}
+	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
index e7cfd380e108..13e50590f91e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
@@ -21,9 +21,7 @@ more details.
 #include "ia_css_binary.h"
 #include "sh_css_internal.h"
 
-void
-ia_css_yuv444_io_config(
-    const struct ia_css_binary     *binary,
-    const struct sh_css_binary_args *args);
+int ia_css_yuv444_io_config(const struct ia_css_binary     *binary,
+			    const struct sh_css_binary_args *args);
 
 #endif /*__YUV44_IO_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index cf6311ebbeab..137e5b286ecf 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -52,11 +52,9 @@ ia_css_output_encode(
 	to->enable_vflip = from->enable_vflip;
 }
 
-void
-ia_css_output_config(
-    struct sh_css_isp_output_isp_config *to,
-    const struct ia_css_output_configuration  *from,
-    unsigned int size)
+int ia_css_output_config(struct sh_css_isp_output_isp_config *to,
+			 const struct ia_css_output_configuration  *from,
+			 unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
 
@@ -69,26 +67,21 @@ ia_css_output_config(
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
 	assert(elems_a % to->port_b.elems == 0);
+	return 0;
 }
 
-void
-ia_css_output0_config(
-    struct sh_css_isp_output_isp_config       *to,
-    const struct ia_css_output0_configuration *from,
-    unsigned int size)
+int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
+			  const struct ia_css_output0_configuration *from,
+			  unsigned int size)
 {
-	ia_css_output_config(
-	    to, (const struct ia_css_output_configuration *)from, size);
+	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
 }
 
-void
-ia_css_output1_config(
-    struct sh_css_isp_output_isp_config       *to,
-    const struct ia_css_output1_configuration *from,
-    unsigned int size)
+int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
+		          const struct ia_css_output1_configuration *from,
+			  unsigned int size)
 {
-	ia_css_output_config(
-	    to, (const struct ia_css_output_configuration *)from, size);
+	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
 }
 
 int ia_css_output_configure(const struct ia_css_binary     *binary,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
index 04c0023794cc..c8523e95a394 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
@@ -30,23 +30,17 @@ ia_css_output_encode(
     const struct ia_css_output_config *from,
     unsigned int size);
 
-void
-ia_css_output_config(
-    struct sh_css_isp_output_isp_config      *to,
-    const struct ia_css_output_configuration *from,
-    unsigned int size);
+int ia_css_output_config(struct sh_css_isp_output_isp_config      *to,
+			 const struct ia_css_output_configuration *from,
+			 unsigned int size);
 
-void
-ia_css_output0_config(
-    struct sh_css_isp_output_isp_config       *to,
-    const struct ia_css_output0_configuration *from,
-    unsigned int size);
+int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
+			  const struct ia_css_output0_configuration *from,
+			  unsigned int size);
 
-void
-ia_css_output1_config(
-    struct sh_css_isp_output_isp_config       *to,
-    const struct ia_css_output1_configuration *from,
-    unsigned int size);
+int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
+			  const struct ia_css_output1_configuration *from,
+			  unsigned int size);
 
 int ia_css_output_configure(const struct ia_css_binary     *binary,
 			    const struct ia_css_frame_info *from);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
index 7858dc573980..38ad6e52a848 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
@@ -28,11 +28,9 @@ static const struct ia_css_qplane_configuration default_config = {
 	.pipe = (struct sh_css_sp_pipeline *)NULL,
 };
 
-void
-ia_css_qplane_config(
-    struct sh_css_isp_qplane_isp_config *to,
-    const struct ia_css_qplane_configuration  *from,
-    unsigned int size)
+int ia_css_qplane_config(struct sh_css_isp_qplane_isp_config *to,
+			 const struct ia_css_qplane_configuration  *from,
+			 unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
 
@@ -45,6 +43,7 @@ ia_css_qplane_config(
 
 	to->inout_port_config = from->pipe->inout_port_config;
 	to->format = from->info->format;
+	return 0;
 }
 
 int ia_css_qplane_configure(const struct sh_css_sp_pipeline *pipe,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
index c4b863dc1498..b3f8fa30c8ce 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
@@ -29,11 +29,9 @@
 #include "ia_css_qplane_types.h"
 #include "ia_css_qplane_param.h"
 
-void
-ia_css_qplane_config(
-    struct sh_css_isp_qplane_isp_config      *to,
-    const struct ia_css_qplane_configuration *from,
-    unsigned int size);
+int ia_css_qplane_config(struct sh_css_isp_qplane_isp_config      *to,
+			 const struct ia_css_qplane_configuration *from,
+			 unsigned int size);
 
 int ia_css_qplane_configure(const struct sh_css_sp_pipeline *pipe,
 			    const struct ia_css_binary      *binary,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index b35d81ad1a38..aba0409a4a0d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -64,11 +64,9 @@ css2isp_stream_format(enum atomisp_input_format from) {
 	}
 }
 
-void
-ia_css_raw_config(
-    struct sh_css_isp_raw_isp_config *to,
-    const struct ia_css_raw_configuration  *from,
-    unsigned int size)
+int ia_css_raw_config(struct sh_css_isp_raw_isp_config *to,
+		      const struct ia_css_raw_configuration  *from,
+		      unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
 	const struct ia_css_frame_info *in_info = from->in_info;
@@ -104,6 +102,8 @@ ia_css_raw_config(
 	to->start_line          = in_info->crop_info.start_line;
 	to->enable_left_padding = from->enable_left_padding;
 #endif
+
+	return 0;
 }
 
 int ia_css_raw_configure(const struct sh_css_sp_pipeline *pipe,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
index 33374ac9db99..23da51aabc8d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
@@ -21,11 +21,9 @@
 #include "ia_css_raw_types.h"
 #include "ia_css_raw_param.h"
 
-void
-ia_css_raw_config(
-    struct sh_css_isp_raw_isp_config      *to,
-    const struct ia_css_raw_configuration *from,
-    unsigned int size);
+int ia_css_raw_config(struct sh_css_isp_raw_isp_config      *to,
+		      const struct ia_css_raw_configuration *from,
+		      unsigned int size);
 
 int ia_css_raw_configure(const struct sh_css_sp_pipeline *pipe,
 			 const struct ia_css_binary     *binary,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
index f5b0e333d554..663dbb7c39eb 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
@@ -22,11 +22,9 @@
 #include "isp.h"
 #include "ia_css_ref.host.h"
 
-void
-ia_css_ref_config(
-    struct sh_css_isp_ref_isp_config *to,
-    const struct ia_css_ref_configuration  *from,
-    unsigned int size)
+int ia_css_ref_config(struct sh_css_isp_ref_isp_config *to,
+		      const struct ia_css_ref_configuration  *from,
+		      unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS, i;
 
@@ -53,6 +51,7 @@ ia_css_ref_config(
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
 	assert(elems_a % to->port_b.elems == 0);
+	return 0;
 }
 
 int ia_css_ref_configure(const struct ia_css_binary        *binary,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
index c407d471c7a0..388cd4c367ba 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
@@ -23,11 +23,9 @@
 #include "ia_css_ref_param.h"
 #include "ia_css_ref_state.h"
 
-void
-ia_css_ref_config(
-    struct sh_css_isp_ref_isp_config      *to,
-    const struct ia_css_ref_configuration *from,
-    unsigned int size);
+int ia_css_ref_config(struct sh_css_isp_ref_isp_config      *to,
+		      const struct ia_css_ref_configuration *from,
+		      unsigned int size);
 
 int ia_css_ref_configure(const struct ia_css_binary        *binary,
 			 const struct ia_css_frame * const *ref_frames,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
index 170bd70b6e24..3a5bea219c48 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
@@ -71,11 +71,9 @@ ia_css_tnr_debug_dtrace(
 			    config->threshold_y, config->threshold_uv);
 }
 
-void
-ia_css_tnr_config(
-    struct sh_css_isp_tnr_isp_config *to,
-    const struct ia_css_tnr_configuration *from,
-    unsigned int size)
+int ia_css_tnr_config(struct sh_css_isp_tnr_isp_config *to,
+		      const struct ia_css_tnr_configuration *from,
+		      unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
 	unsigned int i;
@@ -91,6 +89,7 @@ ia_css_tnr_config(
 
 	/* Assume divisiblity here, may need to generalize to fixed point. */
 	assert(elems_a % to->port_b.elems == 0);
+	return 0;
 }
 
 int ia_css_tnr_configure(const struct ia_css_binary     *binary,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
index 1c421c6a8512..acf92052b442 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
@@ -39,11 +39,9 @@ ia_css_tnr_debug_dtrace(
     const struct ia_css_tnr_config *config,
     unsigned int level);
 
-void
-ia_css_tnr_config(
-    struct sh_css_isp_tnr_isp_config      *to,
-    const struct ia_css_tnr_configuration *from,
-    unsigned int size);
+int ia_css_tnr_config(struct sh_css_isp_tnr_isp_config      *to,
+		      const struct ia_css_tnr_configuration *from,
+		      unsigned int size);
 
 int ia_css_tnr_configure(const struct ia_css_binary        *binary,
 			 const struct ia_css_frame * const *frames);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index a0926d05f1e1..1ace34f59f8d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -26,11 +26,9 @@
 
 #include "isp.h"
 
-void
-ia_css_vf_config(
-    struct sh_css_isp_vf_isp_config      *to,
-    const struct ia_css_vf_configuration *from,
-    unsigned int size)
+int ia_css_vf_config(struct sh_css_isp_vf_isp_config      *to,
+		    const struct ia_css_vf_configuration *from,
+		    unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
 
@@ -46,6 +44,7 @@ ia_css_vf_config(
 		/* Assume divisiblity here, may need to generalize to fixed point. */
 		assert(elems_a % to->dma.port_b.elems == 0);
 	}
+	return 0;
 }
 
 /* compute the log2 of the downscale factor needed to get closest
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h
index 0e8de034a00e..d6b45d3754b0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h
@@ -32,11 +32,9 @@ sh_css_vf_downscale_log2(
     const struct ia_css_frame_info *vf_info,
     unsigned int *downscale_log2);
 
-void
-ia_css_vf_config(
-    struct sh_css_isp_vf_isp_config *to,
-    const struct ia_css_vf_configuration *from,
-    unsigned int size);
+int ia_css_vf_config(struct sh_css_isp_vf_isp_config *to,
+		     const struct ia_css_vf_configuration *from,
+		     unsigned int size);
 
 int
 ia_css_vf_configure(
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
index 31f01e0f58aa..51ec7073d860 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
@@ -138,9 +138,8 @@ bool ia_css_frame_is_same_type(
  * @param[in]	info           The frame info
  * @return
  */
-void ia_css_dma_configure_from_info(
-    struct dma_port_config *config,
-    const struct ia_css_frame_info *info);
+int ia_css_dma_configure_from_info(struct dma_port_config *config,
+				   const struct ia_css_frame_info *info);
 
 /* ISP2401 */
 /* @brief Finds the cropping resolution
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 10c4907187d9..647383e10f5e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -594,10 +594,8 @@ bool ia_css_frame_is_same_type(const struct ia_css_frame *frame_a,
 	return is_equal;
 }
 
-void
-ia_css_dma_configure_from_info(
-    struct dma_port_config *config,
-    const struct ia_css_frame_info *info)
+int ia_css_dma_configure_from_info(struct dma_port_config *config,
+				   const struct ia_css_frame_info *info)
 {
 	unsigned int is_raw_packed = info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED;
 	unsigned int bits_per_pixel = is_raw_packed ? info->raw_bit_depth :
@@ -611,6 +609,7 @@ ia_css_dma_configure_from_info(
 	config->width  = (uint16_t)info->res.width;
 	config->crop   = 0;
 	assert(config->width <= info->padded_width);
+	return 0;
 }
 
 /**************************************************************************
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index f36f44b5e5b2..77ac720017a2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -870,8 +870,7 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	ret = ia_css_tnr_configure(binary, args->tnr_frames);
 	if (ret)
 		return ret;
-	ia_css_bayer_io_config(binary, args);
-	return 0;
+	return ia_css_bayer_io_config(binary, args);
 }
 
 static void
-- 
2.31.1

