Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E5E56F34
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 18:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfFZQ5w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 12:57:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35610 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfFZQ5v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 12:57:51 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13D06510;
        Wed, 26 Jun 2019 18:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561568269;
        bh=63c7+LPOlJkkytNbfDDJ0a0qL1CM9AXscu6S3asxsDY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kBhmH8AA+XHGC6eqiO/vHTqdkqC+k5ibmSub1smfDmavST8KXIgeTr4YpMoPVeM8O
         f427qw8YN8wmII3ogliBZS1/debWxYgrKG3o8iHvHl4aFKL6tCJrZWyzlG+9/AQnkg
         67vDjnC9x3k0/C1lqs7SyZ41JQ0Udl893Djg7rS8=
Date:   Wed, 26 Jun 2019 19:55:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 4/5] drivers/staging/media: don't set description for
 ENUM_FMT
Message-ID: <20190626165518.GF5015@pendragon.ideasonboard.com>
References: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
 <20190626112748.31730-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190626112748.31730-5-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Jun 26, 2019 at 01:27:47PM +0200, Hans Verkuil wrote:
> The V4L2 core sets the format description and flags for the driver in order
> to ensure consistent naming.
> 
> So drop the strscpy of the description in drivers. Also remove any
> description strings in driver-internal structures since those are
> no longer needed.
> 
> Note that bcm2835-camera.c: the formats array still stores the flags
> field for compressed formats since that information is used elsewhere
> in the driver. But enum_fmt doesn't use it anymore, since the core
> will set the COMPRESSED flag correctly.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Cc: Eric Anholt <eric@anholt.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/omap4iss/iss_video.c    | 40 +++++++++----------
>  drivers/staging/media/omap4iss/iss_video.h    |  2 -
>  drivers/staging/media/soc_camera/soc_camera.c |  2 -
>  .../bcm2835-camera/bcm2835-camera.c           | 29 --------------
>  .../bcm2835-camera/mmal-common.h              |  1 -
>  include/media/drv-intf/soc_mediabus.h         |  2 -
>  6 files changed, 19 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index c307707480f7..54144dc9f509 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -31,61 +31,61 @@
>  static struct iss_format_info formats[] = {
>  	{ MEDIA_BUS_FMT_Y8_1X8, MEDIA_BUS_FMT_Y8_1X8,
>  	  MEDIA_BUS_FMT_Y8_1X8, MEDIA_BUS_FMT_Y8_1X8,
> -	  V4L2_PIX_FMT_GREY, 8, "Greyscale 8 bpp", },
> +	  V4L2_PIX_FMT_GREY, 8, },
>  	{ MEDIA_BUS_FMT_Y10_1X10, MEDIA_BUS_FMT_Y10_1X10,
>  	  MEDIA_BUS_FMT_Y10_1X10, MEDIA_BUS_FMT_Y8_1X8,
> -	  V4L2_PIX_FMT_Y10, 10, "Greyscale 10 bpp", },
> +	  V4L2_PIX_FMT_Y10, 10, },
>  	{ MEDIA_BUS_FMT_Y12_1X12, MEDIA_BUS_FMT_Y10_1X10,
>  	  MEDIA_BUS_FMT_Y12_1X12, MEDIA_BUS_FMT_Y8_1X8,
> -	  V4L2_PIX_FMT_Y12, 12, "Greyscale 12 bpp", },
> +	  V4L2_PIX_FMT_Y12, 12, },
>  	{ MEDIA_BUS_FMT_SBGGR8_1X8, MEDIA_BUS_FMT_SBGGR8_1X8,
>  	  MEDIA_BUS_FMT_SBGGR8_1X8, MEDIA_BUS_FMT_SBGGR8_1X8,
> -	  V4L2_PIX_FMT_SBGGR8, 8, "BGGR Bayer 8 bpp", },
> +	  V4L2_PIX_FMT_SBGGR8, 8, },
>  	{ MEDIA_BUS_FMT_SGBRG8_1X8, MEDIA_BUS_FMT_SGBRG8_1X8,
>  	  MEDIA_BUS_FMT_SGBRG8_1X8, MEDIA_BUS_FMT_SGBRG8_1X8,
> -	  V4L2_PIX_FMT_SGBRG8, 8, "GBRG Bayer 8 bpp", },
> +	  V4L2_PIX_FMT_SGBRG8, 8, },
>  	{ MEDIA_BUS_FMT_SGRBG8_1X8, MEDIA_BUS_FMT_SGRBG8_1X8,
>  	  MEDIA_BUS_FMT_SGRBG8_1X8, MEDIA_BUS_FMT_SGRBG8_1X8,
> -	  V4L2_PIX_FMT_SGRBG8, 8, "GRBG Bayer 8 bpp", },
> +	  V4L2_PIX_FMT_SGRBG8, 8, },
>  	{ MEDIA_BUS_FMT_SRGGB8_1X8, MEDIA_BUS_FMT_SRGGB8_1X8,
>  	  MEDIA_BUS_FMT_SRGGB8_1X8, MEDIA_BUS_FMT_SRGGB8_1X8,
> -	  V4L2_PIX_FMT_SRGGB8, 8, "RGGB Bayer 8 bpp", },
> +	  V4L2_PIX_FMT_SRGGB8, 8, },
>  	{ MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
>  	  MEDIA_BUS_FMT_SGRBG10_1X10, 0,
> -	  V4L2_PIX_FMT_SGRBG10DPCM8, 8, "GRBG Bayer 10 bpp DPCM8",  },
> +	  V4L2_PIX_FMT_SGRBG10DPCM8, 8, },
>  	{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10,
>  	  MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SBGGR8_1X8,
> -	  V4L2_PIX_FMT_SBGGR10, 10, "BGGR Bayer 10 bpp", },
> +	  V4L2_PIX_FMT_SBGGR10, 10, },
>  	{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10,
>  	  MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SGBRG8_1X8,
> -	  V4L2_PIX_FMT_SGBRG10, 10, "GBRG Bayer 10 bpp", },
> +	  V4L2_PIX_FMT_SGBRG10, 10, },
>  	{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10,
>  	  MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SGRBG8_1X8,
> -	  V4L2_PIX_FMT_SGRBG10, 10, "GRBG Bayer 10 bpp", },
> +	  V4L2_PIX_FMT_SGRBG10, 10, },
>  	{ MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10,
>  	  MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SRGGB8_1X8,
> -	  V4L2_PIX_FMT_SRGGB10, 10, "RGGB Bayer 10 bpp", },
> +	  V4L2_PIX_FMT_SRGGB10, 10, },
>  	{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SBGGR10_1X10,
>  	  MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SBGGR8_1X8,
> -	  V4L2_PIX_FMT_SBGGR12, 12, "BGGR Bayer 12 bpp", },
> +	  V4L2_PIX_FMT_SBGGR12, 12, },
>  	{ MEDIA_BUS_FMT_SGBRG12_1X12, MEDIA_BUS_FMT_SGBRG10_1X10,
>  	  MEDIA_BUS_FMT_SGBRG12_1X12, MEDIA_BUS_FMT_SGBRG8_1X8,
> -	  V4L2_PIX_FMT_SGBRG12, 12, "GBRG Bayer 12 bpp", },
> +	  V4L2_PIX_FMT_SGBRG12, 12, },
>  	{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SGRBG10_1X10,
>  	  MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SGRBG8_1X8,
> -	  V4L2_PIX_FMT_SGRBG12, 12, "GRBG Bayer 12 bpp", },
> +	  V4L2_PIX_FMT_SGRBG12, 12, },
>  	{ MEDIA_BUS_FMT_SRGGB12_1X12, MEDIA_BUS_FMT_SRGGB10_1X10,
>  	  MEDIA_BUS_FMT_SRGGB12_1X12, MEDIA_BUS_FMT_SRGGB8_1X8,
> -	  V4L2_PIX_FMT_SRGGB12, 12, "RGGB Bayer 12 bpp", },
> +	  V4L2_PIX_FMT_SRGGB12, 12, },
>  	{ MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_UYVY8_1X16,
>  	  MEDIA_BUS_FMT_UYVY8_1X16, 0,
> -	  V4L2_PIX_FMT_UYVY, 16, "YUV 4:2:2 (UYVY)", },
> +	  V4L2_PIX_FMT_UYVY, 16, },
>  	{ MEDIA_BUS_FMT_YUYV8_1X16, MEDIA_BUS_FMT_YUYV8_1X16,
>  	  MEDIA_BUS_FMT_YUYV8_1X16, 0,
> -	  V4L2_PIX_FMT_YUYV, 16, "YUV 4:2:2 (YUYV)", },
> +	  V4L2_PIX_FMT_YUYV, 16, },
>  	{ MEDIA_BUS_FMT_YUYV8_1_5X8, MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	  MEDIA_BUS_FMT_YUYV8_1_5X8, 0,
> -	  V4L2_PIX_FMT_NV12, 8, "YUV 4:2:0 (NV12)", },
> +	  V4L2_PIX_FMT_NV12, 8, },
>  };
>  
>  const struct iss_format_info *
> @@ -563,8 +563,6 @@ iss_video_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>  
>  		if (index == 0) {
>  			f->pixelformat = info->pixelformat;
> -			strscpy(f->description, info->description,
> -				sizeof(f->description));
>  			return 0;
>  		}
>  
> diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
> index f22489edb562..8b3dd92021e1 100644
> --- a/drivers/staging/media/omap4iss/iss_video.h
> +++ b/drivers/staging/media/omap4iss/iss_video.h
> @@ -36,7 +36,6 @@ struct v4l2_pix_format;
>   *	shifted to be 8 bits per pixel. =0 if format is not shiftable.
>   * @pixelformat: V4L2 pixel format FCC identifier
>   * @bpp: Bits per pixel
> - * @description: Human-readable format description
>   */
>  struct iss_format_info {
>  	u32 code;
> @@ -45,7 +44,6 @@ struct iss_format_info {
>  	u32 flavor;
>  	u32 pixelformat;
>  	unsigned int bpp;
> -	const char *description;
>  };
>  
>  enum iss_pipeline_stream_state {
> diff --git a/drivers/staging/media/soc_camera/soc_camera.c b/drivers/staging/media/soc_camera/soc_camera.c
> index a6232dcd59bc..7b9448e3c9ba 100644
> --- a/drivers/staging/media/soc_camera/soc_camera.c
> +++ b/drivers/staging/media/soc_camera/soc_camera.c
> @@ -869,8 +869,6 @@ static int soc_camera_enum_fmt_vid_cap(struct file *file, void  *priv,
>  
>  	format = icd->user_formats[f->index].host_fmt;
>  
> -	if (format->name)
> -		strscpy(f->description, format->name, sizeof(f->description));
>  	f->pixelformat = format->fourcc;
>  	return 0;
>  }
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index 49d0470f9a7e..07254a843ef3 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -74,34 +74,27 @@ static const struct v4l2_fract
>  /* video formats */
>  static struct mmal_fmt formats[] = {
>  	{
> -		.name = "4:2:0, planar, YUV",
>  		.fourcc = V4L2_PIX_FMT_YUV420,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_I420,
>  		.depth = 12,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 1,
>  		.remove_padding = 1,
>  	}, {
> -		.name = "4:2:2, packed, YUYV",
>  		.fourcc = V4L2_PIX_FMT_YUYV,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_YUYV,
>  		.depth = 16,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 2,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "RGB24 (LE)",
>  		.fourcc = V4L2_PIX_FMT_RGB24,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_RGB24,
>  		.depth = 24,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 3,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "JPEG",
>  		.fourcc = V4L2_PIX_FMT_JPEG,
>  		.flags = V4L2_FMT_FLAG_COMPRESSED,
>  		.mmal = MMAL_ENCODING_JPEG,
> @@ -110,7 +103,6 @@ static struct mmal_fmt formats[] = {
>  		.ybbp = 0,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "H264",
>  		.fourcc = V4L2_PIX_FMT_H264,
>  		.flags = V4L2_FMT_FLAG_COMPRESSED,
>  		.mmal = MMAL_ENCODING_H264,
> @@ -119,7 +111,6 @@ static struct mmal_fmt formats[] = {
>  		.ybbp = 0,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "MJPEG",
>  		.fourcc = V4L2_PIX_FMT_MJPEG,
>  		.flags = V4L2_FMT_FLAG_COMPRESSED,
>  		.mmal = MMAL_ENCODING_MJPEG,
> @@ -128,72 +119,56 @@ static struct mmal_fmt formats[] = {
>  		.ybbp = 0,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "4:2:2, packed, YVYU",
>  		.fourcc = V4L2_PIX_FMT_YVYU,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_YVYU,
>  		.depth = 16,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 2,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "4:2:2, packed, VYUY",
>  		.fourcc = V4L2_PIX_FMT_VYUY,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_VYUY,
>  		.depth = 16,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 2,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "4:2:2, packed, UYVY",
>  		.fourcc = V4L2_PIX_FMT_UYVY,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_UYVY,
>  		.depth = 16,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 2,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "4:2:0, planar, NV12",
>  		.fourcc = V4L2_PIX_FMT_NV12,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_NV12,
>  		.depth = 12,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 1,
>  		.remove_padding = 1,
>  	}, {
> -		.name = "RGB24 (BE)",
>  		.fourcc = V4L2_PIX_FMT_BGR24,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_BGR24,
>  		.depth = 24,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 3,
>  		.remove_padding = 0,
>  	}, {
> -		.name = "4:2:0, planar, YVU",
>  		.fourcc = V4L2_PIX_FMT_YVU420,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_YV12,
>  		.depth = 12,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 1,
>  		.remove_padding = 1,
>  	}, {
> -		.name = "4:2:0, planar, NV21",
>  		.fourcc = V4L2_PIX_FMT_NV21,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_NV21,
>  		.depth = 12,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
>  		.ybbp = 1,
>  		.remove_padding = 1,
>  	}, {
> -		.name = "RGB32 (BE)",
>  		.fourcc = V4L2_PIX_FMT_BGR32,
> -		.flags = 0,
>  		.mmal = MMAL_ENCODING_BGRA,
>  		.depth = 32,
>  		.mmal_component = MMAL_COMPONENT_CAMERA,
> @@ -674,9 +649,7 @@ static int vidioc_enum_fmt_vid_overlay(struct file *file, void *priv,
>  
>  	fmt = &formats[f->index];
>  
> -	strlcpy((char *)f->description, fmt->name, sizeof(f->description));
>  	f->pixelformat = fmt->fourcc;
> -	f->flags = fmt->flags;
>  
>  	return 0;
>  }
> @@ -877,9 +850,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
>  
>  	fmt = &formats[f->index];
>  
> -	strlcpy((char *)f->description, fmt->name, sizeof(f->description));
>  	f->pixelformat = fmt->fourcc;
> -	f->flags = fmt->flags;
>  
>  	return 0;
>  }
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h b/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
> index a20bf274a4fd..df4ecbfdbe4a 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
> +++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
> @@ -23,7 +23,6 @@ struct mmal_msg_context;
>  
>  /* mapping between v4l and mmal video modes */
>  struct mmal_fmt {
> -	char  *name;
>  	u32   fourcc;          /* v4l2 format id */
>  	int   flags;           /* v4l2 flags field */
>  	u32   mmal;
> diff --git a/include/media/drv-intf/soc_mediabus.h b/include/media/drv-intf/soc_mediabus.h
> index 2ff773785fb6..28517ff9b4de 100644
> --- a/include/media/drv-intf/soc_mediabus.h
> +++ b/include/media/drv-intf/soc_mediabus.h
> @@ -69,7 +69,6 @@ enum soc_mbus_layout {
>  
>  /**
>   * struct soc_mbus_pixelfmt - Data format on the media bus
> - * @name:		Name of the format
>   * @fourcc:		Fourcc code, that will be obtained if the data is
>   *			stored in memory in the following way:
>   * @packing:		Type of sample-packing, that has to be used
> @@ -77,7 +76,6 @@ enum soc_mbus_layout {
>   * @bits_per_sample:	How many bits the bridge has to sample
>   */
>  struct soc_mbus_pixelfmt {
> -	const char		*name;
>  	u32			fourcc;
>  	enum soc_mbus_packing	packing;
>  	enum soc_mbus_order	order;

-- 
Regards,

Laurent Pinchart
