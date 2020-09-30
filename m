Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9948D27E12D
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgI3GgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:59314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727887AbgI3GgI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:08 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A8272145D;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=KSQdhVCwLXMmbKuCw0FaRITnyXOd7ETydwCFt7TfWg8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EncXzmypd8oBxoUobMn7J5C7OeBODcf9Kz2t6WFAoCiMqisI3109VUCZb7XzAgQ4D
         ekAxqPyHAs/6o8+XxsW2EEwzYG9897GwK5CTvgfC5pYqiZz185S3IzBy3BClruquHz
         bKUcRDCaOz+JskRWxrn3O7PT3a9W7kMioAO+l5ZU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVid-001QmS-Sd; Wed, 30 Sep 2020 08:36:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] media: docs: ipu3.rst: rely at automarkup extension
Date:   Wed, 30 Sep 2020 08:35:56 +0200
Message-Id: <b9d4cdf89bafb131dab4030c3e8789f5e1c14193.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several :c:type: definitions there, in order to
do cross-references with the driver's documentation.

Those are broken when docs are built with Sphinx 3.x, as
it would require :c:struct: instead.

For Sphinx < 3.x, the automarkup.py extension is able to do the
replacement already, and a future improvement on it should make
it also work with Sphinx 3.x.

So, get rid of the usage of the :c:type: macro there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/ipu3.rst | 38 ++++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index a4cd489fc5dc..07d139bf8459 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -488,63 +488,63 @@ Name			 Description
 Optical Black Correction Optical Black Correction block subtracts a pre-defined
 			 value from the respective pixel values to obtain better
 			 image quality.
-			 Defined in :c:type:`ipu3_uapi_obgrid_param`.
+			 Defined in struct ipu3_uapi_obgrid_param.
 Linearization		 This algo block uses linearization parameters to
 			 address non-linearity sensor effects. The Lookup table
 			 table is defined in
-			 :c:type:`ipu3_uapi_isp_lin_vmem_params`.
+			 struct ipu3_uapi_isp_lin_vmem_params.
 SHD			 Lens shading correction is used to correct spatial
 			 non-uniformity of the pixel response due to optical
 			 lens shading. This is done by applying a different gain
 			 for each pixel. The gain, black level etc are
-			 configured in :c:type:`ipu3_uapi_shd_config_static`.
+			 configured in struct ipu3_uapi_shd_config_static.
 BNR			 Bayer noise reduction block removes image noise by
 			 applying a bilateral filter.
-			 See :c:type:`ipu3_uapi_bnr_static_config` for details.
+			 See struct ipu3_uapi_bnr_static_config for details.
 ANR			 Advanced Noise Reduction is a block based algorithm
 			 that performs noise reduction in the Bayer domain. The
 			 convolution matrix etc can be found in
-			 :c:type:`ipu3_uapi_anr_config`.
+			 struct ipu3_uapi_anr_config.
 DM			 Demosaicing converts raw sensor data in Bayer format
 			 into RGB (Red, Green, Blue) presentation. Then add
 			 outputs of estimation of Y channel for following stream
 			 processing by Firmware. The struct is defined as
-			 :c:type:`ipu3_uapi_dm_config`.
+			 struct ipu3_uapi_dm_config.
 Color Correction	 Color Correction algo transforms sensor specific color
 			 space to the standard "sRGB" color space. This is done
 			 by applying 3x3 matrix defined in
-			 :c:type:`ipu3_uapi_ccm_mat_config`.
-Gamma correction	 Gamma correction :c:type:`ipu3_uapi_gamma_config` is a
+			 struct ipu3_uapi_ccm_mat_config.
+Gamma correction	 Gamma correction struct ipu3_uapi_gamma_config is a
 			 basic non-linear tone mapping correction that is
 			 applied per pixel for each pixel component.
 CSC			 Color space conversion transforms each pixel from the
 			 RGB primary presentation to YUV (Y: brightness,
 			 UV: Luminance) presentation. This is done by applying
 			 a 3x3 matrix defined in
-			 :c:type:`ipu3_uapi_csc_mat_config`
+			 struct ipu3_uapi_csc_mat_config
 CDS			 Chroma down sampling
 			 After the CSC is performed, the Chroma Down Sampling
 			 is applied for a UV plane down sampling by a factor
 			 of 2 in each direction for YUV 4:2:0 using a 4x2
-			 configurable filter :c:type:`ipu3_uapi_cds_params`.
+			 configurable filter struct ipu3_uapi_cds_params.
 CHNR			 Chroma noise reduction
 			 This block processes only the chrominance pixels and
 			 performs noise reduction by cleaning the high
 			 frequency noise.
-			 See struct :c:type:`ipu3_uapi_yuvp1_chnr_config`.
+			 See struct struct ipu3_uapi_yuvp1_chnr_config.
 TCC			 Total color correction as defined in struct
-			 :c:type:`ipu3_uapi_yuvp2_tcc_static_config`.
+			 struct ipu3_uapi_yuvp2_tcc_static_config.
 XNR3			 eXtreme Noise Reduction V3 is the third revision of
 			 noise reduction algorithm used to improve image
 			 quality. This removes the low frequency noise in the
 			 captured image. Two related structs are  being defined,
-			 :c:type:`ipu3_uapi_isp_xnr3_params` for ISP data memory
-			 and :c:type:`ipu3_uapi_isp_xnr3_vmem_params` for vector
+			 struct ipu3_uapi_isp_xnr3_params for ISP data memory
+			 and struct ipu3_uapi_isp_xnr3_vmem_params for vector
 			 memory.
 TNR			 Temporal Noise Reduction block compares successive
 			 frames in time to remove anomalies / noise in pixel
-			 values. :c:type:`ipu3_uapi_isp_tnr3_vmem_params` and
-			 :c:type:`ipu3_uapi_isp_tnr3_params` are defined for ISP
+			 values. struct ipu3_uapi_isp_tnr3_vmem_params and
+			 struct ipu3_uapi_isp_tnr3_params are defined for ISP
 			 vector and data memory respectively.
 ======================== =======================================================
 
@@ -576,9 +576,9 @@ processor, while many others will use a set of fixed hardware blocks also
 called accelerator cluster (ACC) to crunch pixel data and produce statistics.
 
 ACC parameters of individual algorithms, as defined by
-:c:type:`ipu3_uapi_acc_param`, can be chosen to be applied by the user
-space through struct :c:type:`ipu3_uapi_flags` embedded in
-:c:type:`ipu3_uapi_params` structure. For parameters that are configured as
+struct ipu3_uapi_acc_param, can be chosen to be applied by the user
+space through struct struct ipu3_uapi_flags embedded in
+struct ipu3_uapi_params structure. For parameters that are configured as
 not enabled by the user space, the corresponding structs are ignored by the
 driver, in which case the existing configuration of the algorithm will be
 preserved.
-- 
2.26.2

