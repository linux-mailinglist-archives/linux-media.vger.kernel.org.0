Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C798636F770
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 10:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhD3I5p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 04:57:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:65421 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhD3I5p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 04:57:45 -0400
IronPort-SDR: +tUIGGVWtRzO5nHDha9NRqiqVKUEi/wpiCLJxMPfWHBo+yWBokVpGdhVrL1aJDrskR/n2pbPfJ
 fdLN05EkS1rA==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="258514644"
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; 
   d="scan'208";a="258514644"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 01:56:56 -0700
IronPort-SDR: +qrE+NYRkvrmpXgaDiG+DWg6+JFoSO2G3fTS/0CL9FMjGI8mwVlIHWBavwTvdWD3kmRNsy/Nkj
 5x/Jd4Vhds9Q==
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; 
   d="scan'208";a="404524576"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 01:56:54 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6BEAF201A6;
        Fri, 30 Apr 2021 11:56:52 +0300 (EEST)
Date:   Fri, 30 Apr 2021 11:56:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com, jim.lai@intel.com,
        ping-chung.chen@intel.com, tfiga@chromium.org,
        grundler@chromium.org, Yeh@linux.intel.com
Subject: Re: [PATCH v7] media: imx208: Add imx208 camera sensor driver
Message-ID: <20210430085652.GE3@paasikivi.fi.intel.com>
References: <20210430140549.15579-1-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430140549.15579-1-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Fri, Apr 30, 2021 at 10:05:49PM +0800, Shawnx Tu wrote:
> From: Shawn Tu <shawnx.tu@intel.com>
> 
> Add a V4L2 sub-device driver for the Sony IMX208 image sensor.
> This is a camera sensor using the I2C bus for control and the
> CSI-2 bus for data.
> 
> since v1:
> -- Update the function media_entity_pads_init for upstreaming.
> -- Change the structure name mutex as imx208_mx.
> -- Refine the control flow of test pattern function.
> -- vflip/hflip control support (will impact the output bayer order)
> -- support 4 bayer orders output (via change v/hflip)
>     - SRGGB10(default), SGRBG10, SGBRG10, SBGGR10
> -- Simplify error handling in the set_stream function.
> since v2:
> -- Refine coding style.
> -- Fix the if statement to use pm_runtime_get_if_in_use().
> -- Print more error log during error handling.
> -- Remove mutex_destroy() from imx208_free_controls().
> -- Add more comments.
> since v3:
> -- Set explicit indices to link frequencies.
> since v4:
> -- Fix the wrong index in link_freq_menu_items.
> since v5:
> -- Expose OTP data through a sysfs attribute
> -- Enable the DG v4l2 control with integer menu type
> since v6:
> -- Fix the checkpatch.pl warnings
> 
> Signed-off-by: Ping-Chung Chen <ping-chung.chen@intel.com>
> Signed-off-by: Yeh, Andy <andy.yeh@intel.com>
> Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

I've applied the patch to my tree, with this diff, and removed the
changelog from the commit message:

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 74383aeb1460..9ed261ea7255 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -603,8 +603,8 @@ static int imx208_set_pad_format(struct v4l2_subdev *sd,
 		vblank_min = imx208->cur_mode->vts_min -
 			     imx208->cur_mode->height;
 		__v4l2_ctrl_modify_range(imx208->vblank, vblank_min,
-					 IMX208_VTS_MAX - imx208->cur_mode->height, 1,
-					 vblank_def);
+					 IMX208_VTS_MAX - imx208->cur_mode->height,
+					 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx208->vblank, vblank_def);
 		h_blank =
 			link_freq_configs[mode->link_freq_index].pixels_per_line
@@ -875,18 +875,19 @@ static int imx208_init_controls(struct imx208 *imx208)
 
 	mutex_init(&imx208->imx208_mx);
 	ctrl_hdlr->lock = &imx208->imx208_mx;
-	imx208->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
-						   &imx208_ctrl_ops,
-						   V4L2_CID_LINK_FREQ,
-						   ARRAY_SIZE(link_freq_menu_items) - 1,
-						   0, link_freq_menu_items);
+	imx208->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr,
+				       &imx208_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(link_freq_menu_items) - 1,
+				       0, link_freq_menu_items);
 
 	if (imx208->link_freq)
 		imx208->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
-	pixel_rate_min = link_freq_to_pixel_rate(link_freq_menu_items[ARRAY_SIZE
-						 (link_freq_menu_items) - 1]);
+	pixel_rate_min =
+		link_freq_to_pixel_rate(link_freq_menu_items[ARRAY_SIZE(link_freq_menu_items) - 1]);
 	/* By default, PIXEL_RATE is read only */
 	imx208->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE,
@@ -895,24 +896,25 @@ static int imx208_init_controls(struct imx208 *imx208)
 
 	vblank_def = imx208->cur_mode->vts_def - imx208->cur_mode->height;
 	vblank_min = imx208->cur_mode->vts_min - imx208->cur_mode->height;
-	imx208->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops, V4L2_CID_VBLANK,
-					   vblank_min,
-					   IMX208_VTS_MAX - imx208->cur_mode->height, 1,
-					   vblank_def);
-
-	imx208->hblank = v4l2_ctrl_new_std(ctrl_hdlr,
-					   &imx208_ctrl_ops, V4L2_CID_HBLANK,
-					   IMX208_PPL_384MHZ - imx208->cur_mode->width,
-					   IMX208_PPL_384MHZ - imx208->cur_mode->width,
-					   1,
-					   IMX208_PPL_384MHZ - imx208->cur_mode->width);
+	imx208->vblank =
+		v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops, V4L2_CID_VBLANK,
+				  vblank_min,
+				  IMX208_VTS_MAX - imx208->cur_mode->height, 1,
+				  vblank_def);
+
+	imx208->hblank =
+		v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops, V4L2_CID_HBLANK,
+				  IMX208_PPL_384MHZ - imx208->cur_mode->width,
+				  IMX208_PPL_384MHZ - imx208->cur_mode->width,
+				  1,
+				  IMX208_PPL_384MHZ - imx208->cur_mode->width);
 
 	if (imx208->hblank)
 		imx208->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	exposure_max = imx208->cur_mode->vts_def - 8;
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops, V4L2_CID_EXPOSURE,
-			  IMX208_EXPOSURE_MIN, IMX208_EXPOSURE_MAX,
+			  IMX208_EXPOSURE_MIN, exposure_max,
 			  IMX208_EXPOSURE_STEP, IMX208_EXPOSURE_DEFAULT);
 
 	imx208->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops,

-- 
Kind regards,

Sakari Ailus
