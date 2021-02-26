Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7963263FB
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 15:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhBZOXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 09:23:07 -0500
Received: from mga04.intel.com ([192.55.52.120]:42373 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229885AbhBZOWy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 09:22:54 -0500
IronPort-SDR: G5a05YV03/Msv5u25Ofsbiu6DodpMsutwQ1p75+4ItWkM0NbwvtctwqfPPIOe+lyAqqYlJSuPP
 xRXWgPcwMslw==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="183427036"
X-IronPort-AV: E=Sophos;i="5.81,208,1610438400"; 
   d="scan'208";a="183427036"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 06:21:07 -0800
IronPort-SDR: a7yeAJxE6jn+nH1GQVkOTh+IX5eRenYTZXCHrk7DmZLogXoxOlgla6rUwGYiE2W9jsm3Gp94A0
 rNQ+Pa9mBFGQ==
X-IronPort-AV: E=Sophos;i="5.81,208,1610438400"; 
   d="scan'208";a="434382447"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 06:20:21 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lFdyX-008MH9-S8; Fri, 26 Feb 2021 16:20:13 +0200
Date:   Fri, 26 Feb 2021 16:20:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rahul Gottipati <rahul.blr97@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: reduce kernel stack usage
Message-ID: <YDkDnaMTjapU+woh@smile.fi.intel.com>
References: <20210226140524.3478346-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226140524.3478346-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 26, 2021 at 03:05:02PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The atomisp_set_fmt() function has multiple copies of the large
> v4l2_format structure on its stack, resulting in a warning about
> excessive stack usage in some rare randconfig builds.
> 
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:5600:5: error: stack frame size of 1084 bytes in function 'atomisp_set_fmt' [-Werror,-Wframe-larger-than=]
> 
> Of this structure, only three members in the 'fmt.pix' member are
> used, so simplify it by using the smaller v4l2_pix_format structure
> directly. This reduces the stack usage to 612 bytes, and it could
> be reduced further by only storing the three members that are used.

Good to me!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 65 +++++++++----------
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  2 +-
>  3 files changed, 33 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 592ea990d4ca..3192c0716eb9 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -4837,7 +4837,7 @@ static void __atomisp_init_stream_info(u16 stream_index,
>  }
>  
>  /* This function looks up the closest available resolution. */
> -int atomisp_try_fmt(struct video_device *vdev, struct v4l2_format *f,
> +int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
>  		    bool *res_overflow)
>  {
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
> @@ -4859,18 +4859,18 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_format *f,
>  		return -EINVAL;
>  
>  	stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
> -	fmt = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
> +	fmt = atomisp_get_format_bridge(f->pixelformat);
>  	if (!fmt) {
>  		dev_err(isp->dev, "unsupported pixelformat!\n");
>  		fmt = atomisp_output_fmts;
>  	}
>  
> -	if (f->fmt.pix.width <= 0 || f->fmt.pix.height <= 0)
> +	if (f->width <= 0 || f->height <= 0)
>  		return -EINVAL;
>  
>  	snr_mbus_fmt->code = fmt->mbus_code;
> -	snr_mbus_fmt->width = f->fmt.pix.width;
> -	snr_mbus_fmt->height = f->fmt.pix.height;
> +	snr_mbus_fmt->width = f->width;
> +	snr_mbus_fmt->height = f->height;
>  
>  	__atomisp_init_stream_info(stream_index, stream_info);
>  
> @@ -4892,7 +4892,7 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_format *f,
>  		return -EINVAL;
>  	}
>  
> -	f->fmt.pix.pixelformat = fmt->pixelformat;
> +	f->pixelformat = fmt->pixelformat;
>  
>  	/*
>  	 * If the format is jpeg or custom RAW, then the width and height will
> @@ -4900,17 +4900,17 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_format *f,
>  	 * the below conditions. So just assign to what is being returned from
>  	 * the sensor driver.
>  	 */
> -	if (f->fmt.pix.pixelformat == V4L2_PIX_FMT_JPEG ||
> -	    f->fmt.pix.pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW) {
> -		f->fmt.pix.width = snr_mbus_fmt->width;
> -		f->fmt.pix.height = snr_mbus_fmt->height;
> +	if (f->pixelformat == V4L2_PIX_FMT_JPEG ||
> +	    f->pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW) {
> +		f->width = snr_mbus_fmt->width;
> +		f->height = snr_mbus_fmt->height;
>  		return 0;
>  	}
>  
> -	if (snr_mbus_fmt->width < f->fmt.pix.width
> -	    && snr_mbus_fmt->height < f->fmt.pix.height) {
> -		f->fmt.pix.width = snr_mbus_fmt->width;
> -		f->fmt.pix.height = snr_mbus_fmt->height;
> +	if (snr_mbus_fmt->width < f->width
> +	    && snr_mbus_fmt->height < f->height) {
> +		f->width = snr_mbus_fmt->width;
> +		f->height = snr_mbus_fmt->height;
>  		/* Set the flag when resolution requested is
>  		 * beyond the max value supported by sensor
>  		 */
> @@ -4919,12 +4919,10 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_format *f,
>  	}
>  
>  	/* app vs isp */
> -	f->fmt.pix.width = rounddown(
> -			       clamp_t(u32, f->fmt.pix.width, ATOM_ISP_MIN_WIDTH,
> -				       ATOM_ISP_MAX_WIDTH), ATOM_ISP_STEP_WIDTH);
> -	f->fmt.pix.height = rounddown(
> -				clamp_t(u32, f->fmt.pix.height, ATOM_ISP_MIN_HEIGHT,
> -					ATOM_ISP_MAX_HEIGHT), ATOM_ISP_STEP_HEIGHT);
> +	f->width = rounddown(clamp_t(u32, f->width, ATOM_ISP_MIN_WIDTH,
> +				     ATOM_ISP_MAX_WIDTH), ATOM_ISP_STEP_WIDTH);
> +	f->height = rounddown(clamp_t(u32, f->height, ATOM_ISP_MIN_HEIGHT,
> +				      ATOM_ISP_MAX_HEIGHT), ATOM_ISP_STEP_HEIGHT);
>  
>  	return 0;
>  }
> @@ -5481,7 +5479,7 @@ static void atomisp_get_dis_envelop(struct atomisp_sub_device *asd,
>  }
>  
>  static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
> -				    int source_pad, struct v4l2_format *f)
> +				    int source_pad, struct v4l2_pix_format *f)
>  {
>  #if defined(ISP2401_NEW_INPUT_SYSTEM)
>  	struct v4l2_mbus_framefmt *sink, *src;
> @@ -5492,8 +5490,8 @@ static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
>  				      V4L2_SUBDEV_FORMAT_ACTIVE, source_pad);
>  
>  	if ((sink->code == src->code &&
> -	     sink->width == f->fmt.pix.width &&
> -	     sink->height == f->fmt.pix.height) ||
> +	     sink->width == f->width &&
> +	     sink->height == f->height) ||
>  	    ((asd->isp->inputs[asd->input_curr].type == SOC_CAMERA) &&
>  	     (asd->isp->inputs[asd->input_curr].camera_caps->
>  	      sensor[asd->sensor_curr].stream_num > 1)))
> @@ -5507,7 +5505,7 @@ static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
>  }
>  
>  static int atomisp_set_fmt_to_snr(struct video_device *vdev,
> -				  struct v4l2_format *f, unsigned int pixelformat,
> +				  struct v4l2_pix_format *f, unsigned int pixelformat,
>  				  unsigned int padding_w, unsigned int padding_h,
>  				  unsigned int dvs_env_w, unsigned int dvs_env_h)
>  {
> @@ -5535,7 +5533,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
>  	if (!format)
>  		return -EINVAL;
>  
> -	v4l2_fill_mbus_format(ffmt, &f->fmt.pix, format->mbus_code);
> +	v4l2_fill_mbus_format(ffmt, f, format->mbus_code);
>  	ffmt->height += padding_h + dvs_env_h;
>  	ffmt->width += padding_w + dvs_env_w;
>  
> @@ -5605,8 +5603,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  	const struct atomisp_format_bridge *format_bridge;
>  	const struct atomisp_format_bridge *snr_format_bridge;
>  	struct ia_css_frame_info output_info, raw_output_info;
> -	struct v4l2_format snr_fmt = *f;
> -	struct v4l2_format backup_fmt = *f, s_fmt = *f;
> +	struct v4l2_pix_format snr_fmt = f->fmt.pix;
> +	struct v4l2_pix_format backup_fmt = snr_fmt, s_fmt;
>  	unsigned int dvs_env_w = 0, dvs_env_h = 0;
>  	unsigned int padding_w = pad_w, padding_h = pad_h;
>  	bool res_overflow = false, crop_needs_override = false;
> @@ -5780,11 +5778,10 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  		dev_warn(isp->dev, "Try format failed with error %d\n", ret);
>  		return ret;
>  	}
> -	f->fmt.pix.width = snr_fmt.fmt.pix.width;
> -	f->fmt.pix.height = snr_fmt.fmt.pix.height;
> +	f->fmt.pix.width = snr_fmt.width;
> +	f->fmt.pix.height = snr_fmt.height;
>  
> -	snr_format_bridge =
> -	    atomisp_get_format_bridge(snr_fmt.fmt.pix.pixelformat);
> +	snr_format_bridge = atomisp_get_format_bridge(snr_fmt.pixelformat);
>  	if (!snr_format_bridge) {
>  		dev_warn(isp->dev, "Can't find bridge format\n");
>  		return -EINVAL;
> @@ -5865,11 +5862,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  		 * and height while set_mbus_fmt() so actual resolutions are
>  		 * being used in while set media bus format.
>  		 */
> -		s_fmt = *f;
> +		s_fmt = f->fmt.pix;
>  		if (f->fmt.pix.pixelformat == V4L2_PIX_FMT_JPEG ||
>  		    f->fmt.pix.pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW) {
> -			s_fmt.fmt.pix.width = backup_fmt.fmt.pix.width;
> -			s_fmt.fmt.pix.height = backup_fmt.fmt.pix.height;
> +			s_fmt.width = backup_fmt.width;
> +			s_fmt.height = backup_fmt.height;
>  		}
>  		ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
>  					     f->fmt.pix.pixelformat, padding_w,
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> index 1c0d464c2ac1..412baeb91944 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> @@ -333,7 +333,7 @@ int atomisp_get_sensor_mode_data(struct atomisp_sub_device *asd,
>  int atomisp_get_fmt(struct video_device *vdev, struct v4l2_format *f);
>  
>  /* This function looks up the closest available resolution. */
> -int atomisp_try_fmt(struct video_device *vdev, struct v4l2_format *f,
> +int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
>  		    bool *res_overflow);
>  
>  int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f);
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index 2ae50decfc8b..c6adffebe24a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -843,7 +843,7 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
>  	int ret;
>  
>  	rt_mutex_lock(&isp->mutex);
> -	ret = atomisp_try_fmt(vdev, f, NULL);
> +	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
>  	rt_mutex_unlock(&isp->mutex);
>  	return ret;
>  }
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


