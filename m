Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E5A35B75B
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 01:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235808AbhDKXJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 19:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbhDKXJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 19:09:25 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1FFC061574;
        Sun, 11 Apr 2021 16:09:08 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id w8so4513808pfn.9;
        Sun, 11 Apr 2021 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=702VXeV1tG2JgyUGYrhwmHnm+9d2MUhJlgT5hLkfgaE=;
        b=BVoIE4gqs0qhVQtL0CyUjJolJ/+7TlrWuHKS70bajewQPUfZffwPRPCs946taO8+9r
         frANpMjM5TfJRpBh1wxP0MzhPvl/JVHeor6/54WbswIzTjgQve2DbUzrprcD+/8oiZe9
         xOJ5MtJn0IfN3rlCHVKykibe8miKaOQhVzK5CQ/mXE1u6OtZPkla54G4dBPDLgTYz4dy
         OEu2W/iTlIyxsy53uyI8rXre900ii03nrbW8sUyXeUKKNfnY2rBF04pMlMQRKJMfzYR7
         YcwY4pdkOdX5bHkrxm496VsAq9k7zbtkx2TSuxhiQgeAsW9EI1h9amIjYykC4e+fNVVt
         89Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=702VXeV1tG2JgyUGYrhwmHnm+9d2MUhJlgT5hLkfgaE=;
        b=Xy4SqQFLM/PkL9N14skeo0E7m1aeK+SEEUDdgj/Xjg75XGbt0GCFsztrPP2+pjt86A
         A/a3EbV2n/nknkgAFtaMJvxTHH75Bmars0absm9zL4ujsrswxKSJDlafAqgNxDZxpLnX
         r6WSNTvjEpEmLPX5XDem1DXgMb2ijFo11vyCUFUGsghexPs8tdBoSZVVfk6IYtcmamV3
         YjnL9ghjAZgI2MTxe1pROApEo9lJuXIxVAemwo5Xzo/a1vRnqOiWB8HPJq7sGS7nGcS0
         9b0VyN5LFqjzpWei259ytRC9ZsrhfGb9hrYuMXPdNSjzg8xfjCygLxNjkRP97rp0tqF1
         Gt2A==
X-Gm-Message-State: AOAM533nGnAwam4K11vq7+AjTIAUM41FXT3BuhRbHaO/rWZpF3N8Kq1z
        yYPfG6sluMMlZcG3ivqeT7q7au/a4Oh3gw==
X-Google-Smtp-Source: ABdhPJweAEvtRLYfdbIuyC9Fl8wmuxzY7KQoJJnEhMnojaflNteiElFnepvn26vW52n5a5LCF9VDlg==
X-Received: by 2002:a63:5562:: with SMTP id f34mr24462709pgm.391.1618182548391;
        Sun, 11 Apr 2021 16:09:08 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id a26sm8201283pff.149.2021.04.11.16.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:09:08 -0700 (PDT)
Date:   Mon, 12 Apr 2021 04:38:59 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 2/6] staging: media: intel-ipu3: preferred __aligned(size)
 over __attribute__aligned(size)
Message-ID: <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the warning identified by checkpatch.pl by replacing
__attribute__aligned(size) with __aligned(size)

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 .../staging/media/ipu3/include/intel-ipu3.h   | 74 +++++++++----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 589d5ccee3a7..d95ca9ebfafb 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -84,7 +84,7 @@ struct ipu3_uapi_grid_config {
  */
 struct ipu3_uapi_awb_raw_buffer {
 	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
-		__attribute__((aligned(32)));
+		__aligned(32);
 } __packed;
 
 /**
@@ -105,7 +105,7 @@ struct ipu3_uapi_awb_config_s {
 	__u16 rgbs_thr_gb;
 	__u16 rgbs_thr_b;
 	struct ipu3_uapi_grid_config grid;
-} __attribute__((aligned(32))) __packed;
+}	__aligned(32) __packed;
 
 /**
  * struct ipu3_uapi_awb_config - AWB config wrapper
@@ -113,7 +113,7 @@ struct ipu3_uapi_awb_config_s {
  * @config: config for auto white balance as defined by &ipu3_uapi_awb_config_s
  */
 struct ipu3_uapi_awb_config {
-	struct ipu3_uapi_awb_config_s config __attribute__((aligned(32)));
+	struct ipu3_uapi_awb_config_s config __aligned(32);
 } __packed;
 
 #define IPU3_UAPI_AE_COLORS				4	/* R, G, B, Y */
@@ -138,7 +138,7 @@ struct ipu3_uapi_ae_raw_buffer {
  * @buff: &ipu3_uapi_ae_raw_buffer to hold full frame meta data.
  */
 struct ipu3_uapi_ae_raw_buffer_aligned {
-	struct ipu3_uapi_ae_raw_buffer buff __attribute__((aligned(32)));
+	struct ipu3_uapi_ae_raw_buffer buff __aligned(32);
 } __packed;
 
 /**
@@ -244,10 +244,10 @@ struct ipu3_uapi_ae_ccm {
  * Calculate AE grid from image resolution, resample ae weights.
  */
 struct ipu3_uapi_ae_config {
-	struct ipu3_uapi_ae_grid_config grid_cfg __attribute__((aligned(32)));
+	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
 	struct ipu3_uapi_ae_weight_elem weights[
-			IPU3_UAPI_AE_WEIGHTS] __attribute__((aligned(32)));
-	struct ipu3_uapi_ae_ccm ae_ccm __attribute__((aligned(32)));
+			IPU3_UAPI_AE_WEIGHTS] __aligned(32);
+	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
 } __packed;
 
 /**
@@ -389,7 +389,7 @@ struct ipu3_uapi_af_filter_config {
  *		each cell.
  */
 struct ipu3_uapi_af_raw_buffer {
-	__u8 y_table[IPU3_UAPI_AF_Y_TABLE_MAX_SIZE] __attribute__((aligned(32)));
+	__u8 y_table[IPU3_UAPI_AF_Y_TABLE_MAX_SIZE] __aligned(32);
 } __packed;
 
 /**
@@ -402,9 +402,9 @@ struct ipu3_uapi_af_raw_buffer {
  *	      grid size for large image and vice versa.
  */
 struct ipu3_uapi_af_config_s {
-	struct ipu3_uapi_af_filter_config filter_config __attribute__((aligned(32)));
+	struct ipu3_uapi_af_filter_config filter_config __aligned(32);
 	__u8 padding[4];
-	struct ipu3_uapi_grid_config grid_cfg __attribute__((aligned(32)));
+	struct ipu3_uapi_grid_config grid_cfg __aligned(32);
 } __packed;
 
 #define IPU3_UAPI_AWB_FR_MAX_SETS			24
@@ -425,7 +425,7 @@ struct ipu3_uapi_af_config_s {
  */
 struct ipu3_uapi_awb_fr_raw_buffer {
 	__u8 meta_data[IPU3_UAPI_AWB_FR_BAYER_TABLE_MAX_SIZE]
-		__attribute__((aligned(32)));
+		__aligned(32);
 } __packed;
 
 /**
@@ -463,12 +463,12 @@ struct ipu3_uapi_awb_fr_config_s {
  * @awb_fr_config: &ipu3_uapi_awb_fr_config_s, default resolution 16x16
  */
 struct ipu3_uapi_4a_config {
-	struct ipu3_uapi_awb_config_s awb_config __attribute__((aligned(32)));
+	struct ipu3_uapi_awb_config_s awb_config __aligned(32);
 	struct ipu3_uapi_ae_grid_config ae_grd_config;
 	__u8 padding[20];
 	struct ipu3_uapi_af_config_s af_config;
 	struct ipu3_uapi_awb_fr_config_s awb_fr_config
-		__attribute__((aligned(32)));
+		__aligned(32);
 } __packed;
 
 /**
@@ -487,7 +487,7 @@ struct ipu3_uapi_4a_config {
  * @padding3: padding bytes.
  */
 struct ipu3_uapi_bubble_info {
-	__u32 num_of_stripes __attribute__((aligned(32)));
+	__u32 num_of_stripes __aligned(32);
 	__u8 padding[28];
 	__u32 num_sets;
 	__u8 padding1[28];
@@ -519,7 +519,7 @@ struct ipu3_uapi_stats_3a_bubble_info_per_stripe {
  * @padding3: padding config
  */
 struct ipu3_uapi_ff_status {
-	__u32 awb_en __attribute__((aligned(32)));
+	__u32 awb_en __aligned(32);
 	__u8 padding[28];
 	__u32 ae_en;
 	__u8 padding1[28];
@@ -992,8 +992,8 @@ struct ipu3_uapi_gamma_corr_lut {
  * @gc_lut: lookup table of gamma correction &ipu3_uapi_gamma_corr_lut
  */
 struct ipu3_uapi_gamma_config {
-	struct ipu3_uapi_gamma_corr_ctrl gc_ctrl __attribute__((aligned(32)));
-	struct ipu3_uapi_gamma_corr_lut gc_lut __attribute__((aligned(32)));
+	struct ipu3_uapi_gamma_corr_ctrl gc_ctrl __aligned(32);
+	struct ipu3_uapi_gamma_corr_lut gc_lut __aligned(32);
 } __packed;
 
 /**
@@ -1196,8 +1196,8 @@ struct ipu3_uapi_shd_lut {
  * @shd_lut:	shading lookup table &ipu3_uapi_shd_lut
  */
 struct ipu3_uapi_shd_config {
-	struct ipu3_uapi_shd_config_static shd __attribute__((aligned(32)));
-	struct ipu3_uapi_shd_lut shd_lut __attribute__((aligned(32)));
+	struct ipu3_uapi_shd_config_static shd __aligned(32);
+	struct ipu3_uapi_shd_lut shd_lut __aligned(32);
 } __packed;
 
 /* Image Enhancement Filter directed */
@@ -2421,8 +2421,8 @@ struct ipu3_uapi_anr_stitch_config {
  * @stitch: create 4x4 patch from 4 surrounding 8x8 patches.
  */
 struct ipu3_uapi_anr_config {
-	struct ipu3_uapi_anr_transform_config transform __attribute__((aligned(32)));
-	struct ipu3_uapi_anr_stitch_config stitch __attribute__((aligned(32)));
+	struct ipu3_uapi_anr_transform_config transform __aligned(32);
+	struct ipu3_uapi_anr_stitch_config stitch __aligned(32);
 } __packed;
 
 /**
@@ -2463,21 +2463,21 @@ struct ipu3_uapi_anr_config {
 struct ipu3_uapi_acc_param {
 	struct ipu3_uapi_bnr_static_config bnr;
 	struct ipu3_uapi_bnr_static_config_green_disparity
-				green_disparity __attribute__((aligned(32)));
-	struct ipu3_uapi_dm_config dm __attribute__((aligned(32)));
-	struct ipu3_uapi_ccm_mat_config ccm __attribute__((aligned(32)));
-	struct ipu3_uapi_gamma_config gamma __attribute__((aligned(32)));
-	struct ipu3_uapi_csc_mat_config csc __attribute__((aligned(32)));
-	struct ipu3_uapi_cds_params cds __attribute__((aligned(32)));
-	struct ipu3_uapi_shd_config shd __attribute__((aligned(32)));
-	struct ipu3_uapi_yuvp1_iefd_config iefd __attribute__((aligned(32)));
-	struct ipu3_uapi_yuvp1_yds_config yds_c0 __attribute__((aligned(32)));
-	struct ipu3_uapi_yuvp1_chnr_config chnr_c0 __attribute__((aligned(32)));
-	struct ipu3_uapi_yuvp1_y_ee_nr_config y_ee_nr __attribute__((aligned(32)));
-	struct ipu3_uapi_yuvp1_yds_config yds __attribute__((aligned(32)));
-	struct ipu3_uapi_yuvp1_chnr_config chnr __attribute__((aligned(32)));
-	struct ipu3_uapi_yuvp1_yds_config yds2 __attribute__((aligned(32)));
-	struct ipu3_uapi_yuvp2_tcc_static_config tcc __attribute__((aligned(32)));
+				green_disparity __aligned(32);
+	struct ipu3_uapi_dm_config dm __aligned(32);
+	struct ipu3_uapi_ccm_mat_config ccm __aligned(32);
+	struct ipu3_uapi_gamma_config gamma __aligned(32);
+	struct ipu3_uapi_csc_mat_config csc __aligned(32);
+	struct ipu3_uapi_cds_params cds __aligned(32);
+	struct ipu3_uapi_shd_config shd __aligned(32);
+	struct ipu3_uapi_yuvp1_iefd_config iefd __aligned(32);
+	struct ipu3_uapi_yuvp1_yds_config yds_c0 __aligned(32);
+	struct ipu3_uapi_yuvp1_chnr_config chnr_c0 __aligned(32);
+	struct ipu3_uapi_yuvp1_y_ee_nr_config y_ee_nr __aligned(32);
+	struct ipu3_uapi_yuvp1_yds_config yds __aligned(32);
+	struct ipu3_uapi_yuvp1_chnr_config chnr __aligned(32);
+	struct ipu3_uapi_yuvp1_yds_config yds2 __aligned(32);
+	struct ipu3_uapi_yuvp2_tcc_static_config tcc __aligned(32);
 	struct ipu3_uapi_anr_config anr;
 	struct ipu3_uapi_awb_fr_config_s awb_fr;
 	struct ipu3_uapi_ae_config ae;
@@ -2765,7 +2765,7 @@ struct ipu3_uapi_flags {
  */
 struct ipu3_uapi_params {
 	/* Flags which of the settings below are to be applied */
-	struct ipu3_uapi_flags use __attribute__((aligned(32)));
+	struct ipu3_uapi_flags use __aligned(32);
 
 	/* Accelerator cluster parameters */
 	struct ipu3_uapi_acc_param acc_param;
-- 
2.30.2

