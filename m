Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E15844681E
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 18:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhKERvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 13:51:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:35318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234503AbhKERvE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 13:51:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B1696128E;
        Fri,  5 Nov 2021 17:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636134504;
        bh=dcazLDKRDSiWzrwuVtwxaP0taJfvimBxbeMgphlnqVE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JUzYGkAwV76fJw/uZ80kKwsWTbkp2NU2P7on177mPWPdZ4R1h3tt8ppDbTuu3pMsC
         glTTIYcYYOxGdbJI7nPcoijBautBMod4+iEVphlSyOlQsEPmWgFIHRC23WuyYpbjM9
         GwCg1SQi8p8On8MeAEEwreYpYK5+jeYzAmPl0JF/oyCPiP7PEtpzolWtqmdSbLMAfh
         xKJghar9flwl6y6iOuPXCewu96Ms38J7MW1dVZfM+NxgS7CpH2cGVRXCCBTY5uEV0y
         /k/S+MgUL2nylaFa3i2ZsBJGPPwbZ9qDuL12bp+HPmywkgpnMjdnqURrJhtcFXkV2C
         464etyR3eZRUQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mj3K4-007eNl-E3; Fri, 05 Nov 2021 17:48:16 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 5/8] media: atomisp: propagate errors at ia_css_*_configure()
Date:   Fri,  5 Nov 2021 17:48:12 +0000
Message-Id: <a1a8626163f13cf74a932e0cc2f4b2dd130933ab.1636134411.git.mchehab+huawei@kernel.org>
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

Propagate the lower lever ia_css config errors to the next
level.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../copy_output_1.0/ia_css_copy_output.host.c |  8 +++---
 .../copy_output_1.0/ia_css_copy_output.host.h |  6 ++---
 .../kernels/crop/crop_1.0/ia_css_crop.host.c  |  8 +++---
 .../kernels/crop/crop_1.0/ia_css_crop.host.h  |  6 ++---
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  8 +++---
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h |  6 ++---
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c |  8 +++---
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h |  6 ++---
 .../iterator_1.0/ia_css_iterator.host.c       | 11 +++-----
 .../output/output_1.0/ia_css_output.host.c    | 27 +++++++++----------
 .../output/output_1.0/ia_css_output.host.h    | 18 +++++--------
 .../qplane/qplane_2/ia_css_qplane.host.c      | 10 +++----
 .../qplane/qplane_2/ia_css_qplane.host.h      |  8 +++---
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c | 16 +++++------
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.h | 14 +++++-----
 .../isp/kernels/ref/ref_1.0/ia_css_ref.host.c | 12 ++++-----
 .../isp/kernels/ref/ref_1.0/ia_css_ref.host.h |  8 +++---
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c |  8 +++---
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h |  6 ++---
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 14 +++++-----
 20 files changed, 82 insertions(+), 126 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.c
index 5d34f3256a43..cc415c72ad8f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.c
@@ -34,14 +34,12 @@ ia_css_copy_output_config(
 	to->enable = from->enable;
 }
 
-void
-ia_css_copy_output_configure(
-    const struct ia_css_binary     *binary,
-    bool enable)
+int ia_css_copy_output_configure(const struct ia_css_binary *binary,
+				 bool enable)
 {
 	struct ia_css_copy_output_configuration config = default_config;
 
 	config.enable = enable;
 
-	ia_css_configure_copy_output(binary, &config);
+	return ia_css_configure_copy_output(binary, &config);
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.h
index 615cb6771884..44e3e45b0ec3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.h
@@ -27,9 +27,7 @@ ia_css_copy_output_config(
     const struct ia_css_copy_output_configuration *from,
     unsigned int size);
 
-void
-ia_css_copy_output_configure(
-    const struct ia_css_binary     *binary,
-    bool enable);
+int ia_css_copy_output_configure(const struct ia_css_binary     *binary,
+				 bool enable);
 
 #endif /* __IA_CSS_COPY_OUTPUT_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
index 38912062edd4..8ab0604b364a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
@@ -52,14 +52,12 @@ ia_css_crop_config(
 	assert(elems_a % to->port_b.elems == 0);
 }
 
-void
-ia_css_crop_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *info)
+int ia_css_crop_configure(const struct ia_css_binary     *binary,
+			  const struct ia_css_frame_info *info)
 {
 	struct ia_css_crop_configuration config = default_config;
 
 	config.info = info;
 
-	ia_css_configure_crop(binary, &config);
+	return ia_css_configure_crop(binary, &config);
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
index 21a259d33256..877601bfa7c0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
@@ -34,9 +34,7 @@ ia_css_crop_config(
     const struct ia_css_crop_configuration *from,
     unsigned int size);
 
-void
-ia_css_crop_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *from);
+int ia_css_crop_configure(const struct ia_css_binary     *binary,
+			  const struct ia_css_frame_info *from);
 
 #endif /* __IA_CSS_CROP_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index 67f5540b48b5..07ce5b4f0816 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -46,16 +46,14 @@ ia_css_dvs_config(
 	    DVS_NUM_BLOCKS_Y(from->info->res.height);
 }
 
-void
-ia_css_dvs_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *info)
+int ia_css_dvs_configure(const struct ia_css_binary     *binary,
+			 const struct ia_css_frame_info *info)
 {
 	struct ia_css_dvs_configuration config = default_config;
 
 	config.info = info;
 
-	ia_css_configure_dvs(binary, &config);
+	return ia_css_configure_dvs(binary, &config);
 }
 
 static void
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
index f9bc17ee0f86..332aa5496c04 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
@@ -35,10 +35,8 @@ ia_css_dvs_config(
     const struct ia_css_dvs_configuration *from,
     unsigned int size);
 
-void
-ia_css_dvs_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *from);
+int ia_css_dvs_configure(const struct ia_css_binary     *binary,
+			 const struct ia_css_frame_info *from);
 
 void
 convert_dvs_6axis_config(
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index 47b5c7956fbd..9933113adf46 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -67,10 +67,8 @@ ia_css_fpn_config(
 	assert(elems_a % to->port_b.elems == 0);
 }
 
-void
-ia_css_fpn_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *info)
+int ia_css_fpn_configure(const struct ia_css_binary     *binary,
+			 const struct ia_css_frame_info *info)
 {
 	struct ia_css_frame_info my_info = IA_CSS_BINARY_DEFAULT_FRAME_INFO;
 	const struct ia_css_fpn_configuration config = {
@@ -85,5 +83,5 @@ ia_css_fpn_configure(
 	my_info.raw_bayer_order = info->raw_bayer_order;
 	my_info.crop_info       = info->crop_info;
 
-	ia_css_configure_fpn(binary, &config);
+	return ia_css_configure_fpn(binary, &config);
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
index 12187d213d90..1c644c0decfe 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
@@ -37,9 +37,7 @@ ia_css_fpn_config(
     const struct ia_css_fpn_configuration *from,
     unsigned int size);
 
-void
-ia_css_fpn_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *from);
+int ia_css_fpn_configure(const struct ia_css_binary     *binary,
+			 const struct ia_css_frame_info *from);
 
 #endif /* __IA_CSS_FPN_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
index 6d8a35a73750..5f186fb03642 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
@@ -38,10 +38,9 @@ ia_css_iterator_config(
 	ia_css_resolution_to_sp_resolution(&to->dvs_envelope,  from->dvs_envelope);
 }
 
-int
-ia_css_iterator_configure(
-    const struct ia_css_binary *binary,
-    const struct ia_css_frame_info *in_info) {
+int ia_css_iterator_configure(const struct ia_css_binary *binary,
+			      const struct ia_css_frame_info *in_info)
+{
 	struct ia_css_frame_info my_info = IA_CSS_BINARY_DEFAULT_FRAME_INFO;
 	struct ia_css_iterator_configuration config = default_config;
 
@@ -75,7 +74,5 @@ ia_css_iterator_configure(
 		my_info.res.height   <<= binary->vf_downscale_log2;
 	}
 
-	ia_css_configure_iterator(binary, &config);
-
-	return 0;
+	return ia_css_configure_iterator(binary, &config);
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index c8e074f42353..cf6311ebbeab 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -91,10 +91,8 @@ ia_css_output1_config(
 	    to, (const struct ia_css_output_configuration *)from, size);
 }
 
-void
-ia_css_output_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *info)
+int ia_css_output_configure(const struct ia_css_binary     *binary,
+			    const struct ia_css_frame_info *info)
 {
 	if (info) {
 		struct ia_css_output_configuration config =
@@ -102,14 +100,13 @@ ia_css_output_configure(
 
 		config.info = info;
 
-		ia_css_configure_output(binary, &config);
+		return ia_css_configure_output(binary, &config);
 	}
+	return 0;
 }
 
-void
-ia_css_output0_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *info)
+int ia_css_output0_configure(const struct ia_css_binary    *binary,
+			    const struct ia_css_frame_info *info)
 {
 	if (info) {
 		struct ia_css_output0_configuration config =
@@ -117,14 +114,13 @@ ia_css_output0_configure(
 
 		config.info = info;
 
-		ia_css_configure_output0(binary, &config);
+		return ia_css_configure_output0(binary, &config);
 	}
+	return 0;
 }
 
-void
-ia_css_output1_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *info)
+int ia_css_output1_configure(const struct ia_css_binary     *binary,
+			     const struct ia_css_frame_info *info)
 {
 	if (info) {
 		struct ia_css_output1_configuration config =
@@ -132,8 +128,9 @@ ia_css_output1_configure(
 
 		config.info = info;
 
-		ia_css_configure_output1(binary, &config);
+		return ia_css_configure_output1(binary, &config);
 	}
+	return 0;
 }
 
 void
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
index 1f5a2242640e..04c0023794cc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
@@ -48,20 +48,14 @@ ia_css_output1_config(
     const struct ia_css_output1_configuration *from,
     unsigned int size);
 
-void
-ia_css_output_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *from);
+int ia_css_output_configure(const struct ia_css_binary     *binary,
+			    const struct ia_css_frame_info *from);
 
-void
-ia_css_output0_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *from);
+int ia_css_output0_configure(const struct ia_css_binary     *binary,
+			     const struct ia_css_frame_info *from);
 
-void
-ia_css_output1_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *from);
+int ia_css_output1_configure(const struct ia_css_binary     *binary,
+			     const struct ia_css_frame_info *from);
 
 void
 ia_css_output_dump(
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
index 1603fd44ece3..7858dc573980 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
@@ -47,16 +47,14 @@ ia_css_qplane_config(
 	to->format = from->info->format;
 }
 
-void
-ia_css_qplane_configure(
-    const struct sh_css_sp_pipeline *pipe,
-    const struct ia_css_binary      *binary,
-    const struct ia_css_frame_info  *info)
+int ia_css_qplane_configure(const struct sh_css_sp_pipeline *pipe,
+			    const struct ia_css_binary      *binary,
+			    const struct ia_css_frame_info  *info)
 {
 	struct ia_css_qplane_configuration config = default_config;
 
 	config.pipe = pipe;
 	config.info = info;
 
-	ia_css_configure_qplane(binary, &config);
+	return ia_css_configure_qplane(binary, &config);
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
index 8d940959f40a..c4b863dc1498 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
@@ -35,10 +35,8 @@ ia_css_qplane_config(
     const struct ia_css_qplane_configuration *from,
     unsigned int size);
 
-void
-ia_css_qplane_configure(
-    const struct sh_css_sp_pipeline *pipe,
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *from);
+int ia_css_qplane_configure(const struct sh_css_sp_pipeline *pipe,
+			    const struct ia_css_binary      *binary,
+			    const struct ia_css_frame_info  *from);
 
 #endif /* __IA_CSS_QPLANE_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index f741beb9ed8a..b35d81ad1a38 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -106,14 +106,12 @@ ia_css_raw_config(
 #endif
 }
 
-void
-ia_css_raw_configure(
-    const struct sh_css_sp_pipeline *pipe,
-    const struct ia_css_binary      *binary,
-    const struct ia_css_frame_info  *in_info,
-    const struct ia_css_frame_info  *internal_info,
-    bool two_ppc,
-    bool deinterleaved)
+int ia_css_raw_configure(const struct sh_css_sp_pipeline *pipe,
+			 const struct ia_css_binary      *binary,
+			 const struct ia_css_frame_info  *in_info,
+			 const struct ia_css_frame_info  *internal_info,
+			 bool two_ppc,
+			 bool deinterleaved)
 {
 	u8 enable_left_padding = (uint8_t)((binary->left_padding) ? 1 : 0);
 	struct ia_css_raw_configuration config = default_config;
@@ -126,5 +124,5 @@ ia_css_raw_configure(
 	config.deinterleaved       = deinterleaved;
 	config.enable_left_padding = enable_left_padding;
 
-	ia_css_configure_raw(binary, &config);
+	return ia_css_configure_raw(binary, &config);
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
index 346928435a8b..33374ac9db99 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
@@ -27,13 +27,11 @@ ia_css_raw_config(
     const struct ia_css_raw_configuration *from,
     unsigned int size);
 
-void
-ia_css_raw_configure(
-    const struct sh_css_sp_pipeline *pipe,
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame_info *in_info,
-    const struct ia_css_frame_info *internal_info,
-    bool two_ppc,
-    bool deinterleaved);
+int ia_css_raw_configure(const struct sh_css_sp_pipeline *pipe,
+			 const struct ia_css_binary     *binary,
+			 const struct ia_css_frame_info *in_info,
+			 const struct ia_css_frame_info *internal_info,
+			 bool two_ppc,
+			 bool deinterleaved);
 
 #endif /* __IA_CSS_RAW_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
index 061558fbe329..f5b0e333d554 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
@@ -55,19 +55,19 @@ ia_css_ref_config(
 	assert(elems_a % to->port_b.elems == 0);
 }
 
-void
-ia_css_ref_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame * const *ref_frames,
-    const uint32_t dvs_frame_delay)
+int ia_css_ref_configure(const struct ia_css_binary        *binary,
+			 const struct ia_css_frame * const *ref_frames,
+			 const uint32_t dvs_frame_delay)
 {
 	struct ia_css_ref_configuration config;
 	unsigned int i;
 
 	for (i = 0; i < MAX_NUM_VIDEO_DELAY_FRAMES; i++)
 		config.ref_frames[i] = ref_frames[i];
+
 	config.dvs_frame_delay = dvs_frame_delay;
-	ia_css_configure_ref(binary, &config);
+
+	return ia_css_configure_ref(binary, &config);
 }
 
 void
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
index 3ce590b436a1..c407d471c7a0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
@@ -29,11 +29,9 @@ ia_css_ref_config(
     const struct ia_css_ref_configuration *from,
     unsigned int size);
 
-void
-ia_css_ref_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame * const *ref_frames,
-    const uint32_t dvs_frame_delay);
+int ia_css_ref_configure(const struct ia_css_binary        *binary,
+			 const struct ia_css_frame * const *ref_frames,
+			 const uint32_t                    dvs_frame_delay);
 
 void
 ia_css_init_ref_state(
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
index ac80e6c6e67e..170bd70b6e24 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
@@ -93,10 +93,8 @@ ia_css_tnr_config(
 	assert(elems_a % to->port_b.elems == 0);
 }
 
-void
-ia_css_tnr_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame * const *frames)
+int ia_css_tnr_configure(const struct ia_css_binary     *binary,
+			 const struct ia_css_frame * const *frames)
 {
 	struct ia_css_tnr_configuration config;
 	unsigned int i;
@@ -104,7 +102,7 @@ ia_css_tnr_configure(
 	for (i = 0; i < NUM_TNR_FRAMES; i++)
 		config.tnr_frames[i] = frames[i];
 
-	ia_css_configure_tnr(binary, &config);
+	return ia_css_configure_tnr(binary, &config);
 }
 
 void
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
index 90d6e6b44a8d..1c421c6a8512 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
@@ -45,10 +45,8 @@ ia_css_tnr_config(
     const struct ia_css_tnr_configuration *from,
     unsigned int size);
 
-void
-ia_css_tnr_configure(
-    const struct ia_css_binary     *binary,
-    const struct ia_css_frame * const *frames);
+int ia_css_tnr_configure(const struct ia_css_binary        *binary,
+			 const struct ia_css_frame * const *frames);
 
 void
 ia_css_init_tnr_state(
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index dd3670972936..a0926d05f1e1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -120,12 +120,11 @@ configure_dma(
 	config->info = vf_info;
 }
 
-int
-ia_css_vf_configure(
-    const struct ia_css_binary *binary,
-    const struct ia_css_frame_info *out_info,
-    struct ia_css_frame_info *vf_info,
-    unsigned int *downscale_log2) {
+int ia_css_vf_configure(const struct ia_css_binary *binary,
+		        const struct ia_css_frame_info *out_info,
+			struct ia_css_frame_info *vf_info,
+			unsigned int *downscale_log2)
+{
 	int err;
 	struct ia_css_vf_configuration config;
 	const struct ia_css_binary_info *info = &binary->info->sp;
@@ -138,7 +137,6 @@ ia_css_vf_configure(
 
 	if (vf_info)
 		vf_info->raw_bit_depth = info->dma.vfdec_bits_per_pixel;
-	ia_css_configure_vf(binary, &config);
 
-	return 0;
+	return ia_css_configure_vf(binary, &config);
 }
-- 
2.31.1

